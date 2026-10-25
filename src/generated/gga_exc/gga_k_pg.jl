# Auto-generated from the Libxc sources
# python/gga_exc/gga_k_pg.py -- do not edit by hand.
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
# args: rs, z, xt, xs0, xs1, dens_threshold, params_a_pg_mu, zeta_threshold
const gga_k_pg_energy = function (rs, z, xt, xs0, xs1, dens_threshold, params_a_pg_mu, zeta_threshold)
    @inbounds begin
        cse_tmp_0 = z + 1
        cse_tmp_1 = (3 // 8) / (pi * rs ^ 3)
        cse_tmp_2 = cse_tmp_0 <= zeta_threshold
        cse_tmp_3 = zeta_threshold - 1
        cse_tmp_4 = 1 - z
        cse_tmp_5 = cse_tmp_4 <= zeta_threshold
        cse_tmp_6 = -cse_tmp_3
        cse_tmp_7 = my_piecewise5(cse_tmp_2, cse_tmp_3, cse_tmp_5, cse_tmp_6, z)
        cse_tmp_8 = NaNMath.pow(zeta_threshold, 1.6666666666666667) - 1
        cse_tmp_9 = xs0 ^ 2
        cse_tmp_10 = 1.8171205928321397 / 4.60115111447049
        cse_tmp_11 = (5 // 72) * cse_tmp_10
        cse_tmp_12 = cse_tmp_10 * params_a_pg_mu / 24
        cse_tmp_13 = (9 // 80) * 2.2894284851066637 * 2.1450293971110255 / rs ^ 2
        cse_tmp_14 = my_piecewise5(cse_tmp_5, cse_tmp_3, cse_tmp_2, cse_tmp_6, -z)
        cse_tmp_15 = xs1 ^ 2
        my_piecewise3(cse_tmp_0 * cse_tmp_1 <= dens_threshold, 0, cse_tmp_13 * (cse_tmp_11 * cse_tmp_9 + exp(-cse_tmp_12 * cse_tmp_9)) * (my_piecewise3(cse_tmp_7 + 1 <= zeta_threshold, cse_tmp_8, xc_expm1((5 // 3) * xc_log1p(my_piecewise3(cse_tmp_7 > cse_tmp_3, cse_tmp_7, cse_tmp_3)))) + 1)) + my_piecewise3(cse_tmp_1 * cse_tmp_4 <= dens_threshold, 0, cse_tmp_13 * (cse_tmp_11 * cse_tmp_15 + exp(-cse_tmp_12 * cse_tmp_15)) * (my_piecewise3(cse_tmp_14 + 1 <= zeta_threshold, cse_tmp_8, xc_expm1((5 // 3) * xc_log1p(my_piecewise3(cse_tmp_14 > cse_tmp_3, cse_tmp_14, cse_tmp_3)))) + 1))
    end
end
export gga_k_pg_energy

const gga_k_pg_defaults = NamedTuple()
const gga_k_pg_required = (:dens_threshold, :params_a_pg_mu, :zeta_threshold)

function gga_k_pg(rho, sigma; params = NamedTuple())
    p = resolve_params(gga_k_pg_defaults, gga_k_pg_required, params)
    v = gga_variables(rho, sigma, Val(3))
    return gga_k_pg_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.dens_threshold, p.params_a_pg_mu, p.zeta_threshold)
end

function gga_k_pg(na, nb, gaa, gab, gbb; params = NamedTuple())
    p = resolve_params(gga_k_pg_defaults, gga_k_pg_required, params)
    v = gga_variables(na, nb, gaa, gab, gbb, Val(3))
    return gga_k_pg_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.dens_threshold, p.params_a_pg_mu, p.zeta_threshold)
end

export gga_k_pg, gga_k_pg_defaults, gga_k_pg_required

const gga_k_pg1_defaults = (dens_threshold = 1.0e-15, params_a_pg_mu = 1.0, zeta_threshold = 2.220446049250313e-16)
const gga_k_pg1_required = ()

function gga_k_pg1(rho, sigma; params = NamedTuple())
    p = resolve_params(gga_k_pg1_defaults, gga_k_pg1_required, params)
    v = gga_variables(rho, sigma, Val(3))
    return gga_k_pg_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.dens_threshold, p.params_a_pg_mu, p.zeta_threshold)
end

function gga_k_pg1(na, nb, gaa, gab, gbb; params = NamedTuple())
    p = resolve_params(gga_k_pg1_defaults, gga_k_pg1_required, params)
    v = gga_variables(na, nb, gaa, gab, gbb, Val(3))
    return gga_k_pg_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.dens_threshold, p.params_a_pg_mu, p.zeta_threshold)
end

export gga_k_pg1, gga_k_pg1_defaults, gga_k_pg1_required
