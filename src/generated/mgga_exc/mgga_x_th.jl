# Auto-generated from the Libxc sources
# python/mgga_exc/mgga_x_th.py -- do not edit by hand.
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
# args: rs, z, xt, xs0, xs1, u0, u1, t0, t1, dens_threshold, zeta_threshold
const mgga_x_th_energy = function (rs, z, xt, xs0, xs1, u0, u1, t0, t1, dens_threshold, zeta_threshold)
    @inbounds begin
        cse_tmp_0 = z + 1
        cse_tmp_1 = (3 // 8) / (pi * rs ^ 3)
        cse_tmp_2 = t0 ^ (-1)
        cse_tmp_3 = cse_tmp_0 <= zeta_threshold
        cse_tmp_4 = zeta_threshold - 1
        cse_tmp_5 = 1 - z
        cse_tmp_6 = cse_tmp_5 <= zeta_threshold
        cse_tmp_7 = -cse_tmp_4
        cse_tmp_8 = my_piecewise5(cse_tmp_3, cse_tmp_4, cse_tmp_6, cse_tmp_7, z) + 1
        cse_tmp_9 = NaNMath.pow(zeta_threshold, 1.3333333333333333)
        cse_tmp_10 = (27 // 80) * 1.4422495703074083 * 2.1450293971110255 / rs
        cse_tmp_11 = t1 ^ (-1)
        cse_tmp_12 = my_piecewise5(cse_tmp_6, cse_tmp_4, cse_tmp_3, cse_tmp_7, -z) + 1
        my_piecewise3(cse_tmp_0 * cse_tmp_1 <= dens_threshold, 0, -cse_tmp_10 * cse_tmp_2 * ((7 // 216) * cse_tmp_2 * xs0 ^ 2 + 1) * my_piecewise3(cse_tmp_8 <= zeta_threshold, cse_tmp_9, NaNMath.pow(cse_tmp_8, 1.3333333333333333))) + my_piecewise3(cse_tmp_1 * cse_tmp_5 <= dens_threshold, 0, -cse_tmp_10 * cse_tmp_11 * ((7 // 216) * cse_tmp_11 * xs1 ^ 2 + 1) * my_piecewise3(cse_tmp_12 <= zeta_threshold, cse_tmp_9, NaNMath.pow(cse_tmp_12, 1.3333333333333333)))
    end
end
export mgga_x_th_energy

const mgga_x_th_defaults = (dens_threshold = 1.0e-15, zeta_threshold = 2.220446049250313e-16)
const mgga_x_th_required = ()

function mgga_x_th(rho, sigma, lapl, tau; params = NamedTuple())
    p = resolve_params(mgga_x_th_defaults, mgga_x_th_required, params)
    v = mgga_variables(rho, sigma, lapl, tau, Val(3))
    return mgga_x_th_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.dens_threshold, p.zeta_threshold)
end

function mgga_x_th(na, nb, gaa, gab, gbb, la, lb, ta, tb; params = NamedTuple())
    p = resolve_params(mgga_x_th_defaults, mgga_x_th_required, params)
    v = mgga_variables(na, nb, gaa, gab, gbb, la, lb, ta, tb, Val(3))
    return mgga_x_th_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.dens_threshold, p.zeta_threshold)
end

export mgga_x_th, mgga_x_th_defaults, mgga_x_th_required
