# Auto-generated from the Libxc sources
# python/lda_exc/hyb_lda_xc_bn05.py -- do not edit by hand.
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
# args: rs, z, cam_omega, zeta_threshold
const hyb_lda_xc_bn05_energy = function (rs, z, cam_omega, zeta_threshold)
    @inbounds begin
        cse_tmp_0 = rs ^ 2
        cse_tmp_1 = NaNMath.sqrt(rs)
        cse_tmp_2 = NaNMath.pow(rs, 1.5)
        cse_tmp_3 = (-0.01328816518 * rs - 0.0621814) * xc_log1p((0.030651699316 * cse_tmp_0 + 0.47231125998 * cse_tmp_1 + 0.10186556948 * cse_tmp_2 + 0.22308199064 * rs) ^ (-1))
        cse_tmp_4 = 0.5848223622634646207262238663759 * (-0.00375733525 * rs - 0.0337738) * xc_log1p((0.016775784198 * cse_tmp_0 + 0.3497952466 * cse_tmp_1 + 0.029729725188 * cse_tmp_2 + 0.12236585478 * rs) ^ (-1))
        cse_tmp_5 = z + 1
        cse_tmp_6 = cse_tmp_5 <= zeta_threshold
        cse_tmp_7 = NaNMath.pow(zeta_threshold, 1.3333333333333333)
        cse_tmp_8 = cse_tmp_7 - 1
        cse_tmp_9 = zeta_threshold - 1
        cse_tmp_10 = xc_log1p(my_piecewise3(z > cse_tmp_9, z, cse_tmp_9))
        cse_tmp_11 = 1 - z
        cse_tmp_12 = cse_tmp_11 <= zeta_threshold
        cse_tmp_13 = -z
        cse_tmp_14 = xc_log1p(my_piecewise3(cse_tmp_13 > cse_tmp_9, cse_tmp_13, cse_tmp_9))
        cse_tmp_15 = (my_piecewise3(cse_tmp_12, cse_tmp_8, xc_expm1((4 // 3) * cse_tmp_14)) + my_piecewise3(cse_tmp_6, cse_tmp_8, xc_expm1((4 // 3) * cse_tmp_10))) / (-2 + 2 * 1.2599210498948732)
        cse_tmp_16 = NaNMath.pow(zeta_threshold, 0.3333333333333333) - 1
        cse_tmp_17 = 0.6827840632552957
        cse_tmp_18 = 1.5874010519681994 * 1.4422495703074083 * cam_omega * cse_tmp_17 * rs / 6
        cse_tmp_19 = cse_tmp_18 / (my_piecewise3(cse_tmp_6, cse_tmp_16, xc_expm1(cse_tmp_10 / 3)) + 1)
        cse_tmp_20 = cse_tmp_19 > 1.92
        cse_tmp_21 = my_piecewise3(cse_tmp_20, cse_tmp_19, 1.92)
        cse_tmp_22 = my_piecewise3(cse_tmp_20, 1.92, cse_tmp_19)
        cse_tmp_23 = cse_tmp_22 ^ 2
        cse_tmp_24 = 0.184639691595506 * 1.8171205928321397 * cse_tmp_17 / rs
        cse_tmp_25 = cse_tmp_18 / (my_piecewise3(cse_tmp_12, cse_tmp_16, xc_expm1(cse_tmp_14 / 3)) + 1)
        cse_tmp_26 = cse_tmp_25 > 1.92
        cse_tmp_27 = my_piecewise3(cse_tmp_26, cse_tmp_25, 1.92)
        cse_tmp_28 = my_piecewise3(cse_tmp_26, 1.92, cse_tmp_25)
        cse_tmp_29 = cse_tmp_28 ^ 2
        -cse_tmp_24 * my_piecewise3(cse_tmp_12, cse_tmp_7, NaNMath.pow(cse_tmp_11, 1.3333333333333333)) * my_piecewise3(cse_tmp_25 >= 1.92, 1 / (9 * cse_tmp_27 ^ 2) - 1 / (30 * cse_tmp_27 ^ 4) + 1 / (70 * cse_tmp_27 ^ 6) - 1 / (135 * cse_tmp_27 ^ 8) + 1 / (231 * cse_tmp_27 ^ 10) - 1 / (364 * cse_tmp_27 ^ 12) + 1 / (540 * cse_tmp_27 ^ 14) - 1 / (765 * cse_tmp_27 ^ 16) + 1 / (1045 * cse_tmp_27 ^ 18) - 1 / (1386 * cse_tmp_27 ^ 20) + 1 / (1794 * cse_tmp_27 ^ 22) - 1 / (2275 * cse_tmp_27 ^ 24) + 1 / (2835 * cse_tmp_27 ^ 26) - 1 / (3480 * cse_tmp_27 ^ 28) + 1 / (4216 * cse_tmp_27 ^ 30) - 1 / (5049 * cse_tmp_27 ^ 32) + 1 / (5985 * cse_tmp_27 ^ 34), -8 // 3 * cse_tmp_28 * (cse_tmp_28 * (-(cse_tmp_29 + 3) * xc_log1p(cse_tmp_29 ^ (-1)) + 1) / 4 + atan2(1, cse_tmp_28)) + 1) - cse_tmp_24 * my_piecewise3(cse_tmp_6, cse_tmp_7, NaNMath.pow(cse_tmp_5, 1.3333333333333333)) * my_piecewise3(cse_tmp_19 >= 1.92, 1 / (9 * cse_tmp_21 ^ 2) - 1 / (30 * cse_tmp_21 ^ 4) + 1 / (70 * cse_tmp_21 ^ 6) - 1 / (135 * cse_tmp_21 ^ 8) + 1 / (231 * cse_tmp_21 ^ 10) - 1 / (364 * cse_tmp_21 ^ 12) + 1 / (540 * cse_tmp_21 ^ 14) - 1 / (765 * cse_tmp_21 ^ 16) + 1 / (1045 * cse_tmp_21 ^ 18) - 1 / (1386 * cse_tmp_21 ^ 20) + 1 / (1794 * cse_tmp_21 ^ 22) - 1 / (2275 * cse_tmp_21 ^ 24) + 1 / (2835 * cse_tmp_21 ^ 26) - 1 / (3480 * cse_tmp_21 ^ 28) + 1 / (4216 * cse_tmp_21 ^ 30) - 1 / (5049 * cse_tmp_21 ^ 32) + 1 / (5985 * cse_tmp_21 ^ 34), -8 // 3 * cse_tmp_22 * (cse_tmp_22 * (-(cse_tmp_23 + 3) * xc_log1p(cse_tmp_23 ^ (-1)) + 1) / 4 + atan2(1, cse_tmp_22)) + 1) + 3.4602 * (-cse_tmp_15 * cse_tmp_4 + cse_tmp_15 * z ^ 4 * (-cse_tmp_3 + cse_tmp_4 + (-0.006388517036 * rs - 0.0310907) * xc_log1p((0.019436972919 * cse_tmp_0 + 0.43896648423 * cse_tmp_1 + 0.10465751434 * cse_tmp_2 + 0.19269083139 * rs) ^ (-1))) + cse_tmp_3) / (cse_tmp_0 - 0.9 * rs + 3.2)
    end
end
export hyb_lda_xc_bn05_energy

const hyb_lda_xc_bn05_defaults = (cam_omega = 1.0, zeta_threshold = 2.220446049250313e-16)
const hyb_lda_xc_bn05_required = ()

function hyb_lda_xc_bn05(rho; params = NamedTuple())
    p = resolve_params(hyb_lda_xc_bn05_defaults, hyb_lda_xc_bn05_required, params)
    v = lda_variables(rho, Val(3))
    return hyb_lda_xc_bn05_energy(v.rs, v.z, p.cam_omega, p.zeta_threshold)
end

function hyb_lda_xc_bn05(na, nb; params = NamedTuple())
    p = resolve_params(hyb_lda_xc_bn05_defaults, hyb_lda_xc_bn05_required, params)
    v = lda_variables(na, nb, Val(3))
    return hyb_lda_xc_bn05_energy(v.rs, v.z, p.cam_omega, p.zeta_threshold)
end

export hyb_lda_xc_bn05, hyb_lda_xc_bn05_defaults, hyb_lda_xc_bn05_required
