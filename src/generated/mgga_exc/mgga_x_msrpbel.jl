# Auto-generated from the Libxc sources
# python/mgga_exc/mgga_x_msrpbel.py -- do not edit by hand.
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
# args: rs, z, xt, xs0, xs1, u0, u1, t0, t1, dens_threshold, params_a_b, params_a_c, params_a_eta, params_a_kappa, zeta_threshold
const mgga_x_msrpbel_energy = function (rs, z, xt, xs0, xs1, u0, u1, t0, t1, dens_threshold, params_a_b, params_a_c, params_a_eta, params_a_kappa, zeta_threshold)
    @inbounds begin
        cse_tmp_0 = z + 1
        cse_tmp_1 = (3 // 8) / (pi * rs ^ 3)
        cse_tmp_2 = xs0 ^ 2
        cse_tmp_3 = params_a_kappa ^ (-1)
        cse_tmp_4 = 1.8171205928321397
        cse_tmp_5 = 4.60115111447049
        cse_tmp_6 = (5 // 972) * cse_tmp_3 * cse_tmp_4 / cse_tmp_5
        cse_tmp_7 = -cse_tmp_2 * cse_tmp_6
        cse_tmp_8 = cse_tmp_2 / 8
        cse_tmp_9 = (3 // 10) * 3.3019272488946267 * cse_tmp_5
        cse_tmp_10 = (-cse_tmp_8 + t0) / (cse_tmp_8 * params_a_eta + cse_tmp_9)
        cse_tmp_11 = my_piecewise3(cse_tmp_10 > 1000000.0, 1000000.0, cse_tmp_10)
        cse_tmp_12 = my_piecewise3(-1000000.0 > cse_tmp_11, -1000000.0, cse_tmp_11)
        cse_tmp_13 = params_a_kappa * xc_expm1(-cse_tmp_3 * params_a_c)
        cse_tmp_14 = cse_tmp_0 <= zeta_threshold
        cse_tmp_15 = zeta_threshold - 1
        cse_tmp_16 = 1 - z
        cse_tmp_17 = cse_tmp_16 <= zeta_threshold
        cse_tmp_18 = -cse_tmp_15
        cse_tmp_19 = my_piecewise5(cse_tmp_14, cse_tmp_15, cse_tmp_17, cse_tmp_18, z) + 1
        cse_tmp_20 = NaNMath.pow(zeta_threshold, 1.3333333333333333)
        cse_tmp_21 = 0.184639691595506 * cse_tmp_4 / (1.4645918875615234 * rs)
        cse_tmp_22 = xs1 ^ 2
        cse_tmp_23 = -cse_tmp_22 * cse_tmp_6
        cse_tmp_24 = cse_tmp_22 / 8
        cse_tmp_25 = (-cse_tmp_24 + t1) / (cse_tmp_24 * params_a_eta + cse_tmp_9)
        cse_tmp_26 = my_piecewise3(cse_tmp_25 > 1000000.0, 1000000.0, cse_tmp_25)
        cse_tmp_27 = my_piecewise3(-1000000.0 > cse_tmp_26, -1000000.0, cse_tmp_26)
        cse_tmp_28 = my_piecewise5(cse_tmp_17, cse_tmp_15, cse_tmp_14, cse_tmp_18, -z) + 1
        my_piecewise3(cse_tmp_0 * cse_tmp_1 <= dens_threshold, 0, -cse_tmp_21 * (-cse_tmp_13 * (1 - cse_tmp_12) ^ 3 * (cse_tmp_12 + 1) ^ 3 * exp(cse_tmp_7) / (cse_tmp_12 ^ 6 * params_a_b + cse_tmp_12 ^ 3 + 1) - params_a_kappa * xc_expm1(cse_tmp_7) + 1) * my_piecewise3(cse_tmp_19 <= zeta_threshold, cse_tmp_20, NaNMath.pow(cse_tmp_19, 1.3333333333333333))) + my_piecewise3(cse_tmp_1 * cse_tmp_16 <= dens_threshold, 0, -cse_tmp_21 * (-cse_tmp_13 * (1 - cse_tmp_27) ^ 3 * (cse_tmp_27 + 1) ^ 3 * exp(cse_tmp_23) / (cse_tmp_27 ^ 6 * params_a_b + cse_tmp_27 ^ 3 + 1) - params_a_kappa * xc_expm1(cse_tmp_23) + 1) * my_piecewise3(cse_tmp_28 <= zeta_threshold, cse_tmp_20, NaNMath.pow(cse_tmp_28, 1.3333333333333333)))
    end
end
export mgga_x_msrpbel_energy

const mgga_x_msrpbel_defaults = (dens_threshold = 1.0e-15, params_a_b = 1.0, params_a_c = 0.0767086, params_a_eta = 0.0, params_a_kappa = 0.804, zeta_threshold = 2.220446049250313e-16)
const mgga_x_msrpbel_required = ()

function mgga_x_msrpbel(rho, sigma, lapl, tau; params = NamedTuple())
    p = resolve_params(mgga_x_msrpbel_defaults, mgga_x_msrpbel_required, params)
    v = mgga_variables(rho, sigma, lapl, tau, Val(3))
    return mgga_x_msrpbel_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.dens_threshold, p.params_a_b, p.params_a_c, p.params_a_eta, p.params_a_kappa, p.zeta_threshold)
end

function mgga_x_msrpbel(na, nb, gaa, gab, gbb, la, lb, ta, tb; params = NamedTuple())
    p = resolve_params(mgga_x_msrpbel_defaults, mgga_x_msrpbel_required, params)
    v = mgga_variables(na, nb, gaa, gab, gbb, la, lb, ta, tb, Val(3))
    return mgga_x_msrpbel_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.dens_threshold, p.params_a_b, p.params_a_c, p.params_a_eta, p.params_a_kappa, p.zeta_threshold)
end

export mgga_x_msrpbel, mgga_x_msrpbel_defaults, mgga_x_msrpbel_required

const mgga_x_rmsrpbel_defaults = (dens_threshold = 1.0e-15, params_a_b = 1.0, params_a_c = 0.0767086, params_a_eta = 0.001, params_a_kappa = 0.804, zeta_threshold = 2.220446049250313e-16)
const mgga_x_rmsrpbel_required = ()

function mgga_x_rmsrpbel(rho, sigma, lapl, tau; params = NamedTuple())
    p = resolve_params(mgga_x_rmsrpbel_defaults, mgga_x_rmsrpbel_required, params)
    v = mgga_variables(rho, sigma, lapl, tau, Val(3))
    return mgga_x_msrpbel_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.dens_threshold, p.params_a_b, p.params_a_c, p.params_a_eta, p.params_a_kappa, p.zeta_threshold)
end

function mgga_x_rmsrpbel(na, nb, gaa, gab, gbb, la, lb, ta, tb; params = NamedTuple())
    p = resolve_params(mgga_x_rmsrpbel_defaults, mgga_x_rmsrpbel_required, params)
    v = mgga_variables(na, nb, gaa, gab, gbb, la, lb, ta, tb, Val(3))
    return mgga_x_msrpbel_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.dens_threshold, p.params_a_b, p.params_a_c, p.params_a_eta, p.params_a_kappa, p.zeta_threshold)
end

export mgga_x_rmsrpbel, mgga_x_rmsrpbel_defaults, mgga_x_rmsrpbel_required
