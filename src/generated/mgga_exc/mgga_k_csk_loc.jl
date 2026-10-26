# Auto-generated from the Libxc sources
# python/mgga_exc/mgga_k_csk_loc.py -- do not edit by hand.
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
# args: rs, z, xt, xs0, xs1, u0, u1, t0, t1, XC_EPSILON, dens_threshold, params_a_csk_a, params_a_csk_cp, params_a_csk_cq, zeta_threshold
const mgga_k_csk_loc_energy = function (rs, z, xt, xs0, xs1, u0, u1, t0, t1, XC_EPSILON, dens_threshold, params_a_csk_a, params_a_csk_cp, params_a_csk_cq, zeta_threshold)
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
        cse_tmp_9 = xs0 ^ 2
        cse_tmp_10 = 1.8171205928321397 / 4.60115111447049
        cse_tmp_11 = (5 // 72) * cse_tmp_10
        cse_tmp_12 = cse_tmp_10 / 24
        cse_tmp_13 = cse_tmp_12 * params_a_csk_cq
        cse_tmp_14 = cse_tmp_12 * (params_a_csk_cp - 5 // 3)
        cse_tmp_15 = cse_tmp_13 * u0 + cse_tmp_14 * cse_tmp_9
        cse_tmp_16 = params_a_csk_a ^ (-1)
        cse_tmp_17 = -NaNMath.pow(-xc_log1p(-XC_EPSILON), -cse_tmp_16)
        cse_tmp_18 = -NaNMath.pow(-NaNMath.log(XC_EPSILON), -cse_tmp_16)
        cse_tmp_19 = cse_tmp_15 > cse_tmp_18
        cse_tmp_20 = my_piecewise3(cse_tmp_19, cse_tmp_18, cse_tmp_15)
        cse_tmp_21 = my_piecewise3(cse_tmp_20 > cse_tmp_17, cse_tmp_20, cse_tmp_17)
        cse_tmp_22 = NaNMath.pow(my_piecewise3(cse_tmp_21 >= 0, cse_tmp_21, -cse_tmp_21), params_a_csk_a)
        cse_tmp_23 = (9 // 80) * 2.2894284851066637 * 2.1450293971110255 / rs ^ 2
        cse_tmp_24 = my_piecewise5(cse_tmp_5, cse_tmp_3, cse_tmp_2, cse_tmp_6, -z)
        cse_tmp_25 = xs1 ^ 2
        cse_tmp_26 = cse_tmp_13 * u1 + cse_tmp_14 * cse_tmp_25
        cse_tmp_27 = cse_tmp_26 > cse_tmp_18
        cse_tmp_28 = my_piecewise3(cse_tmp_27, cse_tmp_18, cse_tmp_26)
        cse_tmp_29 = my_piecewise3(cse_tmp_28 > cse_tmp_17, cse_tmp_28, cse_tmp_17)
        cse_tmp_30 = NaNMath.pow(my_piecewise3(cse_tmp_29 >= 0, cse_tmp_29, -cse_tmp_29), params_a_csk_a)
        my_piecewise3(cse_tmp_0 * cse_tmp_1 <= dens_threshold, 0, cse_tmp_23 * (my_piecewise3(cse_tmp_7 + 1 <= zeta_threshold, cse_tmp_8, xc_expm1((5 // 3) * xc_log1p(my_piecewise3(cse_tmp_7 > cse_tmp_3, cse_tmp_7, cse_tmp_3)))) + 1) * (cse_tmp_11 * cse_tmp_9 + my_piecewise5(cse_tmp_15 < cse_tmp_17, 0, cse_tmp_19, cse_tmp_15, -NaNMath.pow(-cse_tmp_22 * xc_expm1(-1 / cse_tmp_22), cse_tmp_16)) + 1)) + my_piecewise3(cse_tmp_1 * cse_tmp_4 <= dens_threshold, 0, cse_tmp_23 * (my_piecewise3(cse_tmp_24 + 1 <= zeta_threshold, cse_tmp_8, xc_expm1((5 // 3) * xc_log1p(my_piecewise3(cse_tmp_24 > cse_tmp_3, cse_tmp_24, cse_tmp_3)))) + 1) * (cse_tmp_11 * cse_tmp_25 + my_piecewise5(cse_tmp_26 < cse_tmp_17, 0, cse_tmp_27, cse_tmp_26, -NaNMath.pow(-cse_tmp_30 * xc_expm1(-1 / cse_tmp_30), cse_tmp_16)) + 1))
    end
end
export mgga_k_csk_loc_energy

const mgga_k_csk_loc_defaults = (XC_EPSILON = 2.220446049250313e-16,)
const mgga_k_csk_loc_required = (:dens_threshold, :params_a_csk_a, :params_a_csk_cp, :params_a_csk_cq, :zeta_threshold)

function mgga_k_csk_loc(rho, sigma, lapl, tau; params = NamedTuple())
    p = resolve_params(mgga_k_csk_loc_defaults, mgga_k_csk_loc_required, params)
    v = mgga_variables(rho, sigma, lapl, tau, Val(3))
    return mgga_k_csk_loc_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.XC_EPSILON, p.dens_threshold, p.params_a_csk_a, p.params_a_csk_cp, p.params_a_csk_cq, p.zeta_threshold)
end

function mgga_k_csk_loc(na, nb, gaa, gab, gbb, la, lb, ta, tb; params = NamedTuple())
    p = resolve_params(mgga_k_csk_loc_defaults, mgga_k_csk_loc_required, params)
    v = mgga_variables(na, nb, gaa, gab, gbb, la, lb, ta, tb, Val(3))
    return mgga_k_csk_loc_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.XC_EPSILON, p.dens_threshold, p.params_a_csk_a, p.params_a_csk_cp, p.params_a_csk_cq, p.zeta_threshold)
end

export mgga_k_csk_loc, mgga_k_csk_loc_defaults, mgga_k_csk_loc_required

const mgga_k_csk_loc1_defaults = (XC_EPSILON = 2.220446049250313e-16, dens_threshold = 1.0e-15, params_a_csk_a = 1.0, params_a_csk_cp = -0.275, params_a_csk_cq = 2.895, zeta_threshold = 2.220446049250313e-16)
const mgga_k_csk_loc1_required = ()

function mgga_k_csk_loc1(rho, sigma, lapl, tau; params = NamedTuple())
    p = resolve_params(mgga_k_csk_loc1_defaults, mgga_k_csk_loc1_required, params)
    v = mgga_variables(rho, sigma, lapl, tau, Val(3))
    return mgga_k_csk_loc_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.XC_EPSILON, p.dens_threshold, p.params_a_csk_a, p.params_a_csk_cp, p.params_a_csk_cq, p.zeta_threshold)
end

function mgga_k_csk_loc1(na, nb, gaa, gab, gbb, la, lb, ta, tb; params = NamedTuple())
    p = resolve_params(mgga_k_csk_loc1_defaults, mgga_k_csk_loc1_required, params)
    v = mgga_variables(na, nb, gaa, gab, gbb, la, lb, ta, tb, Val(3))
    return mgga_k_csk_loc_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.XC_EPSILON, p.dens_threshold, p.params_a_csk_a, p.params_a_csk_cp, p.params_a_csk_cq, p.zeta_threshold)
end

export mgga_k_csk_loc1, mgga_k_csk_loc1_defaults, mgga_k_csk_loc1_required

const mgga_k_csk_loc4_defaults = (XC_EPSILON = 2.220446049250313e-16, dens_threshold = 1.0e-15, params_a_csk_a = 4.0, params_a_csk_cp = -0.275, params_a_csk_cq = 2.895, zeta_threshold = 2.220446049250313e-16)
const mgga_k_csk_loc4_required = ()

function mgga_k_csk_loc4(rho, sigma, lapl, tau; params = NamedTuple())
    p = resolve_params(mgga_k_csk_loc4_defaults, mgga_k_csk_loc4_required, params)
    v = mgga_variables(rho, sigma, lapl, tau, Val(3))
    return mgga_k_csk_loc_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.XC_EPSILON, p.dens_threshold, p.params_a_csk_a, p.params_a_csk_cp, p.params_a_csk_cq, p.zeta_threshold)
end

function mgga_k_csk_loc4(na, nb, gaa, gab, gbb, la, lb, ta, tb; params = NamedTuple())
    p = resolve_params(mgga_k_csk_loc4_defaults, mgga_k_csk_loc4_required, params)
    v = mgga_variables(na, nb, gaa, gab, gbb, la, lb, ta, tb, Val(3))
    return mgga_k_csk_loc_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.XC_EPSILON, p.dens_threshold, p.params_a_csk_a, p.params_a_csk_cp, p.params_a_csk_cq, p.zeta_threshold)
end

export mgga_k_csk_loc4, mgga_k_csk_loc4_defaults, mgga_k_csk_loc4_required
