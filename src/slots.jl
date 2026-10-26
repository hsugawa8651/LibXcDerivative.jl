# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

"""
    POTENTIAL_SLOT_NAMES

The entry points that return a potential rather than an energy per particle.

Held so that [`xc_exc_vxc`](@ref) and the derivative functions beside it can
refuse a functional with no energy to differentiate.

A tuple of symbols rather than a suffix test, because a suffix test has to
build a string to look at and these functions are meant to be callable on a
grid without allocating. The set is small and the test suite pins it against
the shipped `*_vxc` names, so adding one has to update both.
"""
const POTENTIAL_SLOT_NAMES = (
    :lda_xc_tih_vxc, :gga_x_lb_vxc, :gga_x_lbm_vxc,
    :mgga_x_bj06_vxc, :mgga_x_tb09_vxc, :mgga_x_rpp09_vxc,
    :mgga_x_2d_prhg07_prp10_vxc, :mgga_x_2d_prp10_vxc,
)

function _refuse_potential(f)
    nameof(f) in POTENTIAL_SLOT_NAMES && throw(ArgumentError(
        "$(nameof(f)) returns a potential, not an energy density, so it has " *
        "no zk and Libxc's vrho is the value it already returns. Call it " *
        "directly, and differentiate it once for Libxc's v2rho2 slot."))
    return nothing
end

"""
    xc_exc_vxc(f, rho)
    xc_exc_vxc(f, rho, sigma)
    xc_exc_vxc(f, rho, sigma, lapl, tau)
    xc_exc_vxc(f, (na, nb))
    xc_exc_vxc(f, (na, nb), (gaa, gab, gbb))
    xc_exc_vxc(f, (na, nb), (gaa, gab, gbb), (la, lb), (ta, tb))

Return the energy per particle of `f` and its first derivatives, named.

The density is given as a total or as its two spin channels, and the result is
a `NamedTuple`: `zk` for the energy per particle, then one field per
derivative. The names are Libxc's, so code ported from it reads the same
quantity out of the same field.

Why this exists. Everything else here returns one scalar and leaves the
derivatives to the caller's `ForwardDiff`, which is the whole design: Libxc's
own interface fills arrays from C and cannot be differentiated through at all
(`evaluate!` takes `Float64` arrays, and a `Dual` is a `MethodError`). But it
leaves one convention in the caller's hands, and it is easy to get wrong:

  - `vrho` is the derivative of `rho * zk`, **not** of `zk`
  - `vsigma`, `vlapl` and `vtau` are `rho` times the derivative of `zk`

Named slots state that once. The result is a `NamedTuple` with the fields
Libxc fills for the family, so a caller reading `s.vsigma` is reading the
quantity `xc_gga_exc_vxc` would have put in `vsigma`.

All of them come out of one forward pass over the expression, seeded in every
argument at once. Where that pass returns anything that is not finite it is
discarded and the slots are taken from one chain per argument instead, which
is slower and is what a zero of `sigma` does, and a zero of `tau` with it,
since Libxc's clamp takes `sigma` to zero there. The Limits page says which
slots are finite at those points and which are not.

Type-stable: the field set is fixed per method, so there is no order to pass
and nothing to infer. Over a grid, `xc_exc_vxc.(f, rho, sigma)` gives an
array of these with a concrete element type; a caller who wants columns
instead writes
`(; vrho = getfield.(v, :vrho), vsigma = getfield.(v, :vsigma))`.

Cost, re-measured on 2026-10-24 on `gga_x_pbe` at 50000 points, every slot
consumed, with the loop in a top-level function: 70 ns a point, the same
whether the functional is named in the loop or passed to it as an argument,
since Julia specializes on its type. Read from an untyped global inside the
loop instead it cost 990 ns and allocated 496 bytes a point, so what a loop
needs is not a fixed functional but one whose type the compiler can see.
Writing the two derivatives out by hand, as two seeded passes, came to 124 ns:
slower than asking for all of them at once, which is the point of the one
pass, though what a hand-written pair costs depends on how it is written.

Nothing is allocated, in a top-level function or inside a `@testset`, and the
suite asserts that rather than any of these times, which belong to the
machine they were taken on. The slots have to be assembled in a method the
compiler will inline into the caller's loop: where they are not, the entry
point allocates on every point, which cost the GGA path 755 ns and 384 bytes
a point for a day, and `test/slots.jl` now pins it at zero bytes.

A functional that reads `tau` carries the input clamp
[`libxc_clamp`](@ref) describes as well, which asks a table on every point.
That question answered itself in 88 ns and 32 bytes a point until the same
reading was taken of it: the clamp received the functional as an argument it
never calls, for which Julia compiles one instance covering all of them
rather than one each, so the name was looked up at run time and the lookup's
union-typed result was boxed. With the functional arriving as a type
parameter and the table indexed rather than defaulted, the clamp costs 9 ns
and nothing, and `mgga_x_scan` reads 387 ns a point against 352 with
`enforce_fhc=false`.

The scope of the loop matters more than it should and is worth saying. The
figures above are all from a loop in a function, with the inputs in arrays.
Written in a `let` block rather than a function the same loop times slower,
a loop handed literal arguments is folded away before it runs, and a loop
that reads its functional from an untyped global pays the 990 ns above. A
sweep driven from inside a `@testset` reads zero as well: what makes a
reading of 144 bytes a point is the method not being inlined, not the scope
it is measured in.

Still differentiable, unlike the interface it imitates: one more step through
`s.vrho` is Libxc's `v2rho2`.

Spin-polarized densities arrive as tuples, one per quantity, and come back
the same way: `vrho` has a component per spin, `vsigma` three for the
`(aa, ab, bb)` pseudo-spin components, `vlapl` and `vtau` one per spin, which
are Libxc's own widths. The convention is the one above with the total
density standing where `rho` did, `vrho[s]` being the derivative of
`rho_total * zk` with respect to `rho_s`, and it was read off the library
rather than assumed.

Tuples rather than a flat argument list because the family is a property of
`f` that the call site does not carry: two numbers are a GGA's
`(rho, sigma)` and equally an LDA's `(na, nb)`, and nothing at the call site
could tell them apart.

Not for the potential-only functionals, which have no `zk`: they are
refused by name.

The methods are in the ForwardDiff extension, so `using ForwardDiff` is
what makes them exist. This package depends on no AD package: which one a
caller differentiates with is the caller's choice, and that is the point
of shipping one expression rather than a derivative implementation.
"""
function xc_exc_vxc end

"""
    xc_fxc(f, rho)
    xc_fxc(f, rho, sigma)
    xc_fxc(f, rho, sigma, lapl, tau)
    xc_fxc(f, (na, nb))
    xc_fxc(f, (na, nb), (gaa, gab, gbb))
    xc_fxc(f, (na, nb), (gaa, gab, gbb), (la, lb), (ta, tb))
    xc_fxc(f, slot, (na, nb), (gaa, gab, gbb), (la, lb), (ta, tb))

Return the second derivatives of `f`, named.

One field per independent second derivative: `v2rho2` for an LDA; `v2rho2`,
`v2rhosigma`, `v2sigma2` for a GGA; and the ten of a meta-GGA, `v2rho2`,
`v2rhosigma`, `v2rholapl`, `v2rhotau`, `v2sigma2`, `v2sigmalapl`,
`v2sigmatau`, `v2lapl2`, `v2lapltau`, `v2tau2`. The names are Libxc's.

Each is a derivative of `rho * zk`, which is what Libxc differentiates, taken
with `ForwardDiff` on the one expression this package ships: there is no
separate second-order implementation here, as there is in Libxc, where `fxc`
is generated C of its own.

The field set is fixed by the family, as it is for `xc_exc_vxc`: a meta-GGA
with no Laplacian dependence gets zeros in those four slots rather than a
narrower `NamedTuple`, which is the number Libxc would have written had it
filled a slot. Libxc.jl does the opposite and leaves the fields out; the
suite asserts both.

`enforce_fhc=false` stops the input clamp [`libxc_clamp`](@ref) describes, so
that the derivatives are those of the expression this package ships rather
than the ones Libxc would give. It makes no difference below the von
Weizsäcker bound, which is everywhere a real density reaches.

Spin-polarized densities arrive as tuples, as they do for
[`xc_exc_vxc`](@ref), and each slot comes back with the spin axis Libxc gives
it: three components for `v2rho2`, six for `v2rhosigma` and `v2sigma2`, four
for `v2rholapl` and the other rho-against-two-channels slots, three for
`v2lapl2` and `v2tau2`.

The layouts are Libxc's and were read off it rather than assumed. The rule
that came out: the first quantity's spin axis is outermost, and when both
quantities are the same one it is the upper triangle, row major. So
`v2rhosigma` is `rho_a` against `(aa, ab, bb)` and then `rho_b` against the
same three, and `v2sigma2` is `aa aa`, `aa ab`, `aa bb`, `ab ab`, `ab bb`,
`bb bb`.

Two probes were needed. An exchange functional fixes most of the layout by
its zeros, since exchange is spin-separable and every alpha-beta entry
vanishes, but that leaves the vanishing positions undetermined, and
comparing zero with zero establishes nothing. `mgga_c_b94`, a correlation
functional depending on both `tau` and the Laplacian, has no vanishing
component, and matching all ten slots there against a Hessian computed
independently agreed to 1.8e-9 with nothing skipped.

A `slot` between the functional and the densities asks for that one slot,
the form [`xc_kxc`](@ref) describes, and returns what it holds in the whole
tuple. Only for a polarized density: unpolarized, the ten slots of a meta-GGA
are ten numbers and the whole tuple is well under a second, so there is
nothing to save.
"""
function xc_fxc end

"""
    xc_kxc(f, rho)
    xc_kxc(f, rho, sigma)
    xc_kxc(f, rho, sigma, lapl, tau)
    xc_kxc(f, (na, nb), (gaa, gab, gbb), (la, lb), (ta, tb))
    xc_kxc(f, slot, rho, sigma, lapl, tau)

Return the third derivatives of `f`, named.

One field per independent third derivative: `v3rho3` for an LDA, four for a
GGA, twenty for a meta-GGA.

    xc_lxc(f, rho)
    xc_lxc(f, rho, sigma)
    xc_lxc(f, rho, sigma, lapl, tau)
    xc_lxc(f, (na, nb), (gaa, gab, gbb), (la, lb), (ta, tb))
    xc_lxc(f, slot, rho, sigma, lapl, tau)

Return the fourth derivatives of `f`, named: `v4rho4` for an LDA, five for a
GGA, thirty-five for a meta-GGA.

The names follow Libxc's rule rather than a transcribed list: for order `n`,
the multisets of `(rho, sigma, lapl, tau)` in lexicographic order, each
variable followed by its multiplicity where that is above one: `v3rho2sigma`,
`v3rhosigmalapl`, `v4rho2lapltau`. The rule reproduces every `v3`/`v4` name
Libxc's `src/xc.h` declares, 66 of them, and the suite checks that
against the header rather than against a copy of it.

Each is a derivative of `rho * zk`, as the lower slots are, taken with
`ForwardDiff` on the one expression this package ships. Libxc generates C for
each order instead, which is why a Libxc build fixes its highest order with
`MAXORDER` when it is configured: here no order is compiled in advance.

Nothing to have, but not nothing to call, and the cost climbs steeply with
the size of the expression. Measured on 2026-10-20: on `mgga_x_scan` a first
call costs 4.4 s for the twenty third-order slots and 15.6 s for the
thirty-five fourth-order ones. On `hyb_gga_xc_hse06`, which holds the 158 KiB
`gga_x_wpbeh` kernel, the same sequence runs 0.8 s for the value, 2.7 s for the
first derivative, 11.9 s for the second, 260 s for the third, and more than
twelve minutes for the fourth, which was stopped rather than completed. The
step from second to third is more than twenty times, not the four the first
three suggest, so extrapolating from the low orders understates it badly.
Repeating any of these on the same machine moves it by about a tenth: they are
scale, not benchmarks.

It is paid on the first call for a given functional and order, and only if
that call is made.

`enforce_fhc=false` stops the input clamp [`libxc_clamp`](@ref) describes, as
it does for [`xc_fxc`](@ref). Every slot function takes it, including those of
an LDA and a GGA, where it has nothing to act on, so that generic code over
a mixed corpus can pass it to anything.

What this means for coverage is worth stating, because it runs the other way
from everything else in this package. Libxc provides a third derivative for
688 of its 702 identifiers and a fourth for 667 (`hyb_gga_xc_hse06` is one
that stops at second order, since `gga_x_wpbeh` has no third), while these
answer for every functional with an energy, at each of the four orders Libxc
names, because they differentiate an expression rather than call generated
code. Those four are the whole surface: Libxc's own API stops at `v4rho4` and
so does this, and a caller who wants a fifth differentiates the expression.
[`libxc_derivatives`](@ref) is what Libxc provides; it is not a limit here.

A spin-polarized density arrives as one tuple per quantity, as it does for
[`xc_exc_vxc`](@ref), and then each slot holds a tuple of components rather
than a number: the thirty-five slots of a polarized meta-GGA fourth
derivative hold 495 components between them. [`slot_widths`](@ref) gives the
widths without evaluating anything.

    xc_kxc(f, slot, args...)
    xc_lxc(f, slot, args...)

One slot by name, `slot` being a `Symbol` or a `Val` of one of the names
[`slot_names`](@ref) lists for that family and order, returning what that
slot holds in the whole tuple. This is the form to call when one slot is
wanted, because what costs here is the number of derivative chains compiled,
one per component: the 495 components of a polarized meta-GGA fourth
derivative are 51 s on a first call, and its five-component `v4rho4` slot
alone is under three. The whole tuple is assembled from these same methods,
so the two cannot disagree about a number. A `Val` is the type-stable form; a
`Symbol` forwards to it at the cost of one dynamic dispatch, the slot being
what decides the return type. A name that is no slot of that family and order
raises an `ArgumentError` naming the ones that are.
"""
function xc_kxc end

@doc (@doc xc_kxc)
function xc_lxc end

"""
    slot_names(family, order) -> Tuple{Vararg{Symbol}}

Return the field names a derivative of that family and order comes back with.

Nothing is evaluated: this answers what the result of [`xc_exc_vxc`](@ref),
[`xc_fxc`](@ref), [`xc_kxc`](@ref) or [`xc_lxc`](@ref) will be shaped like
before paying for one.

`family` is `:lda`, `:gga`, `:mgga` or `:mggal`; `order` runs 1 to 4. The
names are generated from Libxc's own rule, the same one the methods are
generated from, so the two cannot disagree.

Asking the result instead costs an evaluation, and at high order that is not
small: a third derivative of `hyb_gga_xc_hse06` takes 260 s on first call.
Knowing what comes back
should not cost that.
"""
function slot_names end

"""
    slot_widths(family, order) -> Tuple{Vararg{Int}}

Return how many components each field of a spin-polarized derivative holds.

The order is the one [`slot_names`](@ref) lists the fields in, and again
nothing is evaluated.

For a slot giving variable `v` a multiplicity `k`, the count is the number of
multisets of `v`'s spin channels of size `k`, which is `C(w+k-1, k)` for a
channel width `w`, multiplied over the variables. `rho`, the Laplacian and `tau`
have two channels; `sigma` has the three `(aa, ab, bb)` pseudo-spin
components. So a polarized GGA third derivative is 4 + 9 + 12 + 10 = 35
components, and a meta-GGA's is 165.

The rule and the ordering were confirmed against a `MAXORDER=4` build of
Libxc, every component, before anything was written: `Libxc.jl` returns
nothing above second order, so there is no other reference.
"""
function slot_widths end

# Nothing to clamp where there is no tau: an LDA's and a GGA's arguments come
# back as they went in, so generic code over a mixed corpus can call this on
# anything, as it can pass `enforce_fhc` to any of the slot functions.
"""
    libxc_clamp(f, rho, sigma, lapl, tau) -> (rho, sigma, lapl, tau)
    libxc_clamp(f, (na, nb), (saa, sab, sbb), (la, lb), (ta, tb))

Clamp a kernel's arguments the way Libxc does before evaluating one.

Returns the arguments it was given, except that a gradient larger than the
kinetic energy density allows is cut back to that bound. For an LDA or a GGA,
and for a functional this package does not ship, the arguments come back
unchanged.

Libxc does not pass a caller's numbers to the kernel unchanged. For a
functional that needs `tau`, when the Fermi hole curvature is being enforced,
`work_mgga_inc.c:57-80` clamps the gradient to what the kinetic energy
density allows: `sigma <- min(sigma, 8 rho tau)`, so that `1 - sigma/(8 rho
tau)` cannot go negative. Spin-polarized, it is done per channel (`sigma_aa`
against `8 na ta` and `sigma_bb` against `8 nb tb`), and `sigma_ab` is left
alone, being a cross term with no curvature of its own.

Any real density satisfies `tau >= sigma/(8 rho)`, the von Weizsäcker bound,
so the clamp does nothing to physical input and this function returns what it
was given. Above the bound it is the difference between answering as Libxc
does and carrying an unphysical gradient through the expression: on
`hyb_mgga_x_bmk` at `rho = 0.5`, `tau = 0.05` and `sigma = 1.0`, five times
the bound, the two differ by 15 % in the energy density, and on
`hyb_mgga_x_cf22d` by a factor of eleven.

The slot functions ([`xc_exc_vxc`](@ref), [`xc_fxc`](@ref),
[`xc_kxc`](@ref), [`xc_lxc`](@ref)) apply this themselves, and take
`enforce_fhc=false` to stop them. This is here for a caller who evaluates a
kernel directly, where the arguments are the caller's own and nothing is
applied to them.

A functional this package does not ship has no table entry to say whether it
reads `tau`, so its arguments come back unchanged too.

Whether Libxc enforces the curvature at all is a setting of the build, not
a property of the functional: `functionals.c:355` sets the flag for every
functional under `#ifdef XC_ENFORCE_FERMI_HOLE_CURVATURE`, which
`CMakeLists.txt:162` leaves on. [`libxc_flags`](@ref) says more. The default
here follows that build, which is the one values are compared against.
"""
libxc_clamp(f::F, rho::Real) where {F} = (rho,)

# One method per shape a family actually has. The families with no tau have
# nothing to clamp against, so theirs hand the arguments back, and the
# meta-GGA shapes below do the work. What is not one of these shapes is
# refused: handing the arguments of a call that cannot be a density point
# back unchanged is the one answer a caller cannot check.
libxc_clamp(f::F, rho::Real, sigma::Real) where {F} = (rho, sigma)
libxc_clamp(f::F, rho::Tuple{Any,Any}) where {F} = (rho,)
libxc_clamp(f::F, rho::Tuple{Any,Any},
            sigma::Tuple{Any,Any,Any}) where {F} = (rho, sigma)

@noinline function libxc_clamp(f, args...)
    types = join(map(a -> string(typeof(a)), args), ", ")
    throw(ArgumentError(
        "libxc_clamp($(typeof(f)), $types): no method matches these " *
        "argument types. It takes a functional and one of the shapes a " *
        "family has: (rho), (rho, sigma), (rho, sigma, lapl, tau), or the " *
        "same with one tuple per quantity when spin-polarized."))
end

# The type parameter on the functional is load-bearing, as it is on the slot
# methods: `f` is never called here, only asked its name, and for an argument
# it does not call Julia compiles one instance for every functional rather
# than one each. In that single instance `nameof(f)` is a run-time lookup and
# the predicate below cannot be inlined into the caller's loop, which cost
# 88 ns a point against 6 ns with the parameter (2026-10-24). The suite
# asserts the allocation this form avoids, in test/slots.jl.
function libxc_clamp(f::F, rho::Real, sigma::Real, lapl::Real,
                     tau::Real) where {F}
    _clamps(f) || return (rho, sigma, lapl, tau)
    return (rho, min(sigma, 8 * rho * tau), lapl, tau)
end
function libxc_clamp(f::F, rho::Tuple{Any,Any}, sigma::Tuple{Any,Any,Any},
                     lapl::Tuple{Any,Any}, tau::Tuple{Any,Any}) where {F}
    _clamps(f) || return (rho, sigma, lapl, tau)
    na, nb = rho
    saa, sab, sbb = sigma
    ta, tb = tau
    return (rho, (min(saa, 8 * na * ta), sab, min(sbb, 8 * nb * tb)), lapl, tau)
end

# Whether the clamp applies: the functional needs tau, and this package has a
# table entry saying so. A caller may pass a function of its own to the slot
# layer, which has never required the name to be one we ship, so a name with
# no entry gets its arguments back rather than an error.
@inline function _clamps(f::F) where {F}
    name = f isa Symbol ? f : nameof(f)
    return haskey(IDENTIFIER_FACTS, name) && needs_tau(name)
end


# The six entry points above are declared here and filled by the ForwardDiff
# extension, so before that extension loads they have no methods at all, and
# after it a call the extension's methods do not take is reported from inside
# the pass, under a name that is not part of the interface. These methods
# answer under the entry point's own name in both cases. They are the least
# specific methods each entry point has, so every call the extension does
# take still goes to the extension.
#
# Building the message cannot be allowed to fail: the first argument may not
# be a functional at all, and libxc_family refuses what it does not know.
function _slot_shape(args)
    isempty(args) && return "It takes a functional and the density " *
                            "arguments that functional's family needs."
    fam = try
        libxc_family(first(args))
    catch
        nothing
    end
    fam === nothing && return "Its first argument is a functional this " *
                              "package ships, and the rest are the density " *
                              "arguments that functional's family needs."
    return "$(first(args)) is an $fam functional, so it takes that " *
           "family's density arguments, as real numbers, or as one tuple " *
           "per quantity when spin-polarized."
end

@noinline function _reject_slot(entry, args)
    types = join(map(a -> string(typeof(a)), args), ", ")
    tail = if Base.get_extension(@__MODULE__, :LibXcDerivativeForwardDiffExt) ===
              nothing
        "The derivative slots come from the ForwardDiff extension: " *
        "`using ForwardDiff` makes them available."
    else
        _slot_shape(args)
    end
    throw(ArgumentError("$entry($types): no method matches these argument " *
                        "types. " * tail))
end

for slot in (:xc_exc_vxc, :xc_fxc, :xc_kxc, :xc_lxc, :slot_names, :slot_widths)
    @eval $slot(args...; kwargs...) = _reject_slot($(QuoteNode(slot)), args)
end
