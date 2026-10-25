# Auto-generated from the Libxc sources
# python/lda_exc/lda_c_pmgb06.py -- do not edit by hand.
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
# args: rs, z, cam_omega, zeta_threshold
const lda_c_pmgb06_energy = function (rs, z, cam_omega, zeta_threshold)
    @inbounds begin
        cse_tmp_0 = cam_omega ^ 2
        cse_tmp_1 = rs ^ 2
        cse_tmp_2 = rs ^ 5
        cse_tmp_3 = 1.4142135623730951 / 1.772453850905516
        cse_tmp_4 = cse_tmp_2 * cse_tmp_3
        cse_tmp_5 = rs ^ 3
        cse_tmp_6 = rs ^ 4
        cse_tmp_7 = 9.869604401089358
        cse_tmp_8 = NaNMath.log(2)
        cse_tmp_9 = 1.5874010519681994
        cse_tmp_10 = 1.4422495703074083 * cse_tmp_9
        cse_tmp_11 = rs * (-2 // 15 * cse_tmp_10 * (cse_tmp_7 + 6 * cse_tmp_8 - 3) / 4.60115111447049 + 0.7524)
        cse_tmp_12 = 0.08193 * cse_tmp_1 + cse_tmp_11 - 0.01277 * cse_tmp_5 + 0.001859 * cse_tmp_6 + 1
        cse_tmp_13 = -0.7524 * rs
        cse_tmp_14 = z + 1
        cse_tmp_15 = 1 - z
        cse_tmp_16 = cse_tmp_14 * cse_tmp_15
        cse_tmp_17 = cse_tmp_12 * cse_tmp_16 * exp(cse_tmp_13)
        cse_tmp_18 = NaNMath.sqrt(rs)
        cse_tmp_19 = NaNMath.pow(rs, 1.5)
        cse_tmp_20 = (-0.01328816518 * rs - 0.0621814) * xc_log1p((0.030651699316 * cse_tmp_1 + 0.47231125998 * cse_tmp_18 + 0.10186556948 * cse_tmp_19 + 0.22308199064 * rs) ^ (-1))
        cse_tmp_21 = 0.5848223622634646207262238663759 * (-0.00375733525 * rs - 0.0337738) * xc_log1p((0.016775784198 * cse_tmp_1 + 0.3497952466 * cse_tmp_18 + 0.029729725188 * cse_tmp_19 + 0.12236585478 * rs) ^ (-1))
        cse_tmp_22 = 1.2599210498948732
        cse_tmp_23 = cse_tmp_14 <= zeta_threshold
        cse_tmp_24 = NaNMath.pow(zeta_threshold, 1.3333333333333333) - 1
        cse_tmp_25 = zeta_threshold - 1
        cse_tmp_26 = xc_log1p(my_piecewise3(z > cse_tmp_25, z, cse_tmp_25))
        cse_tmp_27 = cse_tmp_15 <= zeta_threshold
        cse_tmp_28 = -z
        cse_tmp_29 = xc_log1p(my_piecewise3(cse_tmp_28 > cse_tmp_25, cse_tmp_28, cse_tmp_25))
        cse_tmp_30 = (my_piecewise3(cse_tmp_23, cse_tmp_24, xc_expm1((4 // 3) * cse_tmp_26)) + my_piecewise3(cse_tmp_27, cse_tmp_24, xc_expm1((4 // 3) * cse_tmp_29))) / (2 * cse_tmp_22 - 2)
        cse_tmp_31 = cse_tmp_20 - cse_tmp_21 * cse_tmp_30 + cse_tmp_30 * z ^ 4 * (-cse_tmp_20 + cse_tmp_21 + (-0.006388517036 * rs - 0.0310907) * xc_log1p((0.019436972919 * cse_tmp_1 + 0.43896648423 * cse_tmp_18 + 0.10465751434 * cse_tmp_19 + 0.19269083139 * rs) ^ (-1)))
        cse_tmp_32 = cam_omega ^ 3
        cse_tmp_33 = cse_tmp_14 ^ (-1)
        cse_tmp_34 = NaNMath.pow(cse_tmp_33, 0.6666666666666666)
        cse_tmp_35 = cse_tmp_22 * rs
        cse_tmp_36 = NaNMath.pow(cse_tmp_33, 0.3333333333333333) * cse_tmp_35
        cse_tmp_37 = 0.04 * cse_tmp_1 * cse_tmp_9
        cse_tmp_38 = zeta_threshold ^ 2 - 1
        cse_tmp_39 = 2.1450293971110255
        cse_tmp_40 = cse_tmp_1 ^ (-1)
        cse_tmp_41 = (3 // 10) * 2.2894284851066637 * cse_tmp_39 * cse_tmp_40
        cse_tmp_42 = cse_tmp_15 ^ (-1)
        cse_tmp_43 = NaNMath.pow(cse_tmp_42, 0.6666666666666666)
        cse_tmp_44 = cse_tmp_35 * NaNMath.pow(cse_tmp_42, 0.3333333333333333)
        cse_tmp_45 = cse_tmp_41 * (1 - 0.02267 * cse_tmp_44) * (my_piecewise3(cse_tmp_27, cse_tmp_38, xc_expm1(2 * cse_tmp_29)) / 4 + 1 // 4) / (cse_tmp_43 * (cse_tmp_37 * cse_tmp_43 + 0.4319 * cse_tmp_44 + 1)) + cse_tmp_41 * (1 - 0.02267 * cse_tmp_36) * (my_piecewise3(cse_tmp_23, cse_tmp_38, xc_expm1(2 * cse_tmp_26)) / 4 + 1 // 4) / (cse_tmp_34 * (cse_tmp_34 * cse_tmp_37 + 0.4319 * cse_tmp_36 + 1))
        cse_tmp_46 = NaNMath.pow(zeta_threshold, 0.6666666666666666)
        cse_tmp_47 = my_piecewise3(cse_tmp_23, cse_tmp_46, NaNMath.pow(cse_tmp_14, 0.6666666666666666)) / 2 + my_piecewise3(cse_tmp_27, cse_tmp_46, NaNMath.pow(cse_tmp_15, 0.6666666666666666)) / 2
        cse_tmp_48 = cse_tmp_47 ^ 3
        cse_tmp_49 = cse_tmp_0 * rs / cse_tmp_47 ^ 2
        cse_tmp_50 = 3.44851 * cse_tmp_49
        cse_tmp_51 = cse_tmp_10 * cse_tmp_39
        cse_tmp_52 = cse_tmp_16 * (0.040965 * cse_tmp_1 + cse_tmp_11 / 2 + cse_tmp_12 * xc_expm1(cse_tmp_13) / 2 - 0.006385 * cse_tmp_5 + 0.0009295 * cse_tmp_6)
        cse_tmp_53 = NaNMath.pow(zeta_threshold, 2.6666666666666665)
        (0.144122412790377 * cam_omega ^ 8 * cse_tmp_31 * rs ^ 8 + cam_omega ^ 6 * (-0.0540459047963914 * cse_tmp_2 * cse_tmp_52 + 0.93563968582507 * cse_tmp_31 * rs ^ 6) - 0.0360306031975943 * cam_omega ^ 5 * cse_tmp_17 * cse_tmp_4 + cam_omega ^ 4 * (-0.0202672142986468 * cse_tmp_2 * (cse_tmp_16 * cse_tmp_40 * (0.676 * cse_tmp_1 - 0.388 * rs) * exp(-0.547 * rs) - 3 // 20 * cse_tmp_40 * cse_tmp_51 * (my_piecewise3(cse_tmp_23, cse_tmp_53, NaNMath.pow(cse_tmp_14, 2.6666666666666665)) / 2 + my_piecewise3(cse_tmp_27, cse_tmp_53, NaNMath.pow(cse_tmp_15, 2.6666666666666665)) / 2) + cse_tmp_45) + 2.27780746781935 * cse_tmp_31 * cse_tmp_6 - 0.350864882184401 * cse_tmp_5 * cse_tmp_52) + cse_tmp_32 * (-0.233909921456267 * cse_tmp_17 * cse_tmp_3 * cse_tmp_5 - 0.0162137714389174 * cse_tmp_4 * (cse_tmp_16 * (cse_tmp_1 - 4.95 * rs) * exp(-0.31 * rs) / cse_tmp_5 + cse_tmp_45)) + cse_tmp_48 * (2 * cse_tmp_8 - 2) * xc_log1p((3.91744 * cse_tmp_19 * cse_tmp_32 / cse_tmp_48 + cse_tmp_49 * (-cse_tmp_51 / (4 * cse_tmp_8 - 4) + 3.44851) - cse_tmp_50) / (5.84605 * cam_omega * cse_tmp_18 / cse_tmp_47 + cse_tmp_50 + 1)) / cse_tmp_7) / (0.616144932601 * cse_tmp_0 * cse_tmp_1 + 1) ^ 4
    end
end
export lda_c_pmgb06_energy

const lda_c_pmgb06_defaults = (cam_omega = 0.3, zeta_threshold = 2.220446049250313e-16)
const lda_c_pmgb06_required = ()

function lda_c_pmgb06(rho; params = NamedTuple())
    p = resolve_params(lda_c_pmgb06_defaults, lda_c_pmgb06_required, params)
    v = lda_variables(rho, Val(3))
    return lda_c_pmgb06_energy(v.rs, v.z, p.cam_omega, p.zeta_threshold)
end

function lda_c_pmgb06(na, nb; params = NamedTuple())
    p = resolve_params(lda_c_pmgb06_defaults, lda_c_pmgb06_required, params)
    v = lda_variables(na, nb, Val(3))
    return lda_c_pmgb06_energy(v.rs, v.z, p.cam_omega, p.zeta_threshold)
end

export lda_c_pmgb06, lda_c_pmgb06_defaults, lda_c_pmgb06_required
