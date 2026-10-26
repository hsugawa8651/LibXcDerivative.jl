# Auto-generated from the Libxc sources
# python/mgga_exc/mgga_c_scanl.py -- do not edit by hand.
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
# args: rs, z, xt, xs0, xs1, u0, u1, t0, t1, XC_EPSILON, params_a_pc07_a, params_a_pc07_b, zeta_threshold
const mgga_c_scanl_energy = function (rs, z, xt, xs0, xs1, u0, u1, t0, t1, XC_EPSILON, params_a_pc07_a, params_a_pc07_b, zeta_threshold)
    @inbounds begin
        cse_tmp_0 = 9.869604401089358
        cse_tmp_1 = 1 - NaNMath.log(2)
        cse_tmp_2 = z + 1
        cse_tmp_3 = cse_tmp_2 <= zeta_threshold
        cse_tmp_4 = NaNMath.pow(zeta_threshold, 0.6666666666666666) - 1
        cse_tmp_5 = zeta_threshold - 1
        cse_tmp_6 = xc_log1p(my_piecewise3(z > cse_tmp_5, z, cse_tmp_5))
        cse_tmp_7 = 1 - z
        cse_tmp_8 = cse_tmp_7 <= zeta_threshold
        cse_tmp_9 = -z
        cse_tmp_10 = xc_log1p(my_piecewise3(cse_tmp_9 > cse_tmp_5, cse_tmp_9, cse_tmp_5))
        cse_tmp_11 = my_piecewise3(cse_tmp_3, cse_tmp_4, xc_expm1((2 // 3) * cse_tmp_6)) / 2 + my_piecewise3(cse_tmp_8, cse_tmp_4, xc_expm1((2 // 3) * cse_tmp_10)) / 2 + 1
        cse_tmp_12 = cse_tmp_11 ^ 3
        cse_tmp_13 = NaNMath.sqrt(rs)
        cse_tmp_14 = NaNMath.pow(rs, 1.5)
        cse_tmp_15 = rs ^ 2
        cse_tmp_16 = (-0.01328816518 * rs - 0.0621814) * xc_log1p((0.47231125998 * cse_tmp_13 + 0.10186556948 * cse_tmp_14 + 0.030651699316 * cse_tmp_15 + 0.22308199064 * rs) ^ (-1))
        cse_tmp_17 = 0.5848223622634646207262238663759 * (-0.00375733525 * rs - 0.0337738) * xc_log1p((0.3497952466 * cse_tmp_13 + 0.029729725188 * cse_tmp_14 + 0.016775784198 * cse_tmp_15 + 0.12236585478 * rs) ^ (-1))
        cse_tmp_18 = 1.2599210498948732
        cse_tmp_19 = NaNMath.pow(zeta_threshold, 1.3333333333333333) - 1
        cse_tmp_20 = (my_piecewise3(cse_tmp_3, cse_tmp_19, xc_expm1((4 // 3) * cse_tmp_6)) + my_piecewise3(cse_tmp_8, cse_tmp_19, xc_expm1((4 // 3) * cse_tmp_10))) / (2 * cse_tmp_18 - 2)
        cse_tmp_21 = z ^ 4
        cse_tmp_22 = cse_tmp_0 / cse_tmp_1
        cse_tmp_23 = cse_tmp_22 * (cse_tmp_16 - cse_tmp_17 * cse_tmp_20 + cse_tmp_20 * cse_tmp_21 * (-cse_tmp_16 + cse_tmp_17 + (-0.006388517036 * rs - 0.0310907) * xc_log1p((0.43896648423 * cse_tmp_13 + 0.10465751434 * cse_tmp_14 + 0.019436972919 * cse_tmp_15 + 0.19269083139 * rs) ^ (-1)))) / cse_tmp_12
        cse_tmp_24 = xt ^ 2
        cse_tmp_25 = cse_tmp_24 / 8
        cse_tmp_26 = cse_tmp_1 * cse_tmp_12 * xc_log1p(xc_expm1(cse_tmp_23) / NaNMath.pow(1 + cse_tmp_18 * cse_tmp_22 * cse_tmp_25 * (0.0066724550603149224 * rs + 0.06672455060314922) / (cse_tmp_11 ^ 2 * rs * (0.1778 * rs + 1) * xc_expm1(-cse_tmp_23)), 0.25)) / cse_tmp_0
        cse_tmp_27 = (0.0889 * cse_tmp_13 + 0.125541 * rs + 1) ^ (-1)
        cse_tmp_28 = 4.60115111447049
        cse_tmp_29 = cse_tmp_28 ^ (-1)
        cse_tmp_30 = 1.4422495703074083 * cse_tmp_29
        cse_tmp_31 = NaNMath.pow(zeta_threshold, 1.6666666666666667) - 1
        cse_tmp_32 = my_piecewise3(cse_tmp_3, cse_tmp_31, xc_expm1((5 // 3) * cse_tmp_6))
        cse_tmp_33 = my_piecewise3(cse_tmp_8, cse_tmp_31, xc_expm1((5 // 3) * cse_tmp_10))
        cse_tmp_34 = xs0 ^ 2
        cse_tmp_35 = cse_tmp_32 + 1
        cse_tmp_36 = xs1 ^ 2
        cse_tmp_37 = cse_tmp_33 + 1
        cse_tmp_38 = 1.8171205928321397 * cse_tmp_29
        cse_tmp_39 = cse_tmp_34 * cse_tmp_38
        cse_tmp_40 = (5 // 72) * cse_tmp_39
        cse_tmp_41 = 3.3019272488946267 / 21.170591578193033
        cse_tmp_42 = cse_tmp_41 / 5832
        cse_tmp_43 = cse_tmp_41 / 17496
        cse_tmp_44 = cse_tmp_41 / 5184
        cse_tmp_45 = -cse_tmp_34 * cse_tmp_44 * u0 + cse_tmp_42 * u0 ^ 2 + cse_tmp_43 * xs0 ^ 4
        cse_tmp_46 = cse_tmp_45 ^ 2 / (cse_tmp_40 + 1) ^ 2
        cse_tmp_47 = NaNMath.sqrt(cse_tmp_46 + 1)
        cse_tmp_48 = (5 // 54) * cse_tmp_38
        cse_tmp_49 = cse_tmp_48 * u0 + 1
        cse_tmp_50 = -5 // 81 * cse_tmp_39 + cse_tmp_49
        cse_tmp_51 = (5 // 36) * cse_tmp_39
        cse_tmp_52 = (2 * cse_tmp_45 * cse_tmp_50 + cse_tmp_46 * (cse_tmp_51 + 1) + cse_tmp_50 ^ 2 + cse_tmp_51 * (cse_tmp_45 + cse_tmp_50)) / (cse_tmp_47 * ((5 // 648) * cse_tmp_39 + cse_tmp_40 * cse_tmp_47 + cse_tmp_45 + cse_tmp_49))
        cse_tmp_53 = params_a_pc07_a / 40
        cse_tmp_54 = (39 // 40) * params_a_pc07_a
        cse_tmp_55 = my_piecewise3(cse_tmp_53 > cse_tmp_52, cse_tmp_53, cse_tmp_52)
        cse_tmp_56 = my_piecewise3(cse_tmp_54 > cse_tmp_55, cse_tmp_55, cse_tmp_54)
        cse_tmp_57 = params_a_pc07_a / cse_tmp_56
        cse_tmp_58 = exp(-params_a_pc07_a / (-cse_tmp_56 + params_a_pc07_a))
        cse_tmp_59 = cse_tmp_36 * cse_tmp_38
        cse_tmp_60 = (5 // 72) * cse_tmp_59
        cse_tmp_61 = -cse_tmp_36 * cse_tmp_44 * u1 + cse_tmp_42 * u1 ^ 2 + cse_tmp_43 * xs1 ^ 4
        cse_tmp_62 = cse_tmp_61 ^ 2 / (cse_tmp_60 + 1) ^ 2
        cse_tmp_63 = NaNMath.sqrt(cse_tmp_62 + 1)
        cse_tmp_64 = cse_tmp_48 * u1 + 1
        cse_tmp_65 = -5 // 81 * cse_tmp_59 + cse_tmp_64
        cse_tmp_66 = (5 // 36) * cse_tmp_59
        cse_tmp_67 = (2 * cse_tmp_61 * cse_tmp_65 + cse_tmp_62 * (cse_tmp_66 + 1) + cse_tmp_65 ^ 2 + cse_tmp_66 * (cse_tmp_61 + cse_tmp_65)) / (cse_tmp_63 * ((5 // 648) * cse_tmp_59 + cse_tmp_60 * cse_tmp_63 + cse_tmp_61 + cse_tmp_64))
        cse_tmp_68 = my_piecewise3(cse_tmp_53 > cse_tmp_67, cse_tmp_53, cse_tmp_67)
        cse_tmp_69 = my_piecewise3(cse_tmp_54 > cse_tmp_68, cse_tmp_68, cse_tmp_54)
        cse_tmp_70 = params_a_pc07_a / cse_tmp_69
        cse_tmp_71 = exp(-params_a_pc07_a / (-cse_tmp_69 + params_a_pc07_a))
        cse_tmp_72 = (20 // 9) * cse_tmp_30 * (cse_tmp_18 * (cse_tmp_34 * cse_tmp_35 + cse_tmp_36 * cse_tmp_37) / 32 - cse_tmp_25 + (3 // 20) * 2.080083823051904 * cse_tmp_28 * (cse_tmp_35 * cse_tmp_52 * my_piecewise5(cse_tmp_52 <= cse_tmp_53, 0, cse_tmp_52 >= cse_tmp_54, 1, NaNMath.pow(cse_tmp_58 + 1, params_a_pc07_b) * NaNMath.pow(cse_tmp_58 + exp(-cse_tmp_57), -params_a_pc07_b) * exp(-cse_tmp_57 * params_a_pc07_b)) + cse_tmp_37 * cse_tmp_67 * my_piecewise5(cse_tmp_67 <= cse_tmp_53, 0, cse_tmp_67 >= cse_tmp_54, 1, NaNMath.pow(cse_tmp_71 + 1, params_a_pc07_b) * NaNMath.pow(cse_tmp_71 + exp(-cse_tmp_70), -params_a_pc07_b) * exp(-cse_tmp_70 * params_a_pc07_b)))) / (cse_tmp_32 + cse_tmp_33 + 2)
        cse_tmp_73 = NaNMath.log(XC_EPSILON)
        cse_tmp_74 = -cse_tmp_73 / (0.64 - cse_tmp_73)
        cse_tmp_75 = my_piecewise3(cse_tmp_74 > cse_tmp_72, cse_tmp_72, cse_tmp_74)
        cse_tmp_76 = NaNMath.log(1.42857142857143 * XC_EPSILON)
        cse_tmp_77 = -(1.5 - cse_tmp_76) / cse_tmp_76
        cse_tmp_26 + (cse_tmp_2 * cse_tmp_7 * (-0.0285764 * cse_tmp_27 + 0.0285764 * xc_log1p(-xc_expm1(1.0 * cse_tmp_27) * xc_expm1(-xc_log1p(0.042675284208752717 * cse_tmp_24 * cse_tmp_30) / 4))) * (-cse_tmp_20 * (2.363 * cse_tmp_18 - 2.363) + 1) * (cse_tmp_21 + z ^ 10 + z ^ 8 + z ^ 6 + z ^ 2 + 1) - cse_tmp_26) * my_piecewise3(cse_tmp_72 <= 1, my_piecewise3(cse_tmp_72 > cse_tmp_74, 0, exp(-0.64 * cse_tmp_75 / (1 - cse_tmp_75))), my_piecewise3(cse_tmp_72 < cse_tmp_77, 0, -0.7 * exp(1.5 / (1 - my_piecewise3(cse_tmp_77 > cse_tmp_72, cse_tmp_77, cse_tmp_72)))))
    end
end
export mgga_c_scanl_energy

const mgga_c_scanl_defaults = (XC_EPSILON = 2.220446049250313e-16, params_a_pc07_a = 1.78472, params_a_pc07_b = 0.258304, zeta_threshold = 2.220446049250313e-16)
const mgga_c_scanl_required = ()

function mgga_c_scanl(rho, sigma, lapl, tau; params = NamedTuple())
    p = resolve_params(mgga_c_scanl_defaults, mgga_c_scanl_required, params)
    v = mgga_variables(rho, sigma, lapl, tau, Val(3))
    return mgga_c_scanl_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.XC_EPSILON, p.params_a_pc07_a, p.params_a_pc07_b, p.zeta_threshold)
end

function mgga_c_scanl(na, nb, gaa, gab, gbb, la, lb, ta, tb; params = NamedTuple())
    p = resolve_params(mgga_c_scanl_defaults, mgga_c_scanl_required, params)
    v = mgga_variables(na, nb, gaa, gab, gbb, la, lb, ta, tb, Val(3))
    return mgga_c_scanl_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.XC_EPSILON, p.params_a_pc07_a, p.params_a_pc07_b, p.zeta_threshold)
end

export mgga_c_scanl, mgga_c_scanl_defaults, mgga_c_scanl_required
