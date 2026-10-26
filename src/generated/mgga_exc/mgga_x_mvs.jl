# Auto-generated from the Libxc sources
# python/mgga_exc/mgga_x_mvs.py -- do not edit by hand.
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
# args: rs, z, xt, xs0, xs1, u0, u1, t0, t1, dens_threshold, params_a_b, params_a_c1, params_a_e1, params_a_k0, zeta_threshold
const mgga_x_mvs_energy = function (rs, z, xt, xs0, xs1, u0, u1, t0, t1, dens_threshold, params_a_b, params_a_c1, params_a_e1, params_a_k0, zeta_threshold)
    @inbounds begin
        cse_tmp_0 = z + 1
        cse_tmp_1 = (3 // 8) / (pi * rs ^ 3)
        cse_tmp_2 = 3.3019272488946267 / 21.170591578193033
        cse_tmp_3 = cse_tmp_2 * params_a_b / 576
        cse_tmp_4 = t0 - xs0 ^ 2 / 8
        cse_tmp_5 = 1.8171205928321397
        cse_tmp_6 = (5 // 9) * cse_tmp_5 / 4.60115111447049
        cse_tmp_7 = (1250 // 2187) * cse_tmp_5 * params_a_c1 / 448.1939477706577
        cse_tmp_8 = (25 // 81) * cse_tmp_2 * params_a_e1
        cse_tmp_9 = cse_tmp_0 <= zeta_threshold
        cse_tmp_10 = zeta_threshold - 1
        cse_tmp_11 = 1 - z
        cse_tmp_12 = cse_tmp_11 <= zeta_threshold
        cse_tmp_13 = -cse_tmp_10
        cse_tmp_14 = my_piecewise5(cse_tmp_9, cse_tmp_10, cse_tmp_12, cse_tmp_13, z) + 1
        cse_tmp_15 = NaNMath.pow(zeta_threshold, 1.3333333333333333)
        cse_tmp_16 = 0.184639691595506 * cse_tmp_5 / (1.4645918875615234 * rs)
        cse_tmp_17 = t1 - xs1 ^ 2 / 8
        cse_tmp_18 = my_piecewise5(cse_tmp_12, cse_tmp_10, cse_tmp_9, cse_tmp_13, -z) + 1
        my_piecewise3(cse_tmp_0 * cse_tmp_1 <= dens_threshold, 0, -cse_tmp_16 * (params_a_k0 * (-cse_tmp_4 * cse_tmp_6 + 1) / NaNMath.pow(cse_tmp_4 ^ 4 * cse_tmp_7 + (cse_tmp_4 ^ 2 * cse_tmp_8 + 1) ^ 2, 0.25) + 1) * my_piecewise3(cse_tmp_14 <= zeta_threshold, cse_tmp_15, NaNMath.pow(cse_tmp_14, 1.3333333333333333)) / NaNMath.pow(cse_tmp_3 * xs0 ^ 4 + 1, 0.125)) + my_piecewise3(cse_tmp_1 * cse_tmp_11 <= dens_threshold, 0, -cse_tmp_16 * (params_a_k0 * (-cse_tmp_17 * cse_tmp_6 + 1) / NaNMath.pow(cse_tmp_17 ^ 4 * cse_tmp_7 + (cse_tmp_17 ^ 2 * cse_tmp_8 + 1) ^ 2, 0.25) + 1) * my_piecewise3(cse_tmp_18 <= zeta_threshold, cse_tmp_15, NaNMath.pow(cse_tmp_18, 1.3333333333333333)) / NaNMath.pow(cse_tmp_3 * xs1 ^ 4 + 1, 0.125))
    end
end
export mgga_x_mvs_energy

const mgga_x_mvs_defaults = (dens_threshold = 1.0e-15, params_a_b = 0.0233, params_a_c1 = 0.7438, params_a_e1 = -1.6665, params_a_k0 = 0.174, zeta_threshold = 2.220446049250313e-16)
const mgga_x_mvs_required = ()

function mgga_x_mvs(rho, sigma, lapl, tau; params = NamedTuple())
    p = resolve_params(mgga_x_mvs_defaults, mgga_x_mvs_required, params)
    v = mgga_variables(rho, sigma, lapl, tau, Val(3))
    return mgga_x_mvs_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.dens_threshold, p.params_a_b, p.params_a_c1, p.params_a_e1, p.params_a_k0, p.zeta_threshold)
end

function mgga_x_mvs(na, nb, gaa, gab, gbb, la, lb, ta, tb; params = NamedTuple())
    p = resolve_params(mgga_x_mvs_defaults, mgga_x_mvs_required, params)
    v = mgga_variables(na, nb, gaa, gab, gbb, la, lb, ta, tb, Val(3))
    return mgga_x_mvs_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.dens_threshold, p.params_a_b, p.params_a_c1, p.params_a_e1, p.params_a_k0, p.zeta_threshold)
end

export mgga_x_mvs, mgga_x_mvs_defaults, mgga_x_mvs_required
