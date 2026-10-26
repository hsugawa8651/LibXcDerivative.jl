# Auto-generated from the Libxc sources
# python/mgga_exc/mgga_x_tau_hcth.py -- do not edit by hand.
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
# args: rs, z, xt, xs0, xs1, u0, u1, t0, t1, dens_threshold, params_a_cx_local_0, params_a_cx_local_1, params_a_cx_local_2, params_a_cx_local_3, params_a_cx_nlocal_0, params_a_cx_nlocal_1, params_a_cx_nlocal_2, params_a_cx_nlocal_3, zeta_threshold
const mgga_x_tau_hcth_energy = function (rs, z, xt, xs0, xs1, u0, u1, t0, t1, dens_threshold, params_a_cx_local_0, params_a_cx_local_1, params_a_cx_local_2, params_a_cx_local_3, params_a_cx_nlocal_0, params_a_cx_nlocal_1, params_a_cx_nlocal_2, params_a_cx_nlocal_3, zeta_threshold)
    @inbounds begin
        cse_tmp_0 = z + 1
        cse_tmp_1 = (3 // 8) / (pi * rs ^ 3)
        cse_tmp_2 = 0.004 * xs0 ^ 2
        cse_tmp_3 = cse_tmp_2 + 1
        cse_tmp_4 = cse_tmp_2 / cse_tmp_3
        cse_tmp_5 = xs0 ^ 4 / cse_tmp_3 ^ 2
        cse_tmp_6 = 1.6e-5 * params_a_cx_local_2
        cse_tmp_7 = xs0 ^ 6 / cse_tmp_3 ^ 3
        cse_tmp_8 = 6.4e-8 * params_a_cx_local_3
        cse_tmp_9 = 1.6e-5 * params_a_cx_nlocal_2
        cse_tmp_10 = 6.4e-8 * params_a_cx_nlocal_3
        cse_tmp_11 = 97.40909103400244
        cse_tmp_12 = 3.3019272488946267
        cse_tmp_13 = (3 // 10) * 4.60115111447049 * cse_tmp_12
        cse_tmp_14 = cse_tmp_13 + t0
        cse_tmp_15 = 1.8171205928321397
        cse_tmp_16 = (216 // 25) * 21.170591578193033 * cse_tmp_15
        cse_tmp_17 = 2062.2080822838902
        cse_tmp_18 = (2916 // 125) * 448.1939477706577 * cse_tmp_12
        cse_tmp_19 = cse_tmp_0 <= zeta_threshold
        cse_tmp_20 = zeta_threshold - 1
        cse_tmp_21 = 1 - z
        cse_tmp_22 = cse_tmp_21 <= zeta_threshold
        cse_tmp_23 = -cse_tmp_20
        cse_tmp_24 = my_piecewise5(cse_tmp_19, cse_tmp_20, cse_tmp_22, cse_tmp_23, z) + 1
        cse_tmp_25 = NaNMath.pow(zeta_threshold, 1.3333333333333333)
        cse_tmp_26 = 0.184639691595506 * cse_tmp_15 / (1.4645918875615234 * rs)
        cse_tmp_27 = 0.004 * xs1 ^ 2
        cse_tmp_28 = cse_tmp_27 + 1
        cse_tmp_29 = cse_tmp_27 / cse_tmp_28
        cse_tmp_30 = xs1 ^ 4 / cse_tmp_28 ^ 2
        cse_tmp_31 = xs1 ^ 6 / cse_tmp_28 ^ 3
        cse_tmp_32 = cse_tmp_13 + t1
        cse_tmp_33 = my_piecewise5(cse_tmp_22, cse_tmp_20, cse_tmp_19, cse_tmp_23, -z) + 1
        my_piecewise3(cse_tmp_0 * cse_tmp_1 <= dens_threshold, 0, -cse_tmp_26 * (cse_tmp_4 * params_a_cx_local_1 + cse_tmp_5 * cse_tmp_6 + cse_tmp_7 * cse_tmp_8 + params_a_cx_local_0 + (cse_tmp_10 * cse_tmp_7 + cse_tmp_4 * params_a_cx_nlocal_1 + cse_tmp_5 * cse_tmp_9 + params_a_cx_nlocal_0) * ((7776 // 125) * cse_tmp_11 / cse_tmp_14 ^ 3 - cse_tmp_16 / cse_tmp_14 ^ 2 - cse_tmp_18 / cse_tmp_14 ^ 4 + (52488 // 3125) * cse_tmp_15 * cse_tmp_17 / cse_tmp_14 ^ 5)) * my_piecewise3(cse_tmp_24 <= zeta_threshold, cse_tmp_25, NaNMath.pow(cse_tmp_24, 1.3333333333333333))) + my_piecewise3(cse_tmp_1 * cse_tmp_21 <= dens_threshold, 0, -cse_tmp_26 * (cse_tmp_29 * params_a_cx_local_1 + cse_tmp_30 * cse_tmp_6 + cse_tmp_31 * cse_tmp_8 + params_a_cx_local_0 + (cse_tmp_10 * cse_tmp_31 + cse_tmp_29 * params_a_cx_nlocal_1 + cse_tmp_30 * cse_tmp_9 + params_a_cx_nlocal_0) * ((7776 // 125) * cse_tmp_11 / cse_tmp_32 ^ 3 + (52488 // 3125) * cse_tmp_15 * cse_tmp_17 / cse_tmp_32 ^ 5 - cse_tmp_16 / cse_tmp_32 ^ 2 - cse_tmp_18 / cse_tmp_32 ^ 4)) * my_piecewise3(cse_tmp_33 <= zeta_threshold, cse_tmp_25, NaNMath.pow(cse_tmp_33, 1.3333333333333333)))
    end
end
export mgga_x_tau_hcth_energy

const mgga_x_tau_hcth_defaults = (dens_threshold = 1.0e-15, params_a_cx_local_0 = 1.10734, params_a_cx_local_1 = -1.0534, params_a_cx_local_2 = 6.3491, params_a_cx_local_3 = -2.5531, params_a_cx_nlocal_0 = 0.0011, params_a_cx_nlocal_1 = -0.3041, params_a_cx_nlocal_2 = 6.9543, params_a_cx_nlocal_3 = -0.7235, zeta_threshold = 2.220446049250313e-16)
const mgga_x_tau_hcth_required = ()

function mgga_x_tau_hcth(rho, sigma, lapl, tau; params = NamedTuple())
    p = resolve_params(mgga_x_tau_hcth_defaults, mgga_x_tau_hcth_required, params)
    v = mgga_variables(rho, sigma, lapl, tau, Val(3))
    return mgga_x_tau_hcth_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.dens_threshold, p.params_a_cx_local_0, p.params_a_cx_local_1, p.params_a_cx_local_2, p.params_a_cx_local_3, p.params_a_cx_nlocal_0, p.params_a_cx_nlocal_1, p.params_a_cx_nlocal_2, p.params_a_cx_nlocal_3, p.zeta_threshold)
end

function mgga_x_tau_hcth(na, nb, gaa, gab, gbb, la, lb, ta, tb; params = NamedTuple())
    p = resolve_params(mgga_x_tau_hcth_defaults, mgga_x_tau_hcth_required, params)
    v = mgga_variables(na, nb, gaa, gab, gbb, la, lb, ta, tb, Val(3))
    return mgga_x_tau_hcth_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.dens_threshold, p.params_a_cx_local_0, p.params_a_cx_local_1, p.params_a_cx_local_2, p.params_a_cx_local_3, p.params_a_cx_nlocal_0, p.params_a_cx_nlocal_1, p.params_a_cx_nlocal_2, p.params_a_cx_nlocal_3, p.zeta_threshold)
end

export mgga_x_tau_hcth, mgga_x_tau_hcth_defaults, mgga_x_tau_hcth_required

const hyb_mgga_x_bmk_defaults = (dens_threshold = 1.0e-15, params_a_cx_local_0 = 0.474302, params_a_cx_local_1 = 2.77701, params_a_cx_local_2 = -11.423, params_a_cx_local_3 = 11.7167, params_a_cx_nlocal_0 = -0.192212, params_a_cx_nlocal_1 = 4.73936, params_a_cx_nlocal_2 = -26.6188, params_a_cx_nlocal_3 = 22.4891, zeta_threshold = 2.220446049250313e-16)
const hyb_mgga_x_bmk_required = ()

function hyb_mgga_x_bmk(rho, sigma, lapl, tau; params = NamedTuple())
    p = resolve_params(hyb_mgga_x_bmk_defaults, hyb_mgga_x_bmk_required, params)
    v = mgga_variables(rho, sigma, lapl, tau, Val(3))
    return mgga_x_tau_hcth_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.dens_threshold, p.params_a_cx_local_0, p.params_a_cx_local_1, p.params_a_cx_local_2, p.params_a_cx_local_3, p.params_a_cx_nlocal_0, p.params_a_cx_nlocal_1, p.params_a_cx_nlocal_2, p.params_a_cx_nlocal_3, p.zeta_threshold)
end

function hyb_mgga_x_bmk(na, nb, gaa, gab, gbb, la, lb, ta, tb; params = NamedTuple())
    p = resolve_params(hyb_mgga_x_bmk_defaults, hyb_mgga_x_bmk_required, params)
    v = mgga_variables(na, nb, gaa, gab, gbb, la, lb, ta, tb, Val(3))
    return mgga_x_tau_hcth_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.dens_threshold, p.params_a_cx_local_0, p.params_a_cx_local_1, p.params_a_cx_local_2, p.params_a_cx_local_3, p.params_a_cx_nlocal_0, p.params_a_cx_nlocal_1, p.params_a_cx_nlocal_2, p.params_a_cx_nlocal_3, p.zeta_threshold)
end

export hyb_mgga_x_bmk, hyb_mgga_x_bmk_defaults, hyb_mgga_x_bmk_required

const hyb_mgga_x_tau_hcth_defaults = (dens_threshold = 1.0e-15, params_a_cx_local_0 = 0.86735, params_a_cx_local_1 = 0.3008, params_a_cx_local_2 = 1.2208, params_a_cx_local_3 = 0.1574, params_a_cx_nlocal_0 = -0.0023, params_a_cx_nlocal_1 = -0.2849, params_a_cx_nlocal_2 = 5.4146, params_a_cx_nlocal_3 = -10.909, zeta_threshold = 2.220446049250313e-16)
const hyb_mgga_x_tau_hcth_required = ()

function hyb_mgga_x_tau_hcth(rho, sigma, lapl, tau; params = NamedTuple())
    p = resolve_params(hyb_mgga_x_tau_hcth_defaults, hyb_mgga_x_tau_hcth_required, params)
    v = mgga_variables(rho, sigma, lapl, tau, Val(3))
    return mgga_x_tau_hcth_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.dens_threshold, p.params_a_cx_local_0, p.params_a_cx_local_1, p.params_a_cx_local_2, p.params_a_cx_local_3, p.params_a_cx_nlocal_0, p.params_a_cx_nlocal_1, p.params_a_cx_nlocal_2, p.params_a_cx_nlocal_3, p.zeta_threshold)
end

function hyb_mgga_x_tau_hcth(na, nb, gaa, gab, gbb, la, lb, ta, tb; params = NamedTuple())
    p = resolve_params(hyb_mgga_x_tau_hcth_defaults, hyb_mgga_x_tau_hcth_required, params)
    v = mgga_variables(na, nb, gaa, gab, gbb, la, lb, ta, tb, Val(3))
    return mgga_x_tau_hcth_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.dens_threshold, p.params_a_cx_local_0, p.params_a_cx_local_1, p.params_a_cx_local_2, p.params_a_cx_local_3, p.params_a_cx_nlocal_0, p.params_a_cx_nlocal_1, p.params_a_cx_nlocal_2, p.params_a_cx_nlocal_3, p.zeta_threshold)
end

export hyb_mgga_x_tau_hcth, hyb_mgga_x_tau_hcth_defaults, hyb_mgga_x_tau_hcth_required
