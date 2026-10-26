# Auto-generated from the Libxc sources
# python/mgga_exc/mgga_x_br89.py -- do not edit by hand.
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
# args: rs, z, xt, xs0, xs1, u0, u1, t0, t1, dens_threshold, params_a_at, params_a_gamma, zeta_threshold
const mgga_x_br89_energy = function (rs, z, xt, xs0, xs1, u0, u1, t0, t1, dens_threshold, params_a_at, params_a_gamma, zeta_threshold)
    @inbounds begin
        cse_tmp_0 = z + 1
        cse_tmp_1 = (3 // 8) / (pi * rs ^ 3)
        cse_tmp_2 = 97.40909103400244
        cse_tmp_3 = 3.3019272488946267
        cse_tmp_4 = (3 // 10) * 4.60115111447049 * cse_tmp_3
        cse_tmp_5 = cse_tmp_4 + t0
        cse_tmp_6 = 1.8171205928321397
        cse_tmp_7 = (216 // 25) * 21.170591578193033 * cse_tmp_6
        cse_tmp_8 = 2062.2080822838902
        cse_tmp_9 = (2916 // 125) * 448.1939477706577 * cse_tmp_3
        cse_tmp_10 = (2 // 3) * params_a_gamma
        cse_tmp_11 = params_a_gamma / 12
        cse_tmp_12 = -cse_tmp_10 * t0 + cse_tmp_11 * xs0 ^ 2 + u0 / 6
        cse_tmp_13 = br89_x(my_piecewise3(my_piecewise3(cse_tmp_12 >= 0, cse_tmp_12, -cse_tmp_12) < 5.0e-13, my_piecewise3(cse_tmp_12 > 0, 5.0e-13, -5.0e-13), cse_tmp_12))
        cse_tmp_14 = cse_tmp_0 <= zeta_threshold
        cse_tmp_15 = zeta_threshold - 1
        cse_tmp_16 = 1 - z
        cse_tmp_17 = cse_tmp_16 <= zeta_threshold
        cse_tmp_18 = -cse_tmp_15
        cse_tmp_19 = my_piecewise5(cse_tmp_14, cse_tmp_15, cse_tmp_17, cse_tmp_18, z) + 1
        cse_tmp_20 = NaNMath.pow(zeta_threshold, 1.3333333333333333)
        cse_tmp_21 = 1.4422495703074083 / (4 * rs)
        cse_tmp_22 = cse_tmp_4 + t1
        cse_tmp_23 = -cse_tmp_10 * t1 + cse_tmp_11 * xs1 ^ 2 + u1 / 6
        cse_tmp_24 = br89_x(my_piecewise3(my_piecewise3(cse_tmp_23 >= 0, cse_tmp_23, -cse_tmp_23) < 5.0e-13, my_piecewise3(cse_tmp_23 > 0, 5.0e-13, -5.0e-13), cse_tmp_23))
        cse_tmp_25 = my_piecewise5(cse_tmp_17, cse_tmp_15, cse_tmp_14, cse_tmp_18, -z) + 1
        my_piecewise3(cse_tmp_0 * cse_tmp_1 <= dens_threshold, 0, -cse_tmp_21 * (-1 // 2 - (cse_tmp_13 / 2 + 1) * xc_expm1(-cse_tmp_13) / cse_tmp_13) * (params_a_at * ((7776 // 125) * cse_tmp_2 / cse_tmp_5 ^ 3 - cse_tmp_7 / cse_tmp_5 ^ 2 - cse_tmp_9 / cse_tmp_5 ^ 4 + (52488 // 3125) * cse_tmp_6 * cse_tmp_8 / cse_tmp_5 ^ 5) + 1) * exp(cse_tmp_13 / 3) * my_piecewise3(cse_tmp_19 <= zeta_threshold, cse_tmp_20, NaNMath.pow(cse_tmp_19, 1.3333333333333333))) + my_piecewise3(cse_tmp_1 * cse_tmp_16 <= dens_threshold, 0, -cse_tmp_21 * (-1 // 2 - (cse_tmp_24 / 2 + 1) * xc_expm1(-cse_tmp_24) / cse_tmp_24) * (params_a_at * ((7776 // 125) * cse_tmp_2 / cse_tmp_22 ^ 3 - cse_tmp_7 / cse_tmp_22 ^ 2 - cse_tmp_9 / cse_tmp_22 ^ 4 + (52488 // 3125) * cse_tmp_6 * cse_tmp_8 / cse_tmp_22 ^ 5) + 1) * exp(cse_tmp_24 / 3) * my_piecewise3(cse_tmp_25 <= zeta_threshold, cse_tmp_20, NaNMath.pow(cse_tmp_25, 1.3333333333333333)))
    end
end
export mgga_x_br89_energy

const mgga_x_br89_defaults = (dens_threshold = 1.0e-12, params_a_at = 0.0, params_a_gamma = 0.8, zeta_threshold = 2.220446049250313e-16)
const mgga_x_br89_required = ()

function mgga_x_br89(rho, sigma, lapl, tau; params = NamedTuple())
    p = resolve_params(mgga_x_br89_defaults, mgga_x_br89_required, params)
    v = mgga_variables(rho, sigma, lapl, tau, Val(3))
    return mgga_x_br89_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.dens_threshold, p.params_a_at, p.params_a_gamma, p.zeta_threshold)
end

function mgga_x_br89(na, nb, gaa, gab, gbb, la, lb, ta, tb; params = NamedTuple())
    p = resolve_params(mgga_x_br89_defaults, mgga_x_br89_required, params)
    v = mgga_variables(na, nb, gaa, gab, gbb, la, lb, ta, tb, Val(3))
    return mgga_x_br89_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.dens_threshold, p.params_a_at, p.params_a_gamma, p.zeta_threshold)
end

export mgga_x_br89, mgga_x_br89_defaults, mgga_x_br89_required

const mgga_x_b00_defaults = (dens_threshold = 1.0e-15, params_a_at = 0.928, params_a_gamma = 1.0, zeta_threshold = 2.220446049250313e-16)
const mgga_x_b00_required = ()

function mgga_x_b00(rho, sigma, lapl, tau; params = NamedTuple())
    p = resolve_params(mgga_x_b00_defaults, mgga_x_b00_required, params)
    v = mgga_variables(rho, sigma, lapl, tau, Val(3))
    return mgga_x_br89_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.dens_threshold, p.params_a_at, p.params_a_gamma, p.zeta_threshold)
end

function mgga_x_b00(na, nb, gaa, gab, gbb, la, lb, ta, tb; params = NamedTuple())
    p = resolve_params(mgga_x_b00_defaults, mgga_x_b00_required, params)
    v = mgga_variables(na, nb, gaa, gab, gbb, la, lb, ta, tb, Val(3))
    return mgga_x_br89_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.dens_threshold, p.params_a_at, p.params_a_gamma, p.zeta_threshold)
end

export mgga_x_b00, mgga_x_b00_defaults, mgga_x_b00_required

const mgga_x_br89_1_defaults = (dens_threshold = 1.0e-12, params_a_at = 0.0, params_a_gamma = 1.0, zeta_threshold = 2.220446049250313e-16)
const mgga_x_br89_1_required = ()

function mgga_x_br89_1(rho, sigma, lapl, tau; params = NamedTuple())
    p = resolve_params(mgga_x_br89_1_defaults, mgga_x_br89_1_required, params)
    v = mgga_variables(rho, sigma, lapl, tau, Val(3))
    return mgga_x_br89_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.dens_threshold, p.params_a_at, p.params_a_gamma, p.zeta_threshold)
end

function mgga_x_br89_1(na, nb, gaa, gab, gbb, la, lb, ta, tb; params = NamedTuple())
    p = resolve_params(mgga_x_br89_1_defaults, mgga_x_br89_1_required, params)
    v = mgga_variables(na, nb, gaa, gab, gbb, la, lb, ta, tb, Val(3))
    return mgga_x_br89_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.dens_threshold, p.params_a_at, p.params_a_gamma, p.zeta_threshold)
end

export mgga_x_br89_1, mgga_x_br89_1_defaults, mgga_x_br89_1_required
