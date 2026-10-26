# Auto-generated from the Libxc sources
# python/mgga_exc/mgga_c_vsxc.py -- do not edit by hand.
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
# args: rs, z, xt, xs0, xs1, u0, u1, t0, t1, dens_threshold, params_a_alpha_ab, params_a_alpha_ss, params_a_dab_0, params_a_dab_1, params_a_dab_2, params_a_dab_3, params_a_dab_4, params_a_dab_5, params_a_dss_0, params_a_dss_1, params_a_dss_2, params_a_dss_3, params_a_dss_4, params_a_dss_5, zeta_threshold
const mgga_c_vsxc_energy = function (rs, z, xt, xs0, xs1, u0, u1, t0, t1, dens_threshold, params_a_alpha_ab, params_a_alpha_ss, params_a_dab_0, params_a_dab_1, params_a_dab_2, params_a_dab_3, params_a_dab_4, params_a_dab_5, params_a_dss_0, params_a_dss_1, params_a_dss_2, params_a_dss_3, params_a_dss_4, params_a_dss_5, zeta_threshold)
    @inbounds begin
        cse_tmp_0 = xs0 ^ 2
        cse_tmp_1 = 2 * t0
        cse_tmp_2 = 3.3019272488946267 * 4.60115111447049
        cse_tmp_3 = -3 // 5 * cse_tmp_2
        cse_tmp_4 = cse_tmp_1 + cse_tmp_3
        cse_tmp_5 = params_a_alpha_ss * (cse_tmp_0 + cse_tmp_4) + 1
        cse_tmp_6 = z + 1
        cse_tmp_8 = (3 // 8) / (pi * rs ^ 3)
        cse_tmp_9 = zeta_threshold - 1
        cse_tmp_10 = xc_log1p(my_piecewise3(z > cse_tmp_9, z, cse_tmp_9))
        cse_tmp_11 = 0.01328816518 * rs
        cse_tmp_12 = 1.2599210498948732
        cse_tmp_13 = -1 + NaNMath.pow(zeta_threshold, -0.3333333333333333)
        cse_tmp_14 = my_piecewise3(cse_tmp_6 <= zeta_threshold, cse_tmp_13, xc_expm1(-cse_tmp_10 / 3)) + 1
        cse_tmp_15 = cse_tmp_12 * cse_tmp_14
        cse_tmp_16 = 0.22308199064 * rs
        cse_tmp_17 = NaNMath.sqrt(rs)
        cse_tmp_18 = 0.47231125998 * cse_tmp_17
        cse_tmp_19 = 1.122462048309373
        cse_tmp_20 = NaNMath.sqrt(cse_tmp_14) * cse_tmp_19
        cse_tmp_21 = NaNMath.pow(rs, 1.5)
        cse_tmp_22 = 0.10186556948 * cse_tmp_21
        cse_tmp_23 = 1.4142135623730951
        cse_tmp_24 = NaNMath.pow(cse_tmp_14, 1.5) * cse_tmp_23
        cse_tmp_25 = rs ^ 2
        cse_tmp_26 = 0.030651699316 * cse_tmp_25
        cse_tmp_27 = 1.5874010519681994
        cse_tmp_28 = cse_tmp_14 ^ 2 * cse_tmp_27
        cse_tmp_29 = (-cse_tmp_11 * cse_tmp_15 - 0.0621814) * xc_log1p((cse_tmp_15 * cse_tmp_16 + cse_tmp_18 * cse_tmp_20 + cse_tmp_22 * cse_tmp_24 + cse_tmp_26 * cse_tmp_28) ^ (-1))
        cse_tmp_30 = 0.00375733525 * rs
        cse_tmp_31 = 0.12236585478 * rs
        cse_tmp_32 = 0.3497952466 * cse_tmp_17
        cse_tmp_33 = 0.029729725188 * cse_tmp_21
        cse_tmp_34 = 0.016775784198 * cse_tmp_25
        cse_tmp_35 = 0.5848223622634646207262238663759 * (-cse_tmp_15 * cse_tmp_30 - 0.0337738) * xc_log1p((cse_tmp_15 * cse_tmp_31 + cse_tmp_20 * cse_tmp_32 + cse_tmp_24 * cse_tmp_33 + cse_tmp_28 * cse_tmp_34) ^ (-1))
        cse_tmp_36 = (2 * cse_tmp_12 - 2) ^ (-1)
        cse_tmp_37 = NaNMath.pow(zeta_threshold, 1.3333333333333333) - 1
        cse_tmp_38 = cse_tmp_36 * (cse_tmp_37 + my_piecewise3(2 <= zeta_threshold, cse_tmp_37, xc_expm1((4 // 3) * xc_log1p(my_piecewise3(1 > cse_tmp_9, 1, cse_tmp_9)))))
        cse_tmp_39 = 0.006388517036 * rs
        cse_tmp_40 = 0.19269083139 * rs
        cse_tmp_41 = 0.43896648423 * cse_tmp_17
        cse_tmp_42 = 0.10465751434 * cse_tmp_21
        cse_tmp_43 = 0.019436972919 * cse_tmp_25
        cse_tmp_44 = my_piecewise3(cse_tmp_6 <= zeta_threshold || cse_tmp_6 * cse_tmp_8 <= dens_threshold, 0, (my_piecewise3(cse_tmp_6 <= zeta_threshold, cse_tmp_9, xc_expm1(cse_tmp_10)) / 2 + 1 // 2) * (cse_tmp_29 - cse_tmp_35 * cse_tmp_38 + cse_tmp_38 * (-cse_tmp_29 + cse_tmp_35 + (-cse_tmp_15 * cse_tmp_39 - 0.0310907) * xc_log1p((cse_tmp_15 * cse_tmp_40 + cse_tmp_20 * cse_tmp_41 + cse_tmp_24 * cse_tmp_42 + cse_tmp_28 * cse_tmp_43) ^ (-1)))))
        cse_tmp_45 = xs1 ^ 2
        cse_tmp_46 = 2 * t1
        cse_tmp_47 = cse_tmp_3 + cse_tmp_46
        cse_tmp_48 = params_a_alpha_ss * (cse_tmp_45 + cse_tmp_47) + 1
        cse_tmp_49 = 1 - z
        cse_tmp_51 = -z
        cse_tmp_52 = xc_log1p(my_piecewise3(cse_tmp_51 > cse_tmp_9, cse_tmp_51, cse_tmp_9))
        cse_tmp_53 = my_piecewise3(cse_tmp_49 <= zeta_threshold, cse_tmp_13, xc_expm1(-cse_tmp_52 / 3)) + 1
        cse_tmp_54 = cse_tmp_12 * cse_tmp_53
        cse_tmp_55 = cse_tmp_19 * NaNMath.sqrt(cse_tmp_53)
        cse_tmp_56 = cse_tmp_23 * NaNMath.pow(cse_tmp_53, 1.5)
        cse_tmp_57 = cse_tmp_27 * cse_tmp_53 ^ 2
        cse_tmp_58 = (-cse_tmp_11 * cse_tmp_54 - 0.0621814) * xc_log1p((cse_tmp_16 * cse_tmp_54 + cse_tmp_18 * cse_tmp_55 + cse_tmp_22 * cse_tmp_56 + cse_tmp_26 * cse_tmp_57) ^ (-1))
        cse_tmp_59 = 0.5848223622634646207262238663759 * (-cse_tmp_30 * cse_tmp_54 - 0.0337738) * xc_log1p((cse_tmp_31 * cse_tmp_54 + cse_tmp_32 * cse_tmp_55 + cse_tmp_33 * cse_tmp_56 + cse_tmp_34 * cse_tmp_57) ^ (-1))
        cse_tmp_60 = my_piecewise3(cse_tmp_49 <= zeta_threshold || cse_tmp_49 * cse_tmp_8 <= dens_threshold, 0, (my_piecewise3(cse_tmp_49 <= zeta_threshold, cse_tmp_9, xc_expm1(cse_tmp_52)) / 2 + 1 // 2) * (-cse_tmp_38 * cse_tmp_59 + cse_tmp_38 * (-cse_tmp_58 + cse_tmp_59 + (-cse_tmp_39 * cse_tmp_54 - 0.0310907) * xc_log1p((cse_tmp_40 * cse_tmp_54 + cse_tmp_41 * cse_tmp_55 + cse_tmp_42 * cse_tmp_56 + cse_tmp_43 * cse_tmp_57) ^ (-1))) + cse_tmp_58))
        cse_tmp_61 = cse_tmp_0 + cse_tmp_45
        cse_tmp_62 = cse_tmp_1 - 6 // 5 * cse_tmp_2 + cse_tmp_46
        cse_tmp_63 = params_a_alpha_ab * (cse_tmp_61 + cse_tmp_62) + 1
        cse_tmp_64 = -(-cse_tmp_11 - 0.0621814) * xc_log1p((cse_tmp_16 + cse_tmp_18 + cse_tmp_22 + cse_tmp_26) ^ (-1))
        cse_tmp_65 = 0.5848223622634646207262238663759 * (-cse_tmp_30 - 0.0337738) * xc_log1p((cse_tmp_31 + cse_tmp_32 + cse_tmp_33 + cse_tmp_34) ^ (-1))
        cse_tmp_66 = my_piecewise3(cse_tmp_49 <= zeta_threshold, cse_tmp_37, xc_expm1((4 // 3) * cse_tmp_52)) + my_piecewise3(cse_tmp_6 <= zeta_threshold, cse_tmp_37, xc_expm1((4 // 3) * cse_tmp_10))
        cse_tmp_44 * (-cse_tmp_0 + 8 * t0) * (params_a_dss_0 / cse_tmp_5 + (cse_tmp_0 * params_a_dss_1 + cse_tmp_4 * params_a_dss_2) / cse_tmp_5 ^ 2 + (cse_tmp_0 * cse_tmp_4 * params_a_dss_4 + cse_tmp_4 ^ 2 * params_a_dss_5 + params_a_dss_3 * xs0 ^ 4) / cse_tmp_5 ^ 3) / (8 * t0) + cse_tmp_60 * (-cse_tmp_45 + 8 * t1) * (params_a_dss_0 / cse_tmp_48 + (cse_tmp_45 * params_a_dss_1 + cse_tmp_47 * params_a_dss_2) / cse_tmp_48 ^ 2 + (cse_tmp_45 * cse_tmp_47 * params_a_dss_4 + cse_tmp_47 ^ 2 * params_a_dss_5 + params_a_dss_3 * xs1 ^ 4) / cse_tmp_48 ^ 3) / (8 * t1) + (params_a_dab_0 / cse_tmp_63 + (cse_tmp_61 * params_a_dab_1 + cse_tmp_62 * params_a_dab_2) / cse_tmp_63 ^ 2 + (cse_tmp_61 ^ 2 * params_a_dab_3 + cse_tmp_61 * cse_tmp_62 * params_a_dab_4 + cse_tmp_62 ^ 2 * params_a_dab_5) / cse_tmp_63 ^ 3) * (-cse_tmp_36 * cse_tmp_65 * cse_tmp_66 + cse_tmp_36 * cse_tmp_66 * z ^ 4 * (cse_tmp_64 + cse_tmp_65 + (-cse_tmp_39 - 0.0310907) * xc_log1p((cse_tmp_40 + cse_tmp_41 + cse_tmp_42 + cse_tmp_43) ^ (-1))) - cse_tmp_44 - cse_tmp_60 - cse_tmp_64)
    end
end
export mgga_c_vsxc_energy

const mgga_c_vsxc_defaults = (dens_threshold = 1.0e-15, params_a_alpha_ab = 0.00304966, params_a_alpha_ss = 0.00515088, params_a_dab_0 = 0.703501, params_a_dab_1 = 0.007694574, params_a_dab_2 = 0.05152765, params_a_dab_3 = 3.394308e-5, params_a_dab_4 = -0.00126942, params_a_dab_5 = 0.001296118, params_a_dss_0 = 0.3270912, params_a_dss_1 = -0.03228915, params_a_dss_2 = -0.02942406, params_a_dss_3 = 0.002134222, params_a_dss_4 = -0.005451559, params_a_dss_5 = 0.01577575, zeta_threshold = 2.220446049250313e-16)
const mgga_c_vsxc_required = ()

function mgga_c_vsxc(rho, sigma, lapl, tau; params = NamedTuple())
    p = resolve_params(mgga_c_vsxc_defaults, mgga_c_vsxc_required, params)
    v = mgga_variables(rho, sigma, lapl, tau, Val(3))
    return mgga_c_vsxc_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.dens_threshold, p.params_a_alpha_ab, p.params_a_alpha_ss, p.params_a_dab_0, p.params_a_dab_1, p.params_a_dab_2, p.params_a_dab_3, p.params_a_dab_4, p.params_a_dab_5, p.params_a_dss_0, p.params_a_dss_1, p.params_a_dss_2, p.params_a_dss_3, p.params_a_dss_4, p.params_a_dss_5, p.zeta_threshold)
end

function mgga_c_vsxc(na, nb, gaa, gab, gbb, la, lb, ta, tb; params = NamedTuple())
    p = resolve_params(mgga_c_vsxc_defaults, mgga_c_vsxc_required, params)
    v = mgga_variables(na, nb, gaa, gab, gbb, la, lb, ta, tb, Val(3))
    return mgga_c_vsxc_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.dens_threshold, p.params_a_alpha_ab, p.params_a_alpha_ss, p.params_a_dab_0, p.params_a_dab_1, p.params_a_dab_2, p.params_a_dab_3, p.params_a_dab_4, p.params_a_dab_5, p.params_a_dss_0, p.params_a_dss_1, p.params_a_dss_2, p.params_a_dss_3, p.params_a_dss_4, p.params_a_dss_5, p.zeta_threshold)
end

export mgga_c_vsxc, mgga_c_vsxc_defaults, mgga_c_vsxc_required
