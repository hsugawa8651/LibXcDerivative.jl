# Auto-generated from the Libxc sources
# python/gga_exc/gga_c_zvpbeint.py -- do not edit by hand.
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
# args: rs, z, xt, xs0, xs1, params_a_alpha, params_a_beta, params_a_omega, zeta_threshold
const gga_c_zvpbeint_energy = function (rs, z, xt, xs0, xs1, params_a_alpha, params_a_beta, params_a_omega, zeta_threshold)
    @inbounds begin
        cse_tmp_0 = 9.869604401089358
        cse_tmp_1 = 1 - NaNMath.log(2)
        cse_tmp_2 = z + 1 <= zeta_threshold
        cse_tmp_3 = NaNMath.pow(zeta_threshold, 0.6666666666666666) - 1
        cse_tmp_4 = zeta_threshold - 1
        cse_tmp_5 = xc_log1p(my_piecewise3(z > cse_tmp_4, z, cse_tmp_4))
        cse_tmp_6 = 1 - z <= zeta_threshold
        cse_tmp_7 = -z
        cse_tmp_8 = xc_log1p(my_piecewise3(cse_tmp_7 > cse_tmp_4, cse_tmp_7, cse_tmp_4))
        cse_tmp_9 = my_piecewise3(cse_tmp_2, cse_tmp_3, xc_expm1((2 // 3) * cse_tmp_5)) / 2 + my_piecewise3(cse_tmp_6, cse_tmp_3, xc_expm1((2 // 3) * cse_tmp_8)) / 2 + 1
        cse_tmp_10 = cse_tmp_9 ^ 3
        cse_tmp_11 = rs ^ 2
        cse_tmp_12 = cse_tmp_11 ^ (-1)
        cse_tmp_13 = xt ^ 2
        cse_tmp_14 = z ^ 2
        cse_tmp_15 = NaNMath.sqrt(rs)
        cse_tmp_16 = NaNMath.pow(rs, 1.5)
        cse_tmp_17 = (-0.01328816518 * rs - 0.0621814) * xc_log1p((0.030651699316 * cse_tmp_11 + 0.47231125998 * cse_tmp_15 + 0.10186556948 * cse_tmp_16 + 0.22308199064 * rs) ^ (-1))
        cse_tmp_18 = 0.5848223622634646207262238663759 * (-0.00375733525 * rs - 0.0337738) * xc_log1p((0.016775784198 * cse_tmp_11 + 0.3497952466 * cse_tmp_15 + 0.029729725188 * cse_tmp_16 + 0.12236585478 * rs) ^ (-1))
        cse_tmp_19 = 1.2599210498948732
        cse_tmp_20 = NaNMath.pow(zeta_threshold, 1.3333333333333333) - 1
        cse_tmp_21 = (my_piecewise3(cse_tmp_2, cse_tmp_20, xc_expm1((4 // 3) * cse_tmp_5)) + my_piecewise3(cse_tmp_6, cse_tmp_20, xc_expm1((4 // 3) * cse_tmp_8))) / (2 * cse_tmp_19 - 2)
        cse_tmp_22 = cse_tmp_17 - cse_tmp_18 * cse_tmp_21 + cse_tmp_21 * z ^ 4 * (-cse_tmp_17 + cse_tmp_18 + (-0.006388517036 * rs - 0.0310907) * xc_log1p((0.019436972919 * cse_tmp_11 + 0.43896648423 * cse_tmp_15 + 0.10465751434 * cse_tmp_16 + 0.19269083139 * rs) ^ (-1)))
        cse_tmp_23 = cse_tmp_0 / cse_tmp_1
        cse_tmp_24 = xc_expm1(-cse_tmp_22 * cse_tmp_23 / cse_tmp_10)
        cse_tmp_25 = cse_tmp_23 * params_a_beta / cse_tmp_24
        cse_tmp_26 = cse_tmp_25 * (1.5874010519681994 * cse_tmp_12 * cse_tmp_25 * xt ^ 4 / (1024 * cse_tmp_9 ^ 4) + cse_tmp_13 * cse_tmp_19 / (32 * cse_tmp_9 ^ 2 * rs))
        cse_tmp_27 = (cse_tmp_26 + 1) ^ (-1)
        cse_tmp_22 + cse_tmp_1 * cse_tmp_10 * exp(-1.7320508075688772 * cse_tmp_12 * cse_tmp_13 * params_a_alpha * Abs(cse_tmp_9) * Abs(xt) * NaNMath.pow(my_piecewise3(cse_tmp_14 > 1.0e-20, cse_tmp_14, 1.0e-20), params_a_omega / 2) / (128 * cse_tmp_9)) * xc_log1p(cse_tmp_24 * my_piecewise3(cse_tmp_26 <= 1, cse_tmp_26 * cse_tmp_27, 1 - cse_tmp_27)) / cse_tmp_0
    end
end
export gga_c_zvpbeint_energy

const gga_c_zvpbeint_defaults = (params_a_alpha = 1.0, params_a_beta = 0.052, params_a_omega = 4.5, zeta_threshold = 2.220446049250313e-16)
const gga_c_zvpbeint_required = ()

function gga_c_zvpbeint(rho, sigma; params = NamedTuple())
    p = resolve_params(gga_c_zvpbeint_defaults, gga_c_zvpbeint_required, params)
    v = gga_variables(rho, sigma, Val(3))
    return gga_c_zvpbeint_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.params_a_alpha, p.params_a_beta, p.params_a_omega, p.zeta_threshold)
end

function gga_c_zvpbeint(na, nb, gaa, gab, gbb; params = NamedTuple())
    p = resolve_params(gga_c_zvpbeint_defaults, gga_c_zvpbeint_required, params)
    v = gga_variables(na, nb, gaa, gab, gbb, Val(3))
    return gga_c_zvpbeint_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.params_a_alpha, p.params_a_beta, p.params_a_omega, p.zeta_threshold)
end

export gga_c_zvpbeint, gga_c_zvpbeint_defaults, gga_c_zvpbeint_required

const gga_c_zvpbesol_defaults = (params_a_alpha = 1.8, params_a_beta = 0.046, params_a_omega = 4.5, zeta_threshold = 2.220446049250313e-16)
const gga_c_zvpbesol_required = ()

function gga_c_zvpbesol(rho, sigma; params = NamedTuple())
    p = resolve_params(gga_c_zvpbesol_defaults, gga_c_zvpbesol_required, params)
    v = gga_variables(rho, sigma, Val(3))
    return gga_c_zvpbeint_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.params_a_alpha, p.params_a_beta, p.params_a_omega, p.zeta_threshold)
end

function gga_c_zvpbesol(na, nb, gaa, gab, gbb; params = NamedTuple())
    p = resolve_params(gga_c_zvpbesol_defaults, gga_c_zvpbesol_required, params)
    v = gga_variables(na, nb, gaa, gab, gbb, Val(3))
    return gga_c_zvpbeint_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.params_a_alpha, p.params_a_beta, p.params_a_omega, p.zeta_threshold)
end

export gga_c_zvpbesol, gga_c_zvpbesol_defaults, gga_c_zvpbesol_required
