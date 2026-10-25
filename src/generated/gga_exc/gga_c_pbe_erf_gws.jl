# Auto-generated from the Libxc sources
# python/gga_exc/gga_c_pbe_erf_gws.py -- do not edit by hand.
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
# args: rs, z, xt, xs0, xs1, cam_omega, params_a_a_c, params_a_beta, params_a_gamma, zeta_threshold
const gga_c_pbe_erf_gws_energy = function (rs, z, xt, xs0, xs1, cam_omega, params_a_a_c, params_a_beta, params_a_gamma, zeta_threshold)
    @inbounds begin
        cse_tmp_0 = rs ^ 2
        cse_tmp_1 = cam_omega ^ 2
        cse_tmp_2 = cse_tmp_0 * cse_tmp_1
        cse_tmp_3 = rs ^ 5
        cse_tmp_4 = 1.4142135623730951 / 1.772453850905516
        cse_tmp_5 = cse_tmp_3 * cse_tmp_4
        cse_tmp_6 = 0.7524 * rs
        cse_tmp_7 = -cse_tmp_6
        cse_tmp_8 = rs ^ 4
        cse_tmp_9 = rs ^ 3
        cse_tmp_10 = 0.040965 * cse_tmp_0 + 0.0009295 * cse_tmp_8 - 0.006385 * cse_tmp_9 + 0.01035 * rs
        cse_tmp_11 = (cse_tmp_10 + 1 // 2) * exp(cse_tmp_7)
        cse_tmp_12 = z + 1
        cse_tmp_13 = 1 - z
        cse_tmp_14 = cse_tmp_12 * cse_tmp_13
        cse_tmp_15 = cse_tmp_11 * cse_tmp_14
        cse_tmp_16 = cse_tmp_14 * my_piecewise3(cse_tmp_6 < 1, cse_tmp_10 + (0.08193 * cse_tmp_0 + 0.001859 * cse_tmp_8 - 0.01277 * cse_tmp_9 + 0.0207 * rs + 1) * xc_expm1(cse_tmp_7) / 2, cse_tmp_11 - 1 // 2)
        cse_tmp_17 = cam_omega ^ 3
        cse_tmp_18 = cse_tmp_12 ^ (-1)
        cse_tmp_19 = NaNMath.pow(cse_tmp_18, 0.6666666666666666)
        cse_tmp_20 = z / 2
        cse_tmp_21 = 1.2599210498948732
        cse_tmp_22 = cse_tmp_21 * rs
        cse_tmp_23 = NaNMath.pow(cse_tmp_18, 0.3333333333333333) * cse_tmp_22
        cse_tmp_24 = 1.5874010519681994
        cse_tmp_25 = 0.04 * cse_tmp_0 * cse_tmp_24
        cse_tmp_26 = 2.1450293971110255
        cse_tmp_27 = cse_tmp_0 ^ (-1)
        cse_tmp_28 = (3 // 10) * 2.2894284851066637 * cse_tmp_26 * cse_tmp_27
        cse_tmp_29 = cse_tmp_13 ^ (-1)
        cse_tmp_30 = NaNMath.pow(cse_tmp_29, 0.6666666666666666)
        cse_tmp_31 = cse_tmp_22 * NaNMath.pow(cse_tmp_29, 0.3333333333333333)
        cse_tmp_32 = cse_tmp_28 * (1 // 2 - cse_tmp_20) ^ 2 * (1 - 0.02267 * cse_tmp_31) / (cse_tmp_30 * (cse_tmp_25 * cse_tmp_30 + 0.4319 * cse_tmp_31 + 1)) + cse_tmp_28 * (1 - 0.02267 * cse_tmp_23) * (cse_tmp_20 + 1 // 2) ^ 2 / (cse_tmp_19 * (cse_tmp_19 * cse_tmp_25 + 0.4319 * cse_tmp_23 + 1))
        cse_tmp_33 = NaNMath.sqrt(rs)
        cse_tmp_34 = NaNMath.pow(rs, 1.5)
        cse_tmp_35 = (-0.0132882934 * rs - 0.062182) * xc_log1p((0.03065199508 * cse_tmp_0 + 0.4723158174 * cse_tmp_33 + 0.1018665524 * cse_tmp_34 + 0.2230841432 * rs) ^ (-1))
        cse_tmp_36 = 0.58482233974552 * (-0.0037573575 * rs - 0.033774) * xc_log1p((0.01677588354 * cse_tmp_0 + 0.349797318 * cse_tmp_33 + 0.02972990124 * cse_tmp_34 + 0.1223665794 * rs) ^ (-1))
        cse_tmp_37 = cse_tmp_12 <= zeta_threshold
        cse_tmp_38 = NaNMath.pow(zeta_threshold, 1.3333333333333333) - 1
        cse_tmp_39 = zeta_threshold - 1
        cse_tmp_40 = xc_log1p(my_piecewise3(z > cse_tmp_39, z, cse_tmp_39))
        cse_tmp_41 = cse_tmp_13 <= zeta_threshold
        cse_tmp_42 = -z
        cse_tmp_43 = xc_log1p(my_piecewise3(cse_tmp_42 > cse_tmp_39, cse_tmp_42, cse_tmp_39))
        cse_tmp_44 = (my_piecewise3(cse_tmp_37, cse_tmp_38, xc_expm1((4 // 3) * cse_tmp_40)) + my_piecewise3(cse_tmp_41, cse_tmp_38, xc_expm1((4 // 3) * cse_tmp_43))) / (2 * cse_tmp_21 - 2)
        cse_tmp_45 = cse_tmp_35 - cse_tmp_36 * cse_tmp_44 + cse_tmp_44 * z ^ 4 * (-cse_tmp_35 + cse_tmp_36 + (-0.0063883732 * rs - 0.03109) * xc_log1p((0.0194365353 * cse_tmp_0 + 0.438956601 * cse_tmp_33 + 0.104655158 * cse_tmp_34 + 0.192686493 * rs) ^ (-1)))
        cse_tmp_46 = NaNMath.log(2)
        cse_tmp_47 = NaNMath.pow(zeta_threshold, 0.6666666666666666)
        cse_tmp_48 = my_piecewise3(cse_tmp_37, cse_tmp_47, NaNMath.pow(cse_tmp_12, 0.6666666666666666)) / 2 + my_piecewise3(cse_tmp_41, cse_tmp_47, NaNMath.pow(cse_tmp_13, 0.6666666666666666)) / 2
        cse_tmp_49 = cse_tmp_48 ^ 3
        cse_tmp_50 = cse_tmp_1 * rs / cse_tmp_48 ^ 2
        cse_tmp_51 = 3.44851 * cse_tmp_50
        cse_tmp_52 = 1.4422495703074083 * cse_tmp_24 * cse_tmp_26
        cse_tmp_53 = NaNMath.pow(zeta_threshold, 2.6666666666666665)
        cse_tmp_54 = (0.0540459047963914 * cam_omega ^ 6 * cse_tmp_16 * cse_tmp_3 + 0.0720612063951886 * cam_omega ^ 5 * cse_tmp_15 * cse_tmp_5 - cam_omega ^ 4 * (-0.350864882184401 * cse_tmp_16 * cse_tmp_9 - 0.0202672142986468 * cse_tmp_3 * (cse_tmp_14 * cse_tmp_27 * (0.676 * cse_tmp_0 - 0.388 * rs) * exp(-0.547 * rs) - 3 // 20 * cse_tmp_27 * cse_tmp_52 * (my_piecewise3(cse_tmp_37, cse_tmp_53, NaNMath.pow(cse_tmp_12, 2.6666666666666665)) / 2 + my_piecewise3(cse_tmp_41, cse_tmp_53, NaNMath.pow(cse_tmp_13, 2.6666666666666665)) / 2) + cse_tmp_32)) - cse_tmp_17 * (-0.467819842912535 * cse_tmp_15 * cse_tmp_4 * cse_tmp_9 - 0.0162137714389174 * cse_tmp_5 * (cse_tmp_14 * (cse_tmp_0 - 4.95 * rs) * exp(-0.31 * rs) / cse_tmp_9 + cse_tmp_32)) + cse_tmp_45 * (2.464579730404 * cse_tmp_2 + 1) - cse_tmp_49 * (2 * cse_tmp_46 - 2) * xc_log1p((3.91744 * cse_tmp_17 * cse_tmp_34 / cse_tmp_49 + cse_tmp_50 * (-cse_tmp_52 / (4 * cse_tmp_46 - 4) + 3.44851) - cse_tmp_51) / (5.84605 * cam_omega * cse_tmp_33 / cse_tmp_48 + cse_tmp_51 + 1)) / 9.869604401089358) / (0.616144932601 * cse_tmp_2 + 1) ^ 4
        cse_tmp_55 = cse_tmp_47 - 1
        cse_tmp_56 = my_piecewise3(cse_tmp_37, cse_tmp_55, xc_expm1((2 // 3) * cse_tmp_40)) / 2 + my_piecewise3(cse_tmp_41, cse_tmp_55, xc_expm1((2 // 3) * cse_tmp_43)) / 2 + 1
        cse_tmp_57 = cse_tmp_56 ^ 3
        cse_tmp_58 = xc_expm1(-cse_tmp_54 / (cse_tmp_57 * params_a_gamma))
        cse_tmp_59 = cse_tmp_54 / cse_tmp_45
        cse_tmp_60 = cse_tmp_58 * params_a_gamma
        cse_tmp_61 = cse_tmp_21 * NaNMath.pow(cse_tmp_59, params_a_a_c) * params_a_beta * xt ^ 2 / (32 * cse_tmp_56 ^ 2 * rs)
        cse_tmp_54 + cse_tmp_57 * params_a_gamma * xc_log1p(cse_tmp_58 * cse_tmp_61 * (cse_tmp_60 + cse_tmp_61) / (cse_tmp_24 * cse_tmp_27 * NaNMath.pow(cse_tmp_59, 2 * params_a_a_c) * params_a_beta ^ 2 * xt ^ 4 / (1024 * cse_tmp_56 ^ 4) + cse_tmp_58 ^ 2 * params_a_gamma ^ 2 + cse_tmp_60 * cse_tmp_61))
    end
end
export gga_c_pbe_erf_gws_energy

const gga_c_pbe_erf_gws_defaults = (cam_omega = 0.5, params_a_a_c = 2.78, params_a_beta = 0.06672455060314922, params_a_gamma = 0.031090690869654894, zeta_threshold = 2.220446049250313e-16)
const gga_c_pbe_erf_gws_required = ()

function gga_c_pbe_erf_gws(rho, sigma; params = NamedTuple())
    p = resolve_params(gga_c_pbe_erf_gws_defaults, gga_c_pbe_erf_gws_required, params)
    v = gga_variables(rho, sigma, Val(3))
    return gga_c_pbe_erf_gws_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.cam_omega, p.params_a_a_c, p.params_a_beta, p.params_a_gamma, p.zeta_threshold)
end

function gga_c_pbe_erf_gws(na, nb, gaa, gab, gbb; params = NamedTuple())
    p = resolve_params(gga_c_pbe_erf_gws_defaults, gga_c_pbe_erf_gws_required, params)
    v = gga_variables(na, nb, gaa, gab, gbb, Val(3))
    return gga_c_pbe_erf_gws_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.cam_omega, p.params_a_a_c, p.params_a_beta, p.params_a_gamma, p.zeta_threshold)
end

export gga_c_pbe_erf_gws, gga_c_pbe_erf_gws_defaults, gga_c_pbe_erf_gws_required
