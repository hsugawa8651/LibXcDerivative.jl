# Auto-generated from the Libxc sources
# python/mgga_exc/mgga_x_mbr.py -- do not edit by hand.
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
# args: rs, z, xt, xs0, xs1, u0, u1, t0, t1, dens_threshold, params_a_beta, params_a_gamma, params_a_lambda, zeta_threshold
const mgga_x_mbr_energy = function (rs, z, xt, xs0, xs1, u0, u1, t0, t1, dens_threshold, params_a_beta, params_a_gamma, params_a_lambda, zeta_threshold)
    @inbounds begin
        cse_tmp_0 = z + 1
        cse_tmp_1 = (3 // 8) / (pi * rs ^ 3)
        cse_tmp_2 = xs0 ^ 2
        cse_tmp_3 = 2 * params_a_lambda - 1
        cse_tmp_4 = cse_tmp_3 ^ 2
        cse_tmp_5 = cse_tmp_4 / 4
        cse_tmp_6 = params_a_gamma / 3
        cse_tmp_7 = 3.3019272488946267
        cse_tmp_8 = 4.60115111447049
        cse_tmp_9 = cse_tmp_7 * cse_tmp_8
        cse_tmp_10 = (3 // 5) * cse_tmp_9
        cse_tmp_11 = params_a_lambda ^ 2 - params_a_lambda + 1 // 2
        cse_tmp_12 = (175 // 162) * 1.8171205928321397 * cse_tmp_4 / cse_tmp_8
        cse_tmp_13 = cse_tmp_3 ^ 4 * cse_tmp_7 * params_a_beta / (576 * 21.170591578193033)
        cse_tmp_14 = cse_tmp_9 / 5
        cse_tmp_15 = cse_tmp_11 * (-cse_tmp_10 - cse_tmp_2 / 36 + 2 * t0) + cse_tmp_14 * xc_expm1(xc_log1p(cse_tmp_12 * cse_tmp_2 + cse_tmp_13 * xs0 ^ 4) / 5) - cse_tmp_6 * (-cse_tmp_2 * cse_tmp_5 + 2 * t0)
        cse_tmp_16 = br89_x(my_piecewise3(my_piecewise3(cse_tmp_15 >= 0, cse_tmp_15, -cse_tmp_15) < 5.0e-13, my_piecewise3(cse_tmp_15 > 0, 5.0e-13, -5.0e-13), cse_tmp_15))
        cse_tmp_17 = cse_tmp_0 <= zeta_threshold
        cse_tmp_18 = zeta_threshold - 1
        cse_tmp_19 = 1 - z
        cse_tmp_20 = cse_tmp_19 <= zeta_threshold
        cse_tmp_21 = -cse_tmp_18
        cse_tmp_22 = my_piecewise5(cse_tmp_17, cse_tmp_18, cse_tmp_20, cse_tmp_21, z) + 1
        cse_tmp_23 = NaNMath.pow(zeta_threshold, 1.3333333333333333)
        cse_tmp_24 = 1.4422495703074083 / (4 * rs)
        cse_tmp_25 = xs1 ^ 2
        cse_tmp_26 = cse_tmp_11 * (-cse_tmp_10 - cse_tmp_25 / 36 + 2 * t1) + cse_tmp_14 * xc_expm1(xc_log1p(cse_tmp_12 * cse_tmp_25 + cse_tmp_13 * xs1 ^ 4) / 5) - cse_tmp_6 * (-cse_tmp_25 * cse_tmp_5 + 2 * t1)
        cse_tmp_27 = br89_x(my_piecewise3(my_piecewise3(cse_tmp_26 >= 0, cse_tmp_26, -cse_tmp_26) < 5.0e-13, my_piecewise3(cse_tmp_26 > 0, 5.0e-13, -5.0e-13), cse_tmp_26))
        cse_tmp_28 = my_piecewise5(cse_tmp_20, cse_tmp_18, cse_tmp_17, cse_tmp_21, -z) + 1
        my_piecewise3(cse_tmp_0 * cse_tmp_1 <= dens_threshold, 0, -cse_tmp_24 * (-1 // 2 - (cse_tmp_16 / 2 + 1) * xc_expm1(-cse_tmp_16) / cse_tmp_16) * exp(cse_tmp_16 / 3) * my_piecewise3(cse_tmp_22 <= zeta_threshold, cse_tmp_23, NaNMath.pow(cse_tmp_22, 1.3333333333333333))) + my_piecewise3(cse_tmp_1 * cse_tmp_19 <= dens_threshold, 0, -cse_tmp_24 * (-1 // 2 - (cse_tmp_27 / 2 + 1) * xc_expm1(-cse_tmp_27) / cse_tmp_27) * exp(cse_tmp_27 / 3) * my_piecewise3(cse_tmp_28 <= zeta_threshold, cse_tmp_23, NaNMath.pow(cse_tmp_28, 1.3333333333333333)))
    end
end
export mgga_x_mbr_energy

const mgga_x_mbr_defaults = (dens_threshold = 1.0e-15, params_a_beta = 20.0, params_a_gamma = 1.0, params_a_lambda = 0.877, zeta_threshold = 2.220446049250313e-16)
const mgga_x_mbr_required = ()

function mgga_x_mbr(rho, sigma, lapl, tau; params = NamedTuple())
    p = resolve_params(mgga_x_mbr_defaults, mgga_x_mbr_required, params)
    v = mgga_variables(rho, sigma, lapl, tau, Val(3))
    return mgga_x_mbr_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.dens_threshold, p.params_a_beta, p.params_a_gamma, p.params_a_lambda, p.zeta_threshold)
end

function mgga_x_mbr(na, nb, gaa, gab, gbb, la, lb, ta, tb; params = NamedTuple())
    p = resolve_params(mgga_x_mbr_defaults, mgga_x_mbr_required, params)
    v = mgga_variables(na, nb, gaa, gab, gbb, la, lb, ta, tb, Val(3))
    return mgga_x_mbr_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.dens_threshold, p.params_a_beta, p.params_a_gamma, p.params_a_lambda, p.zeta_threshold)
end

export mgga_x_mbr, mgga_x_mbr_defaults, mgga_x_mbr_required
