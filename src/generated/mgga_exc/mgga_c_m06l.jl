# Auto-generated from the Libxc sources
# python/mgga_exc/mgga_c_m06l.py -- do not edit by hand.
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
# args: rs, z, xt, xs0, xs1, u0, u1, t0, t1, dens_threshold, params_a_Fermi_D_cnst, params_a_alpha_ab, params_a_alpha_ss, params_a_cab_0, params_a_cab_1, params_a_cab_2, params_a_cab_3, params_a_cab_4, params_a_css_0, params_a_css_1, params_a_css_2, params_a_css_3, params_a_css_4, params_a_dab_0, params_a_dab_1, params_a_dab_2, params_a_dab_3, params_a_dab_4, params_a_dab_5, params_a_dss_0, params_a_dss_1, params_a_dss_2, params_a_dss_3, params_a_dss_4, params_a_dss_5, params_a_gamma_ab, params_a_gamma_ss, zeta_threshold
const mgga_c_m06l_energy = function (rs, z, xt, xs0, xs1, u0, u1, t0, t1, dens_threshold, params_a_Fermi_D_cnst, params_a_alpha_ab, params_a_alpha_ss, params_a_cab_0, params_a_cab_1, params_a_cab_2, params_a_cab_3, params_a_cab_4, params_a_css_0, params_a_css_1, params_a_css_2, params_a_css_3, params_a_css_4, params_a_dab_0, params_a_dab_1, params_a_dab_2, params_a_dab_3, params_a_dab_4, params_a_dab_5, params_a_dss_0, params_a_dss_1, params_a_dss_2, params_a_dss_3, params_a_dss_4, params_a_dss_5, params_a_gamma_ab, params_a_gamma_ss, zeta_threshold)
    @inbounds begin
        cse_tmp_0 = xs0 ^ 2
        cse_tmp_1 = cse_tmp_0 * params_a_gamma_ss
        cse_tmp_2 = cse_tmp_1 + 1
        cse_tmp_3 = xs0 ^ 4
        cse_tmp_4 = params_a_css_2 * params_a_gamma_ss ^ 2
        cse_tmp_5 = params_a_css_3 * params_a_gamma_ss ^ 3
        cse_tmp_6 = params_a_css_4 * params_a_gamma_ss ^ 4
        cse_tmp_7 = 4 / params_a_Fermi_D_cnst ^ 2
        cse_tmp_8 = z + 1
        cse_tmp_10 = (3 // 8) / (pi * rs ^ 3)
        cse_tmp_11 = zeta_threshold - 1
        cse_tmp_12 = xc_log1p(my_piecewise3(z > cse_tmp_11, z, cse_tmp_11))
        cse_tmp_13 = 0.01328816518 * rs
        cse_tmp_14 = 1.2599210498948732
        cse_tmp_15 = -1 + NaNMath.pow(zeta_threshold, -0.3333333333333333)
        cse_tmp_16 = my_piecewise3(cse_tmp_8 <= zeta_threshold, cse_tmp_15, xc_expm1(-cse_tmp_12 / 3)) + 1
        cse_tmp_17 = cse_tmp_14 * cse_tmp_16
        cse_tmp_18 = 0.22308199064 * rs
        cse_tmp_19 = NaNMath.sqrt(rs)
        cse_tmp_20 = 0.47231125998 * cse_tmp_19
        cse_tmp_21 = 1.122462048309373
        cse_tmp_22 = NaNMath.sqrt(cse_tmp_16) * cse_tmp_21
        cse_tmp_23 = NaNMath.pow(rs, 1.5)
        cse_tmp_24 = 0.10186556948 * cse_tmp_23
        cse_tmp_25 = 1.4142135623730951
        cse_tmp_26 = NaNMath.pow(cse_tmp_16, 1.5) * cse_tmp_25
        cse_tmp_27 = rs ^ 2
        cse_tmp_28 = 0.030651699316 * cse_tmp_27
        cse_tmp_29 = 1.5874010519681994
        cse_tmp_30 = cse_tmp_16 ^ 2 * cse_tmp_29
        cse_tmp_31 = (-cse_tmp_13 * cse_tmp_17 - 0.0621814) * xc_log1p((cse_tmp_17 * cse_tmp_18 + cse_tmp_20 * cse_tmp_22 + cse_tmp_24 * cse_tmp_26 + cse_tmp_28 * cse_tmp_30) ^ (-1))
        cse_tmp_32 = 0.00375733525 * rs
        cse_tmp_33 = 0.12236585478 * rs
        cse_tmp_34 = 0.3497952466 * cse_tmp_19
        cse_tmp_35 = 0.029729725188 * cse_tmp_23
        cse_tmp_36 = 0.016775784198 * cse_tmp_27
        cse_tmp_37 = 0.5848223622634646207262238663759 * (-cse_tmp_17 * cse_tmp_32 - 0.0337738) * xc_log1p((cse_tmp_17 * cse_tmp_33 + cse_tmp_22 * cse_tmp_34 + cse_tmp_26 * cse_tmp_35 + cse_tmp_30 * cse_tmp_36) ^ (-1))
        cse_tmp_38 = (2 * cse_tmp_14 - 2) ^ (-1)
        cse_tmp_39 = NaNMath.pow(zeta_threshold, 1.3333333333333333) - 1
        cse_tmp_40 = cse_tmp_38 * (cse_tmp_39 + my_piecewise3(2 <= zeta_threshold, cse_tmp_39, xc_expm1((4 // 3) * xc_log1p(my_piecewise3(1 > cse_tmp_11, 1, cse_tmp_11)))))
        cse_tmp_41 = 0.006388517036 * rs
        cse_tmp_42 = 0.19269083139 * rs
        cse_tmp_43 = 0.43896648423 * cse_tmp_19
        cse_tmp_44 = 0.10465751434 * cse_tmp_23
        cse_tmp_45 = 0.019436972919 * cse_tmp_27
        cse_tmp_46 = my_piecewise3(cse_tmp_8 <= zeta_threshold || cse_tmp_10 * cse_tmp_8 <= dens_threshold, 0, (my_piecewise3(cse_tmp_8 <= zeta_threshold, cse_tmp_11, xc_expm1(cse_tmp_12)) / 2 + 1 // 2) * (cse_tmp_31 - cse_tmp_37 * cse_tmp_40 + cse_tmp_40 * (-cse_tmp_31 + cse_tmp_37 + (-cse_tmp_17 * cse_tmp_41 - 0.0310907) * xc_log1p((cse_tmp_17 * cse_tmp_42 + cse_tmp_22 * cse_tmp_43 + cse_tmp_26 * cse_tmp_44 + cse_tmp_30 * cse_tmp_45) ^ (-1)))))
        cse_tmp_47 = cse_tmp_46 * (-cse_tmp_0 + 8 * t0) / (8 * t0)
        cse_tmp_48 = 2 * t0
        cse_tmp_49 = 3.3019272488946267 * 4.60115111447049
        cse_tmp_50 = -3 // 5 * cse_tmp_49
        cse_tmp_51 = cse_tmp_48 + cse_tmp_50
        cse_tmp_52 = params_a_alpha_ss * (cse_tmp_0 + cse_tmp_51) + 1
        cse_tmp_53 = xs1 ^ 2
        cse_tmp_54 = cse_tmp_53 * params_a_gamma_ss
        cse_tmp_55 = cse_tmp_54 + 1
        cse_tmp_56 = xs1 ^ 4
        cse_tmp_57 = 1 - z
        cse_tmp_59 = -z
        cse_tmp_60 = xc_log1p(my_piecewise3(cse_tmp_59 > cse_tmp_11, cse_tmp_59, cse_tmp_11))
        cse_tmp_61 = my_piecewise3(cse_tmp_57 <= zeta_threshold, cse_tmp_15, xc_expm1(-cse_tmp_60 / 3)) + 1
        cse_tmp_62 = cse_tmp_14 * cse_tmp_61
        cse_tmp_63 = cse_tmp_21 * NaNMath.sqrt(cse_tmp_61)
        cse_tmp_64 = cse_tmp_25 * NaNMath.pow(cse_tmp_61, 1.5)
        cse_tmp_65 = cse_tmp_29 * cse_tmp_61 ^ 2
        cse_tmp_66 = (-cse_tmp_13 * cse_tmp_62 - 0.0621814) * xc_log1p((cse_tmp_18 * cse_tmp_62 + cse_tmp_20 * cse_tmp_63 + cse_tmp_24 * cse_tmp_64 + cse_tmp_28 * cse_tmp_65) ^ (-1))
        cse_tmp_67 = 0.5848223622634646207262238663759 * (-cse_tmp_32 * cse_tmp_62 - 0.0337738) * xc_log1p((cse_tmp_33 * cse_tmp_62 + cse_tmp_34 * cse_tmp_63 + cse_tmp_35 * cse_tmp_64 + cse_tmp_36 * cse_tmp_65) ^ (-1))
        cse_tmp_68 = my_piecewise3(cse_tmp_57 <= zeta_threshold || cse_tmp_10 * cse_tmp_57 <= dens_threshold, 0, (my_piecewise3(cse_tmp_57 <= zeta_threshold, cse_tmp_11, xc_expm1(cse_tmp_60)) / 2 + 1 // 2) * (-cse_tmp_40 * cse_tmp_67 + cse_tmp_40 * (-cse_tmp_66 + cse_tmp_67 + (-cse_tmp_41 * cse_tmp_62 - 0.0310907) * xc_log1p((cse_tmp_42 * cse_tmp_62 + cse_tmp_43 * cse_tmp_63 + cse_tmp_44 * cse_tmp_64 + cse_tmp_45 * cse_tmp_65) ^ (-1))) + cse_tmp_66))
        cse_tmp_69 = cse_tmp_68 * (-cse_tmp_53 + 8 * t1) / (8 * t1)
        cse_tmp_70 = 2 * t1
        cse_tmp_71 = cse_tmp_50 + cse_tmp_70
        cse_tmp_72 = params_a_alpha_ss * (cse_tmp_53 + cse_tmp_71) + 1
        cse_tmp_73 = cse_tmp_0 + cse_tmp_53
        cse_tmp_74 = cse_tmp_73 * params_a_gamma_ab
        cse_tmp_75 = cse_tmp_74 + 1
        cse_tmp_76 = cse_tmp_73 ^ 2
        cse_tmp_77 = -(-cse_tmp_13 - 0.0621814) * xc_log1p((cse_tmp_18 + cse_tmp_20 + cse_tmp_24 + cse_tmp_28) ^ (-1))
        cse_tmp_78 = 0.5848223622634646207262238663759 * (-cse_tmp_32 - 0.0337738) * xc_log1p((cse_tmp_33 + cse_tmp_34 + cse_tmp_35 + cse_tmp_36) ^ (-1))
        cse_tmp_79 = my_piecewise3(cse_tmp_57 <= zeta_threshold, cse_tmp_39, xc_expm1((4 // 3) * cse_tmp_60)) + my_piecewise3(cse_tmp_8 <= zeta_threshold, cse_tmp_39, xc_expm1((4 // 3) * cse_tmp_12))
        cse_tmp_80 = -cse_tmp_38 * cse_tmp_78 * cse_tmp_79 + cse_tmp_38 * cse_tmp_79 * z ^ 4 * (cse_tmp_77 + cse_tmp_78 + (-cse_tmp_41 - 0.0310907) * xc_log1p((cse_tmp_42 + cse_tmp_43 + cse_tmp_44 + cse_tmp_45) ^ (-1))) - cse_tmp_46 - cse_tmp_68 - cse_tmp_77
        cse_tmp_81 = cse_tmp_48 - 6 // 5 * cse_tmp_49 + cse_tmp_70
        cse_tmp_82 = params_a_alpha_ab * (cse_tmp_73 + cse_tmp_81) + 1
        cse_tmp_47 * (params_a_dss_0 / cse_tmp_52 + (cse_tmp_0 * params_a_dss_1 + cse_tmp_51 * params_a_dss_2) / cse_tmp_52 ^ 2 + (cse_tmp_0 * cse_tmp_51 * params_a_dss_4 + cse_tmp_3 * params_a_dss_3 + cse_tmp_51 ^ 2 * params_a_dss_5) / cse_tmp_52 ^ 3) - cse_tmp_47 * (cse_tmp_1 * params_a_css_1 / cse_tmp_2 + params_a_css_0 + cse_tmp_3 * cse_tmp_4 / cse_tmp_2 ^ 2 + cse_tmp_5 * xs0 ^ 6 / cse_tmp_2 ^ 3 + cse_tmp_6 * xs0 ^ 8 / cse_tmp_2 ^ 4) * xc_expm1(-cse_tmp_7 * t0 ^ 2) + cse_tmp_69 * (params_a_dss_0 / cse_tmp_72 + (cse_tmp_53 * params_a_dss_1 + cse_tmp_71 * params_a_dss_2) / cse_tmp_72 ^ 2 + (cse_tmp_53 * cse_tmp_71 * params_a_dss_4 + cse_tmp_56 * params_a_dss_3 + cse_tmp_71 ^ 2 * params_a_dss_5) / cse_tmp_72 ^ 3) - cse_tmp_69 * (cse_tmp_4 * cse_tmp_56 / cse_tmp_55 ^ 2 + cse_tmp_5 * xs1 ^ 6 / cse_tmp_55 ^ 3 + cse_tmp_54 * params_a_css_1 / cse_tmp_55 + params_a_css_0 + cse_tmp_6 * xs1 ^ 8 / cse_tmp_55 ^ 4) * xc_expm1(-cse_tmp_7 * t1 ^ 2) + cse_tmp_80 * (params_a_dab_0 / cse_tmp_82 + (cse_tmp_73 * params_a_dab_1 + cse_tmp_81 * params_a_dab_2) / cse_tmp_82 ^ 2 + (cse_tmp_73 * cse_tmp_81 * params_a_dab_4 + cse_tmp_76 * params_a_dab_3 + cse_tmp_81 ^ 2 * params_a_dab_5) / cse_tmp_82 ^ 3) + cse_tmp_80 * (cse_tmp_73 ^ 4 * params_a_cab_4 * params_a_gamma_ab ^ 4 / cse_tmp_75 ^ 4 + cse_tmp_73 ^ 3 * params_a_cab_3 * params_a_gamma_ab ^ 3 / cse_tmp_75 ^ 3 + cse_tmp_74 * params_a_cab_1 / cse_tmp_75 + params_a_cab_0 + cse_tmp_76 * params_a_cab_2 * params_a_gamma_ab ^ 2 / cse_tmp_75 ^ 2)
    end
end
export mgga_c_m06l_energy

const mgga_c_m06l_defaults = NamedTuple()
const mgga_c_m06l_required = (:dens_threshold, :params_a_Fermi_D_cnst, :params_a_alpha_ab, :params_a_alpha_ss, :params_a_cab_0, :params_a_cab_1, :params_a_cab_2, :params_a_cab_3, :params_a_cab_4, :params_a_css_0, :params_a_css_1, :params_a_css_2, :params_a_css_3, :params_a_css_4, :params_a_dab_0, :params_a_dab_1, :params_a_dab_2, :params_a_dab_3, :params_a_dab_4, :params_a_dab_5, :params_a_dss_0, :params_a_dss_1, :params_a_dss_2, :params_a_dss_3, :params_a_dss_4, :params_a_dss_5, :params_a_gamma_ab, :params_a_gamma_ss, :zeta_threshold)

function mgga_c_m06l(rho, sigma, lapl, tau; params = NamedTuple())
    p = resolve_params(mgga_c_m06l_defaults, mgga_c_m06l_required, params)
    v = mgga_variables(rho, sigma, lapl, tau, Val(3))
    return mgga_c_m06l_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.dens_threshold, p.params_a_Fermi_D_cnst, p.params_a_alpha_ab, p.params_a_alpha_ss, p.params_a_cab_0, p.params_a_cab_1, p.params_a_cab_2, p.params_a_cab_3, p.params_a_cab_4, p.params_a_css_0, p.params_a_css_1, p.params_a_css_2, p.params_a_css_3, p.params_a_css_4, p.params_a_dab_0, p.params_a_dab_1, p.params_a_dab_2, p.params_a_dab_3, p.params_a_dab_4, p.params_a_dab_5, p.params_a_dss_0, p.params_a_dss_1, p.params_a_dss_2, p.params_a_dss_3, p.params_a_dss_4, p.params_a_dss_5, p.params_a_gamma_ab, p.params_a_gamma_ss, p.zeta_threshold)
end

function mgga_c_m06l(na, nb, gaa, gab, gbb, la, lb, ta, tb; params = NamedTuple())
    p = resolve_params(mgga_c_m06l_defaults, mgga_c_m06l_required, params)
    v = mgga_variables(na, nb, gaa, gab, gbb, la, lb, ta, tb, Val(3))
    return mgga_c_m06l_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.dens_threshold, p.params_a_Fermi_D_cnst, p.params_a_alpha_ab, p.params_a_alpha_ss, p.params_a_cab_0, p.params_a_cab_1, p.params_a_cab_2, p.params_a_cab_3, p.params_a_cab_4, p.params_a_css_0, p.params_a_css_1, p.params_a_css_2, p.params_a_css_3, p.params_a_css_4, p.params_a_dab_0, p.params_a_dab_1, p.params_a_dab_2, p.params_a_dab_3, p.params_a_dab_4, p.params_a_dab_5, p.params_a_dss_0, p.params_a_dss_1, p.params_a_dss_2, p.params_a_dss_3, p.params_a_dss_4, p.params_a_dss_5, p.params_a_gamma_ab, p.params_a_gamma_ss, p.zeta_threshold)
end

export mgga_c_m06l, mgga_c_m06l_defaults, mgga_c_m06l_required

const mgga_c_m06_defaults = (dens_threshold = 1.0e-12, params_a_Fermi_D_cnst = 1.0e-10, params_a_alpha_ab = 0.00304966, params_a_alpha_ss = 0.00515088, params_a_cab_0 = 3.741539, params_a_cab_1 = 218.7098, params_a_cab_2 = -453.1252, params_a_cab_3 = 293.6479, params_a_cab_4 = -62.8747, params_a_css_0 = 0.5094055, params_a_css_1 = -1.491085, params_a_css_2 = 17.23922, params_a_css_3 = -38.59018, params_a_css_4 = 28.45044, params_a_dab_0 = -2.741539, params_a_dab_1 = -0.6720113, params_a_dab_2 = -0.07932688, params_a_dab_3 = 0.001918681, params_a_dab_4 = -0.002032902, params_a_dab_5 = 0.0, params_a_dss_0 = 0.4905945, params_a_dss_1 = -0.1437348, params_a_dss_2 = 0.2357824, params_a_dss_3 = 0.001871015, params_a_dss_4 = -0.003788963, params_a_dss_5 = 0.0, params_a_gamma_ab = 0.0031, params_a_gamma_ss = 0.06, zeta_threshold = 2.220446049250313e-16)
const mgga_c_m06_required = ()

function mgga_c_m06(rho, sigma, lapl, tau; params = NamedTuple())
    p = resolve_params(mgga_c_m06_defaults, mgga_c_m06_required, params)
    v = mgga_variables(rho, sigma, lapl, tau, Val(3))
    return mgga_c_m06l_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.dens_threshold, p.params_a_Fermi_D_cnst, p.params_a_alpha_ab, p.params_a_alpha_ss, p.params_a_cab_0, p.params_a_cab_1, p.params_a_cab_2, p.params_a_cab_3, p.params_a_cab_4, p.params_a_css_0, p.params_a_css_1, p.params_a_css_2, p.params_a_css_3, p.params_a_css_4, p.params_a_dab_0, p.params_a_dab_1, p.params_a_dab_2, p.params_a_dab_3, p.params_a_dab_4, p.params_a_dab_5, p.params_a_dss_0, p.params_a_dss_1, p.params_a_dss_2, p.params_a_dss_3, p.params_a_dss_4, p.params_a_dss_5, p.params_a_gamma_ab, p.params_a_gamma_ss, p.zeta_threshold)
end

function mgga_c_m06(na, nb, gaa, gab, gbb, la, lb, ta, tb; params = NamedTuple())
    p = resolve_params(mgga_c_m06_defaults, mgga_c_m06_required, params)
    v = mgga_variables(na, nb, gaa, gab, gbb, la, lb, ta, tb, Val(3))
    return mgga_c_m06l_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.dens_threshold, p.params_a_Fermi_D_cnst, p.params_a_alpha_ab, p.params_a_alpha_ss, p.params_a_cab_0, p.params_a_cab_1, p.params_a_cab_2, p.params_a_cab_3, p.params_a_cab_4, p.params_a_css_0, p.params_a_css_1, p.params_a_css_2, p.params_a_css_3, p.params_a_css_4, p.params_a_dab_0, p.params_a_dab_1, p.params_a_dab_2, p.params_a_dab_3, p.params_a_dab_4, p.params_a_dab_5, p.params_a_dss_0, p.params_a_dss_1, p.params_a_dss_2, p.params_a_dss_3, p.params_a_dss_4, p.params_a_dss_5, p.params_a_gamma_ab, p.params_a_gamma_ss, p.zeta_threshold)
end

export mgga_c_m06, mgga_c_m06_defaults, mgga_c_m06_required

const mgga_c_m06_2x_defaults = (dens_threshold = 1.0e-12, params_a_Fermi_D_cnst = 1.0e-10, params_a_alpha_ab = 0.00304966, params_a_alpha_ss = 0.00515088, params_a_cab_0 = 0.8833596, params_a_cab_1 = 33.57972, params_a_cab_2 = -70.43548, params_a_cab_3 = 49.78271, params_a_cab_4 = -18.52891, params_a_css_0 = 0.3097855, params_a_css_1 = -5.528642, params_a_css_2 = 13.4742, params_a_css_3 = -32.13623, params_a_css_4 = 28.46742, params_a_dab_0 = 0.1166404, params_a_dab_1 = -0.09120847, params_a_dab_2 = -0.06726189, params_a_dab_3 = 6.72058e-5, params_a_dab_4 = 0.0008448011, params_a_dab_5 = 0.0, params_a_dss_0 = 0.6902145, params_a_dss_1 = 0.09847204, params_a_dss_2 = 0.2214797, params_a_dss_3 = -0.001968264, params_a_dss_4 = -0.006775479, params_a_dss_5 = 0.0, params_a_gamma_ab = 0.0031, params_a_gamma_ss = 0.06, zeta_threshold = 2.220446049250313e-16)
const mgga_c_m06_2x_required = ()

function mgga_c_m06_2x(rho, sigma, lapl, tau; params = NamedTuple())
    p = resolve_params(mgga_c_m06_2x_defaults, mgga_c_m06_2x_required, params)
    v = mgga_variables(rho, sigma, lapl, tau, Val(3))
    return mgga_c_m06l_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.dens_threshold, p.params_a_Fermi_D_cnst, p.params_a_alpha_ab, p.params_a_alpha_ss, p.params_a_cab_0, p.params_a_cab_1, p.params_a_cab_2, p.params_a_cab_3, p.params_a_cab_4, p.params_a_css_0, p.params_a_css_1, p.params_a_css_2, p.params_a_css_3, p.params_a_css_4, p.params_a_dab_0, p.params_a_dab_1, p.params_a_dab_2, p.params_a_dab_3, p.params_a_dab_4, p.params_a_dab_5, p.params_a_dss_0, p.params_a_dss_1, p.params_a_dss_2, p.params_a_dss_3, p.params_a_dss_4, p.params_a_dss_5, p.params_a_gamma_ab, p.params_a_gamma_ss, p.zeta_threshold)
end

function mgga_c_m06_2x(na, nb, gaa, gab, gbb, la, lb, ta, tb; params = NamedTuple())
    p = resolve_params(mgga_c_m06_2x_defaults, mgga_c_m06_2x_required, params)
    v = mgga_variables(na, nb, gaa, gab, gbb, la, lb, ta, tb, Val(3))
    return mgga_c_m06l_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.dens_threshold, p.params_a_Fermi_D_cnst, p.params_a_alpha_ab, p.params_a_alpha_ss, p.params_a_cab_0, p.params_a_cab_1, p.params_a_cab_2, p.params_a_cab_3, p.params_a_cab_4, p.params_a_css_0, p.params_a_css_1, p.params_a_css_2, p.params_a_css_3, p.params_a_css_4, p.params_a_dab_0, p.params_a_dab_1, p.params_a_dab_2, p.params_a_dab_3, p.params_a_dab_4, p.params_a_dab_5, p.params_a_dss_0, p.params_a_dss_1, p.params_a_dss_2, p.params_a_dss_3, p.params_a_dss_4, p.params_a_dss_5, p.params_a_gamma_ab, p.params_a_gamma_ss, p.zeta_threshold)
end

export mgga_c_m06_2x, mgga_c_m06_2x_defaults, mgga_c_m06_2x_required

const mgga_c_m06_hf_defaults = (dens_threshold = 1.0e-12, params_a_Fermi_D_cnst = 1.0e-10, params_a_alpha_ab = 0.00304966, params_a_alpha_ss = 0.00515088, params_a_cab_0 = 1.674634, params_a_cab_1 = 57.32017, params_a_cab_2 = 59.55416, params_a_cab_3 = -231.1007, params_a_cab_4 = 125.5199, params_a_css_0 = 0.1023254, params_a_css_1 = -2.453783, params_a_css_2 = 29.1318, params_a_css_3 = -34.94358, params_a_css_4 = 23.15955, params_a_dab_0 = -0.6746338, params_a_dab_1 = -0.1534002, params_a_dab_2 = -0.09021521, params_a_dab_3 = -0.001292037, params_a_dab_4 = -0.0002352983, params_a_dab_5 = 0.0, params_a_dss_0 = 0.8976746, params_a_dss_1 = -0.234583, params_a_dss_2 = 0.2368173, params_a_dss_3 = -0.000991389, params_a_dss_4 = -0.01146165, params_a_dss_5 = 0.0, params_a_gamma_ab = 0.0031, params_a_gamma_ss = 0.06, zeta_threshold = 2.220446049250313e-16)
const mgga_c_m06_hf_required = ()

function mgga_c_m06_hf(rho, sigma, lapl, tau; params = NamedTuple())
    p = resolve_params(mgga_c_m06_hf_defaults, mgga_c_m06_hf_required, params)
    v = mgga_variables(rho, sigma, lapl, tau, Val(3))
    return mgga_c_m06l_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.dens_threshold, p.params_a_Fermi_D_cnst, p.params_a_alpha_ab, p.params_a_alpha_ss, p.params_a_cab_0, p.params_a_cab_1, p.params_a_cab_2, p.params_a_cab_3, p.params_a_cab_4, p.params_a_css_0, p.params_a_css_1, p.params_a_css_2, p.params_a_css_3, p.params_a_css_4, p.params_a_dab_0, p.params_a_dab_1, p.params_a_dab_2, p.params_a_dab_3, p.params_a_dab_4, p.params_a_dab_5, p.params_a_dss_0, p.params_a_dss_1, p.params_a_dss_2, p.params_a_dss_3, p.params_a_dss_4, p.params_a_dss_5, p.params_a_gamma_ab, p.params_a_gamma_ss, p.zeta_threshold)
end

function mgga_c_m06_hf(na, nb, gaa, gab, gbb, la, lb, ta, tb; params = NamedTuple())
    p = resolve_params(mgga_c_m06_hf_defaults, mgga_c_m06_hf_required, params)
    v = mgga_variables(na, nb, gaa, gab, gbb, la, lb, ta, tb, Val(3))
    return mgga_c_m06l_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.dens_threshold, p.params_a_Fermi_D_cnst, p.params_a_alpha_ab, p.params_a_alpha_ss, p.params_a_cab_0, p.params_a_cab_1, p.params_a_cab_2, p.params_a_cab_3, p.params_a_cab_4, p.params_a_css_0, p.params_a_css_1, p.params_a_css_2, p.params_a_css_3, p.params_a_css_4, p.params_a_dab_0, p.params_a_dab_1, p.params_a_dab_2, p.params_a_dab_3, p.params_a_dab_4, p.params_a_dab_5, p.params_a_dss_0, p.params_a_dss_1, p.params_a_dss_2, p.params_a_dss_3, p.params_a_dss_4, p.params_a_dss_5, p.params_a_gamma_ab, p.params_a_gamma_ss, p.zeta_threshold)
end

export mgga_c_m06_hf, mgga_c_m06_hf_defaults, mgga_c_m06_hf_required

const mgga_c_m06_l_defaults = (dens_threshold = 1.0e-12, params_a_Fermi_D_cnst = 1.0e-10, params_a_alpha_ab = 0.00304966, params_a_alpha_ss = 0.00515088, params_a_cab_0 = 0.6042374, params_a_cab_1 = 177.6783, params_a_cab_2 = -251.3252, params_a_cab_3 = 76.35173, params_a_cab_4 = -12.55699, params_a_css_0 = 0.5349466, params_a_css_1 = 0.539662, params_a_css_2 = -31.61217, params_a_css_3 = 51.49592, params_a_css_4 = -29.19613, params_a_dab_0 = 0.3957626, params_a_dab_1 = -0.5614546, params_a_dab_2 = 0.01403963, params_a_dab_3 = 0.0009831442, params_a_dab_4 = -0.003577176, params_a_dab_5 = 0.0, params_a_dss_0 = 0.4650534, params_a_dss_1 = 0.1617589, params_a_dss_2 = 0.1833657, params_a_dss_3 = 0.00046921, params_a_dss_4 = -0.004990573, params_a_dss_5 = 0.0, params_a_gamma_ab = 0.0031, params_a_gamma_ss = 0.06, zeta_threshold = 2.220446049250313e-16)
const mgga_c_m06_l_required = ()

function mgga_c_m06_l(rho, sigma, lapl, tau; params = NamedTuple())
    p = resolve_params(mgga_c_m06_l_defaults, mgga_c_m06_l_required, params)
    v = mgga_variables(rho, sigma, lapl, tau, Val(3))
    return mgga_c_m06l_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.dens_threshold, p.params_a_Fermi_D_cnst, p.params_a_alpha_ab, p.params_a_alpha_ss, p.params_a_cab_0, p.params_a_cab_1, p.params_a_cab_2, p.params_a_cab_3, p.params_a_cab_4, p.params_a_css_0, p.params_a_css_1, p.params_a_css_2, p.params_a_css_3, p.params_a_css_4, p.params_a_dab_0, p.params_a_dab_1, p.params_a_dab_2, p.params_a_dab_3, p.params_a_dab_4, p.params_a_dab_5, p.params_a_dss_0, p.params_a_dss_1, p.params_a_dss_2, p.params_a_dss_3, p.params_a_dss_4, p.params_a_dss_5, p.params_a_gamma_ab, p.params_a_gamma_ss, p.zeta_threshold)
end

function mgga_c_m06_l(na, nb, gaa, gab, gbb, la, lb, ta, tb; params = NamedTuple())
    p = resolve_params(mgga_c_m06_l_defaults, mgga_c_m06_l_required, params)
    v = mgga_variables(na, nb, gaa, gab, gbb, la, lb, ta, tb, Val(3))
    return mgga_c_m06l_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.dens_threshold, p.params_a_Fermi_D_cnst, p.params_a_alpha_ab, p.params_a_alpha_ss, p.params_a_cab_0, p.params_a_cab_1, p.params_a_cab_2, p.params_a_cab_3, p.params_a_cab_4, p.params_a_css_0, p.params_a_css_1, p.params_a_css_2, p.params_a_css_3, p.params_a_css_4, p.params_a_dab_0, p.params_a_dab_1, p.params_a_dab_2, p.params_a_dab_3, p.params_a_dab_4, p.params_a_dab_5, p.params_a_dss_0, p.params_a_dss_1, p.params_a_dss_2, p.params_a_dss_3, p.params_a_dss_4, p.params_a_dss_5, p.params_a_gamma_ab, p.params_a_gamma_ss, p.zeta_threshold)
end

export mgga_c_m06_l, mgga_c_m06_l_defaults, mgga_c_m06_l_required

const mgga_c_m06_sx_defaults = (dens_threshold = 1.0e-14, params_a_Fermi_D_cnst = 1.0e-10, params_a_alpha_ab = 0.00304966, params_a_alpha_ss = 0.00515088, params_a_cab_0 = 0.163738167314691, params_a_cab_1 = -0.436481171027951, params_a_cab_2 = -1.90232628449712, params_a_cab_3 = -1.42432902881841, params_a_cab_4 = -0.905909137360893, params_a_css_0 = 1.17575011057022, params_a_css_1 = 0.658083496678423, params_a_css_2 = -2.78913774852905, params_a_css_3 = -1.18597601856255, params_a_css_4 = 1.16439928209688, params_a_dab_0 = 0.740594619832397, params_a_dab_1 = 0.0123306511345974, params_a_dab_2 = -0.0188253421850249, params_a_dab_3 = 0.0, params_a_dab_4 = 0.0, params_a_dab_5 = 0.000487276242162303, params_a_dss_0 = 0.0817322574473352, params_a_dss_1 = -0.0288531085759385, params_a_dss_2 = 0.090591773486813, params_a_dss_3 = 0.0, params_a_dss_4 = 0.0, params_a_dss_5 = -0.000486297499082106, params_a_gamma_ab = 0.0031, params_a_gamma_ss = 0.06, zeta_threshold = 2.220446049250313e-16)
const mgga_c_m06_sx_required = ()

function mgga_c_m06_sx(rho, sigma, lapl, tau; params = NamedTuple())
    p = resolve_params(mgga_c_m06_sx_defaults, mgga_c_m06_sx_required, params)
    v = mgga_variables(rho, sigma, lapl, tau, Val(3))
    return mgga_c_m06l_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.dens_threshold, p.params_a_Fermi_D_cnst, p.params_a_alpha_ab, p.params_a_alpha_ss, p.params_a_cab_0, p.params_a_cab_1, p.params_a_cab_2, p.params_a_cab_3, p.params_a_cab_4, p.params_a_css_0, p.params_a_css_1, p.params_a_css_2, p.params_a_css_3, p.params_a_css_4, p.params_a_dab_0, p.params_a_dab_1, p.params_a_dab_2, p.params_a_dab_3, p.params_a_dab_4, p.params_a_dab_5, p.params_a_dss_0, p.params_a_dss_1, p.params_a_dss_2, p.params_a_dss_3, p.params_a_dss_4, p.params_a_dss_5, p.params_a_gamma_ab, p.params_a_gamma_ss, p.zeta_threshold)
end

function mgga_c_m06_sx(na, nb, gaa, gab, gbb, la, lb, ta, tb; params = NamedTuple())
    p = resolve_params(mgga_c_m06_sx_defaults, mgga_c_m06_sx_required, params)
    v = mgga_variables(na, nb, gaa, gab, gbb, la, lb, ta, tb, Val(3))
    return mgga_c_m06l_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.dens_threshold, p.params_a_Fermi_D_cnst, p.params_a_alpha_ab, p.params_a_alpha_ss, p.params_a_cab_0, p.params_a_cab_1, p.params_a_cab_2, p.params_a_cab_3, p.params_a_cab_4, p.params_a_css_0, p.params_a_css_1, p.params_a_css_2, p.params_a_css_3, p.params_a_css_4, p.params_a_dab_0, p.params_a_dab_1, p.params_a_dab_2, p.params_a_dab_3, p.params_a_dab_4, p.params_a_dab_5, p.params_a_dss_0, p.params_a_dss_1, p.params_a_dss_2, p.params_a_dss_3, p.params_a_dss_4, p.params_a_dss_5, p.params_a_gamma_ab, p.params_a_gamma_ss, p.zeta_threshold)
end

export mgga_c_m06_sx, mgga_c_m06_sx_defaults, mgga_c_m06_sx_required

const mgga_c_pi_m06_2x_defaults = (dens_threshold = 1.0e-12, params_a_Fermi_D_cnst = 1.0e-10, params_a_alpha_ab = 0.00304966, params_a_alpha_ss = 0.00515088, params_a_cab_0 = 3.18795645, params_a_cab_1 = 91.6748052, params_a_cab_2 = -76.9104553, params_a_cab_3 = -8.38251785, params_a_cab_4 = -12.4255278, params_a_css_0 = -80.5221504, params_a_css_1 = -8.39774959, params_a_css_2 = 122.023642, params_a_css_3 = -224.496186, params_a_css_4 = 186.914316, params_a_dab_0 = -2.35239666, params_a_dab_1 = -0.286778663, params_a_dab_2 = -0.0143194201, params_a_dab_3 = -0.000215170742, params_a_dab_4 = -0.00217407873, params_a_dab_5 = 0.0, params_a_dss_0 = 82.720092, params_a_dss_1 = -0.4050328, params_a_dss_2 = 0.726404883, params_a_dss_3 = 0.0021612542, params_a_dss_4 = -0.013146388, params_a_dss_5 = 0.0, params_a_gamma_ab = 0.0031, params_a_gamma_ss = 0.06, zeta_threshold = 2.220446049250313e-16)
const mgga_c_pi_m06_2x_required = ()

function mgga_c_pi_m06_2x(rho, sigma, lapl, tau; params = NamedTuple())
    p = resolve_params(mgga_c_pi_m06_2x_defaults, mgga_c_pi_m06_2x_required, params)
    v = mgga_variables(rho, sigma, lapl, tau, Val(3))
    return mgga_c_m06l_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.dens_threshold, p.params_a_Fermi_D_cnst, p.params_a_alpha_ab, p.params_a_alpha_ss, p.params_a_cab_0, p.params_a_cab_1, p.params_a_cab_2, p.params_a_cab_3, p.params_a_cab_4, p.params_a_css_0, p.params_a_css_1, p.params_a_css_2, p.params_a_css_3, p.params_a_css_4, p.params_a_dab_0, p.params_a_dab_1, p.params_a_dab_2, p.params_a_dab_3, p.params_a_dab_4, p.params_a_dab_5, p.params_a_dss_0, p.params_a_dss_1, p.params_a_dss_2, p.params_a_dss_3, p.params_a_dss_4, p.params_a_dss_5, p.params_a_gamma_ab, p.params_a_gamma_ss, p.zeta_threshold)
end

function mgga_c_pi_m06_2x(na, nb, gaa, gab, gbb, la, lb, ta, tb; params = NamedTuple())
    p = resolve_params(mgga_c_pi_m06_2x_defaults, mgga_c_pi_m06_2x_required, params)
    v = mgga_variables(na, nb, gaa, gab, gbb, la, lb, ta, tb, Val(3))
    return mgga_c_m06l_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.dens_threshold, p.params_a_Fermi_D_cnst, p.params_a_alpha_ab, p.params_a_alpha_ss, p.params_a_cab_0, p.params_a_cab_1, p.params_a_cab_2, p.params_a_cab_3, p.params_a_cab_4, p.params_a_css_0, p.params_a_css_1, p.params_a_css_2, p.params_a_css_3, p.params_a_css_4, p.params_a_dab_0, p.params_a_dab_1, p.params_a_dab_2, p.params_a_dab_3, p.params_a_dab_4, p.params_a_dab_5, p.params_a_dss_0, p.params_a_dss_1, p.params_a_dss_2, p.params_a_dss_3, p.params_a_dss_4, p.params_a_dss_5, p.params_a_gamma_ab, p.params_a_gamma_ss, p.zeta_threshold)
end

export mgga_c_pi_m06_2x, mgga_c_pi_m06_2x_defaults, mgga_c_pi_m06_2x_required

const mgga_c_pi_m06_2x_dl_defaults = (dens_threshold = 1.0e-12, params_a_Fermi_D_cnst = 1.0e-10, params_a_alpha_ab = 0.00304966, params_a_alpha_ss = 0.00515088, params_a_cab_0 = 29.5107885, params_a_cab_1 = -64.3287326, params_a_cab_2 = 43.3840077, params_a_cab_3 = -13.6853427, params_a_cab_4 = 5.0910851, params_a_css_0 = 27.0283368, params_a_css_1 = -2.20733555, params_a_css_2 = -22.8984013, params_a_css_3 = 36.6739237, params_a_css_4 = -37.0195328, params_a_dab_0 = -28.5255664, params_a_dab_1 = 0.108768648, params_a_dab_2 = -0.105521341, params_a_dab_3 = -8.72951987e-5, params_a_dab_4 = 0.000799015876, params_a_dab_5 = 0.0, params_a_dss_0 = -26.3995705, params_a_dss_1 = 0.204900938, params_a_dss_2 = -0.128889658, params_a_dss_3 = -0.000975282842, params_a_dss_4 = 0.000450949166, params_a_dss_5 = 0.0, params_a_gamma_ab = 0.0031, params_a_gamma_ss = 0.06, zeta_threshold = 2.220446049250313e-16)
const mgga_c_pi_m06_2x_dl_required = ()

function mgga_c_pi_m06_2x_dl(rho, sigma, lapl, tau; params = NamedTuple())
    p = resolve_params(mgga_c_pi_m06_2x_dl_defaults, mgga_c_pi_m06_2x_dl_required, params)
    v = mgga_variables(rho, sigma, lapl, tau, Val(3))
    return mgga_c_m06l_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.dens_threshold, p.params_a_Fermi_D_cnst, p.params_a_alpha_ab, p.params_a_alpha_ss, p.params_a_cab_0, p.params_a_cab_1, p.params_a_cab_2, p.params_a_cab_3, p.params_a_cab_4, p.params_a_css_0, p.params_a_css_1, p.params_a_css_2, p.params_a_css_3, p.params_a_css_4, p.params_a_dab_0, p.params_a_dab_1, p.params_a_dab_2, p.params_a_dab_3, p.params_a_dab_4, p.params_a_dab_5, p.params_a_dss_0, p.params_a_dss_1, p.params_a_dss_2, p.params_a_dss_3, p.params_a_dss_4, p.params_a_dss_5, p.params_a_gamma_ab, p.params_a_gamma_ss, p.zeta_threshold)
end

function mgga_c_pi_m06_2x_dl(na, nb, gaa, gab, gbb, la, lb, ta, tb; params = NamedTuple())
    p = resolve_params(mgga_c_pi_m06_2x_dl_defaults, mgga_c_pi_m06_2x_dl_required, params)
    v = mgga_variables(na, nb, gaa, gab, gbb, la, lb, ta, tb, Val(3))
    return mgga_c_m06l_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.dens_threshold, p.params_a_Fermi_D_cnst, p.params_a_alpha_ab, p.params_a_alpha_ss, p.params_a_cab_0, p.params_a_cab_1, p.params_a_cab_2, p.params_a_cab_3, p.params_a_cab_4, p.params_a_css_0, p.params_a_css_1, p.params_a_css_2, p.params_a_css_3, p.params_a_css_4, p.params_a_dab_0, p.params_a_dab_1, p.params_a_dab_2, p.params_a_dab_3, p.params_a_dab_4, p.params_a_dab_5, p.params_a_dss_0, p.params_a_dss_1, p.params_a_dss_2, p.params_a_dss_3, p.params_a_dss_4, p.params_a_dss_5, p.params_a_gamma_ab, p.params_a_gamma_ss, p.zeta_threshold)
end

export mgga_c_pi_m06_2x_dl, mgga_c_pi_m06_2x_dl_defaults, mgga_c_pi_m06_2x_dl_required

const mgga_c_revm06_defaults = (dens_threshold = 1.0e-12, params_a_Fermi_D_cnst = 1.0e-10, params_a_alpha_ab = 0.00304966, params_a_alpha_ss = 0.00515088, params_a_cab_0 = 1.222401598, params_a_cab_1 = 0.6613907336, params_a_cab_2 = -1.884581043, params_a_cab_3 = -2.780360568, params_a_cab_4 = -3.068579344, params_a_css_0 = 0.9017224575, params_a_css_1 = 0.2079991827, params_a_css_2 = -1.823747562, params_a_css_3 = -1.384430429, params_a_css_4 = -0.4423253381, params_a_dab_0 = -0.339066672, params_a_dab_1 = 0.003790156384, params_a_dab_2 = -0.02762485975, params_a_dab_3 = 0.0, params_a_dab_4 = 0.0, params_a_dab_5 = 0.0004076285162, params_a_dss_0 = -0.14670959, params_a_dss_1 = -0.0001832187007, params_a_dss_2 = 0.0848437243, params_a_dss_3 = 0.0, params_a_dss_4 = 0.0, params_a_dss_5 = 0.0002280677172, params_a_gamma_ab = 0.0031, params_a_gamma_ss = 0.06, zeta_threshold = 2.220446049250313e-16)
const mgga_c_revm06_required = ()

function mgga_c_revm06(rho, sigma, lapl, tau; params = NamedTuple())
    p = resolve_params(mgga_c_revm06_defaults, mgga_c_revm06_required, params)
    v = mgga_variables(rho, sigma, lapl, tau, Val(3))
    return mgga_c_m06l_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.dens_threshold, p.params_a_Fermi_D_cnst, p.params_a_alpha_ab, p.params_a_alpha_ss, p.params_a_cab_0, p.params_a_cab_1, p.params_a_cab_2, p.params_a_cab_3, p.params_a_cab_4, p.params_a_css_0, p.params_a_css_1, p.params_a_css_2, p.params_a_css_3, p.params_a_css_4, p.params_a_dab_0, p.params_a_dab_1, p.params_a_dab_2, p.params_a_dab_3, p.params_a_dab_4, p.params_a_dab_5, p.params_a_dss_0, p.params_a_dss_1, p.params_a_dss_2, p.params_a_dss_3, p.params_a_dss_4, p.params_a_dss_5, p.params_a_gamma_ab, p.params_a_gamma_ss, p.zeta_threshold)
end

function mgga_c_revm06(na, nb, gaa, gab, gbb, la, lb, ta, tb; params = NamedTuple())
    p = resolve_params(mgga_c_revm06_defaults, mgga_c_revm06_required, params)
    v = mgga_variables(na, nb, gaa, gab, gbb, la, lb, ta, tb, Val(3))
    return mgga_c_m06l_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.dens_threshold, p.params_a_Fermi_D_cnst, p.params_a_alpha_ab, p.params_a_alpha_ss, p.params_a_cab_0, p.params_a_cab_1, p.params_a_cab_2, p.params_a_cab_3, p.params_a_cab_4, p.params_a_css_0, p.params_a_css_1, p.params_a_css_2, p.params_a_css_3, p.params_a_css_4, p.params_a_dab_0, p.params_a_dab_1, p.params_a_dab_2, p.params_a_dab_3, p.params_a_dab_4, p.params_a_dab_5, p.params_a_dss_0, p.params_a_dss_1, p.params_a_dss_2, p.params_a_dss_3, p.params_a_dss_4, p.params_a_dss_5, p.params_a_gamma_ab, p.params_a_gamma_ss, p.zeta_threshold)
end

export mgga_c_revm06, mgga_c_revm06_defaults, mgga_c_revm06_required

const mgga_c_revm06_l_defaults = (dens_threshold = 1.0e-12, params_a_Fermi_D_cnst = 1.0e-10, params_a_alpha_ab = 0.00304966, params_a_alpha_ss = 0.00515088, params_a_cab_0 = 0.344360696, params_a_cab_1 = -0.557080242, params_a_cab_2 = -2.009821162, params_a_cab_3 = -1.857641887, params_a_cab_4 = -1.076639864, params_a_css_0 = 1.227659748, params_a_css_1 = 0.855201283, params_a_css_2 = -3.113346677, params_a_css_3 = -2.239678026, params_a_css_4 = 0.354638962, params_a_dab_0 = 0.4007146, params_a_dab_1 = 0.015796569, params_a_dab_2 = -0.032680984, params_a_dab_3 = 0.0, params_a_dab_4 = 0.0, params_a_dab_5 = 0.001260132, params_a_dss_0 = -0.538821292, params_a_dss_1 = -0.02829603, params_a_dss_2 = 0.023889696, params_a_dss_3 = 0.0, params_a_dss_4 = 0.0, params_a_dss_5 = -0.002437902, params_a_gamma_ab = 0.0031, params_a_gamma_ss = 0.06, zeta_threshold = 2.220446049250313e-16)
const mgga_c_revm06_l_required = ()

function mgga_c_revm06_l(rho, sigma, lapl, tau; params = NamedTuple())
    p = resolve_params(mgga_c_revm06_l_defaults, mgga_c_revm06_l_required, params)
    v = mgga_variables(rho, sigma, lapl, tau, Val(3))
    return mgga_c_m06l_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.dens_threshold, p.params_a_Fermi_D_cnst, p.params_a_alpha_ab, p.params_a_alpha_ss, p.params_a_cab_0, p.params_a_cab_1, p.params_a_cab_2, p.params_a_cab_3, p.params_a_cab_4, p.params_a_css_0, p.params_a_css_1, p.params_a_css_2, p.params_a_css_3, p.params_a_css_4, p.params_a_dab_0, p.params_a_dab_1, p.params_a_dab_2, p.params_a_dab_3, p.params_a_dab_4, p.params_a_dab_5, p.params_a_dss_0, p.params_a_dss_1, p.params_a_dss_2, p.params_a_dss_3, p.params_a_dss_4, p.params_a_dss_5, p.params_a_gamma_ab, p.params_a_gamma_ss, p.zeta_threshold)
end

function mgga_c_revm06_l(na, nb, gaa, gab, gbb, la, lb, ta, tb; params = NamedTuple())
    p = resolve_params(mgga_c_revm06_l_defaults, mgga_c_revm06_l_required, params)
    v = mgga_variables(na, nb, gaa, gab, gbb, la, lb, ta, tb, Val(3))
    return mgga_c_m06l_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.dens_threshold, p.params_a_Fermi_D_cnst, p.params_a_alpha_ab, p.params_a_alpha_ss, p.params_a_cab_0, p.params_a_cab_1, p.params_a_cab_2, p.params_a_cab_3, p.params_a_cab_4, p.params_a_css_0, p.params_a_css_1, p.params_a_css_2, p.params_a_css_3, p.params_a_css_4, p.params_a_dab_0, p.params_a_dab_1, p.params_a_dab_2, p.params_a_dab_3, p.params_a_dab_4, p.params_a_dab_5, p.params_a_dss_0, p.params_a_dss_1, p.params_a_dss_2, p.params_a_dss_3, p.params_a_dss_4, p.params_a_dss_5, p.params_a_gamma_ab, p.params_a_gamma_ss, p.zeta_threshold)
end

export mgga_c_revm06_l, mgga_c_revm06_l_defaults, mgga_c_revm06_l_required
