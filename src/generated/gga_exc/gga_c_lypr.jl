# Auto-generated from the Libxc sources
# python/gga_exc/gga_c_lypr.py -- do not edit by hand.
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
# args: rs, z, xt, xs0, xs1, params_a_a, params_a_b, params_a_c, params_a_d, params_a_m1, params_a_m2, params_a_omega, zeta_threshold
const gga_c_lypr_energy = function (rs, z, xt, xs0, xs1, params_a_a, params_a_b, params_a_c, params_a_d, params_a_m1, params_a_m2, params_a_omega, zeta_threshold)
    @inbounds begin
        cse_tmp_0 = 3.3019272488946267 * rs
        cse_tmp_1 = 1.4645918875615234 * cse_tmp_0
        cse_tmp_2 = cse_tmp_1 / 3
        cse_tmp_3 = cse_tmp_2 * params_a_omega
        cse_tmp_4 = (cse_tmp_2 * params_a_d + 1) ^ (-1)
        cse_tmp_5 = z + 1
        cse_tmp_6 = 1 - z
        cse_tmp_7 = cse_tmp_5 * cse_tmp_6
        cse_tmp_8 = cse_tmp_4 * cse_tmp_7
        cse_tmp_9 = xt ^ 2
        cse_tmp_10 = z / 6
        cse_tmp_11 = xs0 ^ 2
        cse_tmp_12 = cse_tmp_5 <= zeta_threshold
        cse_tmp_13 = NaNMath.pow(zeta_threshold, 2.6666666666666665) - 1
        cse_tmp_14 = zeta_threshold - 1
        cse_tmp_15 = xc_log1p(my_piecewise3(z > cse_tmp_14, z, cse_tmp_14))
        cse_tmp_16 = my_piecewise3(cse_tmp_12, cse_tmp_13, xc_expm1((8 // 3) * cse_tmp_15))
        cse_tmp_17 = cse_tmp_16 + 1
        cse_tmp_18 = cse_tmp_11 * cse_tmp_17
        cse_tmp_19 = 1.2599210498948732
        cse_tmp_20 = cse_tmp_19 / 8
        cse_tmp_21 = xs1 ^ 2
        cse_tmp_22 = cse_tmp_6 <= zeta_threshold
        cse_tmp_23 = -z
        cse_tmp_24 = xc_log1p(my_piecewise3(cse_tmp_23 > cse_tmp_14, cse_tmp_23, cse_tmp_14))
        cse_tmp_25 = my_piecewise3(cse_tmp_22, cse_tmp_13, xc_expm1((8 // 3) * cse_tmp_24))
        cse_tmp_26 = cse_tmp_25 + 1
        cse_tmp_27 = cse_tmp_21 * cse_tmp_26
        cse_tmp_28 = cse_tmp_18 + cse_tmp_27
        cse_tmp_29 = params_a_b * exp(-cse_tmp_2 * params_a_c)
        cse_tmp_30 = cse_tmp_4 * params_a_d + params_a_c
        cse_tmp_31 = cse_tmp_1 * cse_tmp_30
        cse_tmp_32 = NaNMath.pow(zeta_threshold, 3.6666666666666665) - 1
        cse_tmp_33 = zeta_threshold ^ 2 - 1
        params_a_a * (cse_tmp_0 * cse_tmp_29 * cse_tmp_8 * params_a_m2 * params_a_omega * (cse_tmp_18 * cse_tmp_20 * (cse_tmp_10 + 7 // 6) - 7 // 48 * cse_tmp_19 * cse_tmp_28 + cse_tmp_20 * cse_tmp_27 * (7 // 6 - cse_tmp_10) + (7 // 6) * cse_tmp_9) * exp(-2 // 3 * 1.8171205928321397 * 2.1450293971110255 * params_a_m2 ^ 2 * params_a_omega ^ 2 * rs ^ 2) / (18 * 1.2102032422537643) + cse_tmp_29 * cse_tmp_4 * (cse_tmp_19 * cse_tmp_28 * cse_tmp_5 * cse_tmp_6 * (5 // 2 - cse_tmp_31 / 54) / 32 + cse_tmp_19 * cse_tmp_5 * cse_tmp_6 * (cse_tmp_11 * (my_piecewise3(cse_tmp_12, cse_tmp_32, xc_expm1((11 // 3) * cse_tmp_15)) + 1) + cse_tmp_21 * (my_piecewise3(cse_tmp_22, cse_tmp_32, xc_expm1((11 // 3) * cse_tmp_24)) + 1)) * (cse_tmp_2 * cse_tmp_30 - 11) / 576 - cse_tmp_20 * ((2 // 3) * cse_tmp_11 * cse_tmp_17 - cse_tmp_18 * (my_piecewise3(cse_tmp_22, cse_tmp_33, xc_expm1(2 * cse_tmp_24)) + 1) / 4 + (2 // 3) * cse_tmp_21 * cse_tmp_26 - cse_tmp_27 * (my_piecewise3(cse_tmp_12, cse_tmp_33, xc_expm1(2 * cse_tmp_15)) + 1) / 4) - 3 // 20 * 2.080083823051904 * 4.60115111447049 * cse_tmp_7 * (cse_tmp_16 + cse_tmp_25 + 2) - cse_tmp_9 * (cse_tmp_7 * (47 - 7 // 3 * cse_tmp_31) / 72 - 2 // 3)) * erfc(cse_tmp_3 * params_a_m2) - cse_tmp_8 * erfc(cse_tmp_3 * params_a_m1))
    end
end
export gga_c_lypr_energy

const gga_c_lypr_defaults = (params_a_a = 0.04918, params_a_b = 0.132, params_a_c = 0.2533, params_a_d = 0.349, params_a_m1 = 0.15283842794759825, params_a_m2 = 0.8733624454148472, params_a_omega = 0.33, zeta_threshold = 2.220446049250313e-16)
const gga_c_lypr_required = ()

function gga_c_lypr(rho, sigma; params = NamedTuple())
    p = resolve_params(gga_c_lypr_defaults, gga_c_lypr_required, params)
    v = gga_variables(rho, sigma, Val(3))
    return gga_c_lypr_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.params_a_a, p.params_a_b, p.params_a_c, p.params_a_d, p.params_a_m1, p.params_a_m2, p.params_a_omega, p.zeta_threshold)
end

function gga_c_lypr(na, nb, gaa, gab, gbb; params = NamedTuple())
    p = resolve_params(gga_c_lypr_defaults, gga_c_lypr_required, params)
    v = gga_variables(na, nb, gaa, gab, gbb, Val(3))
    return gga_c_lypr_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.params_a_a, p.params_a_b, p.params_a_c, p.params_a_d, p.params_a_m1, p.params_a_m2, p.params_a_omega, p.zeta_threshold)
end

export gga_c_lypr, gga_c_lypr_defaults, gga_c_lypr_required
