# Auto-generated from the Libxc sources
# python/gga_exc/gga_xc_th3.py -- do not edit by hand.
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
# args: rs, z, xt, xs0, xs1, params_a_omega_0, params_a_omega_1, params_a_omega_2, params_a_omega_3, params_a_omega_4, params_a_omega_5, params_a_omega_6, params_a_omega_7, params_a_omega_8, params_a_omega_9, params_a_omega_10, params_a_omega_11, params_a_omega_12, params_a_omega_13, params_a_omega_14, params_a_omega_15, params_a_omega_16, params_a_omega_17, params_a_omega_18, zeta_threshold
const gga_xc_th3_energy = function (rs, z, xt, xs0, xs1, params_a_omega_0, params_a_omega_1, params_a_omega_2, params_a_omega_3, params_a_omega_4, params_a_omega_5, params_a_omega_6, params_a_omega_7, params_a_omega_8, params_a_omega_9, params_a_omega_10, params_a_omega_11, params_a_omega_12, params_a_omega_13, params_a_omega_14, params_a_omega_15, params_a_omega_16, params_a_omega_17, params_a_omega_18, zeta_threshold)
    @inbounds begin
        cse_tmp_0 = z + 1
        cse_tmp_1 = NaNMath.pow(cse_tmp_0, 1.3333333333333333)
        cse_tmp_2 = (3 // 16) * 1.4422495703074083 / (4.60115111447049 * rs ^ 4)
        cse_tmp_3 = 1 - z
        cse_tmp_4 = NaNMath.pow(cse_tmp_3, 1.3333333333333333)
        cse_tmp_5 = cse_tmp_1 * cse_tmp_2 + cse_tmp_2 * cse_tmp_4
        cse_tmp_6 = (3 // 32) * 2.449489742783178 / (5.568327996831708 * NaNMath.pow(rs, 4.5))
        cse_tmp_7 = NaNMath.pow(cse_tmp_0, 1.5) * cse_tmp_6 + NaNMath.pow(cse_tmp_3, 1.5) * cse_tmp_6
        cse_tmp_8 = (3 // 32) * 2.080083823051904 / (6.738808595698141 * rs ^ 5)
        cse_tmp_9 = NaNMath.pow(cse_tmp_0, 1.6666666666666667) * cse_tmp_8 + NaNMath.pow(cse_tmp_3, 1.6666666666666667) * cse_tmp_8
        cse_tmp_10 = z ^ 2
        cse_tmp_11 = 1.4142135623730951
        cse_tmp_12 = (3 // 16) * 1.2009369551760027 * cse_tmp_11 / (3.8019656152149746 * NaNMath.pow(rs, 3.5))
        cse_tmp_13 = NaNMath.pow(cse_tmp_0, 1.1666666666666667) * cse_tmp_12 + cse_tmp_12 * NaNMath.pow(cse_tmp_3, 1.1666666666666667)
        cse_tmp_14 = 1.681792830507429
        cse_tmp_15 = (3 // 16) * 1.0958726911352443 * cse_tmp_14 / (3.456042136022124 * NaNMath.pow(rs, 3.25))
        cse_tmp_16 = NaNMath.pow(zeta_threshold, 1.3333333333333333)
        cse_tmp_17 = my_piecewise3(cse_tmp_0 <= zeta_threshold, cse_tmp_16, cse_tmp_1)
        cse_tmp_18 = 1.5874010519681994 / 4
        cse_tmp_19 = my_piecewise3(cse_tmp_3 <= zeta_threshold, cse_tmp_16, cse_tmp_4)
        cse_tmp_20 = cse_tmp_17 * cse_tmp_18 * xs0 / 2 + cse_tmp_18 * cse_tmp_19 * xs1 / 2
        cse_tmp_21 = (9 // 64) / (9.869604401089358 * rs ^ 6)
        cse_tmp_22 = cse_tmp_0 ^ 2 * cse_tmp_21 + cse_tmp_21 * cse_tmp_3 ^ 2
        cse_tmp_23 = cse_tmp_17 ^ 2 * xs0 ^ 2
        cse_tmp_24 = 1.2599210498948732
        cse_tmp_25 = cse_tmp_24 / 8
        cse_tmp_26 = cse_tmp_19 ^ 2 * xs1 ^ 2
        cse_tmp_27 = cse_tmp_23 * cse_tmp_25 / 2 + cse_tmp_25 * cse_tmp_26 / 2
        cse_tmp_28 = cse_tmp_24 / 4
        cse_tmp_29 = cse_tmp_23 * cse_tmp_28 + cse_tmp_26 * cse_tmp_28 - xt ^ 2
        cse_tmp_30 = (3 // 32) * 1.5805219179014294 * cse_tmp_14 / (5.061691275488801 * NaNMath.pow(rs, 4.25))
        cse_tmp_31 = (3 // 64) * 2.498049532966813 * cse_tmp_11 / (8.155328011441426 * NaNMath.pow(rs, 5.5))
        cse_tmp_32 = NaNMath.pow(cse_tmp_0, 1.8333333333333333) * cse_tmp_31 + NaNMath.pow(cse_tmp_3, 1.8333333333333333) * cse_tmp_31
        (4 // 3) * pi * rs ^ 3 * (cse_tmp_10 * cse_tmp_13 * params_a_omega_14 + cse_tmp_10 * cse_tmp_5 * params_a_omega_15 + cse_tmp_10 * cse_tmp_7 * params_a_omega_16 + cse_tmp_10 * cse_tmp_9 * params_a_omega_17 + cse_tmp_13 * params_a_omega_0 + cse_tmp_20 * cse_tmp_32 * params_a_omega_7 + cse_tmp_20 * cse_tmp_7 * params_a_omega_5 + cse_tmp_20 * cse_tmp_9 * params_a_omega_6 + cse_tmp_20 * params_a_omega_4 * (NaNMath.pow(cse_tmp_0, 1.4166666666666667) * cse_tmp_30 + NaNMath.pow(cse_tmp_3, 1.4166666666666667) * cse_tmp_30) + cse_tmp_22 * cse_tmp_27 * params_a_omega_10 + cse_tmp_22 * cse_tmp_29 * params_a_omega_13 + cse_tmp_27 * cse_tmp_32 * params_a_omega_9 + cse_tmp_27 * cse_tmp_9 * params_a_omega_8 + cse_tmp_29 * cse_tmp_32 * params_a_omega_12 + cse_tmp_29 * cse_tmp_9 * params_a_omega_11 + cse_tmp_5 * params_a_omega_1 + cse_tmp_7 * params_a_omega_2 + cse_tmp_9 * params_a_omega_3 + params_a_omega_18 * (NaNMath.pow(cse_tmp_0, 1.0833333333333333) * cse_tmp_15 + cse_tmp_15 * NaNMath.pow(cse_tmp_3, 1.0833333333333333)))
    end
end
export gga_xc_th3_energy

const gga_xc_th3_defaults = (params_a_omega_0 = -0.142542, params_a_omega_1 = -0.783603, params_a_omega_2 = -0.188875, params_a_omega_3 = 0.042683, params_a_omega_4 = -0.304953, params_a_omega_5 = 0.430407, params_a_omega_6 = -0.0997699, params_a_omega_7 = 0.00355789, params_a_omega_8 = -0.0344374, params_a_omega_9 = 0.0192108, params_a_omega_10 = -0.00230906, params_a_omega_11 = 0.0235189, params_a_omega_12 = -0.0331157, params_a_omega_13 = 0.0121316, params_a_omega_14 = 0.44119, params_a_omega_15 = -2.27167, params_a_omega_16 = 4.03051, params_a_omega_17 = -2.28074, params_a_omega_18 = 0.0360204, zeta_threshold = 2.220446049250313e-16)
const gga_xc_th3_required = ()

function gga_xc_th3(rho, sigma; params = NamedTuple())
    p = resolve_params(gga_xc_th3_defaults, gga_xc_th3_required, params)
    v = gga_variables(rho, sigma, Val(3))
    return gga_xc_th3_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.params_a_omega_0, p.params_a_omega_1, p.params_a_omega_2, p.params_a_omega_3, p.params_a_omega_4, p.params_a_omega_5, p.params_a_omega_6, p.params_a_omega_7, p.params_a_omega_8, p.params_a_omega_9, p.params_a_omega_10, p.params_a_omega_11, p.params_a_omega_12, p.params_a_omega_13, p.params_a_omega_14, p.params_a_omega_15, p.params_a_omega_16, p.params_a_omega_17, p.params_a_omega_18, p.zeta_threshold)
end

function gga_xc_th3(na, nb, gaa, gab, gbb; params = NamedTuple())
    p = resolve_params(gga_xc_th3_defaults, gga_xc_th3_required, params)
    v = gga_variables(na, nb, gaa, gab, gbb, Val(3))
    return gga_xc_th3_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.params_a_omega_0, p.params_a_omega_1, p.params_a_omega_2, p.params_a_omega_3, p.params_a_omega_4, p.params_a_omega_5, p.params_a_omega_6, p.params_a_omega_7, p.params_a_omega_8, p.params_a_omega_9, p.params_a_omega_10, p.params_a_omega_11, p.params_a_omega_12, p.params_a_omega_13, p.params_a_omega_14, p.params_a_omega_15, p.params_a_omega_16, p.params_a_omega_17, p.params_a_omega_18, p.zeta_threshold)
end

export gga_xc_th3, gga_xc_th3_defaults, gga_xc_th3_required

const gga_xc_th4_defaults = (params_a_omega_0 = 0.0677353, params_a_omega_1 = -1.06763, params_a_omega_2 = -0.0419018, params_a_omega_3 = 0.0226313, params_a_omega_4 = -0.222478, params_a_omega_5 = 0.283432, params_a_omega_6 = -0.0165089, params_a_omega_7 = -0.0167204, params_a_omega_8 = -0.0332362, params_a_omega_9 = 0.0162254, params_a_omega_10 = -0.000984119, params_a_omega_11 = 0.0376713, params_a_omega_12 = -0.0653419, params_a_omega_13 = 0.0222835, params_a_omega_14 = 0.375782, params_a_omega_15 = -1.90675, params_a_omega_16 = 3.22494, params_a_omega_17 = -1.68698, params_a_omega_18 = -0.023581, zeta_threshold = 2.220446049250313e-16)
const gga_xc_th4_required = ()

function gga_xc_th4(rho, sigma; params = NamedTuple())
    p = resolve_params(gga_xc_th4_defaults, gga_xc_th4_required, params)
    v = gga_variables(rho, sigma, Val(3))
    return gga_xc_th3_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.params_a_omega_0, p.params_a_omega_1, p.params_a_omega_2, p.params_a_omega_3, p.params_a_omega_4, p.params_a_omega_5, p.params_a_omega_6, p.params_a_omega_7, p.params_a_omega_8, p.params_a_omega_9, p.params_a_omega_10, p.params_a_omega_11, p.params_a_omega_12, p.params_a_omega_13, p.params_a_omega_14, p.params_a_omega_15, p.params_a_omega_16, p.params_a_omega_17, p.params_a_omega_18, p.zeta_threshold)
end

function gga_xc_th4(na, nb, gaa, gab, gbb; params = NamedTuple())
    p = resolve_params(gga_xc_th4_defaults, gga_xc_th4_required, params)
    v = gga_variables(na, nb, gaa, gab, gbb, Val(3))
    return gga_xc_th3_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.params_a_omega_0, p.params_a_omega_1, p.params_a_omega_2, p.params_a_omega_3, p.params_a_omega_4, p.params_a_omega_5, p.params_a_omega_6, p.params_a_omega_7, p.params_a_omega_8, p.params_a_omega_9, p.params_a_omega_10, p.params_a_omega_11, p.params_a_omega_12, p.params_a_omega_13, p.params_a_omega_14, p.params_a_omega_15, p.params_a_omega_16, p.params_a_omega_17, p.params_a_omega_18, p.zeta_threshold)
end

export gga_xc_th4, gga_xc_th4_defaults, gga_xc_th4_required
