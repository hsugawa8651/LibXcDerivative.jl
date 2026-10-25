# Auto-generated from the Libxc sources
# python/gga_exc/hyb_gga_x_cam_s12.py -- do not edit by hand.
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
# args: rs, z, xt, xs0, xs1, cam_alpha, cam_beta, cam_omega, dens_threshold, params_a_A, params_a_B, params_a_C, params_a_D, params_a_E, zeta_threshold
const hyb_gga_x_cam_s12_energy = function (rs, z, xt, xs0, xs1, cam_alpha, cam_beta, cam_omega, dens_threshold, params_a_A, params_a_B, params_a_C, params_a_D, params_a_E, zeta_threshold)
    @inbounds begin
        cse_tmp_0 = z + 1
        cse_tmp_1 = (3 // 8) / (pi * rs ^ 3)
        cse_tmp_2 = xs0 ^ 2
        cse_tmp_3 = cse_tmp_2 * params_a_C + params_a_D * xs0 ^ 4
        cse_tmp_4 = cse_tmp_2 * params_a_E
        cse_tmp_5 = (cse_tmp_4 + 1) ^ (-1)
        cse_tmp_6 = cse_tmp_3 * params_a_B * my_piecewise3(cse_tmp_4 <= 1, cse_tmp_4 * cse_tmp_5, 1 - cse_tmp_5) / (cse_tmp_3 + 1) + params_a_A
        cse_tmp_7 = cse_tmp_0 <= zeta_threshold
        cse_tmp_8 = zeta_threshold - 1
        cse_tmp_9 = 1 - z
        cse_tmp_10 = cse_tmp_9 <= zeta_threshold
        cse_tmp_11 = -cse_tmp_8
        cse_tmp_12 = my_piecewise5(cse_tmp_7, cse_tmp_8, cse_tmp_10, cse_tmp_11, z) + 1
        cse_tmp_13 = 0.165390532934988 * 1.5874010519681994 * 1.2009369551760027 * cam_omega * rs / 1.2102032422537643
        cse_tmp_14 = cse_tmp_13 / (NaNMath.pow(cse_tmp_12, 0.3333333333333333) * NaNMath.sqrt(cse_tmp_6 ^ (-1)))
        cse_tmp_15 = cse_tmp_14 > 1.35
        cse_tmp_16 = my_piecewise3(cse_tmp_15, cse_tmp_14, 1.35)
        cse_tmp_17 = my_piecewise3(cse_tmp_15, 1.35, cse_tmp_14)
        cse_tmp_18 = 1.772453850905516
        cse_tmp_19 = cse_tmp_17 ^ 2
        cse_tmp_20 = xc_expm1(-1 / (4 * cse_tmp_19))
        cse_tmp_21 = cam_alpha + cam_beta - 1
        cse_tmp_22 = NaNMath.pow(zeta_threshold, 1.3333333333333333)
        cse_tmp_23 = 0.184639691595506 * 1.8171205928321397 / (1.4645918875615234 * rs)
        cse_tmp_24 = xs1 ^ 2
        cse_tmp_25 = cse_tmp_24 * params_a_C + params_a_D * xs1 ^ 4
        cse_tmp_26 = cse_tmp_24 * params_a_E
        cse_tmp_27 = (cse_tmp_26 + 1) ^ (-1)
        cse_tmp_28 = cse_tmp_25 * params_a_B * my_piecewise3(cse_tmp_26 <= 1, cse_tmp_26 * cse_tmp_27, 1 - cse_tmp_27) / (cse_tmp_25 + 1) + params_a_A
        cse_tmp_29 = my_piecewise5(cse_tmp_10, cse_tmp_8, cse_tmp_7, cse_tmp_11, -z) + 1
        cse_tmp_30 = cse_tmp_13 / (NaNMath.pow(cse_tmp_29, 0.3333333333333333) * NaNMath.sqrt(cse_tmp_28 ^ (-1)))
        cse_tmp_31 = cse_tmp_30 > 1.35
        cse_tmp_32 = my_piecewise3(cse_tmp_31, cse_tmp_30, 1.35)
        cse_tmp_33 = my_piecewise3(cse_tmp_31, 1.35, cse_tmp_30)
        cse_tmp_34 = cse_tmp_33 ^ 2
        cse_tmp_35 = xc_expm1(-1 / (4 * cse_tmp_34))
        my_piecewise3(cse_tmp_0 * cse_tmp_1 <= dens_threshold, 0, -cse_tmp_23 * cse_tmp_6 * (cam_beta * my_piecewise3(cse_tmp_14 >= 1.35, 1 - 1 / (36 * cse_tmp_16 ^ 2) + 1 / (960 * cse_tmp_16 ^ 4) - 1 / (26880 * cse_tmp_16 ^ 6) + 1 / (829440 * cse_tmp_16 ^ 8) - 1 / (28385280 * cse_tmp_16 ^ 10) + 1 / (1073479680 * cse_tmp_16 ^ 12) - 1 / (44590694400 * cse_tmp_16 ^ 14), (8 // 3) * cse_tmp_17 * (2 * cse_tmp_17 * (-2 * cse_tmp_19 * cse_tmp_20 + cse_tmp_20 - 1 // 2) + cse_tmp_18 * erf(1 / (2 * cse_tmp_17)))) - cse_tmp_21) * my_piecewise3(cse_tmp_12 <= zeta_threshold, cse_tmp_22, NaNMath.pow(cse_tmp_12, 1.3333333333333333))) + my_piecewise3(cse_tmp_1 * cse_tmp_9 <= dens_threshold, 0, -cse_tmp_23 * cse_tmp_28 * (cam_beta * my_piecewise3(cse_tmp_30 >= 1.35, 1 - 1 / (36 * cse_tmp_32 ^ 2) + 1 / (960 * cse_tmp_32 ^ 4) - 1 / (26880 * cse_tmp_32 ^ 6) + 1 / (829440 * cse_tmp_32 ^ 8) - 1 / (28385280 * cse_tmp_32 ^ 10) + 1 / (1073479680 * cse_tmp_32 ^ 12) - 1 / (44590694400 * cse_tmp_32 ^ 14), (8 // 3) * cse_tmp_33 * (cse_tmp_18 * erf(1 / (2 * cse_tmp_33)) + 2 * cse_tmp_33 * (-2 * cse_tmp_34 * cse_tmp_35 + cse_tmp_35 - 1 // 2))) - cse_tmp_21) * my_piecewise3(cse_tmp_29 <= zeta_threshold, cse_tmp_22, NaNMath.pow(cse_tmp_29, 1.3333333333333333)))
    end
end
export hyb_gga_x_cam_s12_energy

const hyb_gga_x_cam_s12_defaults = NamedTuple()
const hyb_gga_x_cam_s12_required = (:cam_alpha, :cam_beta, :cam_omega, :dens_threshold, :params_a_A, :params_a_B, :params_a_C, :params_a_D, :params_a_E, :zeta_threshold)

function hyb_gga_x_cam_s12(rho, sigma; params = NamedTuple())
    p = resolve_params(hyb_gga_x_cam_s12_defaults, hyb_gga_x_cam_s12_required, params)
    v = gga_variables(rho, sigma, Val(3))
    return hyb_gga_x_cam_s12_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.cam_alpha, p.cam_beta, p.cam_omega, p.dens_threshold, p.params_a_A, p.params_a_B, p.params_a_C, p.params_a_D, p.params_a_E, p.zeta_threshold)
end

function hyb_gga_x_cam_s12(na, nb, gaa, gab, gbb; params = NamedTuple())
    p = resolve_params(hyb_gga_x_cam_s12_defaults, hyb_gga_x_cam_s12_required, params)
    v = gga_variables(na, nb, gaa, gab, gbb, Val(3))
    return hyb_gga_x_cam_s12_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.cam_alpha, p.cam_beta, p.cam_omega, p.dens_threshold, p.params_a_A, p.params_a_B, p.params_a_C, p.params_a_D, p.params_a_E, p.zeta_threshold)
end

export hyb_gga_x_cam_s12, hyb_gga_x_cam_s12_defaults, hyb_gga_x_cam_s12_required

const hyb_gga_x_cam_s12g_defaults = (cam_alpha = 0.34485046, cam_beta = -0.34485046, cam_omega = 1.52420731, dens_threshold = 1.0e-15, params_a_A = 1.03323556, params_a_B = 0.7237644399999998, params_a_C = 0.00417251, params_a_D = 0.00115216, params_a_E = 0.00706184, zeta_threshold = 2.220446049250313e-16)
const hyb_gga_x_cam_s12g_required = ()

function hyb_gga_x_cam_s12g(rho, sigma; params = NamedTuple())
    p = resolve_params(hyb_gga_x_cam_s12g_defaults, hyb_gga_x_cam_s12g_required, params)
    v = gga_variables(rho, sigma, Val(3))
    return hyb_gga_x_cam_s12_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.cam_alpha, p.cam_beta, p.cam_omega, p.dens_threshold, p.params_a_A, p.params_a_B, p.params_a_C, p.params_a_D, p.params_a_E, p.zeta_threshold)
end

function hyb_gga_x_cam_s12g(na, nb, gaa, gab, gbb; params = NamedTuple())
    p = resolve_params(hyb_gga_x_cam_s12g_defaults, hyb_gga_x_cam_s12g_required, params)
    v = gga_variables(na, nb, gaa, gab, gbb, Val(3))
    return hyb_gga_x_cam_s12_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.cam_alpha, p.cam_beta, p.cam_omega, p.dens_threshold, p.params_a_A, p.params_a_B, p.params_a_C, p.params_a_D, p.params_a_E, p.zeta_threshold)
end

export hyb_gga_x_cam_s12g, hyb_gga_x_cam_s12g_defaults, hyb_gga_x_cam_s12g_required

const hyb_gga_x_cam_s12h_defaults = (cam_alpha = 0.35897845, cam_beta = -0.10897845, cam_omega = 0.48516891, dens_threshold = 1.0e-15, params_a_A = 1.02149642, params_a_B = 0.7355035799999998, params_a_C = 0.00825905, params_a_D = 0.00235804, params_a_E = 0.00654977, zeta_threshold = 2.220446049250313e-16)
const hyb_gga_x_cam_s12h_required = ()

function hyb_gga_x_cam_s12h(rho, sigma; params = NamedTuple())
    p = resolve_params(hyb_gga_x_cam_s12h_defaults, hyb_gga_x_cam_s12h_required, params)
    v = gga_variables(rho, sigma, Val(3))
    return hyb_gga_x_cam_s12_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.cam_alpha, p.cam_beta, p.cam_omega, p.dens_threshold, p.params_a_A, p.params_a_B, p.params_a_C, p.params_a_D, p.params_a_E, p.zeta_threshold)
end

function hyb_gga_x_cam_s12h(na, nb, gaa, gab, gbb; params = NamedTuple())
    p = resolve_params(hyb_gga_x_cam_s12h_defaults, hyb_gga_x_cam_s12h_required, params)
    v = gga_variables(na, nb, gaa, gab, gbb, Val(3))
    return hyb_gga_x_cam_s12_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.cam_alpha, p.cam_beta, p.cam_omega, p.dens_threshold, p.params_a_A, p.params_a_B, p.params_a_C, p.params_a_D, p.params_a_E, p.zeta_threshold)
end

export hyb_gga_x_cam_s12h, hyb_gga_x_cam_s12h_defaults, hyb_gga_x_cam_s12h_required
