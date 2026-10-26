# Auto-generated from the Libxc sources
# python/mgga_exc/mgga_x_mn12.py -- do not edit by hand.
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
# args: rs, z, xt, xs0, xs1, u0, u1, t0, t1, dens_threshold, params_a_c_0, params_a_c_1, params_a_c_2, params_a_c_3, params_a_c_4, params_a_c_5, params_a_c_6, params_a_c_7, params_a_c_8, params_a_c_9, params_a_c_10, params_a_c_11, params_a_c_12, params_a_c_13, params_a_c_14, params_a_c_15, params_a_c_16, params_a_c_17, params_a_c_18, params_a_c_19, params_a_c_20, params_a_c_21, params_a_c_22, params_a_c_23, params_a_c_24, params_a_c_25, params_a_c_26, params_a_c_27, params_a_c_28, params_a_c_29, params_a_c_30, params_a_c_31, params_a_c_32, params_a_c_33, params_a_c_34, params_a_c_35, params_a_c_36, params_a_c_37, params_a_c_38, params_a_c_39, zeta_threshold
const mgga_x_mn12_energy = function (rs, z, xt, xs0, xs1, u0, u1, t0, t1, dens_threshold, params_a_c_0, params_a_c_1, params_a_c_2, params_a_c_3, params_a_c_4, params_a_c_5, params_a_c_6, params_a_c_7, params_a_c_8, params_a_c_9, params_a_c_10, params_a_c_11, params_a_c_12, params_a_c_13, params_a_c_14, params_a_c_15, params_a_c_16, params_a_c_17, params_a_c_18, params_a_c_19, params_a_c_20, params_a_c_21, params_a_c_22, params_a_c_23, params_a_c_24, params_a_c_25, params_a_c_26, params_a_c_27, params_a_c_28, params_a_c_29, params_a_c_30, params_a_c_31, params_a_c_32, params_a_c_33, params_a_c_34, params_a_c_35, params_a_c_36, params_a_c_37, params_a_c_38, params_a_c_39, zeta_threshold)
    @inbounds begin
        cse_tmp_0 = z + 1
        cse_tmp_1 = (3 // 8) / (pi * rs ^ 3)
        cse_tmp_2 = 3.3019272488946267
        cse_tmp_3 = 4.60115111447049
        cse_tmp_4 = (3 // 10) * cse_tmp_2 * cse_tmp_3
        cse_tmp_5 = cse_tmp_4 + t0
        cse_tmp_6 = -3 // 10 * cse_tmp_2 * cse_tmp_3
        cse_tmp_7 = -cse_tmp_6 - t0
        cse_tmp_8 = cse_tmp_7 / cse_tmp_5
        cse_tmp_9 = cse_tmp_7 ^ 2 / cse_tmp_5 ^ 2
        cse_tmp_10 = cse_tmp_7 ^ 3 / cse_tmp_5 ^ 3
        cse_tmp_11 = cse_tmp_7 ^ 4 / cse_tmp_5 ^ 4
        cse_tmp_12 = 0.004 * xs0 ^ 2
        cse_tmp_13 = cse_tmp_12 + 1
        cse_tmp_14 = 1.6e-5 * xs0 ^ 4 / cse_tmp_13 ^ 2
        cse_tmp_15 = cse_tmp_0 <= zeta_threshold
        cse_tmp_16 = zeta_threshold - 1
        cse_tmp_17 = 1 - z
        cse_tmp_18 = cse_tmp_17 <= zeta_threshold
        cse_tmp_19 = -cse_tmp_16
        cse_tmp_20 = my_piecewise5(cse_tmp_15, cse_tmp_16, cse_tmp_18, cse_tmp_19, z) + 1
        cse_tmp_21 = 1.4645918875615234
        cse_tmp_22 = 0.266666666666667 * 2.080083823051904 * cse_tmp_21 * rs
        cse_tmp_23 = cse_tmp_22 * NaNMath.pow(cse_tmp_20 ^ (-1), 0.3333333333333333) + 1
        cse_tmp_24 = cse_tmp_23 ^ (-2)
        cse_tmp_25 = cse_tmp_12 / cse_tmp_13
        cse_tmp_26 = cse_tmp_23 ^ (-1)
        cse_tmp_27 = NaNMath.pow(zeta_threshold, 1.3333333333333333)
        cse_tmp_28 = 0.184639691595506 * 1.8171205928321397 / (cse_tmp_21 * rs)
        cse_tmp_29 = cse_tmp_4 + t1
        cse_tmp_30 = -cse_tmp_6 - t1
        cse_tmp_31 = cse_tmp_30 / cse_tmp_29
        cse_tmp_32 = cse_tmp_30 ^ 2 / cse_tmp_29 ^ 2
        cse_tmp_33 = cse_tmp_30 ^ 3 / cse_tmp_29 ^ 3
        cse_tmp_34 = cse_tmp_30 ^ 4 / cse_tmp_29 ^ 4
        cse_tmp_35 = 0.004 * xs1 ^ 2
        cse_tmp_36 = cse_tmp_35 + 1
        cse_tmp_37 = 1.6e-5 * xs1 ^ 4 / cse_tmp_36 ^ 2
        cse_tmp_38 = my_piecewise5(cse_tmp_18, cse_tmp_16, cse_tmp_15, cse_tmp_19, -z) + 1
        cse_tmp_39 = cse_tmp_22 * NaNMath.pow(cse_tmp_38 ^ (-1), 0.3333333333333333) + 1
        cse_tmp_40 = cse_tmp_39 ^ (-2)
        cse_tmp_41 = cse_tmp_35 / cse_tmp_36
        cse_tmp_42 = cse_tmp_39 ^ (-1)
        my_piecewise3(cse_tmp_0 * cse_tmp_1 <= dens_threshold, 0, -cse_tmp_28 * (cse_tmp_10 * params_a_c_3 + cse_tmp_11 * params_a_c_4 + cse_tmp_14 * cse_tmp_26 * (cse_tmp_8 * params_a_c_28 + cse_tmp_9 * params_a_c_29 + params_a_c_27) + cse_tmp_14 * (cse_tmp_10 * params_a_c_14 + cse_tmp_8 * params_a_c_12 + cse_tmp_9 * params_a_c_13 + params_a_c_11) + cse_tmp_24 * cse_tmp_25 * (cse_tmp_8 * params_a_c_35 + cse_tmp_9 * params_a_c_36 + params_a_c_34) + cse_tmp_24 * (cse_tmp_10 * params_a_c_33 + cse_tmp_8 * params_a_c_31 + cse_tmp_9 * params_a_c_32 + params_a_c_30) + cse_tmp_25 * cse_tmp_26 * (cse_tmp_10 * params_a_c_26 + cse_tmp_8 * params_a_c_24 + cse_tmp_9 * params_a_c_25 + params_a_c_23) + cse_tmp_25 * (cse_tmp_10 * params_a_c_9 + cse_tmp_11 * params_a_c_10 + cse_tmp_8 * params_a_c_7 + cse_tmp_9 * params_a_c_8 + params_a_c_6) + cse_tmp_26 * (cse_tmp_10 * params_a_c_21 + cse_tmp_11 * params_a_c_22 + cse_tmp_8 * params_a_c_19 + cse_tmp_9 * params_a_c_20 + params_a_c_18) + cse_tmp_8 * params_a_c_1 + cse_tmp_9 * params_a_c_2 + params_a_c_0 + cse_tmp_7 ^ 5 * params_a_c_5 / cse_tmp_5 ^ 5 + (cse_tmp_8 * params_a_c_38 + cse_tmp_9 * params_a_c_39 + params_a_c_37) / cse_tmp_23 ^ 3 + 6.4e-8 * xs0 ^ 6 * (cse_tmp_8 * params_a_c_16 + cse_tmp_9 * params_a_c_17 + params_a_c_15) / cse_tmp_13 ^ 3) * my_piecewise3(cse_tmp_20 <= zeta_threshold, cse_tmp_27, NaNMath.pow(cse_tmp_20, 1.3333333333333333))) + my_piecewise3(cse_tmp_1 * cse_tmp_17 <= dens_threshold, 0, -cse_tmp_28 * (cse_tmp_31 * params_a_c_1 + cse_tmp_32 * params_a_c_2 + cse_tmp_33 * params_a_c_3 + cse_tmp_34 * params_a_c_4 + cse_tmp_37 * cse_tmp_42 * (cse_tmp_31 * params_a_c_28 + cse_tmp_32 * params_a_c_29 + params_a_c_27) + cse_tmp_37 * (cse_tmp_31 * params_a_c_12 + cse_tmp_32 * params_a_c_13 + cse_tmp_33 * params_a_c_14 + params_a_c_11) + cse_tmp_40 * cse_tmp_41 * (cse_tmp_31 * params_a_c_35 + cse_tmp_32 * params_a_c_36 + params_a_c_34) + cse_tmp_40 * (cse_tmp_31 * params_a_c_31 + cse_tmp_32 * params_a_c_32 + cse_tmp_33 * params_a_c_33 + params_a_c_30) + cse_tmp_41 * cse_tmp_42 * (cse_tmp_31 * params_a_c_24 + cse_tmp_32 * params_a_c_25 + cse_tmp_33 * params_a_c_26 + params_a_c_23) + cse_tmp_41 * (cse_tmp_31 * params_a_c_7 + cse_tmp_32 * params_a_c_8 + cse_tmp_33 * params_a_c_9 + cse_tmp_34 * params_a_c_10 + params_a_c_6) + cse_tmp_42 * (cse_tmp_31 * params_a_c_19 + cse_tmp_32 * params_a_c_20 + cse_tmp_33 * params_a_c_21 + cse_tmp_34 * params_a_c_22 + params_a_c_18) + params_a_c_0 + (cse_tmp_31 * params_a_c_38 + cse_tmp_32 * params_a_c_39 + params_a_c_37) / cse_tmp_39 ^ 3 + 6.4e-8 * xs1 ^ 6 * (cse_tmp_31 * params_a_c_16 + cse_tmp_32 * params_a_c_17 + params_a_c_15) / cse_tmp_36 ^ 3 + cse_tmp_30 ^ 5 * params_a_c_5 / cse_tmp_29 ^ 5) * my_piecewise3(cse_tmp_38 <= zeta_threshold, cse_tmp_27, NaNMath.pow(cse_tmp_38, 1.3333333333333333)))
    end
end
export mgga_x_mn12_energy

const mgga_x_mn12_defaults = NamedTuple()
const mgga_x_mn12_required = (:dens_threshold, :params_a_c_0, :params_a_c_1, :params_a_c_2, :params_a_c_3, :params_a_c_4, :params_a_c_5, :params_a_c_6, :params_a_c_7, :params_a_c_8, :params_a_c_9, :params_a_c_10, :params_a_c_11, :params_a_c_12, :params_a_c_13, :params_a_c_14, :params_a_c_15, :params_a_c_16, :params_a_c_17, :params_a_c_18, :params_a_c_19, :params_a_c_20, :params_a_c_21, :params_a_c_22, :params_a_c_23, :params_a_c_24, :params_a_c_25, :params_a_c_26, :params_a_c_27, :params_a_c_28, :params_a_c_29, :params_a_c_30, :params_a_c_31, :params_a_c_32, :params_a_c_33, :params_a_c_34, :params_a_c_35, :params_a_c_36, :params_a_c_37, :params_a_c_38, :params_a_c_39, :zeta_threshold)

function mgga_x_mn12(rho, sigma, lapl, tau; params = NamedTuple())
    p = resolve_params(mgga_x_mn12_defaults, mgga_x_mn12_required, params)
    v = mgga_variables(rho, sigma, lapl, tau, Val(3))
    return mgga_x_mn12_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.dens_threshold, p.params_a_c_0, p.params_a_c_1, p.params_a_c_2, p.params_a_c_3, p.params_a_c_4, p.params_a_c_5, p.params_a_c_6, p.params_a_c_7, p.params_a_c_8, p.params_a_c_9, p.params_a_c_10, p.params_a_c_11, p.params_a_c_12, p.params_a_c_13, p.params_a_c_14, p.params_a_c_15, p.params_a_c_16, p.params_a_c_17, p.params_a_c_18, p.params_a_c_19, p.params_a_c_20, p.params_a_c_21, p.params_a_c_22, p.params_a_c_23, p.params_a_c_24, p.params_a_c_25, p.params_a_c_26, p.params_a_c_27, p.params_a_c_28, p.params_a_c_29, p.params_a_c_30, p.params_a_c_31, p.params_a_c_32, p.params_a_c_33, p.params_a_c_34, p.params_a_c_35, p.params_a_c_36, p.params_a_c_37, p.params_a_c_38, p.params_a_c_39, p.zeta_threshold)
end

function mgga_x_mn12(na, nb, gaa, gab, gbb, la, lb, ta, tb; params = NamedTuple())
    p = resolve_params(mgga_x_mn12_defaults, mgga_x_mn12_required, params)
    v = mgga_variables(na, nb, gaa, gab, gbb, la, lb, ta, tb, Val(3))
    return mgga_x_mn12_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.dens_threshold, p.params_a_c_0, p.params_a_c_1, p.params_a_c_2, p.params_a_c_3, p.params_a_c_4, p.params_a_c_5, p.params_a_c_6, p.params_a_c_7, p.params_a_c_8, p.params_a_c_9, p.params_a_c_10, p.params_a_c_11, p.params_a_c_12, p.params_a_c_13, p.params_a_c_14, p.params_a_c_15, p.params_a_c_16, p.params_a_c_17, p.params_a_c_18, p.params_a_c_19, p.params_a_c_20, p.params_a_c_21, p.params_a_c_22, p.params_a_c_23, p.params_a_c_24, p.params_a_c_25, p.params_a_c_26, p.params_a_c_27, p.params_a_c_28, p.params_a_c_29, p.params_a_c_30, p.params_a_c_31, p.params_a_c_32, p.params_a_c_33, p.params_a_c_34, p.params_a_c_35, p.params_a_c_36, p.params_a_c_37, p.params_a_c_38, p.params_a_c_39, p.zeta_threshold)
end

export mgga_x_mn12, mgga_x_mn12_defaults, mgga_x_mn12_required

const hyb_mgga_x_cf22d_defaults = (dens_threshold = 1.0e-15, params_a_c_0 = 0.24416116, params_a_c_1 = -0.389728151, params_a_c_2 = -1.829675858, params_a_c_3 = 1.396044771, params_a_c_4 = 2.315047133, params_a_c_5 = 0.397552547, params_a_c_6 = 1.082144406, params_a_c_7 = -7.894560034, params_a_c_8 = -3.65625303, params_a_c_9 = 2.574496508, params_a_c_10 = 4.031038406, params_a_c_11 = -3.931389433, params_a_c_12 = 0.333519075, params_a_c_13 = -3.032270318, params_a_c_14 = 3.673752289, params_a_c_15 = 3.005997956, params_a_c_16 = -6.463733874, params_a_c_17 = -4.596755225, params_a_c_18 = 0.96483918, params_a_c_19 = 0.363791944, params_a_c_20 = 1.646506623, params_a_c_21 = -3.50464155, params_a_c_22 = -3.922228074, params_a_c_23 = 0.843718076, params_a_c_24 = 10.779373313, params_a_c_25 = 2.293612669, params_a_c_26 = 7.088363286, params_a_c_27 = 2.598770741, params_a_c_28 = -0.088522116, params_a_c_29 = 7.18080903, params_a_c_30 = -1.017514009, params_a_c_31 = 1.73502031, params_a_c_32 = 3.499241561, params_a_c_33 = 0.922224945, params_a_c_34 = -2.21290392, params_a_c_35 = 0.243080429, params_a_c_36 = 17.30632184, params_a_c_37 = 0.311402396, params_a_c_38 = -3.257126009, params_a_c_39 = -3.372399742, zeta_threshold = 2.220446049250313e-16)
const hyb_mgga_x_cf22d_required = ()

function hyb_mgga_x_cf22d(rho, sigma, lapl, tau; params = NamedTuple())
    p = resolve_params(hyb_mgga_x_cf22d_defaults, hyb_mgga_x_cf22d_required, params)
    v = mgga_variables(rho, sigma, lapl, tau, Val(3))
    return mgga_x_mn12_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.dens_threshold, p.params_a_c_0, p.params_a_c_1, p.params_a_c_2, p.params_a_c_3, p.params_a_c_4, p.params_a_c_5, p.params_a_c_6, p.params_a_c_7, p.params_a_c_8, p.params_a_c_9, p.params_a_c_10, p.params_a_c_11, p.params_a_c_12, p.params_a_c_13, p.params_a_c_14, p.params_a_c_15, p.params_a_c_16, p.params_a_c_17, p.params_a_c_18, p.params_a_c_19, p.params_a_c_20, p.params_a_c_21, p.params_a_c_22, p.params_a_c_23, p.params_a_c_24, p.params_a_c_25, p.params_a_c_26, p.params_a_c_27, p.params_a_c_28, p.params_a_c_29, p.params_a_c_30, p.params_a_c_31, p.params_a_c_32, p.params_a_c_33, p.params_a_c_34, p.params_a_c_35, p.params_a_c_36, p.params_a_c_37, p.params_a_c_38, p.params_a_c_39, p.zeta_threshold)
end

function hyb_mgga_x_cf22d(na, nb, gaa, gab, gbb, la, lb, ta, tb; params = NamedTuple())
    p = resolve_params(hyb_mgga_x_cf22d_defaults, hyb_mgga_x_cf22d_required, params)
    v = mgga_variables(na, nb, gaa, gab, gbb, la, lb, ta, tb, Val(3))
    return mgga_x_mn12_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.dens_threshold, p.params_a_c_0, p.params_a_c_1, p.params_a_c_2, p.params_a_c_3, p.params_a_c_4, p.params_a_c_5, p.params_a_c_6, p.params_a_c_7, p.params_a_c_8, p.params_a_c_9, p.params_a_c_10, p.params_a_c_11, p.params_a_c_12, p.params_a_c_13, p.params_a_c_14, p.params_a_c_15, p.params_a_c_16, p.params_a_c_17, p.params_a_c_18, p.params_a_c_19, p.params_a_c_20, p.params_a_c_21, p.params_a_c_22, p.params_a_c_23, p.params_a_c_24, p.params_a_c_25, p.params_a_c_26, p.params_a_c_27, p.params_a_c_28, p.params_a_c_29, p.params_a_c_30, p.params_a_c_31, p.params_a_c_32, p.params_a_c_33, p.params_a_c_34, p.params_a_c_35, p.params_a_c_36, p.params_a_c_37, p.params_a_c_38, p.params_a_c_39, p.zeta_threshold)
end

export hyb_mgga_x_cf22d, hyb_mgga_x_cf22d_defaults, hyb_mgga_x_cf22d_required

const hyb_mgga_x_mn12_sx_defaults = (dens_threshold = 1.0e-15, params_a_c_0 = 0.5226556, params_a_c_1 = -0.2681208, params_a_c_2 = -4.670705, params_a_c_3 = 3.06732, params_a_c_4 = 4.09537, params_a_c_5 = 2.653023, params_a_c_6 = 0.5165969, params_a_c_7 = -20.35442, params_a_c_8 = -9.946472, params_a_c_9 = 2.938637, params_a_c_10 = 11.311, params_a_c_11 = 4.752452, params_a_c_12 = -3.061331, params_a_c_13 = -25.23173, params_a_c_14 = 17.10903, params_a_c_15 = -23.5748, params_a_c_16 = -27.27754, params_a_c_17 = 16.03291, params_a_c_18 = 1.842503, params_a_c_19 = 1.92712, params_a_c_20 = 11.07987, params_a_c_21 = -11.82087, params_a_c_22 = -11.17768, params_a_c_23 = -5.821, params_a_c_24 = 22.66545, params_a_c_25 = 8.246708, params_a_c_26 = -4.778364, params_a_c_27 = 0.5329122, params_a_c_28 = -6.666755, params_a_c_29 = 1.671429, params_a_c_30 = -3.311409, params_a_c_31 = 0.3415913, params_a_c_32 = -6.413076, params_a_c_33 = 10.38584, params_a_c_34 = 9.026277, params_a_c_35 = 19.29689, params_a_c_36 = 26.69232, params_a_c_37 = 1.517278, params_a_c_38 = -3.442503, params_a_c_39 = 1.100161, zeta_threshold = 2.220446049250313e-16)
const hyb_mgga_x_mn12_sx_required = ()

function hyb_mgga_x_mn12_sx(rho, sigma, lapl, tau; params = NamedTuple())
    p = resolve_params(hyb_mgga_x_mn12_sx_defaults, hyb_mgga_x_mn12_sx_required, params)
    v = mgga_variables(rho, sigma, lapl, tau, Val(3))
    return mgga_x_mn12_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.dens_threshold, p.params_a_c_0, p.params_a_c_1, p.params_a_c_2, p.params_a_c_3, p.params_a_c_4, p.params_a_c_5, p.params_a_c_6, p.params_a_c_7, p.params_a_c_8, p.params_a_c_9, p.params_a_c_10, p.params_a_c_11, p.params_a_c_12, p.params_a_c_13, p.params_a_c_14, p.params_a_c_15, p.params_a_c_16, p.params_a_c_17, p.params_a_c_18, p.params_a_c_19, p.params_a_c_20, p.params_a_c_21, p.params_a_c_22, p.params_a_c_23, p.params_a_c_24, p.params_a_c_25, p.params_a_c_26, p.params_a_c_27, p.params_a_c_28, p.params_a_c_29, p.params_a_c_30, p.params_a_c_31, p.params_a_c_32, p.params_a_c_33, p.params_a_c_34, p.params_a_c_35, p.params_a_c_36, p.params_a_c_37, p.params_a_c_38, p.params_a_c_39, p.zeta_threshold)
end

function hyb_mgga_x_mn12_sx(na, nb, gaa, gab, gbb, la, lb, ta, tb; params = NamedTuple())
    p = resolve_params(hyb_mgga_x_mn12_sx_defaults, hyb_mgga_x_mn12_sx_required, params)
    v = mgga_variables(na, nb, gaa, gab, gbb, la, lb, ta, tb, Val(3))
    return mgga_x_mn12_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.dens_threshold, p.params_a_c_0, p.params_a_c_1, p.params_a_c_2, p.params_a_c_3, p.params_a_c_4, p.params_a_c_5, p.params_a_c_6, p.params_a_c_7, p.params_a_c_8, p.params_a_c_9, p.params_a_c_10, p.params_a_c_11, p.params_a_c_12, p.params_a_c_13, p.params_a_c_14, p.params_a_c_15, p.params_a_c_16, p.params_a_c_17, p.params_a_c_18, p.params_a_c_19, p.params_a_c_20, p.params_a_c_21, p.params_a_c_22, p.params_a_c_23, p.params_a_c_24, p.params_a_c_25, p.params_a_c_26, p.params_a_c_27, p.params_a_c_28, p.params_a_c_29, p.params_a_c_30, p.params_a_c_31, p.params_a_c_32, p.params_a_c_33, p.params_a_c_34, p.params_a_c_35, p.params_a_c_36, p.params_a_c_37, p.params_a_c_38, p.params_a_c_39, p.zeta_threshold)
end

export hyb_mgga_x_mn12_sx, hyb_mgga_x_mn12_sx_defaults, hyb_mgga_x_mn12_sx_required

const hyb_mgga_x_mn15_defaults = (dens_threshold = 1.0e-15, params_a_c_0 = 0.073852235, params_a_c_1 = -0.839976156, params_a_c_2 = -3.082660125, params_a_c_3 = -1.02881285, params_a_c_4 = -0.811697255, params_a_c_5 = -0.063404387, params_a_c_6 = 2.54805518, params_a_c_7 = -5.031578906, params_a_c_8 = 0.31702159, params_a_c_9 = 2.981868205, params_a_c_10 = -0.749503735, params_a_c_11 = 0.231825661, params_a_c_12 = 1.261961411, params_a_c_13 = 1.665920815, params_a_c_14 = 7.483304941, params_a_c_15 = -2.544245723, params_a_c_16 = 1.384720031, params_a_c_17 = 6.902569885, params_a_c_18 = 1.657399451, params_a_c_19 = 2.98526709, params_a_c_20 = 6.89391326, params_a_c_21 = 2.489813993, params_a_c_22 = 1.454724691, params_a_c_23 = -5.054324071, params_a_c_24 = 2.35273334, params_a_c_25 = 1.299104132, params_a_c_26 = 1.203168217, params_a_c_27 = 0.121595877, params_a_c_28 = 8.048348238, params_a_c_29 = 21.91203659, params_a_c_30 = -1.852335832, params_a_c_31 = -3.4722735, params_a_c_32 = -1.564591493, params_a_c_33 = -2.29578769, params_a_c_34 = 3.666482991, params_a_c_35 = 10.87074639, params_a_c_36 = 9.696691388, params_a_c_37 = 0.630701064, params_a_c_38 = -0.505825216, params_a_c_39 = -3.562354535, zeta_threshold = 2.220446049250313e-16)
const hyb_mgga_x_mn15_required = ()

function hyb_mgga_x_mn15(rho, sigma, lapl, tau; params = NamedTuple())
    p = resolve_params(hyb_mgga_x_mn15_defaults, hyb_mgga_x_mn15_required, params)
    v = mgga_variables(rho, sigma, lapl, tau, Val(3))
    return mgga_x_mn12_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.dens_threshold, p.params_a_c_0, p.params_a_c_1, p.params_a_c_2, p.params_a_c_3, p.params_a_c_4, p.params_a_c_5, p.params_a_c_6, p.params_a_c_7, p.params_a_c_8, p.params_a_c_9, p.params_a_c_10, p.params_a_c_11, p.params_a_c_12, p.params_a_c_13, p.params_a_c_14, p.params_a_c_15, p.params_a_c_16, p.params_a_c_17, p.params_a_c_18, p.params_a_c_19, p.params_a_c_20, p.params_a_c_21, p.params_a_c_22, p.params_a_c_23, p.params_a_c_24, p.params_a_c_25, p.params_a_c_26, p.params_a_c_27, p.params_a_c_28, p.params_a_c_29, p.params_a_c_30, p.params_a_c_31, p.params_a_c_32, p.params_a_c_33, p.params_a_c_34, p.params_a_c_35, p.params_a_c_36, p.params_a_c_37, p.params_a_c_38, p.params_a_c_39, p.zeta_threshold)
end

function hyb_mgga_x_mn15(na, nb, gaa, gab, gbb, la, lb, ta, tb; params = NamedTuple())
    p = resolve_params(hyb_mgga_x_mn15_defaults, hyb_mgga_x_mn15_required, params)
    v = mgga_variables(na, nb, gaa, gab, gbb, la, lb, ta, tb, Val(3))
    return mgga_x_mn12_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.dens_threshold, p.params_a_c_0, p.params_a_c_1, p.params_a_c_2, p.params_a_c_3, p.params_a_c_4, p.params_a_c_5, p.params_a_c_6, p.params_a_c_7, p.params_a_c_8, p.params_a_c_9, p.params_a_c_10, p.params_a_c_11, p.params_a_c_12, p.params_a_c_13, p.params_a_c_14, p.params_a_c_15, p.params_a_c_16, p.params_a_c_17, p.params_a_c_18, p.params_a_c_19, p.params_a_c_20, p.params_a_c_21, p.params_a_c_22, p.params_a_c_23, p.params_a_c_24, p.params_a_c_25, p.params_a_c_26, p.params_a_c_27, p.params_a_c_28, p.params_a_c_29, p.params_a_c_30, p.params_a_c_31, p.params_a_c_32, p.params_a_c_33, p.params_a_c_34, p.params_a_c_35, p.params_a_c_36, p.params_a_c_37, p.params_a_c_38, p.params_a_c_39, p.zeta_threshold)
end

export hyb_mgga_x_mn15, hyb_mgga_x_mn15_defaults, hyb_mgga_x_mn15_required

const mgga_x_mn12_l_defaults = (dens_threshold = 1.0e-15, params_a_c_0 = 0.6735981, params_a_c_1 = -2.270598, params_a_c_2 = -2.613712, params_a_c_3 = 3.993609, params_a_c_4 = 4.635575, params_a_c_5 = 1.250676, params_a_c_6 = 0.844492, params_a_c_7 = -13.01173, params_a_c_8 = -17.7773, params_a_c_9 = -4.627211, params_a_c_10 = 5.976605, params_a_c_11 = 1.142897, params_a_c_12 = -20.40226, params_a_c_13 = -23.82843, params_a_c_14 = 7.119109, params_a_c_15 = -23.35726, params_a_c_16 = -16.22633, params_a_c_17 = 14.82732, params_a_c_18 = 1.449285, params_a_c_19 = 10.20598, params_a_c_20 = 4.40745, params_a_c_21 = -20.08193, params_a_c_22 = -12.53561, params_a_c_23 = -5.435031, params_a_c_24 = 16.56736, params_a_c_25 = 20.00229, params_a_c_26 = -2.513105, params_a_c_27 = 9.658436, params_a_c_28 = -3.825281, params_a_c_29 = -25.0, params_a_c_30 = -2.07008, params_a_c_31 = -9.951913, params_a_c_32 = 0.8731211, params_a_c_33 = 22.10891, params_a_c_34 = 8.822633, params_a_c_35 = 24.99949, params_a_c_36 = 25.0, params_a_c_37 = 0.6851693, params_a_c_38 = -0.07406948, params_a_c_39 = -0.6788, zeta_threshold = 2.220446049250313e-16)
const mgga_x_mn12_l_required = ()

function mgga_x_mn12_l(rho, sigma, lapl, tau; params = NamedTuple())
    p = resolve_params(mgga_x_mn12_l_defaults, mgga_x_mn12_l_required, params)
    v = mgga_variables(rho, sigma, lapl, tau, Val(3))
    return mgga_x_mn12_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.dens_threshold, p.params_a_c_0, p.params_a_c_1, p.params_a_c_2, p.params_a_c_3, p.params_a_c_4, p.params_a_c_5, p.params_a_c_6, p.params_a_c_7, p.params_a_c_8, p.params_a_c_9, p.params_a_c_10, p.params_a_c_11, p.params_a_c_12, p.params_a_c_13, p.params_a_c_14, p.params_a_c_15, p.params_a_c_16, p.params_a_c_17, p.params_a_c_18, p.params_a_c_19, p.params_a_c_20, p.params_a_c_21, p.params_a_c_22, p.params_a_c_23, p.params_a_c_24, p.params_a_c_25, p.params_a_c_26, p.params_a_c_27, p.params_a_c_28, p.params_a_c_29, p.params_a_c_30, p.params_a_c_31, p.params_a_c_32, p.params_a_c_33, p.params_a_c_34, p.params_a_c_35, p.params_a_c_36, p.params_a_c_37, p.params_a_c_38, p.params_a_c_39, p.zeta_threshold)
end

function mgga_x_mn12_l(na, nb, gaa, gab, gbb, la, lb, ta, tb; params = NamedTuple())
    p = resolve_params(mgga_x_mn12_l_defaults, mgga_x_mn12_l_required, params)
    v = mgga_variables(na, nb, gaa, gab, gbb, la, lb, ta, tb, Val(3))
    return mgga_x_mn12_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.dens_threshold, p.params_a_c_0, p.params_a_c_1, p.params_a_c_2, p.params_a_c_3, p.params_a_c_4, p.params_a_c_5, p.params_a_c_6, p.params_a_c_7, p.params_a_c_8, p.params_a_c_9, p.params_a_c_10, p.params_a_c_11, p.params_a_c_12, p.params_a_c_13, p.params_a_c_14, p.params_a_c_15, p.params_a_c_16, p.params_a_c_17, p.params_a_c_18, p.params_a_c_19, p.params_a_c_20, p.params_a_c_21, p.params_a_c_22, p.params_a_c_23, p.params_a_c_24, p.params_a_c_25, p.params_a_c_26, p.params_a_c_27, p.params_a_c_28, p.params_a_c_29, p.params_a_c_30, p.params_a_c_31, p.params_a_c_32, p.params_a_c_33, p.params_a_c_34, p.params_a_c_35, p.params_a_c_36, p.params_a_c_37, p.params_a_c_38, p.params_a_c_39, p.zeta_threshold)
end

export mgga_x_mn12_l, mgga_x_mn12_l_defaults, mgga_x_mn12_l_required

const mgga_x_mn15_l_defaults = (dens_threshold = 1.0e-15, params_a_c_0 = 0.670864162, params_a_c_1 = -0.822003903, params_a_c_2 = -1.022407046, params_a_c_3 = 1.689460986, params_a_c_4 = -0.00562032, params_a_c_5 = -0.110293849, params_a_c_6 = 0.972245178, params_a_c_7 = -6.697641991, params_a_c_8 = -4.322814495, params_a_c_9 = -6.786641376, params_a_c_10 = -5.687461462, params_a_c_11 = 9.419643818, params_a_c_12 = 11.83939406, params_a_c_13 = 5.086951311, params_a_c_14 = 4.302369948, params_a_c_15 = -8.07344065, params_a_c_16 = 2.429988978, params_a_c_17 = 11.09485698, params_a_c_18 = 1.247333909, params_a_c_19 = 3.700485291, params_a_c_20 = 0.867791614, params_a_c_21 = -0.591190518, params_a_c_22 = -0.295305435, params_a_c_23 = -5.825759145, params_a_c_24 = 2.537532196, params_a_c_25 = 3.143390933, params_a_c_26 = 2.939126332, params_a_c_27 = 0.599342114, params_a_c_28 = 2.241702738, params_a_c_29 = 2.035713838, params_a_c_30 = -1.525344043, params_a_c_31 = -2.325875691, params_a_c_32 = 1.141940663, params_a_c_33 = -1.563165026, params_a_c_34 = 7.882032871, params_a_c_35 = 11.93400684, params_a_c_36 = 9.852928303, params_a_c_37 = 0.584030245, params_a_c_38 = -0.720941131, params_a_c_39 = -2.836037078, zeta_threshold = 2.220446049250313e-16)
const mgga_x_mn15_l_required = ()

function mgga_x_mn15_l(rho, sigma, lapl, tau; params = NamedTuple())
    p = resolve_params(mgga_x_mn15_l_defaults, mgga_x_mn15_l_required, params)
    v = mgga_variables(rho, sigma, lapl, tau, Val(3))
    return mgga_x_mn12_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.dens_threshold, p.params_a_c_0, p.params_a_c_1, p.params_a_c_2, p.params_a_c_3, p.params_a_c_4, p.params_a_c_5, p.params_a_c_6, p.params_a_c_7, p.params_a_c_8, p.params_a_c_9, p.params_a_c_10, p.params_a_c_11, p.params_a_c_12, p.params_a_c_13, p.params_a_c_14, p.params_a_c_15, p.params_a_c_16, p.params_a_c_17, p.params_a_c_18, p.params_a_c_19, p.params_a_c_20, p.params_a_c_21, p.params_a_c_22, p.params_a_c_23, p.params_a_c_24, p.params_a_c_25, p.params_a_c_26, p.params_a_c_27, p.params_a_c_28, p.params_a_c_29, p.params_a_c_30, p.params_a_c_31, p.params_a_c_32, p.params_a_c_33, p.params_a_c_34, p.params_a_c_35, p.params_a_c_36, p.params_a_c_37, p.params_a_c_38, p.params_a_c_39, p.zeta_threshold)
end

function mgga_x_mn15_l(na, nb, gaa, gab, gbb, la, lb, ta, tb; params = NamedTuple())
    p = resolve_params(mgga_x_mn15_l_defaults, mgga_x_mn15_l_required, params)
    v = mgga_variables(na, nb, gaa, gab, gbb, la, lb, ta, tb, Val(3))
    return mgga_x_mn12_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.dens_threshold, p.params_a_c_0, p.params_a_c_1, p.params_a_c_2, p.params_a_c_3, p.params_a_c_4, p.params_a_c_5, p.params_a_c_6, p.params_a_c_7, p.params_a_c_8, p.params_a_c_9, p.params_a_c_10, p.params_a_c_11, p.params_a_c_12, p.params_a_c_13, p.params_a_c_14, p.params_a_c_15, p.params_a_c_16, p.params_a_c_17, p.params_a_c_18, p.params_a_c_19, p.params_a_c_20, p.params_a_c_21, p.params_a_c_22, p.params_a_c_23, p.params_a_c_24, p.params_a_c_25, p.params_a_c_26, p.params_a_c_27, p.params_a_c_28, p.params_a_c_29, p.params_a_c_30, p.params_a_c_31, p.params_a_c_32, p.params_a_c_33, p.params_a_c_34, p.params_a_c_35, p.params_a_c_36, p.params_a_c_37, p.params_a_c_38, p.params_a_c_39, p.zeta_threshold)
end

export mgga_x_mn15_l, mgga_x_mn15_l_defaults, mgga_x_mn15_l_required
