# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

"""
    IdentifierFacts

What a caller has to know about a functional before calling it.

Five fields: which family it is in, whether it is exchange or correlation,
which arguments it reads, and whether it has an energy at all.

None of it is parsed from the name, because the name does not carry it.
`mgga_x_scanl` is deorbitalized SCAN and reads the Laplacian of the density
instead of `tau`; the `_x_`/`_c_`/`_xc_` segment is a convention Libxc does
not enforce, and `p->info->kind` is what it answers from. The table is read
out of the pinned library at generation time.

Two conventions are applied when the table is written, both so that it can
drive an array-based interface directly:

  * a hybrid is recorded in its underlying family, so `hyb_gga_xc_hse06` is
    `:gga`, because what a hybrid changes is the mixing and not which
    arguments its semi-local part reads. For the mixing, see
    [`mixing_parameters`](@ref).
  * a meta-GGA that needs the Laplacian is recorded as `:mggal`, which is how
    `DftFunctionals.jl` spells that family.
"""
struct IdentifierFacts
    family::Symbol
    kind::Symbol
    has_exc::Bool
    needs_tau::Bool
    needs_laplacian::Bool
end

"""
    identifier_facts(f) -> IdentifierFacts

Return the [`IdentifierFacts`](@ref) for `f`, the entry point or its name.

A name this package does not ship is refused rather than given a default, for
the reason [`mixing_parameters`](@ref) refuses one: a caller that is told
"no tau needed" about a misspelled meta-GGA gets a wrong answer with nothing
to see.
"""
identifier_facts(f::Function) = identifier_facts(nameof(f))

# `haskey` and then an index, rather than `get` with `nothing` as the
# default. The default is what makes the return type a union of `Nothing`
# and an `IdentifierFacts`, and an `IdentifierFacts` holds two `Symbol`s,
# so it is not an `isbits` type and cannot be stored in a union slot: every
# lookup boxed 24 bytes behind an 8 byte tag. That is 32 bytes a point for
# a caller sweeping a meta-GGA, since the input clamp asks this question on
# every point. Two lookups of a hash are cheaper than one allocation.
@inline function identifier_facts(name::Symbol)
    haskey(IDENTIFIER_FACTS, name) || throw(ArgumentError(
        "$name is not a functional this package ships, so what it reads and " *
        "which family it is in are not questions with answers here. The " *
        "potential-only functionals are listed under their own name, without " *
        "the _vxc suffix their entry points carry."))
    return IDENTIFIER_FACTS[name]
end

"""
    libxc_family(f)

Return which family `f` is in, and so how many arguments it takes.

One of `:lda`, `:gga`, `:mgga`, or `:mggal` for a meta-GGA that reads the
Laplacian. A hybrid comes back in its underlying family.

Named `libxc_family` rather than `family` because `DftFunctionals.jl` exports
a `family` of its own, and a caller doing `using LibXcDerivative,
DftFunctionals`, which is what porting looks like, would have to
disambiguate every use.
"""
libxc_family(f::Union{Function,Symbol}) = identifier_facts(f).family

"""
    libxc_kind(f)

Return what `f` models: `:x`, `:c`, `:xc` or `:k`.

Exchange, correlation, both, or a kinetic energy functional, as Libxc's
`p->info->kind` reports it. Named for the same reason [`libxc_family`](@ref)
is.
"""
libxc_kind(f::Union{Function,Symbol}) = identifier_facts(f).kind

"""
    has_exc(f)

Return whether `f` has an energy at all.

False for the potential-only functionals, whose own value is a potential,
which is why they ship under a `*_vxc` name and [`xc_exc_vxc`](@ref) refuses
them. Libxc reports this as `XC_FLAGS_HAVE_EXC`.
"""
has_exc(f::Union{Function,Symbol}) = identifier_facts(f).has_exc

"""
    needs_tau(f)

Return whether `f` reads the kinetic energy density `tau`.

Libxc reports this as `XC_FLAGS_NEEDS_TAU`.
"""
needs_tau(f::Union{Function,Symbol}) = identifier_facts(f).needs_tau

"""
    needs_laplacian(f)

Return whether `f` reads the Laplacian of the density.

True for the deorbitalized meta-GGAs, which read it instead of `tau`. Libxc
reports this as `XC_FLAGS_NEEDS_LAPLACIAN`.
"""
needs_laplacian(f::Union{Function,Symbol}) = identifier_facts(f).needs_laplacian

"""
    LibxcReference

One paper to cite for a functional.

Four fields: the reference as a sentence, the DOI, a BibTeX entry, and the key
that entry is filed under.

Libxc's SymPy sources carry the mathematics and not the bibliography, so a
package generated from them has no way to know what to cite. These are read
out of the pinned library's own reference tables at generation time.
"""
struct LibxcReference
    reference::String
    doi::String
    bibtex::String
    key::String
end

"""
    IdentifierText

What is known about a functional besides its arithmetic.

The sentence naming it, its full flag set, the derivative orders Libxc itself
provides, and the papers to cite.

`derivatives` is what *Libxc* provides, from its `XC_FLAGS_HAVE_*` bits, and
says nothing about this package: here a derivative comes from the caller's AD
over one expression and has no order limit. Libxc.jl stops at second order and
Libxc's own C at fourth.
"""
struct IdentifierText
    name::String
    flags::Tuple{Vararg{Symbol}}
    derivatives::Tuple{Vararg{Int}}
    references::Vector{LibxcReference}
end

"""
    identifier_text(f) -> IdentifierText

Return the [`IdentifierText`](@ref) for `f`, the entry point or its name.

Refused for a name this package does not ship, as [`identifier_facts`](@ref)
is.
"""
identifier_text(f::Function) = identifier_text(nameof(f))

function identifier_text(name::Symbol)
    text = get(IDENTIFIER_TEXT, name, nothing)
    text === nothing && throw(ArgumentError(
        "$name is not a functional this package ships, so Libxc's name for " *
        "it and the papers to cite are not questions with answers here"))
    return text
end

"""
    functional_name(f)

Return the sentence naming the functional, for printing or citing.

Libxc's own wording, e.g. `"SCAN exchange of Sun, Ruzsinszky, and Perdew"`.
"""
functional_name(f::Union{Function,Symbol}) = identifier_text(f).name

"""
    libxc_flags(f)

Return every flag Libxc sets for `f`, as symbols.

The names are the ones Libxc gives each bit (`src/xc.h:54-80`): `:have_exc`,
`:dim3`, `:needs_tau`, `:hyb_cam`, `:development` and the rest.
[`identifier_facts`](@ref) picks five of these out as fields; this is the
whole set. Read it only if those five are not enough: three of the twenty
bits do not say what they appear to, as below.

Read from a `MAXORDER=4` build of the pinned sources, as
[`libxc_derivatives`](@ref) is. Five of the twenty bits are the
`XC_FLAGS_HAVE_*` set, and the `KXC` and `LXC` ones are defined to 0 below the
matching maxorder, so the default `MAXORDER=2` build, the one values are
compared against, reported `have_kxc` and `have_lxc` for nothing in the
corpus. With the right build, 683 of the 697 carry `have_kxc` and 662 carry
`have_lxc`.

A flag carried by all 697 identifiers, or by none, is worth suspecting: it is
the shape a build setting makes, where `:needs_tau` at 219 and `:development`
at 13 are the shape of a property. Eight of the twenty bits are at one end or
the other, and each is accounted for here, because stating the rule without
checking it is how `:enforce_fhc` got shipped as a fact. The suite now
enforces the accounting: a flag at 0 or 697 that this docstring does not name
fails a test.

Three of the eight are not facts about the functional:

  * `:on_host` and `:on_device` come from a default in Libxc's
    `src/func_info.c:14-16`, chosen by whether the library was built with
    CUDA or HIP. Libxc does support both (`-DENABLE_CUDA`, `-DENABLE_HIP`,
    with `GPU_FUNCTION` compiling the kernels for the device and
    `work_lda_inc.c` branching on these bits at run time), but the pinned
    build has neither, so **every** functional here carries `:on_host` and
    none carries `:on_device`. That says nothing about which functionals
    Libxc can run on a GPU.
  * `:enforce_fhc` is carried by all 697, down to the LDAs, which have no
    `tau` to form a Fermi hole curvature from. `functionals.c:355` ORs the
    bit into every functional as it is initialised, under `#ifdef
    XC_ENFORCE_FERMI_HOLE_CURVATURE`, and `CMakeLists.txt:162` leaves
    `DISABLE_FHC` at `OFF`, so the pinned build defines it. It is that build
    option, and a caller can turn it off per functional with
    `xc_func_set_fhc_enforcement`. One functional declares it for itself:
    `mgga_x_sa_tpss`. What the bit does is clamp the input,
    `sigma <- min(sigma, 8 rho tau)` in `work_mgga_inc.c:59-78`, which this
    package does not do, so above that bound the two part company, by 2 %
    to a factor of eleven on the energy density, and agree to 1e-14 below it.

The other five are genuine, and the reason differs for each:

  * `:have_vxc` and `:have_fxc` are carried by all 697 because Libxc provides
    a potential and a second derivative for everything it ships. `:have_exc`
    is 690, not 697: the seven potential-only functionals have no energy.
    `:have_kxc` at 683 and `:have_lxc` at 662 are real ceilings.
  * `:hyb_lc` and `:hyb_lcy` are carried by none. `xc.h:68-70` calls them
    deprecated spellings of `:hyb_cam` and `:hyb_camy`, nothing sets them,
    and `hybrids.c:21-27` reads them only so that a functional which did
    would still be recognised. A range-separated functional here carries
    `:hyb_cam`, 58 of them, or `:hyb_camy`, 6.
  * `:stable` is declared in `xc.h` and set by nothing in the sources, so no
    functional carries it. That zero is correct rather than a ceiling.
"""
libxc_flags(f::Union{Function,Symbol}) = identifier_text(f).flags

"""
    libxc_derivatives(f)

Return which derivative orders Libxc itself provides for `f`.

Read from the `XC_FLAGS_HAVE_*` bits of a `MAXORDER=4` build of the pinned
sources.

Not a statement about this package. A derivative here comes from the caller's
AD over one expression and has no order limit, since one more `ForwardDiff`
step through [`xc_fxc`](@ref) gives a third derivative, while Libxc.jl stops at
second order.

The build matters, and these orders are read from a `MAXORDER=4` build of the
pinned sources. `XC_FLAGS_I_HAVE_KXC` is defined to 0 when `XC_MAXORDER < 3`,
and every functional's flags fold in a `MAPLE2C_FLAGS` generated with the
build's own maxorder, so the default `MAXORDER=2` build, the one values are
compared against, reports what it compiled rather than what the functional
has: `(0, 1, 2)` for 690 identifiers and `(1, 2)` for seven, with nothing
claiming a third order at all.

What the orders actually are, over the 697 identifiers: 655 reach fourth
order, 21 stop at third, 14 stop at second, and the seven potential-only ones
run 1 to 4. `hyb_gga_xc_hse06` is one of the 14, because `gga_x_wpbeh` has no
third derivative: a ceiling belonging to the functional, which is the
distinction the second build exists to make.

For a potential-only functional the list starts at 1: Libxc fills its
potential and the orders above it and no zeroth one, which is the absence that
makes those functionals special.
"""
libxc_derivatives(f::Union{Function,Symbol}) = identifier_text(f).derivatives

"""
    libxc_references(f)

Return the papers to cite for `f`, as [`LibxcReference`](@ref)s.

All 845 references in the shipped corpus carry a BibTeX entry. 25 of them
carry no DOI, which is not an omission in the table: they are references that
have none: conference proceedings, a 1956 Soviet journal, and one that reads
"Defined through Gaussian implementation". Both counts are asserted by the
suite, so a caller can rely on the BibTeX and has to tolerate a missing DOI.
"""
libxc_references(f::Union{Function,Symbol}) = identifier_text(f).references

# The accessors above take a generated entry point or the name one is
# registered under, and anything else lands here. Without this method they
# would take Any, and a caller handing them something else would be told
# about identifier_facts or identifier_text, which it never called: the
# accessor reads one of those tables, and the error came from the table.
@noinline function _reject_identifier(entry, x)
    throw(ArgumentError(
        "$entry($(typeof(x))): no method matches these argument types. It " *
        "takes a functional this package ships, or the Symbol it is " *
        "registered under; available_identifiers() lists them."))
end

for accessor in (:libxc_family, :libxc_kind, :has_exc, :needs_tau,
                 :needs_laplacian, :functional_name, :libxc_flags,
                 :libxc_derivatives, :libxc_references)
    @eval $accessor(x) = _reject_identifier($(QuoteNode(accessor)), x)
end

"""
    available_identifiers() -> Vector{Symbol}

Return every functional this package serves, by name, sorted.

Named `available_identifiers` rather than `available_functionals`, which
`Libxc.jl` exports, so that a caller loading both does not have to
disambiguate. The potential-only ones appear under the name Libxc registers
rather than the `*_vxc` their entry points carry.
"""
available_identifiers() = sort!(collect(keys(IDENTIFIER_FACTS)))

"""
    dft_functional(name) -> DftFunctionals.Functional

Wrap the functional `name` in the interface `DftFunctionals.jl` defines.

That interface is what `DFTK.jl` consumes: `family`, `kind`, `identifier`,
`parameters`, `change_parameters`, `needs_σ`, `needs_τ`, `needs_Δρ`,
`has_energy`, and the array-based `energy_density`, `potential_terms` and
`kernel_terms`.

Available once `DftFunctionals` and `ComponentArrays` are both loaded; the
implementation is an extension, so neither is a dependency of this package.

How far the array-based evaluation reaches is split between the two packages.
`DftFunctionals` itself implements `energy_density`, `potential_terms` and
`kernel_terms` for `Functional{:lda}` and `Functional{:gga}` only. This
extension adds `potential_terms` and `energy_density` for `Functional{:mgga}`
and `Functional{:mggal}`, built on [`xc_exc_vxc`](@ref), so a meta-GGA has
those two here as well as a scalar `energy`.

`kernel_terms` is deliberately absent for the meta-GGA families: `DFTK`, which
is what consumes this interface, says it does not need one. [`xc_fxc`](@ref)
answers for a meta-GGA's second derivatives in this package's own form.

A potential-only functional is constructed and reports `has_energy` false.
Evaluating one through the interface is not implemented: the generic paths
assert an energy, and what those functionals return is a potential.

Deliberately not `DftFunctionals.DftFunctional(::Val{name})`. That function
belongs to `DftFunctionals`, and a generic method on it here would take
effect for the whole process: loading this package would silently change
which implementation answers for every identifier `DftFunctionals` does not
define specifically, including inside code that never asked, and the two
implementations need not agree to the last digit, since one is written from
the papers and the other generated from Libxc. A caller who wants that
wiring can write it where it is visible and theirs:

    DftFunctionals.DftFunctional(::Val{S}) where {S} =
        LibXcDerivative.dft_functional(S)
"""
function dft_functional end

# Its method is in the DftFunctionals extension, so until that extension
# loads this is the only one there is, and a call reports what is missing
# rather than only that nothing matched. Once the extension is loaded its
# method takes a Symbol and this one keeps the other argument types.
@noinline dft_functional(x) = throw(ArgumentError(
    "dft_functional($(typeof(x))): no method matches these argument types. " *
    "It takes the Symbol a functional is registered under, and its method " *
    "comes from the DftFunctionals extension: `using DftFunctionals` makes " *
    "it available."))
