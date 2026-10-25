# Auto-generated from the Libxc sources
# python/lda_exc/lda_c_w20.py -- do not edit by hand.
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
# args: rs, z, zeta_threshold
const lda_c_w20_energy = function (rs, z, zeta_threshold)
    @inbounds begin
        cse_tmp_0 = 1.2599210498948732
        cse_tmp_1 = NaNMath.pow(zeta_threshold, 1.3333333333333333)
        cse_tmp_2 = cse_tmp_1 - 1
        cse_tmp_3 = zeta_threshold - 1
        cse_tmp_4 = -z
        cse_tmp_5 = rs ^ 2
        cse_tmp_6 = cse_tmp_5 / 10000
        cse_tmp_7 = -cse_tmp_6
        cse_tmp_8 = xc_expm1(cse_tmp_7)
        cse_tmp_9 = 9.869604401089358
        cse_tmp_10 = NaNMath.log(2)
        cse_tmp_11 = 1 - cse_tmp_10
        cse_tmp_12 = cse_tmp_11 ^ (-1)
        cse_tmp_13 = cse_tmp_12 * cse_tmp_9
        cse_tmp_14 = cse_tmp_13 * cse_tmp_8 / NaNMath.pow(rs, 1.5)
        cse_tmp_15 = rs ^ (-1)
        cse_tmp_16 = cse_tmp_9 ^ (-1)
        cse_tmp_17 = -cse_tmp_10 / 6 + 0.901542677369696 * cse_tmp_16
        cse_tmp_18 = 4 * cse_tmp_13
        cse_tmp_19 = exp(-cse_tmp_18 * (-cse_tmp_17 - 0.049917) - cse_tmp_6)
        cse_tmp_20 = 2 <= zeta_threshold
        cse_tmp_21 = 2.080083823051904 * cse_tmp_0 / 2.1450293971110255
        cse_tmp_22 = cse_tmp_5 ^ (-1)
        cse_tmp_23 = NaNMath.pow(zeta_threshold, 1.6666666666666667)
        cse_tmp_24 = cse_tmp_23 - 1
        cse_tmp_25 = 1.5874010519681994 * 1.4422495703074083
        cse_tmp_26 = 21.170591578193033 * cse_tmp_12 * cse_tmp_25 * cse_tmp_8
        cse_tmp_27 = cse_tmp_11 * cse_tmp_16
        cse_tmp_28 = 12 * cse_tmp_10
        cse_tmp_29 = exp(cse_tmp_7)
        cse_tmp_30 = cse_tmp_29 * rs / (cse_tmp_29 + 10 * NaNMath.pow(rs, 1.25))
        cse_tmp_31 = xc_log1p(cse_tmp_15) / 45.41154128945516
        cse_tmp_32 = 2 * cse_tmp_13
        cse_tmp_33 = exp(-cse_tmp_32 * (-cse_tmp_17 - 0.0711) - cse_tmp_6)
        cse_tmp_34 = 1 <= zeta_threshold
        cse_tmp_35 = -cse_tmp_27 * xc_log1p(3.0 * cse_tmp_14 + cse_tmp_15 * (cse_tmp_32 * cse_tmp_8 * ((3 // 8) * cse_tmp_21 * my_piecewise3(cse_tmp_34, cse_tmp_1, 1) - 0.9) + cse_tmp_33) + cse_tmp_22 * (-9 // 20 * cse_tmp_26 * (my_piecewise3(cse_tmp_34, cse_tmp_24, xc_expm1((5 // 3) * xc_log1p(my_piecewise3(0 > cse_tmp_3, 0, cse_tmp_3)))) + 1) + cse_tmp_33)) / 2 + cse_tmp_30 * (-cse_tmp_25 * cse_tmp_31 * (-cse_tmp_28 + (7 // 6) * cse_tmp_9 - 1) / 12 - 0.01)
        cse_tmp_35 + (my_piecewise3(1 - z <= zeta_threshold, cse_tmp_2, xc_expm1((4 // 3) * xc_log1p(my_piecewise3(cse_tmp_4 > cse_tmp_3, cse_tmp_4, cse_tmp_3)))) + my_piecewise3(z + 1 <= zeta_threshold, cse_tmp_2, xc_expm1((4 // 3) * xc_log1p(my_piecewise3(z > cse_tmp_3, z, cse_tmp_3))))) * (-cse_tmp_27 * xc_log1p(6.0 * cse_tmp_14 + cse_tmp_15 * (cse_tmp_18 * cse_tmp_8 * ((3 // 16) * cse_tmp_21 * (cse_tmp_1 + my_piecewise3(cse_tmp_20, cse_tmp_1, 2 * cse_tmp_0)) - 0.9) + cse_tmp_19) + cse_tmp_22 * (cse_tmp_19 - 9 // 10 * cse_tmp_26 * (cse_tmp_23 / 2 + my_piecewise3(cse_tmp_20, cse_tmp_24, xc_expm1((5 // 3) * xc_log1p(my_piecewise3(1 > cse_tmp_3, 1, cse_tmp_3)))) / 2 + 1 // 2))) / 4 - 1.8171205928321397 * cse_tmp_30 * cse_tmp_31 * (-cse_tmp_28 + (13 // 12) * cse_tmp_9 + 1 // 2) / 24 - cse_tmp_35) / (2 * cse_tmp_0 - 2)
    end
end
export lda_c_w20_energy

const lda_c_w20_defaults = (zeta_threshold = 2.220446049250313e-16,)
const lda_c_w20_required = ()

function lda_c_w20(rho; params = NamedTuple())
    p = resolve_params(lda_c_w20_defaults, lda_c_w20_required, params)
    v = lda_variables(rho, Val(3))
    return lda_c_w20_energy(v.rs, v.z, p.zeta_threshold)
end

function lda_c_w20(na, nb; params = NamedTuple())
    p = resolve_params(lda_c_w20_defaults, lda_c_w20_required, params)
    v = lda_variables(na, nb, Val(3))
    return lda_c_w20_energy(v.rs, v.z, p.zeta_threshold)
end

export lda_c_w20, lda_c_w20_defaults, lda_c_w20_required
