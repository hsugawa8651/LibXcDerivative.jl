# Auto-generated from the Libxc sources
# python/gga_exc/gga_x_rpbe.py -- do not edit by hand.
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
# args: rs, z, xt, xs0, xs1, dens_threshold, params_a_rpbe_kappa, params_a_rpbe_mu, zeta_threshold
const gga_x_rpbe_energy = function (rs, z, xt, xs0, xs1, dens_threshold, params_a_rpbe_kappa, params_a_rpbe_mu, zeta_threshold)
    @inbounds begin
        cse_tmp_0 = z + 1
        cse_tmp_1 = (3 // 8) / (pi * rs ^ 3)
        cse_tmp_2 = 1.8171205928321397
        cse_tmp_3 = cse_tmp_2 * params_a_rpbe_mu / (24 * 4.60115111447049 * params_a_rpbe_kappa)
        cse_tmp_4 = cse_tmp_0 <= zeta_threshold
        cse_tmp_5 = zeta_threshold - 1
        cse_tmp_6 = 1 - z
        cse_tmp_7 = cse_tmp_6 <= zeta_threshold
        cse_tmp_8 = -cse_tmp_5
        cse_tmp_9 = my_piecewise5(cse_tmp_4, cse_tmp_5, cse_tmp_7, cse_tmp_8, z) + 1
        cse_tmp_10 = NaNMath.pow(zeta_threshold, 1.3333333333333333)
        cse_tmp_11 = 0.184639691595506 * cse_tmp_2 / (1.4645918875615234 * rs)
        cse_tmp_12 = my_piecewise5(cse_tmp_7, cse_tmp_5, cse_tmp_4, cse_tmp_8, -z) + 1
        my_piecewise3(cse_tmp_0 * cse_tmp_1 <= dens_threshold, 0, -cse_tmp_11 * (-params_a_rpbe_kappa * xc_expm1(-cse_tmp_3 * xs0 ^ 2) + 1) * my_piecewise3(cse_tmp_9 <= zeta_threshold, cse_tmp_10, NaNMath.pow(cse_tmp_9, 1.3333333333333333))) + my_piecewise3(cse_tmp_1 * cse_tmp_6 <= dens_threshold, 0, -cse_tmp_11 * (-params_a_rpbe_kappa * xc_expm1(-cse_tmp_3 * xs1 ^ 2) + 1) * my_piecewise3(cse_tmp_12 <= zeta_threshold, cse_tmp_10, NaNMath.pow(cse_tmp_12, 1.3333333333333333)))
    end
end
export gga_x_rpbe_energy

const gga_x_rpbe_defaults = (dens_threshold = 1.0e-15, params_a_rpbe_kappa = 0.804, params_a_rpbe_mu = 0.2195149727645171, zeta_threshold = 2.220446049250313e-16)
const gga_x_rpbe_required = ()

function gga_x_rpbe(rho, sigma; params = NamedTuple())
    p = resolve_params(gga_x_rpbe_defaults, gga_x_rpbe_required, params)
    v = gga_variables(rho, sigma, Val(3))
    return gga_x_rpbe_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.dens_threshold, p.params_a_rpbe_kappa, p.params_a_rpbe_mu, p.zeta_threshold)
end

function gga_x_rpbe(na, nb, gaa, gab, gbb; params = NamedTuple())
    p = resolve_params(gga_x_rpbe_defaults, gga_x_rpbe_required, params)
    v = gga_variables(na, nb, gaa, gab, gbb, Val(3))
    return gga_x_rpbe_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.dens_threshold, p.params_a_rpbe_kappa, p.params_a_rpbe_mu, p.zeta_threshold)
end

export gga_x_rpbe, gga_x_rpbe_defaults, gga_x_rpbe_required
