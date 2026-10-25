# Auto-generated from the Libxc sources
# python/lda_exc/lda_c_vwn_3.py -- do not edit by hand.
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
# args: rs, z, zeta_threshold
const lda_c_vwn_3_energy = function (rs, z, zeta_threshold)
    @inbounds begin
        cse_tmp_0 = 1.2599210498948732
        cse_tmp_1 = z + 1
        cse_tmp_2 = NaNMath.pow(zeta_threshold, 1.3333333333333333) - 1
        cse_tmp_3 = zeta_threshold - 1
        cse_tmp_4 = 1 - z
        cse_tmp_5 = -z
        cse_tmp_6 = NaNMath.sqrt(rs)
        cse_tmp_7 = 7.06042 * cse_tmp_6 + 18.0578
        cse_tmp_8 = cse_tmp_7 + rs
        cse_tmp_9 = cse_tmp_8 ^ (-1)
        cse_tmp_10 = 2 * cse_tmp_6
        cse_tmp_11 = 3.72744 * cse_tmp_6 + 12.9352
        cse_tmp_12 = cse_tmp_11 + rs
        cse_tmp_13 = cse_tmp_12 ^ (-1)
        cse_tmp_14 = 0.038783294878113 * atan(6.15199081975908 / (cse_tmp_10 + 3.72744)) + 0.0310907 * xc_log1p(-cse_tmp_11 * cse_tmp_13) + 0.000969022771154437 * xc_log1p(cse_tmp_13 * (-cse_tmp_12 + (cse_tmp_6 + 0.10498) ^ 2))
        cse_tmp_15 = (my_piecewise3(cse_tmp_1 <= zeta_threshold, cse_tmp_2, xc_expm1((4 // 3) * xc_log1p(my_piecewise3(z > cse_tmp_3, z, cse_tmp_3)))) + my_piecewise3(cse_tmp_4 <= zeta_threshold, cse_tmp_2, xc_expm1((4 // 3) * xc_log1p(my_piecewise3(cse_tmp_5 > cse_tmp_3, cse_tmp_5, cse_tmp_3))))) * (-cse_tmp_14 + 0.0524913931697809 * atan(4.73092690956011 / (cse_tmp_10 + 7.06042)) + 0.01554535 * xc_log1p(-cse_tmp_7 * cse_tmp_9) + 0.00224786709554261 * xc_log1p(cse_tmp_9 * (-cse_tmp_8 + (cse_tmp_6 + 0.325) ^ 2))) / (2 * cse_tmp_0 - 2)
        cse_tmp_16 = 20.1231 * cse_tmp_6 + 101.578
        cse_tmp_17 = cse_tmp_16 + rs
        cse_tmp_18 = cse_tmp_17 ^ (-1)
        cse_tmp_19 = 13.072 * cse_tmp_6 + 42.7198
        cse_tmp_20 = cse_tmp_19 + rs
        cse_tmp_21 = cse_tmp_20 ^ (-1)
        cse_tmp_22 = 1.06835 * cse_tmp_6 + 11.4813
        cse_tmp_23 = cse_tmp_22 + rs
        cse_tmp_24 = cse_tmp_23 ^ (-1)
        -cse_tmp_1 * cse_tmp_15 * cse_tmp_4 * ((9 // 4) * cse_tmp_0 - 9 // 4) * (z ^ 2 + 1) * (0.323238369060551 * atan(6.69207204664594 / (cse_tmp_10 + 1.06835)) + xc_log1p(-cse_tmp_22 * cse_tmp_24) + 0.0216087103608983 * xc_log1p(cse_tmp_24 * (-cse_tmp_23 + (cse_tmp_6 + 0.228344) ^ 2))) / (6 * 9.869604401089358 * (-20.5219729377052 * atan(0.0448998886415768 / (cse_tmp_10 + 13.072)) + 0.618818029790618 * atan(1.17168527770897 / (cse_tmp_10 + 20.1231)) + 0.01554535 * xc_log1p(-cse_tmp_16 * cse_tmp_18) + 0.00266731000727332 * xc_log1p(cse_tmp_18 * (-cse_tmp_17 + (cse_tmp_6 + 0.743294) ^ 2)) - 0.0310907 * xc_log1p(-cse_tmp_19 * cse_tmp_21) - 0.00443137376774954 * xc_log1p(cse_tmp_21 * (-cse_tmp_20 + (cse_tmp_6 + 0.409286) ^ 2)))) + cse_tmp_14 + cse_tmp_15 * z ^ 4
    end
end
export lda_c_vwn_3_energy

const lda_c_vwn_3_defaults = (zeta_threshold = 2.220446049250313e-16,)
const lda_c_vwn_3_required = ()

function lda_c_vwn_3(rho; params = NamedTuple())
    p = resolve_params(lda_c_vwn_3_defaults, lda_c_vwn_3_required, params)
    v = lda_variables(rho, Val(3))
    return lda_c_vwn_3_energy(v.rs, v.z, p.zeta_threshold)
end

function lda_c_vwn_3(na, nb; params = NamedTuple())
    p = resolve_params(lda_c_vwn_3_defaults, lda_c_vwn_3_required, params)
    v = lda_variables(na, nb, Val(3))
    return lda_c_vwn_3_energy(v.rs, v.z, p.zeta_threshold)
end

export lda_c_vwn_3, lda_c_vwn_3_defaults, lda_c_vwn_3_required
