# Auto-generated from the Libxc sources
# python/gga_exc/gga_x_optx.py -- do not edit by hand.
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
# args: rs, z, xt, xs0, xs1, dens_threshold, params_a_a, params_a_b, params_a_gamma, zeta_threshold
const gga_x_optx_energy = function (rs, z, xt, xs0, xs1, dens_threshold, params_a_a, params_a_b, params_a_gamma, zeta_threshold)
    @inbounds begin
        cse_tmp_0 = z + 1
        cse_tmp_1 = (3 // 8) / (pi * rs ^ 3)
        cse_tmp_2 = params_a_gamma * xs0 ^ 2
        cse_tmp_3 = (cse_tmp_2 + 1) ^ (-1)
        cse_tmp_4 = cse_tmp_0 <= zeta_threshold
        cse_tmp_5 = zeta_threshold - 1
        cse_tmp_6 = 1 - z
        cse_tmp_7 = cse_tmp_6 <= zeta_threshold
        cse_tmp_8 = -cse_tmp_5
        cse_tmp_9 = my_piecewise5(cse_tmp_4, cse_tmp_5, cse_tmp_7, cse_tmp_8, z) + 1
        cse_tmp_10 = NaNMath.pow(zeta_threshold, 1.3333333333333333)
        cse_tmp_11 = 0.184639691595506 * 1.8171205928321397 / (1.4645918875615234 * rs)
        cse_tmp_12 = params_a_gamma * xs1 ^ 2
        cse_tmp_13 = (cse_tmp_12 + 1) ^ (-1)
        cse_tmp_14 = my_piecewise5(cse_tmp_7, cse_tmp_5, cse_tmp_4, cse_tmp_8, -z) + 1
        my_piecewise3(cse_tmp_0 * cse_tmp_1 <= dens_threshold, 0, -cse_tmp_11 * (params_a_a + params_a_b * my_piecewise3(cse_tmp_2 <= 1, cse_tmp_2 * cse_tmp_3, 1 - cse_tmp_3) ^ 2) * my_piecewise3(cse_tmp_9 <= zeta_threshold, cse_tmp_10, NaNMath.pow(cse_tmp_9, 1.3333333333333333))) + my_piecewise3(cse_tmp_1 * cse_tmp_6 <= dens_threshold, 0, -cse_tmp_11 * (params_a_a + params_a_b * my_piecewise3(cse_tmp_12 <= 1, cse_tmp_12 * cse_tmp_13, 1 - cse_tmp_13) ^ 2) * my_piecewise3(cse_tmp_14 <= zeta_threshold, cse_tmp_10, NaNMath.pow(cse_tmp_14, 1.3333333333333333)))
    end
end
export gga_x_optx_energy

const gga_x_optx_defaults = (dens_threshold = 1.0e-15, params_a_a = 1.05151, params_a_b = 1.5385818404305593, params_a_gamma = 0.006, zeta_threshold = 2.220446049250313e-16)
const gga_x_optx_required = ()

function gga_x_optx(rho, sigma; params = NamedTuple())
    p = resolve_params(gga_x_optx_defaults, gga_x_optx_required, params)
    v = gga_variables(rho, sigma, Val(3))
    return gga_x_optx_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.dens_threshold, p.params_a_a, p.params_a_b, p.params_a_gamma, p.zeta_threshold)
end

function gga_x_optx(na, nb, gaa, gab, gbb; params = NamedTuple())
    p = resolve_params(gga_x_optx_defaults, gga_x_optx_required, params)
    v = gga_variables(na, nb, gaa, gab, gbb, Val(3))
    return gga_x_optx_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.dens_threshold, p.params_a_a, p.params_a_b, p.params_a_gamma, p.zeta_threshold)
end

export gga_x_optx, gga_x_optx_defaults, gga_x_optx_required
