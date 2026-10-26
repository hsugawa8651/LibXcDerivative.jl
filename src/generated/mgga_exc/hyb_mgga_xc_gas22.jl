# Auto-generated from the Libxc sources
# python/mgga_exc/hyb_mgga_xc_gas22.py -- do not edit by hand.
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
# args: rs, z, xt, xs0, xs1, u0, u1, t0, t1, cam_omega, dens_threshold, params_a_c_os_0, params_a_c_os_1, params_a_c_os_2, params_a_c_os_3, params_a_c_os_4, params_a_c_ss_0, params_a_c_ss_1, params_a_c_ss_2, params_a_c_ss_3, params_a_c_ss_4, params_a_c_x_0, params_a_c_x_1, params_a_c_x_2, zeta_threshold
const hyb_mgga_xc_gas22_energy = function (rs, z, xt, xs0, xs1, u0, u1, t0, t1, cam_omega, dens_threshold, params_a_c_os_0, params_a_c_os_1, params_a_c_os_2, params_a_c_os_3, params_a_c_os_4, params_a_c_ss_0, params_a_c_ss_1, params_a_c_ss_2, params_a_c_ss_3, params_a_c_ss_4, params_a_c_x_0, params_a_c_x_1, params_a_c_x_2, zeta_threshold)
    @inbounds begin
        cse_tmp_0 = xs0 ^ 2
        cse_tmp_1 = 0.46914023462026644 * cse_tmp_0
        cse_tmp_2 = cse_tmp_1 + 1
        cse_tmp_3 = 0.010661445329398458 * params_a_c_ss_3
        cse_tmp_4 = xs0 ^ 12 / cse_tmp_2 ^ 6
        cse_tmp_5 = 3.3019272488946267
        cse_tmp_6 = 4.60115111447049
        cse_tmp_7 = (3 // 10) * cse_tmp_5 * cse_tmp_6
        cse_tmp_8 = cse_tmp_7 + t0
        cse_tmp_9 = cse_tmp_8 ^ (-1)
        cse_tmp_10 = -3 // 10 * cse_tmp_5 * cse_tmp_6
        cse_tmp_11 = -cse_tmp_10 - t0
        cse_tmp_12 = cse_tmp_11 * cse_tmp_9
        cse_tmp_13 = 0.010661445329398458 * params_a_c_ss_4
        cse_tmp_14 = z + 1
        cse_tmp_16 = (3 // 8) / (pi * rs ^ 3)
        cse_tmp_18 = zeta_threshold - 1
        cse_tmp_19 = xc_log1p(my_piecewise3(z > cse_tmp_18, z, cse_tmp_18))
        cse_tmp_20 = 0.01328816518 * rs
        cse_tmp_21 = 1.2599210498948732
        cse_tmp_22 = NaNMath.pow(zeta_threshold, 0.3333333333333333)
        cse_tmp_23 = -1 + cse_tmp_22 ^ (-1)
        cse_tmp_24 = my_piecewise3(cse_tmp_14 <= zeta_threshold, cse_tmp_23, xc_expm1(-cse_tmp_19 / 3)) + 1
        cse_tmp_25 = cse_tmp_21 * cse_tmp_24
        cse_tmp_26 = 0.22308199064 * rs
        cse_tmp_27 = NaNMath.sqrt(rs)
        cse_tmp_28 = 0.47231125998 * cse_tmp_27
        cse_tmp_29 = 1.122462048309373
        cse_tmp_30 = NaNMath.sqrt(cse_tmp_24) * cse_tmp_29
        cse_tmp_31 = NaNMath.pow(rs, 1.5)
        cse_tmp_32 = 0.10186556948 * cse_tmp_31
        cse_tmp_33 = 1.4142135623730951
        cse_tmp_34 = NaNMath.pow(cse_tmp_24, 1.5) * cse_tmp_33
        cse_tmp_35 = rs ^ 2
        cse_tmp_36 = 0.030651699316 * cse_tmp_35
        cse_tmp_37 = 1.5874010519681994
        cse_tmp_38 = cse_tmp_24 ^ 2 * cse_tmp_37
        cse_tmp_39 = (-cse_tmp_20 * cse_tmp_25 - 0.0621814) * xc_log1p((cse_tmp_25 * cse_tmp_26 + cse_tmp_28 * cse_tmp_30 + cse_tmp_32 * cse_tmp_34 + cse_tmp_36 * cse_tmp_38) ^ (-1))
        cse_tmp_40 = 0.00375733525 * rs
        cse_tmp_41 = 0.12236585478 * rs
        cse_tmp_42 = 0.3497952466 * cse_tmp_27
        cse_tmp_43 = 0.029729725188 * cse_tmp_31
        cse_tmp_44 = 0.016775784198 * cse_tmp_35
        cse_tmp_45 = 0.5848223622634646207262238663759 * (-cse_tmp_25 * cse_tmp_40 - 0.0337738) * xc_log1p((cse_tmp_25 * cse_tmp_41 + cse_tmp_30 * cse_tmp_42 + cse_tmp_34 * cse_tmp_43 + cse_tmp_38 * cse_tmp_44) ^ (-1))
        cse_tmp_46 = (2 * cse_tmp_21 - 2) ^ (-1)
        cse_tmp_47 = NaNMath.pow(zeta_threshold, 1.3333333333333333)
        cse_tmp_48 = cse_tmp_47 - 1
        cse_tmp_49 = cse_tmp_46 * (cse_tmp_48 + my_piecewise3(2 <= zeta_threshold, cse_tmp_48, xc_expm1((4 // 3) * xc_log1p(my_piecewise3(1 > cse_tmp_18, 1, cse_tmp_18)))))
        cse_tmp_50 = 0.006388517036 * rs
        cse_tmp_51 = 0.19269083139 * rs
        cse_tmp_52 = 0.43896648423 * cse_tmp_27
        cse_tmp_53 = 0.10465751434 * cse_tmp_31
        cse_tmp_54 = 0.019436972919 * cse_tmp_35
        cse_tmp_55 = my_piecewise3(cse_tmp_14 <= zeta_threshold || cse_tmp_14 * cse_tmp_16 <= dens_threshold, 0, (my_piecewise3(cse_tmp_14 <= zeta_threshold, cse_tmp_18, xc_expm1(cse_tmp_19)) / 2 + 1 // 2) * (cse_tmp_39 - cse_tmp_45 * cse_tmp_49 + cse_tmp_49 * (-cse_tmp_39 + cse_tmp_45 + (-cse_tmp_25 * cse_tmp_50 - 0.0310907) * xc_log1p((cse_tmp_25 * cse_tmp_51 + cse_tmp_30 * cse_tmp_52 + cse_tmp_34 * cse_tmp_53 + cse_tmp_38 * cse_tmp_54) ^ (-1)))))
        cse_tmp_56 = xs1 ^ 2
        cse_tmp_57 = 0.46914023462026644 * cse_tmp_56
        cse_tmp_58 = cse_tmp_57 + 1
        cse_tmp_59 = xs1 ^ 12 / cse_tmp_58 ^ 6
        cse_tmp_60 = cse_tmp_7 + t1
        cse_tmp_61 = cse_tmp_60 ^ (-1)
        cse_tmp_62 = -cse_tmp_10 - t1
        cse_tmp_63 = cse_tmp_61 * cse_tmp_62
        cse_tmp_64 = 1 - z
        cse_tmp_67 = -z
        cse_tmp_68 = xc_log1p(my_piecewise3(cse_tmp_67 > cse_tmp_18, cse_tmp_67, cse_tmp_18))
        cse_tmp_69 = my_piecewise3(cse_tmp_64 <= zeta_threshold, cse_tmp_23, xc_expm1(-cse_tmp_68 / 3)) + 1
        cse_tmp_70 = cse_tmp_21 * cse_tmp_69
        cse_tmp_71 = cse_tmp_29 * NaNMath.sqrt(cse_tmp_69)
        cse_tmp_72 = cse_tmp_33 * NaNMath.pow(cse_tmp_69, 1.5)
        cse_tmp_73 = cse_tmp_37 * cse_tmp_69 ^ 2
        cse_tmp_74 = (-cse_tmp_20 * cse_tmp_70 - 0.0621814) * xc_log1p((cse_tmp_26 * cse_tmp_70 + cse_tmp_28 * cse_tmp_71 + cse_tmp_32 * cse_tmp_72 + cse_tmp_36 * cse_tmp_73) ^ (-1))
        cse_tmp_75 = 0.5848223622634646207262238663759 * (-cse_tmp_40 * cse_tmp_70 - 0.0337738) * xc_log1p((cse_tmp_41 * cse_tmp_70 + cse_tmp_42 * cse_tmp_71 + cse_tmp_43 * cse_tmp_72 + cse_tmp_44 * cse_tmp_73) ^ (-1))
        cse_tmp_76 = my_piecewise3(cse_tmp_64 <= zeta_threshold || cse_tmp_16 * cse_tmp_64 <= dens_threshold, 0, (my_piecewise3(cse_tmp_64 <= zeta_threshold, cse_tmp_18, xc_expm1(cse_tmp_68)) / 2 + 1 // 2) * (-cse_tmp_49 * cse_tmp_75 + cse_tmp_49 * (-cse_tmp_74 + cse_tmp_75 + (-cse_tmp_50 * cse_tmp_70 - 0.0310907) * xc_log1p((cse_tmp_51 * cse_tmp_70 + cse_tmp_52 * cse_tmp_71 + cse_tmp_53 * cse_tmp_72 + cse_tmp_54 * cse_tmp_73) ^ (-1))) + cse_tmp_74))
        cse_tmp_77 = cse_tmp_9 * t0
        cse_tmp_78 = cse_tmp_61 * t1
        cse_tmp_79 = cse_tmp_77 + cse_tmp_78
        cse_tmp_80 = cse_tmp_12 * cse_tmp_78 + cse_tmp_63 * cse_tmp_77
        cse_tmp_81 = cse_tmp_80 ^ 2 / cse_tmp_79 ^ 2
        cse_tmp_82 = cse_tmp_80 ^ 6 / cse_tmp_79 ^ 6
        cse_tmp_83 = NaNMath.pow(cse_tmp_0 / 2 + cse_tmp_56 / 2, 0.3333333333333333)
        cse_tmp_84 = -(-cse_tmp_20 - 0.0621814) * xc_log1p((cse_tmp_26 + cse_tmp_28 + cse_tmp_32 + cse_tmp_36) ^ (-1))
        cse_tmp_85 = 0.5848223622634646207262238663759 * (-cse_tmp_40 - 0.0337738) * xc_log1p((cse_tmp_41 + cse_tmp_42 + cse_tmp_43 + cse_tmp_44) ^ (-1))
        cse_tmp_86 = my_piecewise3(cse_tmp_14 <= zeta_threshold, cse_tmp_48, xc_expm1((4 // 3) * cse_tmp_19)) + my_piecewise3(cse_tmp_64 <= zeta_threshold, cse_tmp_48, xc_expm1((4 // 3) * cse_tmp_68))
        cse_tmp_87 = 0.003840616724010807 * cse_tmp_0
        cse_tmp_88 = -cse_tmp_18
        cse_tmp_89 = my_piecewise5(cse_tmp_14 <= zeta_threshold, cse_tmp_18, cse_tmp_64 <= zeta_threshold, cse_tmp_88, z)
        cse_tmp_90 = cse_tmp_89 + 1
        cse_tmp_91 = cse_tmp_90 <= zeta_threshold
        cse_tmp_92 = cse_tmp_22 - 1
        cse_tmp_93 = 0.6827840632552957
        cse_tmp_94 = 1.4422495703074083 * cam_omega * cse_tmp_37 * cse_tmp_93 * rs / 6
        cse_tmp_95 = cse_tmp_94 / (my_piecewise3(cse_tmp_91, cse_tmp_92, xc_expm1(xc_log1p(my_piecewise3(cse_tmp_89 > cse_tmp_18, cse_tmp_89, cse_tmp_18)) / 3)) + 1)
        cse_tmp_96 = cse_tmp_95 > 1.35
        cse_tmp_97 = my_piecewise3(cse_tmp_96, cse_tmp_95, 1.35)
        cse_tmp_98 = my_piecewise3(cse_tmp_96, 1.35, cse_tmp_95)
        cse_tmp_99 = 1.772453850905516
        cse_tmp_100 = cse_tmp_98 ^ 2
        cse_tmp_101 = xc_expm1(-1 / (4 * cse_tmp_100))
        cse_tmp_102 = 0.184639691595506 * 1.8171205928321397 * cse_tmp_93 / rs
        cse_tmp_103 = 0.003840616724010807 * cse_tmp_56
        cse_tmp_104 = my_piecewise5(cse_tmp_64 <= zeta_threshold, cse_tmp_18, cse_tmp_14 <= zeta_threshold, cse_tmp_88, cse_tmp_67)
        cse_tmp_105 = cse_tmp_104 + 1
        cse_tmp_106 = cse_tmp_105 <= zeta_threshold
        cse_tmp_107 = cse_tmp_94 / (my_piecewise3(cse_tmp_106, cse_tmp_92, xc_expm1(xc_log1p(my_piecewise3(cse_tmp_104 > cse_tmp_18, cse_tmp_104, cse_tmp_18)) / 3)) + 1)
        cse_tmp_108 = cse_tmp_107 > 1.35
        cse_tmp_109 = my_piecewise3(cse_tmp_108, cse_tmp_107, 1.35)
        cse_tmp_110 = my_piecewise3(cse_tmp_108, 1.35, cse_tmp_107)
        cse_tmp_111 = cse_tmp_110 ^ 2
        cse_tmp_112 = xc_expm1(-1 / (4 * cse_tmp_111))
        cse_tmp_55 * (cse_tmp_1 * params_a_c_ss_0 / cse_tmp_2 + cse_tmp_11 ^ 4 * cse_tmp_13 * cse_tmp_4 / cse_tmp_8 ^ 4 + cse_tmp_11 ^ 2 * params_a_c_ss_2 / cse_tmp_8 ^ 2 + cse_tmp_12 * params_a_c_ss_1 + cse_tmp_3 * cse_tmp_4) + cse_tmp_76 * (cse_tmp_13 * cse_tmp_59 * cse_tmp_62 ^ 4 / cse_tmp_60 ^ 4 + cse_tmp_3 * cse_tmp_59 + cse_tmp_57 * params_a_c_ss_0 / cse_tmp_58 + cse_tmp_63 * params_a_c_ss_1 + cse_tmp_62 ^ 2 * params_a_c_ss_2 / cse_tmp_60 ^ 2) + (-cse_tmp_46 * cse_tmp_85 * cse_tmp_86 + cse_tmp_46 * cse_tmp_86 * z ^ 4 * (cse_tmp_84 + cse_tmp_85 + (-cse_tmp_50 - 0.0310907) * xc_log1p((cse_tmp_51 + cse_tmp_52 + cse_tmp_53 + cse_tmp_54) ^ (-1))) - cse_tmp_55 - cse_tmp_76 - cse_tmp_84) * (cse_tmp_81 * cse_tmp_83 * params_a_c_os_4 + cse_tmp_81 * params_a_c_os_1 + cse_tmp_82 * cse_tmp_83 * params_a_c_os_3 + cse_tmp_82 * params_a_c_os_2 + params_a_c_os_0) + my_piecewise3(cse_tmp_14 * cse_tmp_16 <= dens_threshold, 0, -cse_tmp_102 * (cse_tmp_12 * params_a_c_x_2 + cse_tmp_87 * params_a_c_x_1 / (cse_tmp_87 + 1) + params_a_c_x_0) * my_piecewise3(cse_tmp_91, cse_tmp_47, NaNMath.pow(cse_tmp_90, 1.3333333333333333)) * my_piecewise3(cse_tmp_95 >= 1.35, 1 / (36 * cse_tmp_97 ^ 2) - 1 / (960 * cse_tmp_97 ^ 4) + 1 / (26880 * cse_tmp_97 ^ 6) - 1 / (829440 * cse_tmp_97 ^ 8) + 1 / (28385280 * cse_tmp_97 ^ 10) - 1 / (1073479680 * cse_tmp_97 ^ 12) + 1 / (44590694400 * cse_tmp_97 ^ 14), -8 // 3 * cse_tmp_98 * (2 * cse_tmp_98 * (-2 * cse_tmp_100 * cse_tmp_101 + cse_tmp_101 - 1 // 2) + cse_tmp_99 * erf(1 / (2 * cse_tmp_98))) + 1)) + my_piecewise3(cse_tmp_16 * cse_tmp_64 <= dens_threshold, 0, -cse_tmp_102 * (cse_tmp_103 * params_a_c_x_1 / (cse_tmp_103 + 1) + cse_tmp_63 * params_a_c_x_2 + params_a_c_x_0) * my_piecewise3(cse_tmp_106, cse_tmp_47, NaNMath.pow(cse_tmp_105, 1.3333333333333333)) * my_piecewise3(cse_tmp_107 >= 1.35, 1 / (36 * cse_tmp_109 ^ 2) - 1 / (960 * cse_tmp_109 ^ 4) + 1 / (26880 * cse_tmp_109 ^ 6) - 1 / (829440 * cse_tmp_109 ^ 8) + 1 / (28385280 * cse_tmp_109 ^ 10) - 1 / (1073479680 * cse_tmp_109 ^ 12) + 1 / (44590694400 * cse_tmp_109 ^ 14), -8 // 3 * cse_tmp_110 * (2 * cse_tmp_110 * (-2 * cse_tmp_111 * cse_tmp_112 + cse_tmp_112 - 1 // 2) + cse_tmp_99 * erf(1 / (2 * cse_tmp_110))) + 1))
    end
end
export hyb_mgga_xc_gas22_energy

const hyb_mgga_xc_gas22_defaults = (cam_omega = 0.3, dens_threshold = 1.0e-13, params_a_c_os_0 = 0.805124374375355, params_a_c_os_1 = 7.98909430970845, params_a_c_os_2 = -7.54815900595292, params_a_c_os_3 = 2.00093961824784, params_a_c_os_4 = -1.76098915061634, params_a_c_ss_0 = 1.0, params_a_c_ss_1 = -4.10753796482853, params_a_c_ss_2 = -5.24218990333846, params_a_c_ss_3 = -1.76643208454076, params_a_c_ss_4 = 7.5380689617542, params_a_c_x_0 = 0.862139736374172, params_a_c_x_1 = 0.936993691972698, params_a_c_x_2 = 0.317533683085033, zeta_threshold = 2.220446049250313e-16)
const hyb_mgga_xc_gas22_required = ()

function hyb_mgga_xc_gas22(rho, sigma, lapl, tau; params = NamedTuple())
    p = resolve_params(hyb_mgga_xc_gas22_defaults, hyb_mgga_xc_gas22_required, params)
    v = mgga_variables(rho, sigma, lapl, tau, Val(3))
    return hyb_mgga_xc_gas22_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.cam_omega, p.dens_threshold, p.params_a_c_os_0, p.params_a_c_os_1, p.params_a_c_os_2, p.params_a_c_os_3, p.params_a_c_os_4, p.params_a_c_ss_0, p.params_a_c_ss_1, p.params_a_c_ss_2, p.params_a_c_ss_3, p.params_a_c_ss_4, p.params_a_c_x_0, p.params_a_c_x_1, p.params_a_c_x_2, p.zeta_threshold)
end

function hyb_mgga_xc_gas22(na, nb, gaa, gab, gbb, la, lb, ta, tb; params = NamedTuple())
    p = resolve_params(hyb_mgga_xc_gas22_defaults, hyb_mgga_xc_gas22_required, params)
    v = mgga_variables(na, nb, gaa, gab, gbb, la, lb, ta, tb, Val(3))
    return hyb_mgga_xc_gas22_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.cam_omega, p.dens_threshold, p.params_a_c_os_0, p.params_a_c_os_1, p.params_a_c_os_2, p.params_a_c_os_3, p.params_a_c_os_4, p.params_a_c_ss_0, p.params_a_c_ss_1, p.params_a_c_ss_2, p.params_a_c_ss_3, p.params_a_c_ss_4, p.params_a_c_x_0, p.params_a_c_x_1, p.params_a_c_x_2, p.zeta_threshold)
end

export hyb_mgga_xc_gas22, hyb_mgga_xc_gas22_defaults, hyb_mgga_xc_gas22_required
