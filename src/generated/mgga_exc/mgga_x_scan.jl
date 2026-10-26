# Auto-generated from the Libxc sources
# python/mgga_exc/mgga_x_scan.py -- do not edit by hand.
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
# args: rs, z, xt, xs0, xs1, u0, u1, t0, t1, XC_EPSILON, dens_threshold, params_a_c1, params_a_c2, params_a_d, params_a_k1, zeta_threshold
const mgga_x_scan_energy = function (rs, z, xt, xs0, xs1, u0, u1, t0, t1, XC_EPSILON, dens_threshold, params_a_c1, params_a_c2, params_a_d, params_a_k1, zeta_threshold)
    @inbounds begin
        cse_tmp_0 = z + 1
        cse_tmp_1 = (3 // 8) / (pi * rs ^ 3)
        cse_tmp_2 = xs0 ^ 2
        cse_tmp_3 = 1.8171205928321397
        cse_tmp_4 = 0.2173369174628993
        cse_tmp_5 = cse_tmp_3 * cse_tmp_4
        cse_tmp_6 = (5 // 9) * cse_tmp_5
        cse_tmp_7 = cse_tmp_6 * (-cse_tmp_2 / 8 + t0)
        cse_tmp_8 = NaNMath.log(XC_EPSILON)
        cse_tmp_9 = -cse_tmp_8 / (-cse_tmp_8 + params_a_c1)
        cse_tmp_10 = my_piecewise3(cse_tmp_9 > cse_tmp_7, cse_tmp_7, cse_tmp_9)
        cse_tmp_11 = NaNMath.log(XC_EPSILON / my_piecewise3(params_a_d >= 0, params_a_d, -params_a_d))
        cse_tmp_12 = -(-cse_tmp_11 + params_a_c2) / cse_tmp_11
        cse_tmp_13 = my_piecewise3(cse_tmp_7 <= 1, my_piecewise3(cse_tmp_7 > cse_tmp_9, 0, exp(-cse_tmp_10 * params_a_c1 / (1 - cse_tmp_10))), my_piecewise3(cse_tmp_7 < cse_tmp_12, 0, -params_a_d * exp(params_a_c2 / (1 - my_piecewise3(cse_tmp_12 > cse_tmp_7, cse_tmp_12, cse_tmp_7)))))
        cse_tmp_14 = cse_tmp_2 * cse_tmp_5
        cse_tmp_15 = 73 // 648 - 100 // 6561 / params_a_k1
        cse_tmp_16 = (27 // 80) * cse_tmp_15
        cse_tmp_17 = -3.3019272488946267 * cse_tmp_15 / (576 * 21.170591578193033)
        cse_tmp_18 = (7 // 12960) * 1.7817974362806785 * 1.4422495703074083 * 8.54400374531753 * cse_tmp_4
        cse_tmp_19 = 1 - cse_tmp_7
        cse_tmp_20 = 12.083045973594572 / 100
        cse_tmp_21 = (5 // 972) * cse_tmp_14 + cse_tmp_17 * xs0 ^ 4 * exp(cse_tmp_14 * cse_tmp_16) + (cse_tmp_18 * cse_tmp_2 + cse_tmp_19 * cse_tmp_20 * exp(-cse_tmp_19 ^ 2 / 2)) ^ 2
        cse_tmp_22 = cse_tmp_14 / 24
        cse_tmp_23 = NaNMath.pow(XC_EPSILON, 1.3333333333333333)
        cse_tmp_24 = 0.202105943935811 * NaNMath.pow(my_piecewise3(cse_tmp_22 > cse_tmp_23, cse_tmp_22, cse_tmp_23), 0.25)
        cse_tmp_25 = -1 / cse_tmp_8
        cse_tmp_26 = cse_tmp_0 <= zeta_threshold
        cse_tmp_27 = zeta_threshold - 1
        cse_tmp_28 = 1 - z
        cse_tmp_29 = cse_tmp_28 <= zeta_threshold
        cse_tmp_30 = -cse_tmp_27
        cse_tmp_31 = my_piecewise5(cse_tmp_26, cse_tmp_27, cse_tmp_29, cse_tmp_30, z) + 1
        cse_tmp_32 = NaNMath.pow(zeta_threshold, 1.3333333333333333)
        cse_tmp_33 = 0.184639691595506 * cse_tmp_3 / (1.4645918875615234 * rs)
        cse_tmp_34 = xs1 ^ 2
        cse_tmp_35 = cse_tmp_6 * (-cse_tmp_34 / 8 + t1)
        cse_tmp_36 = my_piecewise3(cse_tmp_9 > cse_tmp_35, cse_tmp_35, cse_tmp_9)
        cse_tmp_37 = my_piecewise3(cse_tmp_35 <= 1, my_piecewise3(cse_tmp_35 > cse_tmp_9, 0, exp(-cse_tmp_36 * params_a_c1 / (1 - cse_tmp_36))), my_piecewise3(cse_tmp_35 < cse_tmp_12, 0, -params_a_d * exp(params_a_c2 / (1 - my_piecewise3(cse_tmp_12 > cse_tmp_35, cse_tmp_12, cse_tmp_35)))))
        cse_tmp_38 = cse_tmp_34 * cse_tmp_5
        cse_tmp_39 = 1 - cse_tmp_35
        cse_tmp_40 = cse_tmp_17 * xs1 ^ 4 * exp(cse_tmp_16 * cse_tmp_38) + (5 // 972) * cse_tmp_38 + (cse_tmp_18 * cse_tmp_34 + cse_tmp_20 * cse_tmp_39 * exp(-cse_tmp_39 ^ 2 / 2)) ^ 2
        cse_tmp_41 = cse_tmp_38 / 24
        cse_tmp_42 = 0.202105943935811 * NaNMath.pow(my_piecewise3(cse_tmp_41 > cse_tmp_23, cse_tmp_41, cse_tmp_23), 0.25)
        cse_tmp_43 = my_piecewise5(cse_tmp_29, cse_tmp_27, cse_tmp_26, cse_tmp_30, -z) + 1
        my_piecewise3(cse_tmp_0 * cse_tmp_1 <= dens_threshold, 0, -cse_tmp_33 * (1.174 * cse_tmp_13 + (1 - cse_tmp_13) * (cse_tmp_21 * params_a_k1 / (cse_tmp_21 + params_a_k1) + 1)) * my_piecewise3(cse_tmp_24 <= cse_tmp_25, 1, -xc_expm1(-1 / my_piecewise3(cse_tmp_25 > cse_tmp_24, cse_tmp_25, cse_tmp_24))) * my_piecewise3(cse_tmp_31 <= zeta_threshold, cse_tmp_32, NaNMath.pow(cse_tmp_31, 1.3333333333333333))) + my_piecewise3(cse_tmp_1 * cse_tmp_28 <= dens_threshold, 0, -cse_tmp_33 * (1.174 * cse_tmp_37 + (1 - cse_tmp_37) * (cse_tmp_40 * params_a_k1 / (cse_tmp_40 + params_a_k1) + 1)) * my_piecewise3(cse_tmp_42 <= cse_tmp_25, 1, -xc_expm1(-1 / my_piecewise3(cse_tmp_25 > cse_tmp_42, cse_tmp_25, cse_tmp_42))) * my_piecewise3(cse_tmp_43 <= zeta_threshold, cse_tmp_32, NaNMath.pow(cse_tmp_43, 1.3333333333333333)))
    end
end
export mgga_x_scan_energy

const mgga_x_scan_defaults = (XC_EPSILON = 2.220446049250313e-16, dens_threshold = 1.0e-15, params_a_c1 = 0.667, params_a_c2 = 0.8, params_a_d = 1.24, params_a_k1 = 0.065, zeta_threshold = 2.220446049250313e-16)
const mgga_x_scan_required = ()

function mgga_x_scan(rho, sigma, lapl, tau; params = NamedTuple())
    p = resolve_params(mgga_x_scan_defaults, mgga_x_scan_required, params)
    v = mgga_variables(rho, sigma, lapl, tau, Val(3))
    return mgga_x_scan_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.XC_EPSILON, p.dens_threshold, p.params_a_c1, p.params_a_c2, p.params_a_d, p.params_a_k1, p.zeta_threshold)
end

function mgga_x_scan(na, nb, gaa, gab, gbb, la, lb, ta, tb; params = NamedTuple())
    p = resolve_params(mgga_x_scan_defaults, mgga_x_scan_required, params)
    v = mgga_variables(na, nb, gaa, gab, gbb, la, lb, ta, tb, Val(3))
    return mgga_x_scan_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.XC_EPSILON, p.dens_threshold, p.params_a_c1, p.params_a_c2, p.params_a_d, p.params_a_k1, p.zeta_threshold)
end

export mgga_x_scan, mgga_x_scan_defaults, mgga_x_scan_required

const mgga_x_revscan_defaults = (XC_EPSILON = 2.220446049250313e-16, dens_threshold = 1.0e-15, params_a_c1 = 0.607, params_a_c2 = 0.7, params_a_d = 1.37, params_a_k1 = 0.065, zeta_threshold = 2.220446049250313e-16)
const mgga_x_revscan_required = ()

function mgga_x_revscan(rho, sigma, lapl, tau; params = NamedTuple())
    p = resolve_params(mgga_x_revscan_defaults, mgga_x_revscan_required, params)
    v = mgga_variables(rho, sigma, lapl, tau, Val(3))
    return mgga_x_scan_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.XC_EPSILON, p.dens_threshold, p.params_a_c1, p.params_a_c2, p.params_a_d, p.params_a_k1, p.zeta_threshold)
end

function mgga_x_revscan(na, nb, gaa, gab, gbb, la, lb, ta, tb; params = NamedTuple())
    p = resolve_params(mgga_x_revscan_defaults, mgga_x_revscan_required, params)
    v = mgga_variables(na, nb, gaa, gab, gbb, la, lb, ta, tb, Val(3))
    return mgga_x_scan_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.XC_EPSILON, p.dens_threshold, p.params_a_c1, p.params_a_c2, p.params_a_d, p.params_a_k1, p.zeta_threshold)
end

export mgga_x_revscan, mgga_x_revscan_defaults, mgga_x_revscan_required
