# Auto-generated from the Libxc sources
# python/lda_exc/lda_c_pk09.py -- do not edit by hand.
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
# args: rs, z, zeta_threshold
const lda_c_pk09_energy = function (rs, z, zeta_threshold)
    @inbounds begin
        cse_tmp_0 = rs ^ 3
        cse_tmp_1 = z + 1
        cse_tmp_2 = 1 - z
        cse_tmp_3 = rs ^ 2
        cse_tmp_4 = NaNMath.pow(rs, 0.3333333333333333)
        cse_tmp_5 = cse_tmp_1 <= zeta_threshold
        cse_tmp_6 = NaNMath.pow(zeta_threshold, 0.3333333333333333) - 1
        cse_tmp_7 = zeta_threshold - 1
        cse_tmp_8 = xc_log1p(my_piecewise3(z > cse_tmp_7, z, cse_tmp_7))
        cse_tmp_9 = my_piecewise3(cse_tmp_5, cse_tmp_6, xc_expm1(cse_tmp_8 / 3)) + 1
        cse_tmp_10 = cse_tmp_2 <= zeta_threshold
        cse_tmp_11 = -z
        cse_tmp_12 = xc_log1p(my_piecewise3(cse_tmp_11 > cse_tmp_7, cse_tmp_11, cse_tmp_7))
        cse_tmp_13 = my_piecewise3(cse_tmp_10, cse_tmp_6, xc_expm1(cse_tmp_12 / 3)) + 1
        cse_tmp_14 = 2.6207413942088964 * 1.4645918875615234 / rs
        cse_tmp_15 = cse_tmp_14 / 2
        cse_tmp_16 = (3 // 2) * 2.2894284851066637 * 2.1450293971110255 * cse_tmp_13 * cse_tmp_9 * (2.619709858963178 * cse_tmp_4 * exp(-1.03665759464352 * cse_tmp_4) - 2.22609499098519 * NaNMath.pow(rs, 0.25) * exp(-0.837303782322808 * cse_tmp_4) + 0.538074483500437) / (cse_tmp_3 * (cse_tmp_13 * cse_tmp_15 + cse_tmp_15 * cse_tmp_9))
        cse_tmp_17 = my_piecewise3(cse_tmp_16 > 1.0e-11, cse_tmp_16, 1.0e-11)
        cse_tmp_18 = cse_tmp_17 ^ 2
        cse_tmp_19 = cse_tmp_18 ^ (-1)
        cse_tmp_20 = cse_tmp_17 ^ (-1)
        cse_tmp_21 = cse_tmp_20 * NaNMath.log(cse_tmp_17)
        cse_tmp_22 = atan(5.93965654951900799 * cse_tmp_17 + 2.36958012866641818)
        cse_tmp_23 = NaNMath.sqrt(0.252882919616989509 * cse_tmp_17 + 0.25 * cse_tmp_18 + 0.0720485831127149779)
        cse_tmp_24 = 0.0226274169979695208 * cse_tmp_17 + 0.0283592616144882565 * cse_tmp_18 + 0.00531736155271654809
        cse_tmp_25 = zeta_threshold ^ 2 - 1
        cse_tmp_26 = z ^ 2
        cse_tmp_27 = 2.5218818358694818 * cse_tmp_26
        cse_tmp_28 = z ^ 3
        cse_tmp_29 = cse_tmp_28 + 2.09708505883490736 * z
        cse_tmp_30 = 0.58034406381224798 * cse_tmp_28
        cse_tmp_31 = 1.18013146546319105 * z
        cse_tmp_32 = 1.4269304149842164 * cse_tmp_26 + 0.0109912236729144 * z ^ 4 + 0.32481568604919886
        cse_tmp_33 = rs ^ 4
        cse_tmp_34 = -25.15400990418799 * cse_tmp_0 + 54.4034331373908366 * cse_tmp_3 + cse_tmp_33 + 16.2663129444242415 * rs - 109.7426349321691
        cse_tmp_35 = 1.28 * my_piecewise3(my_piecewise3(cse_tmp_34 >= 0, cse_tmp_34, -cse_tmp_34) <= 1.0e-12, 0, (-23.8242372168379302 * cse_tmp_0 + 49.3413129583967075 * cse_tmp_3 + 0.944080741695104794 * cse_tmp_33 + 0.000293039144178338 * rs ^ 5 + 24.0050215127871144 * rs - 113.69336978972719) / cse_tmp_34)
        cse_tmp_36 = cse_tmp_35 * (cse_tmp_30 + cse_tmp_31 - cse_tmp_32) / (-cse_tmp_27 + cse_tmp_29 - 0.5778610319323943)
        cse_tmp_37 = NaNMath.pow(zeta_threshold, cse_tmp_36)
        cse_tmp_38 = cse_tmp_14 * (0.077123208419481 * cse_tmp_4 * exp(-0.46958449007619 * cse_tmp_4) + 0.599343256903515 * NaNMath.pow(rs, 0.6666666666666666) * exp(-1.70939476802168 * cse_tmp_4) + 0.41081146652128)
        cse_tmp_39 = cse_tmp_38 * cse_tmp_9 / (my_piecewise3(cse_tmp_10, cse_tmp_37, NaNMath.pow(cse_tmp_2, cse_tmp_36)) + my_piecewise3(cse_tmp_5, cse_tmp_37, NaNMath.pow(cse_tmp_1, cse_tmp_36)))
        cse_tmp_40 = my_piecewise3(cse_tmp_39 > 1.0e-11, cse_tmp_39, 1.0e-11)
        cse_tmp_41 = cse_tmp_40 ^ 2
        cse_tmp_42 = cse_tmp_41 ^ (-1)
        cse_tmp_43 = cse_tmp_40 ^ (-1)
        cse_tmp_44 = cse_tmp_43 * NaNMath.log(cse_tmp_40)
        cse_tmp_45 = atan(5.93965654951900799 * cse_tmp_40 + 2.36958012866641818)
        cse_tmp_46 = NaNMath.sqrt(0.252882919616989509 * cse_tmp_40 + 0.25 * cse_tmp_41 + 0.0720485831127149779)
        cse_tmp_47 = 0.0226274169979695208 * cse_tmp_40 + 0.0283592616144882565 * cse_tmp_41 + 0.00531736155271654809
        cse_tmp_48 = cse_tmp_35 * (-cse_tmp_30 - cse_tmp_31 - cse_tmp_32) / (-cse_tmp_27 - cse_tmp_29 - 0.5778610319323943)
        cse_tmp_49 = NaNMath.pow(zeta_threshold, cse_tmp_48)
        cse_tmp_50 = cse_tmp_13 * cse_tmp_38 / (my_piecewise3(cse_tmp_10, cse_tmp_49, NaNMath.pow(cse_tmp_2, cse_tmp_48)) + my_piecewise3(cse_tmp_5, cse_tmp_49, NaNMath.pow(cse_tmp_1, cse_tmp_48)))
        cse_tmp_51 = my_piecewise3(cse_tmp_50 > 1.0e-11, cse_tmp_50, 1.0e-11)
        cse_tmp_52 = cse_tmp_51 ^ 2
        cse_tmp_53 = cse_tmp_52 ^ (-1)
        cse_tmp_54 = cse_tmp_51 ^ (-1)
        cse_tmp_55 = cse_tmp_54 * NaNMath.log(cse_tmp_51)
        cse_tmp_56 = atan(5.93965654951900799 * cse_tmp_51 + 2.36958012866641818)
        cse_tmp_57 = NaNMath.sqrt(0.252882919616989509 * cse_tmp_51 + 0.25 * cse_tmp_52 + 0.0720485831127149779)
        cse_tmp_58 = 0.0226274169979695208 * cse_tmp_51 + 0.0283592616144882565 * cse_tmp_52 + 0.00531736155271654809
        (3 // 4) * (cse_tmp_1 * cse_tmp_2 * (-42.6490544891031073 * cse_tmp_19 * cse_tmp_23 - 32.4014708516771368 * cse_tmp_19 + 116.93504264748091 * cse_tmp_20 * cse_tmp_22 - 13.2844495072998436 * cse_tmp_20 * xc_atanh((0.471060597934991862 * cse_tmp_17 + 0.268418671319107341) / cse_tmp_23) + 29.6240023046901289 * cse_tmp_20 * NaNMath.log(cse_tmp_17 + 0.482257181994472723) + 11.2832226581251903 * cse_tmp_20 * NaNMath.log(0.32 * cse_tmp_17 + 0.401060523940960082 * cse_tmp_18 + 0.0751988482389300153) - 0.246903981179097557 * cse_tmp_20 * NaNMath.log(0.410709696778185459 * cse_tmp_17 + 0.5 * cse_tmp_18 + 0.105323524476768857) - 14.565097171165967 * cse_tmp_20 * NaNMath.log(0.623347313127238558 * cse_tmp_17 + 0.78125 * cse_tmp_18 + 0.146484374999999999) + 111.811548105797788 * cse_tmp_20 * atan(0.160041105570901272 / (0.78125 * cse_tmp_17 + 0.32086695060795739)) - 132.479090287794355 * cse_tmp_20 - 22.5664453162503806 * cse_tmp_21 + (-0.05118886552595877 * cse_tmp_17 + 0.222017353476155799 * cse_tmp_19 - cse_tmp_20 * cse_tmp_22 * (0.1473137771194929 * cse_tmp_17 + 0.1846304394851914 * cse_tmp_18 + 0.0346182074034769) - cse_tmp_20 * (0.07641254691754473 * cse_tmp_17 + 0.09576892532004281 * cse_tmp_18 + 0.01795667349750801) * NaNMath.log(cse_tmp_24) + 0.89853746026347341 * cse_tmp_20 + cse_tmp_21 * (0.1528250938350897 * cse_tmp_17 + 0.1915378506400854 * cse_tmp_18 + 0.03591334699501599) + 1.01508307543839117) / cse_tmp_24) / 4 + (my_piecewise3(cse_tmp_10, cse_tmp_25, xc_expm1(2 * cse_tmp_12)) / 8 + 1 // 8) * (-42.6490544891031073 * cse_tmp_53 * cse_tmp_57 - 32.4014708516771368 * cse_tmp_53 + 116.93504264748091 * cse_tmp_54 * cse_tmp_56 - 13.2844495072998436 * cse_tmp_54 * xc_atanh((0.471060597934991862 * cse_tmp_51 + 0.268418671319107341) / cse_tmp_57) + 29.6240023046901289 * cse_tmp_54 * NaNMath.log(cse_tmp_51 + 0.482257181994472723) + 11.2832226581251903 * cse_tmp_54 * NaNMath.log(0.32 * cse_tmp_51 + 0.401060523940960082 * cse_tmp_52 + 0.0751988482389300153) - 0.246903981179097557 * cse_tmp_54 * NaNMath.log(0.410709696778185459 * cse_tmp_51 + 0.5 * cse_tmp_52 + 0.105323524476768857) - 14.565097171165967 * cse_tmp_54 * NaNMath.log(0.623347313127238558 * cse_tmp_51 + 0.78125 * cse_tmp_52 + 0.146484374999999999) + 111.811548105797788 * cse_tmp_54 * atan(0.160041105570901272 / (0.78125 * cse_tmp_51 + 0.32086695060795739)) - 132.479090287794355 * cse_tmp_54 - 22.5664453162503806 * cse_tmp_55 + (-0.05118886552595877 * cse_tmp_51 + 0.222017353476155799 * cse_tmp_53 - cse_tmp_54 * cse_tmp_56 * (0.1473137771194929 * cse_tmp_51 + 0.1846304394851914 * cse_tmp_52 + 0.0346182074034769) - cse_tmp_54 * (0.07641254691754473 * cse_tmp_51 + 0.09576892532004281 * cse_tmp_52 + 0.01795667349750801) * NaNMath.log(cse_tmp_58) + 0.89853746026347341 * cse_tmp_54 + cse_tmp_55 * (0.1528250938350897 * cse_tmp_51 + 0.1915378506400854 * cse_tmp_52 + 0.03591334699501599) + 1.01508307543839117) / cse_tmp_58) + (my_piecewise3(cse_tmp_5, cse_tmp_25, xc_expm1(2 * cse_tmp_8)) / 8 + 1 // 8) * (-42.6490544891031073 * cse_tmp_42 * cse_tmp_46 - 32.4014708516771368 * cse_tmp_42 + 116.93504264748091 * cse_tmp_43 * cse_tmp_45 - 13.2844495072998436 * cse_tmp_43 * xc_atanh((0.471060597934991862 * cse_tmp_40 + 0.268418671319107341) / cse_tmp_46) + 29.6240023046901289 * cse_tmp_43 * NaNMath.log(cse_tmp_40 + 0.482257181994472723) + 11.2832226581251903 * cse_tmp_43 * NaNMath.log(0.32 * cse_tmp_40 + 0.401060523940960082 * cse_tmp_41 + 0.0751988482389300153) - 0.246903981179097557 * cse_tmp_43 * NaNMath.log(0.410709696778185459 * cse_tmp_40 + 0.5 * cse_tmp_41 + 0.105323524476768857) - 14.565097171165967 * cse_tmp_43 * NaNMath.log(0.623347313127238558 * cse_tmp_40 + 0.78125 * cse_tmp_41 + 0.146484374999999999) + 111.811548105797788 * cse_tmp_43 * atan(0.160041105570901272 / (0.78125 * cse_tmp_40 + 0.32086695060795739)) - 132.479090287794355 * cse_tmp_43 - 22.5664453162503806 * cse_tmp_44 + (-0.05118886552595877 * cse_tmp_40 + 0.222017353476155799 * cse_tmp_42 - cse_tmp_43 * cse_tmp_45 * (0.1473137771194929 * cse_tmp_40 + 0.1846304394851914 * cse_tmp_41 + 0.0346182074034769) - cse_tmp_43 * (0.07641254691754473 * cse_tmp_40 + 0.09576892532004281 * cse_tmp_41 + 0.01795667349750801) * NaNMath.log(cse_tmp_47) + 0.89853746026347341 * cse_tmp_43 + cse_tmp_44 * (0.1528250938350897 * cse_tmp_40 + 0.1915378506400854 * cse_tmp_41 + 0.03591334699501599) + 1.01508307543839117) / cse_tmp_47)) / (pi * cse_tmp_0)
    end
end
export lda_c_pk09_energy

const lda_c_pk09_defaults = (zeta_threshold = 2.220446049250313e-16,)
const lda_c_pk09_required = ()

function lda_c_pk09(rho; params = NamedTuple())
    p = resolve_params(lda_c_pk09_defaults, lda_c_pk09_required, params)
    v = lda_variables(rho, Val(3))
    return lda_c_pk09_energy(v.rs, v.z, p.zeta_threshold)
end

function lda_c_pk09(na, nb; params = NamedTuple())
    p = resolve_params(lda_c_pk09_defaults, lda_c_pk09_required, params)
    v = lda_variables(na, nb, Val(3))
    return lda_c_pk09_energy(v.rs, v.z, p.zeta_threshold)
end

export lda_c_pk09, lda_c_pk09_defaults, lda_c_pk09_required
