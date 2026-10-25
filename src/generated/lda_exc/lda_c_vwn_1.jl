# Auto-generated from the Libxc sources
# python/lda_exc/lda_c_vwn_1.py -- do not edit by hand.
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
# args: rs, z, zeta_threshold
const lda_c_vwn_1_energy = function (rs, z, zeta_threshold)
    @inbounds begin
        cse_tmp_0 = 1.2599210498948732
        cse_tmp_1 = (2 * cse_tmp_0 - 2) ^ (-1)
        cse_tmp_2 = NaNMath.pow(zeta_threshold, 1.3333333333333333) - 1
        cse_tmp_3 = zeta_threshold - 1
        cse_tmp_4 = -z
        cse_tmp_5 = NaNMath.sqrt(rs)
        cse_tmp_6 = 2 * cse_tmp_5
        cse_tmp_7 = 7.06042 * cse_tmp_5 + 18.0578
        cse_tmp_8 = cse_tmp_7 + rs
        cse_tmp_9 = cse_tmp_8 ^ (-1)
        cse_tmp_10 = z / 2
        cse_tmp_11 = cse_tmp_10 - 1 // 2
        cse_tmp_12 = cse_tmp_10 + 1 // 2
        cse_tmp_13 = -cse_tmp_12
        cse_tmp_14 = 3.72744 * cse_tmp_5 + 12.9352
        cse_tmp_15 = cse_tmp_14 + rs
        cse_tmp_16 = cse_tmp_15 ^ (-1)
        -2 * cse_tmp_0 * cse_tmp_1 * (0.038783294878113 * atan(6.15199081975908 / (cse_tmp_6 + 3.72744)) + 0.0310907 * xc_log1p(-cse_tmp_14 * cse_tmp_16) + 0.000969022771154437 * xc_log1p(cse_tmp_16 * (-cse_tmp_15 + (cse_tmp_5 + 0.10498) ^ 2))) * (my_piecewise3(-cse_tmp_11 <= zeta_threshold, cse_tmp_2, xc_expm1((4 // 3) * xc_log1p(my_piecewise3(cse_tmp_13 > cse_tmp_3, cse_tmp_13, cse_tmp_3)))) + my_piecewise3(cse_tmp_12 <= zeta_threshold, cse_tmp_2, xc_expm1((4 // 3) * xc_log1p(my_piecewise3(cse_tmp_11 > cse_tmp_3, cse_tmp_11, cse_tmp_3)))) + 1) + cse_tmp_1 * (my_piecewise3(1 - z <= zeta_threshold, cse_tmp_2, xc_expm1((4 // 3) * xc_log1p(my_piecewise3(cse_tmp_4 > cse_tmp_3, cse_tmp_4, cse_tmp_3)))) + my_piecewise3(z + 1 <= zeta_threshold, cse_tmp_2, xc_expm1((4 // 3) * xc_log1p(my_piecewise3(z > cse_tmp_3, z, cse_tmp_3))))) * (0.0524913931697809 * atan(4.73092690956011 / (cse_tmp_6 + 7.06042)) + 0.01554535 * xc_log1p(-cse_tmp_7 * cse_tmp_9) + 0.00224786709554261 * xc_log1p(cse_tmp_9 * (-cse_tmp_8 + (cse_tmp_5 + 0.325) ^ 2)))
    end
end
export lda_c_vwn_1_energy

const lda_c_vwn_1_defaults = (zeta_threshold = 2.220446049250313e-16,)
const lda_c_vwn_1_required = ()

function lda_c_vwn_1(rho; params = NamedTuple())
    p = resolve_params(lda_c_vwn_1_defaults, lda_c_vwn_1_required, params)
    v = lda_variables(rho, Val(3))
    return lda_c_vwn_1_energy(v.rs, v.z, p.zeta_threshold)
end

function lda_c_vwn_1(na, nb; params = NamedTuple())
    p = resolve_params(lda_c_vwn_1_defaults, lda_c_vwn_1_required, params)
    v = lda_variables(na, nb, Val(3))
    return lda_c_vwn_1_energy(v.rs, v.z, p.zeta_threshold)
end

export lda_c_vwn_1, lda_c_vwn_1_defaults, lda_c_vwn_1_required
