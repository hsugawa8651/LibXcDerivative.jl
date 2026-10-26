# Auto-generated from the Libxc sources
# python/mgga_exc/mgga_x_mbeef.py -- do not edit by hand.
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
# args: rs, z, xt, xs0, xs1, u0, u1, t0, t1, dens_threshold, zeta_threshold
const mgga_x_mbeef_energy = function (rs, z, xt, xs0, xs1, u0, u1, t0, t1, dens_threshold, zeta_threshold)
    @inbounds begin
        cse_tmp_0 = z + 1
        cse_tmp_1 = (3 // 8) / (pi * rs ^ 3)
        cse_tmp_2 = xs0 ^ 2
        cse_tmp_3 = 1.8171205928321397
        cse_tmp_4 = cse_tmp_3 / 4.60115111447049
        cse_tmp_5 = cse_tmp_4 / 24
        cse_tmp_6 = cse_tmp_2 * cse_tmp_5 + 6.5124
        cse_tmp_7 = cse_tmp_6 ^ (-7)
        cse_tmp_8 = cse_tmp_6 ^ (-6)
        cse_tmp_9 = cse_tmp_6 ^ (-5)
        cse_tmp_10 = cse_tmp_6 ^ (-4)
        cse_tmp_11 = cse_tmp_6 ^ (-3)
        cse_tmp_12 = cse_tmp_6 ^ (-2)
        cse_tmp_13 = cse_tmp_6 ^ (-1)
        cse_tmp_14 = (5 // 9) * cse_tmp_4
        cse_tmp_15 = cse_tmp_14 * (-cse_tmp_2 / 8 + t0)
        cse_tmp_16 = cse_tmp_15 > 10000.0
        cse_tmp_17 = my_piecewise3(cse_tmp_16, cse_tmp_15, 10000.0)
        cse_tmp_18 = my_piecewise3(cse_tmp_16, 10000.0, cse_tmp_15)
        cse_tmp_19 = cse_tmp_18 ^ 3
        cse_tmp_20 = my_piecewise3(cse_tmp_15 >= 10000.0, 3 / cse_tmp_17 ^ 2 + cse_tmp_17 ^ (-3), (3 * cse_tmp_18 ^ 4 - 3 * cse_tmp_18 ^ 2 + cse_tmp_19 + 2) / (cse_tmp_19 * (cse_tmp_19 + 1) + 1))
        cse_tmp_21 = cse_tmp_20 ^ 2
        cse_tmp_22 = cse_tmp_20 ^ 3
        cse_tmp_23 = cse_tmp_20 ^ 4
        cse_tmp_24 = cse_tmp_20 ^ 5
        cse_tmp_25 = cse_tmp_20 ^ 6
        cse_tmp_26 = cse_tmp_20 ^ 7
        cse_tmp_27 = cse_tmp_0 <= zeta_threshold
        cse_tmp_28 = zeta_threshold - 1
        cse_tmp_29 = 1 - z
        cse_tmp_30 = cse_tmp_29 <= zeta_threshold
        cse_tmp_31 = -cse_tmp_28
        cse_tmp_32 = my_piecewise5(cse_tmp_27, cse_tmp_28, cse_tmp_30, cse_tmp_31, z) + 1
        cse_tmp_33 = NaNMath.pow(zeta_threshold, 1.3333333333333333)
        cse_tmp_34 = 0.184639691595506 * cse_tmp_3 / (1.4645918875615234 * rs)
        cse_tmp_35 = xs1 ^ 2
        cse_tmp_36 = cse_tmp_35 * cse_tmp_5 + 6.5124
        cse_tmp_37 = cse_tmp_36 ^ (-7)
        cse_tmp_38 = cse_tmp_36 ^ (-6)
        cse_tmp_39 = cse_tmp_36 ^ (-5)
        cse_tmp_40 = cse_tmp_36 ^ (-4)
        cse_tmp_41 = cse_tmp_36 ^ (-3)
        cse_tmp_42 = cse_tmp_36 ^ (-2)
        cse_tmp_43 = cse_tmp_36 ^ (-1)
        cse_tmp_44 = cse_tmp_14 * (-cse_tmp_35 / 8 + t1)
        cse_tmp_45 = cse_tmp_44 > 10000.0
        cse_tmp_46 = my_piecewise3(cse_tmp_45, cse_tmp_44, 10000.0)
        cse_tmp_47 = my_piecewise3(cse_tmp_45, 10000.0, cse_tmp_44)
        cse_tmp_48 = cse_tmp_47 ^ 3
        cse_tmp_49 = my_piecewise3(cse_tmp_44 >= 10000.0, 3 / cse_tmp_46 ^ 2 + cse_tmp_46 ^ (-3), (3 * cse_tmp_47 ^ 4 - 3 * cse_tmp_47 ^ 2 + cse_tmp_48 + 2) / (cse_tmp_48 * (cse_tmp_48 + 1) + 1))
        cse_tmp_50 = cse_tmp_49 ^ 2
        cse_tmp_51 = cse_tmp_49 ^ 3
        cse_tmp_52 = cse_tmp_49 ^ 4
        cse_tmp_53 = cse_tmp_49 ^ 5
        cse_tmp_54 = cse_tmp_49 ^ 6
        cse_tmp_55 = cse_tmp_49 ^ 7
        cse_tmp_56 = my_piecewise5(cse_tmp_30, cse_tmp_28, cse_tmp_27, cse_tmp_31, -z) + 1
        my_piecewise3(cse_tmp_0 * cse_tmp_1 <= dens_threshold, 0, -cse_tmp_34 * (-6014.63546009337 * cse_tmp_10 * cse_tmp_20 - 105736.9340728 * cse_tmp_10 * cse_tmp_21 + 23385.1537745876 * cse_tmp_10 * cse_tmp_22 + 65.4963814603309 * cse_tmp_10 * cse_tmp_23 - 63.6833931170841 * cse_tmp_10 * cse_tmp_24 + 27.0188691623406 * cse_tmp_10 * cse_tmp_25 - 4.14042295266108 * cse_tmp_10 * cse_tmp_26 + 180698.854522262 * cse_tmp_10 - 11647.783912668 * cse_tmp_11 * cse_tmp_20 + 13439.9329431299 * cse_tmp_11 * cse_tmp_21 - 2297.10057823184 * cse_tmp_11 * cse_tmp_22 - 280.485873147029 * cse_tmp_11 * cse_tmp_23 + 42.3761785199431 * cse_tmp_11 * cse_tmp_24 - 1.43952295020144 * cse_tmp_11 * cse_tmp_25 + 0.221460629426218 * cse_tmp_11 * cse_tmp_26 - 3883.60859505901 * cse_tmp_11 + 868.231280330825 * cse_tmp_12 * cse_tmp_20 - 639.086819479948 * cse_tmp_12 * cse_tmp_21 + 7.04981826102367 * cse_tmp_12 * cse_tmp_22 + 62.4216941234754 * cse_tmp_12 * cse_tmp_23 - 8.37142214789718 * cse_tmp_12 * cse_tmp_24 + 0.0390794237390326 * cse_tmp_12 * cse_tmp_25 - 0.00607557134922189 * cse_tmp_12 * cse_tmp_26 - 177.179289113024 * cse_tmp_12 - 18.9081491471184 * cse_tmp_13 * cse_tmp_20 + 6.86768016492593 * cse_tmp_13 * cse_tmp_21 + 6.86640507799446 * cse_tmp_13 * cse_tmp_22 - 3.96228211576322 * cse_tmp_13 * cse_tmp_23 + 0.407546924409119 * cse_tmp_13 * cse_tmp_24 + 0.0321862425594917 * cse_tmp_13 * cse_tmp_25 - 0.00320870195558178 * cse_tmp_13 * cse_tmp_26 + 8.26390703802539 * cse_tmp_13 + 16038235.3265287 * cse_tmp_20 * cse_tmp_7 - 7944677.01639333 * cse_tmp_20 * cse_tmp_8 + 1169883.39702344 * cse_tmp_20 * cse_tmp_9 + 0.00598986601074835 * cse_tmp_20 - 517.790630321847 * cse_tmp_21 * cse_tmp_7 + 262.922783930482 * cse_tmp_21 * cse_tmp_8 + 281946.537768164 * cse_tmp_21 * cse_tmp_9 + 0.104441121690673 * cse_tmp_21 + 3016.21662242202 * cse_tmp_22 * cse_tmp_7 - 1528.49560233154 * cse_tmp_22 * cse_tmp_8 - 65872.917938707 * cse_tmp_22 * cse_tmp_9 - 0.170598516635322 * cse_tmp_22 - 6480.92979375802 * cse_tmp_23 * cse_tmp_7 + 3280.32266339966 * cse_tmp_23 * cse_tmp_8 - 654.929284739329 * cse_tmp_23 * cse_tmp_9 + 0.062790435453085 * cse_tmp_23 + 6276.53295140738 * cse_tmp_24 * cse_tmp_7 - 3175.38926851595 * cse_tmp_24 * cse_tmp_8 + 634.679684675106 * cse_tmp_24 * cse_tmp_9 - 0.00042170064208445 * cse_tmp_24 - 2652.82615467739 * cse_tmp_25 * cse_tmp_7 + 1341.29614287914 * cse_tmp_25 * cse_tmp_8 - 268.354193741339 * cse_tmp_25 * cse_tmp_9 - 0.00244757387121151 * cse_tmp_25 + 406.20191969291 * cse_tmp_26 * cse_tmp_7 - 205.236723889816 * cse_tmp_26 * cse_tmp_8 + 41.0665904409547 * cse_tmp_26 * cse_tmp_9 + 0.000232126545529808 * cse_tmp_26 - 22780873.4602969 * cse_tmp_7 + 11959113.3316332 * cse_tmp_8 - 2280068.70647506 * cse_tmp_9 + 1.14548960534284) * my_piecewise3(cse_tmp_32 <= zeta_threshold, cse_tmp_33, NaNMath.pow(cse_tmp_32, 1.3333333333333333))) + my_piecewise3(cse_tmp_1 * cse_tmp_29 <= dens_threshold, 0, -cse_tmp_34 * (16038235.3265287 * cse_tmp_37 * cse_tmp_49 - 517.790630321847 * cse_tmp_37 * cse_tmp_50 + 3016.21662242202 * cse_tmp_37 * cse_tmp_51 - 6480.92979375802 * cse_tmp_37 * cse_tmp_52 + 6276.53295140738 * cse_tmp_37 * cse_tmp_53 - 2652.82615467739 * cse_tmp_37 * cse_tmp_54 + 406.20191969291 * cse_tmp_37 * cse_tmp_55 - 22780873.4602969 * cse_tmp_37 - 7944677.01639333 * cse_tmp_38 * cse_tmp_49 + 262.922783930482 * cse_tmp_38 * cse_tmp_50 - 1528.49560233154 * cse_tmp_38 * cse_tmp_51 + 3280.32266339966 * cse_tmp_38 * cse_tmp_52 - 3175.38926851595 * cse_tmp_38 * cse_tmp_53 + 1341.29614287914 * cse_tmp_38 * cse_tmp_54 - 205.236723889816 * cse_tmp_38 * cse_tmp_55 + 11959113.3316332 * cse_tmp_38 + 1169883.39702344 * cse_tmp_39 * cse_tmp_49 + 281946.537768164 * cse_tmp_39 * cse_tmp_50 - 65872.917938707 * cse_tmp_39 * cse_tmp_51 - 654.929284739329 * cse_tmp_39 * cse_tmp_52 + 634.679684675106 * cse_tmp_39 * cse_tmp_53 - 268.354193741339 * cse_tmp_39 * cse_tmp_54 + 41.0665904409547 * cse_tmp_39 * cse_tmp_55 - 2280068.70647506 * cse_tmp_39 - 6014.63546009337 * cse_tmp_40 * cse_tmp_49 - 105736.9340728 * cse_tmp_40 * cse_tmp_50 + 23385.1537745876 * cse_tmp_40 * cse_tmp_51 + 65.4963814603309 * cse_tmp_40 * cse_tmp_52 - 63.6833931170841 * cse_tmp_40 * cse_tmp_53 + 27.0188691623406 * cse_tmp_40 * cse_tmp_54 - 4.14042295266108 * cse_tmp_40 * cse_tmp_55 + 180698.854522262 * cse_tmp_40 - 11647.783912668 * cse_tmp_41 * cse_tmp_49 + 13439.9329431299 * cse_tmp_41 * cse_tmp_50 - 2297.10057823184 * cse_tmp_41 * cse_tmp_51 - 280.485873147029 * cse_tmp_41 * cse_tmp_52 + 42.3761785199431 * cse_tmp_41 * cse_tmp_53 - 1.43952295020144 * cse_tmp_41 * cse_tmp_54 + 0.221460629426218 * cse_tmp_41 * cse_tmp_55 - 3883.60859505901 * cse_tmp_41 + 868.231280330825 * cse_tmp_42 * cse_tmp_49 - 639.086819479948 * cse_tmp_42 * cse_tmp_50 + 7.04981826102367 * cse_tmp_42 * cse_tmp_51 + 62.4216941234754 * cse_tmp_42 * cse_tmp_52 - 8.37142214789718 * cse_tmp_42 * cse_tmp_53 + 0.0390794237390326 * cse_tmp_42 * cse_tmp_54 - 0.00607557134922189 * cse_tmp_42 * cse_tmp_55 - 177.179289113024 * cse_tmp_42 - 18.9081491471184 * cse_tmp_43 * cse_tmp_49 + 6.86768016492593 * cse_tmp_43 * cse_tmp_50 + 6.86640507799446 * cse_tmp_43 * cse_tmp_51 - 3.96228211576322 * cse_tmp_43 * cse_tmp_52 + 0.407546924409119 * cse_tmp_43 * cse_tmp_53 + 0.0321862425594917 * cse_tmp_43 * cse_tmp_54 - 0.00320870195558178 * cse_tmp_43 * cse_tmp_55 + 8.26390703802539 * cse_tmp_43 + 0.00598986601074835 * cse_tmp_49 + 0.104441121690673 * cse_tmp_50 - 0.170598516635322 * cse_tmp_51 + 0.062790435453085 * cse_tmp_52 - 0.00042170064208445 * cse_tmp_53 - 0.00244757387121151 * cse_tmp_54 + 0.000232126545529808 * cse_tmp_55 + 1.14548960534284) * my_piecewise3(cse_tmp_56 <= zeta_threshold, cse_tmp_33, NaNMath.pow(cse_tmp_56, 1.3333333333333333)))
    end
end
export mgga_x_mbeef_energy

const mgga_x_mbeef_defaults = (dens_threshold = 1.0e-14, zeta_threshold = 2.220446049250313e-16)
const mgga_x_mbeef_required = ()

function mgga_x_mbeef(rho, sigma, lapl, tau; params = NamedTuple())
    p = resolve_params(mgga_x_mbeef_defaults, mgga_x_mbeef_required, params)
    v = mgga_variables(rho, sigma, lapl, tau, Val(3))
    return mgga_x_mbeef_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.dens_threshold, p.zeta_threshold)
end

function mgga_x_mbeef(na, nb, gaa, gab, gbb, la, lb, ta, tb; params = NamedTuple())
    p = resolve_params(mgga_x_mbeef_defaults, mgga_x_mbeef_required, params)
    v = mgga_variables(na, nb, gaa, gab, gbb, la, lb, ta, tb, Val(3))
    return mgga_x_mbeef_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.dens_threshold, p.zeta_threshold)
end

export mgga_x_mbeef, mgga_x_mbeef_defaults, mgga_x_mbeef_required
