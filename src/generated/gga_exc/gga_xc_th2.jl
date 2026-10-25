# Auto-generated from the Libxc sources
# python/gga_exc/gga_xc_th2.py -- do not edit by hand.
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
# args: rs, z, xt, xs0, xs1, zeta_threshold
const gga_xc_th2_energy = function (rs, z, xt, xs0, xs1, zeta_threshold)
    @inbounds begin
        cse_tmp_0 = z + 1
        cse_tmp_1 = NaNMath.pow(cse_tmp_0, 1.3333333333333333)
        cse_tmp_2 = 1.4422495703074083 / (4.60115111447049 * rs ^ 4)
        cse_tmp_3 = 0.2393925 * cse_tmp_2
        cse_tmp_4 = NaNMath.pow(cse_tmp_0, 1.6666666666666667)
        cse_tmp_5 = 2.080083823051904 / (6.738808595698141 * rs ^ 5)
        cse_tmp_6 = 0.0342759375 * cse_tmp_5
        cse_tmp_7 = NaNMath.pow(cse_tmp_0, 1.5)
        cse_tmp_8 = 2.449489742783178 / (5.568327996831708 * NaNMath.pow(rs, 4.5))
        cse_tmp_9 = 0.1507396875 * cse_tmp_8
        cse_tmp_10 = 1 - z
        cse_tmp_11 = NaNMath.pow(cse_tmp_10, 1.3333333333333333)
        cse_tmp_12 = NaNMath.pow(cse_tmp_10, 1.6666666666666667)
        cse_tmp_13 = NaNMath.pow(cse_tmp_10, 1.5)
        cse_tmp_14 = NaNMath.pow(cse_tmp_0, 1.1666666666666667)
        cse_tmp_15 = 1.4142135623730951
        cse_tmp_16 = 1.2009369551760027 * cse_tmp_15 / (3.8019656152149746 * NaNMath.pow(rs, 3.5))
        cse_tmp_17 = 0.329664375 * cse_tmp_16
        cse_tmp_18 = 1.681792830507429
        cse_tmp_19 = 0.1272808125 * 1.0958726911352443 * cse_tmp_18 / (3.456042136022124 * NaNMath.pow(rs, 3.25))
        cse_tmp_20 = NaNMath.pow(cse_tmp_10, 1.1666666666666667)
        cse_tmp_21 = z ^ 2
        cse_tmp_22 = 0.28279125 * cse_tmp_2
        cse_tmp_23 = 0.0636635625 * cse_tmp_5
        cse_tmp_24 = 0.1823578125 * cse_tmp_8
        cse_tmp_25 = 0.050025375 * cse_tmp_16
        cse_tmp_26 = 0.006897234375 * cse_tmp_5
        cse_tmp_27 = NaNMath.pow(zeta_threshold, 1.3333333333333333)
        cse_tmp_28 = my_piecewise3(cse_tmp_0 <= zeta_threshold, cse_tmp_27, cse_tmp_1)
        cse_tmp_29 = 1.5874010519681994 / 4
        cse_tmp_30 = my_piecewise3(cse_tmp_10 <= zeta_threshold, cse_tmp_27, cse_tmp_11)
        cse_tmp_31 = cse_tmp_28 * cse_tmp_29 * xs0 + cse_tmp_29 * cse_tmp_30 * xs1
        cse_tmp_32 = 0.006889359375 * cse_tmp_8
        cse_tmp_33 = cse_tmp_0 ^ 2
        cse_tmp_34 = 1 / (9.869604401089358 * rs ^ 6)
        cse_tmp_35 = 5.401096875e-5 * cse_tmp_34
        cse_tmp_36 = cse_tmp_10 ^ 2
        cse_tmp_37 = 1.2599210498948732
        cse_tmp_38 = cse_tmp_37 / 8
        cse_tmp_39 = cse_tmp_28 ^ 2 * xs0 ^ 2
        cse_tmp_40 = cse_tmp_30 ^ 2 * xs1 ^ 2
        cse_tmp_41 = cse_tmp_38 * cse_tmp_39 + cse_tmp_38 * cse_tmp_40
        cse_tmp_42 = NaNMath.pow(cse_tmp_0, 1.8333333333333333)
        cse_tmp_43 = 2.498049532966813 * cse_tmp_15 / (8.155328011441426 * NaNMath.pow(rs, 5.5))
        cse_tmp_44 = 0.00168027421875 * cse_tmp_43
        cse_tmp_45 = NaNMath.pow(cse_tmp_10, 1.8333333333333333)
        cse_tmp_46 = 0.008499703125 * 1.5805219179014294 * cse_tmp_18 / (5.061691275488801 * NaNMath.pow(rs, 4.25))
        cse_tmp_47 = 0.006279778125 * cse_tmp_34
        cse_tmp_48 = cse_tmp_37 / 4
        cse_tmp_49 = cse_tmp_39 * cse_tmp_48 + cse_tmp_40 * cse_tmp_48 - xt ^ 2
        cse_tmp_50 = 0.0019085953125 * cse_tmp_5
        cse_tmp_51 = 0.002909784375 * cse_tmp_5
        cse_tmp_52 = 0.00050302734375 * cse_tmp_43
        cse_tmp_53 = 0.003376528125 * cse_tmp_43
        (4 // 3) * pi * rs ^ 3 * (NaNMath.pow(cse_tmp_0, 1.0833333333333333) * cse_tmp_19 + cse_tmp_1 * cse_tmp_3 + NaNMath.pow(cse_tmp_10, 1.0833333333333333) * cse_tmp_19 + cse_tmp_11 * cse_tmp_3 + cse_tmp_12 * cse_tmp_6 - cse_tmp_13 * cse_tmp_9 - cse_tmp_14 * cse_tmp_17 - cse_tmp_17 * cse_tmp_20 + cse_tmp_21 * (cse_tmp_1 * cse_tmp_22 + cse_tmp_11 * cse_tmp_22) + cse_tmp_21 * (cse_tmp_12 * cse_tmp_23 + cse_tmp_23 * cse_tmp_4) + cse_tmp_21 * (-cse_tmp_13 * cse_tmp_24 - cse_tmp_24 * cse_tmp_7) + cse_tmp_21 * (-cse_tmp_14 * cse_tmp_25 - cse_tmp_20 * cse_tmp_25) + cse_tmp_31 * (-NaNMath.pow(cse_tmp_0, 1.4166666666666667) * cse_tmp_46 - NaNMath.pow(cse_tmp_10, 1.4166666666666667) * cse_tmp_46) + cse_tmp_31 * (cse_tmp_12 * cse_tmp_26 + cse_tmp_26 * cse_tmp_4) + cse_tmp_31 * (cse_tmp_13 * cse_tmp_32 + cse_tmp_32 * cse_tmp_7) + cse_tmp_31 * (-cse_tmp_42 * cse_tmp_44 - cse_tmp_44 * cse_tmp_45) + cse_tmp_4 * cse_tmp_6 + cse_tmp_41 * (-cse_tmp_12 * cse_tmp_50 - cse_tmp_4 * cse_tmp_50) + cse_tmp_41 * (-cse_tmp_33 * cse_tmp_35 - cse_tmp_35 * cse_tmp_36) + cse_tmp_41 * (cse_tmp_42 * cse_tmp_52 + cse_tmp_45 * cse_tmp_52) + cse_tmp_49 * (cse_tmp_12 * cse_tmp_51 + cse_tmp_4 * cse_tmp_51) + cse_tmp_49 * (cse_tmp_33 * cse_tmp_47 + cse_tmp_36 * cse_tmp_47) + cse_tmp_49 * (-cse_tmp_42 * cse_tmp_53 - cse_tmp_45 * cse_tmp_53) - cse_tmp_7 * cse_tmp_9)
    end
end
export gga_xc_th2_energy

const gga_xc_th2_defaults = (zeta_threshold = 2.220446049250313e-16,)
const gga_xc_th2_required = ()

function gga_xc_th2(rho, sigma; params = NamedTuple())
    p = resolve_params(gga_xc_th2_defaults, gga_xc_th2_required, params)
    v = gga_variables(rho, sigma, Val(3))
    return gga_xc_th2_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.zeta_threshold)
end

function gga_xc_th2(na, nb, gaa, gab, gbb; params = NamedTuple())
    p = resolve_params(gga_xc_th2_defaults, gga_xc_th2_required, params)
    v = gga_variables(na, nb, gaa, gab, gbb, Val(3))
    return gga_xc_th2_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.zeta_threshold)
end

export gga_xc_th2, gga_xc_th2_defaults, gga_xc_th2_required
