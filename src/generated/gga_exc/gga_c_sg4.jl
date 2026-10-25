# Auto-generated from the Libxc sources
# python/gga_exc/gga_c_sg4.py -- do not edit by hand.
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
# args: rs, z, xt, xs0, xs1, zeta_threshold
const gga_c_sg4_energy = function (rs, z, xt, xs0, xs1, zeta_threshold)
    @inbounds begin
        cse_tmp_0 = Abs(xt)
        cse_tmp_1 = NaNMath.pow(rs, 1.5)
        cse_tmp_2 = xt ^ 2
        cse_tmp_3 = z + 1 <= zeta_threshold
        cse_tmp_4 = NaNMath.pow(zeta_threshold, 0.6666666666666666) - 1
        cse_tmp_5 = zeta_threshold - 1
        cse_tmp_6 = xc_log1p(my_piecewise3(z > cse_tmp_5, z, cse_tmp_5))
        cse_tmp_7 = 1 - z <= zeta_threshold
        cse_tmp_8 = -z
        cse_tmp_9 = xc_log1p(my_piecewise3(cse_tmp_8 > cse_tmp_5, cse_tmp_8, cse_tmp_5))
        cse_tmp_10 = my_piecewise3(cse_tmp_3, cse_tmp_4, xc_expm1((2 // 3) * cse_tmp_6)) / 2 + my_piecewise3(cse_tmp_7, cse_tmp_4, xc_expm1((2 // 3) * cse_tmp_9)) / 2
        cse_tmp_11 = cse_tmp_10 + 1
        cse_tmp_12 = Abs(cse_tmp_11)
        cse_tmp_13 = cse_tmp_11 ^ (-4)
        cse_tmp_14 = 0.00625 * cse_tmp_0 * cse_tmp_12 * cse_tmp_13 * cse_tmp_2 * xc_log1p(cse_tmp_10) / cse_tmp_1
        cse_tmp_15 = cse_tmp_11 ^ 3
        cse_tmp_16 = NaNMath.sqrt(rs)
        cse_tmp_17 = rs ^ 2
        cse_tmp_18 = (-0.01328816518 * rs - 0.0621814) * xc_log1p((0.10186556948 * cse_tmp_1 + 0.47231125998 * cse_tmp_16 + 0.030651699316 * cse_tmp_17 + 0.22308199064 * rs) ^ (-1))
        cse_tmp_19 = 0.5848223622634646207262238663759 * (-0.00375733525 * rs - 0.0337738) * xc_log1p((0.029729725188 * cse_tmp_1 + 0.3497952466 * cse_tmp_16 + 0.016775784198 * cse_tmp_17 + 0.12236585478 * rs) ^ (-1))
        cse_tmp_20 = 1.2599210498948732
        cse_tmp_21 = NaNMath.pow(zeta_threshold, 1.3333333333333333) - 1
        cse_tmp_22 = (my_piecewise3(cse_tmp_3, cse_tmp_21, xc_expm1((4 // 3) * cse_tmp_6)) + my_piecewise3(cse_tmp_7, cse_tmp_21, xc_expm1((4 // 3) * cse_tmp_9))) / (2 * cse_tmp_20 - 2)
        cse_tmp_23 = cse_tmp_18 - cse_tmp_19 * cse_tmp_22 + cse_tmp_22 * z ^ 4 * (-cse_tmp_18 + cse_tmp_19 + (-0.006388517036 * rs - 0.0310907) * xc_log1p((0.10465751434 * cse_tmp_1 + 0.43896648423 * cse_tmp_16 + 0.019436972919 * cse_tmp_17 + 0.19269083139 * rs) ^ (-1)))
        cse_tmp_24 = 9.869604401089358
        cse_tmp_25 = 1 - NaNMath.log(2)
        cse_tmp_26 = cse_tmp_24 / cse_tmp_25
        cse_tmp_27 = cse_tmp_23 * cse_tmp_26 / cse_tmp_15
        cse_tmp_28 = 1.5874010519681994
        cse_tmp_29 = xc_expm1(-cse_tmp_27)
        cse_tmp_30 = cse_tmp_24 ^ (-1)
        cse_tmp_31 = cse_tmp_26 * (-0.00875 * cse_tmp_0 * cse_tmp_28 * xc_expm1(-cse_tmp_17) / (cse_tmp_12 * cse_tmp_16) + 0.78 * cse_tmp_30) / cse_tmp_29
        cse_tmp_32 = cse_tmp_31 * (cse_tmp_13 * cse_tmp_28 * cse_tmp_31 * xt ^ 4 / (1024 * cse_tmp_17) + cse_tmp_2 * cse_tmp_20 / (32 * cse_tmp_11 ^ 2 * rs))
        cse_tmp_33 = (cse_tmp_32 + 1) ^ (-1)
        cse_tmp_34 = cse_tmp_15 * cse_tmp_25 * cse_tmp_30
        cse_tmp_35 = cse_tmp_34 * xc_log1p(cse_tmp_29 * my_piecewise3(cse_tmp_32 <= 1, cse_tmp_32 * cse_tmp_33, 1 - cse_tmp_33))
        my_piecewise3(cse_tmp_14 > -1 // 2, cse_tmp_34 * xc_log1p(cse_tmp_33 * xc_expm1(cse_tmp_27)) + cse_tmp_35 * xc_expm1(cse_tmp_14), cse_tmp_23 + cse_tmp_35 * exp(cse_tmp_14))
    end
end
export gga_c_sg4_energy

const gga_c_sg4_defaults = (zeta_threshold = 2.220446049250313e-16,)
const gga_c_sg4_required = ()

function gga_c_sg4(rho, sigma; params = NamedTuple())
    p = resolve_params(gga_c_sg4_defaults, gga_c_sg4_required, params)
    v = gga_variables(rho, sigma, Val(3))
    return gga_c_sg4_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.zeta_threshold)
end

function gga_c_sg4(na, nb, gaa, gab, gbb; params = NamedTuple())
    p = resolve_params(gga_c_sg4_defaults, gga_c_sg4_required, params)
    v = gga_variables(na, nb, gaa, gab, gbb, Val(3))
    return gga_c_sg4_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.zeta_threshold)
end

export gga_c_sg4, gga_c_sg4_defaults, gga_c_sg4_required
