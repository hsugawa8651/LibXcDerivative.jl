# Auto-generated from the Libxc sources
# python/mgga_exc/mgga_c_m08.py -- do not edit by hand.
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
# args: rs, z, xt, xs0, xs1, u0, u1, t0, t1, params_a_m08_a_0, params_a_m08_a_1, params_a_m08_a_2, params_a_m08_a_3, params_a_m08_a_4, params_a_m08_a_5, params_a_m08_a_6, params_a_m08_a_7, params_a_m08_a_8, params_a_m08_a_9, params_a_m08_a_10, params_a_m08_a_11, params_a_m08_b_0, params_a_m08_b_1, params_a_m08_b_2, params_a_m08_b_3, params_a_m08_b_4, params_a_m08_b_5, params_a_m08_b_6, params_a_m08_b_7, params_a_m08_b_8, params_a_m08_b_9, params_a_m08_b_10, params_a_m08_b_11, zeta_threshold
const mgga_c_m08_energy = function (rs, z, xt, xs0, xs1, u0, u1, t0, t1, params_a_m08_a_0, params_a_m08_a_1, params_a_m08_a_2, params_a_m08_a_3, params_a_m08_a_4, params_a_m08_a_5, params_a_m08_a_6, params_a_m08_a_7, params_a_m08_a_8, params_a_m08_a_9, params_a_m08_a_10, params_a_m08_a_11, params_a_m08_b_0, params_a_m08_b_1, params_a_m08_b_2, params_a_m08_b_3, params_a_m08_b_4, params_a_m08_b_5, params_a_m08_b_6, params_a_m08_b_7, params_a_m08_b_8, params_a_m08_b_9, params_a_m08_b_10, params_a_m08_b_11, zeta_threshold)
    @inbounds begin
        cse_tmp_0 = NaNMath.sqrt(rs)
        cse_tmp_1 = NaNMath.pow(rs, 1.5)
        cse_tmp_2 = rs ^ 2
        cse_tmp_3 = (-0.01328816518 * rs - 0.0621814) * xc_log1p((0.47231125998 * cse_tmp_0 + 0.10186556948 * cse_tmp_1 + 0.030651699316 * cse_tmp_2 + 0.22308199064 * rs) ^ (-1))
        cse_tmp_4 = 0.5848223622634646207262238663759 * (-0.00375733525 * rs - 0.0337738) * xc_log1p((0.3497952466 * cse_tmp_0 + 0.029729725188 * cse_tmp_1 + 0.016775784198 * cse_tmp_2 + 0.12236585478 * rs) ^ (-1))
        cse_tmp_5 = 1.2599210498948732
        cse_tmp_6 = z + 1 <= zeta_threshold
        cse_tmp_7 = NaNMath.pow(zeta_threshold, 1.3333333333333333) - 1
        cse_tmp_8 = zeta_threshold - 1
        cse_tmp_9 = xc_log1p(my_piecewise3(z > cse_tmp_8, z, cse_tmp_8))
        cse_tmp_10 = 1 - z <= zeta_threshold
        cse_tmp_11 = -z
        cse_tmp_12 = xc_log1p(my_piecewise3(cse_tmp_11 > cse_tmp_8, cse_tmp_11, cse_tmp_8))
        cse_tmp_13 = (my_piecewise3(cse_tmp_10, cse_tmp_7, xc_expm1((4 // 3) * cse_tmp_12)) + my_piecewise3(cse_tmp_6, cse_tmp_7, xc_expm1((4 // 3) * cse_tmp_9))) / (2 * cse_tmp_5 - 2)
        cse_tmp_14 = -cse_tmp_13 * cse_tmp_4 + cse_tmp_13 * z ^ 4 * (-cse_tmp_3 + cse_tmp_4 + (-0.006388517036 * rs - 0.0310907) * xc_log1p((0.43896648423 * cse_tmp_0 + 0.10465751434 * cse_tmp_1 + 0.019436972919 * cse_tmp_2 + 0.19269083139 * rs) ^ (-1))) + cse_tmp_3
        cse_tmp_15 = 1.8171205928321397
        cse_tmp_16 = 3.3019272488946267
        cse_tmp_17 = 4.60115111447049 * cse_tmp_16
        cse_tmp_18 = NaNMath.pow(zeta_threshold, 1.6666666666666667) - 1
        cse_tmp_19 = (3 // 10) * cse_tmp_17 + t0 * (my_piecewise3(cse_tmp_6, cse_tmp_18, xc_expm1((5 // 3) * cse_tmp_9)) + 1) / 2 + t1 * (my_piecewise3(cse_tmp_10, cse_tmp_18, xc_expm1((5 // 3) * cse_tmp_12)) + 1) / 2
        cse_tmp_20 = (49589822592 // 48828125) * 19567325.350342114 * cse_tmp_15 / cse_tmp_19 ^ 11
        cse_tmp_21 = -10 * params_a_m08_a_10
        cse_tmp_22 = 55 * params_a_m08_a_11
        cse_tmp_23 = (918330048 // 1953125) * 924269.1815233742 / cse_tmp_19 ^ 9
        cse_tmp_24 = 11 * params_a_m08_a_11
        cse_tmp_25 = (2754990144 // 9765625) * 4252702.174637001 * cse_tmp_16 / cse_tmp_19 ^ 10
        cse_tmp_26 = 45 * params_a_m08_a_10
        cse_tmp_27 = 165 * params_a_m08_a_11
        cse_tmp_28 = 9 * params_a_m08_a_9
        cse_tmp_29 = (51018336 // 390625) * 200877.81481824708 * cse_tmp_15 / cse_tmp_19 ^ 8
        cse_tmp_30 = 210 * params_a_m08_a_10
        cse_tmp_31 = 462 * params_a_m08_a_11
        cse_tmp_32 = 7 * params_a_m08_a_7
        cse_tmp_33 = 28 * params_a_m08_a_8
        cse_tmp_34 = 84 * params_a_m08_a_9
        cse_tmp_35 = (944784 // 15625) * 9488.531016070574 / cse_tmp_19 ^ 6
        cse_tmp_36 = -120 * params_a_m08_a_10
        cse_tmp_37 = 330 * params_a_m08_a_11
        cse_tmp_38 = -8 * params_a_m08_a_8
        cse_tmp_39 = 36 * params_a_m08_a_9
        cse_tmp_40 = (2834352 // 78125) * 43658.16505928093 * cse_tmp_16 / cse_tmp_19 ^ 7
        cse_tmp_41 = -6 * params_a_m08_a_6
        cse_tmp_42 = 21 * params_a_m08_a_7
        cse_tmp_43 = -56 * params_a_m08_a_8
        cse_tmp_44 = 126 * params_a_m08_a_9
        cse_tmp_45 = (52488 // 3125) * 2062.2080822838902 * cse_tmp_15 / cse_tmp_19 ^ 5
        cse_tmp_46 = -4 * params_a_m08_a_4
        cse_tmp_47 = 10 * params_a_m08_a_5
        cse_tmp_48 = 35 * params_a_m08_a_7
        cse_tmp_49 = (972 // 125) * 97.40909103400244 / cse_tmp_19 ^ 3
        cse_tmp_50 = 5 * params_a_m08_a_5
        cse_tmp_51 = 15 * params_a_m08_a_6
        cse_tmp_52 = (2916 // 625) * 448.1939477706577 * cse_tmp_16 / cse_tmp_19 ^ 4
        cse_tmp_53 = 3 * params_a_m08_a_3
        cse_tmp_54 = (54 // 25) * 21.170591578193033 * cse_tmp_15 / cse_tmp_19 ^ 2
        cse_tmp_55 = (3 // 5) * cse_tmp_17 / cse_tmp_19
        cse_tmp_56 = 9.869604401089358
        cse_tmp_57 = 1 - NaNMath.log(2)
        cse_tmp_58 = NaNMath.pow(zeta_threshold, 0.6666666666666666) - 1
        cse_tmp_59 = my_piecewise3(cse_tmp_10, cse_tmp_58, xc_expm1((2 // 3) * cse_tmp_12)) / 2 + my_piecewise3(cse_tmp_6, cse_tmp_58, xc_expm1((2 // 3) * cse_tmp_9)) / 2 + 1
        cse_tmp_60 = cse_tmp_59 ^ 3
        cse_tmp_61 = -10 * params_a_m08_b_10
        cse_tmp_62 = 55 * params_a_m08_b_11
        cse_tmp_63 = 11 * params_a_m08_b_11
        cse_tmp_64 = 45 * params_a_m08_b_10
        cse_tmp_65 = 165 * params_a_m08_b_11
        cse_tmp_66 = 9 * params_a_m08_b_9
        cse_tmp_67 = 210 * params_a_m08_b_10
        cse_tmp_68 = 462 * params_a_m08_b_11
        cse_tmp_69 = 7 * params_a_m08_b_7
        cse_tmp_70 = 28 * params_a_m08_b_8
        cse_tmp_71 = 84 * params_a_m08_b_9
        cse_tmp_72 = -120 * params_a_m08_b_10
        cse_tmp_73 = 330 * params_a_m08_b_11
        cse_tmp_74 = -8 * params_a_m08_b_8
        cse_tmp_75 = 36 * params_a_m08_b_9
        cse_tmp_76 = -6 * params_a_m08_b_6
        cse_tmp_77 = 21 * params_a_m08_b_7
        cse_tmp_78 = -56 * params_a_m08_b_8
        cse_tmp_79 = 126 * params_a_m08_b_9
        cse_tmp_80 = -4 * params_a_m08_b_4
        cse_tmp_81 = 10 * params_a_m08_b_5
        cse_tmp_82 = 35 * params_a_m08_b_7
        cse_tmp_83 = 5 * params_a_m08_b_5
        cse_tmp_84 = 15 * params_a_m08_b_6
        cse_tmp_85 = 3 * params_a_m08_b_3
        cse_tmp_86 = cse_tmp_56 / cse_tmp_57
        cse_tmp_87 = xc_expm1(-cse_tmp_14 * cse_tmp_86 / cse_tmp_60)
        cse_tmp_88 = cse_tmp_86 / cse_tmp_87
        cse_tmp_89 = 0.06672455060314922 * cse_tmp_88 * (cse_tmp_5 * xt ^ 2 / (32 * cse_tmp_59 ^ 2 * rs) + 6.516069394838791e-5 * 1.5874010519681994 * cse_tmp_88 * xt ^ 4 / (cse_tmp_2 * cse_tmp_59 ^ 4))
        cse_tmp_90 = (cse_tmp_89 + 1) ^ (-1)
        cse_tmp_14 * (cse_tmp_20 * params_a_m08_a_11 + cse_tmp_23 * (cse_tmp_21 + cse_tmp_22 + params_a_m08_a_9) + cse_tmp_25 * (-cse_tmp_24 + params_a_m08_a_10) + cse_tmp_29 * (cse_tmp_26 - cse_tmp_27 - cse_tmp_28 + params_a_m08_a_8) + cse_tmp_35 * (cse_tmp_30 - cse_tmp_31 - cse_tmp_32 + cse_tmp_33 - cse_tmp_34 + params_a_m08_a_6) + cse_tmp_40 * (cse_tmp_36 + cse_tmp_37 + cse_tmp_38 + cse_tmp_39 + params_a_m08_a_7) + cse_tmp_45 * (cse_tmp_31 + cse_tmp_41 + cse_tmp_42 + cse_tmp_43 + cse_tmp_44 - 252 * params_a_m08_a_10 + params_a_m08_a_5) + cse_tmp_49 * (cse_tmp_27 + cse_tmp_34 + cse_tmp_36 + cse_tmp_43 + cse_tmp_46 + cse_tmp_47 + cse_tmp_48 + params_a_m08_a_3 - 20 * params_a_m08_a_6) + cse_tmp_52 * (cse_tmp_30 - cse_tmp_37 - cse_tmp_44 - cse_tmp_48 - cse_tmp_50 + cse_tmp_51 + params_a_m08_a_4 + 70 * params_a_m08_a_8) + cse_tmp_54 * (-cse_tmp_22 + cse_tmp_26 + cse_tmp_33 - cse_tmp_39 - cse_tmp_42 - cse_tmp_47 + cse_tmp_51 - cse_tmp_53 + params_a_m08_a_2 + 6 * params_a_m08_a_4) + cse_tmp_55 * (cse_tmp_21 + cse_tmp_24 + cse_tmp_28 + cse_tmp_32 + cse_tmp_38 + cse_tmp_41 + cse_tmp_46 + cse_tmp_50 + cse_tmp_53 + params_a_m08_a_1 - 2 * params_a_m08_a_2) + params_a_m08_a_0 - params_a_m08_a_1 + params_a_m08_a_10 - params_a_m08_a_11 + params_a_m08_a_2 - params_a_m08_a_3 + params_a_m08_a_4 - params_a_m08_a_5 + params_a_m08_a_6 - params_a_m08_a_7 + params_a_m08_a_8 - params_a_m08_a_9) + cse_tmp_57 * cse_tmp_60 * (cse_tmp_20 * params_a_m08_b_11 + cse_tmp_23 * (cse_tmp_61 + cse_tmp_62 + params_a_m08_b_9) + cse_tmp_25 * (-cse_tmp_63 + params_a_m08_b_10) + cse_tmp_29 * (cse_tmp_64 - cse_tmp_65 - cse_tmp_66 + params_a_m08_b_8) + cse_tmp_35 * (cse_tmp_67 - cse_tmp_68 - cse_tmp_69 + cse_tmp_70 - cse_tmp_71 + params_a_m08_b_6) + cse_tmp_40 * (cse_tmp_72 + cse_tmp_73 + cse_tmp_74 + cse_tmp_75 + params_a_m08_b_7) + cse_tmp_45 * (cse_tmp_68 + cse_tmp_76 + cse_tmp_77 + cse_tmp_78 + cse_tmp_79 - 252 * params_a_m08_b_10 + params_a_m08_b_5) + cse_tmp_49 * (cse_tmp_65 + cse_tmp_71 + cse_tmp_72 + cse_tmp_78 + cse_tmp_80 + cse_tmp_81 + cse_tmp_82 + params_a_m08_b_3 - 20 * params_a_m08_b_6) + cse_tmp_52 * (cse_tmp_67 - cse_tmp_73 - cse_tmp_79 - cse_tmp_82 - cse_tmp_83 + cse_tmp_84 + params_a_m08_b_4 + 70 * params_a_m08_b_8) + cse_tmp_54 * (-cse_tmp_62 + cse_tmp_64 + cse_tmp_70 - cse_tmp_75 - cse_tmp_77 - cse_tmp_81 + cse_tmp_84 - cse_tmp_85 + params_a_m08_b_2 + 6 * params_a_m08_b_4) + cse_tmp_55 * (cse_tmp_61 + cse_tmp_63 + cse_tmp_66 + cse_tmp_69 + cse_tmp_74 + cse_tmp_76 + cse_tmp_80 + cse_tmp_83 + cse_tmp_85 + params_a_m08_b_1 - 2 * params_a_m08_b_2) + params_a_m08_b_0 - params_a_m08_b_1 + params_a_m08_b_10 - params_a_m08_b_11 + params_a_m08_b_2 - params_a_m08_b_3 + params_a_m08_b_4 - params_a_m08_b_5 + params_a_m08_b_6 - params_a_m08_b_7 + params_a_m08_b_8 - params_a_m08_b_9) * xc_log1p(cse_tmp_87 * my_piecewise3(cse_tmp_89 <= 1, cse_tmp_89 * cse_tmp_90, 1 - cse_tmp_90)) / cse_tmp_56
    end
end
export mgga_c_m08_energy

const mgga_c_m08_defaults = NamedTuple()
const mgga_c_m08_required = (:params_a_m08_a_0, :params_a_m08_a_1, :params_a_m08_a_2, :params_a_m08_a_3, :params_a_m08_a_4, :params_a_m08_a_5, :params_a_m08_a_6, :params_a_m08_a_7, :params_a_m08_a_8, :params_a_m08_a_9, :params_a_m08_a_10, :params_a_m08_a_11, :params_a_m08_b_0, :params_a_m08_b_1, :params_a_m08_b_2, :params_a_m08_b_3, :params_a_m08_b_4, :params_a_m08_b_5, :params_a_m08_b_6, :params_a_m08_b_7, :params_a_m08_b_8, :params_a_m08_b_9, :params_a_m08_b_10, :params_a_m08_b_11, :zeta_threshold)

function mgga_c_m08(rho, sigma, lapl, tau; params = NamedTuple())
    p = resolve_params(mgga_c_m08_defaults, mgga_c_m08_required, params)
    v = mgga_variables(rho, sigma, lapl, tau, Val(3))
    return mgga_c_m08_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.params_a_m08_a_0, p.params_a_m08_a_1, p.params_a_m08_a_2, p.params_a_m08_a_3, p.params_a_m08_a_4, p.params_a_m08_a_5, p.params_a_m08_a_6, p.params_a_m08_a_7, p.params_a_m08_a_8, p.params_a_m08_a_9, p.params_a_m08_a_10, p.params_a_m08_a_11, p.params_a_m08_b_0, p.params_a_m08_b_1, p.params_a_m08_b_2, p.params_a_m08_b_3, p.params_a_m08_b_4, p.params_a_m08_b_5, p.params_a_m08_b_6, p.params_a_m08_b_7, p.params_a_m08_b_8, p.params_a_m08_b_9, p.params_a_m08_b_10, p.params_a_m08_b_11, p.zeta_threshold)
end

function mgga_c_m08(na, nb, gaa, gab, gbb, la, lb, ta, tb; params = NamedTuple())
    p = resolve_params(mgga_c_m08_defaults, mgga_c_m08_required, params)
    v = mgga_variables(na, nb, gaa, gab, gbb, la, lb, ta, tb, Val(3))
    return mgga_c_m08_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.params_a_m08_a_0, p.params_a_m08_a_1, p.params_a_m08_a_2, p.params_a_m08_a_3, p.params_a_m08_a_4, p.params_a_m08_a_5, p.params_a_m08_a_6, p.params_a_m08_a_7, p.params_a_m08_a_8, p.params_a_m08_a_9, p.params_a_m08_a_10, p.params_a_m08_a_11, p.params_a_m08_b_0, p.params_a_m08_b_1, p.params_a_m08_b_2, p.params_a_m08_b_3, p.params_a_m08_b_4, p.params_a_m08_b_5, p.params_a_m08_b_6, p.params_a_m08_b_7, p.params_a_m08_b_8, p.params_a_m08_b_9, p.params_a_m08_b_10, p.params_a_m08_b_11, p.zeta_threshold)
end

export mgga_c_m08, mgga_c_m08_defaults, mgga_c_m08_required

const mgga_c_cf22d_defaults = (params_a_m08_a_0 = 0.873863376, params_a_m08_a_1 = 0.078066142, params_a_m08_a_2 = 6.576550257, params_a_m08_a_3 = -1.126030147, params_a_m08_a_4 = -3.244797887, params_a_m08_a_5 = -2.186090839, params_a_m08_a_6 = -3.489135041, params_a_m08_a_7 = 3.090689716, params_a_m08_a_8 = 3.866592474, params_a_m08_a_9 = 0.0, params_a_m08_a_10 = 0.0, params_a_m08_a_11 = 0.0, params_a_m08_b_0 = 0.828203832, params_a_m08_b_1 = -2.518707202, params_a_m08_b_2 = 10.436806314, params_a_m08_b_3 = 3.588267084, params_a_m08_b_4 = -5.789404145, params_a_m08_b_5 = 3.353560215, params_a_m08_b_6 = -2.432384384, params_a_m08_b_7 = -1.147183331, params_a_m08_b_8 = 2.991316045, params_a_m08_b_9 = 0.0, params_a_m08_b_10 = 0.0, params_a_m08_b_11 = 0.0, zeta_threshold = 2.220446049250313e-16)
const mgga_c_cf22d_required = ()

function mgga_c_cf22d(rho, sigma, lapl, tau; params = NamedTuple())
    p = resolve_params(mgga_c_cf22d_defaults, mgga_c_cf22d_required, params)
    v = mgga_variables(rho, sigma, lapl, tau, Val(3))
    return mgga_c_m08_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.params_a_m08_a_0, p.params_a_m08_a_1, p.params_a_m08_a_2, p.params_a_m08_a_3, p.params_a_m08_a_4, p.params_a_m08_a_5, p.params_a_m08_a_6, p.params_a_m08_a_7, p.params_a_m08_a_8, p.params_a_m08_a_9, p.params_a_m08_a_10, p.params_a_m08_a_11, p.params_a_m08_b_0, p.params_a_m08_b_1, p.params_a_m08_b_2, p.params_a_m08_b_3, p.params_a_m08_b_4, p.params_a_m08_b_5, p.params_a_m08_b_6, p.params_a_m08_b_7, p.params_a_m08_b_8, p.params_a_m08_b_9, p.params_a_m08_b_10, p.params_a_m08_b_11, p.zeta_threshold)
end

function mgga_c_cf22d(na, nb, gaa, gab, gbb, la, lb, ta, tb; params = NamedTuple())
    p = resolve_params(mgga_c_cf22d_defaults, mgga_c_cf22d_required, params)
    v = mgga_variables(na, nb, gaa, gab, gbb, la, lb, ta, tb, Val(3))
    return mgga_c_m08_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.params_a_m08_a_0, p.params_a_m08_a_1, p.params_a_m08_a_2, p.params_a_m08_a_3, p.params_a_m08_a_4, p.params_a_m08_a_5, p.params_a_m08_a_6, p.params_a_m08_a_7, p.params_a_m08_a_8, p.params_a_m08_a_9, p.params_a_m08_a_10, p.params_a_m08_a_11, p.params_a_m08_b_0, p.params_a_m08_b_1, p.params_a_m08_b_2, p.params_a_m08_b_3, p.params_a_m08_b_4, p.params_a_m08_b_5, p.params_a_m08_b_6, p.params_a_m08_b_7, p.params_a_m08_b_8, p.params_a_m08_b_9, p.params_a_m08_b_10, p.params_a_m08_b_11, p.zeta_threshold)
end

export mgga_c_cf22d, mgga_c_cf22d_defaults, mgga_c_cf22d_required

const mgga_c_m08_hx_defaults = (params_a_m08_a_0 = 1.0, params_a_m08_a_1 = -0.40661387, params_a_m08_a_2 = -3.323253, params_a_m08_a_3 = 1.554098, params_a_m08_a_4 = 44.248033, params_a_m08_a_5 = -84.35193, params_a_m08_a_6 = -119.55581, params_a_m08_a_7 = 391.47081, params_a_m08_a_8 = 183.63851, params_a_m08_a_9 = -632.68223, params_a_m08_a_10 = -112.97403, params_a_m08_a_11 = 336.29312, params_a_m08_b_0 = 1.3812334, params_a_m08_b_1 = -2.4683806, params_a_m08_b_2 = -11.901501, params_a_m08_b_3 = -54.112667, params_a_m08_b_4 = 10.055846, params_a_m08_b_5 = 148.00687, params_a_m08_b_6 = 115.6142, params_a_m08_b_7 = 255.91815, params_a_m08_b_8 = 213.20772, params_a_m08_b_9 = -484.12067, params_a_m08_b_10 = -434.30813, params_a_m08_b_11 = 56.627964, zeta_threshold = 2.220446049250313e-16)
const mgga_c_m08_hx_required = ()

function mgga_c_m08_hx(rho, sigma, lapl, tau; params = NamedTuple())
    p = resolve_params(mgga_c_m08_hx_defaults, mgga_c_m08_hx_required, params)
    v = mgga_variables(rho, sigma, lapl, tau, Val(3))
    return mgga_c_m08_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.params_a_m08_a_0, p.params_a_m08_a_1, p.params_a_m08_a_2, p.params_a_m08_a_3, p.params_a_m08_a_4, p.params_a_m08_a_5, p.params_a_m08_a_6, p.params_a_m08_a_7, p.params_a_m08_a_8, p.params_a_m08_a_9, p.params_a_m08_a_10, p.params_a_m08_a_11, p.params_a_m08_b_0, p.params_a_m08_b_1, p.params_a_m08_b_2, p.params_a_m08_b_3, p.params_a_m08_b_4, p.params_a_m08_b_5, p.params_a_m08_b_6, p.params_a_m08_b_7, p.params_a_m08_b_8, p.params_a_m08_b_9, p.params_a_m08_b_10, p.params_a_m08_b_11, p.zeta_threshold)
end

function mgga_c_m08_hx(na, nb, gaa, gab, gbb, la, lb, ta, tb; params = NamedTuple())
    p = resolve_params(mgga_c_m08_hx_defaults, mgga_c_m08_hx_required, params)
    v = mgga_variables(na, nb, gaa, gab, gbb, la, lb, ta, tb, Val(3))
    return mgga_c_m08_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.params_a_m08_a_0, p.params_a_m08_a_1, p.params_a_m08_a_2, p.params_a_m08_a_3, p.params_a_m08_a_4, p.params_a_m08_a_5, p.params_a_m08_a_6, p.params_a_m08_a_7, p.params_a_m08_a_8, p.params_a_m08_a_9, p.params_a_m08_a_10, p.params_a_m08_a_11, p.params_a_m08_b_0, p.params_a_m08_b_1, p.params_a_m08_b_2, p.params_a_m08_b_3, p.params_a_m08_b_4, p.params_a_m08_b_5, p.params_a_m08_b_6, p.params_a_m08_b_7, p.params_a_m08_b_8, p.params_a_m08_b_9, p.params_a_m08_b_10, p.params_a_m08_b_11, p.zeta_threshold)
end

export mgga_c_m08_hx, mgga_c_m08_hx_defaults, mgga_c_m08_hx_required

const mgga_c_m08_so_defaults = (params_a_m08_a_0 = 1.0, params_a_m08_a_1 = 0.0, params_a_m08_a_2 = -3.9980886, params_a_m08_a_3 = 12.98234, params_a_m08_a_4 = 101.17507, params_a_m08_a_5 = -89.541984, params_a_m08_a_6 = -356.40242, params_a_m08_a_7 = 206.98803, params_a_m08_a_8 = 460.3778, params_a_m08_a_9 = -245.10559, params_a_m08_a_10 = -196.38425, params_a_m08_a_11 = 118.81459, params_a_m08_b_0 = 1.0, params_a_m08_b_1 = -4.4117403, params_a_m08_b_2 = -6.4128622, params_a_m08_b_3 = 47.583635, params_a_m08_b_4 = 186.30053, params_a_m08_b_5 = -128.00784, params_a_m08_b_6 = -553.85258, params_a_m08_b_7 = 138.73727, params_a_m08_b_8 = 416.46537, params_a_m08_b_9 = -266.26577, params_a_m08_b_10 = 56.6763, params_a_m08_b_11 = 316.73746, zeta_threshold = 2.220446049250313e-16)
const mgga_c_m08_so_required = ()

function mgga_c_m08_so(rho, sigma, lapl, tau; params = NamedTuple())
    p = resolve_params(mgga_c_m08_so_defaults, mgga_c_m08_so_required, params)
    v = mgga_variables(rho, sigma, lapl, tau, Val(3))
    return mgga_c_m08_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.params_a_m08_a_0, p.params_a_m08_a_1, p.params_a_m08_a_2, p.params_a_m08_a_3, p.params_a_m08_a_4, p.params_a_m08_a_5, p.params_a_m08_a_6, p.params_a_m08_a_7, p.params_a_m08_a_8, p.params_a_m08_a_9, p.params_a_m08_a_10, p.params_a_m08_a_11, p.params_a_m08_b_0, p.params_a_m08_b_1, p.params_a_m08_b_2, p.params_a_m08_b_3, p.params_a_m08_b_4, p.params_a_m08_b_5, p.params_a_m08_b_6, p.params_a_m08_b_7, p.params_a_m08_b_8, p.params_a_m08_b_9, p.params_a_m08_b_10, p.params_a_m08_b_11, p.zeta_threshold)
end

function mgga_c_m08_so(na, nb, gaa, gab, gbb, la, lb, ta, tb; params = NamedTuple())
    p = resolve_params(mgga_c_m08_so_defaults, mgga_c_m08_so_required, params)
    v = mgga_variables(na, nb, gaa, gab, gbb, la, lb, ta, tb, Val(3))
    return mgga_c_m08_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.params_a_m08_a_0, p.params_a_m08_a_1, p.params_a_m08_a_2, p.params_a_m08_a_3, p.params_a_m08_a_4, p.params_a_m08_a_5, p.params_a_m08_a_6, p.params_a_m08_a_7, p.params_a_m08_a_8, p.params_a_m08_a_9, p.params_a_m08_a_10, p.params_a_m08_a_11, p.params_a_m08_b_0, p.params_a_m08_b_1, p.params_a_m08_b_2, p.params_a_m08_b_3, p.params_a_m08_b_4, p.params_a_m08_b_5, p.params_a_m08_b_6, p.params_a_m08_b_7, p.params_a_m08_b_8, p.params_a_m08_b_9, p.params_a_m08_b_10, p.params_a_m08_b_11, p.zeta_threshold)
end

export mgga_c_m08_so, mgga_c_m08_so_defaults, mgga_c_m08_so_required

const mgga_c_m11_defaults = (params_a_m08_a_0 = 1.0, params_a_m08_a_1 = 0.0, params_a_m08_a_2 = -3.893325, params_a_m08_a_3 = -2.1688455, params_a_m08_a_4 = 9.34972, params_a_m08_a_5 = -19.84514, params_a_m08_a_6 = 2.3455253, params_a_m08_a_7 = 79.246513, params_a_m08_a_8 = 9.6042757, params_a_m08_a_9 = -67.856719, params_a_m08_a_10 = -9.1841067, params_a_m08_a_11 = 0.0, params_a_m08_b_0 = 0.72239798, params_a_m08_b_1 = 0.43730564, params_a_m08_b_2 = -16.088809, params_a_m08_b_3 = -65.542437, params_a_m08_b_4 = 32.05723, params_a_m08_b_5 = 186.17888, params_a_m08_b_6 = 20.483468, params_a_m08_b_7 = -70.853739, params_a_m08_b_8 = 44.483915, params_a_m08_b_9 = -94.484747, params_a_m08_b_10 = -114.59868, params_a_m08_b_11 = 0.0, zeta_threshold = 2.220446049250313e-16)
const mgga_c_m11_required = ()

function mgga_c_m11(rho, sigma, lapl, tau; params = NamedTuple())
    p = resolve_params(mgga_c_m11_defaults, mgga_c_m11_required, params)
    v = mgga_variables(rho, sigma, lapl, tau, Val(3))
    return mgga_c_m08_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.params_a_m08_a_0, p.params_a_m08_a_1, p.params_a_m08_a_2, p.params_a_m08_a_3, p.params_a_m08_a_4, p.params_a_m08_a_5, p.params_a_m08_a_6, p.params_a_m08_a_7, p.params_a_m08_a_8, p.params_a_m08_a_9, p.params_a_m08_a_10, p.params_a_m08_a_11, p.params_a_m08_b_0, p.params_a_m08_b_1, p.params_a_m08_b_2, p.params_a_m08_b_3, p.params_a_m08_b_4, p.params_a_m08_b_5, p.params_a_m08_b_6, p.params_a_m08_b_7, p.params_a_m08_b_8, p.params_a_m08_b_9, p.params_a_m08_b_10, p.params_a_m08_b_11, p.zeta_threshold)
end

function mgga_c_m11(na, nb, gaa, gab, gbb, la, lb, ta, tb; params = NamedTuple())
    p = resolve_params(mgga_c_m11_defaults, mgga_c_m11_required, params)
    v = mgga_variables(na, nb, gaa, gab, gbb, la, lb, ta, tb, Val(3))
    return mgga_c_m08_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.params_a_m08_a_0, p.params_a_m08_a_1, p.params_a_m08_a_2, p.params_a_m08_a_3, p.params_a_m08_a_4, p.params_a_m08_a_5, p.params_a_m08_a_6, p.params_a_m08_a_7, p.params_a_m08_a_8, p.params_a_m08_a_9, p.params_a_m08_a_10, p.params_a_m08_a_11, p.params_a_m08_b_0, p.params_a_m08_b_1, p.params_a_m08_b_2, p.params_a_m08_b_3, p.params_a_m08_b_4, p.params_a_m08_b_5, p.params_a_m08_b_6, p.params_a_m08_b_7, p.params_a_m08_b_8, p.params_a_m08_b_9, p.params_a_m08_b_10, p.params_a_m08_b_11, p.zeta_threshold)
end

export mgga_c_m11, mgga_c_m11_defaults, mgga_c_m11_required

const mgga_c_m11_l_defaults = (params_a_m08_a_0 = 1.0, params_a_m08_a_1 = 0.0, params_a_m08_a_2 = 2.75088, params_a_m08_a_3 = -15.62287, params_a_m08_a_4 = 9.363381, params_a_m08_a_5 = 21.41024, params_a_m08_a_6 = -14.24975, params_a_m08_a_7 = -11.34712, params_a_m08_a_8 = 10.22365, params_a_m08_a_9 = 0.0, params_a_m08_a_10 = 0.0, params_a_m08_a_11 = 0.0, params_a_m08_b_0 = 1.0, params_a_m08_b_1 = -9.08206, params_a_m08_b_2 = 6.134682, params_a_m08_b_3 = -13.33216, params_a_m08_b_4 = -14.64115, params_a_m08_b_5 = 17.13143, params_a_m08_b_6 = 2.480738, params_a_m08_b_7 = -10.07036, params_a_m08_b_8 = -0.1117521, params_a_m08_b_9 = 0.0, params_a_m08_b_10 = 0.0, params_a_m08_b_11 = 0.0, zeta_threshold = 2.220446049250313e-16)
const mgga_c_m11_l_required = ()

function mgga_c_m11_l(rho, sigma, lapl, tau; params = NamedTuple())
    p = resolve_params(mgga_c_m11_l_defaults, mgga_c_m11_l_required, params)
    v = mgga_variables(rho, sigma, lapl, tau, Val(3))
    return mgga_c_m08_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.params_a_m08_a_0, p.params_a_m08_a_1, p.params_a_m08_a_2, p.params_a_m08_a_3, p.params_a_m08_a_4, p.params_a_m08_a_5, p.params_a_m08_a_6, p.params_a_m08_a_7, p.params_a_m08_a_8, p.params_a_m08_a_9, p.params_a_m08_a_10, p.params_a_m08_a_11, p.params_a_m08_b_0, p.params_a_m08_b_1, p.params_a_m08_b_2, p.params_a_m08_b_3, p.params_a_m08_b_4, p.params_a_m08_b_5, p.params_a_m08_b_6, p.params_a_m08_b_7, p.params_a_m08_b_8, p.params_a_m08_b_9, p.params_a_m08_b_10, p.params_a_m08_b_11, p.zeta_threshold)
end

function mgga_c_m11_l(na, nb, gaa, gab, gbb, la, lb, ta, tb; params = NamedTuple())
    p = resolve_params(mgga_c_m11_l_defaults, mgga_c_m11_l_required, params)
    v = mgga_variables(na, nb, gaa, gab, gbb, la, lb, ta, tb, Val(3))
    return mgga_c_m08_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.params_a_m08_a_0, p.params_a_m08_a_1, p.params_a_m08_a_2, p.params_a_m08_a_3, p.params_a_m08_a_4, p.params_a_m08_a_5, p.params_a_m08_a_6, p.params_a_m08_a_7, p.params_a_m08_a_8, p.params_a_m08_a_9, p.params_a_m08_a_10, p.params_a_m08_a_11, p.params_a_m08_b_0, p.params_a_m08_b_1, p.params_a_m08_b_2, p.params_a_m08_b_3, p.params_a_m08_b_4, p.params_a_m08_b_5, p.params_a_m08_b_6, p.params_a_m08_b_7, p.params_a_m08_b_8, p.params_a_m08_b_9, p.params_a_m08_b_10, p.params_a_m08_b_11, p.zeta_threshold)
end

export mgga_c_m11_l, mgga_c_m11_l_defaults, mgga_c_m11_l_required

const mgga_c_mn12_l_defaults = (params_a_m08_a_0 = 0.884461, params_a_m08_a_1 = -0.2202279, params_a_m08_a_2 = 5.701372, params_a_m08_a_3 = -2.562378, params_a_m08_a_4 = -0.9646827, params_a_m08_a_5 = 0.1982183, params_a_m08_a_6 = 10.19976, params_a_m08_a_7 = 0.9789352, params_a_m08_a_8 = -1.512722, params_a_m08_a_9 = 0.0, params_a_m08_a_10 = 0.0, params_a_m08_a_11 = 0.0, params_a_m08_b_0 = 0.5323948, params_a_m08_b_1 = -5.831909, params_a_m08_b_2 = 3.882386, params_a_m08_b_3 = 5.878488, params_a_m08_b_4 = 14.93228, params_a_m08_b_5 = -13.74636, params_a_m08_b_6 = -8.492327, params_a_m08_b_7 = -2.486548, params_a_m08_b_8 = -18.22346, params_a_m08_b_9 = 0.0, params_a_m08_b_10 = 0.0, params_a_m08_b_11 = 0.0, zeta_threshold = 2.220446049250313e-16)
const mgga_c_mn12_l_required = ()

function mgga_c_mn12_l(rho, sigma, lapl, tau; params = NamedTuple())
    p = resolve_params(mgga_c_mn12_l_defaults, mgga_c_mn12_l_required, params)
    v = mgga_variables(rho, sigma, lapl, tau, Val(3))
    return mgga_c_m08_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.params_a_m08_a_0, p.params_a_m08_a_1, p.params_a_m08_a_2, p.params_a_m08_a_3, p.params_a_m08_a_4, p.params_a_m08_a_5, p.params_a_m08_a_6, p.params_a_m08_a_7, p.params_a_m08_a_8, p.params_a_m08_a_9, p.params_a_m08_a_10, p.params_a_m08_a_11, p.params_a_m08_b_0, p.params_a_m08_b_1, p.params_a_m08_b_2, p.params_a_m08_b_3, p.params_a_m08_b_4, p.params_a_m08_b_5, p.params_a_m08_b_6, p.params_a_m08_b_7, p.params_a_m08_b_8, p.params_a_m08_b_9, p.params_a_m08_b_10, p.params_a_m08_b_11, p.zeta_threshold)
end

function mgga_c_mn12_l(na, nb, gaa, gab, gbb, la, lb, ta, tb; params = NamedTuple())
    p = resolve_params(mgga_c_mn12_l_defaults, mgga_c_mn12_l_required, params)
    v = mgga_variables(na, nb, gaa, gab, gbb, la, lb, ta, tb, Val(3))
    return mgga_c_m08_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.params_a_m08_a_0, p.params_a_m08_a_1, p.params_a_m08_a_2, p.params_a_m08_a_3, p.params_a_m08_a_4, p.params_a_m08_a_5, p.params_a_m08_a_6, p.params_a_m08_a_7, p.params_a_m08_a_8, p.params_a_m08_a_9, p.params_a_m08_a_10, p.params_a_m08_a_11, p.params_a_m08_b_0, p.params_a_m08_b_1, p.params_a_m08_b_2, p.params_a_m08_b_3, p.params_a_m08_b_4, p.params_a_m08_b_5, p.params_a_m08_b_6, p.params_a_m08_b_7, p.params_a_m08_b_8, p.params_a_m08_b_9, p.params_a_m08_b_10, p.params_a_m08_b_11, p.zeta_threshold)
end

export mgga_c_mn12_l, mgga_c_mn12_l_defaults, mgga_c_mn12_l_required

const mgga_c_mn12_sx_defaults = (params_a_m08_a_0 = 0.7171161, params_a_m08_a_1 = -2.380914, params_a_m08_a_2 = 5.793565, params_a_m08_a_3 = -1.243624, params_a_m08_a_4 = 13.6492, params_a_m08_a_5 = -21.10812, params_a_m08_a_6 = -15.98767, params_a_m08_a_7 = 14.29208, params_a_m08_a_8 = 6.149191, params_a_m08_a_9 = 0.0, params_a_m08_a_10 = 0.0, params_a_m08_a_11 = 0.0, params_a_m08_b_0 = 0.4663699, params_a_m08_b_1 = -9.110685, params_a_m08_b_2 = 8.705051, params_a_m08_b_3 = -1.813949, params_a_m08_b_4 = -0.4147211, params_a_m08_b_5 = -10.21527, params_a_m08_b_6 = 0.824027, params_a_m08_b_7 = 4.993815, params_a_m08_b_8 = -25.6393, params_a_m08_b_9 = 0.0, params_a_m08_b_10 = 0.0, params_a_m08_b_11 = 0.0, zeta_threshold = 2.220446049250313e-16)
const mgga_c_mn12_sx_required = ()

function mgga_c_mn12_sx(rho, sigma, lapl, tau; params = NamedTuple())
    p = resolve_params(mgga_c_mn12_sx_defaults, mgga_c_mn12_sx_required, params)
    v = mgga_variables(rho, sigma, lapl, tau, Val(3))
    return mgga_c_m08_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.params_a_m08_a_0, p.params_a_m08_a_1, p.params_a_m08_a_2, p.params_a_m08_a_3, p.params_a_m08_a_4, p.params_a_m08_a_5, p.params_a_m08_a_6, p.params_a_m08_a_7, p.params_a_m08_a_8, p.params_a_m08_a_9, p.params_a_m08_a_10, p.params_a_m08_a_11, p.params_a_m08_b_0, p.params_a_m08_b_1, p.params_a_m08_b_2, p.params_a_m08_b_3, p.params_a_m08_b_4, p.params_a_m08_b_5, p.params_a_m08_b_6, p.params_a_m08_b_7, p.params_a_m08_b_8, p.params_a_m08_b_9, p.params_a_m08_b_10, p.params_a_m08_b_11, p.zeta_threshold)
end

function mgga_c_mn12_sx(na, nb, gaa, gab, gbb, la, lb, ta, tb; params = NamedTuple())
    p = resolve_params(mgga_c_mn12_sx_defaults, mgga_c_mn12_sx_required, params)
    v = mgga_variables(na, nb, gaa, gab, gbb, la, lb, ta, tb, Val(3))
    return mgga_c_m08_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.params_a_m08_a_0, p.params_a_m08_a_1, p.params_a_m08_a_2, p.params_a_m08_a_3, p.params_a_m08_a_4, p.params_a_m08_a_5, p.params_a_m08_a_6, p.params_a_m08_a_7, p.params_a_m08_a_8, p.params_a_m08_a_9, p.params_a_m08_a_10, p.params_a_m08_a_11, p.params_a_m08_b_0, p.params_a_m08_b_1, p.params_a_m08_b_2, p.params_a_m08_b_3, p.params_a_m08_b_4, p.params_a_m08_b_5, p.params_a_m08_b_6, p.params_a_m08_b_7, p.params_a_m08_b_8, p.params_a_m08_b_9, p.params_a_m08_b_10, p.params_a_m08_b_11, p.zeta_threshold)
end

export mgga_c_mn12_sx, mgga_c_mn12_sx_defaults, mgga_c_mn12_sx_required

const mgga_c_mn15_defaults = (params_a_m08_a_0 = 1.093250748, params_a_m08_a_1 = -0.269735037, params_a_m08_a_2 = 6.368997613, params_a_m08_a_3 = -0.245337101, params_a_m08_a_4 = -1.587103441, params_a_m08_a_5 = 0.124698862, params_a_m08_a_6 = 1.605819855, params_a_m08_a_7 = 0.466206031, params_a_m08_a_8 = 3.484978654, params_a_m08_a_9 = 0.0, params_a_m08_a_10 = 0.0, params_a_m08_a_11 = 0.0, params_a_m08_b_0 = 1.427424993, params_a_m08_b_1 = -3.57883682, params_a_m08_b_2 = 7.398727547, params_a_m08_b_3 = 3.927810559, params_a_m08_b_4 = 2.789804639, params_a_m08_b_5 = 4.988320462, params_a_m08_b_6 = 3.079464318, params_a_m08_b_7 = 3.521636859, params_a_m08_b_8 = 4.769671992, params_a_m08_b_9 = 0.0, params_a_m08_b_10 = 0.0, params_a_m08_b_11 = 0.0, zeta_threshold = 2.220446049250313e-16)
const mgga_c_mn15_required = ()

function mgga_c_mn15(rho, sigma, lapl, tau; params = NamedTuple())
    p = resolve_params(mgga_c_mn15_defaults, mgga_c_mn15_required, params)
    v = mgga_variables(rho, sigma, lapl, tau, Val(3))
    return mgga_c_m08_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.params_a_m08_a_0, p.params_a_m08_a_1, p.params_a_m08_a_2, p.params_a_m08_a_3, p.params_a_m08_a_4, p.params_a_m08_a_5, p.params_a_m08_a_6, p.params_a_m08_a_7, p.params_a_m08_a_8, p.params_a_m08_a_9, p.params_a_m08_a_10, p.params_a_m08_a_11, p.params_a_m08_b_0, p.params_a_m08_b_1, p.params_a_m08_b_2, p.params_a_m08_b_3, p.params_a_m08_b_4, p.params_a_m08_b_5, p.params_a_m08_b_6, p.params_a_m08_b_7, p.params_a_m08_b_8, p.params_a_m08_b_9, p.params_a_m08_b_10, p.params_a_m08_b_11, p.zeta_threshold)
end

function mgga_c_mn15(na, nb, gaa, gab, gbb, la, lb, ta, tb; params = NamedTuple())
    p = resolve_params(mgga_c_mn15_defaults, mgga_c_mn15_required, params)
    v = mgga_variables(na, nb, gaa, gab, gbb, la, lb, ta, tb, Val(3))
    return mgga_c_m08_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.params_a_m08_a_0, p.params_a_m08_a_1, p.params_a_m08_a_2, p.params_a_m08_a_3, p.params_a_m08_a_4, p.params_a_m08_a_5, p.params_a_m08_a_6, p.params_a_m08_a_7, p.params_a_m08_a_8, p.params_a_m08_a_9, p.params_a_m08_a_10, p.params_a_m08_a_11, p.params_a_m08_b_0, p.params_a_m08_b_1, p.params_a_m08_b_2, p.params_a_m08_b_3, p.params_a_m08_b_4, p.params_a_m08_b_5, p.params_a_m08_b_6, p.params_a_m08_b_7, p.params_a_m08_b_8, p.params_a_m08_b_9, p.params_a_m08_b_10, p.params_a_m08_b_11, p.zeta_threshold)
end

export mgga_c_mn15, mgga_c_mn15_defaults, mgga_c_mn15_required

const mgga_c_mn15_l_defaults = (params_a_m08_a_0 = 0.952058087, params_a_m08_a_1 = -0.756954364, params_a_m08_a_2 = 5.677396094, params_a_m08_a_3 = -5.017104782, params_a_m08_a_4 = -5.10654071, params_a_m08_a_5 = -4.812053335, params_a_m08_a_6 = 3.397640087, params_a_m08_a_7 = 1.980041517, params_a_m08_a_8 = 10.1231046, params_a_m08_a_9 = 0.0, params_a_m08_a_10 = 0.0, params_a_m08_a_11 = 0.0, params_a_m08_b_0 = 0.819504932, params_a_m08_b_1 = -7.689358913, params_a_m08_b_2 = -0.70532663, params_a_m08_b_3 = -0.600096421, params_a_m08_b_4 = 11.03332527, params_a_m08_b_5 = 5.861969337, params_a_m08_b_6 = 8.913865465, params_a_m08_b_7 = 5.74529876, params_a_m08_b_8 = 4.254880837, params_a_m08_b_9 = 0.0, params_a_m08_b_10 = 0.0, params_a_m08_b_11 = 0.0, zeta_threshold = 2.220446049250313e-16)
const mgga_c_mn15_l_required = ()

function mgga_c_mn15_l(rho, sigma, lapl, tau; params = NamedTuple())
    p = resolve_params(mgga_c_mn15_l_defaults, mgga_c_mn15_l_required, params)
    v = mgga_variables(rho, sigma, lapl, tau, Val(3))
    return mgga_c_m08_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.params_a_m08_a_0, p.params_a_m08_a_1, p.params_a_m08_a_2, p.params_a_m08_a_3, p.params_a_m08_a_4, p.params_a_m08_a_5, p.params_a_m08_a_6, p.params_a_m08_a_7, p.params_a_m08_a_8, p.params_a_m08_a_9, p.params_a_m08_a_10, p.params_a_m08_a_11, p.params_a_m08_b_0, p.params_a_m08_b_1, p.params_a_m08_b_2, p.params_a_m08_b_3, p.params_a_m08_b_4, p.params_a_m08_b_5, p.params_a_m08_b_6, p.params_a_m08_b_7, p.params_a_m08_b_8, p.params_a_m08_b_9, p.params_a_m08_b_10, p.params_a_m08_b_11, p.zeta_threshold)
end

function mgga_c_mn15_l(na, nb, gaa, gab, gbb, la, lb, ta, tb; params = NamedTuple())
    p = resolve_params(mgga_c_mn15_l_defaults, mgga_c_mn15_l_required, params)
    v = mgga_variables(na, nb, gaa, gab, gbb, la, lb, ta, tb, Val(3))
    return mgga_c_m08_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.params_a_m08_a_0, p.params_a_m08_a_1, p.params_a_m08_a_2, p.params_a_m08_a_3, p.params_a_m08_a_4, p.params_a_m08_a_5, p.params_a_m08_a_6, p.params_a_m08_a_7, p.params_a_m08_a_8, p.params_a_m08_a_9, p.params_a_m08_a_10, p.params_a_m08_a_11, p.params_a_m08_b_0, p.params_a_m08_b_1, p.params_a_m08_b_2, p.params_a_m08_b_3, p.params_a_m08_b_4, p.params_a_m08_b_5, p.params_a_m08_b_6, p.params_a_m08_b_7, p.params_a_m08_b_8, p.params_a_m08_b_9, p.params_a_m08_b_10, p.params_a_m08_b_11, p.zeta_threshold)
end

export mgga_c_mn15_l, mgga_c_mn15_l_defaults, mgga_c_mn15_l_required

const mgga_c_revm11_defaults = (params_a_m08_a_0 = 1.0, params_a_m08_a_1 = 0.0, params_a_m08_a_2 = -0.7860212983, params_a_m08_a_3 = -5.1132585425, params_a_m08_a_4 = -4.0716488878, params_a_m08_a_5 = 1.5806421214, params_a_m08_a_6 = 8.4135687567, params_a_m08_a_7 = 0.0, params_a_m08_a_8 = 0.0, params_a_m08_a_9 = 0.0, params_a_m08_a_10 = 0.0, params_a_m08_a_11 = 0.0, params_a_m08_b_0 = 0.9732839024, params_a_m08_b_1 = -2.1674450396, params_a_m08_b_2 = -9.3318324572, params_a_m08_b_3 = -12.9399606617, params_a_m08_b_4 = -2.212932066, params_a_m08_b_5 = -2.95085491, params_a_m08_b_6 = -1.506631936, params_a_m08_b_7 = 0.0, params_a_m08_b_8 = 0.0, params_a_m08_b_9 = 0.0, params_a_m08_b_10 = 0.0, params_a_m08_b_11 = 0.0, zeta_threshold = 2.220446049250313e-16)
const mgga_c_revm11_required = ()

function mgga_c_revm11(rho, sigma, lapl, tau; params = NamedTuple())
    p = resolve_params(mgga_c_revm11_defaults, mgga_c_revm11_required, params)
    v = mgga_variables(rho, sigma, lapl, tau, Val(3))
    return mgga_c_m08_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.params_a_m08_a_0, p.params_a_m08_a_1, p.params_a_m08_a_2, p.params_a_m08_a_3, p.params_a_m08_a_4, p.params_a_m08_a_5, p.params_a_m08_a_6, p.params_a_m08_a_7, p.params_a_m08_a_8, p.params_a_m08_a_9, p.params_a_m08_a_10, p.params_a_m08_a_11, p.params_a_m08_b_0, p.params_a_m08_b_1, p.params_a_m08_b_2, p.params_a_m08_b_3, p.params_a_m08_b_4, p.params_a_m08_b_5, p.params_a_m08_b_6, p.params_a_m08_b_7, p.params_a_m08_b_8, p.params_a_m08_b_9, p.params_a_m08_b_10, p.params_a_m08_b_11, p.zeta_threshold)
end

function mgga_c_revm11(na, nb, gaa, gab, gbb, la, lb, ta, tb; params = NamedTuple())
    p = resolve_params(mgga_c_revm11_defaults, mgga_c_revm11_required, params)
    v = mgga_variables(na, nb, gaa, gab, gbb, la, lb, ta, tb, Val(3))
    return mgga_c_m08_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.params_a_m08_a_0, p.params_a_m08_a_1, p.params_a_m08_a_2, p.params_a_m08_a_3, p.params_a_m08_a_4, p.params_a_m08_a_5, p.params_a_m08_a_6, p.params_a_m08_a_7, p.params_a_m08_a_8, p.params_a_m08_a_9, p.params_a_m08_a_10, p.params_a_m08_a_11, p.params_a_m08_b_0, p.params_a_m08_b_1, p.params_a_m08_b_2, p.params_a_m08_b_3, p.params_a_m08_b_4, p.params_a_m08_b_5, p.params_a_m08_b_6, p.params_a_m08_b_7, p.params_a_m08_b_8, p.params_a_m08_b_9, p.params_a_m08_b_10, p.params_a_m08_b_11, p.zeta_threshold)
end

export mgga_c_revm11, mgga_c_revm11_defaults, mgga_c_revm11_required
