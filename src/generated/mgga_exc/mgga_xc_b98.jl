# Auto-generated from the Libxc sources
# python/mgga_exc/mgga_xc_b98.py -- do not edit by hand.
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
# args: rs, z, xt, xs0, xs1, u0, u1, t0, t1, dens_threshold, zeta_threshold
const mgga_xc_b98_energy = function (rs, z, xt, xs0, xs1, u0, u1, t0, t1, dens_threshold, zeta_threshold)
    @inbounds begin
        cse_tmp_0 = xs0 ^ 2
        cse_tmp_1 = 3.3019272488946267
        cse_tmp_2 = 4.60115111447049
        cse_tmp_3 = (3 // 10) * cse_tmp_1 * cse_tmp_2
        cse_tmp_4 = cse_tmp_0 / 8 + cse_tmp_3 - t0 + u0 / 4
        cse_tmp_5 = 1.8171205928321397
        cse_tmp_6 = cse_tmp_5 / cse_tmp_2
        cse_tmp_7 = 0.0611111111111111 * cse_tmp_6
        cse_tmp_8 = cse_tmp_4 * cse_tmp_7
        cse_tmp_9 = cse_tmp_8 >= 0
        cse_tmp_10 = cse_tmp_4 ^ 2
        cse_tmp_11 = cse_tmp_1 / 21.170591578193033
        cse_tmp_12 = 0.00373456790123457 * cse_tmp_11
        cse_tmp_13 = cse_tmp_10 * cse_tmp_12 + 1
        cse_tmp_14 = my_piecewise3(my_piecewise3(cse_tmp_9, cse_tmp_8, -cse_tmp_8) < 1, cse_tmp_8 / NaNMath.sqrt(cse_tmp_13), NaNMath.sqrt(1 - 1 / cse_tmp_13) * my_piecewise3(cse_tmp_9, 1, -1))
        cse_tmp_15 = z + 1
        cse_tmp_17 = NaNMath.pow(zeta_threshold, 1.3333333333333333)
        cse_tmp_18 = 0.184639691595506 * cse_tmp_5 / (1.4645918875615234 * rs)
        cse_tmp_19 = xs1 ^ 2
        cse_tmp_20 = cse_tmp_19 / 8 + cse_tmp_3 - t1 + u1 / 4
        cse_tmp_21 = cse_tmp_20 * cse_tmp_7
        cse_tmp_22 = cse_tmp_21 >= 0
        cse_tmp_23 = cse_tmp_20 ^ 2
        cse_tmp_24 = cse_tmp_12 * cse_tmp_23 + 1
        cse_tmp_25 = my_piecewise3(my_piecewise3(cse_tmp_22, cse_tmp_21, -cse_tmp_21) < 1, cse_tmp_21 / NaNMath.sqrt(cse_tmp_24), NaNMath.sqrt(1 - 1 / cse_tmp_24) * my_piecewise3(cse_tmp_22, 1, -1))
        cse_tmp_26 = 1 - z
        cse_tmp_28 = 0.888888888888889 * cse_tmp_6
        cse_tmp_29 = cse_tmp_28 * cse_tmp_4
        cse_tmp_30 = cse_tmp_29 >= 0
        cse_tmp_31 = 0.790123456790124 * cse_tmp_11
        cse_tmp_32 = cse_tmp_10 * cse_tmp_31 + 1
        cse_tmp_33 = my_piecewise3(my_piecewise3(cse_tmp_30, cse_tmp_29, -cse_tmp_29) < 1, cse_tmp_29 / NaNMath.sqrt(cse_tmp_32), NaNMath.sqrt(1 - 1 / cse_tmp_32) * my_piecewise3(cse_tmp_30, 1, -1))
        cse_tmp_34 = (3 // 8) / (pi * rs ^ 3)
        cse_tmp_35 = zeta_threshold - 1
        cse_tmp_36 = xc_log1p(my_piecewise3(z > cse_tmp_35, z, cse_tmp_35))
        cse_tmp_37 = 0.0132882934 * rs
        cse_tmp_38 = 1.2599210498948732
        cse_tmp_39 = -1 + NaNMath.pow(zeta_threshold, -0.3333333333333333)
        cse_tmp_40 = my_piecewise3(cse_tmp_15 <= zeta_threshold, cse_tmp_39, xc_expm1(-cse_tmp_36 / 3)) + 1
        cse_tmp_41 = cse_tmp_38 * cse_tmp_40
        cse_tmp_42 = 0.2230841432 * rs
        cse_tmp_43 = NaNMath.sqrt(rs)
        cse_tmp_44 = 0.4723158174 * cse_tmp_43
        cse_tmp_45 = 1.122462048309373
        cse_tmp_46 = NaNMath.sqrt(cse_tmp_40) * cse_tmp_45
        cse_tmp_47 = NaNMath.pow(rs, 1.5)
        cse_tmp_48 = 0.1018665524 * cse_tmp_47
        cse_tmp_49 = 1.4142135623730951
        cse_tmp_50 = NaNMath.pow(cse_tmp_40, 1.5) * cse_tmp_49
        cse_tmp_51 = rs ^ 2
        cse_tmp_52 = 0.03065199508 * cse_tmp_51
        cse_tmp_53 = 1.5874010519681994
        cse_tmp_54 = cse_tmp_40 ^ 2 * cse_tmp_53
        cse_tmp_55 = (-cse_tmp_37 * cse_tmp_41 - 0.062182) * xc_log1p((cse_tmp_41 * cse_tmp_42 + cse_tmp_44 * cse_tmp_46 + cse_tmp_48 * cse_tmp_50 + cse_tmp_52 * cse_tmp_54) ^ (-1))
        cse_tmp_56 = 0.0037573575 * rs
        cse_tmp_57 = 0.1223665794 * rs
        cse_tmp_58 = 0.349797318 * cse_tmp_43
        cse_tmp_59 = 0.02972990124 * cse_tmp_47
        cse_tmp_60 = 0.01677588354 * cse_tmp_51
        cse_tmp_61 = 0.58482233974552 * (-cse_tmp_41 * cse_tmp_56 - 0.033774) * xc_log1p((cse_tmp_41 * cse_tmp_57 + cse_tmp_46 * cse_tmp_58 + cse_tmp_50 * cse_tmp_59 + cse_tmp_54 * cse_tmp_60) ^ (-1))
        cse_tmp_62 = (2 * cse_tmp_38 - 2) ^ (-1)
        cse_tmp_63 = cse_tmp_17 - 1
        cse_tmp_64 = cse_tmp_62 * (cse_tmp_63 + my_piecewise3(2 <= zeta_threshold, cse_tmp_63, xc_expm1((4 // 3) * xc_log1p(my_piecewise3(1 > cse_tmp_35, 1, cse_tmp_35)))))
        cse_tmp_65 = 0.0063883732 * rs
        cse_tmp_66 = 0.192686493 * rs
        cse_tmp_67 = 0.438956601 * cse_tmp_43
        cse_tmp_68 = 0.104655158 * cse_tmp_47
        cse_tmp_69 = 0.0194365353 * cse_tmp_51
        cse_tmp_70 = my_piecewise3(cse_tmp_15 <= zeta_threshold || cse_tmp_15 * cse_tmp_34 <= dens_threshold, 0, (my_piecewise3(cse_tmp_15 <= zeta_threshold, cse_tmp_35, xc_expm1(cse_tmp_36)) / 2 + 1 // 2) * (cse_tmp_55 - cse_tmp_61 * cse_tmp_64 + cse_tmp_64 * (-cse_tmp_55 + cse_tmp_61 + (-cse_tmp_41 * cse_tmp_65 - 0.03109) * xc_log1p((cse_tmp_41 * cse_tmp_66 + cse_tmp_46 * cse_tmp_67 + cse_tmp_50 * cse_tmp_68 + cse_tmp_54 * cse_tmp_69) ^ (-1)))))
        cse_tmp_71 = cse_tmp_20 * cse_tmp_28
        cse_tmp_72 = cse_tmp_71 >= 0
        cse_tmp_73 = cse_tmp_23 * cse_tmp_31 + 1
        cse_tmp_74 = my_piecewise3(my_piecewise3(cse_tmp_72, cse_tmp_71, -cse_tmp_71) < 1, cse_tmp_71 / NaNMath.sqrt(cse_tmp_73), NaNMath.sqrt(1 - 1 / cse_tmp_73) * my_piecewise3(cse_tmp_72, 1, -1))
        cse_tmp_75 = -z
        cse_tmp_76 = xc_log1p(my_piecewise3(cse_tmp_75 > cse_tmp_35, cse_tmp_75, cse_tmp_35))
        cse_tmp_77 = my_piecewise3(cse_tmp_26 <= zeta_threshold, cse_tmp_39, xc_expm1(-cse_tmp_76 / 3)) + 1
        cse_tmp_78 = cse_tmp_38 * cse_tmp_77
        cse_tmp_79 = cse_tmp_45 * NaNMath.sqrt(cse_tmp_77)
        cse_tmp_80 = cse_tmp_49 * NaNMath.pow(cse_tmp_77, 1.5)
        cse_tmp_81 = cse_tmp_53 * cse_tmp_77 ^ 2
        cse_tmp_82 = (-cse_tmp_37 * cse_tmp_78 - 0.062182) * xc_log1p((cse_tmp_42 * cse_tmp_78 + cse_tmp_44 * cse_tmp_79 + cse_tmp_48 * cse_tmp_80 + cse_tmp_52 * cse_tmp_81) ^ (-1))
        cse_tmp_83 = 0.58482233974552 * (-cse_tmp_56 * cse_tmp_78 - 0.033774) * xc_log1p((cse_tmp_57 * cse_tmp_78 + cse_tmp_58 * cse_tmp_79 + cse_tmp_59 * cse_tmp_80 + cse_tmp_60 * cse_tmp_81) ^ (-1))
        cse_tmp_84 = my_piecewise3(cse_tmp_26 <= zeta_threshold || cse_tmp_26 * cse_tmp_34 <= dens_threshold, 0, (my_piecewise3(cse_tmp_26 <= zeta_threshold, cse_tmp_35, xc_expm1(cse_tmp_76)) / 2 + 1 // 2) * (-cse_tmp_64 * cse_tmp_83 + cse_tmp_64 * (-cse_tmp_82 + cse_tmp_83 + (-cse_tmp_65 * cse_tmp_78 - 0.03109) * xc_log1p((cse_tmp_66 * cse_tmp_78 + cse_tmp_67 * cse_tmp_79 + cse_tmp_68 * cse_tmp_80 + cse_tmp_69 * cse_tmp_81) ^ (-1))) + cse_tmp_82))
        cse_tmp_85 = 0.0388888888888889 * cse_tmp_6
        cse_tmp_86 = cse_tmp_20 * cse_tmp_85 + cse_tmp_4 * cse_tmp_85
        cse_tmp_87 = cse_tmp_86 >= 0
        cse_tmp_88 = cse_tmp_86 ^ 2 + 1
        cse_tmp_89 = my_piecewise3(my_piecewise3(cse_tmp_87, cse_tmp_86, -cse_tmp_86) < 1, cse_tmp_86 / NaNMath.sqrt(cse_tmp_88), NaNMath.sqrt(1 - 1 / cse_tmp_88) * my_piecewise3(cse_tmp_87, 1, -1))
        cse_tmp_90 = -(-cse_tmp_37 - 0.062182) * xc_log1p((cse_tmp_42 + cse_tmp_44 + cse_tmp_48 + cse_tmp_52) ^ (-1))
        cse_tmp_91 = 0.58482233974552 * (-cse_tmp_56 - 0.033774) * xc_log1p((cse_tmp_57 + cse_tmp_58 + cse_tmp_59 + cse_tmp_60) ^ (-1))
        cse_tmp_92 = my_piecewise3(cse_tmp_15 <= zeta_threshold, cse_tmp_63, xc_expm1((4 // 3) * cse_tmp_36)) + my_piecewise3(cse_tmp_26 <= zeta_threshold, cse_tmp_63, xc_expm1((4 // 3) * cse_tmp_76))
        -cse_tmp_18 * (0.142 * cse_tmp_14 ^ 2 + 0.6682 * cse_tmp_14 + 0.8085) * my_piecewise3(cse_tmp_15 <= zeta_threshold, cse_tmp_17, NaNMath.pow(cse_tmp_15, 1.3333333333333333)) - cse_tmp_18 * (0.142 * cse_tmp_25 ^ 2 + 0.6682 * cse_tmp_25 + 0.8085) * my_piecewise3(cse_tmp_26 <= zeta_threshold, cse_tmp_17, NaNMath.pow(cse_tmp_26, 1.3333333333333333)) + cse_tmp_70 * (-cse_tmp_0 + 8 * t0) * (0.9023 * cse_tmp_33 ^ 2 - 0.9608 * cse_tmp_33 + 0.2606) / (8 * t0) + cse_tmp_84 * (-cse_tmp_19 + 8 * t1) * (0.9023 * cse_tmp_74 ^ 2 - 0.9608 * cse_tmp_74 + 0.2606) / (8 * t1) + (0.9596 * cse_tmp_89 ^ 2 - 2.2717 * cse_tmp_89 + 1.2033) * (-cse_tmp_62 * cse_tmp_91 * cse_tmp_92 + cse_tmp_62 * cse_tmp_92 * z ^ 4 * (cse_tmp_90 + cse_tmp_91 + (-cse_tmp_65 - 0.03109) * xc_log1p((cse_tmp_66 + cse_tmp_67 + cse_tmp_68 + cse_tmp_69) ^ (-1))) - cse_tmp_70 - cse_tmp_84 - cse_tmp_90)
    end
end
export mgga_xc_b98_energy

const mgga_xc_b98_defaults = NamedTuple()
const mgga_xc_b98_required = (:dens_threshold, :zeta_threshold)

function mgga_xc_b98(rho, sigma, lapl, tau; params = NamedTuple())
    p = resolve_params(mgga_xc_b98_defaults, mgga_xc_b98_required, params)
    v = mgga_variables(rho, sigma, lapl, tau, Val(3))
    return mgga_xc_b98_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.dens_threshold, p.zeta_threshold)
end

function mgga_xc_b98(na, nb, gaa, gab, gbb, la, lb, ta, tb; params = NamedTuple())
    p = resolve_params(mgga_xc_b98_defaults, mgga_xc_b98_required, params)
    v = mgga_variables(na, nb, gaa, gab, gbb, la, lb, ta, tb, Val(3))
    return mgga_xc_b98_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.dens_threshold, p.zeta_threshold)
end

export mgga_xc_b98, mgga_xc_b98_defaults, mgga_xc_b98_required

const hyb_mgga_xc_b98_defaults = (dens_threshold = 1.0e-15, zeta_threshold = 2.220446049250313e-16)
const hyb_mgga_xc_b98_required = ()

function hyb_mgga_xc_b98(rho, sigma, lapl, tau; params = NamedTuple())
    p = resolve_params(hyb_mgga_xc_b98_defaults, hyb_mgga_xc_b98_required, params)
    v = mgga_variables(rho, sigma, lapl, tau, Val(3))
    return mgga_xc_b98_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.dens_threshold, p.zeta_threshold)
end

function hyb_mgga_xc_b98(na, nb, gaa, gab, gbb, la, lb, ta, tb; params = NamedTuple())
    p = resolve_params(hyb_mgga_xc_b98_defaults, hyb_mgga_xc_b98_required, params)
    v = mgga_variables(na, nb, gaa, gab, gbb, la, lb, ta, tb, Val(3))
    return mgga_xc_b98_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.dens_threshold, p.zeta_threshold)
end

export hyb_mgga_xc_b98, hyb_mgga_xc_b98_defaults, hyb_mgga_xc_b98_required
