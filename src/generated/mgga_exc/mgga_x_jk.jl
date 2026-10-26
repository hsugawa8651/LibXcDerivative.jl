# Auto-generated from the Libxc sources
# python/mgga_exc/mgga_x_jk.py -- do not edit by hand.
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
# args: rs, z, xt, xs0, xs1, u0, u1, t0, t1, dens_threshold, params_a_beta, params_a_gamma, zeta_threshold
const mgga_x_jk_energy = function (rs, z, xt, xs0, xs1, u0, u1, t0, t1, dens_threshold, params_a_beta, params_a_gamma, zeta_threshold)
    @inbounds begin
        cse_tmp_0 = z + 1
        cse_tmp_1 = (3 // 8) / (pi * rs ^ 3)
        cse_tmp_2 = xs0 ^ 4
        cse_tmp_3 = xs0 ^ 2
        cse_tmp_4 = NaNMath.sqrt(my_piecewise3(cse_tmp_3 > 1 // 16, cse_tmp_3, 1 // 16))
        cse_tmp_5 = params_a_beta * params_a_gamma
        cse_tmp_6 = 0.676994198375506 * 1.5874010519681994 * params_a_beta
        cse_tmp_7 = cse_tmp_0 <= zeta_threshold
        cse_tmp_8 = zeta_threshold - 1
        cse_tmp_9 = 1 - z
        cse_tmp_10 = cse_tmp_9 <= zeta_threshold
        cse_tmp_11 = -cse_tmp_8
        cse_tmp_12 = my_piecewise5(cse_tmp_7, cse_tmp_8, cse_tmp_10, cse_tmp_11, z) + 1
        cse_tmp_13 = NaNMath.pow(zeta_threshold, 1.3333333333333333)
        cse_tmp_14 = 0.184639691595506 * 1.8171205928321397 / (1.4645918875615234 * rs)
        cse_tmp_15 = xs1 ^ 4
        cse_tmp_16 = xs1 ^ 2
        cse_tmp_17 = NaNMath.sqrt(my_piecewise3(cse_tmp_16 > 1 // 16, cse_tmp_16, 1 // 16))
        cse_tmp_18 = my_piecewise5(cse_tmp_10, cse_tmp_8, cse_tmp_7, cse_tmp_11, -z) + 1
        my_piecewise3(cse_tmp_0 * cse_tmp_1 <= dens_threshold, 0, -cse_tmp_14 * (cse_tmp_2 * cse_tmp_6 / ((3 * cse_tmp_3 - 2 * u0) * (cse_tmp_5 * my_piecewise3(cse_tmp_3 < 1 // 16, -cse_tmp_2 / 6 + cse_tmp_3 - 1300075 // 226492416 * xs0 ^ 28 + (676039 // 104857600) * xs0 ^ 26 - 88179 // 12058624 * xs0 ^ 24 + (46189 // 5505024) * xs0 ^ 22 - 12155 // 1245184 * xs0 ^ 20 + (6435 // 557056) * xs0 ^ 18 - 143 // 10240 * xs0 ^ 16 + (231 // 13312) * xs0 ^ 14 - 63 // 2816 * xs0 ^ 12 + (35 // 1152) * xs0 ^ 10 - 5 // 112 * xs0 ^ 8 + (3 // 40) * xs0 ^ 6, cse_tmp_4 * xc_asinh(cse_tmp_4)) + 1)) + 1) * my_piecewise3(cse_tmp_12 <= zeta_threshold, cse_tmp_13, NaNMath.pow(cse_tmp_12, 1.3333333333333333))) + my_piecewise3(cse_tmp_1 * cse_tmp_9 <= dens_threshold, 0, -cse_tmp_14 * (cse_tmp_15 * cse_tmp_6 / ((3 * cse_tmp_16 - 2 * u1) * (cse_tmp_5 * my_piecewise3(cse_tmp_16 < 1 // 16, -cse_tmp_15 / 6 + cse_tmp_16 - 1300075 // 226492416 * xs1 ^ 28 + (676039 // 104857600) * xs1 ^ 26 - 88179 // 12058624 * xs1 ^ 24 + (46189 // 5505024) * xs1 ^ 22 - 12155 // 1245184 * xs1 ^ 20 + (6435 // 557056) * xs1 ^ 18 - 143 // 10240 * xs1 ^ 16 + (231 // 13312) * xs1 ^ 14 - 63 // 2816 * xs1 ^ 12 + (35 // 1152) * xs1 ^ 10 - 5 // 112 * xs1 ^ 8 + (3 // 40) * xs1 ^ 6, cse_tmp_17 * xc_asinh(cse_tmp_17)) + 1)) + 1) * my_piecewise3(cse_tmp_18 <= zeta_threshold, cse_tmp_13, NaNMath.pow(cse_tmp_18, 1.3333333333333333)))
    end
end
export mgga_x_jk_energy

const mgga_x_jk_defaults = (dens_threshold = 1.0e-15, params_a_beta = 0.0586, params_a_gamma = 6.0, zeta_threshold = 2.220446049250313e-16)
const mgga_x_jk_required = ()

function mgga_x_jk(rho, sigma, lapl, tau; params = NamedTuple())
    p = resolve_params(mgga_x_jk_defaults, mgga_x_jk_required, params)
    v = mgga_variables(rho, sigma, lapl, tau, Val(3))
    return mgga_x_jk_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.dens_threshold, p.params_a_beta, p.params_a_gamma, p.zeta_threshold)
end

function mgga_x_jk(na, nb, gaa, gab, gbb, la, lb, ta, tb; params = NamedTuple())
    p = resolve_params(mgga_x_jk_defaults, mgga_x_jk_required, params)
    v = mgga_variables(na, nb, gaa, gab, gbb, la, lb, ta, tb, Val(3))
    return mgga_x_jk_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.dens_threshold, p.params_a_beta, p.params_a_gamma, p.zeta_threshold)
end

export mgga_x_jk, mgga_x_jk_defaults, mgga_x_jk_required
