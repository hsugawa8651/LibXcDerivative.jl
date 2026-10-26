# Auto-generated from the Libxc sources
# python/mgga_exc/mgga_x_eel.py -- do not edit by hand.
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
# args: rs, z, xt, xs0, xs1, u0, u1, t0, t1, dens_threshold, params_a_a0, params_a_c, params_a_x0, zeta_threshold
const mgga_x_eel_energy = function (rs, z, xt, xs0, xs1, u0, u1, t0, t1, dens_threshold, params_a_a0, params_a_c, params_a_x0, zeta_threshold)
    @inbounds begin
        cse_tmp_0 = z + 1
        cse_tmp_1 = (3 // 8) / (pi * rs ^ 3)
        cse_tmp_2 = xs0 ^ 2
        cse_tmp_3 = 1.8171205928321397
        cse_tmp_4 = 0.2173369174628993
        cse_tmp_5 = cse_tmp_3 * cse_tmp_4
        cse_tmp_6 = cse_tmp_5 / 24
        cse_tmp_7 = cse_tmp_2 * cse_tmp_6
        cse_tmp_8 = cse_tmp_2 * cse_tmp_3 * cse_tmp_4 / 24 - params_a_x0
        cse_tmp_9 = 1.174 * my_piecewise3(params_a_x0 < cse_tmp_7, -xc_expm1(-params_a_c / NaNMath.pow(my_piecewise3(cse_tmp_8 > 0, cse_tmp_8, 0), 0.25)), 1)
        cse_tmp_10 = params_a_a0 ^ (-1)
        cse_tmp_11 = (5 // 9) * cse_tmp_10 * cse_tmp_5
        cse_tmp_12 = (3 // 5) * params_a_a0
        cse_tmp_13 = cse_tmp_12 * tanh(cse_tmp_11 * (-cse_tmp_2 / 8 + t0)) + cse_tmp_7
        cse_tmp_14 = -params_a_x0
        cse_tmp_15 = cse_tmp_13 + cse_tmp_14
        cse_tmp_16 = cse_tmp_12 * tanh(cse_tmp_10)
        cse_tmp_17 = cse_tmp_14 + cse_tmp_16
        cse_tmp_18 = 0.174 / (1.174 * my_piecewise3(params_a_x0 < cse_tmp_16, -xc_expm1(-params_a_c / NaNMath.pow(my_piecewise3(cse_tmp_17 > 0, cse_tmp_17, 0), 0.25)), 1) - 1.174)
        cse_tmp_19 = cse_tmp_0 <= zeta_threshold
        cse_tmp_20 = zeta_threshold - 1
        cse_tmp_21 = 1 - z
        cse_tmp_22 = cse_tmp_21 <= zeta_threshold
        cse_tmp_23 = -cse_tmp_20
        cse_tmp_24 = my_piecewise5(cse_tmp_19, cse_tmp_20, cse_tmp_22, cse_tmp_23, z) + 1
        cse_tmp_25 = NaNMath.pow(zeta_threshold, 1.3333333333333333)
        cse_tmp_26 = 0.184639691595506 * cse_tmp_3 / (1.4645918875615234 * rs)
        cse_tmp_27 = xs1 ^ 2
        cse_tmp_28 = cse_tmp_27 * cse_tmp_6
        cse_tmp_29 = cse_tmp_27 * cse_tmp_3 * cse_tmp_4 / 24 - params_a_x0
        cse_tmp_30 = 1.174 * my_piecewise3(params_a_x0 < cse_tmp_28, -xc_expm1(-params_a_c / NaNMath.pow(my_piecewise3(cse_tmp_29 > 0, cse_tmp_29, 0), 0.25)), 1)
        cse_tmp_31 = cse_tmp_12 * tanh(cse_tmp_11 * (-cse_tmp_27 / 8 + t1)) + cse_tmp_28
        cse_tmp_32 = cse_tmp_14 + cse_tmp_31
        cse_tmp_33 = my_piecewise5(cse_tmp_22, cse_tmp_20, cse_tmp_19, cse_tmp_23, -z) + 1
        my_piecewise3(cse_tmp_0 * cse_tmp_1 <= dens_threshold, 0, -cse_tmp_26 * (-cse_tmp_18 * (-cse_tmp_9 + 1.174 * my_piecewise3(params_a_x0 < cse_tmp_13, -xc_expm1(-params_a_c / NaNMath.pow(my_piecewise3(cse_tmp_15 > 0, cse_tmp_15, 0), 0.25)), 1)) + cse_tmp_9) * my_piecewise3(cse_tmp_24 <= zeta_threshold, cse_tmp_25, NaNMath.pow(cse_tmp_24, 1.3333333333333333))) + my_piecewise3(cse_tmp_1 * cse_tmp_21 <= dens_threshold, 0, -cse_tmp_26 * (-cse_tmp_18 * (-cse_tmp_30 + 1.174 * my_piecewise3(params_a_x0 < cse_tmp_31, -xc_expm1(-params_a_c / NaNMath.pow(my_piecewise3(cse_tmp_32 > 0, cse_tmp_32, 0), 0.25)), 1)) + cse_tmp_30) * my_piecewise3(cse_tmp_33 <= zeta_threshold, cse_tmp_25, NaNMath.pow(cse_tmp_33, 1.3333333333333333)))
    end
end
export mgga_x_eel_energy

const mgga_x_eel_defaults = (dens_threshold = 1.0e-15, params_a_a0 = 3.0, params_a_c = 4.759279, params_a_x0 = 0.14118847627290323, zeta_threshold = 2.220446049250313e-16)
const mgga_x_eel_required = ()

function mgga_x_eel(rho, sigma, lapl, tau; params = NamedTuple())
    p = resolve_params(mgga_x_eel_defaults, mgga_x_eel_required, params)
    v = mgga_variables(rho, sigma, lapl, tau, Val(3))
    return mgga_x_eel_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.dens_threshold, p.params_a_a0, p.params_a_c, p.params_a_x0, p.zeta_threshold)
end

function mgga_x_eel(na, nb, gaa, gab, gbb, la, lb, ta, tb; params = NamedTuple())
    p = resolve_params(mgga_x_eel_defaults, mgga_x_eel_required, params)
    v = mgga_variables(na, nb, gaa, gab, gbb, la, lb, ta, tb, Val(3))
    return mgga_x_eel_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.dens_threshold, p.params_a_a0, p.params_a_c, p.params_a_x0, p.zeta_threshold)
end

export mgga_x_eel, mgga_x_eel_defaults, mgga_x_eel_required
