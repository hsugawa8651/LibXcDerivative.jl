# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

"""
Reverse-mode rules for `NaNMath.sqrt`.

Generated kernels call it for every square root, because
`Symbolics.build_function` lowers `sqrt` to it.

For `Float64`, NaNMath 1.1.4 takes the square root with the LLVM intrinsic
directly (`src/NaNMath.jl:60`). Zygote cannot differentiate through an
intrinsic, and ChainRules has no rules for NaNMath, so without these a
gradient of any kernel with a square root stops there. ForwardDiff is
unaffected: it uses DiffRules, which does have NaNMath's rules.

The rules are those of `Base.sqrt`, with NaN in place of a `DomainError`
below zero, as for the value, and with two edges stated outright: a zero
(co)tangent stays zero, and `-0.0` differentiates to `+Inf`. Written to
the contract NaNMath's own rules would have, so that dropping this
extension changes no number.

They belong in NaNMath; this extension defines them here in the
meantime, and the bound on NaNMath in `Project.toml` is what will say
when it can go.
"""
module LibXcDerivativeChainRulesCoreExt

using ChainRulesCore: ChainRulesCore, NoTangent, unthunk
using NaNMath: NaNMath

"""
    sqrt_tangent(Δ, y)

Scale a (co)tangent by the derivative of `NaNMath.sqrt` at the point
whose value is `y`.

Two things it does that `Δ / 2y` does not.

`abs(y)`, so that `-0.0` gives `+Inf` rather than `-Inf`: the sign of a
zero is not a direction the derivative has.

A zero `Δ` comes back zero rather than `NaN`, which is what ChainRules
asks of a rule: a zero cotangent is an output the loss does not depend
on, and `0 / 0` is not its derivative. At `x = 0` the pullback of `0.0`
is `0.0` rather than `NaN`.

What it does not do is rescue a gradient at `sigma = 0`. A kernel
differentiated there comes back `NaN` with this rule and without it, from
a `0 * Inf` its own arithmetic forms at another node, and `ForwardDiff`
returns `NaN` there as well. The reason to keep to the contract is the
contract itself: the rules can then move into NaNMath unchanged.
"""
function sqrt_tangent(Δ, y)
    ∂ = Δ / (2 * abs(y))
    return iszero(Δ) ? zero(∂) : ∂
end

function ChainRulesCore.frule((_, Δx), ::typeof(NaNMath.sqrt), x::Real)
    y = NaNMath.sqrt(x)
    return y, sqrt_tangent(Δx, y)
end

function ChainRulesCore.rrule(::typeof(NaNMath.sqrt), x::Real)
    y = NaNMath.sqrt(x)
    nanmath_sqrt_pullback(Δy) = (NoTangent(), sqrt_tangent(unthunk(Δy), y))
    return y, nanmath_sqrt_pullback
end

end
