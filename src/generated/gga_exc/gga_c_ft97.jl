# Auto-generated from the Libxc sources
# python/gga_exc/gga_c_ft97.py -- do not edit by hand.
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
# args: rs, z, xt, xs0, xs1
const gga_c_ft97_energy = function (rs, z, xt, xs0, xs1)
    @inbounds begin
        cse_tmp_0 = z + 1
        cse_tmp_1 = cse_tmp_0 ^ (-1)
        cse_tmp_2 = NaNMath.pow(cse_tmp_1, 0.3333333333333333)
        cse_tmp_3 = 1.8171205928321397 / 4.60115111447049
        cse_tmp_4 = cse_tmp_3 * xs0 ^ 4
        cse_tmp_5 = 0.08327588 * 1.2030250360821166 * NaNMath.pow(rs, 0.8)
        cse_tmp_6 = rs ^ (-1)
        cse_tmp_7 = 2.6207413942088964 * cse_tmp_6
        cse_tmp_8 = 0.0383061650277778 * cse_tmp_7
        cse_tmp_9 = cse_tmp_2 ^ (-1)
        cse_tmp_10 = 0.4661940770354116
        cse_tmp_11 = cse_tmp_10 * xs0 ^ 2
        cse_tmp_12 = cse_tmp_11 * cse_tmp_9
        cse_tmp_13 = 0.0450588546388889 * 3.3019272488946267
        cse_tmp_14 = (0.349064173 * xc_expm1(-NaNMath.pow(cse_tmp_1, 0.26666666666666666) * cse_tmp_5) + 1.291551074) ^ 2 * (cse_tmp_11 * cse_tmp_13 + 0.00111138387147047 * cse_tmp_4 + 1) ^ 2 * exp(-0.00222276774294094 * cse_tmp_4) / (cse_tmp_12 * cse_tmp_8 + 1)
        cse_tmp_15 = my_piecewise3(cse_tmp_14 > 1.0e-60, cse_tmp_14, 1.0e-60)
        cse_tmp_16 = cse_tmp_2 / cse_tmp_15
        cse_tmp_17 = 9.869604401089358
        cse_tmp_18 = 1 - NaNMath.log(2)
        cse_tmp_19 = cse_tmp_18 / cse_tmp_17
        cse_tmp_20 = 1.2599210498948732 * rs
        cse_tmp_21 = cse_tmp_19 * cse_tmp_20
        cse_tmp_22 = cse_tmp_16 * cse_tmp_21
        cse_tmp_23 = (2 // 3) * cse_tmp_22
        cse_tmp_24 = (4 // 3) * cse_tmp_22
        cse_tmp_25 = NaNMath.sqrt(rs)
        cse_tmp_26 = 1.5874010519681994
        cse_tmp_27 = 1.7320508075688772 * NaNMath.sqrt(cse_tmp_18) * cse_tmp_25 * cse_tmp_26 / pi
        cse_tmp_28 = NaNMath.sqrt(cse_tmp_16) * cse_tmp_27
        cse_tmp_29 = cse_tmp_24 + (2 // 3) * cse_tmp_28 + 3
        cse_tmp_30 = (4 * cse_tmp_22 + 2 * cse_tmp_28 + 3) ^ (-1)
        cse_tmp_31 = cse_tmp_29 * cse_tmp_30
        cse_tmp_32 = cse_tmp_19 / 2
        cse_tmp_33 = (3 // 4) * cse_tmp_17 * cse_tmp_26 * cse_tmp_6 / cse_tmp_18
        cse_tmp_34 = cse_tmp_33 * cse_tmp_9
        cse_tmp_35 = cse_tmp_15 * cse_tmp_34
        cse_tmp_36 = 1 - z
        cse_tmp_37 = cse_tmp_36 / 2
        cse_tmp_38 = cse_tmp_36 ^ (-1)
        cse_tmp_39 = NaNMath.pow(cse_tmp_38, 0.3333333333333333)
        cse_tmp_40 = cse_tmp_3 * xs1 ^ 4
        cse_tmp_41 = cse_tmp_10 * xs1 ^ 2
        cse_tmp_42 = cse_tmp_39 ^ (-1)
        cse_tmp_43 = cse_tmp_41 * cse_tmp_42
        cse_tmp_44 = (0.349064173 * xc_expm1(-NaNMath.pow(cse_tmp_38, 0.26666666666666666) * cse_tmp_5) + 1.291551074) ^ 2 * (cse_tmp_13 * cse_tmp_41 + 0.00111138387147047 * cse_tmp_40 + 1) ^ 2 * exp(-0.00222276774294094 * cse_tmp_40) / (cse_tmp_43 * cse_tmp_8 + 1)
        cse_tmp_45 = my_piecewise3(cse_tmp_44 > 1.0e-60, cse_tmp_44, 1.0e-60)
        cse_tmp_46 = cse_tmp_39 / cse_tmp_45
        cse_tmp_47 = cse_tmp_21 * cse_tmp_46
        cse_tmp_48 = (2 // 3) * cse_tmp_47
        cse_tmp_49 = (4 // 3) * cse_tmp_47
        cse_tmp_50 = cse_tmp_27 * NaNMath.sqrt(cse_tmp_46)
        cse_tmp_51 = cse_tmp_49 + (2 // 3) * cse_tmp_50 + 3
        cse_tmp_52 = (4 * cse_tmp_47 + 2 * cse_tmp_50 + 3) ^ (-1)
        cse_tmp_53 = cse_tmp_51 * cse_tmp_52
        cse_tmp_54 = cse_tmp_33 * cse_tmp_42
        cse_tmp_55 = cse_tmp_45 * cse_tmp_54
        cse_tmp_56 = cse_tmp_0 / 2
        cse_tmp_57 = 1.73317 * cse_tmp_20
        cse_tmp_58 = 1.122462048309373 * cse_tmp_25
        cse_tmp_59 = NaNMath.pow(cse_tmp_1, 0.16666666666666666) * cse_tmp_58
        cse_tmp_60 = cse_tmp_26 * rs ^ 2
        cse_tmp_61 = 0.100017001638889 * cse_tmp_7
        cse_tmp_62 = 0.655638823 * 1.096824979694626 * NaNMath.pow(rs, 0.4)
        cse_tmp_63 = (0.113267126032572 * cse_tmp_4 + 1) ^ 2 * (-0.859614445 * xc_expm1(-1.089338848 * cse_tmp_59) + 0.812904345 * xc_expm1(-NaNMath.pow(cse_tmp_1, 0.13333333333333333) * cse_tmp_62) + 1.200801774) ^ 2 * exp(-0.226534252065144 * cse_tmp_4) / (cse_tmp_12 * cse_tmp_61 + 1)
        cse_tmp_64 = my_piecewise3(cse_tmp_63 > 1.0e-60, cse_tmp_63, 1.0e-60)
        cse_tmp_65 = cse_tmp_2 / cse_tmp_64
        cse_tmp_66 = cse_tmp_21 * cse_tmp_65
        cse_tmp_67 = (2 // 3) * cse_tmp_66
        cse_tmp_68 = (4 // 3) * cse_tmp_66
        cse_tmp_69 = cse_tmp_27 * NaNMath.sqrt(cse_tmp_65)
        cse_tmp_70 = cse_tmp_68 + (2 // 3) * cse_tmp_69 + 3
        cse_tmp_71 = (4 * cse_tmp_66 + 2 * cse_tmp_69 + 3) ^ (-1)
        cse_tmp_72 = cse_tmp_70 * cse_tmp_71
        cse_tmp_73 = cse_tmp_34 * cse_tmp_64
        cse_tmp_74 = NaNMath.pow(cse_tmp_38, 0.16666666666666666) * cse_tmp_58
        cse_tmp_75 = (0.113267126032572 * cse_tmp_40 + 1) ^ 2 * (-0.859614445 * xc_expm1(-1.089338848 * cse_tmp_74) + 0.812904345 * xc_expm1(-NaNMath.pow(cse_tmp_38, 0.13333333333333333) * cse_tmp_62) + 1.200801774) ^ 2 * exp(-0.226534252065144 * cse_tmp_40) / (cse_tmp_43 * cse_tmp_61 + 1)
        cse_tmp_76 = my_piecewise3(cse_tmp_75 > 1.0e-60, cse_tmp_75, 1.0e-60)
        cse_tmp_77 = cse_tmp_39 / cse_tmp_76
        cse_tmp_78 = cse_tmp_21 * cse_tmp_77
        cse_tmp_79 = (2 // 3) * cse_tmp_78
        cse_tmp_80 = (4 // 3) * cse_tmp_78
        cse_tmp_81 = cse_tmp_27 * NaNMath.sqrt(cse_tmp_77)
        cse_tmp_82 = cse_tmp_80 + (2 // 3) * cse_tmp_81 + 3
        cse_tmp_83 = (4 * cse_tmp_78 + 2 * cse_tmp_81 + 3) ^ (-1)
        cse_tmp_84 = cse_tmp_82 * cse_tmp_83
        cse_tmp_85 = cse_tmp_54 * cse_tmp_76
        cse_tmp_37 * my_piecewise3(cse_tmp_23 < 100, cse_tmp_32 * (2 * cse_tmp_29 * cse_tmp_30 - (cse_tmp_24 * cse_tmp_31 + 1) * xc_E1_scaled(cse_tmp_23)), cse_tmp_32 * (-cse_tmp_35 + (2 * cse_tmp_31 + cse_tmp_35) * xc_e1_scaled_G(cse_tmp_23))) + cse_tmp_37 * exp(-NaNMath.pow(cse_tmp_38, 0.6666666666666666) * cse_tmp_60 / (cse_tmp_39 * cse_tmp_57 + 0.939016 * cse_tmp_74) ^ 2) * my_piecewise3(cse_tmp_79 < 100, cse_tmp_32 * (2 * cse_tmp_82 * cse_tmp_83 - (cse_tmp_80 * cse_tmp_84 + 1) * xc_E1_scaled(cse_tmp_79)), cse_tmp_32 * (-cse_tmp_85 + (2 * cse_tmp_84 + cse_tmp_85) * xc_e1_scaled_G(cse_tmp_79))) + cse_tmp_56 * my_piecewise3(cse_tmp_48 < 100, cse_tmp_32 * (2 * cse_tmp_51 * cse_tmp_52 - (cse_tmp_49 * cse_tmp_53 + 1) * xc_E1_scaled(cse_tmp_48)), cse_tmp_32 * (-cse_tmp_55 + (2 * cse_tmp_53 + cse_tmp_55) * xc_e1_scaled_G(cse_tmp_48))) + cse_tmp_56 * exp(-NaNMath.pow(cse_tmp_1, 0.6666666666666666) * cse_tmp_60 / (cse_tmp_2 * cse_tmp_57 + 0.939016 * cse_tmp_59) ^ 2) * my_piecewise3(cse_tmp_67 < 100, cse_tmp_32 * (2 * cse_tmp_70 * cse_tmp_71 - (cse_tmp_68 * cse_tmp_72 + 1) * xc_E1_scaled(cse_tmp_67)), cse_tmp_32 * (-cse_tmp_73 + (2 * cse_tmp_72 + cse_tmp_73) * xc_e1_scaled_G(cse_tmp_67)))
    end
end
export gga_c_ft97_energy

const gga_c_ft97_defaults = NamedTuple()
const gga_c_ft97_required = ()

function gga_c_ft97(rho, sigma; params = NamedTuple())
    p = resolve_params(gga_c_ft97_defaults, gga_c_ft97_required, params)
    v = gga_variables(rho, sigma, Val(3))
    return gga_c_ft97_energy(v.rs, v.z, v.xt, v.xs0, v.xs1)
end

function gga_c_ft97(na, nb, gaa, gab, gbb; params = NamedTuple())
    p = resolve_params(gga_c_ft97_defaults, gga_c_ft97_required, params)
    v = gga_variables(na, nb, gaa, gab, gbb, Val(3))
    return gga_c_ft97_energy(v.rs, v.z, v.xt, v.xs0, v.xs1)
end

export gga_c_ft97, gga_c_ft97_defaults, gga_c_ft97_required
