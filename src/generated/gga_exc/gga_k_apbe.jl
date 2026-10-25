# Auto-generated from the Libxc sources
# python/gga_exc/gga_k_apbe.py -- do not edit by hand.
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
# args: rs, z, xt, xs0, xs1, dens_threshold, params_a_kappa, params_a_mu, zeta_threshold
const gga_k_apbe_energy = function (rs, z, xt, xs0, xs1, dens_threshold, params_a_kappa, params_a_mu, zeta_threshold)
    @inbounds begin
        cse_tmp_0 = z + 1
        cse_tmp_1 = (3 // 8) / (pi * rs ^ 3)
        cse_tmp_2 = 1.8171205928321397 * params_a_mu / (24 * 4.60115111447049)
        cse_tmp_3 = cse_tmp_2 * xs0 ^ 2
        cse_tmp_4 = cse_tmp_0 <= zeta_threshold
        cse_tmp_5 = zeta_threshold - 1
        cse_tmp_6 = 1 - z
        cse_tmp_7 = cse_tmp_6 <= zeta_threshold
        cse_tmp_8 = -cse_tmp_5
        cse_tmp_9 = my_piecewise5(cse_tmp_4, cse_tmp_5, cse_tmp_7, cse_tmp_8, z)
        cse_tmp_10 = NaNMath.pow(zeta_threshold, 1.6666666666666667) - 1
        cse_tmp_11 = (9 // 80) * 2.2894284851066637 * 2.1450293971110255 / rs ^ 2
        cse_tmp_12 = cse_tmp_2 * xs1 ^ 2
        cse_tmp_13 = my_piecewise5(cse_tmp_7, cse_tmp_5, cse_tmp_4, cse_tmp_8, -z)
        my_piecewise3(cse_tmp_0 * cse_tmp_1 <= dens_threshold, 0, cse_tmp_11 * (cse_tmp_3 * params_a_kappa / (cse_tmp_3 + params_a_kappa) + 1) * (my_piecewise3(cse_tmp_9 + 1 <= zeta_threshold, cse_tmp_10, xc_expm1((5 // 3) * xc_log1p(my_piecewise3(cse_tmp_9 > cse_tmp_5, cse_tmp_9, cse_tmp_5)))) + 1)) + my_piecewise3(cse_tmp_1 * cse_tmp_6 <= dens_threshold, 0, cse_tmp_11 * (cse_tmp_12 * params_a_kappa / (cse_tmp_12 + params_a_kappa) + 1) * (my_piecewise3(cse_tmp_13 + 1 <= zeta_threshold, cse_tmp_10, xc_expm1((5 // 3) * xc_log1p(my_piecewise3(cse_tmp_13 > cse_tmp_5, cse_tmp_13, cse_tmp_5)))) + 1))
    end
end
export gga_k_apbe_energy

const gga_k_apbe_defaults = (dens_threshold = 1.0e-15, params_a_kappa = 0.804, params_a_mu = 0.23889, zeta_threshold = 2.220446049250313e-16)
const gga_k_apbe_required = ()

function gga_k_apbe(rho, sigma; params = NamedTuple())
    p = resolve_params(gga_k_apbe_defaults, gga_k_apbe_required, params)
    v = gga_variables(rho, sigma, Val(3))
    return gga_k_apbe_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.dens_threshold, p.params_a_kappa, p.params_a_mu, p.zeta_threshold)
end

function gga_k_apbe(na, nb, gaa, gab, gbb; params = NamedTuple())
    p = resolve_params(gga_k_apbe_defaults, gga_k_apbe_required, params)
    v = gga_variables(na, nb, gaa, gab, gbb, Val(3))
    return gga_k_apbe_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.dens_threshold, p.params_a_kappa, p.params_a_mu, p.zeta_threshold)
end

export gga_k_apbe, gga_k_apbe_defaults, gga_k_apbe_required

const gga_k_revapbe_defaults = (dens_threshold = 1.0e-15, params_a_kappa = 1.245, params_a_mu = 0.23889, zeta_threshold = 2.220446049250313e-16)
const gga_k_revapbe_required = ()

function gga_k_revapbe(rho, sigma; params = NamedTuple())
    p = resolve_params(gga_k_revapbe_defaults, gga_k_revapbe_required, params)
    v = gga_variables(rho, sigma, Val(3))
    return gga_k_apbe_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.dens_threshold, p.params_a_kappa, p.params_a_mu, p.zeta_threshold)
end

function gga_k_revapbe(na, nb, gaa, gab, gbb; params = NamedTuple())
    p = resolve_params(gga_k_revapbe_defaults, gga_k_revapbe_required, params)
    v = gga_variables(na, nb, gaa, gab, gbb, Val(3))
    return gga_k_apbe_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.dens_threshold, p.params_a_kappa, p.params_a_mu, p.zeta_threshold)
end

export gga_k_revapbe, gga_k_revapbe_defaults, gga_k_revapbe_required

const gga_k_tw1_defaults = (dens_threshold = 1.0e-15, params_a_kappa = 0.8209, params_a_mu = 0.2335, zeta_threshold = 2.220446049250313e-16)
const gga_k_tw1_required = ()

function gga_k_tw1(rho, sigma; params = NamedTuple())
    p = resolve_params(gga_k_tw1_defaults, gga_k_tw1_required, params)
    v = gga_variables(rho, sigma, Val(3))
    return gga_k_apbe_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.dens_threshold, p.params_a_kappa, p.params_a_mu, p.zeta_threshold)
end

function gga_k_tw1(na, nb, gaa, gab, gbb; params = NamedTuple())
    p = resolve_params(gga_k_tw1_defaults, gga_k_tw1_required, params)
    v = gga_variables(na, nb, gaa, gab, gbb, Val(3))
    return gga_k_apbe_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.dens_threshold, p.params_a_kappa, p.params_a_mu, p.zeta_threshold)
end

export gga_k_tw1, gga_k_tw1_defaults, gga_k_tw1_required

const gga_k_tw2_defaults = (dens_threshold = 1.0e-15, params_a_kappa = 0.6774, params_a_mu = 0.2371, zeta_threshold = 2.220446049250313e-16)
const gga_k_tw2_required = ()

function gga_k_tw2(rho, sigma; params = NamedTuple())
    p = resolve_params(gga_k_tw2_defaults, gga_k_tw2_required, params)
    v = gga_variables(rho, sigma, Val(3))
    return gga_k_apbe_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.dens_threshold, p.params_a_kappa, p.params_a_mu, p.zeta_threshold)
end

function gga_k_tw2(na, nb, gaa, gab, gbb; params = NamedTuple())
    p = resolve_params(gga_k_tw2_defaults, gga_k_tw2_required, params)
    v = gga_variables(na, nb, gaa, gab, gbb, Val(3))
    return gga_k_apbe_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.dens_threshold, p.params_a_kappa, p.params_a_mu, p.zeta_threshold)
end

export gga_k_tw2, gga_k_tw2_defaults, gga_k_tw2_required

const gga_k_tw3_defaults = (dens_threshold = 1.0e-15, params_a_kappa = 0.8438, params_a_mu = 0.2319, zeta_threshold = 2.220446049250313e-16)
const gga_k_tw3_required = ()

function gga_k_tw3(rho, sigma; params = NamedTuple())
    p = resolve_params(gga_k_tw3_defaults, gga_k_tw3_required, params)
    v = gga_variables(rho, sigma, Val(3))
    return gga_k_apbe_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.dens_threshold, p.params_a_kappa, p.params_a_mu, p.zeta_threshold)
end

function gga_k_tw3(na, nb, gaa, gab, gbb; params = NamedTuple())
    p = resolve_params(gga_k_tw3_defaults, gga_k_tw3_required, params)
    v = gga_variables(na, nb, gaa, gab, gbb, Val(3))
    return gga_k_apbe_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.dens_threshold, p.params_a_kappa, p.params_a_mu, p.zeta_threshold)
end

export gga_k_tw3, gga_k_tw3_defaults, gga_k_tw3_required

const gga_k_tw4_defaults = (dens_threshold = 1.0e-15, params_a_kappa = 0.8589, params_a_mu = 0.2309, zeta_threshold = 2.220446049250313e-16)
const gga_k_tw4_required = ()

function gga_k_tw4(rho, sigma; params = NamedTuple())
    p = resolve_params(gga_k_tw4_defaults, gga_k_tw4_required, params)
    v = gga_variables(rho, sigma, Val(3))
    return gga_k_apbe_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.dens_threshold, p.params_a_kappa, p.params_a_mu, p.zeta_threshold)
end

function gga_k_tw4(na, nb, gaa, gab, gbb; params = NamedTuple())
    p = resolve_params(gga_k_tw4_defaults, gga_k_tw4_required, params)
    v = gga_variables(na, nb, gaa, gab, gbb, Val(3))
    return gga_k_apbe_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.dens_threshold, p.params_a_kappa, p.params_a_mu, p.zeta_threshold)
end

export gga_k_tw4, gga_k_tw4_defaults, gga_k_tw4_required
