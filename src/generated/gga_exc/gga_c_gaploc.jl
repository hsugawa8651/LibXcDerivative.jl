# Auto-generated from the Libxc sources
# python/gga_exc/gga_c_gaploc.py -- do not edit by hand.
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
# args: rs, z, xt, xs0, xs1, XC_EPSILON, zeta_threshold
const gga_c_gaploc_energy = function (rs, z, xt, xs0, xs1, XC_EPSILON, zeta_threshold)
    @inbounds begin
        cse_tmp_0 = NaNMath.sqrt(rs)
        cse_tmp_1 = NaNMath.pow(rs, 1.5)
        cse_tmp_2 = rs ^ 2
        cse_tmp_3 = (-0.0132882934 * rs - 0.062182) * xc_log1p((0.4723158174 * cse_tmp_0 + 0.1018665524 * cse_tmp_1 + 0.03065199508 * cse_tmp_2 + 0.2230841432 * rs) ^ (-1))
        cse_tmp_4 = -cse_tmp_3
        cse_tmp_5 = 1.2599210498948732
        cse_tmp_6 = (2 * cse_tmp_5 - 2) ^ (-1)
        cse_tmp_7 = 1 <= zeta_threshold
        cse_tmp_8 = NaNMath.pow(zeta_threshold, 1.3333333333333333) - 1
        cse_tmp_9 = zeta_threshold - 1
        cse_tmp_10 = xc_log1p(my_piecewise3(0 > cse_tmp_9, 0, cse_tmp_9))
        cse_tmp_11 = (-0.0037573575 * rs - 0.033774) * xc_log1p((0.349797318 * cse_tmp_0 + 0.02972990124 * cse_tmp_1 + 0.01677588354 * cse_tmp_2 + 0.1223665794 * rs) ^ (-1))
        cse_tmp_12 = 1.16964467949104 * cse_tmp_11 * cse_tmp_6 * my_piecewise3(cse_tmp_7, cse_tmp_8, xc_expm1((4 // 3) * cse_tmp_10))
        cse_tmp_13 = 1.4422495703074083
        cse_tmp_14 = 4.60115111447049
        cse_tmp_15 = xt ^ 2
        cse_tmp_16 = cse_tmp_13 * cse_tmp_15 / (12 * cse_tmp_14)
        cse_tmp_17 = NaNMath.pow(XC_EPSILON, 1.3333333333333333)
        cse_tmp_18 = my_piecewise3(cse_tmp_16 > cse_tmp_17, cse_tmp_16, cse_tmp_17)
        cse_tmp_19 = cse_tmp_18 + 14.709046
        cse_tmp_20 = 1.5874010519681994 * 2.1450293971110255 * cse_tmp_13 * cse_tmp_19
        cse_tmp_21 = NaNMath.pow(zeta_threshold, 0.6666666666666666)
        cse_tmp_22 = cse_tmp_21 - 1
        cse_tmp_23 = my_piecewise3(cse_tmp_7, cse_tmp_22, xc_expm1((2 // 3) * cse_tmp_10)) + 1
        cse_tmp_24 = Abs(cse_tmp_23) / cse_tmp_23 ^ 4
        cse_tmp_25 = cse_tmp_15 * Abs(xt) / cse_tmp_1
        cse_tmp_26 = (3 // 128) * cse_tmp_25
        cse_tmp_27 = cse_tmp_25 / 128
        cse_tmp_28 = (cse_tmp_24 * cse_tmp_26 + 8.54613) / (cse_tmp_24 * cse_tmp_27 + 1)
        cse_tmp_29 = NaNMath.pow(cse_tmp_18, cse_tmp_28 / 2)
        cse_tmp_30 = cse_tmp_29 + 1
        cse_tmp_31 = cse_tmp_0 ^ (-1)
        cse_tmp_32 = cse_tmp_0 * (0.07928 * cse_tmp_0 + 0.04953 * rs + 1.07924) + 1
        cse_tmp_33 = cse_tmp_32 ^ (-1)
        cse_tmp_34 = -cse_tmp_12 + cse_tmp_3
        cse_tmp_35 = (0.0236535468 * cse_tmp_31 * cse_tmp_33 - 2 * cse_tmp_34 ^ 2) ^ (-1)
        cse_tmp_36 = cse_tmp_29 * cse_tmp_35 / cse_tmp_30
        cse_tmp_37 = rs ^ 4
        cse_tmp_38 = cse_tmp_37 ^ (-1)
        cse_tmp_39 = rs ^ 3
        cse_tmp_40 = rs ^ 5
        cse_tmp_41 = rs ^ 6
        cse_tmp_42 = rs ^ 7
        cse_tmp_43 = 0.007026 * cse_tmp_37 - 0.02504 * cse_tmp_39 - 0.001268 * cse_tmp_40 + 0.0001136 * cse_tmp_41 - 3.841e-6 * cse_tmp_42
        cse_tmp_44 = cse_tmp_38 * (cse_tmp_34 * cse_tmp_43 - 0.0049064418 * cse_tmp_39 / cse_tmp_32 ^ 2)
        cse_tmp_45 = (9 // 32) * 2.080083823051904 * cse_tmp_14 * cse_tmp_19 ^ 2 * cse_tmp_5
        cse_tmp_46 = cse_tmp_2 ^ (-1)
        cse_tmp_47 = (3 // 8) * cse_tmp_20 * cse_tmp_46
        cse_tmp_48 = (-cse_tmp_12 - 0.0895425 * cse_tmp_20 * cse_tmp_36 * cse_tmp_44 - cse_tmp_4) / (NaNMath.pow(cse_tmp_18, cse_tmp_28) * cse_tmp_35 * cse_tmp_44 * cse_tmp_45 / cse_tmp_30 ^ 2 + cse_tmp_36 * cse_tmp_47 * (0.09906 * cse_tmp_1 * cse_tmp_33 * cse_tmp_34 - 0.23878 * cse_tmp_43 * cse_tmp_46) + 1)
        cse_tmp_49 = -z
        cse_tmp_50 = 2 <= zeta_threshold
        cse_tmp_51 = xc_log1p(my_piecewise3(1 > cse_tmp_9, 1, cse_tmp_9))
        cse_tmp_52 = cse_tmp_21 / 2 + my_piecewise3(cse_tmp_50, cse_tmp_22, xc_expm1((2 // 3) * cse_tmp_51)) / 2 + 1 // 2
        cse_tmp_53 = Abs(cse_tmp_52) / cse_tmp_52 ^ 4
        cse_tmp_54 = (cse_tmp_26 * cse_tmp_53 + 8.54613) / (cse_tmp_27 * cse_tmp_53 + 1)
        cse_tmp_55 = NaNMath.pow(cse_tmp_18, cse_tmp_54 / 2)
        cse_tmp_56 = cse_tmp_55 + 1
        cse_tmp_57 = cse_tmp_0 * (0.00179054 * cse_tmp_0 + 0.0471985 * rs + 1.49676) + 1
        cse_tmp_58 = cse_tmp_57 ^ (-1)
        cse_tmp_59 = 0.58482233974552 * cse_tmp_11
        cse_tmp_60 = cse_tmp_6 * (cse_tmp_8 + my_piecewise3(cse_tmp_50, cse_tmp_8, xc_expm1((4 // 3) * cse_tmp_51)))
        cse_tmp_61 = cse_tmp_3 - cse_tmp_59 * cse_tmp_60 + cse_tmp_60 * (cse_tmp_4 + cse_tmp_59 + (-0.0063883732 * rs - 0.03109) * xc_log1p((0.438956601 * cse_tmp_0 + 0.104655158 * cse_tmp_1 + 0.0194365353 * cse_tmp_2 + 0.192686493 * rs) ^ (-1)))
        cse_tmp_62 = (0.006091910395 * cse_tmp_31 * cse_tmp_58 - 2 * cse_tmp_61 ^ 2) ^ (-1)
        cse_tmp_63 = cse_tmp_55 * cse_tmp_62 / cse_tmp_56
        cse_tmp_64 = 0.00999978 * cse_tmp_37 - 0.0324091 * cse_tmp_39 - 0.00193483 * cse_tmp_40 + 0.000179118 * cse_tmp_41 - 6.15798e-6 * cse_tmp_42
        cse_tmp_65 = cse_tmp_38 * (-0.0044553968045 * cse_tmp_39 / cse_tmp_57 ^ 2 + cse_tmp_61 * cse_tmp_64)
        cse_tmp_48 + cse_tmp_6 * (-cse_tmp_48 + (-0.024200625 * cse_tmp_20 * cse_tmp_63 * cse_tmp_65 + cse_tmp_61) / (NaNMath.pow(cse_tmp_18, cse_tmp_54) * cse_tmp_45 * cse_tmp_62 * cse_tmp_65 / cse_tmp_56 ^ 2 + cse_tmp_47 * cse_tmp_63 * (0.094397 * cse_tmp_1 * cse_tmp_58 * cse_tmp_61 - 0.064535 * cse_tmp_46 * cse_tmp_64) + 1)) * (my_piecewise3(1 - z <= zeta_threshold, cse_tmp_8, xc_expm1((4 // 3) * xc_log1p(my_piecewise3(cse_tmp_49 > cse_tmp_9, cse_tmp_49, cse_tmp_9)))) + my_piecewise3(z + 1 <= zeta_threshold, cse_tmp_8, xc_expm1((4 // 3) * xc_log1p(my_piecewise3(z > cse_tmp_9, z, cse_tmp_9)))))
    end
end
export gga_c_gaploc_energy

const gga_c_gaploc_defaults = (XC_EPSILON = 2.220446049250313e-16, zeta_threshold = 2.220446049250313e-16)
const gga_c_gaploc_required = ()

function gga_c_gaploc(rho, sigma; params = NamedTuple())
    p = resolve_params(gga_c_gaploc_defaults, gga_c_gaploc_required, params)
    v = gga_variables(rho, sigma, Val(3))
    return gga_c_gaploc_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.XC_EPSILON, p.zeta_threshold)
end

function gga_c_gaploc(na, nb, gaa, gab, gbb; params = NamedTuple())
    p = resolve_params(gga_c_gaploc_defaults, gga_c_gaploc_required, params)
    v = gga_variables(na, nb, gaa, gab, gbb, Val(3))
    return gga_c_gaploc_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.XC_EPSILON, p.zeta_threshold)
end

export gga_c_gaploc, gga_c_gaploc_defaults, gga_c_gaploc_required
