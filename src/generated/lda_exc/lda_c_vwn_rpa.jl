# Auto-generated from the Libxc sources
# python/lda_exc/lda_c_vwn_rpa.py -- do not edit by hand.
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
# args: rs, z, zeta_threshold
const lda_c_vwn_rpa_energy = function (rs, z, zeta_threshold)
    @inbounds begin
        cse_tmp_0 = 1.2599210498948732
        cse_tmp_1 = (2 * cse_tmp_0 - 2) ^ (-1)
        cse_tmp_2 = NaNMath.pow(zeta_threshold, 1.3333333333333333) - 1
        cse_tmp_3 = zeta_threshold - 1
        cse_tmp_4 = -z
        cse_tmp_5 = NaNMath.sqrt(rs)
        cse_tmp_6 = 2 * cse_tmp_5
        cse_tmp_7 = 20.1231 * cse_tmp_5 + 101.578
        cse_tmp_8 = cse_tmp_7 + rs
        cse_tmp_9 = cse_tmp_8 ^ (-1)
        cse_tmp_10 = z / 2
        cse_tmp_11 = cse_tmp_10 - 1 // 2
        cse_tmp_12 = cse_tmp_10 + 1 // 2
        cse_tmp_13 = -cse_tmp_12
        cse_tmp_14 = 13.072 * cse_tmp_5 + 42.7198
        cse_tmp_15 = cse_tmp_14 + rs
        cse_tmp_16 = cse_tmp_15 ^ (-1)
        -2 * cse_tmp_0 * cse_tmp_1 * (20.5219729377052 * atan(0.0448998886415768 / (cse_tmp_6 + 13.072)) + 0.0310907 * xc_log1p(-cse_tmp_14 * cse_tmp_16) + 0.00443137376774954 * xc_log1p(cse_tmp_16 * (-cse_tmp_15 + (cse_tmp_5 + 0.409286) ^ 2))) * (my_piecewise3(-cse_tmp_11 <= zeta_threshold, cse_tmp_2, xc_expm1((4 // 3) * xc_log1p(my_piecewise3(cse_tmp_13 > cse_tmp_3, cse_tmp_13, cse_tmp_3)))) + my_piecewise3(cse_tmp_12 <= zeta_threshold, cse_tmp_2, xc_expm1((4 // 3) * xc_log1p(my_piecewise3(cse_tmp_11 > cse_tmp_3, cse_tmp_11, cse_tmp_3)))) + 1) + cse_tmp_1 * (my_piecewise3(1 - z <= zeta_threshold, cse_tmp_2, xc_expm1((4 // 3) * xc_log1p(my_piecewise3(cse_tmp_4 > cse_tmp_3, cse_tmp_4, cse_tmp_3)))) + my_piecewise3(z + 1 <= zeta_threshold, cse_tmp_2, xc_expm1((4 // 3) * xc_log1p(my_piecewise3(z > cse_tmp_3, z, cse_tmp_3))))) * (0.618818029790618 * atan(1.17168527770897 / (cse_tmp_6 + 20.1231)) + 0.01554535 * xc_log1p(-cse_tmp_7 * cse_tmp_9) + 0.00266731000727332 * xc_log1p(cse_tmp_9 * (-cse_tmp_8 + (cse_tmp_5 + 0.743294) ^ 2)))
    end
end
export lda_c_vwn_rpa_energy

const lda_c_vwn_rpa_defaults = (zeta_threshold = 2.220446049250313e-16,)
const lda_c_vwn_rpa_required = ()

function lda_c_vwn_rpa(rho; params = NamedTuple())
    p = resolve_params(lda_c_vwn_rpa_defaults, lda_c_vwn_rpa_required, params)
    v = lda_variables(rho, Val(3))
    return lda_c_vwn_rpa_energy(v.rs, v.z, p.zeta_threshold)
end

function lda_c_vwn_rpa(na, nb; params = NamedTuple())
    p = resolve_params(lda_c_vwn_rpa_defaults, lda_c_vwn_rpa_required, params)
    v = lda_variables(na, nb, Val(3))
    return lda_c_vwn_rpa_energy(v.rs, v.z, p.zeta_threshold)
end

export lda_c_vwn_rpa, lda_c_vwn_rpa_defaults, lda_c_vwn_rpa_required
