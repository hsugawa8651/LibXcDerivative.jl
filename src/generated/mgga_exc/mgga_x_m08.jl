# Auto-generated from the Libxc sources
# python/mgga_exc/mgga_x_m08.py -- do not edit by hand.
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
# args: rs, z, xt, xs0, xs1, u0, u1, t0, t1, dens_threshold, params_a_a_0, params_a_a_1, params_a_a_2, params_a_a_3, params_a_a_4, params_a_a_5, params_a_a_6, params_a_a_7, params_a_a_8, params_a_a_9, params_a_a_10, params_a_a_11, params_a_b_0, params_a_b_1, params_a_b_2, params_a_b_3, params_a_b_4, params_a_b_5, params_a_b_6, params_a_b_7, params_a_b_8, params_a_b_9, params_a_b_10, params_a_b_11, zeta_threshold
const mgga_x_m08_energy = function (rs, z, xt, xs0, xs1, u0, u1, t0, t1, dens_threshold, params_a_a_0, params_a_a_1, params_a_a_2, params_a_a_3, params_a_a_4, params_a_a_5, params_a_a_6, params_a_a_7, params_a_a_8, params_a_a_9, params_a_a_10, params_a_a_11, params_a_b_0, params_a_b_1, params_a_b_2, params_a_b_3, params_a_b_4, params_a_b_5, params_a_b_6, params_a_b_7, params_a_b_8, params_a_b_9, params_a_b_10, params_a_b_11, zeta_threshold)
    @inbounds begin
        cse_tmp_0 = z + 1
        cse_tmp_1 = (3 // 8) / (pi * rs ^ 3)
        cse_tmp_2 = 1.8171205928321397
        cse_tmp_3 = 4.60115111447049
        cse_tmp_4 = cse_tmp_2 / cse_tmp_3
        cse_tmp_5 = cse_tmp_4 * xs0 ^ 2
        cse_tmp_6 = -120 * params_a_b_10
        cse_tmp_7 = 165 * params_a_b_11
        cse_tmp_8 = -4 * params_a_b_4
        cse_tmp_9 = 10 * params_a_b_5
        cse_tmp_10 = 35 * params_a_b_7
        cse_tmp_11 = -56 * params_a_b_8
        cse_tmp_12 = 84 * params_a_b_9
        cse_tmp_13 = cse_tmp_10 + cse_tmp_11 + cse_tmp_12 + cse_tmp_6 + cse_tmp_7 + cse_tmp_8 + cse_tmp_9 + params_a_b_3 - 20 * params_a_b_6
        cse_tmp_14 = 3.3019272488946267
        cse_tmp_15 = cse_tmp_14 * cse_tmp_3
        cse_tmp_16 = (3 // 10) * cse_tmp_15
        cse_tmp_17 = cse_tmp_16 + t0
        cse_tmp_18 = (972 // 125) * 97.40909103400244
        cse_tmp_19 = cse_tmp_18 / cse_tmp_17 ^ 3
        cse_tmp_20 = 210 * params_a_b_10
        cse_tmp_21 = 462 * params_a_b_11
        cse_tmp_22 = 7 * params_a_b_7
        cse_tmp_23 = 28 * params_a_b_8
        cse_tmp_24 = -cse_tmp_12 + cse_tmp_20 - cse_tmp_21 - cse_tmp_22 + cse_tmp_23 + params_a_b_6
        cse_tmp_25 = (944784 // 15625) * 9488.531016070574
        cse_tmp_26 = cse_tmp_25 / cse_tmp_17 ^ 6
        cse_tmp_27 = -10 * params_a_b_10
        cse_tmp_28 = 55 * params_a_b_11
        cse_tmp_29 = cse_tmp_27 + cse_tmp_28 + params_a_b_9
        cse_tmp_30 = (918330048 // 1953125) * 924269.1815233742
        cse_tmp_31 = cse_tmp_30 / cse_tmp_17 ^ 9
        cse_tmp_32 = 11 * params_a_b_11
        cse_tmp_33 = 3 * params_a_b_3
        cse_tmp_34 = 5 * params_a_b_5
        cse_tmp_35 = -6 * params_a_b_6
        cse_tmp_36 = -8 * params_a_b_8
        cse_tmp_37 = 9 * params_a_b_9
        cse_tmp_38 = cse_tmp_22 + cse_tmp_27 + cse_tmp_32 + cse_tmp_33 + cse_tmp_34 + cse_tmp_35 + cse_tmp_36 + cse_tmp_37 + cse_tmp_8 + params_a_b_1 - 2 * params_a_b_2
        cse_tmp_39 = (3 // 5) * cse_tmp_15
        cse_tmp_40 = cse_tmp_39 / cse_tmp_17
        cse_tmp_41 = 45 * params_a_b_10
        cse_tmp_42 = 15 * params_a_b_6
        cse_tmp_43 = 21 * params_a_b_7
        cse_tmp_44 = 36 * params_a_b_9
        cse_tmp_45 = cse_tmp_23 - cse_tmp_28 - cse_tmp_33 + cse_tmp_41 + cse_tmp_42 - cse_tmp_43 - cse_tmp_44 - cse_tmp_9 + params_a_b_2 + 6 * params_a_b_4
        cse_tmp_46 = (54 // 25) * 21.170591578193033 * cse_tmp_2
        cse_tmp_47 = cse_tmp_46 / cse_tmp_17 ^ 2
        cse_tmp_48 = 330 * params_a_b_11
        cse_tmp_49 = 126 * params_a_b_9
        cse_tmp_50 = -cse_tmp_10 + cse_tmp_20 - cse_tmp_34 + cse_tmp_42 - cse_tmp_48 - cse_tmp_49 + params_a_b_4 + 70 * params_a_b_8
        cse_tmp_51 = (2916 // 625) * 448.1939477706577 * cse_tmp_14
        cse_tmp_52 = cse_tmp_51 / cse_tmp_17 ^ 4
        cse_tmp_53 = cse_tmp_11 + cse_tmp_21 + cse_tmp_35 + cse_tmp_43 + cse_tmp_49 - 252 * params_a_b_10 + params_a_b_5
        cse_tmp_54 = (52488 // 3125) * 2062.2080822838902 * cse_tmp_2
        cse_tmp_55 = cse_tmp_54 / cse_tmp_17 ^ 5
        cse_tmp_56 = cse_tmp_36 + cse_tmp_44 + cse_tmp_48 + cse_tmp_6 + params_a_b_7
        cse_tmp_57 = (2834352 // 78125) * 43658.16505928093 * cse_tmp_14
        cse_tmp_58 = cse_tmp_57 / cse_tmp_17 ^ 7
        cse_tmp_59 = -cse_tmp_37 + cse_tmp_41 - cse_tmp_7 + params_a_b_8
        cse_tmp_60 = (51018336 // 390625) * 200877.81481824708 * cse_tmp_2
        cse_tmp_61 = cse_tmp_60 / cse_tmp_17 ^ 8
        cse_tmp_62 = -cse_tmp_32 + params_a_b_10
        cse_tmp_63 = (2754990144 // 9765625) * 4252702.174637001 * cse_tmp_14
        cse_tmp_64 = cse_tmp_63 / cse_tmp_17 ^ 10
        cse_tmp_65 = (49589822592 // 48828125) * 19567325.350342114 * cse_tmp_2
        cse_tmp_66 = cse_tmp_65 / cse_tmp_17 ^ 11
        cse_tmp_67 = params_a_b_0 - params_a_b_1 + params_a_b_10 - params_a_b_11 + params_a_b_2 - params_a_b_3 + params_a_b_4 - params_a_b_5 + params_a_b_6 - params_a_b_7 + params_a_b_8 - params_a_b_9
        cse_tmp_68 = -120 * params_a_a_10
        cse_tmp_69 = 165 * params_a_a_11
        cse_tmp_70 = -4 * params_a_a_4
        cse_tmp_71 = 10 * params_a_a_5
        cse_tmp_72 = 35 * params_a_a_7
        cse_tmp_73 = -56 * params_a_a_8
        cse_tmp_74 = 84 * params_a_a_9
        cse_tmp_75 = cse_tmp_68 + cse_tmp_69 + cse_tmp_70 + cse_tmp_71 + cse_tmp_72 + cse_tmp_73 + cse_tmp_74 + params_a_a_3 - 20 * params_a_a_6
        cse_tmp_76 = 210 * params_a_a_10
        cse_tmp_77 = 462 * params_a_a_11
        cse_tmp_78 = 7 * params_a_a_7
        cse_tmp_79 = 28 * params_a_a_8
        cse_tmp_80 = -cse_tmp_74 + cse_tmp_76 - cse_tmp_77 - cse_tmp_78 + cse_tmp_79 + params_a_a_6
        cse_tmp_81 = -10 * params_a_a_10
        cse_tmp_82 = 55 * params_a_a_11
        cse_tmp_83 = cse_tmp_81 + cse_tmp_82 + params_a_a_9
        cse_tmp_84 = 11 * params_a_a_11
        cse_tmp_85 = 3 * params_a_a_3
        cse_tmp_86 = 5 * params_a_a_5
        cse_tmp_87 = -6 * params_a_a_6
        cse_tmp_88 = -8 * params_a_a_8
        cse_tmp_89 = 9 * params_a_a_9
        cse_tmp_90 = cse_tmp_70 + cse_tmp_78 + cse_tmp_81 + cse_tmp_84 + cse_tmp_85 + cse_tmp_86 + cse_tmp_87 + cse_tmp_88 + cse_tmp_89 + params_a_a_1 - 2 * params_a_a_2
        cse_tmp_91 = 45 * params_a_a_10
        cse_tmp_92 = 15 * params_a_a_6
        cse_tmp_93 = 21 * params_a_a_7
        cse_tmp_94 = 36 * params_a_a_9
        cse_tmp_95 = -cse_tmp_71 + cse_tmp_79 - cse_tmp_82 - cse_tmp_85 + cse_tmp_91 + cse_tmp_92 - cse_tmp_93 - cse_tmp_94 + params_a_a_2 + 6 * params_a_a_4
        cse_tmp_96 = 330 * params_a_a_11
        cse_tmp_97 = 126 * params_a_a_9
        cse_tmp_98 = -cse_tmp_72 + cse_tmp_76 - cse_tmp_86 + cse_tmp_92 - cse_tmp_96 - cse_tmp_97 + params_a_a_4 + 70 * params_a_a_8
        cse_tmp_99 = cse_tmp_73 + cse_tmp_77 + cse_tmp_87 + cse_tmp_93 + cse_tmp_97 - 252 * params_a_a_10 + params_a_a_5
        cse_tmp_100 = cse_tmp_68 + cse_tmp_88 + cse_tmp_94 + cse_tmp_96 + params_a_a_7
        cse_tmp_101 = -cse_tmp_69 - cse_tmp_89 + cse_tmp_91 + params_a_a_8
        cse_tmp_102 = -cse_tmp_84 + params_a_a_10
        cse_tmp_103 = params_a_a_0 - params_a_a_1 + params_a_a_10 - params_a_a_11 + params_a_a_2 - params_a_a_3 + params_a_a_4 - params_a_a_5 + params_a_a_6 - params_a_a_7 + params_a_a_8 - params_a_a_9
        cse_tmp_104 = cse_tmp_0 <= zeta_threshold
        cse_tmp_105 = zeta_threshold - 1
        cse_tmp_106 = 1 - z
        cse_tmp_107 = cse_tmp_106 <= zeta_threshold
        cse_tmp_108 = -cse_tmp_105
        cse_tmp_109 = my_piecewise5(cse_tmp_104, cse_tmp_105, cse_tmp_107, cse_tmp_108, z) + 1
        cse_tmp_110 = NaNMath.pow(zeta_threshold, 1.3333333333333333)
        cse_tmp_111 = 0.184639691595506 * cse_tmp_2 / (1.4645918875615234 * rs)
        cse_tmp_112 = cse_tmp_4 * xs1 ^ 2
        cse_tmp_113 = cse_tmp_16 + t1
        cse_tmp_114 = cse_tmp_18 / cse_tmp_113 ^ 3
        cse_tmp_115 = cse_tmp_25 / cse_tmp_113 ^ 6
        cse_tmp_116 = cse_tmp_30 / cse_tmp_113 ^ 9
        cse_tmp_117 = cse_tmp_39 / cse_tmp_113
        cse_tmp_118 = cse_tmp_46 / cse_tmp_113 ^ 2
        cse_tmp_119 = cse_tmp_51 / cse_tmp_113 ^ 4
        cse_tmp_120 = cse_tmp_54 / cse_tmp_113 ^ 5
        cse_tmp_121 = cse_tmp_57 / cse_tmp_113 ^ 7
        cse_tmp_122 = cse_tmp_60 / cse_tmp_113 ^ 8
        cse_tmp_123 = cse_tmp_63 / cse_tmp_113 ^ 10
        cse_tmp_124 = cse_tmp_65 / cse_tmp_113 ^ 11
        cse_tmp_125 = my_piecewise5(cse_tmp_107, cse_tmp_105, cse_tmp_104, cse_tmp_108, -z) + 1
        my_piecewise3(cse_tmp_0 * cse_tmp_1 <= dens_threshold, 0, -cse_tmp_111 * ((1 - 0.552 * xc_expm1(-0.00931890022067156 * cse_tmp_5)) * (cse_tmp_13 * cse_tmp_19 + cse_tmp_24 * cse_tmp_26 + cse_tmp_29 * cse_tmp_31 + cse_tmp_38 * cse_tmp_40 + cse_tmp_45 * cse_tmp_47 + cse_tmp_50 * cse_tmp_52 + cse_tmp_53 * cse_tmp_55 + cse_tmp_56 * cse_tmp_58 + cse_tmp_59 * cse_tmp_61 + cse_tmp_62 * cse_tmp_64 + cse_tmp_66 * params_a_b_11 + cse_tmp_67) + (0.007353585 * cse_tmp_5 / (0.00914625 * cse_tmp_5 + 0.804) + 1) * (cse_tmp_100 * cse_tmp_58 + cse_tmp_101 * cse_tmp_61 + cse_tmp_102 * cse_tmp_64 + cse_tmp_103 + cse_tmp_19 * cse_tmp_75 + cse_tmp_26 * cse_tmp_80 + cse_tmp_31 * cse_tmp_83 + cse_tmp_40 * cse_tmp_90 + cse_tmp_47 * cse_tmp_95 + cse_tmp_52 * cse_tmp_98 + cse_tmp_55 * cse_tmp_99 + cse_tmp_66 * params_a_a_11)) * my_piecewise3(cse_tmp_109 <= zeta_threshold, cse_tmp_110, NaNMath.pow(cse_tmp_109, 1.3333333333333333))) + my_piecewise3(cse_tmp_1 * cse_tmp_106 <= dens_threshold, 0, -cse_tmp_111 * ((1 - 0.552 * xc_expm1(-0.00931890022067156 * cse_tmp_112)) * (cse_tmp_114 * cse_tmp_13 + cse_tmp_115 * cse_tmp_24 + cse_tmp_116 * cse_tmp_29 + cse_tmp_117 * cse_tmp_38 + cse_tmp_118 * cse_tmp_45 + cse_tmp_119 * cse_tmp_50 + cse_tmp_120 * cse_tmp_53 + cse_tmp_121 * cse_tmp_56 + cse_tmp_122 * cse_tmp_59 + cse_tmp_123 * cse_tmp_62 + cse_tmp_124 * params_a_b_11 + cse_tmp_67) + (0.007353585 * cse_tmp_112 / (0.00914625 * cse_tmp_112 + 0.804) + 1) * (cse_tmp_100 * cse_tmp_121 + cse_tmp_101 * cse_tmp_122 + cse_tmp_102 * cse_tmp_123 + cse_tmp_103 + cse_tmp_114 * cse_tmp_75 + cse_tmp_115 * cse_tmp_80 + cse_tmp_116 * cse_tmp_83 + cse_tmp_117 * cse_tmp_90 + cse_tmp_118 * cse_tmp_95 + cse_tmp_119 * cse_tmp_98 + cse_tmp_120 * cse_tmp_99 + cse_tmp_124 * params_a_a_11)) * my_piecewise3(cse_tmp_125 <= zeta_threshold, cse_tmp_110, NaNMath.pow(cse_tmp_125, 1.3333333333333333)))
    end
end
export mgga_x_m08_energy

const mgga_x_m08_defaults = NamedTuple()
const mgga_x_m08_required = (:dens_threshold, :params_a_a_0, :params_a_a_1, :params_a_a_2, :params_a_a_3, :params_a_a_4, :params_a_a_5, :params_a_a_6, :params_a_a_7, :params_a_a_8, :params_a_a_9, :params_a_a_10, :params_a_a_11, :params_a_b_0, :params_a_b_1, :params_a_b_2, :params_a_b_3, :params_a_b_4, :params_a_b_5, :params_a_b_6, :params_a_b_7, :params_a_b_8, :params_a_b_9, :params_a_b_10, :params_a_b_11, :zeta_threshold)

function mgga_x_m08(rho, sigma, lapl, tau; params = NamedTuple())
    p = resolve_params(mgga_x_m08_defaults, mgga_x_m08_required, params)
    v = mgga_variables(rho, sigma, lapl, tau, Val(3))
    return mgga_x_m08_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.dens_threshold, p.params_a_a_0, p.params_a_a_1, p.params_a_a_2, p.params_a_a_3, p.params_a_a_4, p.params_a_a_5, p.params_a_a_6, p.params_a_a_7, p.params_a_a_8, p.params_a_a_9, p.params_a_a_10, p.params_a_a_11, p.params_a_b_0, p.params_a_b_1, p.params_a_b_2, p.params_a_b_3, p.params_a_b_4, p.params_a_b_5, p.params_a_b_6, p.params_a_b_7, p.params_a_b_8, p.params_a_b_9, p.params_a_b_10, p.params_a_b_11, p.zeta_threshold)
end

function mgga_x_m08(na, nb, gaa, gab, gbb, la, lb, ta, tb; params = NamedTuple())
    p = resolve_params(mgga_x_m08_defaults, mgga_x_m08_required, params)
    v = mgga_variables(na, nb, gaa, gab, gbb, la, lb, ta, tb, Val(3))
    return mgga_x_m08_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.dens_threshold, p.params_a_a_0, p.params_a_a_1, p.params_a_a_2, p.params_a_a_3, p.params_a_a_4, p.params_a_a_5, p.params_a_a_6, p.params_a_a_7, p.params_a_a_8, p.params_a_a_9, p.params_a_a_10, p.params_a_a_11, p.params_a_b_0, p.params_a_b_1, p.params_a_b_2, p.params_a_b_3, p.params_a_b_4, p.params_a_b_5, p.params_a_b_6, p.params_a_b_7, p.params_a_b_8, p.params_a_b_9, p.params_a_b_10, p.params_a_b_11, p.zeta_threshold)
end

export mgga_x_m08, mgga_x_m08_defaults, mgga_x_m08_required

const hyb_mgga_x_m08_hx_defaults = (dens_threshold = 1.0e-15, params_a_a_0 = 1.3340172, params_a_a_1 = -9.4751087, params_a_a_2 = -12.541893, params_a_a_3 = 9.1369974, params_a_a_4 = 34.717204, params_a_a_5 = 58.831807, params_a_a_6 = 71.369574, params_a_a_7 = 23.312961, params_a_a_8 = 4.8314679, params_a_a_9 = -6.5044167, params_a_a_10 = -14.058265, params_a_a_11 = 12.88057, params_a_b_0 = -0.85631823, params_a_b_1 = 9.2810354, params_a_b_2 = 12.260749, params_a_b_3 = -5.5189665, params_a_b_4 = -35.534989, params_a_b_5 = -82.049996, params_a_b_6 = -68.586558, params_a_b_7 = 36.085694, params_a_b_8 = -9.3740983, params_a_b_9 = -59.731688, params_a_b_10 = 16.587868, params_a_b_11 = 13.993203, zeta_threshold = 2.220446049250313e-16)
const hyb_mgga_x_m08_hx_required = ()

function hyb_mgga_x_m08_hx(rho, sigma, lapl, tau; params = NamedTuple())
    p = resolve_params(hyb_mgga_x_m08_hx_defaults, hyb_mgga_x_m08_hx_required, params)
    v = mgga_variables(rho, sigma, lapl, tau, Val(3))
    return mgga_x_m08_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.dens_threshold, p.params_a_a_0, p.params_a_a_1, p.params_a_a_2, p.params_a_a_3, p.params_a_a_4, p.params_a_a_5, p.params_a_a_6, p.params_a_a_7, p.params_a_a_8, p.params_a_a_9, p.params_a_a_10, p.params_a_a_11, p.params_a_b_0, p.params_a_b_1, p.params_a_b_2, p.params_a_b_3, p.params_a_b_4, p.params_a_b_5, p.params_a_b_6, p.params_a_b_7, p.params_a_b_8, p.params_a_b_9, p.params_a_b_10, p.params_a_b_11, p.zeta_threshold)
end

function hyb_mgga_x_m08_hx(na, nb, gaa, gab, gbb, la, lb, ta, tb; params = NamedTuple())
    p = resolve_params(hyb_mgga_x_m08_hx_defaults, hyb_mgga_x_m08_hx_required, params)
    v = mgga_variables(na, nb, gaa, gab, gbb, la, lb, ta, tb, Val(3))
    return mgga_x_m08_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.dens_threshold, p.params_a_a_0, p.params_a_a_1, p.params_a_a_2, p.params_a_a_3, p.params_a_a_4, p.params_a_a_5, p.params_a_a_6, p.params_a_a_7, p.params_a_a_8, p.params_a_a_9, p.params_a_a_10, p.params_a_a_11, p.params_a_b_0, p.params_a_b_1, p.params_a_b_2, p.params_a_b_3, p.params_a_b_4, p.params_a_b_5, p.params_a_b_6, p.params_a_b_7, p.params_a_b_8, p.params_a_b_9, p.params_a_b_10, p.params_a_b_11, p.zeta_threshold)
end

export hyb_mgga_x_m08_hx, hyb_mgga_x_m08_hx_defaults, hyb_mgga_x_m08_hx_required

const hyb_mgga_x_m08_so_defaults = (dens_threshold = 1.0e-15, params_a_a_0 = -0.34888428, params_a_a_1 = -5.8157416, params_a_a_2 = 37.55081, params_a_a_3 = 63.727406, params_a_a_4 = -53.742313, params_a_a_5 = -98.595529, params_a_a_6 = 16.282216, params_a_a_7 = 17.513468, params_a_a_8 = -6.7627553, params_a_a_9 = 11.106658, params_a_a_10 = 1.5663545, params_a_a_11 = 8.760347, params_a_b_0 = 0.78098428, params_a_b_1 = 5.4538178, params_a_b_2 = -37.853348, params_a_b_3 = -62.29508, params_a_b_4 = 46.713254, params_a_b_5 = 87.321376, params_a_b_6 = 16.053446, params_a_b_7 = 20.12692, params_a_b_8 = -40.343695, params_a_b_9 = -58.577565, params_a_b_10 = 20.890272, params_a_b_11 = 10.946903, zeta_threshold = 2.220446049250313e-16)
const hyb_mgga_x_m08_so_required = ()

function hyb_mgga_x_m08_so(rho, sigma, lapl, tau; params = NamedTuple())
    p = resolve_params(hyb_mgga_x_m08_so_defaults, hyb_mgga_x_m08_so_required, params)
    v = mgga_variables(rho, sigma, lapl, tau, Val(3))
    return mgga_x_m08_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.dens_threshold, p.params_a_a_0, p.params_a_a_1, p.params_a_a_2, p.params_a_a_3, p.params_a_a_4, p.params_a_a_5, p.params_a_a_6, p.params_a_a_7, p.params_a_a_8, p.params_a_a_9, p.params_a_a_10, p.params_a_a_11, p.params_a_b_0, p.params_a_b_1, p.params_a_b_2, p.params_a_b_3, p.params_a_b_4, p.params_a_b_5, p.params_a_b_6, p.params_a_b_7, p.params_a_b_8, p.params_a_b_9, p.params_a_b_10, p.params_a_b_11, p.zeta_threshold)
end

function hyb_mgga_x_m08_so(na, nb, gaa, gab, gbb, la, lb, ta, tb; params = NamedTuple())
    p = resolve_params(hyb_mgga_x_m08_so_defaults, hyb_mgga_x_m08_so_required, params)
    v = mgga_variables(na, nb, gaa, gab, gbb, la, lb, ta, tb, Val(3))
    return mgga_x_m08_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.dens_threshold, p.params_a_a_0, p.params_a_a_1, p.params_a_a_2, p.params_a_a_3, p.params_a_a_4, p.params_a_a_5, p.params_a_a_6, p.params_a_a_7, p.params_a_a_8, p.params_a_a_9, p.params_a_a_10, p.params_a_a_11, p.params_a_b_0, p.params_a_b_1, p.params_a_b_2, p.params_a_b_3, p.params_a_b_4, p.params_a_b_5, p.params_a_b_6, p.params_a_b_7, p.params_a_b_8, p.params_a_b_9, p.params_a_b_10, p.params_a_b_11, p.zeta_threshold)
end

export hyb_mgga_x_m08_so, hyb_mgga_x_m08_so_defaults, hyb_mgga_x_m08_so_required
