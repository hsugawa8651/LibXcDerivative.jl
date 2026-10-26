# Auto-generated from the Libxc sources
# python/mgga_exc/mgga_x_gvt4.py -- do not edit by hand.
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
# args: rs, z, xt, xs0, xs1, u0, u1, t0, t1, dens_threshold, zeta_threshold
const mgga_x_gvt4_energy = function (rs, z, xt, xs0, xs1, u0, u1, t0, t1, dens_threshold, zeta_threshold)
    @inbounds begin
        cse_tmp_0 = z + 1
        cse_tmp_1 = (3 // 8) / (pi * rs ^ 3)
        cse_tmp_2 = xs0 ^ 2
        cse_tmp_3 = 3.3019272488946267 * 4.60115111447049
        cse_tmp_4 = 1 - 0.001120356 * cse_tmp_3
        cse_tmp_5 = 0.00186726 * cse_tmp_2 + cse_tmp_4 + 0.00373452 * t0
        cse_tmp_6 = 0.0037501956 * cse_tmp_3
        cse_tmp_7 = -3 // 5 * cse_tmp_3
        cse_tmp_8 = cse_tmp_7 + 2 * t0
        cse_tmp_9 = cse_tmp_0 <= zeta_threshold
        cse_tmp_10 = zeta_threshold - 1
        cse_tmp_11 = 1 - z
        cse_tmp_12 = cse_tmp_11 <= zeta_threshold
        cse_tmp_13 = -cse_tmp_10
        cse_tmp_14 = my_piecewise5(cse_tmp_9, cse_tmp_10, cse_tmp_12, cse_tmp_13, z) + 1
        cse_tmp_15 = NaNMath.pow(zeta_threshold, 1.3333333333333333)
        cse_tmp_16 = 1.4422495703074083 / (4 * 1.4645918875615234 * rs)
        cse_tmp_17 = xs1 ^ 2
        cse_tmp_18 = 0.00186726 * cse_tmp_17 + cse_tmp_4 + 0.00373452 * t1
        cse_tmp_19 = cse_tmp_7 + 2 * t1
        cse_tmp_20 = my_piecewise5(cse_tmp_12, cse_tmp_10, cse_tmp_9, cse_tmp_13, -z) + 1
        my_piecewise3(cse_tmp_0 * cse_tmp_1 <= dens_threshold, 0, -cse_tmp_16 * (0.9800683 / cse_tmp_5 - (-0.003556788 * cse_tmp_2 - cse_tmp_6 + 0.012500652 * t0) / cse_tmp_5 ^ 2 - (-0.0001282732 * cse_tmp_2 * cse_tmp_8 + 0.0003574822 * cse_tmp_8 ^ 2 - 2.354518e-5 * xs0 ^ 4) / cse_tmp_5 ^ 3) * my_piecewise3(cse_tmp_14 <= zeta_threshold, cse_tmp_15, NaNMath.pow(cse_tmp_14, 1.3333333333333333))) + my_piecewise3(cse_tmp_1 * cse_tmp_11 <= dens_threshold, 0, -cse_tmp_16 * (0.9800683 / cse_tmp_18 - (-0.003556788 * cse_tmp_17 - cse_tmp_6 + 0.012500652 * t1) / cse_tmp_18 ^ 2 - (-0.0001282732 * cse_tmp_17 * cse_tmp_19 + 0.0003574822 * cse_tmp_19 ^ 2 - 2.354518e-5 * xs1 ^ 4) / cse_tmp_18 ^ 3) * my_piecewise3(cse_tmp_20 <= zeta_threshold, cse_tmp_15, NaNMath.pow(cse_tmp_20, 1.3333333333333333)))
    end
end
export mgga_x_gvt4_energy

const mgga_x_gvt4_defaults = (dens_threshold = 1.0e-15, zeta_threshold = 2.220446049250313e-16)
const mgga_x_gvt4_required = ()

function mgga_x_gvt4(rho, sigma, lapl, tau; params = NamedTuple())
    p = resolve_params(mgga_x_gvt4_defaults, mgga_x_gvt4_required, params)
    v = mgga_variables(rho, sigma, lapl, tau, Val(3))
    return mgga_x_gvt4_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.dens_threshold, p.zeta_threshold)
end

function mgga_x_gvt4(na, nb, gaa, gab, gbb, la, lb, ta, tb; params = NamedTuple())
    p = resolve_params(mgga_x_gvt4_defaults, mgga_x_gvt4_required, params)
    v = mgga_variables(na, nb, gaa, gab, gbb, la, lb, ta, tb, Val(3))
    return mgga_x_gvt4_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.dens_threshold, p.zeta_threshold)
end

export mgga_x_gvt4, mgga_x_gvt4_defaults, mgga_x_gvt4_required
