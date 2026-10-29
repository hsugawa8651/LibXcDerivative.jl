# gen/: maintainer-only generation tooling

This directory is tracked, so installing the package from this repository
brings it along, but nothing in it is loaded: the package reads `src/` and its
extensions only, and `gen/` has an environment of its own whose dependencies
are not the package's. It exists so a maintainer can regenerate
`src/generated/` from Libxc's own Python/SymPy sources, which are read from
the pinned tree in `gen/libxc-upstream`. That directory is ignored by git, so
an installed copy has these scripts without the sources they read.

## Workflow

1. Put Libxc's sources in `gen/libxc-upstream` at the commit you want to pick
   up. The directory is ignored by git, so this is a plain clone, and the
   commit the shipped files came from is `upstream_commit` in
   `src/generated/manifest.toml`.
   ```
   git clone https://gitlab.com/libxc/libxc.git gen/libxc-upstream
   git -C gen/libxc-upstream checkout <the-commit>
   ```
2. From `gen/`, with its own environment (kept separate from the package's own
   `Project.toml` specifically so `SymPy.jl`'s older `Symbolics` compat bound
   never holds back the *package's* `Symbolics` version):
   ```
   cd gen
   julia --project=. generate.jl                # refresh what is shipped
   julia --project=. generate.jl lda_exc        # ... for one family
   julia --project=. generate.jl lda_exc --all  # ... attempting every one
   julia --project=. generate_mixes.jl          # ... only the mixes, again
   ```
   A full refresh ends by running `generate_mixes.jl` itself, in a process of
   its own: Libxc evaluates 164 of its identifiers by mixing others, and the
   154 whose components are all present and which reproduce the pinned
   library are written to `src/generated/mixes.jl` as the weighted sum of
   them. It also writes the two tables beside them:
   `mixing_parameters.jl`, what Libxc keeps on `xc_func_type` rather than in
   a kernel, and `identifier_facts.jl`, which family and kind a functional is
   in and which arguments it reads. A process of its own
   is the point: the recipes are checked against the kernels as they now
   stand on disk, so that step has to load the corpus the run just wrote.
   Running it alone is for when only the mixes need redoing.
   The default is a refresh, not a sweep, so that rerunning this asks whether
   the shipped files still come out of the pinned upstream commit unchanged.
   They do, byte for byte: generation is reproducible now that the child
   runs with `PYTHONHASHSEED` fixed. Every run records what it produced in
   `src/generated/manifest.toml`, per functional as it goes.
3. Review the diff under `src/generated/`, run the test suite (`cd .. &&
   julia --project=test test/runtests.jl`) and the generator's own unit
   tests (`julia --project=. test_generate.jl`), and commit the
   regenerated files. Nothing else records which commit they came from:
   `src/generated/manifest.toml` and `src/generated/source_version.jl` are
   written by the run, and `test/manifest.jl` fails if the two disagree.

   **Gotcha, and it will be hit by any batch that adds functionals**: a
   *brand-new* `src/generated/<family>/<name>.jl` file does not invalidate
   the precompilation cache. `src/LibXcDerivative.jl` discovers files with
   `readdir` at load time, so adding one changes no source Julia hashes;
   the cache stays valid and the new functional is simply not included.
   `using LibXcDerivative` succeeds, `isdefined(LibXcDerivative, :the_new_one)`
   is false, and it is missing from `names(LibXcDerivative)`: with no error
   at any point.

   The symptom is an `UndefVarError` from the test suite that looks like a
   generation bug and is not. Note this is a *different* failure from the one
   described under the static audit below: there, the file is included and a
   name inside it does not resolve; here the file is never included at all.

   `touch src/LibXcDerivative.jl` does **not** fix it: Julia 1.11 checks
   content, not mtime. What works:

   - remove the package's entry under the first depot's `compiled/<version>`
     directory (`Base.DEPOT_PATH[1]`), or
   - `Base.compilecache(Base.identify_package("LibXcDerivative"))`, or
   - running the tests with `--compiled-modules=no`.

## What `generate.jl` actually does

For each `python/<family>/<name>.py`:
1. Imports it via `PyCall`, calls its top-level `f(...)` with fresh SymPy
   symbols.
2. **Deep-inlines** the result via `libxc_codegen._deep_inline`. This step is
   required: Libxc's `@helper` decorator is a *lazy, differentiable-Function
   proxy* (see `python/libxc_codegen.py:helper`), not eager arithmetic, so
   calling `f(...)` alone leaves helper calls unexpanded (e.g.
   `f_lda_x(rs, z)`).
   `_deep_inline` is the same flattening `maple_eval`/`maple_taylor` use
   internally, and it is what actually resolves everything (including any
   `maple_series`/`_ts_build` Taylor-series machinery) down to plain arithmetic
   plus `my_piecewise3`/`my_piecewise5` guards.
3. Substitutes Libxc's precomputed numeric constants (`M_CBRT3`,
   `M_CBRTPI`, ...; see `LIBXC_NUMERIC_CONSTANTS` and
   `libxc-upstream/src/util.h`'s `#define`s; grow this table as new
   constants are hit).
4. Splits the result into temporaries with `sympy.cse` (`cse_decompose`). Not an
   optimization: `_deep_inline` copies a helper's body into every call site, so
   on `lda_c_pk09` the flattened tree is 73,946 operations standing for 452
   distinct subexpressions, and each of those copies would otherwise be written
   into the kernel. Libxc's own C output has temporaries for the same reason:
   Maple's code generator emits them.
5. **Prints** each temporary and the reduced body as Julia source with
   `gen/julia_printer.py`, a `sympy.printing.julia.JuliaCodePrinter` subclass.
   This is where three things are decided, and they are what the subclass is
   for: `sqrt`/`log` and non-integer powers go to their `NaNMath` equivalents
   (so a kernel returns NaN outside a function's domain, as the C library does,
   rather than throwing Julia's `DomainError`); Libxc's own function names are
   printed from a map keyed on the function classes the expression actually
   holds (`atoms(Function)`, resolved by `printer_for`, where an unlisted name
   raises at generation time rather than reaching a kernel that would fail with
   `UndefVarError` on its first call); and a constant too wide for an `Int128`
   is rounded to a `Float64`, once, from the exact value, so that no kernel
   carries `BigInt` arithmetic.
6. Writes the statements, named via
   `const <name>_energy = function (...) ... end`, into
   `src/generated/<family>/<name>.jl`.

   Steps 5–6 once went through `SymPy.jl`'s `sympy_to_symbolics` bridge and
   `Symbolics.build_function`. The printer replaced that round
   trip after all 270 shipped kernels were checked to agree numerically through
   both paths; the round trip is also what `gga_xc_b97` could not survive (see
   "Known gaps").

## Known gaps

Every upstream source is accounted for: 287 of them, 283 generated, 3
skipped as runtime quadrature, 1 failing. By family, `lda_exc` 43 of 45 with
2 skipped, `gga_exc` 127 of 129 with 1 skipped and 1 failing, `mgga_exc` 109
of 109, and the three potential-only families 4 of 4.

- **The batch driver covers every family.** For `lda_exc`: 43 generated and
  2 skipped, against 45 upstream sources. `generate_family` runs each
  functional in its own process (`gen/generate_one.jl`) under a wall-clock
  budget
  (`DEFAULT_TIMEOUT_S`, 600 s), reports `:ok`/`:skipped`/`:failed`/`:timeout`
  per functional, and writes `src/generated/manifest.toml` as it goes. The
  two functionals that cannot be expressed as pure arithmetic:
  `lda_x_1d_exponential` and `lda_x_1d_soft`, whose `int1`/`int2` Libxc's own
  `REPLACE` directives turn into `xc_integrate(func1, NULL, ...)`, runtime
  numerical quadrature (`libxc-upstream/src/lda_x_1d_exponential.c:32`)
  rather than a closed form: are named in `GENERATION_SKIPS` with that
  reason, so they are not regenerated on every run and are left for the
  static audit test to catch.

  A budget cannot be enforced in-process here: generation blocks inside a
  PyCall `ccall`, which stalls Julia's scheduler outright: an
  `InterruptException` delivered to the task is not acted on, and a watchdog
  task polling `istaskdone` does not run until the call returns on its own.
  More threads would let a watchdog observe an
  overrun but not cancel it. A separate process, killed, is the only thing
  that reclaims the time. The cost is a fresh PyCall and SymPy import per
  functional, measured at 13 s.

  Two things this makes visible:

  - **Generation is reproducible only with Python's hash seed fixed.**
    Without it, regenerating the shipped set changes one file
    (`lda_c_vwn`) with an unchanged signature and unchanged arithmetic:
    `sympy.cse` numbers and orders its temporaries differently, because
    Python randomizes hash order per process and `cse` iterates over sets.
    Four unseeded runs produced two distinct files; two runs with
    `PYTHONHASHSEED=0` produced identical ones. The child runs with the
    seed fixed, and the shipped files regenerate byte for byte.
  - **A timeout is not evidence that a functional is pathological.** Six
    functionals timed out in one run and passed in 17-52 s on retry, with
    the functional generating just before them taking 578 s against its
    usual 20 s: a loaded machine rather than a hard case. The manifest's
    `elapsed_s` is what tells the two apart.

- **`lda_xc_ksdt` does not generate, and not for the reason `lda_c_pk09` did
  not.** It spends its whole 600 s budget on itself rather than losing it
  to machine load. It is deliberately *not*
  on the skip-list: a skip records a decision not to support something, and
  this is an unexplained defect. Leaving it as a `timeout` in the manifest
  also means a future improvement to the pipeline would simply start passing
  it, where a skip-list entry would hide that.

  Measured, so a next attempt does not start from scratch: the
  expression is small at every stage: 1,696 tree operations whole, 60 CSE
  temporaries of at most 11 operations each, a post-CSE body of 141
  operations and 1,968 characters, and all 60 temporaries convert through
  `sympy_to_symbolics` in about 15 s together. It is the final conversion of
  that 1,968-character body that does not complete, exhausting memory rather
  than merely running long. So this is not the size explosion CSE was
  introduced for, and the cause is unidentified. What that body has that a
  working functional's does not, and so where to look next: nested
  `my_piecewise3` guards inside `xc_log1p`/`xc_expm1`, `zeta_threshold`
  raised to a symbolic exponent, and roughly a hundred distinct free symbols
  (60 temporaries plus 38 parameters) appearing in products of sums.
  `tanh`, which the source makes look like the missing piece, is never
  reached.
- The `rs`/`z` (and, for GGA, `xt`/`xs0`/`xs1`) variables are Libxc's own
  internal reduced variables, not raw `(rho, sigma)`. The
  `work_lda.c`/`work_gga.c`-equivalent conversion **is** ported, as
  `lda_variables`/`gga_variables` in `src/variables.jl` (transcribed from
  `libxc_codegen.py:4350-4389`), and the test suite calls it rather than
  keeping its own copy, which also means every Libxc cross-check now
  validates that layer end to end, since Libxc computes from the density
  itself.

  Above it, each generated file also carries a named entry point:
  `lda_x(rho)`, `gga_x_pbe(rho, sigma)`, and their spin-resolved methods:
  with `<name>_defaults` holding the thresholds Libxc itself uses for that
  functional. The entry point reads every argument by name, so the kernel's
  positional order is closed over at generation time and never reaches a
  caller. Overrides go through `resolve_params`, which refuses a name the
  functional does not have: `merge` would otherwise accept a misspelling
  silently, leave the default in force, and discard the caller's value.

  Two things this had to get right that are not obvious from the kernels:

  - **The dimension is part of the definition.** `rs` and the reduced
    gradient both depend on it (RS_FACTOR is 1/2 in 1D, 1/sqrt(pi) in 2D,
    (3/(4pi))^(1/3) in 3D), and six of the functionals here are not
    three-dimensional. Assuming 3 does not fail loudly: it returns a
    plausible number that answers a different question, which is how it was
    caught: `lda_c_2d_amgb` disagreed with Libxc in the third digit. The
    generator reads each functional's dimension the same way Libxc does
    (`libxc_codegen._detect_dimension`) and emits it into the call.
  - **`dens_threshold` is per functional**, and not by a little: 1e-15 for
    `lda_x`, 1e-24 for `lda_c_wigner`, 1e-12 for `gga_x_pbepow`. Only
    `zeta_threshold` is universal (DBL_EPSILON).

  The `params_a_*` defaults are read out of the pinned library's own
  parameter tables: of the 723 entry points
  with a `_defaults` table, 402 carry parameter defaults and 35 still demand
  a parameter by name, which `<name>_required` states and the manifest
  records.

- **`gga_x_wpbeh` is generated, and what it took is worth keeping.** Four
  budgets ended in a kill (600 s, 901 s, 1802 s and four CPU hours). The cause
  was in `libxc_codegen` rather than in the functional: `Helper.__init__`
  differentiates every helper body eagerly to fourth order, which the C path
  needs because it emits a function per multi-index and this path throws away,
  and the omega-PBE hole's series is a body of 1053662 operations. With the
  table made lazy (`patch_libxc_codegen!`) the kernel comes out in 832 s,
  twice, byte identical, and agrees with the pinned library to 3.2e-15. It
  holds six identifiers: HSE03, HSE06, HSE12, HSE12s, LC-wPBE and itself.

- **`hyb_gga_xc_case21` is the one source that does not generate.** Its body
  calls `cbspline`/`xbspline`, which have no Julia spelling, so the printer
  refuses it: the same refusal that `xc_erfcx` met until it was given one.
  The suite expects `failed` for this one hold by name.

- **`lda_c_1d_loos` computes a different function here than the library
  Libxc.jl vendors**: by a factor of four, with the value Libxc returns
  lying outside the range this kernel takes at all.

  This one is settled, and it is not a porting error. Transcribing
  `python/lda_exc/lda_c_1d_loos.py` by hand into Julia reproduces the
  generated kernel to ten significant digits at every density checked, and
  the pinned C driver agrees on the variable too: it calls the kernel with
  `0.5/na` (`maple2c/lda_exc/lda_c_1d_loos.c:189`), which is what
  `lda_variables` gives in one dimension. The pinned tree and the vendored
  library simply compute different functions here, and this package follows
  the pinned tree. The hand transcription is kept as the oracle for it in
  `test/generated_lda.jl`, rather than dropping the functional from the checks.

- **A helper's argument can substitute through its own other argument,
  and did.** `_deep_inline` replaces a helper's formal parameters *by name*,
  and those formals are named after the natural variables (`rs`, `z`,
  `xt`), which are exactly the names a caller reaches for. `lda_c_pk09`'s
  `alpha_z` computes

      2 / (opz_pow_n(z, ss(rs, z)) + opz_pow_n(-z, ss(rs, z)))

  and inlining the second call replaced the formal `z` with `-z`
  throughout, including inside `ss(rs, z)`. The exponent silently became
  `ss(rs, -z)`: the kernel returned exactly `(1-z)^ss(rs,-z)`, which is
  exact at z=0, wrong by 2.6e-5 at z=0.2 and by 3.4e-2 at z=0.98.

  Libxc's own codegen never meets this because it substitutes densities
  first: `f(RS_FACTOR/(na+nb)^(1/3), (na-nb)/(na+nb))` contains no symbol
  named `z`. `resolve_functional` builds its argument symbols under
  `ARG_PREFIX` and renames them back once the helpers are inlined, which
  buys the same immunity while keeping `(rs, z)` as the kernel's arguments.

  **Why the cheap checks cannot see it.** The substitution is exact at
  z=0, so no unpolarized comparison reaches it. Comparing the generated
  kernel against the pinned SymPy expression does not reach it either:
  both sides come through the same inlining, so they agree with each other
  whether or not the inlining is right. Only a version-matched library
  finds it; reasoning from the sources, however careful, cannot.

  A scan of every functional callable from a density, 360 comparisons over
  three densities and six polarizations against the pinned 7.1.2, agrees to
  1.7e-13. `lda_x_rel` and `lda_c_1d_loos` remain genuine version
  differences, where this package matches 7.1.2 and Libxc.jl's 7.0.0 does
  not.

- **Build the pinned library rather than reasoning about the vendored
  one.** `Libxc.jl` vendors 7.0.0 against the pinned tree's 7.1.2, which is
  why
  five functionals are missing from it and three disagree. The pinned tree
  builds out of the box with CMake and needs no Python codegen: the
  generated C kernels are committed, so a version-matched oracle is roughly
  ten minutes of work.

  It is worth more than settling arguments. Every default this package bakes
  in is currently read from 7.0.0 while the expressions come from 7.1.2, so
  the numbers and the formulas they belong to come from different versions.

- `dens_threshold`/`zeta_threshold`/`params_a_*` are left as plain, *sorted-
  alphabetically* positional function arguments; a real interface should
  default them to Libxc's documented per-functional values rather than
  requiring the caller to supply every one explicitly, and should not rely
  on callers getting a bare positional order right. What that costs is
  silence: a reorder at generation time, such as `params_a_alpha` and
  `zeta_threshold` swapping places, leaves a caller written against the old
  order computing a wrong value rather than erroring. The suite goes through
  a keyword-argument wrapper per generated functional for that reason; the
  positional interface itself is unchanged.
- `my_piecewise3`/`my_piecewise5` and the `xc_log1p`/`xc_expm1` renamings
  cover what `lda_x`/`lda_c_pw` need. `gga_x_wpbeh`, with its
  `maple_series`/`_ts_build`-produced Taylor polynomials, is the heaviest
  case this pipeline takes; see the entry on it above.
- `ifelse`-based `my_piecewise3/5` evaluates both branches eagerly rather
  than C's short-circuiting `?:`. That is deliberate: a branch taken on a
  value does not survive being traced into straight-line code, so keeping the
  expression branch-free is what makes it usable by a compiler that sees only
  the trace. Nothing here has been run on a GPU or under such a compiler,
  though, so this is a property of the emitted expression and not a tested
  claim of support. Two halves, in both directions:
  for hand-written code combining `my_piecewise3/5` with `Base.sqrt`/
  `Base.log`, this genuinely throws `DomainError` on an untaken
  domain-restricted branch (`test/symbolic.jl`). For *generated* code
  specifically it does not, because no generated file holds
  `Base.sqrt`/`Base.log` or a non-integer `^`: `gen/julia_printer.py`
  prints `NaNMath.sqrt`/`NaNMath.log`/`NaNMath.pow`, which return `NaN`
  instead of throwing. Both halves are regression-tested over the shipped
  corpus (`test/generated_audit.jl`, "no generated file calls a bare Base
  function that throws" and "no generated file raises to a non-integer
  power").
  Neither half is reached by `lda_x`/`lda_c_pw`, whose branches are
  polynomial or `log1p` rather than `sqrt`/`log` of a possibly negative
  quantity.
- Generated functions are positional-only, with argument order following
  whatever `sort`/`natural_lt` produces at generation time (20+ arguments
  for `lda_c_pw`). That is brittle:
  a keyword- or struct-based public wrapper over the raw positional
  closure would remove the "silently wrong value on reorder" failure mode
  described above. Not implemented.
- **A generated file that references an undefined name loads, and fails
  only when it is called.** Julia resolves a global in a function body at
  call time, so a generated file naming a function the printer has no
  spelling for precompiles, loads, and appears in `names(LibXcDerivative)`
  exactly like a working one, then throws `UndefVarError` at whoever calls
  it. The static audit test described below is what turns that into a
  build-time failure. The `xc_*`-renamed functions in use beyond
  `log1p`/`expm1` are `xc_asinh` (`gga_k_thakkar.py`), `xc_x_minus_log1p`
  (`gga_x_chachiyo.py`), `xc_E1_scaled`/`xc_erfcx` (`gga_x_wpbeh.py`) and
  `xc_dilogarithm`.

- **Globals beyond `M_*` are discovered rather than tabulated.**
  `resolve_libxc_constants` substitutes `M_*` from the static table first,
  then `.evalf()`s any remaining free symbol that matches a `libxc_codegen`
  module attribute with no free symbols of its own: `X2S`, `XT2S`,
  `BETA_PBE`, `GAMMA_PBE`, `MU_GE`, `KAPPA_PBE`, and compounds like
  `X_FACTOR_C = 3*2**(1/3)*M_CBRT3/(4*M_CBRTPI)` that only become numeric
  after the `M_*` pass. `XC_EPSILON`/`XC_MIN` are the same kind of module
  attribute but evaluate to *themselves*, a placeholder rather than a
  number, so they are left as parameters.

- **The generator emits the reduced-variable kernel and nothing above it.**
  It does not reproduce Libxc's `rho`/`sigma` driver path: kernel cleaning,
  gradient folding and spin specialization at `libxc_codegen.py:4031-4078`.
  The `rho,sigma -> rs,z,xt,xs0,xs1` conversion lives in
  `src/variables.jl` instead, transcribed from
  `libxc_codegen.py:4350-4389`. Derivatives are not generated either: they
  are taken by automatic differentiation over the generated energy, which
  is why `vsigma` and the orders above it appear in `src/slots.jl` and the
  extensions rather than in `src/generated/`. The exception is the three
  potential-only families, where the upstream source is a potential to
  begin with.

- **What the piecewise translation leaves open is a silent `NaN`, not a
  crash.** The crash case is settled in both directions, in the bullet
  above: real for hand-written code that mixes `my_piecewise3/5` with
  `Base.sqrt`/`Base.log`, and unreachable for generated code, which holds
  no `Base.sqrt`/`Base.log` and no non-integer `^`. What nothing checks is
  a *selected* branch evaluating to `NaN`: a clamp Libxc relies on turning
  out to be insufficient, or a SymPy function that does not lower to a
  NaN-safe Julia equivalent the way `sqrt`, `log` and `^` do.
  `generate_functional` has no static check for either, and the printer's
  lowering is not audited function by function.

  The clamped-input pattern itself survives translation. `gga_x_pbepow` is
  the case that shows it: Libxc's own comments flag `pbepow_f0_large` as
  unstable for small s, and the surrounding `my_piecewise3` clamps that
  branch's argument with `m_max(s2, pbepow_s2_cut)` before calling it,
  `m_min`/`m_max` being plain `my_piecewise3` themselves
  (`libxc_codegen.py:427-432`). Against `Libxc.Functional(:gga_x_pbepow)`
  the kernel matches to `atol=1e-10` with sigma spanning the branch
  boundary, exactly at it, and far below it, down to sigma=1e-8. That
  instability is a precision-loss concern rather than a DomainError or
  `NaN` one: as s2 -> 0+ the expression tends to a finite limit of -1 in
  plain IEEE double arithmetic. So the pattern is confirmed for the milder
  failure mode, not for an unclamped `sqrt`/`log` of a possibly negative
  quantity; `gga_x_lb`'s `sqrt(m_max(...))` is clamped too, so it does not
  reach that one either.

## Common subexpression elimination (`cse_decompose`)

`_deep_inline` flattens Libxc's `@helper` boundaries away, and every call
site of a helper gets its own copy of that helper's body. Those boundaries
are not merely organisational: they are where a subexpression is shared,
and Libxc's own C output keeps the sharing because Maple's code generator
emits temporaries. Flattening without restoring it duplicates work
exponentially in the nesting depth.

`lda_c_pk09` is where this stopped being theoretical. Measured on it:

| | |
|---|---|
| `sympy.count_ops` (tree) | 73,946 |
| distinct subexpressions (DAG) | 452 |
| Julia-syntax string form | 762 KB |
| after `sympy.cse` | 61 temporaries + 264 operations |

`k_ud`'s expansion is reproduced across nine `Q_*` calls at roughly ten
occurrences each. Every stage up to and including `resolve_libxc_constants`
finishes in 43 s; `sympy_to_symbolics`: the SymPy -> Symbolics.jl bridge
this pipeline once went through: round-trips through that
762 KB string and does not return in any practical time. Note the failure mode:
generation does not raise, it simply never finishes, which `generate_family`'s
`try`/`catch` cannot detect. A batch driver over this pipeline needs a time
budget, not only exception handling.

`generate_functional` therefore calls `cse_decompose` *before* printing,
emits one statement per temporary in `sympy.cse`'s dependency order, and
assembles the pieces into one function body. The reason still holds now
that the printer has replaced the round trip, at a different cost: without
it, each copy of a helper's body would be printed into the kernel.

Printing each piece rather than converting it is what makes `lda_c_pk09`
cheap (51 s for the whole functional) and `gga_xc_b97` possible at all:
the round trip opened by comparing the expression against `SymPy.oo`, which
raised "Invalid NaN comparison" on that one. The printer makes no such
comparison, and generates it in 9 s.

Temporaries use the reserved prefix `cse_tmp_`; a functional whose own free
symbols already use it is rejected rather than silently shadowed.

Two consequences worth knowing:

- Generated files are a sequence of named temporaries followed by one
  expression rather than a single very long line, which is what makes a
  diff under `src/generated/` readable.
- The static audit test has to treat `cse_tmp_N = ...` as a local binding.
  It reports every temporary as an unresolved name if it does not, which is
  the intended behaviour.

With this in place `lda_c_pk09` generates in 69 s and matches
`Libxc.Functional(:lda_c_pk09)` to 6.5e-14. All 39 `lda_exc` and both
`gga_exc` functionals were regenerated in this form.

## The static audit test (`test/mixing.jl`, "every name a generated
## functional references resolves")

Because a generated file referencing an undefined global loads silently
(see the correction above), the test suite parses every
`src/generated/**/*.jl`, walks the resulting `Expr` for call heads, macro
names and bare references (minus what the function signature binds), and
requires each to resolve in `LibXcDerivative`: module-qualified names
like `NaNMath.pow` checked against their own module. It works on the
parsed source rather than by calling anything, so it needs no
per-functional argument values, which is what makes it usable ahead of the
keyword/default-parameter interface the generated positional closures
still lack.

This is the gate a batch run has to pass before its output is committed.
On the first `lda_exc` batch it flagged seven files and four distinct
missing names, three more than a `grep` for `xc_*` had found (`atan2`,
`erf`, and the `int1`/`int2` quadrature pair).

## Validated so far (functionals cross-checked against the real compiled
## Libxc C library via Libxc.jl, not just a hand-derived closed form;
## `my_piecewise3/5`'s own evaluation semantics checked directly)

- `lda_x_energy`: matches the closed-form unpolarized Dirac exchange energy
  density `-(3/(4*pi))*(9*pi/4)^(1/3)/rs` bit-for-bit, and matches
  `Libxc.Functional(:lda_x)` evaluated at rho in `[0.001, 10.0]` to
  `atol=1e-12`. Type-stable (`@inferred` passes). `ForwardDiff.derivative`
  agrees with central finite differences.
- `lda_c_pw_energy` (Perdew-Wang 1992 LDA correlation: the functional that
  surfaced the indexed-parameter and `xc_log1p` issues below): matches
  `Libxc.Functional(:lda_c_pw; n_spin=2)` to `atol=1e-12` across
  unpolarized and polarized (z=0.5) densities from rho=0.01 to rho=1.0.
  Type-stable, `ForwardDiff`-differentiable.
- Two issues only `lda_c_pw` (not `lda_x`) exposed, both fixed in
  `generate_functional`/`sanitize_indexed_params`:
  1. Libxc represents array-valued parameters (`params_a_pp`, one entry per
     PW92 spin channel) as plain `sympy.Symbol`s whose *name* literally
     contains `[i]` (e.g. `Symbol("params_a_pp[0]")`), not SymPy `Indexed`
     objects. `sympy_to_symbolics` round-tripped through the expression's
     Julia-syntax *string* form, where `params_a_pp[0]` is indistinguishable
     from Julia array-indexing syntax and the conversion failed
     (`BoundsError: attempt to access Num at index [0]`). Renamed to
     `params_a_pp_0` before conversion. The rename is still needed now that
     the expression is printed instead: a printer writes a symbol's name out
     as it stands, and `params_a_pp[0]` is not a Julia identifier.
  2. `xc_log1p`/`xc_expm1` (Libxc's own numerically-stable renamings of
     `log1p`/`expm1`) were unregistered; added as plain pass-through
     functions in `src/libxc_names.jl` (no custom derivative rule needed,
     unlike `my_piecewise3/5`: they differentiate exactly as `log1p`/
     `expm1` would).
- Four more names the `lda_exc` batch run needed, all added to
  `src/libxc_names.jl` and each cross-validated against Libxc.jl through a
  functional that uses it (`test/mixing.jl`, "functionals exercising the
  newly defined Libxc names match Libxc.jl", `atol=1e-12`):
  - `xc_asinh` -> `asinh` (`lda_x_rel`). Pass-through:
    `libxc-upstream/src/util.h:348` is literally
    `#define xc_asinh(x) asinh((double)(x))`, and
    `libxc_codegen.py`'s `fdiff` for it is `asinh`'s own derivative.
  - `xc_atanh` -> `atanh` (`lda_c_pk09`'s `Q_3ud`). Pass-through for the
    same reason; `fdiff` is `1/((1+y)*(1-y))`, which is `atanh`'s own
    derivative. Found by the static audit test after `lda_c_pk09` first
    generated: not by reading the source.
  - `atan2(y, x)` -> Julia's two-argument `atan(y, x)`, same argument order
    (`lda_x_yukawa`, `hyb_lda_xc_bn05`). SymPy's name, passed through by
    `libxc_codegen`.
  - `erf` -> `SpecialFunctions.erf` (`lda_x_erf`). This adds
    **SpecialFunctions.jl as a runtime dependency** of the package; the
    erfc/`xc_erfcx`/`xc_E1_scaled`/dilogarithm names still outstanding will
    come from there too.
  - `xc_x_minus_log1p` -> **not** a pass-through (`lda_k_zlp`,
    `lda_xc_zlp`). Libxc implements it as a real function
    (`libxc-upstream/src/util.c:39`) that switches to the Taylor series
    `sum_{k>=2} (-1)^k x^k / k` for
    `|x| < 0.25`, because the direct `x - log1p(x)` cancels catastrophically
    there. That branch is ported rather than simplified away, written
    branchlessly with `ifelse` (same reasoning as `my_piecewise3`) over
    `NaNMath.log1p` so the discarded branch cannot
    throw at `x <= -1`. Checked against a `BigFloat` reference
    (`test/libxc_names.jl`): the port is accurate to `rtol=1e-15` down to
    `x = 1e-10`, where the direct form keeps only about six significant
    digits: a Libxc cross-check at ordinary densities alone would not
    have caught writing `x - log1p(x)` here.
- `lda_c_pmgb06_energy`, `lda_c_pw_erf_energy`, `lda_c_w20_energy`: the three
  functionals that CSE is what made expressible. They generate in 35-44 s
  and match `Libxc.Functional` to
  `atol=1e-12` at Libxc's own default screening parameters (0.3 for pmgb06,
  `libxc-upstream/src/lda_c_pmgb06.c:22`; 0.5 for pw_erf,
  `libxc-upstream/src/lda_c_pw_erf.c:26`; w20 takes no external
  parameters).
- `gga_x_pbe_energy` (PBE exchange): matches
  `Libxc.Functional(:gga_x_pbe; n_spin=1)` and `n_spin=2` to `atol=1e-12`
  across several `(rho, sigma)`/`(na, nb, gaa, gab, gbb)` combinations.
  Type-stable, `ForwardDiff`-differentiable. Needed only one addition over
  the LDA machinery: the generic `resolve_libxc_constants` auto-discovery
  mechanism, which `X2S` is what calls for; none of the other GGA
  complications apply to this particular functional. See "Known gaps"
  above for what is unconfirmed for GGA in general.
- `gga_x_pbepow_energy`: chosen to probe the `ifelse`-eager-evaluation and
  domain-safety question. Matches
  `Libxc.Functional(:gga_x_pbepow)` to `atol=1e-10` for sigma spanning,
  exactly at (analytically derived, not a rounded approximation), and far
  below (down to `1e-8`) the `s2_cut=1` branch boundary, confirming
  Libxc's `m_max`-clamp-before-call pattern survives translation to
  Julia's eager `ifelse` intact for the *precision-loss* failure mode
  `pbepow_f0_large`'s own comments describe. No new registration needed
  (`m_min`/`m_max` are themselves plain `my_piecewise3`). See "Known gaps"
  above for the fuller `ifelse`-eager-evaluation writeup this feeds into.
- `my_piecewise3/5` crash on an unclamped domain-restricted branch when
  combined with `Base.sqrt` (`test/symbolic.jl`): isolates
  Julia's eager `ifelse` evaluation directly, independent of any generated
  functional: `my_piecewise3(x < 0, 0.0, sqrt(x))` at `x = -1.0` throws
  `DomainError` even though the selected branch is `0.0`; bare
  `ifelse(x < 0, 0.0, sqrt(x))` and a nested `my_piecewise5` case do too.
- No generated file holds a bare `Base.sqrt`/`Base.log` or a non-integer `^`
  (`test/generated_audit.jl`, which states it as a property of the shipped
  corpus rather than of `Symbolics.build_function`): the reason *generated*
  functionals are not at risk of the crash above for those three operations:
  `NaNMath.sqrt(-1.0)`, `NaNMath.log(-1.0)`, `NaNMath.pow(-1.0, 1.5)` all
  return `NaN` rather than throwing, and both audits walk every file under
  `src/generated`. See "Known gaps" above for the residual (different-in-kind,
  still open) silent-`NaN` risk this does not rule out.
