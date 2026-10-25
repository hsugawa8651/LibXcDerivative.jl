# Auto-generated from the Libxc sources
# python/gga_exc/gga_x_hjs_b88_v2.py -- do not edit by hand.
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
# args: rs, z, xt, xs0, xs1, XC_EPSILON, cam_omega, dens_threshold, params_a_a_0, params_a_a_1, params_a_a_2, params_a_a_3, params_a_a_4, params_a_a_5, params_a_b_0, params_a_b_1, params_a_b_2, params_a_b_3, params_a_b_4, params_a_b_5, params_a_b_6, params_a_b_7, params_a_b_8, zeta_threshold
const gga_x_hjs_b88_v2_energy = function (rs, z, xt, xs0, xs1, XC_EPSILON, cam_omega, dens_threshold, params_a_a_0, params_a_a_1, params_a_a_2, params_a_a_3, params_a_a_4, params_a_a_5, params_a_b_0, params_a_b_1, params_a_b_2, params_a_b_3, params_a_b_4, params_a_b_5, params_a_b_6, params_a_b_7, params_a_b_8, zeta_threshold)
    @inbounds begin
        cse_tmp_0 = z + 1
        cse_tmp_1 = (3 // 8) / (pi * rs ^ 3)
        cse_tmp_2 = cse_tmp_0 <= zeta_threshold
        cse_tmp_3 = zeta_threshold - 1
        cse_tmp_4 = 1 - z
        cse_tmp_5 = cse_tmp_4 <= zeta_threshold
        cse_tmp_6 = -cse_tmp_3
        cse_tmp_7 = my_piecewise5(cse_tmp_2, cse_tmp_3, cse_tmp_5, cse_tmp_6, z)
        cse_tmp_8 = cse_tmp_7 + 1
        cse_tmp_9 = cse_tmp_8 <= zeta_threshold
        cse_tmp_10 = NaNMath.pow(zeta_threshold, 0.3333333333333333) - 1
        cse_tmp_11 = my_piecewise3(cse_tmp_9, cse_tmp_10, xc_expm1(xc_log1p(my_piecewise3(cse_tmp_7 > cse_tmp_3, cse_tmp_7, cse_tmp_3)) / 3)) + 1
        cse_tmp_12 = cse_tmp_11 ^ (-2)
        cse_tmp_13 = 0.4661940770354116
        cse_tmp_14 = 2.6207413942088964 * cam_omega ^ 2 * cse_tmp_13 * rs ^ 2
        cse_tmp_15 = (2 // 9) * cse_tmp_14
        cse_tmp_16 = cse_tmp_12 * cse_tmp_15
        cse_tmp_17 = 1.8171205928321397
        cse_tmp_18 = cse_tmp_17 / 4.60115111447049
        cse_tmp_19 = cse_tmp_18 * xs0 ^ 2
        cse_tmp_20 = exp(-20)
        cse_tmp_21 = Abs(xs0)
        cse_tmp_22 = 3.3019272488946267
        cse_tmp_23 = cse_tmp_13 * cse_tmp_22
        cse_tmp_24 = cse_tmp_23 / 12
        cse_tmp_25 = xc_log1p(cse_tmp_20 * xc_expm1(cse_tmp_21 * cse_tmp_24))
        cse_tmp_26 = cse_tmp_25 ^ 2
        cse_tmp_27 = cse_tmp_23 / 6
        cse_tmp_28 = cse_tmp_19 / 24 - cse_tmp_21 * cse_tmp_25 * cse_tmp_27 + cse_tmp_26
        cse_tmp_29 = NaNMath.pow(cse_tmp_28, 1.5)
        cse_tmp_30 = cse_tmp_28 ^ 2
        cse_tmp_31 = NaNMath.pow(cse_tmp_28, 2.5)
        cse_tmp_32 = cse_tmp_28 ^ 3
        cse_tmp_33 = NaNMath.pow(cse_tmp_28, 3.5)
        cse_tmp_34 = cse_tmp_28 * (cse_tmp_28 * params_a_a_0 + cse_tmp_29 * params_a_a_1 + cse_tmp_30 * params_a_a_2 + cse_tmp_31 * params_a_a_3 + cse_tmp_32 * params_a_a_4 + cse_tmp_33 * params_a_a_5) / (NaNMath.pow(cse_tmp_28, 4.5) * params_a_b_8 + NaNMath.sqrt(cse_tmp_28) * params_a_b_0 + cse_tmp_28 ^ 4 * params_a_b_7 + cse_tmp_28 * params_a_b_1 + cse_tmp_29 * params_a_b_2 + cse_tmp_30 * params_a_b_3 + cse_tmp_31 * params_a_b_4 + cse_tmp_32 * params_a_b_5 + cse_tmp_33 * params_a_b_6 + 1)
        cse_tmp_35 = NaNMath.pow(XC_EPSILON, 0.6666666666666666)
        cse_tmp_36 = my_piecewise3(cse_tmp_34 > cse_tmp_35, cse_tmp_34, cse_tmp_35)
        cse_tmp_37 = cse_tmp_16 + cse_tmp_36
        cse_tmp_38 = cse_tmp_37 + 0.60965
        cse_tmp_39 = NaNMath.sqrt(cse_tmp_38)
        cse_tmp_40 = cse_tmp_39 ^ (-1)
        cse_tmp_41 = cse_tmp_11 ^ (-1)
        cse_tmp_42 = 0.6827840632552957
        cse_tmp_43 = 2.2894284851066637 * cam_omega * cse_tmp_42 * rs
        cse_tmp_44 = cse_tmp_43 / 3
        cse_tmp_45 = cse_tmp_41 * cse_tmp_44
        cse_tmp_46 = cse_tmp_39 + cse_tmp_45
        cse_tmp_47 = cse_tmp_46 ^ (-1)
        cse_tmp_48 = NaNMath.sqrt(cse_tmp_37)
        cse_tmp_49 = cse_tmp_38 ^ (-1)
        cse_tmp_50 = -cse_tmp_28 / (0.133480125 * cse_tmp_13 * cse_tmp_21 * cse_tmp_22 * cse_tmp_25 - 0.03337003125 * cse_tmp_19 - 0.80088075 * cse_tmp_26 - 3.203523) + 4.21411052769092 * cse_tmp_36 + 1
        cse_tmp_51 = cse_tmp_36 + 0.757211
        cse_tmp_52 = my_piecewise3(cse_tmp_51 > cse_tmp_35, cse_tmp_51, cse_tmp_35)
        cse_tmp_53 = NaNMath.sqrt(cse_tmp_16 + cse_tmp_52)
        cse_tmp_54 = -cse_tmp_52
        cse_tmp_55 = (2 // 3) * cse_tmp_43
        cse_tmp_56 = cse_tmp_36 + 0.60965
        cse_tmp_57 = 3 * cse_tmp_43
        cse_tmp_58 = (2 // 3) * cse_tmp_14
        cse_tmp_59 = (4 // 5) * 1.772453850905516
        cse_tmp_60 = NaNMath.pow(zeta_threshold, 1.3333333333333333)
        cse_tmp_61 = 0.184639691595506 * cse_tmp_17 * cse_tmp_42 / rs
        cse_tmp_62 = my_piecewise5(cse_tmp_5, cse_tmp_3, cse_tmp_2, cse_tmp_6, -z)
        cse_tmp_63 = cse_tmp_62 + 1
        cse_tmp_64 = cse_tmp_63 <= zeta_threshold
        cse_tmp_65 = my_piecewise3(cse_tmp_64, cse_tmp_10, xc_expm1(xc_log1p(my_piecewise3(cse_tmp_62 > cse_tmp_3, cse_tmp_62, cse_tmp_3)) / 3)) + 1
        cse_tmp_66 = cse_tmp_65 ^ (-2)
        cse_tmp_67 = cse_tmp_15 * cse_tmp_66
        cse_tmp_68 = cse_tmp_18 * xs1 ^ 2
        cse_tmp_69 = Abs(xs1)
        cse_tmp_70 = xc_log1p(cse_tmp_20 * xc_expm1(cse_tmp_24 * cse_tmp_69))
        cse_tmp_71 = cse_tmp_70 ^ 2
        cse_tmp_72 = -cse_tmp_27 * cse_tmp_69 * cse_tmp_70 + cse_tmp_68 / 24 + cse_tmp_71
        cse_tmp_73 = NaNMath.pow(cse_tmp_72, 1.5)
        cse_tmp_74 = cse_tmp_72 ^ 2
        cse_tmp_75 = NaNMath.pow(cse_tmp_72, 2.5)
        cse_tmp_76 = cse_tmp_72 ^ 3
        cse_tmp_77 = NaNMath.pow(cse_tmp_72, 3.5)
        cse_tmp_78 = cse_tmp_72 * (cse_tmp_72 * params_a_a_0 + cse_tmp_73 * params_a_a_1 + cse_tmp_74 * params_a_a_2 + cse_tmp_75 * params_a_a_3 + cse_tmp_76 * params_a_a_4 + cse_tmp_77 * params_a_a_5) / (NaNMath.pow(cse_tmp_72, 4.5) * params_a_b_8 + NaNMath.sqrt(cse_tmp_72) * params_a_b_0 + cse_tmp_72 ^ 4 * params_a_b_7 + cse_tmp_72 * params_a_b_1 + cse_tmp_73 * params_a_b_2 + cse_tmp_74 * params_a_b_3 + cse_tmp_75 * params_a_b_4 + cse_tmp_76 * params_a_b_5 + cse_tmp_77 * params_a_b_6 + 1)
        cse_tmp_79 = my_piecewise3(cse_tmp_78 > cse_tmp_35, cse_tmp_78, cse_tmp_35)
        cse_tmp_80 = cse_tmp_67 + cse_tmp_79
        cse_tmp_81 = cse_tmp_80 + 0.60965
        cse_tmp_82 = NaNMath.sqrt(cse_tmp_81)
        cse_tmp_83 = cse_tmp_82 ^ (-1)
        cse_tmp_84 = cse_tmp_65 ^ (-1)
        cse_tmp_85 = cse_tmp_44 * cse_tmp_84
        cse_tmp_86 = cse_tmp_82 + cse_tmp_85
        cse_tmp_87 = cse_tmp_86 ^ (-1)
        cse_tmp_88 = NaNMath.sqrt(cse_tmp_80)
        cse_tmp_89 = cse_tmp_81 ^ (-1)
        cse_tmp_90 = -cse_tmp_72 / (0.133480125 * cse_tmp_13 * cse_tmp_22 * cse_tmp_69 * cse_tmp_70 - 0.03337003125 * cse_tmp_68 - 0.80088075 * cse_tmp_71 - 3.203523) + 4.21411052769092 * cse_tmp_79 + 1
        cse_tmp_91 = cse_tmp_79 + 0.757211
        cse_tmp_92 = my_piecewise3(cse_tmp_91 > cse_tmp_35, cse_tmp_91, cse_tmp_35)
        cse_tmp_93 = NaNMath.sqrt(cse_tmp_67 + cse_tmp_92)
        cse_tmp_94 = -cse_tmp_92
        cse_tmp_95 = cse_tmp_79 + 0.60965
        my_piecewise3(cse_tmp_0 * cse_tmp_1 <= dens_threshold, 0, -cse_tmp_61 * (2 * cse_tmp_36 * xc_log1p(-0.60965 * cse_tmp_47 / (cse_tmp_39 + cse_tmp_48)) + 0.0472728888888889 * cse_tmp_40 * cse_tmp_47 + cse_tmp_41 * cse_tmp_55 * (cse_tmp_36 + cse_tmp_54) / (cse_tmp_48 + cse_tmp_53) - 2 * cse_tmp_52 * xc_log1p(cse_tmp_47 * (-cse_tmp_54 - cse_tmp_56) / (cse_tmp_39 + cse_tmp_53)) + 0.757211 + 0.0263664444444444 * cse_tmp_49 * cse_tmp_50 * (cse_tmp_40 * cse_tmp_45 + 2) / cse_tmp_46 ^ 2 - (cse_tmp_12 * cse_tmp_49 * cse_tmp_58 + cse_tmp_40 * cse_tmp_41 * cse_tmp_57 + 8) * (0.0474596 * cse_tmp_50 * cse_tmp_56 - NaNMath.pow(cse_tmp_56, 3.5) * (cse_tmp_59 + ((12 // 5) * cse_tmp_36 - 12 // 5 * cse_tmp_52) / (NaNMath.sqrt(cse_tmp_36) + NaNMath.sqrt(cse_tmp_52))) - 0.9086532 * cse_tmp_56 ^ 3 + 0.0283637333333333 * cse_tmp_56 ^ 2) / (9 * NaNMath.pow(cse_tmp_38, 1.5) * cse_tmp_46 ^ 3)) * my_piecewise3(cse_tmp_9, cse_tmp_60, NaNMath.pow(cse_tmp_8, 1.3333333333333333))) + my_piecewise3(cse_tmp_1 * cse_tmp_4 <= dens_threshold, 0, -cse_tmp_61 * (cse_tmp_55 * cse_tmp_84 * (cse_tmp_79 + cse_tmp_94) / (cse_tmp_88 + cse_tmp_93) + 2 * cse_tmp_79 * xc_log1p(-0.60965 * cse_tmp_87 / (cse_tmp_82 + cse_tmp_88)) + 0.0472728888888889 * cse_tmp_83 * cse_tmp_87 - 2 * cse_tmp_92 * xc_log1p(cse_tmp_87 * (-cse_tmp_94 - cse_tmp_95) / (cse_tmp_82 + cse_tmp_93)) + 0.757211 + 0.0263664444444444 * cse_tmp_89 * cse_tmp_90 * (cse_tmp_83 * cse_tmp_85 + 2) / cse_tmp_86 ^ 2 - (cse_tmp_57 * cse_tmp_83 * cse_tmp_84 + cse_tmp_58 * cse_tmp_66 * cse_tmp_89 + 8) * (0.0474596 * cse_tmp_90 * cse_tmp_95 - NaNMath.pow(cse_tmp_95, 3.5) * (cse_tmp_59 + ((12 // 5) * cse_tmp_79 - 12 // 5 * cse_tmp_92) / (NaNMath.sqrt(cse_tmp_79) + NaNMath.sqrt(cse_tmp_92))) - 0.9086532 * cse_tmp_95 ^ 3 + 0.0283637333333333 * cse_tmp_95 ^ 2) / (9 * NaNMath.pow(cse_tmp_81, 1.5) * cse_tmp_86 ^ 3)) * my_piecewise3(cse_tmp_64, cse_tmp_60, NaNMath.pow(cse_tmp_63, 1.3333333333333333)))
    end
end
export gga_x_hjs_b88_v2_energy

const gga_x_hjs_b88_v2_defaults = (XC_EPSILON = 2.220446049250313e-16, cam_omega = 0.11, dens_threshold = 1.0e-6, params_a_a_0 = 0.0253933, params_a_a_1 = -0.0673075, params_a_a_2 = 0.0891476, params_a_a_3 = -0.0454168, params_a_a_4 = -0.00765813, params_a_a_5 = 0.0142506, params_a_b_0 = -2.6506, params_a_b_1 = 3.91108, params_a_b_2 = -3.31509, params_a_b_3 = 1.54485, params_a_b_4 = -0.198386, params_a_b_5 = -0.136112, params_a_b_6 = 0.0647862, params_a_b_7 = 0.0159586, params_a_b_8 = -0.000245066, zeta_threshold = 2.220446049250313e-16)
const gga_x_hjs_b88_v2_required = ()

function gga_x_hjs_b88_v2(rho, sigma; params = NamedTuple())
    p = resolve_params(gga_x_hjs_b88_v2_defaults, gga_x_hjs_b88_v2_required, params)
    v = gga_variables(rho, sigma, Val(3))
    return gga_x_hjs_b88_v2_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.XC_EPSILON, p.cam_omega, p.dens_threshold, p.params_a_a_0, p.params_a_a_1, p.params_a_a_2, p.params_a_a_3, p.params_a_a_4, p.params_a_a_5, p.params_a_b_0, p.params_a_b_1, p.params_a_b_2, p.params_a_b_3, p.params_a_b_4, p.params_a_b_5, p.params_a_b_6, p.params_a_b_7, p.params_a_b_8, p.zeta_threshold)
end

function gga_x_hjs_b88_v2(na, nb, gaa, gab, gbb; params = NamedTuple())
    p = resolve_params(gga_x_hjs_b88_v2_defaults, gga_x_hjs_b88_v2_required, params)
    v = gga_variables(na, nb, gaa, gab, gbb, Val(3))
    return gga_x_hjs_b88_v2_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.XC_EPSILON, p.cam_omega, p.dens_threshold, p.params_a_a_0, p.params_a_a_1, p.params_a_a_2, p.params_a_a_3, p.params_a_a_4, p.params_a_a_5, p.params_a_b_0, p.params_a_b_1, p.params_a_b_2, p.params_a_b_3, p.params_a_b_4, p.params_a_b_5, p.params_a_b_6, p.params_a_b_7, p.params_a_b_8, p.zeta_threshold)
end

export gga_x_hjs_b88_v2, gga_x_hjs_b88_v2_defaults, gga_x_hjs_b88_v2_required
