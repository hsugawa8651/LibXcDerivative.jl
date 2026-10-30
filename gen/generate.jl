#!/usr/bin/env julia
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
#
# Maintainer-only tool. Reads Libxc's python/<family>/<name>.py sources
# (gen/libxc-upstream, a pinned checkout of Libxc) via PyCall, resolves each
# functional's SymPy expression, prints it as Julia source (see
# gen/julia_printer.py), and writes a static .jl file into
# src/generated/<family>/. Not run at package install/load time; see
# gen/README.md for the workflow.
#
# Status: generalized to any (family, name, argnames) triple via
# `generate_functional`; validated so far on lda_x and lda_c_pw (both
# lda_exc). Does not yet handle the rs/z <- rho/sigma variable-preparation
# layer that Libxc's own work_lda.c/work_gga.c drivers perform, batch
# iteration over all 287 files, or Libxc's fuller compile_module pipeline
# (dimensional globals, spin_density handling); see gen/README.md.

using PyCall
using TOML
using Dates
using ForwardDiff

const HERE = @__DIR__
const LIBXC_PYTHON_DIR = joinpath(HERE, "libxc-upstream", "python")
const GENERATED_DIR = joinpath(HERE, "..", "src", "generated")

# Numeric constants Libxc's C printer substitutes from
# libxc-upstream/src/util.h (#define). Precomputed there for performance;
# substituted numerically here for the same reason. Transcribed verbatim from
# libxc-upstream/src/util.h; grow this table (grep '^#define M_' there) as new
# functionals hit constants not yet listed: a missing entry surfaces as a
# leftover free symbol in the generated Julia (function-argument list grows to
# include e.g. `M_CBRT11`) rather than a silent wrong value.
const LIBXC_NUMERIC_CONSTANTS = Dict(
    "M_SQRTPI" => 1.772453850905516027298167483341145182798,  # sqrt(pi)
    "M_CBRTPI" => 1.464591887561523263020142527263790391739,  # pi^(1/3)
    "M_SQRT3"  => 1.732050807568877293527446341505872366943,  # sqrt(3)
    "M_CBRT2"  => 1.259921049894873164767210607278228350570,  # 2^(1/3)
    "M_CBRT3"  => 1.442249570307408382321638310780109588392,  # 3^(1/3)
    "M_CBRT4"  => 1.587401051968199474751705639272308260391,  # 4^(1/3)
    "M_CBRT5"  => 1.709975946676696989353108872543860109868,  # 5^(1/3)
    "M_CBRT6"  => 1.817120592832139658891211756327260502428,  # 6^(1/3)
    "M_CBRT7"  => 1.912931182772389101199116839548760282862,  # 7^(1/3)
    "M_CBRT9"  => 2.080083823051904114530056824357885386338,  # 9^(1/3)
    "M_C"      => 137.0359996287515,                           # speed of light (a.u.)
)

"""
    natural_lt(a, b) -> Bool

Sort key for parameter names so digit runs compare numerically
(`params_a_beta1_2 < params_a_beta1_10`), not lexicographically
(`"_10" < "_2"` under plain `sort`, an audit hazard
for the flattened array parameters `sanitize_indexed_params` produces:
low severity since no functional here has a
double-digit index, but the ordering silently stops matching intuition
exactly where it would matter most).
"""
function natural_lt(a::AbstractString, b::AbstractString)
    are = eachmatch(r"\d+|\D+", a)
    bre = eachmatch(r"\d+|\D+", b)
    for (at, bt) in zip(are, bre)
        at.match == bt.match && continue
        both_digits = all(isdigit, at.match) && all(isdigit, bt.match)
        return both_digits ? parse(Int, at.match) < parse(Int, bt.match) : at.match < bt.match
    end
    return length(a) < length(b)
end

"""
    patch_libxc_codegen!()

Make the helper derivative table lazy, and inline helpers in one pass.

Two overrides of `libxc_codegen` internals, both because this package uses the
upstream pipeline in the opposite direction from the one it was built for.

**The derivative table.** `Helper.__init__` differentiates a helper's body
eagerly up to `_GEN_MAX_ORDER`, which the module defaults to 4. Libxc needs
that: it keeps a helper *opaque* inside the larger expression: its `fdiff`
returns the next multi-index's helper call rather than differentiating the body,
and it emits a C function per index, so the table is the shipped artifact
and what makes fourth-order codegen tractable. Here `_deep_inline` expands
every helper into one expression and ForwardDiff differentiates that in Julia,
so the table is built and then thrown away. `_GEN_MAX_ORDER = 0` stops that,
and the three functionals that do take one derivative of a helper
(`gga_x_hcth_a`, `mgga_c_r2scan`, `mgga_c_r2scanl`) grow it on demand instead:
`ensure_order` is incremental by construction. Declining it outright, without
the growth, failed those three with `KeyError((1, 0))`.

**The inliner.** The upstream loop substitutes one helper application at a
time, so each walks the whole expression and the outer loop re-walks a growing
tree once per level of nesting. One simultaneous `xreplace` per pass does the
same job in one walk. `xreplace` is structural where `subs` also simplifies, so
six kernels of the VWN family come out in a different form: with fewer CSE
temporaries, and agree with the shipped ones to 2.1e-16 over eighteen points.
Every other kernel is byte identical.

What this is worth, as the manifest records it. Per kernel: `gga_c_gapc`
1411.3 s to 1.8 s, `gga_c_gaploc` 837.0 s to 1.1 s, `mgga_c_r2scanl` 298.6 s
to 22.5 s, each byte identical afterwards. Over the corpus, one sequential run
through `main`: 287 entries in 40 minutes of wall clock, 39.7 minutes of that
inside the generator, median 4.0 s a kernel against 7.2 s before. Leaving
`gga_x_wpbeh` out of both sides, because its old entry is a killed budget
rather than a measurement, 149.5 minutes becomes 25.6. A light kernel is
startup bound at about 4 s whatever the symbolic work costs, since `main`
starts a child `julia` per functional, so that is the floor the corpus run is
now near.

What it does not buy: `gga_x_wpbeh` still does not generate. It reaches the
printer in 846.5 s instead of exhausting a four-hour budget, and fails there
for an unrelated reason the manifest records.

Called by `setup_python_path!`, so anything that generates gets it.
"""
function patch_libxc_codegen!()
    lc = pyimport("libxc_codegen")
    lc._GEN_MAX_ORDER = 0
    py"""
    import sympy as _lxs_sp
    import libxc_codegen as _lxs_lc

    def _lxs_deep_inline(expr):
        while True:
            applied = [a for a in expr.atoms(_lxs_sp.Function)
                       if hasattr(type(a), "helper")]
            if not applied:
                return expr
            reps = {}
            for app in applied:
                cls = type(app)
                mi = cls.multiindex
                try:
                    body = cls.helper._derivs[mi]
                except KeyError:
                    cls.helper.ensure_order(sum(mi))
                    body = cls.helper._derivs[mi]
                reps[app] = body.xreplace(dict(zip(cls.helper.args, app.args)))
            expr = expr.xreplace(reps)

    # Marked so the test suite can tell this inliner from the one the pinned
    # tree ships: moving the pin to a commit that moves or renames
    # _deep_inline should fail loudly rather than quietly restore the slow
    # path.
    _lxs_deep_inline.lxs_lazy_inline = True
    _lxs_lc._deep_inline = _lxs_deep_inline

    # e1_scaled_G as a node rather than as its body.
    #
    # Upstream defines it as a plain Python function, so every call is already
    # inlined by the time an expression reaches the printer: on the tail that
    # leaves a sixteen-term series written as factorial(k)/y^k. Upstream can
    # afford that spelling because it differentiates the series symbolically
    # and emits the result; this package emits the energy and differentiates it
    # at run time, where the quotient rule squares the denominator. gga_c_ft97
    # reaches y = 1.7e17, and the square of y^9 overflows a Float64, which is
    # how every third- and fourth-order slot of that functional became NaN.
    # Keeping the call means src/libxc_names.jl chooses the grouping.
    #
    # fdiff is in terms of the function itself: with G = 1 - y*E1_scaled(y) and
    # E1_scaled' = E1_scaled - 1/y, G' = 1 - (1+y)*E1_scaled(y) = G - (1-G)/y,
    # so the derivative inherits whatever accuracy G has and the tail form is
    # not re-derived here. Nothing in this package differentiates symbolically,
    # so this exists to keep a symbolic consumer honest rather than for the
    # generated kernels.
    class e1_scaled_G(_lxs_sp.Function):
        nargs = 1

        def fdiff(self, argindex=1):
            (y,) = self.args
            g = e1_scaled_G(y)
            return g - (1 - g) / y

    _lxs_lc.e1_scaled_G = e1_scaled_G
    """
    return nothing
end

function setup_python_path!()
    sys = pyimport("sys")
    path = PyVector(sys."path")
    # Mirror compile.py: the top-level python/ dir plus every family
    # subdirectory, so `from libxc_codegen import *` and sibling-family
    # `$include`s resolve.
    pushfirst!(path, LIBXC_PYTHON_DIR)
    for entry in readdir(LIBXC_PYTHON_DIR)
        sub = joinpath(LIBXC_PYTHON_DIR, entry)
        isdir(sub) && pushfirst!(path, sub)
    end
    # gen/ itself, for julia_printer.py.
    pushfirst!(path, HERE)
    patch_libxc_codegen!()
    return nothing
end

"""
    print_julia(expr_py) -> String

One SymPy expression as Julia source, via `gen/julia_printer.py`.

This is where the generated kernels get their text. The printer is the
reason `sqrt`/`log` and non-integer powers come out as their `NaNMath`
equivalents (the domain-safety contract `test/runtests.jl` pins), the
reason Libxc's own function names survive, and the reason a rational too
wide for an `Int64` needs no handling of its own. A function name the
printer has no Julia spelling for raises here rather than reaching a
kernel that would fail with `UndefVarError` at its first call.
"""
function print_julia(expr_py)
    return String(pyimport("julia_printer").print_julia(expr_py))
end

# Sign/positivity assumptions per Libxc internal variable name. Declaring an
# argument `positive=true` when it can genuinely be negative (spin
# polarization `z`, in [-1,1]) lets SymPy simplify sign-dependent branches
# (e.g. `m_abs(z)`, `Ge(z, 0)`) incorrectly *before* Julia code is even
# generated. The numeric checks do not catch it, since `lda_x`'s own branches
# only ever guard on `(1±z)` combinations rather than the sign of `z` itself.
# Default is `real=true` (the weakest true assumption Libxc's own helper
# formals use, see python/libxc_codegen.py:helper); only variables Libxc's own
# convention treats as strictly positive (e.g. `rs`, the Wigner-Seitz radius)
# opt into `positive=true` here.
const POSITIVE_ARGNAMES = Set(["rs"])

"""
    ARG_PREFIX

Prefix the argument symbols are built with, and stripped of again once the
helpers are inlined.

`_deep_inline` substitutes a helper's formal parameters **by name**, and the
formals are named after the natural variables: `rs`, `z`, `xt` and so on,
which are exactly the names a caller would reach for. Passing a bare symbol
with one of those names lets a substitution reach into an argument it was
never meant to touch.

`lda_c_pk09` is where that showed. `alpha_z` computes

    2 / (opz_pow_n(z, ss(rs, z)) + opz_pow_n(-z, ss(rs, z)))

and inlining the second call substituted the helper's formal `z` with `-z`
throughout, including inside `ss(rs, z)`, which contains a symbol of that
same name. The exponent silently became `ss(rs, -z)`. The result was exact
at z = 0, wrong by 2.6e-5 at z = 0.2 and by 3.4e-2 at z = 0.98: wrong in
a way no unpolarized check could see.

Libxc's own codegen never meets this because it substitutes densities
first: `f(RS_FACTOR/(na+nb)^(1/3), (na-nb)/(na+nb))` has no symbol named
`z` anywhere in it. A prefix no formals use buys the same immunity
without giving up `(rs, z)` as the kernel's arguments.
"""
const ARG_PREFIX = "lxs_arg_"

"""
    with_dimension(f, mod)

Run `f()` with `libxc_codegen`'s dimension set to the one `mod` declares, and
put back what was there afterwards, whatever `f` does.

A functional announces one or two dimensions with `define('xc_dimensions_2d')`
at the top of its Python file, and then calls the shared helpers
(`gga_exchange`, `lda_x_spin`, `r_ws`, ...). Those helpers read `DIMENSIONS`,
`RS_FACTOR` and `LDA_X_FACTOR` from `libxc_codegen`'s globals rather than
taking a dimension as an argument, so the declaration only reaches them
through those globals. Libxc's own driver does this around every functional
it compiles (`compile_module`, `libxc_codegen.py:4519`); doing it here is what
lets `resolve_functional` be called directly, as the generator calls it.

The module's own copies of the three names move too: a functional's Python
starts with `from libxc_codegen import *`, which took the three-dimensional
values at import time, and its own body reads those copies.

Getting this wrong is silent. A two-dimensional functional generated with
three-dimensional constants still evaluates: `gga_x_2d_b86` came out at
0.7633 times the value the pinned library gives, at every density.
"""
function with_dimension(f, mod)
    lc = pyimport("libxc_codegen")
    names = ("DIMENSIONS", "RS_FACTOR", "LDA_X_FACTOR")
    saved_globals = lc._set_dimension(lc._detect_dimension(mod))
    saved_module = [(n, hasproperty(mod, Symbol(n)) ? getproperty(mod, Symbol(n)) : nothing)
                    for n in names]
    for n in names
        hasproperty(mod, Symbol(n)) &&
            setproperty!(mod, Symbol(n), getproperty(lc, Symbol(n)))
    end
    try
        return f()
    finally
        for (n, v) in saved_module
            v === nothing || setproperty!(mod, Symbol(n), v)
        end
        lc._restore_dimension(saved_globals)
    end
end

"""
    resolve_functional(family, name, argnames) -> PyObject

Runs inside the dimension the module declares; see `with_dimension`.

Import python/<family>/<name>.py, call its top-level `f(...)` with fresh
SymPy symbols named `argnames`, and deep-inline every `@helper` proxy call
in the result via `libxc_codegen._deep_inline`: the same flattening
`maple_eval`/`maple_taylor` rely on internally (see investigation notes:
`@helper` is a *lazy* differentiable-Function proxy, not eager arithmetic;
calling `f(...)` alone leaves it as an opaque `f_lda_x(rs, z)`-style call).

The symbols are built under `ARG_PREFIX` and renamed back afterwards, which
is what keeps that inlining from substituting through them; see there for
what goes wrong without it.
"""
function resolve_functional(family::AbstractString, name::AbstractString, argnames::Vector{String})
    mod = pyimport("$family.$name")
    lc = pyimport("libxc_codegen")
    sp = pyimport("sympy")

    assumption(a) = a in POSITIVE_ARGNAMES ? sp.Symbol(ARG_PREFIX * a, positive=true) :
                                             sp.Symbol(ARG_PREFIX * a, real=true)
    syms = [assumption(a) for a in argnames]
    inlined = with_dimension(mod) do
        lc._deep_inline(mod.f(syms...))
    end

    # Renamed only after inlining, when no helper formals are left for the
    # names to collide with. Keyed on the symbol objects themselves rather
    # than on names rebuilt from strings: SymPy matches substitution keys by
    # identity, and a symbol rebuilt with different assumptions is a
    # different object that quietly matches nothing.
    finals = [a in POSITIVE_ARGNAMES ? sp.Symbol(a, positive=true) : sp.Symbol(a, real=true)
              for a in argnames]
    return inlined.subs(Dict(zip(syms, finals)))
end

"""
    sanitize_indexed_params(expr_py) -> PyObject

Libxc represents a functional's array-valued parameters (`params_a_pp`,
`params_a_beta1`, ...; C arrays with one entry per PW92-style spin
component) as plain `sympy.Symbol`s whose *name* literally contains
`[i]` (e.g. `Symbol("params_a_pp[0]")`): not SymPy `Indexed` objects.
`sympy_to_symbolics` round-trips through the expression's Julia-syntax
*string* form, so a name like `params_a_pp[0]` there is indistinguishable
from Julia array-indexing syntax `getindex(params_a_pp, 0)` and the
converter fails trying to index into a plain scalar (`BoundsError:
attempt to access Num at index [0]`, hit generating `lda_c_pw`: caught
by testing a second functional, not by anything about `lda_x` itself).
Renaming `params_a_pp[0]` -> `params_a_pp_0` before conversion sidesteps
the ambiguity entirely.

Two safety checks the naive version of this (a global `[`/`]` -> `_`
rewrite of *anything* matching `[\\[\\]]`) lacked, added before any functional needed them:
this scoping and collision check has no test coverage of its own yet
(tracked, see gen/README.md):
1. The pattern is scoped to Libxc's actual `_Param` naming convention
   (`params_a_<name>[<digits>]`), not every bracket-containing string, so
   an unrelated symbol that happens to contain `[`/`]` is left alone
   (and surfaces downstream instead of being silently mangled).
2. The renaming is checked for injectivity before substituting: if it maps
   two *different* original symbols to the same sanitized name (e.g. a
   clash with a genuinely distinct pre-existing `params_a_pp_0`), this
   raises rather than silently merging two independent parameters into
   one function argument.
"""
function sanitize_indexed_params(expr_py)
    sp = pyimport("sympy")
    pattern = r"^params_a_[A-Za-z0-9_]+\[\d+\]$"
    # Keep the actual free_symbols PyObjects as substitution keys, not
    # fresh `sp.Symbol(name)` reconstructions: SymPy symbol equality/hash
    # depends on assumptions (real=True, positive=True, ...) set when the
    # symbol was first created upstream (e.g. by param_default/`_Param`),
    # and a bare `sp.Symbol(name)` with no assumptions is a *different*
    # object that `.subs()` silently fails to match: caught here only
    # because it made the fix a no-op (BoundsError reappeared identically
    # to before the fix existed) rather than erroring, on the very next
    # run after adding the collision check below.
    to_rename = Tuple{Any,String,String}[]  # (orig_symbol, orig_name, clean_name)
    for s in expr_py.free_symbols
        n = String(s.name)
        occursin(pattern, n) || continue
        push!(to_rename, (s, n, replace(n, "[" => "_", "]" => "")))
    end
    isempty(to_rename) && return expr_py
    # Collision check against *every* free symbol in the original
    # expression, not just the ones being renamed: a clean name colliding
    # with another symbol being renamed to the same thing is one failure
    # mode, but it colliding with an already-existing, never-renamed
    # symbol of that exact name (e.g. a genuinely distinct pre-existing
    # `params_a_x_1` alongside `params_a_x[1]`) is a second, silent one:
    # `to_rename`-only checking (the first attempt at this) missed it.
    all_names = Set(String(s.name) for s in expr_py.free_symbols)
    seen = Dict{String,String}()
    for (_, orig, clean) in to_rename
        if haskey(seen, clean) && seen[clean] != orig
            error("sanitize_indexed_params: both '$orig' and '$(seen[clean])' " *
                  "sanitize to '$clean': naming collision, refusing to merge them")
        end
        if clean in all_names && clean != orig
            error("sanitize_indexed_params: renaming '$orig' to '$clean' would " *
                  "collide with a pre-existing distinct symbol of that name")
        end
        seen[clean] = orig
    end
    subs = PyDict()
    for (s, _, clean) in to_rename
        subs[s] = sp.Symbol(clean, real=true)
    end
    return expr_py.subs(subs)
end

"""
    substitute_static_constants(expr_py) -> PyObject

Substitute the `M_*` names an expression *actually contains* using the
static `LIBXC_NUMERIC_CONSTANTS` table, keyed by the expression's own
`free_symbols` objects (never a freshly-constructed `sp.Symbol(name)`):
SymPy symbol equality/hashing depends on assumptions (`positive=True`
etc.) set wherever the symbol was first created upstream, and a
reconstructed symbol with guessed assumptions is a *different* object
that `.subs()` silently fails to match: the exact class of bug already
hit and fixed once in `sanitize_indexed_params` (see its docstring),
re-derived here rather than assumed fixed by analogy.
"""
function substitute_static_constants(expr_py)
    subs = PyDict()
    for s in expr_py.free_symbols
        n = String(s.name)
        haskey(LIBXC_NUMERIC_CONSTANTS, n) || continue
        subs[s] = LIBXC_NUMERIC_CONSTANTS[n]
    end
    return isempty(subs) ? expr_py : expr_py.subs(subs)
end

"""
    resolve_libxc_constants(expr_py) -> PyObject

Substitute every Libxc-defined numeric constant the expression actually
contains, in two passes:
1. The `M_*` names (`M_CBRT3`, `M_CBRTPI`, ...) via the static
   `LIBXC_NUMERIC_CONSTANTS` table transcribed from `libxc-upstream/src/util.h`. These
   are NOT auto-discoverable from the Python side: `libxc_codegen.py`
   defines them only as placeholder `sp.Symbol`s (e.g.
   `_M_CBRT3 = sp.Symbol("M_CBRT3", positive=True)`) with no attached
   numeric value in Python at all: the C printer is what knows their
   value, so there is nothing to auto-evaluate here.
2. Every other remaining free symbol that happens to share its name with
   a `libxc_codegen` module attribute (`X2S`, `XT2S`, `BETA_PBE`,
   `GAMMA_PBE`, `MU_GE`, `KAPPA_PBE`, ...: present and
   auto-evaluable in `gga_x_pbe`). Unlike the `M_*` names, these genuinely are plain
   SymPy numeric expressions on the Python side (e.g.
   `X2S = sp.Rational(1,2)*(6*sp.pi**2)**sp.Rational(-1,3)`,
   `free_symbols == set()`) and are evaluated numerically with `.evalf()`
   before substitution: no static table entry needed, so this
   generalizes to whatever the next functional turns out to reference
   instead of needing another manually-transcribed constant added here
   every time (the exact maintenance burden a static-table-only approach
   would keep accruing). A compound constant that itself depends on `M_*`
   (`X_FACTOR_C = 3*2**(1/3)*M_CBRT3/(4*M_CBRTPI)`) only becomes fully
   numeric *after* pass 1, which is why this runs second, not first or
   standalone.
   `XC_EPSILON`/`XC_MIN` are the negative case: also `libxc_codegen`
   attributes, but ones that evaluate to *themselves* (a placeholder
   Symbol, not a number): correctly left as genuine runtime parameters
   rather than substituted, since `.free_symbols` on the result is
   non-empty and the substitution is skipped.

Two robustness gaps beyond `gga_x_pbe`'s own needs, closed before any
functional hit them:
- The candidate's SymPy-ness is checked (`isinstance(val, sp.Basic)`)
  before touching `.free_symbols`/`.subs` on it: `hasattr(lc, n)` alone
  says nothing about *what kind* of module attribute matched a free
  symbol's name by coincidence (a function, class, or plain Python value
  all pass `hasattr`), and calling SymPy-only methods on a non-SymPy
  object would raise an uncontrolled Python exception mid-generation
  rather than falling through to "leave it as a parameter" the way a
  genuinely unresolvable symbol does.
- Pass 2 actually calls `.evalf()` before assigning into `subs2`. Without
  it, a compound-but-still-symbolic constant like
  `GAMMA_PBE = (1 - log(2)) / pi**2` (zero free symbols, but not yet a
  number) would be substituted as a symbolic subexpression rather than
  the numeric literal the docstring already claimed this did: not
  confirmed to break anything downstream for `GAMMA_PBE` specifically
  (`sympy_to_symbolics` likely round-trips `log`/`pi` fine), but a
  doc/code mismatch that risked becoming a real bug for some future,
  less-standard constant.
"""
function resolve_libxc_constants(expr_py)
    sp = pyimport("sympy")
    lc = pyimport("libxc_codegen")
    py_builtins = pyimport("builtins")

    expr_py = substitute_static_constants(expr_py)

    subs2 = PyDict()
    for s in expr_py.free_symbols
        n = String(s.name)
        py_builtins.hasattr(lc, n) || continue
        candidate = py_builtins.getattr(lc, n)
        py_builtins.isinstance(candidate, sp.Basic) || continue
        # `substitute_static_constants`, not the caller's `subs1`: a
        # compound candidate like `X_FACTOR_C = 3*2**(1/3)*M_CBRT3/
        # (4*M_CBRTPI)` has M_CBRT3/M_CBRTPI as *its own* free symbols
        # (objects belonging to `candidate`, not to `expr_py`), which is
        # exactly why this needs its own name-matched substitution built
        # from `candidate.free_symbols`, not a dict built once from
        # `expr_py.free_symbols` and reused: `X_FACTOR_C` never
        # containing M_CBRT3/M_CBRTPI as *its own* top-level free symbols
        # is what the first version of this function (before it was split
        # into this helper) got wrong, caught by a unit test isolating
        # X_FACTOR_C with nothing else pulling in M_CBRT3, not by
        # `gga_x_pbe` (which happened not to need X_FACTOR_C).
        val = substitute_static_constants(candidate)
        length(val.free_symbols) == 0 || continue  # e.g. XC_EPSILON/XC_MIN: leave as a parameter
        subs2[s] = val.evalf()
    end
    isempty(subs2) || (expr_py = expr_py.subs(subs2))
    return expr_py
end

"""
Prefix for the temporaries `cse_decompose` introduces. Reserved: a
functional whose own free symbols already use it is rejected rather than
silently shadowed.
"""
const CSE_TMP_PREFIX = "cse_tmp_"

"""
    cse_decompose(expr_py) -> (replacements, body)

Split a deep-inlined SymPy expression into a list of
`(name::String, expr)` temporaries in dependency order plus the reduced
`body` that refers to them: common subexpression elimination, via
`sympy.cse`.

This is not an optimization, it is what makes some functionals generate at
all. `_deep_inline` flattens away Libxc's `@helper` boundaries, and every
place a helper was called gets its own copy of that helper's body. For
`lda_c_pk09` the result is 73,946 tree operations standing for only 452
distinct subexpressions (`k_ud`'s expansion alone is reproduced across
nine `Q_*` calls, ~10 occurrences each), and `sympy_to_symbolics`, which
round-trips through the expression's 762 KB Julia-syntax string form:
does not return in any practical time on it. Libxc's own C output avoids
this because Maple's code generator emits temporaries; this restores the
same structure here.

Temporaries are emitted in the order `sympy.cse` produces them, which is
dependency order: each may reference the original free symbols and any
earlier temporary, never a later one.
"""
function cse_decompose(expr_py)
    sp = pyimport("sympy")
    existing = [String(s.name) for s in expr_py.free_symbols]
    clashing = filter(n -> startswith(n, CSE_TMP_PREFIX), existing)
    isempty(clashing) || error(
        "cse_decompose: expression already uses the reserved temporary prefix " *
        "'$CSE_TMP_PREFIX' for $(join(sort(clashing), ", ")); rename those " *
        "symbols or change CSE_TMP_PREFIX before generating this functional.")

    result = sp.cse(expr_py; symbols=sp.numbered_symbols(CSE_TMP_PREFIX))
    replacements = [(String(r[1].name), r[2]) for r in result[1]]
    body = result[2][1]
    return inline_boolean_temporaries(replacements, body)
end

"""
    inline_boolean_temporaries(replacements, body) -> (replacements, body)

Inline a temporary whose value is a logical connective, and a connective
holding a temporary's symbol as one of its arguments, so that every
condition stands where it is used.

Both come out of `sympy.cse`, which treats a condition like any other
subexpression and is free to hoist either the whole `Or` or the relational
inside it. This pass was written for the SymPy -> Symbolics.jl round trip,
which could take neither shape; the printer that replaced that round trip
prints both correctly, so this is no longer what makes a functional
generate. It is kept because the shipped corpus was generated and verified
with it, and because the result reads the way the rest of the corpus does:
of the functionals shipped before meta-GGA, sixteen hold a connective and
not one holds it as a temporary. Dropping it would change the text of every
such kernel, which is worth doing on its own evidence rather than as a side
effect of the printer change.
"""
function inline_boolean_temporaries(replacements, body)
    sp = pyimport("sympy")
    boolean_cls = sp.logic.boolalg.BooleanFunction
    is_connective(n) = pyisinstance(n, boolean_cls)
    is_temporary(n) = (n.is_Symbol === true &&
                       startswith(String(n.name), CSE_TMP_PREFIX))

    reps = collect(replacements)
    cur_body = body
    # A pass can expose work for the next one: inlining a hoisted `Or` puts
    # it where its own symbol arguments then have to go too.
    for _ in 1:(length(reps) + 1)
        exprs = vcat([e for (_, e) in reps], [cur_body])
        kill = Set{String}()
        for e in exprs, n in sp.preorder_traversal(e)
            if is_connective(n)
                for a in n.args
                    is_temporary(a) && push!(kill, String(a.name))
                end
            end
        end
        for (nm, e) in reps
            e.is_Boolean === true && push!(kill, nm)
        end
        isempty(kill) && break

        defs = Dict(nm => e for (nm, e) in reps)
        for nm in sort!(collect(kill))
            haskey(defs, nm) || continue   # a name cse did not hoist after all
            sym = sp.Symbol(nm)
            value = defs[nm]
            reps = [(n2, n2 == nm ? e2 : e2.subs(sym, value)) for (n2, e2) in reps]
            cur_body = cur_body.subs(sym, value)
            reps = [(n2, e2) for (n2, e2) in reps if n2 != nm]
            defs = Dict(n2 => e2 for (n2, e2) in reps)
        end
    end
    return reps, cur_body
end

"""
    generate_functional(family, name, argnames; outname=name) -> (path, extra_params)

Full pipeline for one functional: resolve, deep-inline, sanitize any
indexed-parameter names, discover every free symbol the result actually
contains (not just `argnames`: Libxc formulas routinely also reference
threshold/parameter placeholders like `dens_threshold` or `params_a_*`,
and which ones appear is functional-specific, so hardcoding a fixed
extra-arg list only works for the one functional it was written against),
substitute known numeric constants, split out common subexpressions, and
write `src/generated/<family>/<outname>.jl`: one statement per
temporary, printed by `print_julia`. The generated function's
positional arguments are `argnames` (the physical/Libxc-internal
variables) followed by every other free symbol in deterministic (sorted)
order.
"""
function generate_functional(family::AbstractString, name::AbstractString,
                              argnames::Vector{String}; outname::AbstractString=name)
    expr_py = sanitize_indexed_params(resolve_functional(family, name, argnames))
    # Substituting Libxc's own numeric constants (M_*, X2S, BETA_PBE, ...)
    # here, in one place, means a newly-discovered constant just needs
    # adding to resolve_libxc_constants' lookup: the two used to be
    # separate (a static-table-only pass here and another one later), and
    # only covered M_*; folded together when GGA functionals (gga_x_pbe)
    # turned out to need several more such constants.
    # Inside the functional's own dimension as well: the constants this pass
    # reads off libxc_codegen (RS_FACTOR among them) are dimension-dependent.
    expr_py = with_dimension(pyimport("$family.$name")) do
        resolve_libxc_constants(expr_py)
    end

    free = Set(String(s.name) for s in expr_py.free_symbols)
    extra_params = sort(collect(setdiff(free, Set(argnames))); lt=natural_lt)

    # Common subexpression elimination before printing. `_deep_inline`
    # flattens away Libxc's `@helper` boundaries, so every call site gets
    # its own copy of the helper's body: on lda_c_pk09 the flattened tree
    # is 73,946 operations standing for 452 distinct subexpressions, and
    # printing it directly would write each of those copies into the
    # kernel. Libxc's own C output avoids this because Maple's code
    # generator emits temporaries; this restores the same structure.
    replacements, body_py = cse_decompose(expr_py)

    all_names = vcat(argnames, extra_params)
    # One statement per temporary, in sympy.cse's dependency order: each
    # refers only to the arguments and to temporaries defined above it.
    stmts = String[]
    for (tmp_name, tmp_expr) in replacements
        push!(stmts, "$tmp_name = " * print_julia(tmp_expr))
    end
    push!(stmts, print_julia(body_py))

    body = string("function (", join(all_names, ", "), ")\n",
                  "    @inbounds begin\n",
                  join(("        " * replace(st, "\n" => "\n        ") for st in stmts), "\n"),
                  "\n    end\nend")

    outdir = joinpath(GENERATED_DIR, family)
    mkpath(outdir)
    outfile = joinpath(outdir, "$outname.jl")
    fname = string(outname, kernel_suffix(family))
    open(outfile, "w") do io
        println(io, "# Auto-generated by gen/generate.jl from libxc-upstream")
        println(io, "# python/$family/$name.py -- do not edit by hand.")
        # MPL-2.0 Exhibit A. This file is a translation of an MPL-covered
        # source, so it carries the notice the way the source it came from
        # does, rather than relying on the repository's LICENSE alone.
        println(io, "#")
        println(io, "# This Source Code Form is subject to the terms of the Mozilla Public")
        println(io, "# License, v. 2.0. If a copy of the MPL was not distributed with this")
        println(io, "# file, You can obtain one at http://mozilla.org/MPL/2.0/.")
        println(io, "# args: ", join(all_names, ", "))
        println(io, "const $fname = ", body)
        println(io, "export $fname")
        print(io, entrypoint_source(family, outname, argnames, extra_params))
    end
    println("Wrote ", outfile, " (args: ", join(all_names, ", "), ")")
    return outfile, extra_params
end

"""
    discover_functional_names(family) -> Vector{String}

List every functional name in `gen/libxc-upstream/python/<family>/`
(each `.py` file there, extension stripped), sorted for deterministic
iteration order. Family directories (`lda_exc`, `gga_exc`, ...) contain
only functional source files: no shared-helper `.py` files at that
level (those live one level up, in `python/` itself, e.g.
`libxc_codegen.py`), so no filtering beyond the `.py` extension is
needed; `__pycache__` is a directory, not a `.py` file, and is already
excluded by the extension check.
"""
function discover_functional_names(family::AbstractString)
    dir = joinpath(LIBXC_PYTHON_DIR, family)
    names = [splitext(f)[1] for f in readdir(dir) if endswith(f, ".py")]
    return sort(names)
end

"""
    GenerationResult(family, name, status, elapsed_s, message)

One functional's outcome in a batch run. `status` is one of:

- `:ok`: generated; the file under `src/generated/<family>/` was written
- `:skipped`: deliberately not generated; `message` says why
- `:failed`: the generation raised; `message` carries the error text
- `:timeout`: the generation was still running when its budget expired and
                was killed

`:timeout` has to be its own status because a hang is not an exception:
`lda_c_pk09` before CSE did not raise, it never returned, and no `try`/`catch`
can tell those apart.

`argnames` and `extra_params` are the positional argument order the generation
actually emitted (`extra_params` being the free symbols left over after the
named ones, sorted). They are reported by the generation itself rather than
re-read from the file it wrote, so that the manifest holds an independent
record to check the file against: this order changes when the generator
changes, and a test written against the old one computes a wrong value in
silence rather than erroring.
"""
struct GenerationResult
    family::String
    name::String
    status::Symbol
    elapsed_s::Float64
    message::String
    argnames::Vector{String}
    extra_params::Vector{String}
    required::Vector{String}
    variants::Vector{String}
end

GenerationResult(family, name, status, elapsed_s, message;
                 argnames=String[], extra_params=String[], required=String[],
                 variants=String[]) =
    GenerationResult(family, name, status, elapsed_s, message, argnames,
                     extra_params, required, variants)

"""
    DEFAULT_TIMEOUT_S

Per-functional wall-clock budget for a batch run, in seconds.

The point of the budget is to stop a batch from hanging forever on one
functional, not to police how long a legitimately heavy one may take, so it
is deliberately loose. It was 600 s, which turned out to be too tight:
`gga_c_gapc` needs 882 s and generates cleanly when given them, while the
slowest one measured before it took 69 s (`lda_c_pk09`, with CSE). Libxc's
own `scripts/sympy2c/compile.py` records far longer times
(`mgga_c_tpssloc`, 4601 s), for 4th-derivative generations this pipeline
does not produce.
"""
const DEFAULT_TIMEOUT_S = 1800.0

"""
    run_with_timeout(cmd, timeout_s) -> (status::Symbol, elapsed_s::Float64)

Run `cmd`, killing it if it outlives `timeout_s`. Returns `:ok` (exited
successfully), `:failed` (exited non-zero) or `:timeout` (killed).

**Why this has to be a separate process.** An in-process time limit is not
implementable for this pipeline. Generation spends its time inside a blocking
`ccall` (PyCall descending into SymPy), and a blocking `ccall` stalls Julia's
scheduler: an `InterruptException` delivered to the task is not acted on, and
a watchdog task polling `istaskdone` does not even get to run until the call
returns by itself (a 6 s `ccall` ignored an interrupt,
and a 2 s `timedwait` in another task first reported back only after those
6 s were up). More threads would let a watchdog *observe* the overrun, but
nothing short of killing the process can *cancel* it.

Termination escalates: `SIGTERM` first, then `SIGKILL` if the process has not
exited within `KILL_GRACE_S`, so a wedged child cannot leave the batch waiting
on it a second time.
"""
const KILL_GRACE_S = 5.0

function run_with_timeout(cmd::Base.AbstractCmd, timeout_s::Real)
    t0 = time()
    proc = run(cmd; wait=false)
    if timedwait(() -> process_exited(proc), float(timeout_s); pollint=0.1) === :timed_out
        kill(proc)
        if timedwait(() -> process_exited(proc), KILL_GRACE_S; pollint=0.05) === :timed_out
            kill(proc, Base.SIGKILL)
            timedwait(() -> process_exited(proc), KILL_GRACE_S; pollint=0.05)
        end
        return (:timeout, time() - t0)
    end
    return (success(proc) ? :ok : :failed, time() - t0)
end

# Enough of a stack trace to identify the failure, not so much that a
# manifest turns into a log file.
const MAX_ERROR_CHARS = 4000

# Put where `error_excerpt` cut text out, so a truncated message never reads
# as the whole of what the child printed.
const ERROR_EXCERPT_MARKER = "\n[... truncated ...]\n"

"""
    error_excerpt(captured, limit) -> String

The part of a failed child's stderr worth keeping, at most `limit` characters
plus `ERROR_EXCERPT_MARKER`.

A child `julia` prints `ERROR: LoadError: <reason>` first and the stack trace
after it, so the excerpt starts at the first line beginning with `ERROR:` and
keeps what follows. Keeping the tail instead, as this driver first did, keeps
the trace and drops the reason whenever the trace alone fills the budget; two
`gga_exc` functionals were recorded with no usable reason that way. Starting
at the `ERROR:` line rather than at the top also stops warnings or
precompilation notices printed earlier from crowding the reason out.

Output with no `ERROR:` line has nothing to anchor on, so both its beginning
and its end are kept.
"""
const TRACE_START = r"^(?:Stacktrace:|\s*\[\d+\]|\s*File \")"
const MACHINE_PATH = r"(?:~|/(?:Users|home))/[^/\s\"]+/[^\s\"]*"
const NO_USABLE_REASON =
    "the child failed and printed no reason that does not name a path on the " *
    "machine it ran on"

function error_excerpt(captured::AbstractString, limit::Integer)
    at = findfirst(r"(?m)^ERROR:", captured)
    if at !== nothing
        kept = String[]
        for line in split(SubString(captured, first(at)), '\n')
            occursin(TRACE_START, line) && break
            s = strip(line)
            (isempty(s) || occursin(MACHINE_PATH, s)) && continue
            push!(kept, s)
        end
        reason = isempty(kept) ? NO_USABLE_REASON : join(kept, " ")
        return length(reason) <= limit ? reason :
               first(reason, limit) * ERROR_EXCERPT_MARKER
    end
    length(captured) <= limit && return String(captured)
    head = limit ÷ 2
    return first(captured, head) * ERROR_EXCERPT_MARKER * last(captured, limit - head)
end

"""
    child_command(family, name, argnames, reportfile) -> Cmd

The command a batch runs one functional with.

`PYTHONHASHSEED` is fixed because generation is otherwise not reproducible.
`sympy.cse` iterates over sets, Python randomizes their hash order per
process, and the temporaries it emits come out numbered and ordered
differently from one run to the next: same signature, same arithmetic,
different file. Measured on `lda_c_vwn`: four unseeded runs produced two
distinct files; two seeded runs produced identical ones.

Fixing it is what makes regenerating the shipped set meaningful. A diff then
says the upstream sources or the generator changed, rather than saying which
hash seed the run happened to draw.
"""
function child_command(family::AbstractString, name::AbstractString,
                       argnames::Vector{String}, reportfile::AbstractString)
    script = joinpath(HERE, "generate_one.jl")
    cmd = `$(Base.julia_cmd()) --project=$(HERE) $script --report $reportfile $family $name $argnames`
    return addenv(cmd, "PYTHONHASHSEED" => "0")
end

"""
    generate_one_subprocess(family, name, argnames; timeout_s=DEFAULT_TIMEOUT_S)
        -> GenerationResult

Generate one functional in a child `julia` process (`gen/generate_one.jl`), so
that a hang can be killed; see `run_with_timeout` for why nothing weaker
works.

The child's stdout is inherited, so a long batch still prints progress as it
goes; its stderr is captured to a temporary file and, on failure, an excerpt
of it that keeps the reason (`error_excerpt`) becomes the result's `message`
(and from there the manifest's record of what went wrong). Paying a fresh
process start, and with it a fresh PyCall and SymPy import, for every
functional is the cost of this; it buys back the memory each generation
accumulates, which matters across a family of 129.
"""
function generate_one_subprocess(family::AbstractString, name::AbstractString,
                                  argnames::Vector{String};
                                  timeout_s::Real=DEFAULT_TIMEOUT_S)
    errfile = tempname()
    reportfile = tempname()
    cmd = child_command(family, name, argnames, reportfile)
    status, elapsed = run_with_timeout(pipeline(cmd; stderr=errfile), timeout_s)

    message = ""
    if status === :timeout
        message = "killed after exceeding the $(timeout_s) s budget"
    elseif status === :failed
        captured = isfile(errfile) ? read(errfile, String) : ""
        message = error_excerpt(captured, MAX_ERROR_CHARS)
        isempty(strip(message)) && (message = "generation failed with no output on stderr")
    end
    isfile(errfile) && rm(errfile; force=true)

    # The emitted argument order is only knowable inside the child, which
    # leaves it in a sidecar file; a child that died has none to leave.
    emitted_args, emitted_extra, emitted_required = String[], String[], String[]
    emitted_variants = String[]
    if status === :ok && isfile(reportfile)
        report = TOML.parsefile(reportfile)
        emitted_args = String[report["argnames"]...]
        emitted_extra = String[report["extra_params"]...]
        emitted_required = String[report["required"]...]
        emitted_variants = String[get(report, "variants", String[])...]
    end
    isfile(reportfile) && rm(reportfile; force=true)

    return GenerationResult(family, name, status, elapsed, message,
                            emitted_args, emitted_extra, emitted_required,
                            emitted_variants)
end


"""
    upstream_commit() -> String

The pinned `gen/libxc-upstream` commit a generation ran against, or
`"unknown"` if it cannot be read. Recorded per entry rather than once per
file: a manifest accumulates across runs, and entries written at different
commits of the pinned tree are exactly what moving the pin has to tell
apart.
"""
function upstream_commit()
    pinned = joinpath(HERE, "libxc-upstream")
    try
        return strip(read(`git -C $pinned rev-parse HEAD`, String))
    catch
        return "unknown"
    end
end

"""
    sanitize_message(msg) -> String

Replace absolute paths out of the writing machine's filesystem with
`~`-relative ones.

What the manifest records for a functional that failed is the error the
generator saw, and a Python or Julia traceback names every file it passed
through. Those paths ship with the package, say nothing a reader can act on,
and name a machine that is not theirs.
"""
function sanitize_message(msg::AbstractString)
    text = replace(msg, homedir() => "~")
    # Still a home directory if the recorded path resolved differently from
    # `homedir()`: a symlinked or relocated home, or another user's.
    return replace(text, r"/(?:Users|home)/[^/\s\"]+" => "~")
end

"""
    write_manifest(results; path=MANIFEST_PATH)

Merge `results` into the manifest at `path`, leaving entries this run did not
touch alone (a batch over one family must not erase what another recorded)
and rewriting the entry for any functional it did.

What a generation run observes is recorded as it found it. Whether a
functional has been cross-validated against the compiled Libxc library is
deliberately *not* a field here: the generator cannot observe it, and a field
it could only guess at would go stale without anything noticing. The test
suite remains the record of what has been validated.

The one thing written from a decision rather than an observation is
`SHIPPING_HOLDS`, reconciled over every entry on each write, so that the
manifest does not claim a functional the package leaves out.
"""
function write_manifest(results::Vector{GenerationResult}; path::AbstractString=MANIFEST_PATH)
    manifest = isfile(path) ? TOML.parsefile(path) : Dict{String,Any}()
    commit = upstream_commit()
    stamp = Dates.format(Dates.now(), Dates.dateformat"yyyy-mm-dd\THH:MM:SS")

    # Stated once at the top, because 441 copies of the commit answer the
    # question per functional and leave the corpus-wide one to be inferred
    # from them agreeing, which nothing checked, and which a partial
    # regeneration is what would break: the names regenerated get the commit
    # seen now and the rest are carried over. The suite now checks every copy
    # against this one. The version is here as well: the commit identifies
    # exactly and says nothing, 7.1.2 is what a reader compares against a
    # release.
    manifest["upstream_commit"] = commit
    manifest["upstream_version"] = join(string.(pinned_libxc_version()), ".")
    manifest["generated_at"] = stamp

    for r in results
        family = get!(manifest, r.family, Dict{String,Any}())
        # What this run measured is rebuilt from its results; what it did not
        # measure is carried over. The agreement figures come from
        # record_agreement!, a pass of its own, and rebuilding the entry from
        # scratch dropped all 280 of them: found by regenerating the whole
        # corpus and reading a diff that deleted 525 zk, 532 vrho and 532
        # v2rho2 records from a change meant to touch six files.
        previous = get(family, r.name, nothing)
        entry = Dict{String,Any}(
            "status" => String(r.status),
            "elapsed_s" => round(r.elapsed_s; digits=1),
            "upstream_commit" => commit,
            "generated_at" => stamp,
        )
        if !isempty(r.argnames) || !isempty(r.extra_params)
            entry["argnames"] = r.argnames
            entry["args"] = vcat(r.argnames, r.extra_params)
            # Recorded even when empty: "this functional needs nothing beyond
            # a density" is the useful half of the statement.
            entry["required"] = r.required
        end
        isempty(r.message) || (entry["message"] = r.message)
        # The Libxc functionals this kernel was written entry points for.
        isempty(r.variants) || (entry["variants"] = r.variants)
        # Both measurement passes, not only the one this file knew about
        # first: `record_high_agreement!` costs 15 hours of wall clock, and a
        # generating run that preserved `agreement` alone would discard it.
        for key in ("agreement", "high_agreement")
            previous isa AbstractDict && haskey(previous, key) &&
                (entry[key] = previous[key])
        end
        family[r.name] = entry
    end

    # Applied to the whole manifest rather than only to this run's results,
    # because a held-back functional is absent from the shipped set and so
    # never appears in a refresh: an entry written before the decision would
    # otherwise keep claiming it indefinitely.
    # Over every entry, not only this run's: a message written before this
    # was applied would otherwise keep the path it recorded.
    for (_, entries) in manifest
        entries isa Dict || continue
        for (_, entry) in entries
            entry isa Dict && haskey(entry, "message") || continue
            entry["message"] = sanitize_message(entry["message"])
        end
    end

    # An earlier version of this wrote the hold into `status`, which
    # overwrote the generation outcome and left a released hold with nothing
    # to go back to. Only a run that produced a signature records `args`, so
    # an entry carrying one is a run that succeeded.
    for (_, entries) in manifest
        entries isa Dict || continue
        for (_, entry) in entries
            entry isa Dict || continue
            get(entry, "status", "") == "held_back" && haskey(entry, "args") &&
                (entry["status"] = "ok")
        end
    end

    # In fields of its own, beside the outcome rather than in place of it, so
    # that releasing a hold leaves no stale reason behind and needs no
    # regeneration to undo. Reconciled over the whole manifest because a
    # held-back functional is absent from the shipped set and so never
    # appears in a refresh.
    for (family_name, entries) in manifest
        entries isa Dict || continue
        for (name, entry) in entries
            entry isa Dict || continue
            reason = get(SHIPPING_HOLDS, (family_name, name), nothing)
            if reason === nothing
                delete!(entry, "held_back")
                delete!(entry, "held_back_reason")
            else
                # The same version that wrote the hold into `status` wrote the
                # reason into `message`, where a run's own output belongs.
                get(entry, "message", nothing) == reason && delete!(entry, "message")
                entry["held_back"] = true
                entry["held_back_reason"] = reason
            end
        end
    end

    mkpath(dirname(path))
    open(path, "w") do io
        println(io, "# Generated functionals: what was produced, from which upstream")
        println(io, "# commit, and in what positional argument order. Written by")
        println(io, "# gen/generate.jl -- do not edit by hand.")
        TOML.print(io, manifest; sorted=true)
    end
    return path
end

"""
    functional_dimension(family, name) -> Int

Whether a functional is 1-, 2- or 3-dimensional, read from the same Python
module the expression comes from, exactly as Libxc reads it
(`libxc_codegen._detect_dimension`, which looks for the `xc_dimensions_1d` /
`xc_dimensions_2d` macros the source declares).

This has to reach the entry point: `rs` and the reduced gradient are both
defined in terms of the dimension, and six of the functionals generated here
are not three-dimensional. Assuming 3 does not fail loudly: it answers a
different question with a plausible number.
"""
function functional_dimension(family::AbstractString, name::AbstractString)
    lc = pyimport("libxc_codegen")
    return Int(lc._detect_dimension(pyimport("$family.$name")))
end

"""
    VARIANT_HOLDS

Libxc functionals that this kernel's variant entry point would get wrong, and
by how much.

Written out for the same reason `SHIPPING_HOLDS` is: an entry point that
disagrees with the library is worse than none, and the measurement is what a
reader needs to judge it. Unlike a held-back kernel these need no file moved
anywhere: the entry point is simply not emitted.
"""
const VARIANT_HOLDS = Dict{String,String}(
    # gga_x_hjs_b97x: the 1.1e-6 was against the 7.0.0 Libxc.jl vendors, and
    # only at the highest density checked; against the pinned 7.1.2 it agrees
    # to 2.8e-15 everywhere measured.
    #
    # hyb_mgga_x_m08_so, held since the `const double` work: both reasons
    # written down for it turned out to be wrong. "Disagrees with the pinned
    # library by 1.3e-9" was a relative figure beside an absolute bound: in
    # absolute terms 1.62e-10, nearer than the 1.67e-10 of the sibling that
    # ships, and "not this tier's shape" generalised from the tier's first
    # two entries, when its Minnesota members are worst at high density just
    # as this one is. It is in LIBXC_LOOSE_AGREEMENT now, on the tier's own
    # bound. Why the Minnesota series loses a ninth digit at all is still
    # unexplained; this only stops treating one of them differently from the
    # rest.
)

# Inside the suite's second tolerance tier:
# hyb_mgga_x_m06_hf (1.4e-8), mgga_x_m06_l (8.9e-10), hyb_mgga_x_m06
# (4.1e-10) and hyb_mgga_x_revm06 (2.7e-10) are all inside the relative
# 1e-7 that tier allows, and each is named in it with its measured worst
# case. gga_x_hjs_b97x stays, because 1.1e-6 is outside that bound as well.

const _VARIANT_INDEX = Ref{Union{Nothing,Dict{Tuple{String,String},Vector{String}}}}(nothing)

"""
    kernel_variants(family, name) -> Vector{String}

The Libxc functionals that are this kernel, in the library's own names.

A python source is a kernel, not a functional: `gga_k_pg` has no
`XC_GGA_K_PG`, and what the library exposes is `XC_GGA_K_PG1`, which fills
the kernel's params struct with its own numbers. Several functionals share
one kernel this way and differ only in those numbers, which is why a shared
kernel cannot have a default of its own.

Read from the C sources, where the link is: the file that `#include`s
`maple2c/<family>/<name>.c` is the file whose `#define XC_*` lines name the
functionals built on it. A file including more than one kernel would leave
the mapping ambiguous and is skipped; across the pinned 7.1.2 there are none.
"""
function kernel_variants(family::AbstractString, name::AbstractString)
    if _VARIANT_INDEX[] === nothing
        index = Dict{Tuple{String,String},Vector{String}}()
        srcdir = joinpath(HERE, "libxc-upstream", "src")
        for file in readdir(srcdir; join=true)
            endswith(file, ".c") || continue
            text = read(file, String)
            kernels = Set{Tuple{String,String}}()
            for mo in eachmatch(r"#include\s+\"maple2c/(\w+)/(\w+)\.c\"", text)
                push!(kernels, (String(mo.captures[1]), String(mo.captures[2])))
            end
            length(kernels) == 1 || continue
            ids = [lowercase(String(mo.captures[1])[4:end])
                   for mo in eachmatch(r"(?m)^#define\s+(XC_[A-Z0-9_]+)\s+\d+", text)]
            isempty(ids) && continue
            append!(get!(index, only(kernels), String[]), ids)
        end
        for v in values(index)
            sort!(unique!(v))
        end
        _VARIANT_INDEX[] = index
    end
    return get(_VARIANT_INDEX[], (family, name), String[])
end

"""
    FAMILY_ENTRY

How a family's reduced variables are produced, and with which call signatures
an entry point offers them: `family => (variables_function, methods)`, where
each method is `(positional argument names, ...)`.

The two-argument GGA method takes `(rho, sigma)` and the five-argument one is
spin-resolved, mirroring Libxc's own convention that the shape of the input
says which is meant.
"""
const FAMILY_ENTRY = Dict(
    "lda_exc" => ("lda_variables", (["rho"], ["na", "nb"])),
    "gga_exc" => ("gga_variables", (["rho", "sigma"], ["na", "nb", "gaa", "gab", "gbb"])),
    "mgga_exc" => ("mgga_variables",
                   (["rho", "sigma", "lapl", "tau"],
                    ["na", "nb", "gaa", "gab", "gbb", "la", "lb", "ta", "tb"])),
    # The potential-only families get the unpolarized method and no other.
    # An energy density is one number whatever the spin, so both methods mean
    # something for the `*_exc` families above. A potential is per spin
    # channel (Libxc fills vrho[0] and vrho[1] for nspin=2), and these
    # kernels return a single scalar, which cannot be two components. Rather
    # than guess which channel it is, the spin-resolved method is not emitted.
    "lda_vxc" => ("lda_variables", (["rho"],)),
    "gga_vxc" => ("gga_variables", (["rho", "sigma"],)),
    "mgga_vxc" => ("mgga_variables", (["rho", "sigma", "lapl", "tau"],)),
)

"""
    kernel_suffix(family) -> String
    entry_suffix(family) -> String

What a generated name is called, which follows what it returns.

The `*_exc` families give an energy density: their kernel is `<name>_energy`
and the entry point is `<name>`. The `*_vxc` families give a POTENTIAL:
Libxc's C files for them carry `#define XC_NO_EXC`, and the library reports no
`XC_FLAGS_HAVE_EXC` for any functional built on them, so their kernel is
`<name>_potential` and the entry point is `<name>_vxc`, after the family name
Libxc files them under.

The bare name is left to the energy functionals on purpose. `gga_x_lb(rho,
sigma)` beside `gga_x_pbe(rho, sigma)` would read as the same kind of
quantity, and it is not one: LB94, BJ06, TB09 and RPP09 are potentials that
are not the functional derivative of any energy, which is why Libxc generates
them apart from the energies in the first place.
"""
kernel_suffix(family::AbstractString) =
    endswith(family, "_vxc") ? "_potential" : "_energy"
entry_suffix(family::AbstractString) = endswith(family, "_vxc") ? "_vxc" : ""

"""
    potential_docstring(entry, sig) -> String

The docstring emitted on a potential-returning entry point.

Written here rather than left to the reader of the generated file, because the
name breaks the contract every other name in this package keeps: callers of
`gga_x_pbe` get an energy density and differentiate it themselves, and a
caller who assumed the same of `gga_x_lb_vxc` would be wrong by a derivative.

What it may claim is set by what a caller can check. The library Libxc.jl
vendors is built to second order, so the potential and its first derivative
are what the test suite gates. The C of the pinned tree, rebuilt to
fourth order, agrees through the third derivative as well. That is not
claimed here, because reproducing it needs a build of the pinned sources
which the registered package does not carry.
"""
function potential_docstring(entry::AbstractString, sig::Vector{String})
    call = "$entry(" * join(sig, ", ") * ")"
    return """
    \"\"\"
        $call

    The exchange-correlation POTENTIAL, not an energy density.

    Libxc files this functional under one of its `*_vxc` families, where the
    maple source is the potential itself: the C carries `#define XC_NO_EXC`,
    and the library reports no `XC_FLAGS_HAVE_EXC` for it. There is no energy
    here to differentiate, and this potential is not the functional derivative
    of one. The functionals Libxc files this way: LB94, BJ06, TB09, RPP09
    and this one: were put forward as potentials to begin with, which is why
    Libxc generates them apart from the energies.

    So the contract the rest of this package keeps does not hold for this
    name. Everywhere else a name returns an energy density and the caller
    differentiates it to get a potential; here the potential is what comes
    back, and differentiating it gives Libxc's next derivative order.

    Checked against the library Libxc.jl vendors for the value and its first
    derivative, which is as far as that library goes. Only `vrho` is
    non-zero: Libxc returns exactly 0 for `vsigma`, `vlapl` and `vtau`
    here, so there is no counterpart to those and none is offered.

    Spin-resolved arguments are not taken: a potential has one component per
    spin channel, and this kernel returns a single scalar.
    \"\"\"
    """
end

"""
    resolved_defaults(family, name, extra_params) -> Dict{String,Float64}

Every extra argument of this functional's kernel that a value could actually
be read for, and that value.

Two sources, both from the library built from the pinned tree: the
thresholds, and the parameter struct `xc_func_init` filled in. Anything
neither supplies is left for the caller.
"""
function resolved_defaults(family::AbstractString, name::AbstractString,
                            extra_params::Vector{String};
                            lookup::AbstractString=name)
    out = Dict{String,Float64}()
    thresholds = libxc_thresholds(lookup)
    if thresholds !== nothing
        out["dens_threshold"] = thresholds.dens_threshold
        out["zeta_threshold"] = thresholds.zeta_threshold
    end
    params = libxc_params(family, name; lookup=lookup)
    params === nothing || merge!(out, params)
    merge!(out, libxc_machine_constants())
    return filter(kv -> kv.first in extra_params, out)
end

"""
    libxc_machine_constants() -> Dict{String,Float64}

`XC_EPSILON` and `XC_MIN`, as the pinned library defines them
(`libxc-upstream/src/util.h`: `DBL_EPSILON` and `DBL_MIN`). They are C macros rather than
parameters in libxc, so no caller can set them there either; a kernel that
takes one gets it as a default.
"""
function libxc_machine_constants()
    ensure_pinned_libxc()
    return Dict(
        "XC_EPSILON" => ccall((:lxs_xc_epsilon, PINNED_SHIM), Cdouble, ()),
        "XC_MIN" => ccall((:lxs_xc_min, PINNED_SHIM), Cdouble, ()))
end

"""
    required_params(family, name, extra_params) -> Vector{String}

The arguments this functional has no default for, in the order the kernel
takes them.

A default is only ever a value read from the pinned library: never a
plausible-looking stand-in. What stays required is what could not be read:
functionals the library does not have, structs that are not a flat run of
doubles, and kernels shared by variants that differ precisely in their
parameters.
"""
function required_params(family::AbstractString, name::AbstractString,
                          extra_params::Vector{String})
    known = keys(resolved_defaults(family, name, extra_params))
    return [p for p in extra_params if !(p in known)]
end


"""
    emitted_variants(family, name, extra_params) -> Vector{String}

The Libxc functionals built on this kernel that an entry point can be written
for: every one of `kernel_variants` whose own numbers cover every parameter
the kernel takes.

A variant that leaves one unresolved would give a caller nothing the kernel
does not already give, so it is left out rather than emitted with a hole. The
kernel's own name is not a variant of itself.
"""
function emitted_variants(family::AbstractString, name::AbstractString,
                          extra_params::Vector{String})
    out = String[]
    for v in kernel_variants(family, name)
        v == name && continue
        # Libxc evaluates some of the functionals declared beside a kernel by
        # mixing several others, and then the kernel is one piece of the
        # answer rather than the answer. Its own switch for that is mix_coef,
        # not the auxiliary count: gga.c:159 and mgga.c:289 call xc_mix_func
        # only when mix_coef is set, so a functional that leaves it NULL is
        # evaluated from its kernel alone however many auxiliaries it
        # carries. Checked against the library rather than read off the C,
        # because one file declares both kinds.
        #
        # Counting auxiliaries instead held back the nine M06 correlation
        # identifiers, which attach lda_c_pw_mod and never apply it, their
        # expression including lda_c_pw itself. Given the parameters the
        # library's own initialised struct holds for each, mgga_c_m06l
        # reproduces all nine between exactly and 5.9e-14. Over the pinned
        # 7.1.2 those nine are the whole of the difference between the two
        # readings; 29 other variants carry an auxiliary with mix_coef set
        # and stay out.
        mixed = try
            with_pinned_functional(v) do p
                ccall((:lxs_n_func_aux, PINNED_SHIM), Cint, (Ptr{Cvoid},), p) != 0 &&
                    ccall((:lxs_has_mix_coef, PINNED_SHIM), Cint, (Ptr{Cvoid},), p) != 0
            end
        catch
            nothing
        end
        (mixed === nothing || mixed) && continue
        haskey(VARIANT_HOLDS, v) && continue
        resolved = try
            resolved_defaults(family, name, extra_params; lookup=v)
        catch
            continue
        end
        all(p -> haskey(resolved, p), extra_params) && push!(out, v)
    end
    return out
end

"""
    entrypoint_source(family, name, argnames, extra_params) -> String

The named layer for one functional: its defaults, the parameters it has no
default for, and the methods that take a density.

`argnames` are the reduced variables the kernel wants and come from the
variable layer; everything else comes from the resolved parameters. Both are
emitted **by name**, so the kernel's positional order is closed over here and
never reaches a caller: the order has changed under a generator change
before, and callers written against the old one computed a wrong value in
silence.

A parameter is only given a default when a value for it was actually read
from Libxc. Thresholds for the handful of functionals Libxc.jl's older
library does not have, and every `params_a_*`, are `required` instead: a
default nothing has checked is worse than an argument the caller has to
supply.
"""
function entrypoint_source(family::AbstractString, name::AbstractString,
                            argnames::Vector{String}, extra_params::Vector{String})
    haskey(FAMILY_ENTRY, family) || return ""
    varfun, methods = FAMILY_ENTRY[family]
    dim = functional_dimension(family, name)

    call_args = join(vcat(["v.$a" for a in argnames],
                          ["p.$e" for e in extra_params]), ", ")

    # One block per entry point: the kernel's own, then one for each Libxc
    # functional built on it. They differ only in the numbers, so they share
    # the kernel and carry a defaults tuple each.
    function block(io, bare::AbstractString, resolved::Dict{String,Float64},
                   required::Vector{String})
        entry = string(bare, entry_suffix(family))
        # Emitted in the kernel's own argument order, so the file reads in the
        # order it is called.
        defaults = [(p, resolved[p]) for p in extra_params if haskey(resolved, p)]
        # A one-element NamedTuple needs its trailing comma; an empty one is
        # written as NamedTuple() rather than as `(;)`.
        defaults_src = isempty(defaults) ? "NamedTuple()" :
            "(" * join(("$k = $(repr(v))" for (k, v) in defaults), ", ") *
            (length(defaults) == 1 ? ",)" : ")")
        required_src = isempty(required) ? "()" :
            "(" * join((":$r" for r in required), ", ") * (length(required) == 1 ? ",)" : ")")
        println(io)
        println(io, "const $(entry)_defaults = ", defaults_src)
        println(io, "const $(entry)_required = ", required_src)
        for (k, sig) in enumerate(methods)
            println(io)
            # What a potential-returning name has to say for itself, on the
            # first method so the name carries it.
            k == 1 && !isempty(entry_suffix(family)) &&
                print(io, potential_docstring(entry, sig))
            println(io, "function $entry(", join(sig, ", "), "; params = NamedTuple())")
            println(io, "    p = resolve_params($(entry)_defaults, $(entry)_required, params)")
            println(io, "    v = $varfun(", join(sig, ", "), ", Val($dim))")
            println(io, "    return $(name)$(kernel_suffix(family))(", call_args, ")")
            println(io, "end")
        end
        println(io)
        println(io, "export $entry, $(entry)_defaults, $(entry)_required")
        return nothing
    end

    io = IOBuffer()
    block(io, name, resolved_defaults(family, name, extra_params),
          required_params(family, name, extra_params))
    for v in emitted_variants(family, name, extra_params)
        block(io, v, resolved_defaults(family, name, extra_params; lookup=v), String[])
    end
    return String(take!(io))
end

# The pinned builds and the comparison against them live in their own
# file, which imports no PyCall so that reftest/ can include it alone.
include("pinned.jl")



"""
    params_struct_fields(structname) -> Vector{Tuple{String,Vector{Int}}} or nothing

The fields of a functional's C parameter struct, in declaration order, as
`(name, count)`: `count` being 1 for a scalar and the length for an array.

Only the struct's *leading* run of doubles, which is as far as the offsets
are known without a model of C's layout: the struct begins at offset 0 and a
double is eight bytes aligned to eight, so the k-th leading double sits at
8k whatever comes after it. The first field that is not a double ends the
run, and the fields beyond it are not reported, so a kernel that needs one
of them keeps it `required` rather than being handed a reinterpreted int.

`nothing` when the run is empty, which is the whole refusal: nothing can be
read from `hyb_gga_xc_case21`'s struct, whose first two fields are
`int k, int Nsp`.

Reporting no fields at all when any field was not a double is what held
`lda_c_1d_css` back: it declares `double para[10], ferro[10]` and only then
`int interaction`, so the twenty parameters its expression takes were at
known offsets the whole time.
"""
function params_struct_fields(structname::AbstractString)
    srcdir = joinpath(HERE, "libxc-upstream", "src")
    closing = "} $structname;"
    for file in readdir(srcdir; join=true)
        endswith(file, ".c") || continue
        text = read(file, String)
        found = findfirst(closing, text)
        found === nothing && continue

        # The declaration block: from the last "typedef struct" before the
        # closing line, up to it, minus the opening brace.
        stop = first(found)
        opens = findall("typedef struct", text[1:stop])
        isempty(opens) && return nothing
        block = text[last(last(opens))+1:stop-1]
        brace = findfirst('{', block)
        brace === nothing && return nothing
        block = block[nextind(block, brace):end]

        block = replace(block, r"/\*.*?\*/"s => " ")   # comments carry field docs
        block = replace(block, r"//[^\n]*" => " ")

        fields = Tuple{String,Vector{Int}}[]
        for decl in split(block, ';')
            isempty(strip(decl)) && continue
            # `const double` is the same run of doubles (const says nothing
            # about the layout), and nine of these structs declare their
            # arrays that way, all of the Minnesota family. Accepting only
            # `double` is why thirty Libxc identifiers could not be called.
            m = match(r"^\s*(?:const\s+)?double\s+(.*)$"s, decl)
            m === nothing && break                     # the leading run ends here
            stopped = false
            for d in split(m.captures[1], ',')
                d = strip(d)
                isempty(d) && continue
                dm = match(r"^([A-Za-z_][A-Za-z0-9_]*)((?:\[\d+\])*)$", d)
                if dm === nothing                      # a declaration not read
                    stopped = true
                    break
                end
                # The shape, not the number of entries: a two-dimensional
                # field has to be named the way the expression names it, and
                # that needs its rows kept apart. See `param_names`.
                shape = Int[parse(Int, dim.captures[1])
                            for dim in eachmatch(r"\[(\d+)\]", dm.captures[2])]
                push!(fields, (String(dm.captures[1]), shape))
            end
            stopped && break
        end
        return isempty(fields) ? nothing : fields
    end
    return nothing
end


"""
    param_names(field, shape) -> Vector{String}

The names the generated kernels use for one params-struct field, in the
order the field occupies memory.

A scalar is `params_a_<field>`, a one-dimensional array
`params_a_<field>_<k>`, and a two-dimensional one
`params_a_<field>_<i>__<j>`: the double underscore because the upstream
python declares such a field row by row (`double b[2][5]` arrives as
`params_a_b_0_` and `params_a_b_1_`, each a list of five), so the symbol in
the expression is `params_a_b_0_[0]`, which sanitizing turns into
`params_a_b_0__0`.

Row-major, which is C's layout, and checked against Libxc's own numbers
rather than assumed: `lda_xc_ksdt`'s `b` reads flat as
`0.283997, 48.932154, 0.370919, 61.095357, 0.871837...` followed by
`0.329001, 111.598308, ...`, which are the first and second braced rows of
its static initialiser (`libxc-upstream/src/lda_xc_ksdt.c:34`). So the flat index of
`b[i][j]` is `i*5 + j`. Six identifiers were generated on that basis and
all six agree with the library to 3e-15, which is what says the ordering is
right rather than the reasoning about it.

Collapsing the shape to a count instead is what held `lda_xc_ksdt` and
`gga_x_n12` back (six Libxc identifiers between them), because the
reader then produced `params_a_b_0 ... params_a_b_9`, which the expression
never asks for, so every one of those parameters came out `required`.

# Why the indices start at zero

They are the C struct's indices, taken from the field declarations, so they
run `0 ... n-1` for every functional. That is not Julia's convention, and
it is kept anyway for two reasons.

The first is uniformity. Libxc publishes names of its own for the
parameters a caller can set, and those carry indices too, but the base is
whatever each functional's author wrote: measured over the pinned 7.1.2,
240 array-valued external parameters are numbered from zero and 32 from one
(`hyb_gga_xc_wb97`'s `_cx0` against `gga_c_ccdf`'s `_c1`). There is no
single Libxc convention to match. Reading the struct gives one base for all
702 identifiers.

The second is that the struct is where the values come from. The names have
to line up with the order `lxs_params` hands back, and keeping the same
indices makes a parameter traceable to the braced row of the C initialiser
it was read out of, which is how the row-major ordering above was checked
at all.

Libxc.jl does not settle the question either way: it exposes the parameters
by Libxc's own name strings in a `Dict`, with no index of its own
(`Functional.jl`'s `external_parameter_defaults`), so its surface inherits
whatever base each functional's C author chose.
"""
function param_names(field::AbstractString, shape::AbstractVector{<:Integer})
    isempty(shape) && return ["params_a_$field"]
    length(shape) == 1 && return ["params_a_$(field)_$k" for k in 0:(shape[1] - 1)]
    length(shape) == 2 && return ["params_a_$(field)_$(i)__$(j)"
                                  for i in 0:(shape[1] - 1) for j in 0:(shape[2] - 1)]
    error("param_names: no spelling for a $(length(shape))-dimensional field " *
          "($field with shape $shape); the upstream python declares nothing " *
          "deeper than two, so the name it would use is unknown")
end

"""
    libxc_params(family, name) -> Dict{String,Float64} or nothing

Every `params_a_*` value the kernel of `name` will be evaluated with, read
from the parameter struct `xc_func_init` filled in.

This sidesteps the question of where a default came from. Libxc keeps them in
three different places: a constant assigned in `<name>_init`, the external
parameter defaults copied verbatim, or a transform of those (`lda_c_xalpha`
sets `alpha = 1.5*ext - 1`), and the initialised struct is what all three
end at.

Matching the struct's fields to the generated names needs no guesswork
either: a generated `params_a_X` is what Libxc's own C printer renders as
`params->X`, so the suffix *is* the field name. Going by the external
parameter names would not work at all; they are a separate naming system
(`_w[0..3]` against `params_a_omega_0..3`).

`nothing` when the struct is not a flat run of doubles, or when `name` is a
kernel shared by variants rather than a functional in its own right: there
being no single set of parameters in the latter case is exactly what the
variants exist to express.
"""
function libxc_params(family::AbstractString, name::AbstractString;
                      lookup::AbstractString=name)
    ensure_pinned_libxc()
    # The struct is the kernel's, named by the kernel's own python module;
    # the values are whichever functional `lookup` names. For a shared kernel
    # those differ: the kernel has no functional of its own in the library and
    # each variant fills the same struct with its own numbers.
    mod = pyimport("$family.$name")
    structname = hasproperty(mod, :PARAMS_STRUCT) ? mod.PARAMS_STRUCT : nothing
    # No params struct at all is normal: a functional whose only parameter is
    # a range-separation one keeps it on xc_func_type instead.
    structname === nothing && return cam_parameters(lookup)

    fields = params_struct_fields(String(structname))
    fields === nothing && return nothing

    names = reduce(vcat, (param_names(fname, shape) for (fname, shape) in fields))
    values = with_pinned_functional(lookup) do p
        ptr = ccall((:lxs_params, PINNED_SHIM), Ptr{Cdouble}, (Ptr{Cvoid},), p)
        ptr == C_NULL ? nothing : Float64[unsafe_load(ptr, i) for i in 1:length(names)]
    end
    values === nothing && return nothing

    out = Dict{String,Float64}(zip(names, values))
    merge!(out, cam_parameters(lookup))
    return out
end

"""
    params_at(family, kernel, p) -> Dict(name => value)

Every parameter of the functional at pointer `p`, read with the struct
layout of the kernel `(family, kernel)`.

The same reading as `libxc_params`, but given a pointer rather than a name,
which is the whole point: a component inside a mixed functional is not the
same functional as that component standing alone.
"""
function params_at(family::AbstractString, kernel::AbstractString, p::Ptr{Cvoid})
    mod = pyimport("$family.$kernel")
    out = Dict{String,Float64}()
    structname = hasproperty(mod, :PARAMS_STRUCT) ? mod.PARAMS_STRUCT : nothing
    if structname !== nothing
        fields = params_struct_fields(String(structname))
        if fields !== nothing
            names = reduce(vcat, (param_names(fname, shape) for (fname, shape) in fields))
            ptr = ccall((:lxs_params, PINNED_SHIM), Ptr{Cdouble}, (Ptr{Cvoid},), p)
            if ptr != C_NULL
                for (i, key) in enumerate(names)
                    out[key] = unsafe_load(ptr, i)
                end
            end
        end
    end
    out["cam_omega"] = ccall((:lxs_cam_omega, PINNED_SHIM), Cdouble, (Ptr{Cvoid},), p)
    out["cam_alpha"] = ccall((:lxs_cam_alpha, PINNED_SHIM), Cdouble, (Ptr{Cvoid},), p)
    out["cam_beta"] = ccall((:lxs_cam_beta, PINNED_SHIM), Cdouble, (Ptr{Cvoid},), p)
    return out
end

"""
    mix_overrides(name; lookup=mix_component_kernel) -> nothing | Vector{Dict}

What `name` changes in each of the functionals it mixes, one entry per
component in the recipe's order: the parameters whose value inside the
parent differs from that component's own default.

Libxc does not leave the components alone: `xc_func_init` sets their
external parameters from the parent's, and the difference decides whether
the weighted sum reproduces the library. `hyb_gga_xc_cam_pbeh` sets its
`gga_x_hjs_pbe` component's `cam_omega` to 0.7 where that functional's own
default is 0.11, and the sum is 50 % wrong without it.

Measured on the pinned 7.1.2: of the 148 mixes whose components this
package has, 90 reproduce the library with the components as they stand and
**147** reproduce it once these are passed. 57 override something, and
between them they override 23 different parameters: `cam_omega` and
`params_a_*` from `params_a_a` to `params_a_rpbe_mu`.

Which is not what the first two examples suggested: `hyb_gga_xc_cam_pbeh`
and `hyb_gga_xc_lc_bop` each override `cam_omega` alone, and reading only
those two is how this came to be written as "the only parameter overridden
is cam_omega" before the sweep over all 147 said otherwise. Nothing here
assumes which parameters a parent touches; the diff against the component's
own defaults is taken as it comes.

`nothing` when Libxc does not mix `name`.
"""
function mix_overrides(name::AbstractString;
                       lookup::Function=mix_component_kernel)
    recipe = mix_recipe(name)
    recipe === nothing && return nothing
    return with_pinned_functional(name) do p
        out = Dict{String,Float64}[]
        for (i, (_, component)) in enumerate(recipe.components)
            owner = lookup(component)
            if owner === nothing
                push!(out, Dict{String,Float64}())
                continue
            end
            aux = ccall((:lxs_func_aux, PINNED_SHIM), Ptr{Cvoid},
                        (Ptr{Cvoid}, Cint), p, i - 1)
            if aux == C_NULL
                push!(out, Dict{String,Float64}())
                continue
            end
            family, kernel = owner
            inside = params_at(family, kernel, aux)
            alone = with_pinned_functional(component) do q
                params_at(family, kernel, q)
            end
            alone === nothing && (push!(out, Dict{String,Float64}()); continue)
            push!(out, Dict(k => v for (k, v) in inside
                            if haskey(alone, k) && alone[k] != v))
        end
        return out
    end
end

"""
    mix_component_kernel(name) -> nothing | (family, kernel)

Which kernel serves the functional `name`, read from the manifest: the
struct layout its parameters are read with belongs to the kernel, not to
the functional.
"""
function mix_component_kernel(name::AbstractString)
    index = _MIX_OWNER[]
    if index === nothing
        index = Dict{String,Tuple{String,String}}()
        manifest = isfile(MANIFEST_PATH) ? TOML.parsefile(MANIFEST_PATH) : Dict{String,Any}()
        for (family, entries) in manifest
            entries isa Dict || continue
            family == "mix" && continue
            for (kernel, entry) in entries
                entry isa Dict && haskey(entry, "status") || continue
                index[kernel] = (family, kernel)
                for variant in get(entry, "variants", String[])
                    index[variant] = (family, kernel)
                end
            end
        end
        _MIX_OWNER[] = index
    end
    return get(index, name, nothing)
end

const _MIX_OWNER = Ref{Union{Nothing,Dict{String,Tuple{String,String}}}}(nothing)

"""
    MIX_HOLDS

Functionals Libxc mixes whose recipe is readable and whose components this
package has, but which are not written out, with the measured reason.

Recorded here rather than left out silently, for the reason `VARIANT_HOLDS`
is: a reader comparing the Libxc list against this package needs to know
the difference between "not reached yet" and "reached and withheld".
"""
const MIX_HOLDS = Dict(
    # Libxc does not leave a mixed functional's components at their own
    # defaults: xc_func_init overrides their external parameters from the
    # parent's. hyb_gga_xc_cam_pbeh sets its gga_x_hjs_pbe component's omega
    # to 0.7 where that functional's own default is 0.11, and summing the
    # components as they stand is then the wrong number: by 50 % at
    # rho = 0.5 for that one. Passing the parent's omega alone narrows it to
    # 9 % but does not close it, so more than omega differs and what else is
    # not established. 58 functionals are in this state; they are withheld
    # by the measurement below rather than by name, because the test that
    # decides it is exactly the one a reader would want applied.
    #
    # (Nothing is listed individually yet. The measurement that separates
    # the 90 that reproduce from the 58 that do not is in
    # `emitted_mixes`, and a name belongs here only once it reproduces the
    # library and is still withheld for some other reason.)
)

"""
    emitted_mixes(available) -> Vector{(name, family, components)}

Every Libxc functional that this package can evaluate by mixing kernels it
already has: those whose recipe carries coefficients, whose every component
is in `available` (a map from a callable functional's name to its family),
and which reproduce the pinned library's own `zk` at three densities.

The last condition is checked here, at generation time, against the library
the kernels were generated from, with each component given the parameters
the parent overrode (`mix_overrides`). It is not an optimisation: of the
148 whose components are all present, 90 reproduce the library with the
components as they stand and **147** once the overrides are passed, so
writing them out without the overrides would ship 57 functionals that
return a plausible wrong number.

Returned in sorted order so that the generated file does not depend on the
order the pinned library enumerates its identifiers in.
"""
function emitted_mixes(available::AbstractDict{String,String})
    out = Tuple{String,String,Vector{Tuple{Float64,String}},Vector{Dict{String,Float64}}}[]
    for name in sort(libxc_identifiers())
        haskey(available, name) && continue        # a kernel or variant already serves it
        haskey(MIX_HOLDS, name) && continue
        r = mix_recipe(name)
        r === nothing && continue
        r.has_coefficients || continue
        all(c -> haskey(available, c[2]), r.components) || continue
        fam = mix_family(name)
        fam === nothing && continue
        overrides = mix_overrides(name)
        overrides === nothing && continue
        agrees = true
        for rho in (0.05, 0.5, 5.0)
            sigma, lapl, tau = 0.1rho, 0.05rho, 0.3rho
            reference = pinned_exc(fam, name, rho, sigma, lapl, tau)
            reference === nothing && (agrees = false; break)
            mine = 0.0
            for (i, (coefficient, component)) in enumerate(r.components)
                mine += coefficient * shipped_exc(available[component], component,
                                                  rho, sigma, lapl, tau; params=overrides[i])
            end
            # The same rule the test suite applies, from the same table:
            # a mix is no better than the component that agrees least well,
            # and a flat bound here is how gga_xc_beefvdw fell between the
            # generator's gate and the suite's.
            LibXcDerivative.agrees_with_libxc(mine, reference, name,
                String[c[2] for c in r.components]) || (agrees = false; break)
        end
        agrees && push!(out, (name, fam, r.components, overrides))
    end
    return out
end

"""
    libxc_identifiers() -> Vector{String}

Every `XC_*` the pinned headers define, lowercased: the names a caller can
ask Libxc for.
"""
function libxc_identifiers()
    header = read(joinpath(HERE, "libxc-upstream", "src", "xc_funcs.h"), String)
    names = String[]
    for m in eachmatch(r"#define\s+XC_([A-Z0-9_]+)\s+\d+", header)
        push!(names, lowercase(m.captures[1]))
    end
    return unique!(names)
end

"""
    mix_family(name) -> "lda_exc" | "gga_exc" | "mgga_exc" | nothing

Which of this package's families a mixed functional belongs to, taken from
the pinned library's own classification of it rather than from its name
(`hyb_mgga_xc_wb97m_v` and `mgga_c_m06` are both meta-GGA, and the prefix
is not a reliable guide for the hybrids).
"""
function mix_family(name::AbstractString)
    kind = with_pinned_functional(name) do p
        Int(ccall((:lxs_family, PINNED_SHIM), Cint, (Ptr{Cvoid},), p))
    end
    kind === nothing && return nothing
    # XC_FAMILY_LDA 1, GGA 2, MGGA 4, HYB_GGA 32, HYB_MGGA 64, HYB_LDA 128
    kind in (1, 128) && return "lda_exc"
    kind in (2, 32) && return "gga_exc"
    kind in (4, 64) && return "mgga_exc"
    return nothing
end

"""
    pinned_exc(family, name, rho, sigma, lapl, tau) -> Float64 | nothing

The pinned library's own energy density for `name`, for checking a mix
against the thing it is supposed to reproduce.
"""
function pinned_exc(family::AbstractString, name::AbstractString,
                    rho::Real, sigma::Real, lapl::Real, tau::Real)
    return with_pinned_functional(name) do p
        zk = Ref{Cdouble}(0.0)
        if family == "mgga_exc"
            ccall((:xc_mgga_exc, PINNED_LIB), Cvoid,
                  (Ptr{Cvoid}, Csize_t, Ref{Cdouble}, Ref{Cdouble}, Ref{Cdouble},
                   Ref{Cdouble}, Ref{Cdouble}),
                  p, 1, Ref{Cdouble}(rho), Ref{Cdouble}(sigma),
                  Ref{Cdouble}(lapl), Ref{Cdouble}(tau), zk)
        elseif family == "gga_exc"
            ccall((:xc_gga_exc, PINNED_LIB), Cvoid,
                  (Ptr{Cvoid}, Csize_t, Ref{Cdouble}, Ref{Cdouble}, Ref{Cdouble}),
                  p, 1, Ref{Cdouble}(rho), Ref{Cdouble}(sigma), zk)
        else
            ccall((:xc_lda_exc, PINNED_LIB), Cvoid,
                  (Ptr{Cvoid}, Csize_t, Ref{Cdouble}, Ref{Cdouble}),
                  p, 1, Ref{Cdouble}(rho), zk)
        end
        return zk[]
    end
end

"""
    shipped_exc(family, name, rho, sigma, lapl, tau)

This package's own entry point for `name`, called with the arguments its
family takes. Used only by `emitted_mixes`, to check a recipe before
writing it out.
"""
function shipped_exc(family::AbstractString, name::AbstractString,
                     rho::Real, sigma::Real, lapl::Real, tau::Real;
                     params::AbstractDict{String,Float64}=Dict{String,Float64}())
    f = getfield(LibXcDerivative, Symbol(name))
    p = NamedTuple(Symbol(k) => v for (k, v) in params)
    family == "mgga_exc" && return f(rho, sigma, lapl, tau; params=p)
    family == "gga_exc" && return f(rho, sigma; params=p)
    return f(rho; params=p)
end

"""
    AGREEMENT_POINTS
    AGREEMENT_INPUTS

Where agreement with the pinned library is measured, and the sentence that
says so in the manifest.

The same densities the test suite sweeps, so a number recorded here and a
verdict reached there are about the same inputs. The constants are written
down rather than described: a speed measurement that records the shape of
its inputs and not their constants cannot be reproduced later.
"""

"""
    cam_parameters(name) -> Dict{String,Float64}

The range-separation parameters, which a generated kernel names directly
(`cam_omega` rather than `params_a_omega`) because Libxc keeps them on
`xc_func_type` beside the thresholds rather than in the functional's own
params struct.
"""
function cam_parameters(name::AbstractString)
    ensure_pinned_libxc()
    v = with_pinned_functional(name) do p
        Dict("cam_omega" => ccall((:lxs_cam_omega, PINNED_SHIM), Cdouble, (Ptr{Cvoid},), p),
             "cam_alpha" => ccall((:lxs_cam_alpha, PINNED_SHIM), Cdouble, (Ptr{Cvoid},), p),
             "cam_beta"  => ccall((:lxs_cam_beta, PINNED_SHIM), Cdouble, (Ptr{Cvoid},), p))
    end
    return v === nothing ? Dict{String,Float64}() : v
end

# Libxc's own bits, from libxc-upstream/src/xc.h:43-70. Read rather than
# inferred from the name: hyb_gga_xc_pbeh is a hybrid and
# hyb_gga_x_pbe_erf_gws is a range-separated one, and neither name says so.
const XC_FAMILY_HYB = 32 | 64 | 128          # HYB_GGA | HYB_MGGA | HYB_LDA
const XC_FLAGS_HYB_CAM = 1 << 8
const XC_FLAGS_HYB_CAMY = 1 << 9
const XC_FLAGS_VV10 = 1 << 10
const XC_FLAGS_HYB_LC = 1 << 11              # deprecated alias of HYB_CAM
const XC_FLAGS_HYB_LCY = 1 << 12             # deprecated alias of HYB_CAMY

"""
    pinned_mixing_parameters(name) -> NamedTuple or nothing

What Libxc keeps beside the functional rather than inside a kernel: the
exact-exchange fraction of a hybrid, the range-separation parameters of a
screened one, and the two VV10 constants. `nothing` when Libxc does not
register `name`.

A hybrid's exchange is part semi-local and part exact, and only the
semi-local part is a density functional: no density tells a caller that
HSEsol wants a quarter of its exchange short-range exact, screened at
omega = 0.11. Libxc answers from `xc_func_type` (`xc_hyb_exx_coef` and
`xc_hyb_cam_coef`, `libxc-upstream/src/hybrids.c:63-77`), and all three of those accessors
are plain reads of `cam_alpha`, `cam_beta` and `cam_omega`: for a global
hybrid the exact-exchange fraction *is* `cam_alpha`, with the other two
zero.

The three classes are decided as `hybrids.c:20-32` decides them, which is
why they come back separately rather than as one label: `hyb_mgga_xc_wb97m_v`
is a range-separated hybrid *and* a VV10 functional.
"""
function pinned_mixing_parameters(name::AbstractString)
    ensure_pinned_libxc()
    return with_pinned_functional(name) do p
        flags = Int(ccall((:lxs_flags, PINNED_SHIM), Cint, (Ptr{Cvoid},), p))
        family = Int(ccall((:lxs_family, PINNED_SHIM), Cint, (Ptr{Cvoid},), p))
        rs = (flags & (XC_FLAGS_HYB_CAM | XC_FLAGS_HYB_CAMY |
                       XC_FLAGS_HYB_LC | XC_FLAGS_HYB_LCY)) != 0
        return (hybrid = (family & XC_FAMILY_HYB) != 0,
                range_separated = rs,
                vv10 = (flags & XC_FLAGS_VV10) != 0,
                cam_alpha = ccall((:lxs_cam_alpha, PINNED_SHIM), Cdouble, (Ptr{Cvoid},), p),
                cam_beta = ccall((:lxs_cam_beta, PINNED_SHIM), Cdouble, (Ptr{Cvoid},), p),
                cam_omega = ccall((:lxs_cam_omega, PINNED_SHIM), Cdouble, (Ptr{Cvoid},), p),
                nlc_b = ccall((:lxs_nlc_b, PINNED_SHIM), Cdouble, (Ptr{Cvoid},), p),
                nlc_C = ccall((:lxs_nlc_C, PINNED_SHIM), Cdouble, (Ptr{Cvoid},), p))
    end
end

# The rest of libxc-upstream/src/xc.h:37-75 that a caller has to be told about.
const XC_FLAGS_HAVE_EXC = 1 << 0
const XC_FLAGS_NEEDS_LAPLACIAN = 1 << 15
const XC_FLAGS_NEEDS_TAU = 1 << 16
const XC_FAMILY_TO_SYMBOL = Dict(1 => :lda, 2 => :gga, 4 => :mgga,
                                 128 => :lda, 32 => :gga, 64 => :mgga)
const XC_KIND_TO_SYMBOL = Dict(0 => :x, 1 => :c, 2 => :xc, 3 => :k)

"""
    pinned_identifier_facts(name) -> NamedTuple or nothing

What a caller has to know before it can call `name` at all: its family, its
kind, which arguments it reads, and whether it has an energy. `nothing` when
Libxc does not register `name`.

None of it is reliably in the name. `mgga_x_scanl` is deorbitalized SCAN,
which reads the Laplacian of the density instead of tau, and the name says
only "mgga"; the `_x_`/`_c_`/`_xc_` segment is a convention the library does
not enforce, and `p->info->kind` is what it answers from.

Two conventions are applied on the way out, both so that the result can drive
an array-based interface directly:

  * a hybrid comes back in its underlying family: `hyb_gga_xc_hse06` is
    `:gga`, because what a hybrid changes is the mixing, not which
    arguments its semi-local part reads. The mixing is `mixing_parameters`.
  * a meta-GGA that needs the Laplacian comes back as `:mggal` rather than
    `:mgga`, which is how `DftFunctionals.jl` spells that family.
"""
function pinned_identifier_facts(name::AbstractString)
    ensure_pinned_libxc()
    return with_pinned_functional(name) do p
        flags = Int(ccall((:lxs_flags, PINNED_SHIM), Cint, (Ptr{Cvoid},), p))
        family = Int(ccall((:lxs_family, PINNED_SHIM), Cint, (Ptr{Cvoid},), p))
        kind = Int(ccall((:lxs_kind, PINNED_SHIM), Cint, (Ptr{Cvoid},), p))
        needs_laplacian = (flags & XC_FLAGS_NEEDS_LAPLACIAN) != 0
        base = get(XC_FAMILY_TO_SYMBOL, family, nothing)
        base === nothing && error("pinned_identifier_facts: $name is in Libxc " *
                                  "family $family, which has no symbol here")
        return (family = base === :mgga && needs_laplacian ? :mggal : base,
                kind = XC_KIND_TO_SYMBOL[kind],
                has_exc = (flags & XC_FLAGS_HAVE_EXC) != 0,
                needs_tau = (flags & XC_FLAGS_NEEDS_TAU) != 0,
                needs_laplacian = needs_laplacian)
    end
end

# Libxc's flag bits, by the name it gives each one
# (libxc-upstream/src/xc.h:54-80). All twenty, not the five
# pinned_identifier_facts picks out, because a caller that wants to know
# whether a functional is marked development, or which dimensionality it is
# for, has nowhere else to ask.
const XC_FLAG_NAMES = [
    (1 << 0, :have_exc), (1 << 1, :have_vxc), (1 << 2, :have_fxc),
    (1 << 3, :have_kxc), (1 << 4, :have_lxc),
    (1 << 5, :dim1), (1 << 6, :dim2), (1 << 7, :dim3),
    (1 << 8, :hyb_cam), (1 << 9, :hyb_camy), (1 << 10, :vv10),
    (1 << 11, :hyb_lc), (1 << 12, :hyb_lcy),
    (1 << 13, :stable), (1 << 14, :development),
    (1 << 15, :needs_laplacian), (1 << 16, :needs_tau),
    (1 << 17, :enforce_fhc), (1 << 18, :on_device), (1 << 19, :on_host),
]

"""
    libxc_derivative_orders(name) -> Vector{Int} or nothing

The derivative orders Libxc provides for `name`, from
[`libxc_flag_bits`](@ref)'s `XC_FLAGS_HAVE_*` bits.
"""
function libxc_derivative_orders(name::AbstractString)
    bits = libxc_flag_bits(name)
    bits === nothing && return nothing
    return Int[i - 1 for (i, bit) in enumerate((1 << 0, 1 << 1, 1 << 2,
                                                1 << 3, 1 << 4))
               if (bits & bit) != 0]
end

"""
    pinned_identifier_text(name) -> NamedTuple or nothing

What Libxc carries about `name` beyond its arithmetic: the sentence naming
it, its full flag set, the derivative orders the library itself provides, and
the papers it asks to be cited. `nothing` when Libxc does not register
`name`.

The citations have no second source. Libxc's SymPy sources carry the
mathematics and not the bibliography, so a package generated from them has no
way to know what to cite; this reads the four fields Libxc stores per
reference (`ref`, `doi`, `bibtex`, `key`, `libxc-upstream/src/xc.h:166`) out of the pinned
build. Measured over the corpus: 834 references across 687 identifiers, at
most five for one functional.

`derivatives` is what Libxc provides, from the `XC_FLAGS_HAVE_*` bits of a
`MAXORDER=4` build (see [`PINNED_LIB_ORDER4`](@ref): the default build's bits
report the build and not the functional). It is not a statement about this
package: here a derivative comes from the caller's AD over one expression and
has no order limit. For a potential-only
functional the list starts at 1: Libxc provides its potential and its kernel
and no zeroth order, and that absence is what makes those functionals
special: more legible here than in a flag name. Written as "gets an empty
list" first, which the suite refuted.
"""
function pinned_identifier_text(name::AbstractString)
    ensure_pinned_libxc()
    return with_pinned_functional(name) do p
        info = ccall((:xc_func_get_info, PINNED_LIB), Ptr{Cvoid}, (Ptr{Cvoid},), p)
        label = unsafe_string(ccall((:xc_func_info_get_name, PINNED_LIB), Cstring,
                                    (Ptr{Cvoid},), info))
        # Both the flags and the orders come from the MAXORDER=4 build, not
        # from the default one: its XC_FLAGS_HAVE_KXC and _LXC are defined to
        # 0 (util.h:146-152), so read there, have_kxc and have_lxc are absent
        # for every functional in the corpus. See PINNED_LIB_ORDER4.
        bits = libxc_flag_bits(name)
        flags = Symbol[sym for (bit, sym) in XC_FLAG_NAMES if (bits & bit) != 0]
        orders = Int[i - 1 for (i, bit) in enumerate((1 << 0, 1 << 1, 1 << 2,
                                                      1 << 3, 1 << 4))
                     if (bits & bit) != 0]
        refs = NamedTuple{(:reference, :doi, :bibtex, :key),
                          NTuple{4,String}}[]
        # XC_MAX_REFERENCES is 5; the array is NULL-terminated in practice.
        for i in 0:4
            r = ccall((:xc_func_info_get_references, PINNED_LIB), Ptr{Cvoid},
                      (Ptr{Cvoid}, Cint), info, i)
            r == C_NULL && break
            push!(refs, (
                reference = unsafe_string(ccall((:xc_func_reference_get_ref, PINNED_LIB),
                                                Cstring, (Ptr{Cvoid},), r)),
                doi = unsafe_string(ccall((:xc_func_reference_get_doi, PINNED_LIB),
                                          Cstring, (Ptr{Cvoid},), r)),
                bibtex = unsafe_string(ccall((:xc_func_reference_get_bibtex, PINNED_LIB),
                                             Cstring, (Ptr{Cvoid},), r)),
                key = unsafe_string(ccall((:xc_func_reference_get_key, PINNED_LIB),
                                          Cstring, (Ptr{Cvoid},), r))))
        end
        return (name = label, flags = flags, derivatives = orders, references = refs)
    end
end

"""
    variant_names(name) -> Vector{String}

The registered functionals named `<name>_1`, `<name>_2`, ... when `name`
itself is not registered, and empty otherwise.

Some Python sources are not functionals but kernels shared by numbered
variants: `lda_c_epc18` stands for `XC_LDA_C_EPC18_1` and `_2`
(`lda_c_epc18.c:11-12`), `lda_xc_1d_ehwlrg` for three
(`lda_xc_1d_ehwlrg.c:13-15`). Such a name has no functional of its own to
ask, but its variants do.
"""
function variant_names(name::AbstractString)
    ensure_pinned_libxc()
    registered(n) = ccall((:xc_functional_get_number, PINNED_LIB),
                          Cint, (Cstring,), n) >= 0
    registered(name) && return String[]
    out = String[]
    i = 1
    while registered("$(name)_$i")
        push!(out, "$(name)_$i")
        i += 1
    end
    return out
end

"""
    libxc_thresholds(name) -> NamedTuple or nothing

Libxc's own `dens_threshold` and `zeta_threshold` for a functional, read
from the library built from the pinned tree.

They are not interchangeable constants: `zeta_threshold` is `DBL_EPSILON`
for every functional (`libxc-upstream/src/functionals.c:366`), but
`dens_threshold` is per functional (`functionals.c:359` reads it from the
functional's own info struct): 1e-15 for `lda_x`, 1e-24 for
`lda_c_wigner`, 1e-12 for `gga_x_pbepow`, 1e-32 for `lda_c_rpaf`.

For a name that is a shared kernel rather than a functional, the variants
are asked instead, and only if they agree. Their parameters differ: that
is what the variants are for, and why those stay required, but the
thresholds are the same, so they are well defined and worth having.

Read through the C shim rather than by mirroring the struct in Julia: these
fields have setters and no getters, and a mirrored layout is version
specific in exactly the way this reads against.
"""
function libxc_thresholds(name::AbstractString)
    ensure_pinned_libxc()
    direct = _thresholds_of(name)
    direct === nothing || return direct

    variants = variant_names(name)
    isempty(variants) && return nothing
    values = [_thresholds_of(v) for v in variants]
    any(isnothing, values) && return nothing
    # Checked rather than taking the first: variants that disagreed on a
    # threshold would be a question to answer, not one to answer by accident.
    allequal(values) || error(
        "variants of $name disagree on their thresholds: " *
        join(("$v => $t" for (v, t) in zip(variants, values)), ", "))
    return first(values)
end

function _thresholds_of(name::AbstractString)
    return with_pinned_functional(name) do p
        (dens_threshold = ccall((:lxs_dens_threshold, PINNED_SHIM), Cdouble,
                                (Ptr{Cvoid},), p),
         zeta_threshold = ccall((:lxs_zeta_threshold, PINNED_SHIM), Cdouble,
                                (Ptr{Cvoid},), p))
    end
end

"""
    GENERATION_SKIPS

`(family, name) => reason` for functionals this pipeline deliberately does not
generate. A batch run reports them as `:skipped`, carrying the reason.

Without this the driver regenerated them on every run and the static audit
test in `test/runtests.jl` was the only thing keeping them out of a green
build: a deliberate non-goal being caught as though it were a mistake, once
per batch. Recording the decision here instead makes it survive in the
manifest, where it is visible without reading the generator.
"""
const GENERATION_SKIPS = Dict(
    ("lda_exc", "lda_x_1d_exponential") =>
        "int1/int2 are runtime numerical quadrature (xc_integrate, " *
        "libxc-upstream/src/lda_x_1d_exponential.c:32), not a closed form; supporting it needs a " *
        "quadrature layer this package does not have",
    ("lda_exc", "lda_x_1d_soft") =>
        "int1/int2 are runtime numerical quadrature (xc_integrate), not a closed " *
        "form; the derivative path additionally needs Bessel K0/K1",
    ("gga_exc", "gga_x_fd_lb94") =>
        "fd_int0/fd_int1 are runtime numerical quadrature (xc_integrate, " *
        "python/gga_exc/gga_x_fd_lb94.py:15) rather than a closed form, and the " *
        "integrand depends on the beta parameter, which libxc's C path injects " *
        "through the `replace:` directives in that file's header: directives " *
        "this generator does not read, so the call it emits has nowhere to get " *
        "beta from",
)

"""
    SHIPPING_HOLDS

Functionals that generate successfully but are deliberately not shipped, and
why. Being held back is a decision about the package rather than something a
generation run can observe, which is why it lives here next to
`GENERATION_SKIPS` and is reconciled into the manifest by `write_manifest`,
as `held_back` and `held_back_reason` beside the generation outcome. Without
it the manifest would claim a functional the package does not contain; in
place of the outcome it would lose what a released hold goes back to.

Their generated files are kept under `gen/held-back/`, outside the directory
the package includes, so that nothing loads them and a refresh does not treat
them as shipped.

The one file there, `hyb_gga_xc_case21.jl`, is not what the generator as it
now stands produces. The printer
refuses a name it has no Julia spelling for, and that functional's body calls
`cbspline`/`xbspline`, so the current generator cannot reproduce the file: it
fails before writing one. The file is kept because it is what the hold is a
hold on, and tracked so that it does not look like a stray; it is not output
this pipeline can regenerate, and a release of the hold means generating
afresh once those two names resolve.
"""
const SHIPPING_HOLDS = Dict(
    # params_struct_fields keeps a field's shape now,
    # so a two-dimensional `double b[2][5]` is named params_a_b_0__0 ... the
    # way the expression asks for it rather than flattened to params_a_b_0
    # ... params_a_b_9. lda_xc_ksdt was held for exactly that mismatch.
    # gga_x_n12 was held with the reason "the 16 params_a_CC_i__j have no
    # default in the upstream source". That was wrong: the values are in
    # the pinned library and read out fine (params_a_CC_0 ... _15 with
    # values). What was missing was the two-dimensional naming, the same as
    # lda_xc_ksdt: `double CC[4][4]`.
    ("gga_exc", "hyb_gga_xc_case21") =>
        "demands array parameters with no upstream default, and its generated " *
        "body references cbspline/xbspline, which the generator does not resolve",
    # Reach a Libxc special function this package has not ported yet. The
    # name resolves nowhere, so calling one raises an UndefVarError rather
    # than returning a wrong number.
    # They were held as "disagrees with the pinned library by 36 %" and "by up
    # to 4.7 %", and that reason named the wrong library: measured against the
    # pinned 7.1.2 they were generated from, both agree to 5e-16 at the
    # densities the test suite uses. The 36 % and the 4.7 % are against the
    # 7.0.0 that Libxc.jl vendors, which is where the comparison ran: upstream
    # changed both functionals between the two versions, the same way it
    # changed gga_c_wi and gga_c_sg4.
    #
    # A hold's reason has to name which library it was measured against.
)

# Inside the suite's second tolerance tier.
# mgga_c_kcis (2.4e-8 at the lowest density checked, 1e-13 at the highest),
# mgga_c_kcisk (1.6e-8) and gga_x_beefvdw (7e-10) agree to 1e-13 at ordinary
# densities and lose eight digits by rs ~ 3, which is cancellation in a long
# expression rather than a wrong one. Each is named in that tier with its
# measured worst case, so the looser bound applies to those three and to
# nothing else.

"""
    generate_family(family, argnames; names, timeout_s, runner) -> Vector{GenerationResult}

Batch-run `runner` over every name in `names` (by default every functional
`discover_functional_names` finds), recording each outcome instead of letting
one bad functional abort the batch: the point of a batch run across a family
is to catalog which failure modes actually occur and how often. Names listed
in `GENERATION_SKIPS` are reported as `:skipped` without being attempted.

`runner` is injectable so the driver's own bookkeeping can be tested without
running a real generation; the default runs each functional in its own
process. Passing `manifest_path` records each result as it is produced.

`parallel` is how many run at once. It defaults to 1 because a maintainer
running this by hand should not have every core taken without asking; a sweep
over a whole family is where raising it pays, 129 `gga_exc` functionals at
20-70 s each being one to two hours in sequence. Anything the runner throws (rather than reports) is caught here and
recorded as `:failed`, so a failure to even spawn cannot take the batch down
either.
"""
function generate_family(family::AbstractString, argnames::Vector{String};
                          names::Vector{String}=discover_functional_names(family),
                          timeout_s::Real=DEFAULT_TIMEOUT_S,
                          runner=generate_one_subprocess,
                          parallel::Integer=1,
                          manifest_path::Union{Nothing,AbstractString}=nothing)
    parallel >= 1 || throw(ArgumentError("parallel must be at least 1, got $parallel"))
    manifest_lock = ReentrantLock()

    # Each functional is a separate process that spends its time inside SymPy,
    # so they overlap without contending; run_with_timeout waits on a Timer
    # rather than blocking, which is what lets these tasks interleave at all.
    results = asyncmap(names; ntasks=parallel) do name
        reason = get(GENERATION_SKIPS, (String(family), String(name)), nothing)
        result = if reason !== nothing
            # Skipped means never attempted, not attempted and discarded. It
            # still has to be recorded: a skip leaves no file behind, so the
            # manifest is the only place the decision can be read back from.
            GenerationResult(family, name, :skipped, 0.0, reason)
        else
            try
                runner(family, name, argnames; timeout_s=timeout_s)
            catch e
                GenerationResult(family, name, :failed, 0.0, sprint(showerror, e))
            end
        end

        lock(manifest_lock) do
            if result.status === :skipped
                println("  [skipped] $family/$name: $reason")
            else
                println("  [$(result.status)] $family/$name " *
                        "($(round(result.elapsed_s; digits=1)) s)")
            end
            # Julia block-buffers stdout when it is a file, so without this a
            # redirected sweep shows nothing for its whole run.
            flush(stdout)
            # Written per functional, not once at the end: a family sweep runs
            # for tens of minutes, and an interrupted one must leave behind
            # what it already finished. Under the lock because concurrent runs
            # would otherwise interleave reads and writes of the same file.
            manifest_path === nothing || write_manifest([result]; path=manifest_path)
        end
        return result
    end

    # asyncmap preserves input order, so a run stays comparable to the one
    # before it however the tasks happened to finish.
    return collect(results)
end


"""
    shipped_names(family) -> Vector{String}

The functionals `src/generated/<family>/` already holds, sorted.

This is what a plain rerun regenerates. It is not the same as the family: a
family ships only some of its upstream sources (`gga_exc` has 129 of them), and
refreshing the manifest must not silently become a sweep of all of them.
Attempting the whole family is `--all`, which is a decision, not a default.
"""
function shipped_names(family::AbstractString)
    dir = joinpath(GENERATED_DIR, family)
    isdir(dir) || return String[]
    return sort([splitext(f)[1] for f in readdir(dir) if endswith(f, ".jl")])
end

"""
    FAMILY_ARGNAMES

Libxc's own reduced variables per family, in the order the generated functions
take them. These are not `(rho, sigma)`: the variable-preparation layer that
Libxc's `work_lda.c`/`work_gga.c` drivers perform is not ported (see
gen/README.md), and the conversion lives in the test suite instead.

Per-family is an assumption, not a law: `lda_xc_ksdt` takes a reduced
temperature `t` on top of `rs`/`z`, which is why the manifest records the
argument order per functional.
"""
const FAMILY_ARGNAMES = Dict(
    "lda_exc" => ["rs", "z"],
    "gga_exc" => ["rs", "z", "xt", "xs0", "xs1"],
    # Upstream spells the last four us0/us1/ts0/ts1 in some files and
    # u0/u1/t0/t1 in others; they are passed positionally, so the names here
    # are the ones `mgga_variables` returns.
    "mgga_exc" => ["rs", "z", "xt", "xs0", "xs1", "u0", "u1", "t0", "t1"],
    # The potential-only families take the same reduced variables as their
    # energy counterparts; what differs is what the kernel returns, not what
    # it is handed.
    "lda_vxc" => ["rs", "z"],
    "gga_vxc" => ["rs", "z", "xt", "xs0", "xs1"],
    "mgga_vxc" => ["rs", "z", "xt", "xs0", "xs1", "u0", "u1", "t0", "t1"],
)

function print_summary(results::Vector{GenerationResult})
    println("\n=== summary ===")
    for status in (:ok, :skipped, :failed, :timeout)
        n = count(r -> r.status === status, results)
        n == 0 || println("  $status: $n")
    end
    # Skips are a decision and are already counted above; what a run has to
    # put in front of the maintainer is what went wrong.
    for r in results
        (r.status === :failed || r.status === :timeout) || continue
        println("  [$(r.status)] $(r.family)/$(r.name): $(first(r.message, 200))")
    end
    return nothing
end

"""
    main(args)

Regenerate functionals and record the run in the manifest.

    julia --project=. generate.jl                  # refresh what is shipped
    julia --project=. generate.jl lda_exc          # ... for one family
    julia --project=. generate.jl lda_exc --all    # attempt every lda_exc functional
    julia --project=. generate.jl gga_exc --all --parallel 12   # ... 12 at a time

The default is a refresh, so that rerunning this is a way to check that the
shipped files still regenerate identically from the pinned upstream commit,
not a way to accidentally start a sweep.
"""
function main(args::Vector{String}=String[])
    setup_python_path!()
    # Up front, so a long build happens where it is expected rather than
    # inside the first threshold lookup.
    build_pinned_libxc()

    all_mode = "--all" in args
    # --parallel N: how many functionals to generate at once. Left at 1
    # unless asked, so running this by hand does not quietly take every core.
    pidx = findfirst(a -> a == "--parallel", args)
    parallel = pidx === nothing ? 1 : parse(Int, args[pidx + 1])
    families = filter(a -> !(a in ("--all", "--parallel")) && !(pidx !== nothing && a == args[pidx + 1]), args)
    isempty(families) && (families = sort(collect(keys(FAMILY_ARGNAMES))))

    results = GenerationResult[]
    for family in families
        haskey(FAMILY_ARGNAMES, family) ||
            error("no argument names known for family $family; add it to FAMILY_ARGNAMES")
        names = all_mode ? discover_functional_names(family) : shipped_names(family)
        if isempty(names)
            println("=== $family: nothing shipped yet, skipping (use --all to sweep) ===")
            continue
        end
        println("=== $family ($(length(names)) functionals) ===")
        append!(results, generate_family(family, FAMILY_ARGNAMES[family];
                                         names=names, parallel=parallel,
                                         manifest_path=MANIFEST_PATH))
    end

    print_summary(results)

    # The mixes last, and in a process of its own: what goes into them is
    # checked against the kernels as they now stand on disk, so it has to
    # load the corpus this run just wrote rather than the one loaded before
    # it started.
    println("\n=== mixes ===")
    mixes = joinpath(HERE, "generate_mixes.jl")
    try
        run(`$(Base.julia_cmd()) --project=$HERE $mixes`)
    catch err
        println("mixes step failed: ", first(sprint(showerror, err), 200))
        println("re-run it on its own with: julia --project=. generate_mixes.jl")
    end

    println("\nmanifest: ", MANIFEST_PATH)
    return results
end

if abspath(PROGRAM_FILE) == @__FILE__
    main(String[ARGS...])
end
