# Auto-generated from the Libxc sources
# python/mgga_exc/mgga_x_tpss.py -- do not edit by hand.
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
# args: rs, z, xt, xs0, xs1, u0, u1, t0, t1, dens_threshold, params_a_b, params_a_c, params_a_e, params_a_kappa, params_a_mu, zeta_threshold
const mgga_x_tpss_energy = function (rs, z, xt, xs0, xs1, u0, u1, t0, t1, dens_threshold, params_a_b, params_a_c, params_a_e, params_a_kappa, params_a_mu, zeta_threshold)
    @inbounds begin
        cse_tmp_0 = z + 1
        cse_tmp_1 = (3 // 8) / (pi * rs ^ 3)
        cse_tmp_2 = NaNMath.sqrt(params_a_e)
        cse_tmp_3 = xs0 ^ 2
        cse_tmp_4 = 1.8171205928321397
        cse_tmp_5 = cse_tmp_4 / 4.60115111447049
        cse_tmp_6 = cse_tmp_5 / 24
        cse_tmp_7 = cse_tmp_3 * cse_tmp_6
        cse_tmp_8 = params_a_e * params_a_mu / (2304 * 97.40909103400244)
        cse_tmp_9 = t0 ^ (-2)
        cse_tmp_10 = xs0 ^ 4
        cse_tmp_11 = cse_tmp_10 * cse_tmp_9
        cse_tmp_12 = cse_tmp_2 / 720
        cse_tmp_13 = 21.170591578193033
        cse_tmp_14 = (25 // 944784) * 3.3019272488946267 / (cse_tmp_13 * params_a_kappa)
        cse_tmp_15 = cse_tmp_11 / 64
        cse_tmp_16 = cse_tmp_5 / 36
        cse_tmp_17 = cse_tmp_5 * (-cse_tmp_3 / 8 + t0)
        cse_tmp_18 = (5 // 9) * cse_tmp_17
        cse_tmp_19 = cse_tmp_16 * cse_tmp_3 + (cse_tmp_17 / 4 - 9 // 20) / NaNMath.sqrt(cse_tmp_18 * params_a_b * (cse_tmp_18 - 1) + 1)
        cse_tmp_20 = (27 // 100) * cse_tmp_13 * cse_tmp_4
        cse_tmp_21 = (73 // 9720) * cse_tmp_5
        cse_tmp_22 = (cse_tmp_10 * cse_tmp_14 + cse_tmp_11 * cse_tmp_12 + (146 // 2025) * cse_tmp_19 ^ 2 - cse_tmp_19 * cse_tmp_21 * cse_tmp_3 * NaNMath.sqrt(cse_tmp_20 * cse_tmp_9 + 1 // 2) + cse_tmp_7 * (cse_tmp_15 * params_a_c / (cse_tmp_15 + 1) ^ 2 + 10 // 81) + cse_tmp_8 * xs0 ^ 6) / (cse_tmp_2 * cse_tmp_7 + 1) ^ 2
        cse_tmp_23 = cse_tmp_0 <= zeta_threshold
        cse_tmp_24 = zeta_threshold - 1
        cse_tmp_25 = 1 - z
        cse_tmp_26 = cse_tmp_25 <= zeta_threshold
        cse_tmp_27 = -cse_tmp_24
        cse_tmp_28 = my_piecewise5(cse_tmp_23, cse_tmp_24, cse_tmp_26, cse_tmp_27, z) + 1
        cse_tmp_29 = NaNMath.pow(zeta_threshold, 1.3333333333333333)
        cse_tmp_30 = 0.184639691595506 * cse_tmp_4 / (1.4645918875615234 * rs)
        cse_tmp_31 = xs1 ^ 2
        cse_tmp_32 = cse_tmp_31 * cse_tmp_6
        cse_tmp_33 = t1 ^ (-2)
        cse_tmp_34 = xs1 ^ 4
        cse_tmp_35 = cse_tmp_33 * cse_tmp_34
        cse_tmp_36 = cse_tmp_35 / 64
        cse_tmp_37 = cse_tmp_5 * (-cse_tmp_31 / 8 + t1)
        cse_tmp_38 = (5 // 9) * cse_tmp_37
        cse_tmp_39 = cse_tmp_16 * cse_tmp_31 + (cse_tmp_37 / 4 - 9 // 20) / NaNMath.sqrt(cse_tmp_38 * params_a_b * (cse_tmp_38 - 1) + 1)
        cse_tmp_40 = (cse_tmp_12 * cse_tmp_35 + cse_tmp_14 * cse_tmp_34 - cse_tmp_21 * cse_tmp_31 * cse_tmp_39 * NaNMath.sqrt(cse_tmp_20 * cse_tmp_33 + 1 // 2) + cse_tmp_32 * (cse_tmp_36 * params_a_c / (cse_tmp_36 + 1) ^ 2 + 10 // 81) + (146 // 2025) * cse_tmp_39 ^ 2 + cse_tmp_8 * xs1 ^ 6) / (cse_tmp_2 * cse_tmp_32 + 1) ^ 2
        cse_tmp_41 = my_piecewise5(cse_tmp_26, cse_tmp_24, cse_tmp_23, cse_tmp_27, -z) + 1
        my_piecewise3(cse_tmp_0 * cse_tmp_1 <= dens_threshold, 0, -cse_tmp_30 * (cse_tmp_22 * params_a_kappa / (cse_tmp_22 + params_a_kappa) + 1) * my_piecewise3(cse_tmp_28 <= zeta_threshold, cse_tmp_29, NaNMath.pow(cse_tmp_28, 1.3333333333333333))) + my_piecewise3(cse_tmp_1 * cse_tmp_25 <= dens_threshold, 0, -cse_tmp_30 * (cse_tmp_40 * params_a_kappa / (cse_tmp_40 + params_a_kappa) + 1) * my_piecewise3(cse_tmp_41 <= zeta_threshold, cse_tmp_29, NaNMath.pow(cse_tmp_41, 1.3333333333333333)))
    end
end
export mgga_x_tpss_energy

const mgga_x_tpss_defaults = (dens_threshold = 1.0e-15, params_a_b = 0.4, params_a_c = 1.59096, params_a_e = 1.537, params_a_kappa = 0.804, params_a_mu = 0.21951, zeta_threshold = 2.220446049250313e-16)
const mgga_x_tpss_required = ()

function mgga_x_tpss(rho, sigma, lapl, tau; params = NamedTuple())
    p = resolve_params(mgga_x_tpss_defaults, mgga_x_tpss_required, params)
    v = mgga_variables(rho, sigma, lapl, tau, Val(3))
    return mgga_x_tpss_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.dens_threshold, p.params_a_b, p.params_a_c, p.params_a_e, p.params_a_kappa, p.params_a_mu, p.zeta_threshold)
end

function mgga_x_tpss(na, nb, gaa, gab, gbb, la, lb, ta, tb; params = NamedTuple())
    p = resolve_params(mgga_x_tpss_defaults, mgga_x_tpss_required, params)
    v = mgga_variables(na, nb, gaa, gab, gbb, la, lb, ta, tb, Val(3))
    return mgga_x_tpss_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.dens_threshold, p.params_a_b, p.params_a_c, p.params_a_e, p.params_a_kappa, p.params_a_mu, p.zeta_threshold)
end

export mgga_x_tpss, mgga_x_tpss_defaults, mgga_x_tpss_required

const mgga_x_modtpss_defaults = (dens_threshold = 1.0e-15, params_a_b = 0.4, params_a_c = 1.38496, params_a_e = 1.37, params_a_kappa = 0.804, params_a_mu = 0.252, zeta_threshold = 2.220446049250313e-16)
const mgga_x_modtpss_required = ()

function mgga_x_modtpss(rho, sigma, lapl, tau; params = NamedTuple())
    p = resolve_params(mgga_x_modtpss_defaults, mgga_x_modtpss_required, params)
    v = mgga_variables(rho, sigma, lapl, tau, Val(3))
    return mgga_x_tpss_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.dens_threshold, p.params_a_b, p.params_a_c, p.params_a_e, p.params_a_kappa, p.params_a_mu, p.zeta_threshold)
end

function mgga_x_modtpss(na, nb, gaa, gab, gbb, la, lb, ta, tb; params = NamedTuple())
    p = resolve_params(mgga_x_modtpss_defaults, mgga_x_modtpss_required, params)
    v = mgga_variables(na, nb, gaa, gab, gbb, la, lb, ta, tb, Val(3))
    return mgga_x_tpss_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.dens_threshold, p.params_a_b, p.params_a_c, p.params_a_e, p.params_a_kappa, p.params_a_mu, p.zeta_threshold)
end

export mgga_x_modtpss, mgga_x_modtpss_defaults, mgga_x_modtpss_required
