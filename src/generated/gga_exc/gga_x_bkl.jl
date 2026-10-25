# Auto-generated from the Libxc sources
# python/gga_exc/gga_x_bkl.py -- do not edit by hand.
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
# args: rs, z, xt, xs0, xs1, dens_threshold, params_a_alpha, params_a_beta, params_a_gamma, params_a_kappa, params_a_mu1, zeta_threshold
const gga_x_bkl_energy = function (rs, z, xt, xs0, xs1, dens_threshold, params_a_alpha, params_a_beta, params_a_gamma, params_a_kappa, params_a_mu1, zeta_threshold)
    @inbounds begin
        cse_tmp_0 = z + 1
        cse_tmp_1 = (3 // 8) / (pi * rs ^ 3)
        cse_tmp_2 = 1.8171205928321397
        cse_tmp_3 = cse_tmp_2 * params_a_mu1 / (24 * 4.60115111447049)
        cse_tmp_4 = cse_tmp_3 * xs0 ^ 2
        cse_tmp_5 = params_a_gamma * params_a_kappa
        cse_tmp_6 = cse_tmp_0 <= zeta_threshold
        cse_tmp_7 = zeta_threshold - 1
        cse_tmp_8 = 1 - z
        cse_tmp_9 = cse_tmp_8 <= zeta_threshold
        cse_tmp_10 = -cse_tmp_7
        cse_tmp_11 = my_piecewise5(cse_tmp_6, cse_tmp_7, cse_tmp_9, cse_tmp_10, z) + 1
        cse_tmp_12 = NaNMath.pow(zeta_threshold, 1.3333333333333333)
        cse_tmp_13 = 0.184639691595506 * cse_tmp_2 / (1.4645918875615234 * rs)
        cse_tmp_14 = cse_tmp_3 * xs1 ^ 2
        cse_tmp_15 = my_piecewise5(cse_tmp_9, cse_tmp_7, cse_tmp_6, cse_tmp_10, -z) + 1
        my_piecewise3(cse_tmp_0 * cse_tmp_1 <= dens_threshold, 0, -cse_tmp_13 * (cse_tmp_5 * (-exp(-cse_tmp_4 * params_a_beta) + exp(-cse_tmp_4 * params_a_alpha)) + 1) * my_piecewise3(cse_tmp_11 <= zeta_threshold, cse_tmp_12, NaNMath.pow(cse_tmp_11, 1.3333333333333333))) + my_piecewise3(cse_tmp_1 * cse_tmp_8 <= dens_threshold, 0, -cse_tmp_13 * (cse_tmp_5 * (-exp(-cse_tmp_14 * params_a_beta) + exp(-cse_tmp_14 * params_a_alpha)) + 1) * my_piecewise3(cse_tmp_15 <= zeta_threshold, cse_tmp_12, NaNMath.pow(cse_tmp_15, 1.3333333333333333)))
    end
end
export gga_x_bkl_energy

const gga_x_bkl_defaults = NamedTuple()
const gga_x_bkl_required = (:dens_threshold, :params_a_alpha, :params_a_beta, :params_a_gamma, :params_a_kappa, :params_a_mu1, :zeta_threshold)

function gga_x_bkl(rho, sigma; params = NamedTuple())
    p = resolve_params(gga_x_bkl_defaults, gga_x_bkl_required, params)
    v = gga_variables(rho, sigma, Val(3))
    return gga_x_bkl_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.dens_threshold, p.params_a_alpha, p.params_a_beta, p.params_a_gamma, p.params_a_kappa, p.params_a_mu1, p.zeta_threshold)
end

function gga_x_bkl(na, nb, gaa, gab, gbb; params = NamedTuple())
    p = resolve_params(gga_x_bkl_defaults, gga_x_bkl_required, params)
    v = gga_variables(na, nb, gaa, gab, gbb, Val(3))
    return gga_x_bkl_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.dens_threshold, p.params_a_alpha, p.params_a_beta, p.params_a_gamma, p.params_a_kappa, p.params_a_mu1, p.zeta_threshold)
end

export gga_x_bkl, gga_x_bkl_defaults, gga_x_bkl_required

const gga_x_bkl1_defaults = (dens_threshold = 1.0e-15, params_a_alpha = 0.01, params_a_beta = 2.5, params_a_gamma = 0.98, params_a_kappa = 0.804, params_a_mu1 = 0.27302857309019535, zeta_threshold = 2.220446049250313e-16)
const gga_x_bkl1_required = ()

function gga_x_bkl1(rho, sigma; params = NamedTuple())
    p = resolve_params(gga_x_bkl1_defaults, gga_x_bkl1_required, params)
    v = gga_variables(rho, sigma, Val(3))
    return gga_x_bkl_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.dens_threshold, p.params_a_alpha, p.params_a_beta, p.params_a_gamma, p.params_a_kappa, p.params_a_mu1, p.zeta_threshold)
end

function gga_x_bkl1(na, nb, gaa, gab, gbb; params = NamedTuple())
    p = resolve_params(gga_x_bkl1_defaults, gga_x_bkl1_required, params)
    v = gga_variables(na, nb, gaa, gab, gbb, Val(3))
    return gga_x_bkl_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.dens_threshold, p.params_a_alpha, p.params_a_beta, p.params_a_gamma, p.params_a_kappa, p.params_a_mu1, p.zeta_threshold)
end

export gga_x_bkl1, gga_x_bkl1_defaults, gga_x_bkl1_required

const gga_x_bkl2_defaults = (dens_threshold = 1.0e-15, params_a_alpha = 0.01, params_a_beta = 0.5, params_a_gamma = 0.96, params_a_kappa = 0.804, params_a_mu1 = 0.27302857309019535, zeta_threshold = 2.220446049250313e-16)
const gga_x_bkl2_required = ()

function gga_x_bkl2(rho, sigma; params = NamedTuple())
    p = resolve_params(gga_x_bkl2_defaults, gga_x_bkl2_required, params)
    v = gga_variables(rho, sigma, Val(3))
    return gga_x_bkl_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.dens_threshold, p.params_a_alpha, p.params_a_beta, p.params_a_gamma, p.params_a_kappa, p.params_a_mu1, p.zeta_threshold)
end

function gga_x_bkl2(na, nb, gaa, gab, gbb; params = NamedTuple())
    p = resolve_params(gga_x_bkl2_defaults, gga_x_bkl2_required, params)
    v = gga_variables(na, nb, gaa, gab, gbb, Val(3))
    return gga_x_bkl_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.dens_threshold, p.params_a_alpha, p.params_a_beta, p.params_a_gamma, p.params_a_kappa, p.params_a_mu1, p.zeta_threshold)
end

export gga_x_bkl2, gga_x_bkl2_defaults, gga_x_bkl2_required
