# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

"""
    LIBXC_LOOSE_AGREEMENT

The functionals held to a relative bound rather than the strict absolute one.

Keyed by name, with the bound each one meets and its measured worst case in a
comment beside it.

Everything else is held to the strict bound. That direction is the point:
with the looser one as the default, a functional that began disagreeing by
1e-8 would ship with nothing noticing.

What these lose is significance in a long sum, which is why the bound here
is relative where the default is absolute: an absolute bound asks least of
them exactly where the value is smallest.

Where along the density that happens is not the same for all of them, and
saying otherwise cost a functional its place here for ten days. The KCIS
pair agrees to 1e-13 at the highest density checked and loses eight digits
by the lowest. The Minnesota entries do the opposite: `hyb_mgga_x_m06_hf`
is 1.3e-12 out at rho = 0.05 and 2.2e-10 at rho = 5, and `mgga_x_m06_l`,
`hyb_mgga_x_revm06` and `hyb_mgga_x_m08_so` are worst at the highest
density too. `hyb_mgga_x_m08_so` was refused this tier on the grounds that
losing significance at high density was not "this tier's shape": a
generalisation from the first two entries, and the opposite of what the
Minnesota members here do.

1e-7 is where the boundary falls on its own rather than where a functional
needed it: everything that misses 1e-10 lies between 2.7e-10 and 2.4e-8,
and `gga_x_hjs_b97x`, whose 1.1e-6 has no identified cause, is outside it
and is not shipped at all. One bound for the table, not a bound fitted to
each entry, for the same reason the default is the strict one: a figure
chosen to admit a particular functional is a figure that admits whatever
comes next.

This table lives in the package, not in the test suite, because two things
read it: the tests, and the generator, which decides from it which
mixed functionals reproduce Libxc well enough to write out. It was stated
in both places once, with a flat `1e-10` on the generator's side, and
`gga_xc_beefvdw` fell through the gap between the two rules.
"""
const LIBXC_LOOSE_AGREEMENT = Dict(
    # Kernels: agree to 1e-13 at the highest density checked and lose eight
    # digits by the lowest, which is cancellation in a long expression
    # rather than a wrong one.
    "mgga_c_kcis" => 1e-7,          # worst measured 2.4e-8
    "mgga_c_kcisk" => 1e-7,         # worst measured 1.6e-8
    "gga_x_beefvdw" => 1e-7,        # worst measured 7e-10
    # Variant entry points reaching the Minnesota kernels.
    "hyb_mgga_x_m06_hf" => 1e-7,    # worst measured 1.4e-8
    "mgga_x_m06_l" => 1e-7,         # worst measured 8.9e-10
    "hyb_mgga_x_m06" => 1e-7,       # worst measured 4.1e-10
    "hyb_mgga_x_revm06" => 1e-7,    # worst measured 2.7e-10
    "hyb_mgga_x_m08_so" => 1e-7,    # worst measured 1.3e-9
)

"""
    LIBXC_PLATFORM_FLOOR

The functionals whose agreement sits at the floor of the strict bound, where
one machine's libm and another's differ by the whole figure.

Keyed by name, with an absolute bound and the measurements it was chosen
from. These are not a looser tier: 1e-9 absolute where the loose tier is
1e-7 relative, so a later disagreement of 1e-8 still fails.

What they lose to is rounding, not cancellation, which is why the bound is
absolute where the loose tier's is relative: the figure moves with the
machine and not with the density.

Measured at rho in (0.05, 0.5, 5.0) against the library Libxc.jl vendors.
On the ubuntu runner hyb_mgga_x_m05 is 1.8e-10 out and mgga_c_m08_hx is
1.1e-10, both over the strict bound, while the values themselves agree to
ten digits. 1e-9 is five times the larger of those, one bound for the three
rather than one fitted to each; another machine may move it, and moving it
is this one line.
"""
const LIBXC_PLATFORM_FLOOR = Dict(
    "hyb_mgga_x_m05" => 1e-9,
    "hyb_mgga_x_m08_hx" => 1e-9,
    "mgga_c_m08_hx" => 1e-9,
)

"""
    libxc_loose_tolerance(name) -> Float64 | nothing

Return the relative bound `name` is allowed, or `nothing` for the strict one.

A functional Libxc evaluates by mixing others is a weighted sum of the
kernels in it, so it cannot agree with the library any better than the
component that agrees least well: the four mixes holding `mgga_c_kcis`
miss `atol=1e-10` by about 2e-9, which is that kernel's own 2.4e-8
arriving with its coefficient. So a mix's bound is read off its components,
from the `<name>_components` the generated source carries rather than from a
second list, and tightening or releasing a kernel moves everything built
on it without further bookkeeping.
"""
function libxc_loose_tolerance(name::AbstractString)
    haskey(LIBXC_LOOSE_AGREEMENT, name) && return LIBXC_LOOSE_AGREEMENT[name]
    field = Symbol(name, "_components")
    isdefined(@__MODULE__, field) || return nothing
    return libxc_loose_tolerance(name,
        String[string(c[2]) for c in getfield(@__MODULE__, field)])
end

"""
    libxc_loose_tolerance(name, components) -> Float64 | nothing

Return the same bound for a mix whose components are known but not shipped.

That is the generator's case: it has to decide from this whether a recipe
reproduces Libxc closely enough to write out, and cannot read a
`<name>_components` that does not exist until it does.
"""
function libxc_loose_tolerance(name::AbstractString,
                               components::AbstractVector{<:AbstractString})
    haskey(LIBXC_LOOSE_AGREEMENT, name) && return LIBXC_LOOSE_AGREEMENT[name]
    inherited = Float64[]
    for component in components
        bound = libxc_loose_tolerance(component)
        bound === nothing || push!(inherited, bound)
    end
    return isempty(inherited) ? nothing : maximum(inherited)
end

"""
    agrees_with_libxc(mine, reference, name) -> Bool

Return whether `mine` matches `reference` closely enough for `name`'s tier.

That is `atol=1e-10`, unless [`LIBXC_PLATFORM_FLOOR`](@ref) gives `name` an
absolute bound of its own, or [`libxc_loose_tolerance`](@ref) gives it a
relative one.
"""
function agrees_with_libxc(mine::Real, reference::Real, name::AbstractString)
    haskey(LIBXC_PLATFORM_FLOOR, name) &&
        return isapprox(mine, reference; atol=LIBXC_PLATFORM_FLOOR[name])
    return _agrees(mine, reference, libxc_loose_tolerance(name))
end

"""
    agrees_with_libxc(mine, reference, name, components) -> Bool

Return the same for a mix that does not ship yet, given its components.

See the two-argument [`libxc_loose_tolerance`](@ref).
"""
function agrees_with_libxc(mine::Real, reference::Real, name::AbstractString,
                           components::AbstractVector{<:AbstractString})
    haskey(LIBXC_PLATFORM_FLOOR, name) &&
        return isapprox(mine, reference; atol=LIBXC_PLATFORM_FLOOR[name])
    return _agrees(mine, reference, libxc_loose_tolerance(name, components))
end

_agrees(mine, reference, bound) =
    bound === nothing ? isapprox(mine, reference; atol=1e-10) :
                        isapprox(mine, reference; rtol=bound)
