# Auto-generated from the Libxc sources
# python/mgga_exc/mgga_x_m06l.py -- do not edit by hand.
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
# args: rs, z, xt, xs0, xs1, u0, u1, t0, t1, dens_threshold, params_a_a_0, params_a_a_1, params_a_a_2, params_a_a_3, params_a_a_4, params_a_a_5, params_a_a_6, params_a_a_7, params_a_a_8, params_a_a_9, params_a_a_10, params_a_a_11, params_a_d_0, params_a_d_1, params_a_d_2, params_a_d_3, params_a_d_4, params_a_d_5, zeta_threshold
const mgga_x_m06l_energy = function (rs, z, xt, xs0, xs1, u0, u1, t0, t1, dens_threshold, params_a_a_0, params_a_a_1, params_a_a_2, params_a_a_3, params_a_a_4, params_a_a_5, params_a_a_6, params_a_a_7, params_a_a_8, params_a_a_9, params_a_a_10, params_a_a_11, params_a_d_0, params_a_d_1, params_a_d_2, params_a_d_3, params_a_d_4, params_a_d_5, zeta_threshold)
    @inbounds begin
        cse_tmp_0 = z + 1
        cse_tmp_1 = (3 // 8) / (pi * rs ^ 3)
        cse_tmp_2 = xs0 ^ 2
        cse_tmp_3 = 3.3019272488946267
        cse_tmp_4 = 4.60115111447049
        cse_tmp_5 = cse_tmp_3 * cse_tmp_4
        cse_tmp_6 = 1 - 0.001120356 * cse_tmp_5
        cse_tmp_7 = 0.00186726 * cse_tmp_2 + cse_tmp_6 + 0.00373452 * t0
        cse_tmp_8 = (3 // 5) * cse_tmp_5
        cse_tmp_9 = -cse_tmp_8
        cse_tmp_10 = cse_tmp_9 + 2 * t0
        cse_tmp_11 = 1.8171205928321397
        cse_tmp_12 = cse_tmp_11 / cse_tmp_4
        cse_tmp_13 = 0.009146457198521546 * cse_tmp_12
        cse_tmp_14 = 0.007353751587611323 * cse_tmp_12
        cse_tmp_15 = (3 // 10) * cse_tmp_5
        cse_tmp_16 = cse_tmp_15 + t0
        cse_tmp_17 = -120 * params_a_a_10
        cse_tmp_18 = 165 * params_a_a_11
        cse_tmp_19 = -4 * params_a_a_4
        cse_tmp_20 = 10 * params_a_a_5
        cse_tmp_21 = 35 * params_a_a_7
        cse_tmp_22 = -56 * params_a_a_8
        cse_tmp_23 = 84 * params_a_a_9
        cse_tmp_24 = (972 // 125) * 97.40909103400244 * (cse_tmp_17 + cse_tmp_18 + cse_tmp_19 + cse_tmp_20 + cse_tmp_21 + cse_tmp_22 + cse_tmp_23 + params_a_a_3 - 20 * params_a_a_6)
        cse_tmp_25 = 210 * params_a_a_10
        cse_tmp_26 = 462 * params_a_a_11
        cse_tmp_27 = 7 * params_a_a_7
        cse_tmp_28 = 28 * params_a_a_8
        cse_tmp_29 = (944784 // 15625) * 9488.531016070574 * (-cse_tmp_23 + cse_tmp_25 - cse_tmp_26 - cse_tmp_27 + cse_tmp_28 + params_a_a_6)
        cse_tmp_30 = -10 * params_a_a_10
        cse_tmp_31 = 55 * params_a_a_11
        cse_tmp_32 = (918330048 // 1953125) * 924269.1815233742 * (cse_tmp_30 + cse_tmp_31 + params_a_a_9)
        cse_tmp_33 = 11 * params_a_a_11
        cse_tmp_34 = 3 * params_a_a_3
        cse_tmp_35 = 5 * params_a_a_5
        cse_tmp_36 = -6 * params_a_a_6
        cse_tmp_37 = -8 * params_a_a_8
        cse_tmp_38 = 9 * params_a_a_9
        cse_tmp_39 = cse_tmp_8 * (cse_tmp_19 + cse_tmp_27 + cse_tmp_30 + cse_tmp_33 + cse_tmp_34 + cse_tmp_35 + cse_tmp_36 + cse_tmp_37 + cse_tmp_38 + params_a_a_1 - 2 * params_a_a_2)
        cse_tmp_40 = 45 * params_a_a_10
        cse_tmp_41 = 15 * params_a_a_6
        cse_tmp_42 = 21 * params_a_a_7
        cse_tmp_43 = 36 * params_a_a_9
        cse_tmp_44 = (54 // 25) * 21.170591578193033 * cse_tmp_11 * (-cse_tmp_20 + cse_tmp_28 - cse_tmp_31 - cse_tmp_34 + cse_tmp_40 + cse_tmp_41 - cse_tmp_42 - cse_tmp_43 + params_a_a_2 + 6 * params_a_a_4)
        cse_tmp_45 = 330 * params_a_a_11
        cse_tmp_46 = 126 * params_a_a_9
        cse_tmp_47 = (2916 // 625) * 448.1939477706577 * cse_tmp_3 * (-cse_tmp_21 + cse_tmp_25 - cse_tmp_35 + cse_tmp_41 - cse_tmp_45 - cse_tmp_46 + params_a_a_4 + 70 * params_a_a_8)
        cse_tmp_48 = (52488 // 3125) * 2062.2080822838902 * cse_tmp_11 * (cse_tmp_22 + cse_tmp_26 + cse_tmp_36 + cse_tmp_42 + cse_tmp_46 - 252 * params_a_a_10 + params_a_a_5)
        cse_tmp_49 = (2834352 // 78125) * 43658.16505928093 * cse_tmp_3 * (cse_tmp_17 + cse_tmp_37 + cse_tmp_43 + cse_tmp_45 + params_a_a_7)
        cse_tmp_50 = (51018336 // 390625) * 200877.81481824708 * cse_tmp_11 * (-cse_tmp_18 - cse_tmp_38 + cse_tmp_40 + params_a_a_8)
        cse_tmp_51 = (2754990144 // 9765625) * 4252702.174637001 * cse_tmp_3 * (-cse_tmp_33 + params_a_a_10)
        cse_tmp_52 = (49589822592 // 48828125) * 19567325.350342114 * cse_tmp_11 * params_a_a_11
        cse_tmp_53 = params_a_a_0 - params_a_a_1 + params_a_a_10 - params_a_a_11 + params_a_a_2 - params_a_a_3 + params_a_a_4 - params_a_a_5 + params_a_a_6 - params_a_a_7 + params_a_a_8 - params_a_a_9
        cse_tmp_54 = cse_tmp_0 <= zeta_threshold
        cse_tmp_55 = zeta_threshold - 1
        cse_tmp_56 = 1 - z
        cse_tmp_57 = cse_tmp_56 <= zeta_threshold
        cse_tmp_58 = -cse_tmp_55
        cse_tmp_59 = my_piecewise5(cse_tmp_54, cse_tmp_55, cse_tmp_57, cse_tmp_58, z) + 1
        cse_tmp_60 = NaNMath.pow(zeta_threshold, 1.3333333333333333)
        cse_tmp_61 = 0.184639691595506 * cse_tmp_11 / (1.4645918875615234 * rs)
        cse_tmp_62 = xs1 ^ 2
        cse_tmp_63 = cse_tmp_6 + 0.00186726 * cse_tmp_62 + 0.00373452 * t1
        cse_tmp_64 = cse_tmp_9 + 2 * t1
        cse_tmp_65 = cse_tmp_15 + t1
        cse_tmp_66 = my_piecewise5(cse_tmp_57, cse_tmp_55, cse_tmp_54, cse_tmp_58, -z) + 1
        my_piecewise3(cse_tmp_0 * cse_tmp_1 <= dens_threshold, 0, -cse_tmp_61 * ((cse_tmp_14 * cse_tmp_2 / (cse_tmp_13 * cse_tmp_2 + 0.804) + 1) * (cse_tmp_53 + cse_tmp_39 / cse_tmp_16 + cse_tmp_44 / cse_tmp_16 ^ 2 + cse_tmp_24 / cse_tmp_16 ^ 3 + cse_tmp_47 / cse_tmp_16 ^ 4 + cse_tmp_48 / cse_tmp_16 ^ 5 + cse_tmp_29 / cse_tmp_16 ^ 6 + cse_tmp_49 / cse_tmp_16 ^ 7 + cse_tmp_50 / cse_tmp_16 ^ 8 + cse_tmp_32 / cse_tmp_16 ^ 9 + cse_tmp_51 / cse_tmp_16 ^ 10 + cse_tmp_52 / cse_tmp_16 ^ 11) + params_a_d_0 / cse_tmp_7 + (cse_tmp_10 * params_a_d_2 + cse_tmp_2 * params_a_d_1) / cse_tmp_7 ^ 2 + (cse_tmp_10 ^ 2 * params_a_d_5 + cse_tmp_10 * cse_tmp_2 * params_a_d_4 + params_a_d_3 * xs0 ^ 4) / cse_tmp_7 ^ 3) * my_piecewise3(cse_tmp_59 <= zeta_threshold, cse_tmp_60, NaNMath.pow(cse_tmp_59, 1.3333333333333333))) + my_piecewise3(cse_tmp_1 * cse_tmp_56 <= dens_threshold, 0, -cse_tmp_61 * ((cse_tmp_14 * cse_tmp_62 / (cse_tmp_13 * cse_tmp_62 + 0.804) + 1) * (cse_tmp_24 / cse_tmp_65 ^ 3 + cse_tmp_29 / cse_tmp_65 ^ 6 + cse_tmp_32 / cse_tmp_65 ^ 9 + cse_tmp_39 / cse_tmp_65 + cse_tmp_44 / cse_tmp_65 ^ 2 + cse_tmp_47 / cse_tmp_65 ^ 4 + cse_tmp_48 / cse_tmp_65 ^ 5 + cse_tmp_49 / cse_tmp_65 ^ 7 + cse_tmp_50 / cse_tmp_65 ^ 8 + cse_tmp_51 / cse_tmp_65 ^ 10 + cse_tmp_52 / cse_tmp_65 ^ 11 + cse_tmp_53) + params_a_d_0 / cse_tmp_63 + (cse_tmp_62 * params_a_d_1 + cse_tmp_64 * params_a_d_2) / cse_tmp_63 ^ 2 + (cse_tmp_62 * cse_tmp_64 * params_a_d_4 + cse_tmp_64 ^ 2 * params_a_d_5 + params_a_d_3 * xs1 ^ 4) / cse_tmp_63 ^ 3) * my_piecewise3(cse_tmp_66 <= zeta_threshold, cse_tmp_60, NaNMath.pow(cse_tmp_66, 1.3333333333333333)))
    end
end
export mgga_x_m06l_energy

const mgga_x_m06l_defaults = NamedTuple()
const mgga_x_m06l_required = (:dens_threshold, :params_a_a_0, :params_a_a_1, :params_a_a_2, :params_a_a_3, :params_a_a_4, :params_a_a_5, :params_a_a_6, :params_a_a_7, :params_a_a_8, :params_a_a_9, :params_a_a_10, :params_a_a_11, :params_a_d_0, :params_a_d_1, :params_a_d_2, :params_a_d_3, :params_a_d_4, :params_a_d_5, :zeta_threshold)

function mgga_x_m06l(rho, sigma, lapl, tau; params = NamedTuple())
    p = resolve_params(mgga_x_m06l_defaults, mgga_x_m06l_required, params)
    v = mgga_variables(rho, sigma, lapl, tau, Val(3))
    return mgga_x_m06l_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.dens_threshold, p.params_a_a_0, p.params_a_a_1, p.params_a_a_2, p.params_a_a_3, p.params_a_a_4, p.params_a_a_5, p.params_a_a_6, p.params_a_a_7, p.params_a_a_8, p.params_a_a_9, p.params_a_a_10, p.params_a_a_11, p.params_a_d_0, p.params_a_d_1, p.params_a_d_2, p.params_a_d_3, p.params_a_d_4, p.params_a_d_5, p.zeta_threshold)
end

function mgga_x_m06l(na, nb, gaa, gab, gbb, la, lb, ta, tb; params = NamedTuple())
    p = resolve_params(mgga_x_m06l_defaults, mgga_x_m06l_required, params)
    v = mgga_variables(na, nb, gaa, gab, gbb, la, lb, ta, tb, Val(3))
    return mgga_x_m06l_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.dens_threshold, p.params_a_a_0, p.params_a_a_1, p.params_a_a_2, p.params_a_a_3, p.params_a_a_4, p.params_a_a_5, p.params_a_a_6, p.params_a_a_7, p.params_a_a_8, p.params_a_a_9, p.params_a_a_10, p.params_a_a_11, p.params_a_d_0, p.params_a_d_1, p.params_a_d_2, p.params_a_d_3, p.params_a_d_4, p.params_a_d_5, p.zeta_threshold)
end

export mgga_x_m06l, mgga_x_m06l_defaults, mgga_x_m06l_required

const hyb_mgga_x_m06_defaults = (dens_threshold = 1.0e-15, params_a_a_0 = 0.5877943, params_a_a_1 = -0.1371776, params_a_a_2 = 0.2682367, params_a_a_3 = -2.515898, params_a_a_4 = -2.978892, params_a_a_5 = 8.710679, params_a_a_6 = 16.88195, params_a_a_7 = -4.489724, params_a_a_8 = -32.99983, params_a_a_9 = -14.4905, params_a_a_10 = 20.43747, params_a_a_11 = 12.56504, params_a_d_0 = 0.1422057, params_a_d_1 = 0.0007370319, params_a_d_2 = -0.01601373, params_a_d_3 = 0.0, params_a_d_4 = 0.0, params_a_d_5 = 0.0, zeta_threshold = 2.220446049250313e-16)
const hyb_mgga_x_m06_required = ()

function hyb_mgga_x_m06(rho, sigma, lapl, tau; params = NamedTuple())
    p = resolve_params(hyb_mgga_x_m06_defaults, hyb_mgga_x_m06_required, params)
    v = mgga_variables(rho, sigma, lapl, tau, Val(3))
    return mgga_x_m06l_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.dens_threshold, p.params_a_a_0, p.params_a_a_1, p.params_a_a_2, p.params_a_a_3, p.params_a_a_4, p.params_a_a_5, p.params_a_a_6, p.params_a_a_7, p.params_a_a_8, p.params_a_a_9, p.params_a_a_10, p.params_a_a_11, p.params_a_d_0, p.params_a_d_1, p.params_a_d_2, p.params_a_d_3, p.params_a_d_4, p.params_a_d_5, p.zeta_threshold)
end

function hyb_mgga_x_m06(na, nb, gaa, gab, gbb, la, lb, ta, tb; params = NamedTuple())
    p = resolve_params(hyb_mgga_x_m06_defaults, hyb_mgga_x_m06_required, params)
    v = mgga_variables(na, nb, gaa, gab, gbb, la, lb, ta, tb, Val(3))
    return mgga_x_m06l_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.dens_threshold, p.params_a_a_0, p.params_a_a_1, p.params_a_a_2, p.params_a_a_3, p.params_a_a_4, p.params_a_a_5, p.params_a_a_6, p.params_a_a_7, p.params_a_a_8, p.params_a_a_9, p.params_a_a_10, p.params_a_a_11, p.params_a_d_0, p.params_a_d_1, p.params_a_d_2, p.params_a_d_3, p.params_a_d_4, p.params_a_d_5, p.zeta_threshold)
end

export hyb_mgga_x_m06, hyb_mgga_x_m06_defaults, hyb_mgga_x_m06_required

const hyb_mgga_x_m06_hf_defaults = (dens_threshold = 1.0e-15, params_a_a_0 = 0.1179732, params_a_a_1 = -1.066708, params_a_a_2 = -0.1462405, params_a_a_3 = 7.481848, params_a_a_4 = 3.776679, params_a_a_5 = -44.36118, params_a_a_6 = -18.30962, params_a_a_7 = 100.3903, params_a_a_8 = 38.6436, params_a_a_9 = -98.06018, params_a_a_10 = -25.57716, params_a_a_11 = 35.90404, params_a_d_0 = -0.1179732, params_a_d_1 = -0.0025, params_a_d_2 = -0.01180065, params_a_d_3 = 0.0, params_a_d_4 = 0.0, params_a_d_5 = 0.0, zeta_threshold = 2.220446049250313e-16)
const hyb_mgga_x_m06_hf_required = ()

function hyb_mgga_x_m06_hf(rho, sigma, lapl, tau; params = NamedTuple())
    p = resolve_params(hyb_mgga_x_m06_hf_defaults, hyb_mgga_x_m06_hf_required, params)
    v = mgga_variables(rho, sigma, lapl, tau, Val(3))
    return mgga_x_m06l_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.dens_threshold, p.params_a_a_0, p.params_a_a_1, p.params_a_a_2, p.params_a_a_3, p.params_a_a_4, p.params_a_a_5, p.params_a_a_6, p.params_a_a_7, p.params_a_a_8, p.params_a_a_9, p.params_a_a_10, p.params_a_a_11, p.params_a_d_0, p.params_a_d_1, p.params_a_d_2, p.params_a_d_3, p.params_a_d_4, p.params_a_d_5, p.zeta_threshold)
end

function hyb_mgga_x_m06_hf(na, nb, gaa, gab, gbb, la, lb, ta, tb; params = NamedTuple())
    p = resolve_params(hyb_mgga_x_m06_hf_defaults, hyb_mgga_x_m06_hf_required, params)
    v = mgga_variables(na, nb, gaa, gab, gbb, la, lb, ta, tb, Val(3))
    return mgga_x_m06l_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.dens_threshold, p.params_a_a_0, p.params_a_a_1, p.params_a_a_2, p.params_a_a_3, p.params_a_a_4, p.params_a_a_5, p.params_a_a_6, p.params_a_a_7, p.params_a_a_8, p.params_a_a_9, p.params_a_a_10, p.params_a_a_11, p.params_a_d_0, p.params_a_d_1, p.params_a_d_2, p.params_a_d_3, p.params_a_d_4, p.params_a_d_5, p.zeta_threshold)
end

export hyb_mgga_x_m06_hf, hyb_mgga_x_m06_hf_defaults, hyb_mgga_x_m06_hf_required

const hyb_mgga_x_m06_sx_defaults = (dens_threshold = 1.0e-15, params_a_a_0 = 0.996501680264007, params_a_a_1 = 0.0301264933631367, params_a_a_2 = -0.103366758333673, params_a_a_3 = -0.155653062500239, params_a_a_4 = 0.00795768051149902, params_a_a_5 = 0.0871986277454856, params_a_a_6 = -0.816152625764469, params_a_a_7 = 0.67277300661242, params_a_a_8 = 0.521127186174968, params_a_a_9 = 0.399466945122217, params_a_a_10 = 0.519400018999204, params_a_a_11 = -0.965261552636835, params_a_d_0 = -0.347792307472902, params_a_d_1 = 0.0, params_a_d_2 = -0.00270366787478266, params_a_d_3 = 0.0, params_a_d_4 = 0.0, params_a_d_5 = 0.0, zeta_threshold = 2.220446049250313e-16)
const hyb_mgga_x_m06_sx_required = ()

function hyb_mgga_x_m06_sx(rho, sigma, lapl, tau; params = NamedTuple())
    p = resolve_params(hyb_mgga_x_m06_sx_defaults, hyb_mgga_x_m06_sx_required, params)
    v = mgga_variables(rho, sigma, lapl, tau, Val(3))
    return mgga_x_m06l_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.dens_threshold, p.params_a_a_0, p.params_a_a_1, p.params_a_a_2, p.params_a_a_3, p.params_a_a_4, p.params_a_a_5, p.params_a_a_6, p.params_a_a_7, p.params_a_a_8, p.params_a_a_9, p.params_a_a_10, p.params_a_a_11, p.params_a_d_0, p.params_a_d_1, p.params_a_d_2, p.params_a_d_3, p.params_a_d_4, p.params_a_d_5, p.zeta_threshold)
end

function hyb_mgga_x_m06_sx(na, nb, gaa, gab, gbb, la, lb, ta, tb; params = NamedTuple())
    p = resolve_params(hyb_mgga_x_m06_sx_defaults, hyb_mgga_x_m06_sx_required, params)
    v = mgga_variables(na, nb, gaa, gab, gbb, la, lb, ta, tb, Val(3))
    return mgga_x_m06l_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.dens_threshold, p.params_a_a_0, p.params_a_a_1, p.params_a_a_2, p.params_a_a_3, p.params_a_a_4, p.params_a_a_5, p.params_a_a_6, p.params_a_a_7, p.params_a_a_8, p.params_a_a_9, p.params_a_a_10, p.params_a_a_11, p.params_a_d_0, p.params_a_d_1, p.params_a_d_2, p.params_a_d_3, p.params_a_d_4, p.params_a_d_5, p.zeta_threshold)
end

export hyb_mgga_x_m06_sx, hyb_mgga_x_m06_sx_defaults, hyb_mgga_x_m06_sx_required

const hyb_mgga_x_revm06_defaults = (dens_threshold = 1.0e-15, params_a_a_0 = 0.6511394014, params_a_a_1 = -0.1214497763, params_a_a_2 = -0.1367041135, params_a_a_3 = 0.3987218551, params_a_a_4 = 0.6056741356, params_a_a_5 = -2.379738662, params_a_a_6 = -1.492098351, params_a_a_7 = 3.03147342, params_a_a_8 = 0.5149637108, params_a_a_9 = 2.633751911, params_a_a_10 = 0.9886749252, params_a_a_11 = -4.243714128, params_a_d_0 = -0.0552394014, params_a_d_1 = 0.0, params_a_d_2 = -0.003782631233, params_a_d_3 = 0.0, params_a_d_4 = 0.0, params_a_d_5 = 0.0, zeta_threshold = 2.220446049250313e-16)
const hyb_mgga_x_revm06_required = ()

function hyb_mgga_x_revm06(rho, sigma, lapl, tau; params = NamedTuple())
    p = resolve_params(hyb_mgga_x_revm06_defaults, hyb_mgga_x_revm06_required, params)
    v = mgga_variables(rho, sigma, lapl, tau, Val(3))
    return mgga_x_m06l_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.dens_threshold, p.params_a_a_0, p.params_a_a_1, p.params_a_a_2, p.params_a_a_3, p.params_a_a_4, p.params_a_a_5, p.params_a_a_6, p.params_a_a_7, p.params_a_a_8, p.params_a_a_9, p.params_a_a_10, p.params_a_a_11, p.params_a_d_0, p.params_a_d_1, p.params_a_d_2, p.params_a_d_3, p.params_a_d_4, p.params_a_d_5, p.zeta_threshold)
end

function hyb_mgga_x_revm06(na, nb, gaa, gab, gbb, la, lb, ta, tb; params = NamedTuple())
    p = resolve_params(hyb_mgga_x_revm06_defaults, hyb_mgga_x_revm06_required, params)
    v = mgga_variables(na, nb, gaa, gab, gbb, la, lb, ta, tb, Val(3))
    return mgga_x_m06l_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.dens_threshold, p.params_a_a_0, p.params_a_a_1, p.params_a_a_2, p.params_a_a_3, p.params_a_a_4, p.params_a_a_5, p.params_a_a_6, p.params_a_a_7, p.params_a_a_8, p.params_a_a_9, p.params_a_a_10, p.params_a_a_11, p.params_a_d_0, p.params_a_d_1, p.params_a_d_2, p.params_a_d_3, p.params_a_d_4, p.params_a_d_5, p.zeta_threshold)
end

export hyb_mgga_x_revm06, hyb_mgga_x_revm06_defaults, hyb_mgga_x_revm06_required

const mgga_x_m06_l_defaults = (dens_threshold = 1.0e-15, params_a_a_0 = 0.3987756, params_a_a_1 = 0.2548219, params_a_a_2 = 0.3923994, params_a_a_3 = -2.103655, params_a_a_4 = -6.302147, params_a_a_5 = 10.97615, params_a_a_6 = 30.97273, params_a_a_7 = -23.18489, params_a_a_8 = -56.7348, params_a_a_9 = 21.60364, params_a_a_10 = 34.21814, params_a_a_11 = -9.049762, params_a_d_0 = 0.6012244, params_a_d_1 = 0.004748822, params_a_d_2 = -0.008635108, params_a_d_3 = -9.308062e-6, params_a_d_4 = 4.482811e-5, params_a_d_5 = 0.0, zeta_threshold = 2.220446049250313e-16)
const mgga_x_m06_l_required = ()

function mgga_x_m06_l(rho, sigma, lapl, tau; params = NamedTuple())
    p = resolve_params(mgga_x_m06_l_defaults, mgga_x_m06_l_required, params)
    v = mgga_variables(rho, sigma, lapl, tau, Val(3))
    return mgga_x_m06l_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.dens_threshold, p.params_a_a_0, p.params_a_a_1, p.params_a_a_2, p.params_a_a_3, p.params_a_a_4, p.params_a_a_5, p.params_a_a_6, p.params_a_a_7, p.params_a_a_8, p.params_a_a_9, p.params_a_a_10, p.params_a_a_11, p.params_a_d_0, p.params_a_d_1, p.params_a_d_2, p.params_a_d_3, p.params_a_d_4, p.params_a_d_5, p.zeta_threshold)
end

function mgga_x_m06_l(na, nb, gaa, gab, gbb, la, lb, ta, tb; params = NamedTuple())
    p = resolve_params(mgga_x_m06_l_defaults, mgga_x_m06_l_required, params)
    v = mgga_variables(na, nb, gaa, gab, gbb, la, lb, ta, tb, Val(3))
    return mgga_x_m06l_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.dens_threshold, p.params_a_a_0, p.params_a_a_1, p.params_a_a_2, p.params_a_a_3, p.params_a_a_4, p.params_a_a_5, p.params_a_a_6, p.params_a_a_7, p.params_a_a_8, p.params_a_a_9, p.params_a_a_10, p.params_a_a_11, p.params_a_d_0, p.params_a_d_1, p.params_a_d_2, p.params_a_d_3, p.params_a_d_4, p.params_a_d_5, p.zeta_threshold)
end

export mgga_x_m06_l, mgga_x_m06_l_defaults, mgga_x_m06_l_required

const mgga_x_revm06_l_defaults = (dens_threshold = 1.0e-15, params_a_a_0 = 1.423227252, params_a_a_1 = 0.471820438, params_a_a_2 = -0.167555701, params_a_a_3 = -0.250154262, params_a_a_4 = 0.062487588, params_a_a_5 = 0.73350124, params_a_a_6 = -2.359736776, params_a_a_7 = -1.436594372, params_a_a_8 = 0.444643793, params_a_a_9 = 1.529925054, params_a_a_10 = 2.053941717, params_a_a_11 = -0.036536031, params_a_d_0 = -0.423227252, params_a_d_1 = 0.0, params_a_d_2 = 0.003724234, params_a_d_3 = 0.0, params_a_d_4 = 0.0, params_a_d_5 = 0.0, zeta_threshold = 2.220446049250313e-16)
const mgga_x_revm06_l_required = ()

function mgga_x_revm06_l(rho, sigma, lapl, tau; params = NamedTuple())
    p = resolve_params(mgga_x_revm06_l_defaults, mgga_x_revm06_l_required, params)
    v = mgga_variables(rho, sigma, lapl, tau, Val(3))
    return mgga_x_m06l_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.dens_threshold, p.params_a_a_0, p.params_a_a_1, p.params_a_a_2, p.params_a_a_3, p.params_a_a_4, p.params_a_a_5, p.params_a_a_6, p.params_a_a_7, p.params_a_a_8, p.params_a_a_9, p.params_a_a_10, p.params_a_a_11, p.params_a_d_0, p.params_a_d_1, p.params_a_d_2, p.params_a_d_3, p.params_a_d_4, p.params_a_d_5, p.zeta_threshold)
end

function mgga_x_revm06_l(na, nb, gaa, gab, gbb, la, lb, ta, tb; params = NamedTuple())
    p = resolve_params(mgga_x_revm06_l_defaults, mgga_x_revm06_l_required, params)
    v = mgga_variables(na, nb, gaa, gab, gbb, la, lb, ta, tb, Val(3))
    return mgga_x_m06l_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.dens_threshold, p.params_a_a_0, p.params_a_a_1, p.params_a_a_2, p.params_a_a_3, p.params_a_a_4, p.params_a_a_5, p.params_a_a_6, p.params_a_a_7, p.params_a_a_8, p.params_a_a_9, p.params_a_a_10, p.params_a_a_11, p.params_a_d_0, p.params_a_d_1, p.params_a_d_2, p.params_a_d_3, p.params_a_d_4, p.params_a_d_5, p.zeta_threshold)
end

export mgga_x_revm06_l, mgga_x_revm06_l_defaults, mgga_x_revm06_l_required
