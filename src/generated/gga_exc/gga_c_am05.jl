# Auto-generated from the Libxc sources
# python/gga_exc/gga_c_am05.py -- do not edit by hand.
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
# args: rs, z, xt, xs0, xs1, params_a_alpha, params_a_gamma, zeta_threshold
const gga_c_am05_energy = function (rs, z, xt, xs0, xs1, params_a_alpha, params_a_gamma, zeta_threshold)
    @inbounds begin
        cse_tmp_0 = 1.8171205928321397 * params_a_alpha / (24 * 4.60115111447049)
        cse_tmp_1 = cse_tmp_0 * xs0 ^ 2
        cse_tmp_2 = z + 1 <= zeta_threshold
        cse_tmp_3 = zeta_threshold - 1
        cse_tmp_4 = xc_log1p(my_piecewise3(z > cse_tmp_3, z, cse_tmp_3))
        cse_tmp_5 = cse_tmp_0 * xs1 ^ 2
        cse_tmp_6 = 1 - z <= zeta_threshold
        cse_tmp_7 = -z
        cse_tmp_8 = xc_log1p(my_piecewise3(cse_tmp_7 > cse_tmp_3, cse_tmp_7, cse_tmp_3))
        cse_tmp_9 = NaNMath.sqrt(rs)
        cse_tmp_10 = NaNMath.pow(rs, 1.5)
        cse_tmp_11 = rs ^ 2
        cse_tmp_12 = (-0.01328816518 * rs - 0.0621814) * xc_log1p((0.10186556948 * cse_tmp_10 + 0.030651699316 * cse_tmp_11 + 0.47231125998 * cse_tmp_9 + 0.22308199064 * rs) ^ (-1))
        cse_tmp_13 = 0.5848223622634646207262238663759 * (-0.00375733525 * rs - 0.0337738) * xc_log1p((0.029729725188 * cse_tmp_10 + 0.016775784198 * cse_tmp_11 + 0.3497952466 * cse_tmp_9 + 0.12236585478 * rs) ^ (-1))
        cse_tmp_14 = NaNMath.pow(zeta_threshold, 1.3333333333333333) - 1
        cse_tmp_15 = (my_piecewise3(cse_tmp_2, cse_tmp_14, xc_expm1((4 // 3) * cse_tmp_4)) + my_piecewise3(cse_tmp_6, cse_tmp_14, xc_expm1((4 // 3) * cse_tmp_8))) / (-2 + 2 * 1.2599210498948732)
        ((cse_tmp_5 * params_a_gamma + 1) * (my_piecewise3(cse_tmp_6, cse_tmp_3, xc_expm1(cse_tmp_8)) / 2 + 1 // 2) / (cse_tmp_5 + 1) + (cse_tmp_1 * params_a_gamma + 1) * (my_piecewise3(cse_tmp_2, cse_tmp_3, xc_expm1(cse_tmp_4)) / 2 + 1 // 2) / (cse_tmp_1 + 1)) * (cse_tmp_12 - cse_tmp_13 * cse_tmp_15 + cse_tmp_15 * z ^ 4 * (-cse_tmp_12 + cse_tmp_13 + (-0.006388517036 * rs - 0.0310907) * xc_log1p((0.10465751434 * cse_tmp_10 + 0.019436972919 * cse_tmp_11 + 0.43896648423 * cse_tmp_9 + 0.19269083139 * rs) ^ (-1))))
    end
end
export gga_c_am05_energy

const gga_c_am05_defaults = (params_a_alpha = 2.804, params_a_gamma = 0.8098, zeta_threshold = 2.220446049250313e-16)
const gga_c_am05_required = ()

function gga_c_am05(rho, sigma; params = NamedTuple())
    p = resolve_params(gga_c_am05_defaults, gga_c_am05_required, params)
    v = gga_variables(rho, sigma, Val(3))
    return gga_c_am05_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.params_a_alpha, p.params_a_gamma, p.zeta_threshold)
end

function gga_c_am05(na, nb, gaa, gab, gbb; params = NamedTuple())
    p = resolve_params(gga_c_am05_defaults, gga_c_am05_required, params)
    v = gga_variables(na, nb, gaa, gab, gbb, Val(3))
    return gga_c_am05_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.params_a_alpha, p.params_a_gamma, p.zeta_threshold)
end

export gga_c_am05, gga_c_am05_defaults, gga_c_am05_required
