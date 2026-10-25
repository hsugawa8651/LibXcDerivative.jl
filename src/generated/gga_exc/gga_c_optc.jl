# Auto-generated from the Libxc sources
# python/gga_exc/gga_c_optc.py -- do not edit by hand.
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
# args: rs, z, xt, xs0, xs1, params_a_c1, params_a_c2, zeta_threshold
const gga_c_optc_energy = function (rs, z, xt, xs0, xs1, params_a_c1, params_a_c2, zeta_threshold)
    @inbounds begin
        cse_tmp_0 = 23.266 * rs
        cse_tmp_1 = rs ^ 2
        cse_tmp_2 = 0.007389 * cse_tmp_1
        cse_tmp_3 = 8723.0 * rs
        cse_tmp_4 = 472.0 * cse_tmp_1
        cse_tmp_5 = z + 1
        cse_tmp_6 = cse_tmp_5 <= zeta_threshold
        cse_tmp_7 = NaNMath.pow(zeta_threshold, 0.6666666666666666)
        cse_tmp_8 = cse_tmp_7 - 1
        cse_tmp_9 = zeta_threshold - 1
        cse_tmp_10 = xc_log1p(my_piecewise3(z > cse_tmp_9, z, cse_tmp_9))
        cse_tmp_11 = 1 - z
        cse_tmp_12 = cse_tmp_11 <= zeta_threshold
        cse_tmp_13 = -z
        cse_tmp_14 = xc_log1p(my_piecewise3(cse_tmp_13 > cse_tmp_9, cse_tmp_13, cse_tmp_9))
        cse_tmp_15 = my_piecewise3(cse_tmp_12, cse_tmp_8, xc_expm1((2 // 3) * cse_tmp_14)) / 2 + my_piecewise3(cse_tmp_6, cse_tmp_8, xc_expm1((2 // 3) * cse_tmp_10)) / 2 + 1
        cse_tmp_16 = 1.4422495703074083
        cse_tmp_17 = xt ^ 2
        cse_tmp_18 = cse_tmp_15 ^ 2
        cse_tmp_19 = (25 // 3) / 4.60115111447049
        cse_tmp_20 = rs ^ (-1)
        cse_tmp_21 = cse_tmp_17 * cse_tmp_20
        cse_tmp_22 = 1.4645918875615234
        cse_tmp_23 = 1 / (2 * cse_tmp_22)
        cse_tmp_24 = cse_tmp_15 ^ 3
        cse_tmp_25 = 0.0132882934 * rs
        cse_tmp_26 = 0.2230841432 * rs
        cse_tmp_27 = NaNMath.sqrt(rs)
        cse_tmp_28 = 0.4723158174 * cse_tmp_27
        cse_tmp_29 = NaNMath.pow(rs, 1.5)
        cse_tmp_30 = 0.1018665524 * cse_tmp_29
        cse_tmp_31 = 0.03065199508 * cse_tmp_1
        cse_tmp_32 = (-cse_tmp_25 - 0.062182) * xc_log1p((cse_tmp_26 + cse_tmp_28 + cse_tmp_30 + cse_tmp_31) ^ (-1))
        cse_tmp_33 = 0.0037573575 * rs
        cse_tmp_34 = 0.1223665794 * rs
        cse_tmp_35 = 0.349797318 * cse_tmp_27
        cse_tmp_36 = 0.02972990124 * cse_tmp_29
        cse_tmp_37 = 0.01677588354 * cse_tmp_1
        cse_tmp_38 = 0.58482233974552 * (-cse_tmp_33 - 0.033774) * xc_log1p((cse_tmp_34 + cse_tmp_35 + cse_tmp_36 + cse_tmp_37) ^ (-1))
        cse_tmp_39 = 1.2599210498948732
        cse_tmp_40 = (2 * cse_tmp_39 - 2) ^ (-1)
        cse_tmp_41 = NaNMath.pow(zeta_threshold, 1.3333333333333333) - 1
        cse_tmp_42 = cse_tmp_40 * (my_piecewise3(cse_tmp_12, cse_tmp_41, xc_expm1((4 // 3) * cse_tmp_14)) + my_piecewise3(cse_tmp_6, cse_tmp_41, xc_expm1((4 // 3) * cse_tmp_10)))
        cse_tmp_43 = 0.0063883732 * rs
        cse_tmp_44 = 0.192686493 * rs
        cse_tmp_45 = 0.438956601 * cse_tmp_27
        cse_tmp_46 = 0.104655158 * cse_tmp_29
        cse_tmp_47 = 0.0194365353 * cse_tmp_1
        cse_tmp_48 = 2.1450293971110255
        cse_tmp_49 = cse_tmp_16 * cse_tmp_48
        cse_tmp_50 = 13.067859477648 * cse_tmp_49
        cse_tmp_51 = cse_tmp_50 * (cse_tmp_32 - cse_tmp_38 * cse_tmp_42 + cse_tmp_42 * z ^ 4 * (-cse_tmp_32 + cse_tmp_38 + (-cse_tmp_43 - 0.03109) * xc_log1p((cse_tmp_44 + cse_tmp_45 + cse_tmp_46 + cse_tmp_47) ^ (-1)))) / cse_tmp_24
        cse_tmp_52 = xc_expm1(-cse_tmp_51)
        cse_tmp_53 = 2.080083823051904
        cse_tmp_54 = 0.0276711924439197 * cse_tmp_22 * cse_tmp_53
        cse_tmp_55 = 1.5874010519681994
        cse_tmp_56 = 0.00229708467380532 * cse_tmp_49 / cse_tmp_1
        cse_tmp_57 = 0.0255078755555556 * cse_tmp_53 / cse_tmp_48
        cse_tmp_58 = cse_tmp_5 ^ (-1)
        cse_tmp_59 = NaNMath.pow(cse_tmp_58, 0.3333333333333333)
        cse_tmp_60 = cse_tmp_39 * cse_tmp_59
        cse_tmp_61 = NaNMath.pow(cse_tmp_58, 0.6666666666666666)
        cse_tmp_62 = cse_tmp_55 * cse_tmp_61
        cse_tmp_63 = xs0 ^ 2
        cse_tmp_64 = cse_tmp_16 * cse_tmp_63
        cse_tmp_65 = 2 <= zeta_threshold
        cse_tmp_66 = xc_log1p(my_piecewise3(1 > cse_tmp_9, 1, cse_tmp_9))
        cse_tmp_67 = cse_tmp_7 / 2 + my_piecewise3(cse_tmp_65, cse_tmp_8, xc_expm1((2 // 3) * cse_tmp_66)) / 2 + 1 // 2
        cse_tmp_68 = cse_tmp_67 ^ 2
        cse_tmp_69 = cse_tmp_19 * cse_tmp_68
        cse_tmp_70 = cse_tmp_20 / cse_tmp_59
        cse_tmp_71 = cse_tmp_23 * cse_tmp_67
        cse_tmp_72 = 1.122462048309373
        cse_tmp_73 = NaNMath.pow(cse_tmp_58, 0.16666666666666666) * cse_tmp_72
        cse_tmp_74 = 1.4142135623730951
        cse_tmp_75 = NaNMath.sqrt(cse_tmp_58) * cse_tmp_74
        cse_tmp_76 = (-cse_tmp_25 * cse_tmp_60 - 0.062182) * xc_log1p((cse_tmp_26 * cse_tmp_60 + cse_tmp_28 * cse_tmp_73 + cse_tmp_30 * cse_tmp_75 + cse_tmp_31 * cse_tmp_62) ^ (-1))
        cse_tmp_77 = 0.58482233974552 * (-cse_tmp_33 * cse_tmp_60 - 0.033774) * xc_log1p((cse_tmp_34 * cse_tmp_60 + cse_tmp_35 * cse_tmp_73 + cse_tmp_36 * cse_tmp_75 + cse_tmp_37 * cse_tmp_62) ^ (-1))
        cse_tmp_78 = cse_tmp_40 * (cse_tmp_41 + my_piecewise3(cse_tmp_65, cse_tmp_41, xc_expm1((4 // 3) * cse_tmp_66)))
        cse_tmp_79 = cse_tmp_67 ^ 3
        cse_tmp_80 = cse_tmp_50 / cse_tmp_79
        cse_tmp_81 = cse_tmp_80 * (cse_tmp_76 - cse_tmp_77 * cse_tmp_78 + cse_tmp_78 * (-cse_tmp_76 + cse_tmp_77 + (-cse_tmp_43 * cse_tmp_60 - 0.03109) * xc_log1p((cse_tmp_44 * cse_tmp_60 + cse_tmp_45 * cse_tmp_73 + cse_tmp_46 * cse_tmp_75 + cse_tmp_47 * cse_tmp_62) ^ (-1))))
        cse_tmp_82 = xc_expm1(-cse_tmp_81)
        cse_tmp_83 = cse_tmp_56 / cse_tmp_67 ^ 4
        cse_tmp_84 = cse_tmp_54 / cse_tmp_68
        cse_tmp_85 = cse_tmp_57 * cse_tmp_79
        cse_tmp_86 = cse_tmp_11 ^ (-1)
        cse_tmp_87 = NaNMath.pow(cse_tmp_86, 0.3333333333333333)
        cse_tmp_88 = cse_tmp_39 * cse_tmp_87
        cse_tmp_89 = NaNMath.pow(cse_tmp_86, 0.6666666666666666)
        cse_tmp_90 = cse_tmp_55 * cse_tmp_89
        cse_tmp_91 = xs1 ^ 2
        cse_tmp_92 = cse_tmp_16 * cse_tmp_91
        cse_tmp_93 = cse_tmp_20 / cse_tmp_87
        cse_tmp_94 = cse_tmp_72 * NaNMath.pow(cse_tmp_86, 0.16666666666666666)
        cse_tmp_95 = cse_tmp_74 * NaNMath.sqrt(cse_tmp_86)
        cse_tmp_96 = (-cse_tmp_25 * cse_tmp_88 - 0.062182) * xc_log1p((cse_tmp_26 * cse_tmp_88 + cse_tmp_28 * cse_tmp_94 + cse_tmp_30 * cse_tmp_95 + cse_tmp_31 * cse_tmp_90) ^ (-1))
        cse_tmp_97 = 0.58482233974552 * (-cse_tmp_33 * cse_tmp_88 - 0.033774) * xc_log1p((cse_tmp_34 * cse_tmp_88 + cse_tmp_35 * cse_tmp_94 + cse_tmp_36 * cse_tmp_95 + cse_tmp_37 * cse_tmp_90) ^ (-1))
        cse_tmp_98 = cse_tmp_80 * (-cse_tmp_78 * cse_tmp_97 + cse_tmp_78 * (-cse_tmp_96 + cse_tmp_97 + (-cse_tmp_43 * cse_tmp_88 - 0.03109) * xc_log1p((cse_tmp_44 * cse_tmp_88 + cse_tmp_45 * cse_tmp_94 + cse_tmp_46 * cse_tmp_95 + cse_tmp_47 * cse_tmp_90) ^ (-1))) + cse_tmp_96)
        cse_tmp_99 = xc_expm1(-cse_tmp_98)
        params_a_c1 * (1.8171205928321397 * cse_tmp_15 * cse_tmp_21 * cse_tmp_23 * ((cse_tmp_0 + cse_tmp_2 + 2.568) / (cse_tmp_3 + cse_tmp_4 + 1000) - 0.00185357142857143) * exp(-cse_tmp_16 * cse_tmp_17 * cse_tmp_18 * cse_tmp_19) + cse_tmp_24 * cse_tmp_57 * xc_log1p(xc_expm1(cse_tmp_51) / (1 + cse_tmp_21 * cse_tmp_39 * cse_tmp_54 / (cse_tmp_18 * cse_tmp_52) + cse_tmp_55 * cse_tmp_56 * xt ^ 4 / (cse_tmp_15 ^ 4 * cse_tmp_52 ^ 2)))) + (-params_a_c1 + params_a_c2) * ((cse_tmp_64 * cse_tmp_70 * cse_tmp_71 * ((cse_tmp_0 * cse_tmp_60 + cse_tmp_2 * cse_tmp_62 + 2.568) / (cse_tmp_3 * cse_tmp_60 + cse_tmp_4 * cse_tmp_62 + 1000) - 0.00185357142857143) * exp(-cse_tmp_64 * cse_tmp_69) + cse_tmp_85 * xc_log1p(xc_expm1(cse_tmp_81) / (cse_tmp_63 * cse_tmp_70 * cse_tmp_84 / cse_tmp_82 + 1 + cse_tmp_83 * xs0 ^ 4 / (cse_tmp_61 * cse_tmp_82 ^ 2)))) * (my_piecewise3(cse_tmp_6, cse_tmp_9, xc_expm1(cse_tmp_10)) + 1) / 2 + (cse_tmp_71 * cse_tmp_92 * cse_tmp_93 * ((cse_tmp_0 * cse_tmp_88 + cse_tmp_2 * cse_tmp_90 + 2.568) / (cse_tmp_3 * cse_tmp_88 + cse_tmp_4 * cse_tmp_90 + 1000) - 0.00185357142857143) * exp(-cse_tmp_69 * cse_tmp_92) + cse_tmp_85 * xc_log1p(xc_expm1(cse_tmp_98) / (cse_tmp_83 * xs1 ^ 4 / (cse_tmp_89 * cse_tmp_99 ^ 2) + cse_tmp_84 * cse_tmp_91 * cse_tmp_93 / cse_tmp_99 + 1))) * (my_piecewise3(cse_tmp_12, cse_tmp_9, xc_expm1(cse_tmp_14)) + 1) / 2)
    end
end
export gga_c_optc_energy

const gga_c_optc_defaults = (params_a_c1 = 1.1015, params_a_c2 = 0.6625, zeta_threshold = 2.220446049250313e-16)
const gga_c_optc_required = ()

function gga_c_optc(rho, sigma; params = NamedTuple())
    p = resolve_params(gga_c_optc_defaults, gga_c_optc_required, params)
    v = gga_variables(rho, sigma, Val(3))
    return gga_c_optc_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.params_a_c1, p.params_a_c2, p.zeta_threshold)
end

function gga_c_optc(na, nb, gaa, gab, gbb; params = NamedTuple())
    p = resolve_params(gga_c_optc_defaults, gga_c_optc_required, params)
    v = gga_variables(na, nb, gaa, gab, gbb, Val(3))
    return gga_c_optc_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.params_a_c1, p.params_a_c2, p.zeta_threshold)
end

export gga_c_optc, gga_c_optc_defaults, gga_c_optc_required
