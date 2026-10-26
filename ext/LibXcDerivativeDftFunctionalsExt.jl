# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

module LibXcDerivativeDftFunctionalsExt

using LibXcDerivative
using DftFunctionals
using ComponentArrays
import DftFunctionals: energy, identifier, parameters, change_parameters, has_energy
import DftFunctionals: energy_density, potential_terms

# What a generated entry point takes that is not a parameter of the
# functional -- the density and polarization thresholds, and the machine
# constants some kernels guard a logarithm with -- comes from the package
# itself, `LibXcDerivative.THRESHOLD_PARAMS`, which is the same list
# `param_names` reads. DftFunctionals asks for the thresholds through
# threshold_ρ / threshold_σ / threshold_ζ instead, so they are kept out of
# `parameters`: what that returns is meant to be what a caller may tune.
#
# The list is read from the package rather than copied here. A copy drifts
# from the corpus it was swept from: XC_MIN, which mgga_c_lak guards a
# logarithm with, would then be missing from it, and that functional would
# offer the smallest normal Float64 as something to fit.

"""
    SymbolicFunctional{Family,Kind}

One of this package's entry points behind the `DftFunctionals.jl` interface.

Built by [`LibXcDerivative.dft_functional`](@ref).

The interface carries the whole array-based, spin-resolved, differentiated
machinery generically and asks an implementation for one scalar `energy` per
family, which is exactly the shape this package has. So what this adds is
three conventions and nothing else:

  * `energy` is per unit volume where the entry points return per particle
    (Libxc's `zk`), so it is `rho * f(...)`. `DftFunctionals`' own
    `LdaExchange` returns `-3/4 cbrt(3ρ/π) ρ`, which fixes the convention.
    Its `Vρ` is then `∂e/∂ρ`, which is Libxc's `vrho` slot: the same
    convention `xc_exc_vxc` documents.
  * the meta-GGA argument order differs. This package takes
    `(rho, sigma, lapl, tau)`, as Libxc's variable layer hands them over;
    `DftFunctionals` takes `(ρ, σ, τ, Δρ)`. The last two are swapped here.
  * `sigma` arrives with three pseudo-spin components `(σ_αα, σ_αβ, σ_ββ)`
    when spin-resolved, which is the layout the spin-resolved entry points
    already take.
"""
struct SymbolicFunctional{Family,Kind,F,CA} <: DftFunctionals.Functional{Family,Kind}
    f::F
    identifier::Symbol
    parameters::CA
    has_energy::Bool
end

_wrap(f, id, params, has_e, family::Symbol, kind::Symbol) =
    SymbolicFunctional{family,kind,typeof(f),typeof(params)}(f, id, params, has_e)

identifier(fun::SymbolicFunctional) = fun.identifier
parameters(fun::SymbolicFunctional) = fun.parameters
has_energy(fun::SymbolicFunctional) = fun.has_energy

function change_parameters(fun::SymbolicFunctional{F,K}, params::ComponentArray;
                           keep_identifier=false) where {F,K}
    id = keep_identifier ? fun.identifier : Symbol(fun.identifier, "_custom")
    _wrap(fun.f, id, params, fun.has_energy, F, K)
end

function LibXcDerivative.dft_functional(name::Symbol)
    facts = LibXcDerivative.identifier_facts(name)
    # The potential-only functionals ship under a *_vxc name; everything else
    # under the name Libxc registers.
    entry = isdefined(LibXcDerivative, name) ? name : Symbol(name, "_vxc")
    isdefined(LibXcDerivative, entry) || throw(ArgumentError(
        "$name has no entry point in this package"))
    required = getfield(LibXcDerivative, Symbol(entry, "_required"))
    isempty(required) || throw(ArgumentError(
        "$name demands $(join(required, ", ")) with no default, so it cannot " *
        "be called from a density alone and has no place in this interface yet"))

    defaults = getfield(LibXcDerivative, Symbol(entry, "_defaults"))
    tunable = NamedTuple(k => v for (k, v) in pairs(defaults)
                         if !(k in LibXcDerivative.THRESHOLD_PARAMS))
    # ComponentArray{Bool}() for a functional with nothing to tune, which is
    # what the interface's own default `parameters` returns, so
    # arithmetic_type keeps deferring to the density's type.
    params = isempty(tunable) ? ComponentArray{Bool}() : ComponentArray(tunable)
    _wrap(getfield(LibXcDerivative, entry), name, params, facts.has_exc,
          facts.family, facts.kind)
end

"""
    _call(fun, args...)

Call the wrapped entry point, passing its parameters if it takes any.

A mixed functional's entry point has no `params` keyword at all: the
generator bakes its components' overrides into the body, so
`hyb_gga_xc_hse06(rho, sigma)` takes nothing beyond the density. Passing
`params` to one is a MethodError. An empty parameter set is therefore the signal to call it plainly, and it is
the same signal the interface uses: `parameters` returns an empty
ComponentArray for a functional with nothing to tune.
"""
_call(fun::SymbolicFunctional, args...) =
    isempty(fun.parameters) ? fun.f(args...) :
                              fun.f(args...; params = NamedTuple(fun.parameters))

#
# Scalar energies, per unit volume. One method per family, which is all the
# interface asks for; everything array-shaped and every derivative comes from
# its generic path.
#
energy(fun::SymbolicFunctional{:lda}, ρ::Number) =
    ρ * _call(fun, ρ)
energy(fun::SymbolicFunctional{:gga}, ρ::Number, σ::Number) =
    ρ * _call(fun, ρ, σ)
# No Laplacian wanted, so zero goes in its slot rather than the caller's tau.
energy(fun::SymbolicFunctional{:mgga}, ρ::Number, σ::Number, τ::Number) =
    ρ * _call(fun, ρ, σ, zero(ρ), τ)
energy(fun::SymbolicFunctional{:mggal}, ρ::Number, σ::Number, τ::Number, Δρ::Number) =
    ρ * _call(fun, ρ, σ, Δρ, τ)

#
# Spin-resolved energies. The interface's own fallback errors here with
# "Multiple spins not yet implemented for fallback functionals", because the
# functionals it ships are written for a total density. This package generates
# the spin-resolved entry points as well, so both widths are answered.
#
# The thresholds mirror the fallback's: below the density threshold the answer
# is zero, and sigma is floored, which is how Libxc behaves and what keeps a
# derivative finite at the edge of a grid.
#
function energy(fun::SymbolicFunctional{:lda}, ρ::AbstractVector{T}) where {T}
    TT = DftFunctionals.arithmetic_type(fun, T)
    ρtotal = sum(ρ)
    ρtotal ≤ DftFunctionals.threshold_ρ(fun, T) && return zero(TT)
    length(ρ) == 1 && return TT(ρtotal * _call(fun, ρtotal))
    return TT(ρtotal * _call(fun, ρ[1], ρ[2]))
end

function energy(fun::SymbolicFunctional{:gga}, ρ::AbstractVector{T},
                σ::AbstractVector{U}) where {T,U}
    TT = DftFunctionals.arithmetic_type(fun, T, U)
    ρtotal = sum(ρ)
    ρtotal ≤ DftFunctionals.threshold_ρ(fun, T) && return zero(TT)
    floor_σ = DftFunctionals.threshold_σ(fun, U)
    if length(ρ) == 1
        return TT(ρtotal * _call(fun, ρtotal, max(σ[1], floor_σ)))
    end
    # (σ_αα, σ_αβ, σ_ββ), the layout the interface documents in util.jl and
    # the order the spin-resolved entry points take.
    return TT(ρtotal * _call(fun, ρ[1], ρ[2], max(σ[1], floor_σ), σ[2],
                             max(σ[3], floor_σ)))
end

function energy(fun::SymbolicFunctional{:mgga}, ρ::AbstractVector{T},
                σ::AbstractVector{U}, τ::AbstractVector{V}) where {T,U,V}
    TT = DftFunctionals.arithmetic_type(fun, T, U, V)
    ρtotal = sum(ρ)
    ρtotal ≤ DftFunctionals.threshold_ρ(fun, T) && return zero(TT)
    floor_σ = DftFunctionals.threshold_σ(fun, U)
    floor_τ = DftFunctionals.threshold_τ(fun, V)
    if length(ρ) == 1
        return TT(ρtotal * _call(fun, ρtotal, max(σ[1], floor_σ), zero(ρtotal),
                                 max(τ[1], floor_τ)))
    end
    return TT(ρtotal * _call(fun, ρ[1], ρ[2], max(σ[1], floor_σ), σ[2],
                             max(σ[3], floor_σ), zero(ρ[1]), zero(ρ[2]),
                             max(τ[1], floor_τ), max(τ[2], floor_τ)))
end

function energy(fun::SymbolicFunctional{:mggal}, ρ::AbstractVector{T},
                σ::AbstractVector{U}, τ::AbstractVector{V},
                Δρ::AbstractVector{W}) where {T,U,V,W}
    TT = DftFunctionals.arithmetic_type(fun, T, U, V, W)
    ρtotal = sum(ρ)
    ρtotal ≤ DftFunctionals.threshold_ρ(fun, T) && return zero(TT)
    floor_σ = DftFunctionals.threshold_σ(fun, U)
    floor_τ = DftFunctionals.threshold_τ(fun, V)
    if length(ρ) == 1
        return TT(ρtotal * _call(fun, ρtotal, max(σ[1], floor_σ), Δρ[1],
                                 max(τ[1], floor_τ)))
    end
    return TT(ρtotal * _call(fun, ρ[1], ρ[2], max(σ[1], floor_σ), σ[2],
                             max(σ[3], floor_σ), Δρ[1], Δρ[2],
                             max(τ[1], floor_τ), max(τ[2], floor_τ)))
end

#
# The energy density and the potential terms for a meta-GGA, which the
# interface's own generic path does not reach: DftFunctionals implements
# energy_density, potential_terms and kernel_terms for Functional{:lda} and
# Functional{:gga} only (interface.jl), where it differentiates the scalar
# `energy` it is given. For a meta-GGA there is no such method, so a caller
# gets a MethodError from all three even though the scalar energy is
# supplied here for all four families.
#
# The two a caller needs are supplied here instead of waited for. The numbers
# come from `xc_exc_vxc` rather than from a generic gradient of `energy`,
# because that function already answers exactly these quantities under
# Libxc's own convention: its `vrho` is d(rho * zk)/d rho, which is what
# `Vρ` means here, and the others are rho_total times a derivative of zk,
# and because it is the path the suite compares against the vendored library
# component by component. One path to each number rather than two.
#
# `xc_exc_vxc` lives in the ForwardDiff extension, and nothing is imported
# from it here: the function is declared in the package itself, so a caller
# who has not loaded ForwardDiff gets a MethodError naming it rather than
# this extension failing to load.
#
# kernel_terms is deliberately absent. DFTK, which is what this interface
# is for, says so itself in DispatchFunctional.jl: "No need for
# Dftfunctionals.kernel_terms This can be strictly expressed by AD", and the
# name appears in one commented line of it. A caller wanting a meta-GGA's
# second derivatives has `xc_fxc`, which names Libxc's ten slots rather than
# packing them into the three dense blocks this would ask for.
#
# The shapes are the interface's, and the ones DFTK writes for Libxc in
# DispatchFunctional.jl:129-152: `rho`, `tau` and the Laplacian carry
# (spin, point), `sigma` carries its three pseudo-spin components when
# spin-resolved, `e` is one number per point, and the potentials keep the
# spin axis of the quantity they differentiate.
#
# If DftFunctionals grows the generic methods, these become a second
# implementation of the same thing and should be deleted: they are more
# specific, so they would win silently.
#

# One point, with the thresholds the scalar energies above apply and the
# Laplacian slot the family wants. Returns Libxc's first-derivative slots.
function _mgga_slots(fun::SymbolicFunctional, ρ, σ, τ, Δρ)
    floor_σ = DftFunctionals.threshold_σ(fun, eltype(σ))
    floor_τ = DftFunctionals.threshold_τ(fun, eltype(τ))
    if length(ρ) == 1
        return LibXcDerivative.xc_exc_vxc(fun.f, ρ[1], max(σ[1], floor_σ),
                                        Δρ[1], max(τ[1], floor_τ))
    end
    return LibXcDerivative.xc_exc_vxc(fun.f, (ρ[1], ρ[2]),
                                     (max(σ[1], floor_σ), σ[2],
                                      max(σ[3], floor_σ)),
                                     (Δρ[1], Δρ[2]),
                                     (max(τ[1], floor_τ), max(τ[2], floor_τ)))
end

_component(x, i) = x isa Tuple ? x[i] : x

function _fill_point!(e, Vρ, Vσ, Vτ, Vl, i, fun, ρ, σ, τ, Δρ)
    ρtotal = sum(ρ)
    if ρtotal ≤ DftFunctionals.threshold_ρ(fun, eltype(ρ))
        e[i] = zero(eltype(e))
        Vρ[:, i] .= zero(eltype(Vρ))
        Vσ[:, i] .= zero(eltype(Vσ))
        Vτ[:, i] .= zero(eltype(Vτ))
        Vl === nothing || (Vl[:, i] .= zero(eltype(Vl)))
        return nothing
    end
    s = _mgga_slots(fun, ρ, σ, τ, Δρ)
    e[i] = ρtotal * s.zk
    for j in axes(Vρ, 1)
        Vρ[j, i] = _component(s.vrho, j)
    end
    for j in axes(Vσ, 1)
        Vσ[j, i] = _component(s.vsigma, j)
    end
    for j in axes(Vτ, 1)
        Vτ[j, i] = _component(s.vtau, j)
    end
    if Vl !== nothing
        for j in axes(Vl, 1)
            Vl[j, i] = _component(s.vlapl, j)
        end
    end
    return nothing
end

# The allocating entry points. `_zero_lapl` stands in for a meta-GGA that
# takes no Laplacian, as the scalar energies above do.
_zero_lapl(ρ) = ntuple(_ -> zero(eltype(ρ)), length(ρ))

for (fam, has_lapl) in ((:mgga, false), (:mggal, true))
    lapl_arg = has_lapl ? (:(Δρ::AbstractMatrix),) : ()
    @eval function potential_terms(fun::SymbolicFunctional{$(QuoteNode(fam))},
                                   ρ::AbstractMatrix{T}, σ::AbstractMatrix{U},
                                   τ::AbstractMatrix{V},
                                   $(lapl_arg...)) where {T,U,V}
        s_ρ, n_p = size(ρ)
        s_σ = size(σ, 1)
        TT = DftFunctionals.arithmetic_type(fun, T, U, V)
        e  = similar(ρ, TT, n_p)
        Vρ = similar(ρ, TT, s_ρ, n_p)
        Vσ = similar(ρ, TT, s_σ, n_p)
        Vτ = similar(ρ, TT, s_ρ, n_p)
        Vl = $(has_lapl ? :(similar(ρ, TT, s_ρ, n_p)) : :nothing)
        @views for i in 1:n_p
            _fill_point!(e, Vρ, Vσ, Vτ, Vl, i, fun, ρ[:, i], σ[:, i], τ[:, i],
                         $(has_lapl ? :(Δρ[:, i]) : :(_zero_lapl(ρ[:, i]))))
        end
        return $(has_lapl ? :((; e, Vρ, Vσ, Vτ, Vl)) : :((; e, Vρ, Vσ, Vτ)))
    end
    @eval function energy_density(fun::SymbolicFunctional{$(QuoteNode(fam))},
                                  ρ::AbstractMatrix, σ::AbstractMatrix,
                                  τ::AbstractMatrix, $(lapl_arg...))
        return potential_terms(fun, ρ, σ, τ, $(lapl_arg...)).e
    end
end

end # module
