# Auto-generated from the Libxc sources
# python/mgga_exc/mgga_k_gea2.py -- do not edit by hand.
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
# args: rs, z, xt, xs0, xs1, u0, u1, t0, t1, dens_threshold, zeta_threshold
const mgga_k_gea2_energy = function (rs, z, xt, xs0, xs1, u0, u1, t0, t1, dens_threshold, zeta_threshold)
    @inbounds begin
        cse_tmp_0 = z + 1
        cse_tmp_1 = (3 // 8) / (pi * rs ^ 3)
        cse_tmp_2 = cse_tmp_0 <= zeta_threshold
        cse_tmp_3 = zeta_threshold - 1
        cse_tmp_4 = 1 - z
        cse_tmp_5 = cse_tmp_4 <= zeta_threshold
        cse_tmp_6 = -cse_tmp_3
        cse_tmp_7 = my_piecewise5(cse_tmp_2, cse_tmp_3, cse_tmp_5, cse_tmp_6, z)
        cse_tmp_8 = NaNMath.pow(zeta_threshold, 1.6666666666666667) - 1
        cse_tmp_9 = 1.8171205928321397 / 4.60115111447049
        cse_tmp_10 = (5 // 54) * cse_tmp_9
        cse_tmp_11 = (5 // 648) * cse_tmp_9
        cse_tmp_12 = (9 // 80) * 2.2894284851066637 * 2.1450293971110255 / rs ^ 2
        cse_tmp_13 = my_piecewise5(cse_tmp_5, cse_tmp_3, cse_tmp_2, cse_tmp_6, -z)
        my_piecewise3(cse_tmp_0 * cse_tmp_1 <= dens_threshold, 0, cse_tmp_12 * (my_piecewise3(cse_tmp_7 + 1 <= zeta_threshold, cse_tmp_8, xc_expm1((5 // 3) * xc_log1p(my_piecewise3(cse_tmp_7 > cse_tmp_3, cse_tmp_7, cse_tmp_3)))) + 1) * (cse_tmp_10 * u0 + cse_tmp_11 * xs0 ^ 2 + 1)) + my_piecewise3(cse_tmp_1 * cse_tmp_4 <= dens_threshold, 0, cse_tmp_12 * (my_piecewise3(cse_tmp_13 + 1 <= zeta_threshold, cse_tmp_8, xc_expm1((5 // 3) * xc_log1p(my_piecewise3(cse_tmp_13 > cse_tmp_3, cse_tmp_13, cse_tmp_3)))) + 1) * (cse_tmp_10 * u1 + cse_tmp_11 * xs1 ^ 2 + 1))
    end
end
export mgga_k_gea2_energy

const mgga_k_gea2_defaults = (dens_threshold = 1.0e-15, zeta_threshold = 2.220446049250313e-16)
const mgga_k_gea2_required = ()

function mgga_k_gea2(rho, sigma, lapl, tau; params = NamedTuple())
    p = resolve_params(mgga_k_gea2_defaults, mgga_k_gea2_required, params)
    v = mgga_variables(rho, sigma, lapl, tau, Val(3))
    return mgga_k_gea2_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.dens_threshold, p.zeta_threshold)
end

function mgga_k_gea2(na, nb, gaa, gab, gbb, la, lb, ta, tb; params = NamedTuple())
    p = resolve_params(mgga_k_gea2_defaults, mgga_k_gea2_required, params)
    v = mgga_variables(na, nb, gaa, gab, gbb, la, lb, ta, tb, Val(3))
    return mgga_k_gea2_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.dens_threshold, p.zeta_threshold)
end

export mgga_k_gea2, mgga_k_gea2_defaults, mgga_k_gea2_required
