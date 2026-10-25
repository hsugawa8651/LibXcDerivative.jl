# Auto-generated from the Libxc sources
# python/gga_exc/gga_c_hcth_a.py -- do not edit by hand.
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
# args: rs, z, xt, xs0, xs1, dens_threshold, zeta_threshold
const gga_c_hcth_a_energy = function (rs, z, xt, xs0, xs1, dens_threshold, zeta_threshold)
    @inbounds begin
        cse_tmp_0 = xs0 ^ 2
        cse_tmp_1 = 0.2 * cse_tmp_0 + 1
        cse_tmp_2 = z + 1
        cse_tmp_4 = (3 // 8) / (pi * rs ^ 3)
        cse_tmp_5 = zeta_threshold - 1
        cse_tmp_6 = xc_log1p(my_piecewise3(z > cse_tmp_5, z, cse_tmp_5))
        cse_tmp_7 = NaNMath.sqrt(rs)
        cse_tmp_8 = 7.06042 * cse_tmp_7
        cse_tmp_9 = 1.122462048309373
        cse_tmp_10 = -1 + NaNMath.pow(zeta_threshold, -0.3333333333333333)
        cse_tmp_11 = my_piecewise3(cse_tmp_2 <= zeta_threshold, cse_tmp_10, xc_expm1(-cse_tmp_6 / 3)) + 1
        cse_tmp_12 = NaNMath.sqrt(cse_tmp_11)
        cse_tmp_13 = cse_tmp_12 * cse_tmp_9
        cse_tmp_14 = cse_tmp_13 * cse_tmp_8 + 18.0578
        cse_tmp_15 = 1.2599210498948732
        cse_tmp_16 = cse_tmp_15 * rs
        cse_tmp_17 = cse_tmp_11 * cse_tmp_16
        cse_tmp_18 = cse_tmp_14 + cse_tmp_17
        cse_tmp_19 = cse_tmp_18 ^ (-1)
        cse_tmp_20 = cse_tmp_7 * cse_tmp_9
        cse_tmp_21 = cse_tmp_12 * cse_tmp_20
        cse_tmp_22 = 2 * cse_tmp_7
        cse_tmp_23 = cse_tmp_13 * cse_tmp_22
        cse_tmp_24 = 3.72744 * cse_tmp_7
        cse_tmp_25 = cse_tmp_13 * cse_tmp_24 + 12.9352
        cse_tmp_26 = cse_tmp_17 + cse_tmp_25
        cse_tmp_27 = cse_tmp_26 ^ (-1)
        cse_tmp_28 = 0.038783294878113 * atan(6.15199081975908 / (cse_tmp_23 + 3.72744)) + 0.0310907 * xc_log1p(-cse_tmp_25 * cse_tmp_27) + 0.000969022771154437 * xc_log1p(cse_tmp_27 * (-cse_tmp_26 + (cse_tmp_21 + 0.10498) ^ 2))
        cse_tmp_29 = (2 * cse_tmp_15 - 2) ^ (-1)
        cse_tmp_30 = NaNMath.pow(zeta_threshold, 1.3333333333333333) - 1
        cse_tmp_31 = cse_tmp_29 * (cse_tmp_30 + my_piecewise3(2 <= zeta_threshold, cse_tmp_30, xc_expm1((4 // 3) * xc_log1p(my_piecewise3(1 > cse_tmp_5, 1, cse_tmp_5)))))
        cse_tmp_32 = my_piecewise3(cse_tmp_2 <= zeta_threshold || cse_tmp_2 * cse_tmp_4 <= dens_threshold, 0, (cse_tmp_28 + cse_tmp_31 * (-cse_tmp_28 + 0.0524913931697809 * atan(4.73092690956011 / (cse_tmp_23 + 7.06042)) + 0.01554535 * xc_log1p(-cse_tmp_14 * cse_tmp_19) + 0.00224786709554261 * xc_log1p(cse_tmp_19 * (-cse_tmp_18 + (cse_tmp_21 + 0.325) ^ 2)))) * (my_piecewise3(cse_tmp_2 <= zeta_threshold, cse_tmp_5, xc_expm1(cse_tmp_6)) / 2 + 1 // 2))
        cse_tmp_33 = xs1 ^ 2
        cse_tmp_34 = 0.2 * cse_tmp_33 + 1
        cse_tmp_35 = 1 - z
        cse_tmp_37 = -z
        cse_tmp_38 = xc_log1p(my_piecewise3(cse_tmp_37 > cse_tmp_5, cse_tmp_37, cse_tmp_5))
        cse_tmp_39 = my_piecewise3(cse_tmp_35 <= zeta_threshold, cse_tmp_10, xc_expm1(-cse_tmp_38 / 3)) + 1
        cse_tmp_40 = NaNMath.sqrt(cse_tmp_39)
        cse_tmp_41 = cse_tmp_40 * cse_tmp_9
        cse_tmp_42 = cse_tmp_41 * cse_tmp_8 + 18.0578
        cse_tmp_43 = cse_tmp_16 * cse_tmp_39
        cse_tmp_44 = cse_tmp_42 + cse_tmp_43
        cse_tmp_45 = cse_tmp_44 ^ (-1)
        cse_tmp_46 = cse_tmp_20 * cse_tmp_40
        cse_tmp_47 = cse_tmp_22 * cse_tmp_41
        cse_tmp_48 = cse_tmp_24 * cse_tmp_41 + 12.9352
        cse_tmp_49 = cse_tmp_43 + cse_tmp_48
        cse_tmp_50 = cse_tmp_49 ^ (-1)
        cse_tmp_51 = 0.038783294878113 * atan(6.15199081975908 / (cse_tmp_47 + 3.72744)) + 0.0310907 * xc_log1p(-cse_tmp_48 * cse_tmp_50) + 0.000969022771154437 * xc_log1p(cse_tmp_50 * (-cse_tmp_49 + (cse_tmp_46 + 0.10498) ^ 2))
        cse_tmp_52 = my_piecewise3(cse_tmp_35 <= zeta_threshold || cse_tmp_35 * cse_tmp_4 <= dens_threshold, 0, (cse_tmp_31 * (-cse_tmp_51 + 0.0524913931697809 * atan(4.73092690956011 / (cse_tmp_47 + 7.06042)) + 0.01554535 * xc_log1p(-cse_tmp_42 * cse_tmp_45) + 0.00224786709554261 * xc_log1p(cse_tmp_45 * (-cse_tmp_44 + (cse_tmp_46 + 0.325) ^ 2))) + cse_tmp_51) * (my_piecewise3(cse_tmp_35 <= zeta_threshold, cse_tmp_5, xc_expm1(cse_tmp_38)) / 2 + 1 // 2))
        cse_tmp_53 = cse_tmp_0 / 2 + cse_tmp_33 / 2
        cse_tmp_54 = 0.003 * cse_tmp_0 + 0.003 * cse_tmp_33 + 1
        cse_tmp_55 = cse_tmp_8 + 18.0578
        cse_tmp_56 = cse_tmp_55 + rs
        cse_tmp_57 = cse_tmp_56 ^ (-1)
        cse_tmp_58 = cse_tmp_24 + 12.9352
        cse_tmp_59 = cse_tmp_58 + rs
        cse_tmp_60 = cse_tmp_59 ^ (-1)
        cse_tmp_61 = 0.038783294878113 * atan(6.15199081975908 / (cse_tmp_22 + 3.72744)) + 0.0310907 * xc_log1p(-cse_tmp_58 * cse_tmp_60) + 0.000969022771154437 * xc_log1p(cse_tmp_60 * (-cse_tmp_59 + (cse_tmp_7 + 0.10498) ^ 2))
        cse_tmp_62 = cse_tmp_29 * (my_piecewise3(cse_tmp_2 <= zeta_threshold, cse_tmp_30, xc_expm1((4 // 3) * cse_tmp_6)) + my_piecewise3(cse_tmp_35 <= zeta_threshold, cse_tmp_30, xc_expm1((4 // 3) * cse_tmp_38)))
        cse_tmp_63 = 1.13107 * cse_tmp_7 + 13.0045
        cse_tmp_64 = cse_tmp_63 + rs
        cse_tmp_65 = cse_tmp_64 ^ (-1)
        cse_tmp_32 * (0.053784 * cse_tmp_0 / cse_tmp_1 + 0.0136823 - 0.02203076 * xs0 ^ 4 / cse_tmp_1 ^ 2 + 0.00831576 * xs0 ^ 6 / cse_tmp_1 ^ 3) + cse_tmp_52 * (0.053784 * cse_tmp_33 / cse_tmp_34 + 0.0136823 - 0.02203076 * xs1 ^ 4 / cse_tmp_34 ^ 2 + 0.00831576 * xs1 ^ 6 / cse_tmp_34 ^ 3) + (-9.8820864e-7 * cse_tmp_53 ^ 3 / cse_tmp_54 ^ 3 - 0.00010025928 * cse_tmp_53 ^ 2 / cse_tmp_54 ^ 2 + 0.01032306 * cse_tmp_53 / cse_tmp_54 + 0.836897) * (-cse_tmp_2 * cse_tmp_35 * cse_tmp_62 * ((9 // 4) * cse_tmp_15 - 9 // 4) * (z ^ 2 + 1) * (0.317708004743942 * atan(7.12310891781812 / (cse_tmp_22 + 1.13107)) + xc_log1p(-cse_tmp_63 * cse_tmp_65) + 0.000414033794282063 * xc_log1p(cse_tmp_65 * (-cse_tmp_64 + (cse_tmp_7 + 0.0047584) ^ 2))) / (6 * 9.869604401089358) - cse_tmp_32 - cse_tmp_52 + cse_tmp_61 + cse_tmp_62 * z ^ 4 * (-cse_tmp_61 + 0.0524913931697809 * atan(4.73092690956011 / (cse_tmp_22 + 7.06042)) + 0.01554535 * xc_log1p(-cse_tmp_55 * cse_tmp_57) + 0.00224786709554261 * xc_log1p(cse_tmp_57 * (-cse_tmp_56 + (cse_tmp_7 + 0.325) ^ 2))))
    end
end
export gga_c_hcth_a_energy

const gga_c_hcth_a_defaults = (dens_threshold = 1.0e-15, zeta_threshold = 2.220446049250313e-16)
const gga_c_hcth_a_required = ()

function gga_c_hcth_a(rho, sigma; params = NamedTuple())
    p = resolve_params(gga_c_hcth_a_defaults, gga_c_hcth_a_required, params)
    v = gga_variables(rho, sigma, Val(3))
    return gga_c_hcth_a_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.dens_threshold, p.zeta_threshold)
end

function gga_c_hcth_a(na, nb, gaa, gab, gbb; params = NamedTuple())
    p = resolve_params(gga_c_hcth_a_defaults, gga_c_hcth_a_required, params)
    v = gga_variables(na, nb, gaa, gab, gbb, Val(3))
    return gga_c_hcth_a_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.dens_threshold, p.zeta_threshold)
end

export gga_c_hcth_a, gga_c_hcth_a_defaults, gga_c_hcth_a_required
