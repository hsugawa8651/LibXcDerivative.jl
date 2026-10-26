# Auto-generated from the Libxc sources
# python/mgga_exc/mgga_k_lk.py -- do not edit by hand.
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
# args: rs, z, xt, xs0, xs1, u0, u1, t0, t1, dens_threshold, params_a_kappa, zeta_threshold
const mgga_k_lk_energy = function (rs, z, xt, xs0, xs1, u0, u1, t0, t1, dens_threshold, params_a_kappa, zeta_threshold)
    @inbounds begin
        cse_tmp_0 = z + 1
        cse_tmp_1 = (3 // 8) / (pi * rs ^ 3)
        cse_tmp_2 = params_a_kappa ^ (-1)
        cse_tmp_3 = xs0 ^ 2
        cse_tmp_4 = 1.8171205928321397 / 4.60115111447049
        cse_tmp_5 = (5 // 648) * cse_tmp_4
        cse_tmp_6 = xs0 ^ 4
        cse_tmp_7 = 3.3019272488946267 / 21.170591578193033
        cse_tmp_8 = (25 // 419904) * cse_tmp_2 * cse_tmp_7
        cse_tmp_9 = cse_tmp_7 / 5832
        cse_tmp_10 = cse_tmp_7 / 17496
        cse_tmp_11 = cse_tmp_7 / 5184
        cse_tmp_12 = cse_tmp_10 * cse_tmp_6 - cse_tmp_11 * cse_tmp_3 * u0 + cse_tmp_9 * u0 ^ 2
        cse_tmp_13 = cse_tmp_2 * (cse_tmp_12 + cse_tmp_3 * cse_tmp_5 + cse_tmp_6 * cse_tmp_8)
        cse_tmp_14 = (cse_tmp_13 + 1) ^ (-1)
        cse_tmp_15 = (125 // 45349632) / (97.40909103400244 * params_a_kappa ^ 2)
        cse_tmp_16 = (5 // 324) * cse_tmp_2 * cse_tmp_4
        cse_tmp_17 = cse_tmp_2 * (cse_tmp_12 * cse_tmp_16 * cse_tmp_3 + cse_tmp_15 * xs0 ^ 6)
        cse_tmp_18 = (cse_tmp_17 + 1) ^ (-1)
        cse_tmp_19 = cse_tmp_0 <= zeta_threshold
        cse_tmp_20 = zeta_threshold - 1
        cse_tmp_21 = 1 - z
        cse_tmp_22 = cse_tmp_21 <= zeta_threshold
        cse_tmp_23 = -cse_tmp_20
        cse_tmp_24 = my_piecewise5(cse_tmp_19, cse_tmp_20, cse_tmp_22, cse_tmp_23, z)
        cse_tmp_25 = NaNMath.pow(zeta_threshold, 1.6666666666666667) - 1
        cse_tmp_26 = (9 // 80) * 2.2894284851066637 * 2.1450293971110255 / rs ^ 2
        cse_tmp_27 = xs1 ^ 2
        cse_tmp_28 = xs1 ^ 4
        cse_tmp_29 = cse_tmp_10 * cse_tmp_28 - cse_tmp_11 * cse_tmp_27 * u1 + cse_tmp_9 * u1 ^ 2
        cse_tmp_30 = cse_tmp_2 * (cse_tmp_27 * cse_tmp_5 + cse_tmp_28 * cse_tmp_8 + cse_tmp_29)
        cse_tmp_31 = (cse_tmp_30 + 1) ^ (-1)
        cse_tmp_32 = cse_tmp_2 * (cse_tmp_15 * xs1 ^ 6 + cse_tmp_16 * cse_tmp_27 * cse_tmp_29)
        cse_tmp_33 = (cse_tmp_32 + 1) ^ (-1)
        cse_tmp_34 = my_piecewise5(cse_tmp_22, cse_tmp_20, cse_tmp_19, cse_tmp_23, -z)
        my_piecewise3(cse_tmp_0 * cse_tmp_1 <= dens_threshold, 0, cse_tmp_26 * (params_a_kappa * (my_piecewise3(cse_tmp_13 <= 1, cse_tmp_13 * cse_tmp_14, 1 - cse_tmp_14) + my_piecewise3(cse_tmp_17 <= 1, cse_tmp_17 * cse_tmp_18, 1 - cse_tmp_18)) + 1) * (my_piecewise3(cse_tmp_24 + 1 <= zeta_threshold, cse_tmp_25, xc_expm1((5 // 3) * xc_log1p(my_piecewise3(cse_tmp_24 > cse_tmp_20, cse_tmp_24, cse_tmp_20)))) + 1)) + my_piecewise3(cse_tmp_1 * cse_tmp_21 <= dens_threshold, 0, cse_tmp_26 * (params_a_kappa * (my_piecewise3(cse_tmp_30 <= 1, cse_tmp_30 * cse_tmp_31, 1 - cse_tmp_31) + my_piecewise3(cse_tmp_32 <= 1, cse_tmp_32 * cse_tmp_33, 1 - cse_tmp_33)) + 1) * (my_piecewise3(cse_tmp_34 + 1 <= zeta_threshold, cse_tmp_25, xc_expm1((5 // 3) * xc_log1p(my_piecewise3(cse_tmp_34 > cse_tmp_20, cse_tmp_34, cse_tmp_20)))) + 1))
    end
end
export mgga_k_lk_energy

const mgga_k_lk_defaults = NamedTuple()
const mgga_k_lk_required = (:dens_threshold, :params_a_kappa, :zeta_threshold)

function mgga_k_lk(rho, sigma, lapl, tau; params = NamedTuple())
    p = resolve_params(mgga_k_lk_defaults, mgga_k_lk_required, params)
    v = mgga_variables(rho, sigma, lapl, tau, Val(3))
    return mgga_k_lk_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.dens_threshold, p.params_a_kappa, p.zeta_threshold)
end

function mgga_k_lk(na, nb, gaa, gab, gbb, la, lb, ta, tb; params = NamedTuple())
    p = resolve_params(mgga_k_lk_defaults, mgga_k_lk_required, params)
    v = mgga_variables(na, nb, gaa, gab, gbb, la, lb, ta, tb, Val(3))
    return mgga_k_lk_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.dens_threshold, p.params_a_kappa, p.zeta_threshold)
end

export mgga_k_lk, mgga_k_lk_defaults, mgga_k_lk_required

const mgga_k_l04_defaults = (dens_threshold = 1.0e-15, params_a_kappa = 0.402, zeta_threshold = 2.220446049250313e-16)
const mgga_k_l04_required = ()

function mgga_k_l04(rho, sigma, lapl, tau; params = NamedTuple())
    p = resolve_params(mgga_k_l04_defaults, mgga_k_l04_required, params)
    v = mgga_variables(rho, sigma, lapl, tau, Val(3))
    return mgga_k_lk_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.dens_threshold, p.params_a_kappa, p.zeta_threshold)
end

function mgga_k_l04(na, nb, gaa, gab, gbb, la, lb, ta, tb; params = NamedTuple())
    p = resolve_params(mgga_k_l04_defaults, mgga_k_l04_required, params)
    v = mgga_variables(na, nb, gaa, gab, gbb, la, lb, ta, tb, Val(3))
    return mgga_k_lk_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.dens_threshold, p.params_a_kappa, p.zeta_threshold)
end

export mgga_k_l04, mgga_k_l04_defaults, mgga_k_l04_required

const mgga_k_l06_defaults = (dens_threshold = 1.0e-15, params_a_kappa = 0.623, zeta_threshold = 2.220446049250313e-16)
const mgga_k_l06_required = ()

function mgga_k_l06(rho, sigma, lapl, tau; params = NamedTuple())
    p = resolve_params(mgga_k_l06_defaults, mgga_k_l06_required, params)
    v = mgga_variables(rho, sigma, lapl, tau, Val(3))
    return mgga_k_lk_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.dens_threshold, p.params_a_kappa, p.zeta_threshold)
end

function mgga_k_l06(na, nb, gaa, gab, gbb, la, lb, ta, tb; params = NamedTuple())
    p = resolve_params(mgga_k_l06_defaults, mgga_k_l06_required, params)
    v = mgga_variables(na, nb, gaa, gab, gbb, la, lb, ta, tb, Val(3))
    return mgga_k_lk_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.dens_threshold, p.params_a_kappa, p.zeta_threshold)
end

export mgga_k_l06, mgga_k_l06_defaults, mgga_k_l06_required
