# Auto-generated from the Libxc sources
# python/lda_exc/lda_c_2d_amgb.py -- do not edit by hand.
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
# args: rs, z, zeta_threshold
const lda_c_2d_amgb_energy = function (rs, z, zeta_threshold)
    @inbounds begin
        cse_tmp_0 = z ^ 4
        cse_tmp_1 = rs ^ 3
        cse_tmp_2 = rs ^ 2
        cse_tmp_3 = z ^ 2
        cse_tmp_4 = -z
        cse_tmp_5 = NaNMath.pow(zeta_threshold, 1.5) - 1
        cse_tmp_6 = zeta_threshold - 1
        cse_tmp_0 * ((-0.0272383828612 * cse_tmp_1 + 0.0163618 * cse_tmp_2 - 0.037093 * rs) * xc_log1p((1.163099 * cse_tmp_1 + 1.424301 * rs) ^ (-1)) + 0.0234188) + cse_tmp_3 * ((-9.15064469e-5 * cse_tmp_1 - 0.00766765 * cse_tmp_2 - 0.03394 * rs) * xc_log1p((0.0007799 * cse_tmp_1 + 0.0668467 * cse_tmp_2 + 0.4133 * rs) ^ (-1)) + 0.117331) + (0.003362975 * cse_tmp_1 + 0.0572384 * cse_tmp_2 + 0.0863136 * rs) * xc_log1p((0.01747 * cse_tmp_1 + 0.33997 * cse_tmp_2 - 0.02069 * NaNMath.pow(rs, 1.5) + 1.0022 * rs) ^ (-1)) - 0.1925 - 4 // 3 * 1.4142135623730951 * my_piecewise3(my_piecewise3(z >= 0, z, cse_tmp_4) < 1 // 2, (6593698793759 // 72057594037927936) * z ^ 30 + (983965343151 // 9007199254740992) * z ^ 28 + (74417546961 // 562949953421312) * z ^ 26 + (11435320455 // 70368744177664) * z ^ 24 + (447553665 // 2199023255552) * z ^ 22 + (71645805 // 274877906944) * z ^ 20 + (5892945 // 17179869184) * z ^ 18 + (1002915 // 2147483648) * z ^ 16 + (22287 // 33554432) * z ^ 14 + (4199 // 4194304) * z ^ 12 + (429 // 262144) * z ^ 10 + (99 // 32768) * z ^ 8 + (7 // 1024) * z ^ 6, -3 // 128 * cse_tmp_0 - 3 // 8 * cse_tmp_3 + my_piecewise3(1 - z <= zeta_threshold, cse_tmp_5, xc_expm1((3 // 2) * xc_log1p(my_piecewise3(cse_tmp_4 > cse_tmp_6, cse_tmp_4, cse_tmp_6)))) / 2 + my_piecewise3(z + 1 <= zeta_threshold, cse_tmp_5, xc_expm1((3 // 2) * xc_log1p(my_piecewise3(z > cse_tmp_6, z, cse_tmp_6)))) / 2) * xc_expm1(-1.3386 * rs) / (pi * rs)
    end
end
export lda_c_2d_amgb_energy

const lda_c_2d_amgb_defaults = (zeta_threshold = 2.220446049250313e-16,)
const lda_c_2d_amgb_required = ()

function lda_c_2d_amgb(rho; params = NamedTuple())
    p = resolve_params(lda_c_2d_amgb_defaults, lda_c_2d_amgb_required, params)
    v = lda_variables(rho, Val(2))
    return lda_c_2d_amgb_energy(v.rs, v.z, p.zeta_threshold)
end

function lda_c_2d_amgb(na, nb; params = NamedTuple())
    p = resolve_params(lda_c_2d_amgb_defaults, lda_c_2d_amgb_required, params)
    v = lda_variables(na, nb, Val(2))
    return lda_c_2d_amgb_energy(v.rs, v.z, p.zeta_threshold)
end

export lda_c_2d_amgb, lda_c_2d_amgb_defaults, lda_c_2d_amgb_required
