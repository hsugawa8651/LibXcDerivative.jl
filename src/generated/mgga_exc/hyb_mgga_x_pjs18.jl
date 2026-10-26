# Auto-generated from the Libxc sources
# python/mgga_exc/hyb_mgga_x_pjs18.py -- do not edit by hand.
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
# args: rs, z, xt, xs0, xs1, u0, u1, t0, t1, XC_EPSILON, cam_omega, dens_threshold, zeta_threshold
const hyb_mgga_x_pjs18_energy = function (rs, z, xt, xs0, xs1, u0, u1, t0, t1, XC_EPSILON, cam_omega, dens_threshold, zeta_threshold)
    @inbounds begin
        cse_tmp_0 = z + 1
        cse_tmp_1 = (3 // 8) / (pi * rs ^ 3)
        cse_tmp_2 = xs0 ^ 2
        cse_tmp_3 = 1.8171205928321397
        cse_tmp_4 = 4.60115111447049
        cse_tmp_5 = cse_tmp_3 / cse_tmp_4
        cse_tmp_6 = 0.150454888888889 * cse_tmp_5
        cse_tmp_7 = 3.3019272488946267
        cse_tmp_8 = 0.00268994904622629 * cse_tmp_7 / 21.170591578193033
        cse_tmp_9 = cse_tmp_2 * cse_tmp_6 + cse_tmp_8 * xs0 ^ 4 + 1
        cse_tmp_10 = NaNMath.pow(XC_EPSILON, 0.6666666666666666)
        cse_tmp_11 = cse_tmp_0 <= zeta_threshold
        cse_tmp_12 = zeta_threshold - 1
        cse_tmp_13 = 1 - z
        cse_tmp_14 = cse_tmp_13 <= zeta_threshold
        cse_tmp_15 = -cse_tmp_12
        cse_tmp_16 = my_piecewise5(cse_tmp_11, cse_tmp_12, cse_tmp_14, cse_tmp_15, z)
        cse_tmp_17 = cse_tmp_16 + 1
        cse_tmp_18 = cse_tmp_17 <= zeta_threshold
        cse_tmp_19 = NaNMath.pow(zeta_threshold, 0.3333333333333333) - 1
        cse_tmp_20 = 0.6827840632552957
        cse_tmp_21 = 1.5874010519681994 * 1.4422495703074083 * cam_omega * cse_tmp_20 * rs / 6
        cse_tmp_22 = cse_tmp_21 / (NaNMath.pow(cse_tmp_9, 0.1) * (my_piecewise3(cse_tmp_18, cse_tmp_19, xc_expm1(xc_log1p(my_piecewise3(cse_tmp_16 > cse_tmp_12, cse_tmp_16, cse_tmp_12)) / 3)) + 1))
        cse_tmp_23 = my_piecewise3(cse_tmp_10 > cse_tmp_22, cse_tmp_10, cse_tmp_22)
        cse_tmp_24 = cse_tmp_23 > 1.35
        cse_tmp_25 = my_piecewise3(cse_tmp_24, cse_tmp_23, 1.35)
        cse_tmp_26 = my_piecewise3(cse_tmp_24, 1.35, cse_tmp_23)
        cse_tmp_27 = 1.772453850905516
        cse_tmp_28 = cse_tmp_26 ^ 2
        cse_tmp_29 = xc_expm1(-1 / (4 * cse_tmp_28))
        cse_tmp_30 = 0.043662396 * cse_tmp_4 * cse_tmp_7
        cse_tmp_31 = cse_tmp_23 > 0.27
        cse_tmp_32 = my_piecewise3(cse_tmp_31, cse_tmp_23, 0.27)
        cse_tmp_33 = my_piecewise3(cse_tmp_31, 0.27, cse_tmp_23)
        cse_tmp_34 = cse_tmp_33 ^ 2
        cse_tmp_35 = 64 * cse_tmp_33 ^ 4
        cse_tmp_36 = 10 * cse_tmp_27
        cse_tmp_37 = cse_tmp_5 / NaNMath.pow(cse_tmp_9, 0.4)
        cse_tmp_38 = cse_tmp_23 > 0.32
        cse_tmp_39 = my_piecewise3(cse_tmp_38, cse_tmp_23, 0.32)
        cse_tmp_40 = my_piecewise3(cse_tmp_38, 0.32, cse_tmp_23)
        cse_tmp_41 = cse_tmp_40 ^ 2
        cse_tmp_42 = 2 * cse_tmp_27
        cse_tmp_43 = cse_tmp_40 ^ 3
        cse_tmp_44 = NaNMath.pow(zeta_threshold, 1.3333333333333333)
        cse_tmp_45 = 0.184639691595506 * cse_tmp_20 * cse_tmp_3 / rs
        cse_tmp_46 = xs1 ^ 2
        cse_tmp_47 = cse_tmp_46 * cse_tmp_6 + cse_tmp_8 * xs1 ^ 4 + 1
        cse_tmp_48 = my_piecewise5(cse_tmp_14, cse_tmp_12, cse_tmp_11, cse_tmp_15, -z)
        cse_tmp_49 = cse_tmp_48 + 1
        cse_tmp_50 = cse_tmp_49 <= zeta_threshold
        cse_tmp_51 = cse_tmp_21 / (NaNMath.pow(cse_tmp_47, 0.1) * (my_piecewise3(cse_tmp_50, cse_tmp_19, xc_expm1(xc_log1p(my_piecewise3(cse_tmp_48 > cse_tmp_12, cse_tmp_48, cse_tmp_12)) / 3)) + 1))
        cse_tmp_52 = my_piecewise3(cse_tmp_10 > cse_tmp_51, cse_tmp_10, cse_tmp_51)
        cse_tmp_53 = cse_tmp_52 > 1.35
        cse_tmp_54 = my_piecewise3(cse_tmp_53, cse_tmp_52, 1.35)
        cse_tmp_55 = my_piecewise3(cse_tmp_53, 1.35, cse_tmp_52)
        cse_tmp_56 = cse_tmp_55 ^ 2
        cse_tmp_57 = xc_expm1(-1 / (4 * cse_tmp_56))
        cse_tmp_58 = cse_tmp_52 > 0.27
        cse_tmp_59 = my_piecewise3(cse_tmp_58, cse_tmp_52, 0.27)
        cse_tmp_60 = my_piecewise3(cse_tmp_58, 0.27, cse_tmp_52)
        cse_tmp_61 = cse_tmp_60 ^ 2
        cse_tmp_62 = 64 * cse_tmp_60 ^ 4
        cse_tmp_63 = cse_tmp_5 / NaNMath.pow(cse_tmp_47, 0.4)
        cse_tmp_64 = cse_tmp_52 > 0.32
        cse_tmp_65 = my_piecewise3(cse_tmp_64, cse_tmp_52, 0.32)
        cse_tmp_66 = my_piecewise3(cse_tmp_64, 0.32, cse_tmp_52)
        cse_tmp_67 = cse_tmp_66 ^ 2
        cse_tmp_68 = cse_tmp_66 ^ 3
        my_piecewise3(cse_tmp_0 * cse_tmp_1 <= dens_threshold, 0, -cse_tmp_45 * (0.0263296055555555 * cse_tmp_2 * cse_tmp_37 * my_piecewise3(cse_tmp_23 >= 0.32, (3 // 7840) / cse_tmp_39 ^ 4 - 1 / (56448 * cse_tmp_39 ^ 6) + (5 // 8515584) / cse_tmp_39 ^ 8 - 1 / (61501440 * cse_tmp_39 ^ 10) + 1 / (2530344960 * cse_tmp_39 ^ 12) - 1 / (115811942400 * cse_tmp_39 ^ 14) + 1 / (5811921223680 * cse_tmp_39 ^ 16) - 1 / (316612955602944 * cse_tmp_39 ^ 18) + 1 / (18582706166169600 * cse_tmp_39 ^ 20) - 1 / (1168055816159232000 * cse_tmp_39 ^ 22) + 1 / (78244468658012160000 * cse_tmp_39 ^ 24) - 1 / (5562511054710453043200 * cse_tmp_39 ^ 26) + 1 / (418174050435486229463040 * cse_tmp_39 ^ 28) - 1 / (33139778504339333578752000 * cse_tmp_39 ^ 30) + 1 / (2760851680179343645999104000 * cse_tmp_39 ^ 32) - 1 / (241191070393445437962977280000 * cse_tmp_39 ^ 34) + 1 / (22046293272414372635684634624000 * cse_tmp_39 ^ 36), (8 // 7) * cse_tmp_40 * (cse_tmp_42 * (60 * cse_tmp_41 - 2) * erf(1 / (2 * cse_tmp_40)) + 24 * cse_tmp_43 * (5120 * cse_tmp_40 ^ 6 - 1440 * cse_tmp_40 ^ 4 + 224 * cse_tmp_41 - 35) + (-122880 * cse_tmp_40 ^ 9 + 3840 * cse_tmp_40 ^ 7 - 576 * cse_tmp_40 ^ 5 - 8 * cse_tmp_40 + 256 * cse_tmp_43) * exp(-1 / (4 * cse_tmp_41))) + 1) + (35 // 81) * cse_tmp_37 * (0.0422962783333333 * cse_tmp_2 + cse_tmp_30 - 0.14554132 * t0) * my_piecewise3(cse_tmp_23 >= 0.27, (3 // 2240) / cse_tmp_32 ^ 4 - 1 / (11520 * cse_tmp_32 ^ 6) + (3 // 788480) / cse_tmp_32 ^ 8 - 1 / (7454720 * cse_tmp_32 ^ 10) + 1 / (247726080 * cse_tmp_32 ^ 12) - 1 / (9358540800 * cse_tmp_32 ^ 14) + 1 / (394474291200 * cse_tmp_32 ^ 16) - 1 / (18311911833600 * cse_tmp_32 ^ 18) + 1 / (927028425523200 * cse_tmp_32 ^ 20) - 1 / (50785035485184000 * cse_tmp_32 ^ 22) + 1 / (2991700272218112000 * cse_tmp_32 ^ 24) - 1 / (188514051721003008000 * cse_tmp_32 ^ 26) + 1 / (12648942844388573184000 * cse_tmp_32 ^ 28) - 1 / (900231674141645733888000 * cse_tmp_32 ^ 30) + 1 / (67726520292999771979776000 * cse_tmp_32 ^ 32) - 1 / (5369745537516410492682240000 * cse_tmp_32 ^ 34) + 1 / (447473103488807905221672960000 * cse_tmp_32 ^ 36) - 1 / (39097165634742908368485089280000 * cse_tmp_32 ^ 38) + 1 / (3573852336994573837102806466560000 * cse_tmp_32 ^ 40) - 1 / (341095116070365837848137621831680000 * cse_tmp_32 ^ 42) + 1 / (33929038000650146833571361325056000000 * cse_tmp_32 ^ 44), 24 * cse_tmp_34 * (cse_tmp_33 * cse_tmp_36 * erf(1 / (2 * cse_tmp_33)) - 36 * cse_tmp_34 + cse_tmp_35 + (20 * cse_tmp_34 - cse_tmp_35) * exp(-1 / (4 * cse_tmp_34)) - 3) + 1) + my_piecewise3(cse_tmp_23 >= 1.35, 1 / (36 * cse_tmp_25 ^ 2) - 1 / (960 * cse_tmp_25 ^ 4) + 1 / (26880 * cse_tmp_25 ^ 6) - 1 / (829440 * cse_tmp_25 ^ 8) + 1 / (28385280 * cse_tmp_25 ^ 10) - 1 / (1073479680 * cse_tmp_25 ^ 12) + 1 / (44590694400 * cse_tmp_25 ^ 14), -8 // 3 * cse_tmp_26 * (2 * cse_tmp_26 * (-2 * cse_tmp_28 * cse_tmp_29 + cse_tmp_29 - 1 // 2) + cse_tmp_27 * erf(1 / (2 * cse_tmp_26))) + 1) / NaNMath.pow(cse_tmp_9, 0.2)) * my_piecewise3(cse_tmp_18, cse_tmp_44, NaNMath.pow(cse_tmp_17, 1.3333333333333333))) + my_piecewise3(cse_tmp_1 * cse_tmp_13 <= dens_threshold, 0, -cse_tmp_45 * (0.0263296055555555 * cse_tmp_46 * cse_tmp_63 * my_piecewise3(cse_tmp_52 >= 0.32, (3 // 7840) / cse_tmp_65 ^ 4 - 1 / (56448 * cse_tmp_65 ^ 6) + (5 // 8515584) / cse_tmp_65 ^ 8 - 1 / (61501440 * cse_tmp_65 ^ 10) + 1 / (2530344960 * cse_tmp_65 ^ 12) - 1 / (115811942400 * cse_tmp_65 ^ 14) + 1 / (5811921223680 * cse_tmp_65 ^ 16) - 1 / (316612955602944 * cse_tmp_65 ^ 18) + 1 / (18582706166169600 * cse_tmp_65 ^ 20) - 1 / (1168055816159232000 * cse_tmp_65 ^ 22) + 1 / (78244468658012160000 * cse_tmp_65 ^ 24) - 1 / (5562511054710453043200 * cse_tmp_65 ^ 26) + 1 / (418174050435486229463040 * cse_tmp_65 ^ 28) - 1 / (33139778504339333578752000 * cse_tmp_65 ^ 30) + 1 / (2760851680179343645999104000 * cse_tmp_65 ^ 32) - 1 / (241191070393445437962977280000 * cse_tmp_65 ^ 34) + 1 / (22046293272414372635684634624000 * cse_tmp_65 ^ 36), (8 // 7) * cse_tmp_66 * (cse_tmp_42 * (60 * cse_tmp_67 - 2) * erf(1 / (2 * cse_tmp_66)) + 24 * cse_tmp_68 * (5120 * cse_tmp_66 ^ 6 - 1440 * cse_tmp_66 ^ 4 + 224 * cse_tmp_67 - 35) + (-122880 * cse_tmp_66 ^ 9 + 3840 * cse_tmp_66 ^ 7 - 576 * cse_tmp_66 ^ 5 - 8 * cse_tmp_66 + 256 * cse_tmp_68) * exp(-1 / (4 * cse_tmp_67))) + 1) + (35 // 81) * cse_tmp_63 * (cse_tmp_30 + 0.0422962783333333 * cse_tmp_46 - 0.14554132 * t1) * my_piecewise3(cse_tmp_52 >= 0.27, (3 // 2240) / cse_tmp_59 ^ 4 - 1 / (11520 * cse_tmp_59 ^ 6) + (3 // 788480) / cse_tmp_59 ^ 8 - 1 / (7454720 * cse_tmp_59 ^ 10) + 1 / (247726080 * cse_tmp_59 ^ 12) - 1 / (9358540800 * cse_tmp_59 ^ 14) + 1 / (394474291200 * cse_tmp_59 ^ 16) - 1 / (18311911833600 * cse_tmp_59 ^ 18) + 1 / (927028425523200 * cse_tmp_59 ^ 20) - 1 / (50785035485184000 * cse_tmp_59 ^ 22) + 1 / (2991700272218112000 * cse_tmp_59 ^ 24) - 1 / (188514051721003008000 * cse_tmp_59 ^ 26) + 1 / (12648942844388573184000 * cse_tmp_59 ^ 28) - 1 / (900231674141645733888000 * cse_tmp_59 ^ 30) + 1 / (67726520292999771979776000 * cse_tmp_59 ^ 32) - 1 / (5369745537516410492682240000 * cse_tmp_59 ^ 34) + 1 / (447473103488807905221672960000 * cse_tmp_59 ^ 36) - 1 / (39097165634742908368485089280000 * cse_tmp_59 ^ 38) + 1 / (3573852336994573837102806466560000 * cse_tmp_59 ^ 40) - 1 / (341095116070365837848137621831680000 * cse_tmp_59 ^ 42) + 1 / (33929038000650146833571361325056000000 * cse_tmp_59 ^ 44), 24 * cse_tmp_61 * (cse_tmp_36 * cse_tmp_60 * erf(1 / (2 * cse_tmp_60)) - 36 * cse_tmp_61 + cse_tmp_62 + (20 * cse_tmp_61 - cse_tmp_62) * exp(-1 / (4 * cse_tmp_61)) - 3) + 1) + my_piecewise3(cse_tmp_52 >= 1.35, 1 / (36 * cse_tmp_54 ^ 2) - 1 / (960 * cse_tmp_54 ^ 4) + 1 / (26880 * cse_tmp_54 ^ 6) - 1 / (829440 * cse_tmp_54 ^ 8) + 1 / (28385280 * cse_tmp_54 ^ 10) - 1 / (1073479680 * cse_tmp_54 ^ 12) + 1 / (44590694400 * cse_tmp_54 ^ 14), -8 // 3 * cse_tmp_55 * (cse_tmp_27 * erf(1 / (2 * cse_tmp_55)) + 2 * cse_tmp_55 * (-2 * cse_tmp_56 * cse_tmp_57 + cse_tmp_57 - 1 // 2)) + 1) / NaNMath.pow(cse_tmp_47, 0.2)) * my_piecewise3(cse_tmp_50, cse_tmp_44, NaNMath.pow(cse_tmp_49, 1.3333333333333333)))
    end
end
export hyb_mgga_x_pjs18_energy

const hyb_mgga_x_pjs18_defaults = (XC_EPSILON = 2.220446049250313e-16, cam_omega = 0.33, dens_threshold = 1.0e-14, zeta_threshold = 2.220446049250313e-16)
const hyb_mgga_x_pjs18_required = ()

function hyb_mgga_x_pjs18(rho, sigma, lapl, tau; params = NamedTuple())
    p = resolve_params(hyb_mgga_x_pjs18_defaults, hyb_mgga_x_pjs18_required, params)
    v = mgga_variables(rho, sigma, lapl, tau, Val(3))
    return hyb_mgga_x_pjs18_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.XC_EPSILON, p.cam_omega, p.dens_threshold, p.zeta_threshold)
end

function hyb_mgga_x_pjs18(na, nb, gaa, gab, gbb, la, lb, ta, tb; params = NamedTuple())
    p = resolve_params(hyb_mgga_x_pjs18_defaults, hyb_mgga_x_pjs18_required, params)
    v = mgga_variables(na, nb, gaa, gab, gbb, la, lb, ta, tb, Val(3))
    return hyb_mgga_x_pjs18_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.XC_EPSILON, p.cam_omega, p.dens_threshold, p.zeta_threshold)
end

export hyb_mgga_x_pjs18, hyb_mgga_x_pjs18_defaults, hyb_mgga_x_pjs18_required
