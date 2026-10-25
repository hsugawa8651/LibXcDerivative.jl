# Auto-generated from the Libxc sources
# python/gga_exc/gga_k_meyer.py -- do not edit by hand.
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
# args: rs, z, xt, xs0, xs1, dens_threshold, zeta_threshold
const gga_k_meyer_energy = function (rs, z, xt, xs0, xs1, dens_threshold, zeta_threshold)
    @inbounds begin
        cse_tmp_0 = z + 1
        cse_tmp_1 = (3 // 8) / (pi * rs ^ 3)
        cse_tmp_2 = xs0 ^ 2
        cse_tmp_3 = 3.3019272488946267
        cse_tmp_4 = 4.60115111447049
        cse_tmp_5 = cse_tmp_3 * cse_tmp_4
        cse_tmp_6 = 144000.0 * cse_tmp_5
        cse_tmp_7 = (384 // 5) * cse_tmp_5
        cse_tmp_8 = cse_tmp_2 > cse_tmp_6
        cse_tmp_9 = my_piecewise3(cse_tmp_8, cse_tmp_2, cse_tmp_6)
        cse_tmp_10 = 97.40909103400244
        cse_tmp_11 = (286654464 // 125) * cse_tmp_10
        cse_tmp_12 = 9488.531016070574
        cse_tmp_13 = (53394810209883993931776 // 766390625) * cse_tmp_12
        cse_tmp_14 = 1.8171205928321397
        cse_tmp_15 = 21.170591578193033
        cse_tmp_16 = (995328 // 175) * cse_tmp_14 * cse_tmp_15
        cse_tmp_17 = 2062.2080822838902
        cse_tmp_18 = (2458240222387765248 // 21896875) * cse_tmp_14 * cse_tmp_17
        cse_tmp_19 = 200877.81481824708
        cse_tmp_20 = (2448832971543168704759599932112896 // 476522530859375) * cse_tmp_14 * cse_tmp_19
        cse_tmp_21 = 448.1939477706577
        cse_tmp_22 = (65673684320256 // 336875) * cse_tmp_21 * cse_tmp_3
        cse_tmp_23 = 43658.16505928093
        cse_tmp_24 = (493979352336673211009728512 // 65143203125) * cse_tmp_23 * cse_tmp_3
        cse_tmp_25 = my_piecewise3(cse_tmp_8, cse_tmp_6, cse_tmp_2)
        cse_tmp_26 = cse_tmp_14 / cse_tmp_4
        cse_tmp_27 = cse_tmp_25 * cse_tmp_26
        cse_tmp_28 = cse_tmp_27 / 864
        cse_tmp_29 = 1 / (90128819145850098340523313777868800 * 90032220.84293328)
        cse_tmp_30 = 1 / (495613156783639793894424576 * 924269.1815233742)
        cse_tmp_31 = 1 / (2253276905283256320 * cse_tmp_12)
        cse_tmp_32 = 1 / (6772211712 * cse_tmp_10)
        cse_tmp_33 = cse_tmp_14 / (518359192189709999172105535488 * 4252702.174637001)
        cse_tmp_34 = cse_tmp_14 / (2545856244984651448320 * cse_tmp_23)
        cse_tmp_35 = cse_tmp_14 / (9194728587264 * cse_tmp_21)
        cse_tmp_36 = cse_tmp_3 / (533169454823701713434165693644800 * 19567325.350342114)
        cse_tmp_37 = cse_tmp_3 / (2786185074511202545041408 * cse_tmp_19)
        cse_tmp_38 = cse_tmp_3 / (11475021276905472 * cse_tmp_17)
        cse_tmp_39 = cse_tmp_3 / (26127360 * cse_tmp_15)
        cse_tmp_40 = my_piecewise3(cse_tmp_28 > 1 // 16, cse_tmp_28, 1 // 16)
        cse_tmp_41 = NaNMath.sqrt(cse_tmp_40)
        cse_tmp_42 = cse_tmp_41 ^ (-1)
        cse_tmp_43 = cse_tmp_41 - 1
        cse_tmp_44 = -cse_tmp_43
        cse_tmp_45 = my_piecewise3(cse_tmp_28 < 1 // 16, cse_tmp_25 ^ 12 * cse_tmp_29 + cse_tmp_25 ^ 11 * cse_tmp_36 + cse_tmp_25 ^ 10 * cse_tmp_33 + cse_tmp_25 ^ 9 * cse_tmp_30 + cse_tmp_25 ^ 8 * cse_tmp_37 + cse_tmp_25 ^ 7 * cse_tmp_34 + cse_tmp_25 ^ 6 * cse_tmp_31 + cse_tmp_25 ^ 5 * cse_tmp_38 + cse_tmp_25 ^ 4 * cse_tmp_35 + cse_tmp_25 ^ 3 * cse_tmp_32 + cse_tmp_25 ^ 2 * cse_tmp_39 + cse_tmp_27 / 12960 + 1 // 3, (-(1 - cse_tmp_40) * my_piecewise3(cse_tmp_40 < 1, cse_tmp_42 * xc_atanh(cse_tmp_41), cse_tmp_42 * NaNMath.log((cse_tmp_41 + 1) / my_piecewise3(cse_tmp_44 >= 0, cse_tmp_44, cse_tmp_43)) / 2) + 1) / (2 * cse_tmp_40))
        cse_tmp_46 = my_piecewise3(cse_tmp_28 > 1, cse_tmp_28, 1)
        cse_tmp_47 = cse_tmp_46 ^ (-1)
        cse_tmp_48 = my_piecewise3(cse_tmp_47 > 1 // 16, cse_tmp_47, 1 // 16)
        cse_tmp_49 = NaNMath.sqrt(cse_tmp_48)
        cse_tmp_50 = cse_tmp_49 ^ (-1)
        cse_tmp_51 = cse_tmp_49 - 1
        cse_tmp_52 = -cse_tmp_51
        cse_tmp_53 = my_piecewise3(cse_tmp_47 < 1 // 16, cse_tmp_47 / 15 + 1 // 3 + 1 / (35 * cse_tmp_46 ^ 2) + 1 / (63 * cse_tmp_46 ^ 3) + 1 / (99 * cse_tmp_46 ^ 4) + 1 / (143 * cse_tmp_46 ^ 5) + 1 / (195 * cse_tmp_46 ^ 6) + 1 / (255 * cse_tmp_46 ^ 7) + 1 / (323 * cse_tmp_46 ^ 8) + 1 / (399 * cse_tmp_46 ^ 9) + 1 / (483 * cse_tmp_46 ^ 10) + 1 / (575 * cse_tmp_46 ^ 11) + 1 / (675 * cse_tmp_46 ^ 12), (-(1 - cse_tmp_48) * my_piecewise3(cse_tmp_48 < 1, cse_tmp_50 * xc_atanh(cse_tmp_49), cse_tmp_50 * NaNMath.log((cse_tmp_49 + 1) / my_piecewise3(cse_tmp_52 >= 0, cse_tmp_52, cse_tmp_51)) / 2) + 1) / (2 * cse_tmp_48))
        cse_tmp_54 = (5 // 72) * cse_tmp_26
        cse_tmp_55 = cse_tmp_0 <= zeta_threshold
        cse_tmp_56 = zeta_threshold - 1
        cse_tmp_57 = 1 - z
        cse_tmp_58 = cse_tmp_57 <= zeta_threshold
        cse_tmp_59 = -cse_tmp_56
        cse_tmp_60 = my_piecewise5(cse_tmp_55, cse_tmp_56, cse_tmp_58, cse_tmp_59, z)
        cse_tmp_61 = NaNMath.pow(zeta_threshold, 1.6666666666666667) - 1
        cse_tmp_62 = (9 // 80) * 2.2894284851066637 * 2.1450293971110255 / rs ^ 2
        cse_tmp_63 = xs1 ^ 2
        cse_tmp_64 = cse_tmp_63 > cse_tmp_6
        cse_tmp_65 = my_piecewise3(cse_tmp_64, cse_tmp_63, cse_tmp_6)
        cse_tmp_66 = my_piecewise3(cse_tmp_64, cse_tmp_6, cse_tmp_63)
        cse_tmp_67 = cse_tmp_26 * cse_tmp_66
        cse_tmp_68 = cse_tmp_67 / 864
        cse_tmp_69 = my_piecewise3(cse_tmp_68 > 1 // 16, cse_tmp_68, 1 // 16)
        cse_tmp_70 = NaNMath.sqrt(cse_tmp_69)
        cse_tmp_71 = cse_tmp_70 ^ (-1)
        cse_tmp_72 = cse_tmp_70 - 1
        cse_tmp_73 = -cse_tmp_72
        cse_tmp_74 = my_piecewise3(cse_tmp_68 < 1 // 16, cse_tmp_29 * cse_tmp_66 ^ 12 + cse_tmp_30 * cse_tmp_66 ^ 9 + cse_tmp_31 * cse_tmp_66 ^ 6 + cse_tmp_32 * cse_tmp_66 ^ 3 + cse_tmp_33 * cse_tmp_66 ^ 10 + cse_tmp_34 * cse_tmp_66 ^ 7 + cse_tmp_35 * cse_tmp_66 ^ 4 + cse_tmp_36 * cse_tmp_66 ^ 11 + cse_tmp_37 * cse_tmp_66 ^ 8 + cse_tmp_38 * cse_tmp_66 ^ 5 + cse_tmp_39 * cse_tmp_66 ^ 2 + cse_tmp_67 / 12960 + 1 // 3, (-(1 - cse_tmp_69) * my_piecewise3(cse_tmp_69 < 1, cse_tmp_71 * xc_atanh(cse_tmp_70), cse_tmp_71 * NaNMath.log((cse_tmp_70 + 1) / my_piecewise3(cse_tmp_73 >= 0, cse_tmp_73, cse_tmp_72)) / 2) + 1) / (2 * cse_tmp_69))
        cse_tmp_75 = my_piecewise3(cse_tmp_68 > 1, cse_tmp_68, 1)
        cse_tmp_76 = cse_tmp_75 ^ (-1)
        cse_tmp_77 = my_piecewise3(cse_tmp_76 > 1 // 16, cse_tmp_76, 1 // 16)
        cse_tmp_78 = NaNMath.sqrt(cse_tmp_77)
        cse_tmp_79 = cse_tmp_78 ^ (-1)
        cse_tmp_80 = cse_tmp_78 - 1
        cse_tmp_81 = -cse_tmp_80
        cse_tmp_82 = my_piecewise3(cse_tmp_76 < 1 // 16, cse_tmp_76 / 15 + 1 // 3 + 1 / (35 * cse_tmp_75 ^ 2) + 1 / (63 * cse_tmp_75 ^ 3) + 1 / (99 * cse_tmp_75 ^ 4) + 1 / (143 * cse_tmp_75 ^ 5) + 1 / (195 * cse_tmp_75 ^ 6) + 1 / (255 * cse_tmp_75 ^ 7) + 1 / (323 * cse_tmp_75 ^ 8) + 1 / (399 * cse_tmp_75 ^ 9) + 1 / (483 * cse_tmp_75 ^ 10) + 1 / (575 * cse_tmp_75 ^ 11) + 1 / (675 * cse_tmp_75 ^ 12), (-(1 - cse_tmp_77) * my_piecewise3(cse_tmp_77 < 1, cse_tmp_79 * xc_atanh(cse_tmp_78), cse_tmp_79 * NaNMath.log((cse_tmp_78 + 1) / my_piecewise3(cse_tmp_81 >= 0, cse_tmp_81, cse_tmp_80)) / 2) + 1) / (2 * cse_tmp_77))
        cse_tmp_83 = my_piecewise5(cse_tmp_58, cse_tmp_56, cse_tmp_55, cse_tmp_59, -z)
        my_piecewise3(cse_tmp_0 * cse_tmp_1 <= dens_threshold, 0, cse_tmp_62 * (cse_tmp_54 * my_piecewise3(cse_tmp_2 >= cse_tmp_6, -cse_tmp_11 / cse_tmp_9 ^ 2 - cse_tmp_13 / cse_tmp_9 ^ 5 - cse_tmp_16 / cse_tmp_9 - cse_tmp_18 / cse_tmp_9 ^ 4 - cse_tmp_20 / cse_tmp_9 ^ 7 - cse_tmp_22 / cse_tmp_9 ^ 3 - cse_tmp_24 / cse_tmp_9 ^ 6 - cse_tmp_7 + cse_tmp_9, cse_tmp_25 * my_piecewise3(cse_tmp_28 <= 1, cse_tmp_45 / (-cse_tmp_27 * cse_tmp_45 / 288 + 3), (-cse_tmp_47 * cse_tmp_53 + 1) / (3 * cse_tmp_53))) + 1) * (my_piecewise3(cse_tmp_60 + 1 <= zeta_threshold, cse_tmp_61, xc_expm1((5 // 3) * xc_log1p(my_piecewise3(cse_tmp_60 > cse_tmp_56, cse_tmp_60, cse_tmp_56)))) + 1)) + my_piecewise3(cse_tmp_1 * cse_tmp_57 <= dens_threshold, 0, cse_tmp_62 * (cse_tmp_54 * my_piecewise3(cse_tmp_63 >= cse_tmp_6, -cse_tmp_11 / cse_tmp_65 ^ 2 - cse_tmp_13 / cse_tmp_65 ^ 5 - cse_tmp_16 / cse_tmp_65 - cse_tmp_18 / cse_tmp_65 ^ 4 - cse_tmp_20 / cse_tmp_65 ^ 7 - cse_tmp_22 / cse_tmp_65 ^ 3 - cse_tmp_24 / cse_tmp_65 ^ 6 + cse_tmp_65 - cse_tmp_7, cse_tmp_66 * my_piecewise3(cse_tmp_68 <= 1, cse_tmp_74 / (-cse_tmp_67 * cse_tmp_74 / 288 + 3), (-cse_tmp_76 * cse_tmp_82 + 1) / (3 * cse_tmp_82))) + 1) * (my_piecewise3(cse_tmp_83 + 1 <= zeta_threshold, cse_tmp_61, xc_expm1((5 // 3) * xc_log1p(my_piecewise3(cse_tmp_83 > cse_tmp_56, cse_tmp_83, cse_tmp_56)))) + 1))
    end
end
export gga_k_meyer_energy

const gga_k_meyer_defaults = (dens_threshold = 1.0e-15, zeta_threshold = 2.220446049250313e-16)
const gga_k_meyer_required = ()

function gga_k_meyer(rho, sigma; params = NamedTuple())
    p = resolve_params(gga_k_meyer_defaults, gga_k_meyer_required, params)
    v = gga_variables(rho, sigma, Val(3))
    return gga_k_meyer_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.dens_threshold, p.zeta_threshold)
end

function gga_k_meyer(na, nb, gaa, gab, gbb; params = NamedTuple())
    p = resolve_params(gga_k_meyer_defaults, gga_k_meyer_required, params)
    v = gga_variables(na, nb, gaa, gab, gbb, Val(3))
    return gga_k_meyer_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.dens_threshold, p.zeta_threshold)
end

export gga_k_meyer, gga_k_meyer_defaults, gga_k_meyer_required
