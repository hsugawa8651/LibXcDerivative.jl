# Auto-generated from the Libxc sources
# python/gga_exc/gga_k_apbeint.py -- do not edit by hand.
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
# args: rs, z, xt, xs0, xs1, dens_threshold, params_a_alpha, params_a_kappa, params_a_muGE, params_a_muPBE, zeta_threshold
const gga_k_apbeint_energy = function (rs, z, xt, xs0, xs1, dens_threshold, params_a_alpha, params_a_kappa, params_a_muGE, params_a_muPBE, zeta_threshold)
    @inbounds begin
        cse_tmp_0 = z + 1
        cse_tmp_1 = (3 // 8) / (pi * rs ^ 3)
        cse_tmp_2 = 1.8171205928321397 / (24 * 4.60115111447049)
        cse_tmp_3 = cse_tmp_2 * xs0 ^ 2
        cse_tmp_4 = cse_tmp_3 * params_a_alpha
        cse_tmp_5 = -params_a_muGE + params_a_muPBE
        cse_tmp_6 = cse_tmp_3 * (cse_tmp_4 * cse_tmp_5 / (cse_tmp_4 + 1) + params_a_muGE)
        cse_tmp_7 = cse_tmp_0 <= zeta_threshold
        cse_tmp_8 = zeta_threshold - 1
        cse_tmp_9 = 1 - z
        cse_tmp_10 = cse_tmp_9 <= zeta_threshold
        cse_tmp_11 = -cse_tmp_8
        cse_tmp_12 = my_piecewise5(cse_tmp_7, cse_tmp_8, cse_tmp_10, cse_tmp_11, z)
        cse_tmp_13 = NaNMath.pow(zeta_threshold, 1.6666666666666667) - 1
        cse_tmp_14 = (9 // 80) * 2.2894284851066637 * 2.1450293971110255 / rs ^ 2
        cse_tmp_15 = cse_tmp_2 * xs1 ^ 2
        cse_tmp_16 = cse_tmp_15 * params_a_alpha
        cse_tmp_17 = cse_tmp_15 * (cse_tmp_16 * cse_tmp_5 / (cse_tmp_16 + 1) + params_a_muGE)
        cse_tmp_18 = my_piecewise5(cse_tmp_10, cse_tmp_8, cse_tmp_7, cse_tmp_11, -z)
        my_piecewise3(cse_tmp_0 * cse_tmp_1 <= dens_threshold, 0, cse_tmp_14 * (cse_tmp_6 * params_a_kappa / (cse_tmp_6 + params_a_kappa) + 1) * (my_piecewise3(cse_tmp_12 + 1 <= zeta_threshold, cse_tmp_13, xc_expm1((5 // 3) * xc_log1p(my_piecewise3(cse_tmp_12 > cse_tmp_8, cse_tmp_12, cse_tmp_8)))) + 1)) + my_piecewise3(cse_tmp_1 * cse_tmp_9 <= dens_threshold, 0, cse_tmp_14 * (cse_tmp_17 * params_a_kappa / (cse_tmp_17 + params_a_kappa) + 1) * (my_piecewise3(cse_tmp_18 + 1 <= zeta_threshold, cse_tmp_13, xc_expm1((5 // 3) * xc_log1p(my_piecewise3(cse_tmp_18 > cse_tmp_8, cse_tmp_18, cse_tmp_8)))) + 1))
    end
end
export gga_k_apbeint_energy

const gga_k_apbeint_defaults = (dens_threshold = 1.0e-15, params_a_alpha = 1.6666666666666667, params_a_kappa = 0.804, params_a_muGE = 0.18518518518518517, params_a_muPBE = 0.23899, zeta_threshold = 2.220446049250313e-16)
const gga_k_apbeint_required = ()

function gga_k_apbeint(rho, sigma; params = NamedTuple())
    p = resolve_params(gga_k_apbeint_defaults, gga_k_apbeint_required, params)
    v = gga_variables(rho, sigma, Val(3))
    return gga_k_apbeint_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.dens_threshold, p.params_a_alpha, p.params_a_kappa, p.params_a_muGE, p.params_a_muPBE, p.zeta_threshold)
end

function gga_k_apbeint(na, nb, gaa, gab, gbb; params = NamedTuple())
    p = resolve_params(gga_k_apbeint_defaults, gga_k_apbeint_required, params)
    v = gga_variables(na, nb, gaa, gab, gbb, Val(3))
    return gga_k_apbeint_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.dens_threshold, p.params_a_alpha, p.params_a_kappa, p.params_a_muGE, p.params_a_muPBE, p.zeta_threshold)
end

export gga_k_apbeint, gga_k_apbeint_defaults, gga_k_apbeint_required

const gga_k_revapbeint_defaults = (dens_threshold = 1.0e-15, params_a_alpha = 1.6666666666666667, params_a_kappa = 1.245, params_a_muGE = 0.18518518518518517, params_a_muPBE = 0.23899, zeta_threshold = 2.220446049250313e-16)
const gga_k_revapbeint_required = ()

function gga_k_revapbeint(rho, sigma; params = NamedTuple())
    p = resolve_params(gga_k_revapbeint_defaults, gga_k_revapbeint_required, params)
    v = gga_variables(rho, sigma, Val(3))
    return gga_k_apbeint_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.dens_threshold, p.params_a_alpha, p.params_a_kappa, p.params_a_muGE, p.params_a_muPBE, p.zeta_threshold)
end

function gga_k_revapbeint(na, nb, gaa, gab, gbb; params = NamedTuple())
    p = resolve_params(gga_k_revapbeint_defaults, gga_k_revapbeint_required, params)
    v = gga_variables(na, nb, gaa, gab, gbb, Val(3))
    return gga_k_apbeint_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.dens_threshold, p.params_a_alpha, p.params_a_kappa, p.params_a_muGE, p.params_a_muPBE, p.zeta_threshold)
end

export gga_k_revapbeint, gga_k_revapbeint_defaults, gga_k_revapbeint_required
