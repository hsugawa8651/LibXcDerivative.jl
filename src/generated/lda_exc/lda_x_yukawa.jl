# Auto-generated from the Libxc sources
# python/lda_exc/lda_x_yukawa.py -- do not edit by hand.
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
# args: rs, z, cam_omega, zeta_threshold
const lda_x_yukawa_energy = function (rs, z, cam_omega, zeta_threshold)
    @inbounds begin
        cse_tmp_0 = z + 1
        cse_tmp_1 = cse_tmp_0 <= zeta_threshold
        cse_tmp_2 = NaNMath.pow(zeta_threshold, 0.3333333333333333) - 1
        cse_tmp_3 = zeta_threshold - 1
        cse_tmp_4 = 0.6827840632552957
        cse_tmp_5 = 1.5874010519681994 * 1.4422495703074083 * cam_omega * cse_tmp_4 * rs / 6
        cse_tmp_6 = cse_tmp_5 / (my_piecewise3(cse_tmp_1, cse_tmp_2, xc_expm1(xc_log1p(my_piecewise3(z > cse_tmp_3, z, cse_tmp_3)) / 3)) + 1)
        cse_tmp_7 = cse_tmp_6 > 1.92
        cse_tmp_8 = my_piecewise3(cse_tmp_7, cse_tmp_6, 1.92)
        cse_tmp_9 = my_piecewise3(cse_tmp_7, 1.92, cse_tmp_6)
        cse_tmp_10 = cse_tmp_9 ^ 2
        cse_tmp_11 = NaNMath.pow(zeta_threshold, 1.3333333333333333)
        cse_tmp_12 = 0.184639691595506 * 1.8171205928321397 * cse_tmp_4 / rs
        cse_tmp_13 = 1 - z
        cse_tmp_14 = cse_tmp_13 <= zeta_threshold
        cse_tmp_15 = -z
        cse_tmp_16 = cse_tmp_5 / (my_piecewise3(cse_tmp_14, cse_tmp_2, xc_expm1(xc_log1p(my_piecewise3(cse_tmp_15 > cse_tmp_3, cse_tmp_15, cse_tmp_3)) / 3)) + 1)
        cse_tmp_17 = cse_tmp_16 > 1.92
        cse_tmp_18 = my_piecewise3(cse_tmp_17, cse_tmp_16, 1.92)
        cse_tmp_19 = my_piecewise3(cse_tmp_17, 1.92, cse_tmp_16)
        cse_tmp_20 = cse_tmp_19 ^ 2
        -cse_tmp_12 * my_piecewise3(cse_tmp_1, cse_tmp_11, NaNMath.pow(cse_tmp_0, 1.3333333333333333)) * my_piecewise3(cse_tmp_6 >= 1.92, 1 / (9 * cse_tmp_8 ^ 2) - 1 / (30 * cse_tmp_8 ^ 4) + 1 / (70 * cse_tmp_8 ^ 6) - 1 / (135 * cse_tmp_8 ^ 8) + 1 / (231 * cse_tmp_8 ^ 10) - 1 / (364 * cse_tmp_8 ^ 12) + 1 / (540 * cse_tmp_8 ^ 14) - 1 / (765 * cse_tmp_8 ^ 16) + 1 / (1045 * cse_tmp_8 ^ 18) - 1 / (1386 * cse_tmp_8 ^ 20) + 1 / (1794 * cse_tmp_8 ^ 22) - 1 / (2275 * cse_tmp_8 ^ 24) + 1 / (2835 * cse_tmp_8 ^ 26) - 1 / (3480 * cse_tmp_8 ^ 28) + 1 / (4216 * cse_tmp_8 ^ 30) - 1 / (5049 * cse_tmp_8 ^ 32) + 1 / (5985 * cse_tmp_8 ^ 34), -8 // 3 * cse_tmp_9 * (cse_tmp_9 * (-(cse_tmp_10 + 3) * xc_log1p(cse_tmp_10 ^ (-1)) + 1) / 4 + atan2(1, cse_tmp_9)) + 1) - cse_tmp_12 * my_piecewise3(cse_tmp_14, cse_tmp_11, NaNMath.pow(cse_tmp_13, 1.3333333333333333)) * my_piecewise3(cse_tmp_16 >= 1.92, 1 / (9 * cse_tmp_18 ^ 2) - 1 / (30 * cse_tmp_18 ^ 4) + 1 / (70 * cse_tmp_18 ^ 6) - 1 / (135 * cse_tmp_18 ^ 8) + 1 / (231 * cse_tmp_18 ^ 10) - 1 / (364 * cse_tmp_18 ^ 12) + 1 / (540 * cse_tmp_18 ^ 14) - 1 / (765 * cse_tmp_18 ^ 16) + 1 / (1045 * cse_tmp_18 ^ 18) - 1 / (1386 * cse_tmp_18 ^ 20) + 1 / (1794 * cse_tmp_18 ^ 22) - 1 / (2275 * cse_tmp_18 ^ 24) + 1 / (2835 * cse_tmp_18 ^ 26) - 1 / (3480 * cse_tmp_18 ^ 28) + 1 / (4216 * cse_tmp_18 ^ 30) - 1 / (5049 * cse_tmp_18 ^ 32) + 1 / (5985 * cse_tmp_18 ^ 34), -8 // 3 * cse_tmp_19 * (cse_tmp_19 * (-(cse_tmp_20 + 3) * xc_log1p(cse_tmp_20 ^ (-1)) + 1) / 4 + atan2(1, cse_tmp_19)) + 1)
    end
end
export lda_x_yukawa_energy

const lda_x_yukawa_defaults = (cam_omega = 0.3, zeta_threshold = 2.220446049250313e-16)
const lda_x_yukawa_required = ()

function lda_x_yukawa(rho; params = NamedTuple())
    p = resolve_params(lda_x_yukawa_defaults, lda_x_yukawa_required, params)
    v = lda_variables(rho, Val(3))
    return lda_x_yukawa_energy(v.rs, v.z, p.cam_omega, p.zeta_threshold)
end

function lda_x_yukawa(na, nb; params = NamedTuple())
    p = resolve_params(lda_x_yukawa_defaults, lda_x_yukawa_required, params)
    v = lda_variables(na, nb, Val(3))
    return lda_x_yukawa_energy(v.rs, v.z, p.cam_omega, p.zeta_threshold)
end

export lda_x_yukawa, lda_x_yukawa_defaults, lda_x_yukawa_required
