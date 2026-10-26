# Auto-generated from the Libxc sources
# python/mgga_exc/mgga_c_m05.py -- do not edit by hand.
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
# args: rs, z, xt, xs0, xs1, u0, u1, t0, t1, dens_threshold, params_a_Fermi_D_cnst, params_a_cab_0, params_a_cab_1, params_a_cab_2, params_a_cab_3, params_a_cab_4, params_a_css_0, params_a_css_1, params_a_css_2, params_a_css_3, params_a_css_4, params_a_gamma_ab, params_a_gamma_ss, zeta_threshold
const mgga_c_m05_energy = function (rs, z, xt, xs0, xs1, u0, u1, t0, t1, dens_threshold, params_a_Fermi_D_cnst, params_a_cab_0, params_a_cab_1, params_a_cab_2, params_a_cab_3, params_a_cab_4, params_a_css_0, params_a_css_1, params_a_css_2, params_a_css_3, params_a_css_4, params_a_gamma_ab, params_a_gamma_ss, zeta_threshold)
    @inbounds begin
        cse_tmp_0 = xs0 ^ 2
        cse_tmp_1 = 4 / params_a_Fermi_D_cnst ^ 2
        cse_tmp_2 = cse_tmp_0 * params_a_gamma_ss
        cse_tmp_3 = cse_tmp_2 + 1
        cse_tmp_4 = params_a_css_2 * params_a_gamma_ss ^ 2
        cse_tmp_5 = params_a_css_3 * params_a_gamma_ss ^ 3
        cse_tmp_6 = params_a_css_4 * params_a_gamma_ss ^ 4
        cse_tmp_7 = z + 1
        cse_tmp_9 = (3 // 8) / (pi * rs ^ 3)
        cse_tmp_10 = zeta_threshold - 1
        cse_tmp_11 = xc_log1p(my_piecewise3(z > cse_tmp_10, z, cse_tmp_10))
        cse_tmp_12 = 0.01328816518 * rs
        cse_tmp_13 = 1.2599210498948732
        cse_tmp_14 = -1 + NaNMath.pow(zeta_threshold, -0.3333333333333333)
        cse_tmp_15 = my_piecewise3(cse_tmp_7 <= zeta_threshold, cse_tmp_14, xc_expm1(-cse_tmp_11 / 3)) + 1
        cse_tmp_16 = cse_tmp_13 * cse_tmp_15
        cse_tmp_17 = 0.22308199064 * rs
        cse_tmp_18 = NaNMath.sqrt(rs)
        cse_tmp_19 = 0.47231125998 * cse_tmp_18
        cse_tmp_20 = 1.122462048309373
        cse_tmp_21 = NaNMath.sqrt(cse_tmp_15) * cse_tmp_20
        cse_tmp_22 = NaNMath.pow(rs, 1.5)
        cse_tmp_23 = 0.10186556948 * cse_tmp_22
        cse_tmp_24 = 1.4142135623730951
        cse_tmp_25 = NaNMath.pow(cse_tmp_15, 1.5) * cse_tmp_24
        cse_tmp_26 = rs ^ 2
        cse_tmp_27 = 0.030651699316 * cse_tmp_26
        cse_tmp_28 = 1.5874010519681994
        cse_tmp_29 = cse_tmp_15 ^ 2 * cse_tmp_28
        cse_tmp_30 = (-cse_tmp_12 * cse_tmp_16 - 0.0621814) * xc_log1p((cse_tmp_16 * cse_tmp_17 + cse_tmp_19 * cse_tmp_21 + cse_tmp_23 * cse_tmp_25 + cse_tmp_27 * cse_tmp_29) ^ (-1))
        cse_tmp_31 = 0.00375733525 * rs
        cse_tmp_32 = 0.12236585478 * rs
        cse_tmp_33 = 0.3497952466 * cse_tmp_18
        cse_tmp_34 = 0.029729725188 * cse_tmp_22
        cse_tmp_35 = 0.016775784198 * cse_tmp_26
        cse_tmp_36 = 0.5848223622634646207262238663759 * (-cse_tmp_16 * cse_tmp_31 - 0.0337738) * xc_log1p((cse_tmp_16 * cse_tmp_32 + cse_tmp_21 * cse_tmp_33 + cse_tmp_25 * cse_tmp_34 + cse_tmp_29 * cse_tmp_35) ^ (-1))
        cse_tmp_37 = (2 * cse_tmp_13 - 2) ^ (-1)
        cse_tmp_38 = NaNMath.pow(zeta_threshold, 1.3333333333333333) - 1
        cse_tmp_39 = cse_tmp_37 * (cse_tmp_38 + my_piecewise3(2 <= zeta_threshold, cse_tmp_38, xc_expm1((4 // 3) * xc_log1p(my_piecewise3(1 > cse_tmp_10, 1, cse_tmp_10)))))
        cse_tmp_40 = 0.006388517036 * rs
        cse_tmp_41 = 0.19269083139 * rs
        cse_tmp_42 = 0.43896648423 * cse_tmp_18
        cse_tmp_43 = 0.10465751434 * cse_tmp_22
        cse_tmp_44 = 0.019436972919 * cse_tmp_26
        cse_tmp_45 = my_piecewise3(cse_tmp_7 <= zeta_threshold || cse_tmp_7 * cse_tmp_9 <= dens_threshold, 0, (my_piecewise3(cse_tmp_7 <= zeta_threshold, cse_tmp_10, xc_expm1(cse_tmp_11)) / 2 + 1 // 2) * (cse_tmp_30 - cse_tmp_36 * cse_tmp_39 + cse_tmp_39 * (-cse_tmp_30 + cse_tmp_36 + (-cse_tmp_16 * cse_tmp_40 - 0.0310907) * xc_log1p((cse_tmp_16 * cse_tmp_41 + cse_tmp_21 * cse_tmp_42 + cse_tmp_25 * cse_tmp_43 + cse_tmp_29 * cse_tmp_44) ^ (-1)))))
        cse_tmp_46 = xs1 ^ 2
        cse_tmp_47 = cse_tmp_46 * params_a_gamma_ss
        cse_tmp_48 = cse_tmp_47 + 1
        cse_tmp_49 = 1 - z
        cse_tmp_51 = -z
        cse_tmp_52 = xc_log1p(my_piecewise3(cse_tmp_51 > cse_tmp_10, cse_tmp_51, cse_tmp_10))
        cse_tmp_53 = my_piecewise3(cse_tmp_49 <= zeta_threshold, cse_tmp_14, xc_expm1(-cse_tmp_52 / 3)) + 1
        cse_tmp_54 = cse_tmp_13 * cse_tmp_53
        cse_tmp_55 = cse_tmp_20 * NaNMath.sqrt(cse_tmp_53)
        cse_tmp_56 = cse_tmp_24 * NaNMath.pow(cse_tmp_53, 1.5)
        cse_tmp_57 = cse_tmp_28 * cse_tmp_53 ^ 2
        cse_tmp_58 = (-cse_tmp_12 * cse_tmp_54 - 0.0621814) * xc_log1p((cse_tmp_17 * cse_tmp_54 + cse_tmp_19 * cse_tmp_55 + cse_tmp_23 * cse_tmp_56 + cse_tmp_27 * cse_tmp_57) ^ (-1))
        cse_tmp_59 = 0.5848223622634646207262238663759 * (-cse_tmp_31 * cse_tmp_54 - 0.0337738) * xc_log1p((cse_tmp_32 * cse_tmp_54 + cse_tmp_33 * cse_tmp_55 + cse_tmp_34 * cse_tmp_56 + cse_tmp_35 * cse_tmp_57) ^ (-1))
        cse_tmp_60 = my_piecewise3(cse_tmp_49 <= zeta_threshold || cse_tmp_49 * cse_tmp_9 <= dens_threshold, 0, (my_piecewise3(cse_tmp_49 <= zeta_threshold, cse_tmp_10, xc_expm1(cse_tmp_52)) / 2 + 1 // 2) * (-cse_tmp_39 * cse_tmp_59 + cse_tmp_39 * (-cse_tmp_58 + cse_tmp_59 + (-cse_tmp_40 * cse_tmp_54 - 0.0310907) * xc_log1p((cse_tmp_41 * cse_tmp_54 + cse_tmp_42 * cse_tmp_55 + cse_tmp_43 * cse_tmp_56 + cse_tmp_44 * cse_tmp_57) ^ (-1))) + cse_tmp_58))
        cse_tmp_61 = cse_tmp_0 + cse_tmp_46
        cse_tmp_62 = cse_tmp_61 * params_a_gamma_ab
        cse_tmp_63 = cse_tmp_62 + 1
        cse_tmp_64 = -(-cse_tmp_12 - 0.0621814) * xc_log1p((cse_tmp_17 + cse_tmp_19 + cse_tmp_23 + cse_tmp_27) ^ (-1))
        cse_tmp_65 = 0.5848223622634646207262238663759 * (-cse_tmp_31 - 0.0337738) * xc_log1p((cse_tmp_32 + cse_tmp_33 + cse_tmp_34 + cse_tmp_35) ^ (-1))
        cse_tmp_66 = my_piecewise3(cse_tmp_49 <= zeta_threshold, cse_tmp_38, xc_expm1((4 // 3) * cse_tmp_52)) + my_piecewise3(cse_tmp_7 <= zeta_threshold, cse_tmp_38, xc_expm1((4 // 3) * cse_tmp_11))
        -cse_tmp_45 * (-cse_tmp_0 + 8 * t0) * (cse_tmp_2 * params_a_css_1 / cse_tmp_3 + params_a_css_0 + cse_tmp_4 * xs0 ^ 4 / cse_tmp_3 ^ 2 + cse_tmp_5 * xs0 ^ 6 / cse_tmp_3 ^ 3 + cse_tmp_6 * xs0 ^ 8 / cse_tmp_3 ^ 4) * xc_expm1(-cse_tmp_1 * t0 ^ 2) / (8 * t0) - cse_tmp_60 * (-cse_tmp_46 + 8 * t1) * (cse_tmp_4 * xs1 ^ 4 / cse_tmp_48 ^ 2 + cse_tmp_47 * params_a_css_1 / cse_tmp_48 + params_a_css_0 + cse_tmp_5 * xs1 ^ 6 / cse_tmp_48 ^ 3 + cse_tmp_6 * xs1 ^ 8 / cse_tmp_48 ^ 4) * xc_expm1(-cse_tmp_1 * t1 ^ 2) / (8 * t1) + (-cse_tmp_37 * cse_tmp_65 * cse_tmp_66 + cse_tmp_37 * cse_tmp_66 * z ^ 4 * (cse_tmp_64 + cse_tmp_65 + (-cse_tmp_40 - 0.0310907) * xc_log1p((cse_tmp_41 + cse_tmp_42 + cse_tmp_43 + cse_tmp_44) ^ (-1))) - cse_tmp_45 - cse_tmp_60 - cse_tmp_64) * (cse_tmp_61 ^ 4 * params_a_cab_4 * params_a_gamma_ab ^ 4 / cse_tmp_63 ^ 4 + cse_tmp_61 ^ 3 * params_a_cab_3 * params_a_gamma_ab ^ 3 / cse_tmp_63 ^ 3 + cse_tmp_61 ^ 2 * params_a_cab_2 * params_a_gamma_ab ^ 2 / cse_tmp_63 ^ 2 + cse_tmp_62 * params_a_cab_1 / cse_tmp_63 + params_a_cab_0)
    end
end
export mgga_c_m05_energy

const mgga_c_m05_defaults = (dens_threshold = 1.0e-15, params_a_Fermi_D_cnst = 1.0e-10, params_a_cab_0 = 1.0, params_a_cab_1 = 3.78569, params_a_cab_2 = -14.15261, params_a_cab_3 = -7.46589, params_a_cab_4 = 17.94491, params_a_css_0 = 1.0, params_a_css_1 = 3.77344, params_a_css_2 = -26.04463, params_a_css_3 = 30.69913, params_a_css_4 = -9.22695, params_a_gamma_ab = 0.0031, params_a_gamma_ss = 0.06, zeta_threshold = 2.220446049250313e-16)
const mgga_c_m05_required = ()

function mgga_c_m05(rho, sigma, lapl, tau; params = NamedTuple())
    p = resolve_params(mgga_c_m05_defaults, mgga_c_m05_required, params)
    v = mgga_variables(rho, sigma, lapl, tau, Val(3))
    return mgga_c_m05_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.dens_threshold, p.params_a_Fermi_D_cnst, p.params_a_cab_0, p.params_a_cab_1, p.params_a_cab_2, p.params_a_cab_3, p.params_a_cab_4, p.params_a_css_0, p.params_a_css_1, p.params_a_css_2, p.params_a_css_3, p.params_a_css_4, p.params_a_gamma_ab, p.params_a_gamma_ss, p.zeta_threshold)
end

function mgga_c_m05(na, nb, gaa, gab, gbb, la, lb, ta, tb; params = NamedTuple())
    p = resolve_params(mgga_c_m05_defaults, mgga_c_m05_required, params)
    v = mgga_variables(na, nb, gaa, gab, gbb, la, lb, ta, tb, Val(3))
    return mgga_c_m05_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.dens_threshold, p.params_a_Fermi_D_cnst, p.params_a_cab_0, p.params_a_cab_1, p.params_a_cab_2, p.params_a_cab_3, p.params_a_cab_4, p.params_a_css_0, p.params_a_css_1, p.params_a_css_2, p.params_a_css_3, p.params_a_css_4, p.params_a_gamma_ab, p.params_a_gamma_ss, p.zeta_threshold)
end

export mgga_c_m05, mgga_c_m05_defaults, mgga_c_m05_required

const mgga_c_dldf_defaults = (dens_threshold = 5.0e-15, params_a_Fermi_D_cnst = 1.0e-10, params_a_cab_0 = 1.0, params_a_cab_1 = 5.9515308, params_a_cab_2 = -11.1602877, params_a_cab_3 = 0.0, params_a_cab_4 = 0.0, params_a_css_0 = 1.0, params_a_css_1 = -2.5960897, params_a_css_2 = 2.2233793, params_a_css_3 = 0.0, params_a_css_4 = 0.0, params_a_gamma_ab = 0.0031, params_a_gamma_ss = 0.06, zeta_threshold = 2.220446049250313e-16)
const mgga_c_dldf_required = ()

function mgga_c_dldf(rho, sigma, lapl, tau; params = NamedTuple())
    p = resolve_params(mgga_c_dldf_defaults, mgga_c_dldf_required, params)
    v = mgga_variables(rho, sigma, lapl, tau, Val(3))
    return mgga_c_m05_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.dens_threshold, p.params_a_Fermi_D_cnst, p.params_a_cab_0, p.params_a_cab_1, p.params_a_cab_2, p.params_a_cab_3, p.params_a_cab_4, p.params_a_css_0, p.params_a_css_1, p.params_a_css_2, p.params_a_css_3, p.params_a_css_4, p.params_a_gamma_ab, p.params_a_gamma_ss, p.zeta_threshold)
end

function mgga_c_dldf(na, nb, gaa, gab, gbb, la, lb, ta, tb; params = NamedTuple())
    p = resolve_params(mgga_c_dldf_defaults, mgga_c_dldf_required, params)
    v = mgga_variables(na, nb, gaa, gab, gbb, la, lb, ta, tb, Val(3))
    return mgga_c_m05_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.dens_threshold, p.params_a_Fermi_D_cnst, p.params_a_cab_0, p.params_a_cab_1, p.params_a_cab_2, p.params_a_cab_3, p.params_a_cab_4, p.params_a_css_0, p.params_a_css_1, p.params_a_css_2, p.params_a_css_3, p.params_a_css_4, p.params_a_gamma_ab, p.params_a_gamma_ss, p.zeta_threshold)
end

export mgga_c_dldf, mgga_c_dldf_defaults, mgga_c_dldf_required

const mgga_c_m05_2x_defaults = (dens_threshold = 1.0e-15, params_a_Fermi_D_cnst = 1.0e-10, params_a_cab_0 = 1.0, params_a_cab_1 = 1.09297, params_a_cab_2 = -3.79171, params_a_cab_3 = 2.8281, params_a_cab_4 = -10.58909, params_a_css_0 = 1.0, params_a_css_1 = -3.0543, params_a_css_2 = 7.61854, params_a_css_3 = 1.47665, params_a_css_4 = -11.92365, params_a_gamma_ab = 0.0031, params_a_gamma_ss = 0.06, zeta_threshold = 2.220446049250313e-16)
const mgga_c_m05_2x_required = ()

function mgga_c_m05_2x(rho, sigma, lapl, tau; params = NamedTuple())
    p = resolve_params(mgga_c_m05_2x_defaults, mgga_c_m05_2x_required, params)
    v = mgga_variables(rho, sigma, lapl, tau, Val(3))
    return mgga_c_m05_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.dens_threshold, p.params_a_Fermi_D_cnst, p.params_a_cab_0, p.params_a_cab_1, p.params_a_cab_2, p.params_a_cab_3, p.params_a_cab_4, p.params_a_css_0, p.params_a_css_1, p.params_a_css_2, p.params_a_css_3, p.params_a_css_4, p.params_a_gamma_ab, p.params_a_gamma_ss, p.zeta_threshold)
end

function mgga_c_m05_2x(na, nb, gaa, gab, gbb, la, lb, ta, tb; params = NamedTuple())
    p = resolve_params(mgga_c_m05_2x_defaults, mgga_c_m05_2x_required, params)
    v = mgga_variables(na, nb, gaa, gab, gbb, la, lb, ta, tb, Val(3))
    return mgga_c_m05_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.dens_threshold, p.params_a_Fermi_D_cnst, p.params_a_cab_0, p.params_a_cab_1, p.params_a_cab_2, p.params_a_cab_3, p.params_a_cab_4, p.params_a_css_0, p.params_a_css_1, p.params_a_css_2, p.params_a_css_3, p.params_a_css_4, p.params_a_gamma_ab, p.params_a_gamma_ss, p.zeta_threshold)
end

export mgga_c_m05_2x, mgga_c_m05_2x_defaults, mgga_c_m05_2x_required
