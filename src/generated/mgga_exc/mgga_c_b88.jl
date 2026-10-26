# Auto-generated from the Libxc sources
# python/mgga_exc/mgga_c_b88.py -- do not edit by hand.
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
# args: rs, z, xt, xs0, xs1, u0, u1, t0, t1, dens_threshold, zeta_threshold
const mgga_c_b88_energy = function (rs, z, xt, xs0, xs1, u0, u1, t0, t1, dens_threshold, zeta_threshold)
    @inbounds begin
        cse_tmp_0 = z + 1
        cse_tmp_1 = 0.3183098861837907
        cse_tmp_2 = rs ^ (-3)
        cse_tmp_3 = (3 // 8) * cse_tmp_1 * cse_tmp_2
        cse_tmp_4 = cse_tmp_0 * cse_tmp_3 <= dens_threshold
        cse_tmp_5 = xs0 ^ 2
        cse_tmp_6 = 0.00253872824390815 * 1.5874010519681994
        cse_tmp_7 = cse_tmp_5 * cse_tmp_6 / NaNMath.pow(0.007 * cse_tmp_5 + 1, 0.8) + 1
        cse_tmp_8 = cse_tmp_0 <= zeta_threshold
        cse_tmp_9 = zeta_threshold - 1
        cse_tmp_10 = 1 - z
        cse_tmp_11 = cse_tmp_10 <= zeta_threshold
        cse_tmp_12 = -cse_tmp_9
        cse_tmp_13 = my_piecewise5(cse_tmp_8, cse_tmp_9, cse_tmp_11, cse_tmp_12, z) + 1
        cse_tmp_14 = 1 / (NaNMath.pow(cse_tmp_13, 0.3333333333333333) * cse_tmp_7)
        cse_tmp_15 = 3.3019272488946267 * 1.4645918875615234 * rs
        cse_tmp_16 = 0.216638143480162 * cse_tmp_15
        cse_tmp_17 = 0.00274516554860881 * 2.080083823051904 / (2.1450293971110255 * rs ^ 2)
        cse_tmp_18 = cse_tmp_10 * cse_tmp_3 <= dens_threshold
        cse_tmp_19 = xs1 ^ 2
        cse_tmp_20 = cse_tmp_19 * cse_tmp_6 / NaNMath.pow(0.007 * cse_tmp_19 + 1, 0.8) + 1
        cse_tmp_21 = my_piecewise5(cse_tmp_11, cse_tmp_9, cse_tmp_8, cse_tmp_12, -z) + 1
        cse_tmp_22 = 1 / (cse_tmp_20 * NaNMath.pow(cse_tmp_21, 0.3333333333333333))
        cse_tmp_23 = 0.225664732791835 * cse_tmp_15
        cse_tmp_24 = 0.63 * my_piecewise3(cse_tmp_18, 0, cse_tmp_22 * cse_tmp_23) + 0.63 * my_piecewise3(cse_tmp_4, 0, cse_tmp_14 * cse_tmp_23)
        -0.15 * cse_tmp_0 * cse_tmp_1 * cse_tmp_10 * cse_tmp_2 * cse_tmp_24 * xc_x_minus_log1p(cse_tmp_24) + my_piecewise3(cse_tmp_18, 0, -cse_tmp_17 * NaNMath.pow(cse_tmp_21, 1.6666666666666667) * (-cse_tmp_19 / 4 + 2 * t1) * xc_x_minus_log1p(cse_tmp_16 * cse_tmp_22) / cse_tmp_20 ^ 3) + my_piecewise3(cse_tmp_4, 0, -NaNMath.pow(cse_tmp_13, 1.6666666666666667) * cse_tmp_17 * (-cse_tmp_5 / 4 + 2 * t0) * xc_x_minus_log1p(cse_tmp_14 * cse_tmp_16) / cse_tmp_7 ^ 3)
    end
end
export mgga_c_b88_energy

const mgga_c_b88_defaults = (dens_threshold = 1.0e-14, zeta_threshold = 2.220446049250313e-16)
const mgga_c_b88_required = ()

function mgga_c_b88(rho, sigma, lapl, tau; params = NamedTuple())
    p = resolve_params(mgga_c_b88_defaults, mgga_c_b88_required, params)
    v = mgga_variables(rho, sigma, lapl, tau, Val(3))
    return mgga_c_b88_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.dens_threshold, p.zeta_threshold)
end

function mgga_c_b88(na, nb, gaa, gab, gbb, la, lb, ta, tb; params = NamedTuple())
    p = resolve_params(mgga_c_b88_defaults, mgga_c_b88_required, params)
    v = mgga_variables(na, nb, gaa, gab, gbb, la, lb, ta, tb, Val(3))
    return mgga_c_b88_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.dens_threshold, p.zeta_threshold)
end

export mgga_c_b88, mgga_c_b88_defaults, mgga_c_b88_required
