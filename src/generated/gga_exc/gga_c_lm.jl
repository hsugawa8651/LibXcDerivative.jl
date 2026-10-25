# Auto-generated from the Libxc sources
# python/gga_exc/gga_c_lm.py -- do not edit by hand.
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
# args: rs, z, xt, xs0, xs1, params_a_lm_f, zeta_threshold
const gga_c_lm_energy = function (rs, z, xt, xs0, xs1, params_a_lm_f, zeta_threshold)
    @inbounds begin
        cse_tmp_0 = 1.2599210498948732
        cse_tmp_1 = rs ^ (-1)
        cse_tmp_2 = z + 1
        cse_tmp_3 = cse_tmp_2 <= zeta_threshold
        cse_tmp_4 = NaNMath.pow(zeta_threshold, 1.3333333333333333)
        cse_tmp_5 = 1 - z
        cse_tmp_6 = cse_tmp_5 <= zeta_threshold
        cse_tmp_7 = NaNMath.pow(zeta_threshold, 1.6666666666666667) - 1
        cse_tmp_8 = zeta_threshold - 1
        cse_tmp_9 = xc_log1p(my_piecewise3(z > cse_tmp_8, z, cse_tmp_8))
        cse_tmp_10 = -z
        cse_tmp_11 = xc_log1p(my_piecewise3(cse_tmp_10 > cse_tmp_8, cse_tmp_10, cse_tmp_8))
        cse_tmp_12 = rs ^ (-24)
        cse_tmp_13 = rs ^ (-23)
        cse_tmp_14 = rs ^ (-22)
        cse_tmp_15 = rs ^ (-21)
        cse_tmp_16 = rs ^ (-20)
        cse_tmp_17 = rs ^ (-19)
        cse_tmp_18 = rs ^ (-18)
        cse_tmp_19 = rs ^ (-17)
        cse_tmp_20 = rs ^ (-16)
        cse_tmp_21 = rs ^ (-15)
        cse_tmp_22 = rs ^ (-14)
        cse_tmp_23 = rs ^ (-13)
        cse_tmp_24 = rs ^ (-12)
        cse_tmp_25 = rs ^ (-11)
        cse_tmp_26 = rs ^ (-10)
        cse_tmp_27 = rs ^ (-9)
        cse_tmp_28 = rs ^ (-8)
        cse_tmp_29 = rs ^ (-7)
        cse_tmp_30 = rs ^ (-6)
        cse_tmp_31 = rs ^ (-5)
        cse_tmp_32 = rs ^ (-4)
        cse_tmp_33 = rs ^ 3
        cse_tmp_34 = cse_tmp_33 ^ (-1)
        cse_tmp_35 = rs ^ 2
        cse_tmp_36 = cse_tmp_35 ^ (-1)
        cse_tmp_37 = -0.0252 * my_piecewise3(rs / 30 > 4, (45 // 2) * cse_tmp_1 - 1307544150375000000000000000000000 * cse_tmp_12 + (14121476824050000000000000000000000 // 299) * cse_tmp_13 - 18828635765400000000000000000000 // 11 * cse_tmp_14 + (435848050125000000000000000000 // 7) * cse_tmp_15 - 52301766015000000000000000000 // 23 * cse_tmp_16 + (17433922005000000000000000000 // 209) * cse_tmp_17 - 21523360500000000000000000 // 7 * cse_tmp_18 + (1937102445000000000000000 // 17) * cse_tmp_19 - 80712601875000000000000 // 19 * cse_tmp_20 + 159432300000000000000 * cse_tmp_21 - 717445350000000000000 // 119 * cse_tmp_22 + (2989355625000000000 // 13) * cse_tmp_23 - 8857350000000000 * cse_tmp_24 + (26572050000000000 // 77) * cse_tmp_25 - 177147000000000 // 13 * cse_tmp_26 + 546750000000 * cse_tmp_27 - 246037500000 // 11 * cse_tmp_28 + (6561000000 // 7) * cse_tmp_29 - 40500000 * cse_tmp_30 + 1822500 * cse_tmp_31 - 607500 // 7 * cse_tmp_32 + 4500 * cse_tmp_34 - 270 * cse_tmp_36, -cse_tmp_35 / 900 + rs / 60 + (cse_tmp_33 / 27000 + 1) * xc_log1p(30 * cse_tmp_1) - 1 // 3)
        cse_tmp_38 = cse_tmp_4 - 1
        cse_tmp_0 * cse_tmp_1 * (-7 // 36 * cse_tmp_0 * (xs0 ^ 2 * my_piecewise3(cse_tmp_3, cse_tmp_4, NaNMath.pow(cse_tmp_2, 1.3333333333333333)) + xs1 ^ 2 * my_piecewise3(cse_tmp_6, cse_tmp_4, NaNMath.pow(cse_tmp_5, 1.3333333333333333))) + 2 * xt ^ 2 * exp(-1.5874010519681994 * 1.7320508075688772 * params_a_lm_f * Abs(xt) / (2 * NaNMath.sqrt(rs))) / NaNMath.sqrt(my_piecewise3(cse_tmp_3, cse_tmp_7, xc_expm1((5 // 3) * cse_tmp_9)) / 2 + my_piecewise3(cse_tmp_6, cse_tmp_7, xc_expm1((5 // 3) * cse_tmp_11)) / 2 + 1)) / (96 * 9.869604401089358) + cse_tmp_37 + (-cse_tmp_37 - 0.0127 * my_piecewise3(rs / 75 > 4, (225 // 4) * cse_tmp_1 - 4.645329988672842e+42 * cse_tmp_12 + (6.711647341493871e+40) * cse_tmp_13 - 9.729854812638388e+38 * cse_tmp_14 + (1.4157196155955327e+37) * cse_tmp_15 - 19027271633603959344327449798583984375 // 92 * cse_tmp_16 + (1268484775573597289621829986572265625 // 418) * cse_tmp_17 - 626412234851159155368804931640625 // 14 * cse_tmp_18 + (45101680909283459186553955078125 // 68) * cse_tmp_19 - 3006778727285563945770263671875 // 304 * cse_tmp_20 + (296965800225734710693359375 // 2) * cse_tmp_21 - 534538440406322479248046875 // 238 * cse_tmp_22 + (7127179205417633056640625 // 208) * cse_tmp_23 - 2111756801605224609375 // 4 * cse_tmp_24 + (1267054080963134765625 // 154) * cse_tmp_25 - 3378810882568359375 // 26 * cse_tmp_26 + (8342742919921875 // 4) * cse_tmp_27 - 3003387451171875 // 88 * cse_tmp_28 + (8009033203125 // 14) * cse_tmp_29 - 19775390625 // 2 * cse_tmp_30 + (1423828125 // 8) * cse_tmp_31 - 94921875 // 28 * cse_tmp_32 + (140625 // 2) * cse_tmp_34 - 3375 // 2 * cse_tmp_36, -cse_tmp_35 / 5625 + rs / 150 + (cse_tmp_33 / 421875 + 1) * xc_log1p(75 * cse_tmp_1) - 1 // 3)) * (my_piecewise3(cse_tmp_3, cse_tmp_38, xc_expm1((4 // 3) * cse_tmp_9)) + my_piecewise3(cse_tmp_6, cse_tmp_38, xc_expm1((4 // 3) * cse_tmp_11))) / (2 * cse_tmp_0 - 2)
    end
end
export gga_c_lm_energy

const gga_c_lm_defaults = (params_a_lm_f = 0.15, zeta_threshold = 2.220446049250313e-16)
const gga_c_lm_required = ()

function gga_c_lm(rho, sigma; params = NamedTuple())
    p = resolve_params(gga_c_lm_defaults, gga_c_lm_required, params)
    v = gga_variables(rho, sigma, Val(3))
    return gga_c_lm_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.params_a_lm_f, p.zeta_threshold)
end

function gga_c_lm(na, nb, gaa, gab, gbb; params = NamedTuple())
    p = resolve_params(gga_c_lm_defaults, gga_c_lm_required, params)
    v = gga_variables(na, nb, gaa, gab, gbb, Val(3))
    return gga_c_lm_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.params_a_lm_f, p.zeta_threshold)
end

export gga_c_lm, gga_c_lm_defaults, gga_c_lm_required
