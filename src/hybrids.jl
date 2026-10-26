# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

"""
    MixingParameters

How a functional mixes in exact exchange, and its non-local constants.

Three flags, for hybrid, range-separated and VV10, and the five numbers those
classes carry. None of it is part of the arithmetic a kernel evaluates, which
is why it is held separately.

A struct rather than a named tuple so that the generated table has one
concrete element type, and so that a field added later does not silently
change the type of every entry.

The three flags are separate because the classes are not exclusive:
`hyb_mgga_xc_wb97m_v` is a range-separated hybrid and a VV10 functional at
once.
"""
struct MixingParameters
    hybrid::Bool
    range_separated::Bool
    vv10::Bool
    cam_alpha::Float64
    cam_beta::Float64
    cam_omega::Float64
    nlc_b::Float64
    nlc_C::Float64
end

const _NO_MIXING = MixingParameters(false, false, false, 0.0, 0.0, 0.0, 0.0, 0.0)

"""
    mixing_parameters(f) -> MixingParameters

Return the [`MixingParameters`](@ref) for `f`, the entry point or its name.

A functional with no mixing gets the all-zero entry.

A name this package does not ship is refused rather than answered with the
zero entry. Returning "not a hybrid" for a misspelled name would make the
quietest possible error: exact exchange left out of a calculation that needed
it, with nothing to see in the output.
"""
mixing_parameters(f::Function) = mixing_parameters(nameof(f))

function mixing_parameters(name::Symbol)
    if !(isdefined(LibXcDerivative, name) &&
         getfield(LibXcDerivative, name) isa Function)
        throw(ArgumentError("$name is not a functional this package ships, so " *
                            "its mixing parameters are not a question with an " *
                            "answer. Libxc's own name for a functional it does " *
                            "not serve returns nothing from Libxc.Functional too."))
    end
    return get(MIXING_PARAMETERS, name, _NO_MIXING)
end

"""
    is_hybrid(f)

Return whether `f` mixes in exact exchange.

Decided by the family Libxc puts it in (`XC_FAMILY_HYB_LDA`, `_GGA`,
`_MGGA`), the test `Libxc.is_hybrid` makes.
"""
is_hybrid(f) = mixing_parameters(f).hybrid

"""
    is_range_separated(f)

Return whether `f` splits its exact exchange by range.

Decided by Libxc's range-separation flags (`XC_FLAGS_HYB_CAM`, `_CAMY`,
`_LC`, `_LCY`, `src/hybrids.c:20-32`) and not by the name:
`hyb_gga_xc_pbeh` is a hybrid that is not range-separated, and
`hyb_gga_x_pbe_erf_gws` is one that is.
"""
is_range_separated(f) = (p = mixing_parameters(f); p.hybrid && p.range_separated)

"""
    is_global_hybrid(f)

Return whether `f` mixes one fraction of exact exchange at every separation.

That is, whether it is a hybrid and not a range-separated one.
"""
is_global_hybrid(f) = (p = mixing_parameters(f); p.hybrid && !p.range_separated)

"""
    is_vv10(f)

Return whether `f` carries a VV10 non-local correlation term.

Independent of hybrid-ness: `hyb_mgga_xc_wb97m_v` is both. Libxc reports this
as `XC_FLAGS_VV10`.
"""
is_vv10(f) = mixing_parameters(f).vv10

"""
    exx_coefficient(f) -> Float64 or nothing

Return the fraction of exact exchange a global hybrid asks for.

`nothing` for every other functional.

`nothing` rather than zero, following `Libxc.jl`: the zero that `xc_func_type`
holds for a non-hybrid and the fact that the quantity does not apply are
different answers, and a caller that mixed a stale 0.25 into a functional that
wanted none would be wrong in the direction that looks plausible. For a
range-separated hybrid this is `nothing` too: its exchange is not one
fraction but `cam_alpha` at long range and `cam_alpha + cam_beta` at short.
"""
exx_coefficient(f::Union{Function,Symbol}) = (p = mixing_parameters(f);
                      p.hybrid && !p.range_separated ? p.cam_alpha : nothing)

"""
    cam_alpha(f) -> Float64 or nothing

Return the long-range fraction of exact exchange of a range-separated hybrid.

`nothing` for anything else.
"""
cam_alpha(f::Union{Function,Symbol}) = (p = mixing_parameters(f);
                p.hybrid && p.range_separated ? p.cam_alpha : nothing)

"""
    cam_beta(f) -> Float64 or nothing

Return the extra short-range fraction of exact exchange, over `cam_alpha`.

So a range-separated hybrid's short-range fraction is
`cam_alpha + cam_beta`. `nothing` for anything else.
"""
cam_beta(f::Union{Function,Symbol}) = (p = mixing_parameters(f);
               p.hybrid && p.range_separated ? p.cam_beta : nothing)

"""
    cam_omega(f) -> Float64 or nothing

Return the screening parameter of a range-separated hybrid, in inverse bohr.

`nothing` for anything else.
"""
cam_omega(f::Union{Function,Symbol}) = (p = mixing_parameters(f);
                p.hybrid && p.range_separated ? p.cam_omega : nothing)

"""
    nlc_b(f) -> Float64 or nothing

Return the VV10 `b` parameter, or `nothing` if `f` is not a VV10 functional.
"""
nlc_b(f::Union{Function,Symbol}) = (p = mixing_parameters(f); p.vv10 ? p.nlc_b : nothing)

"""
    nlc_C(f) -> Float64 or nothing

Return the VV10 `C` parameter, or `nothing` if `f` is not a VV10 functional.
"""
nlc_C(f::Union{Function,Symbol}) = (p = mixing_parameters(f); p.vv10 ? p.nlc_C : nothing)

"""
    xc_hyb_exx_coef(f) -> Float64

Return `cam_alpha` as Libxc's own accessor does, with no policy applied.

Named after `src/hybrids.c:63`. Zero for a functional that has no hybrid
parameters, which is the number `xc_func_type` holds for one.

Use `exx_coefficient` to be told, instead, when the quantity does not apply.
"""
xc_hyb_exx_coef(f::Union{Function,Symbol}) = mixing_parameters(f).cam_alpha

"""
    xc_hyb_cam_coef(f) -> (; omega, alpha, beta)

Return `omega`, `alpha` and `beta` as Libxc's other accessor does.

Named after `src/hybrids.c:70`, which fills three `double *` out parameters
there and returns the three values here in that same order. Plain reads of
`cam_omega`, `cam_alpha` and `cam_beta`, with no policy applied.
"""
function xc_hyb_cam_coef(f::Union{Function,Symbol})
    p = mixing_parameters(f)
    return (omega = p.cam_omega, alpha = p.cam_alpha, beta = p.cam_beta)
end

# The same reason as the accessors in identifiers.jl: these read the mixing
# table, and taking Any would have a caller handing them something else told
# about mixing_parameters, which it never called. _reject_identifier names
# the accessor instead; it is defined in identifiers.jl, which this module
# includes after this file, and the call is resolved when it is made.
for accessor in (:exx_coefficient, :cam_alpha, :cam_beta, :cam_omega,
                 :nlc_b, :nlc_C, :xc_hyb_exx_coef, :xc_hyb_cam_coef)
    @eval $accessor(x) = _reject_identifier($(QuoteNode(accessor)), x)
end
