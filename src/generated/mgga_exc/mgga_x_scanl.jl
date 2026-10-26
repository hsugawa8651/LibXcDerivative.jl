# Auto-generated from the Libxc sources
# python/mgga_exc/mgga_x_scanl.py -- do not edit by hand.
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
# args: rs, z, xt, xs0, xs1, u0, u1, t0, t1, XC_EPSILON, dens_threshold, params_a_c1, params_a_c2, params_a_d, params_a_k1, params_a_pc07_a, params_a_pc07_b, zeta_threshold
const mgga_x_scanl_energy = function (rs, z, xt, xs0, xs1, u0, u1, t0, t1, XC_EPSILON, dens_threshold, params_a_c1, params_a_c2, params_a_d, params_a_k1, params_a_pc07_a, params_a_pc07_b, zeta_threshold)
    @inbounds begin
        cse_tmp_0 = z + 1
        cse_tmp_1 = (3 // 8) / (pi * rs ^ 3)
        cse_tmp_2 = xs0 ^ 2
        cse_tmp_3 = 1.8171205928321397
        cse_tmp_4 = 0.2173369174628993
        cse_tmp_5 = cse_tmp_3 * cse_tmp_4
        cse_tmp_6 = cse_tmp_2 * cse_tmp_5
        cse_tmp_7 = (5 // 72) * cse_tmp_6
        cse_tmp_8 = 3.3019272488946267 / 21.170591578193033
        cse_tmp_9 = cse_tmp_8 / 5832
        cse_tmp_10 = xs0 ^ 4
        cse_tmp_11 = cse_tmp_8 / 17496
        cse_tmp_12 = cse_tmp_8 / 5184
        cse_tmp_13 = cse_tmp_10 * cse_tmp_11 - cse_tmp_12 * cse_tmp_2 * u0 + cse_tmp_9 * u0 ^ 2
        cse_tmp_14 = cse_tmp_13 ^ 2 / (cse_tmp_7 + 1) ^ 2
        cse_tmp_15 = NaNMath.sqrt(cse_tmp_14 + 1)
        cse_tmp_16 = (5 // 54) * cse_tmp_5
        cse_tmp_17 = cse_tmp_16 * u0 + 1
        cse_tmp_18 = cse_tmp_17 - 5 // 81 * cse_tmp_6
        cse_tmp_19 = (5 // 36) * cse_tmp_6
        cse_tmp_20 = (2 * cse_tmp_13 * cse_tmp_18 + cse_tmp_14 * (cse_tmp_19 + 1) + cse_tmp_18 ^ 2 + cse_tmp_19 * (cse_tmp_13 + cse_tmp_18)) / (cse_tmp_15 * (cse_tmp_13 + cse_tmp_15 * cse_tmp_7 + cse_tmp_17 + (5 // 648) * cse_tmp_6))
        cse_tmp_21 = params_a_pc07_a / 40
        cse_tmp_22 = (39 // 40) * params_a_pc07_a
        cse_tmp_23 = my_piecewise3(cse_tmp_21 > cse_tmp_20, cse_tmp_21, cse_tmp_20)
        cse_tmp_24 = my_piecewise3(cse_tmp_22 > cse_tmp_23, cse_tmp_23, cse_tmp_22)
        cse_tmp_25 = params_a_pc07_a / cse_tmp_24
        cse_tmp_26 = exp(-params_a_pc07_a / (-cse_tmp_24 + params_a_pc07_a))
        cse_tmp_27 = cse_tmp_20 * my_piecewise5(cse_tmp_20 <= cse_tmp_21, 0, cse_tmp_20 >= cse_tmp_22, 1, NaNMath.pow(cse_tmp_26 + 1, params_a_pc07_b) * NaNMath.pow(cse_tmp_26 + exp(-cse_tmp_25), -params_a_pc07_b) * exp(-cse_tmp_25 * params_a_pc07_b))
        cse_tmp_28 = NaNMath.log(XC_EPSILON)
        cse_tmp_29 = -cse_tmp_28 / (-cse_tmp_28 + params_a_c1)
        cse_tmp_30 = my_piecewise3(cse_tmp_29 > cse_tmp_27, cse_tmp_27, cse_tmp_29)
        cse_tmp_31 = NaNMath.log(XC_EPSILON / my_piecewise3(params_a_d >= 0, params_a_d, -params_a_d))
        cse_tmp_32 = -(-cse_tmp_31 + params_a_c2) / cse_tmp_31
        cse_tmp_33 = my_piecewise3(cse_tmp_27 <= 1, my_piecewise3(cse_tmp_27 > cse_tmp_29, 0, exp(-cse_tmp_30 * params_a_c1 / (1 - cse_tmp_30))), my_piecewise3(cse_tmp_27 < cse_tmp_32, 0, -params_a_d * exp(params_a_c2 / (1 - my_piecewise3(cse_tmp_32 > cse_tmp_27, cse_tmp_32, cse_tmp_27)))))
        cse_tmp_34 = 73 // 648 - 100 // 6561 / params_a_k1
        cse_tmp_35 = (27 // 80) * cse_tmp_34
        cse_tmp_36 = -cse_tmp_34 * cse_tmp_8 / 576
        cse_tmp_37 = (7 // 12960) * 1.7817974362806785 * 1.4422495703074083 * 8.54400374531753 * cse_tmp_4
        cse_tmp_38 = 1 - cse_tmp_27
        cse_tmp_39 = 12.083045973594572 / 100
        cse_tmp_40 = cse_tmp_10 * cse_tmp_36 * exp(cse_tmp_35 * cse_tmp_6) + (5 // 972) * cse_tmp_6 + (cse_tmp_2 * cse_tmp_37 + cse_tmp_38 * cse_tmp_39 * exp(-cse_tmp_38 ^ 2 / 2)) ^ 2
        cse_tmp_41 = cse_tmp_6 / 24
        cse_tmp_42 = NaNMath.pow(XC_EPSILON, 1.3333333333333333)
        cse_tmp_43 = 0.202105943935811 * NaNMath.pow(my_piecewise3(cse_tmp_41 > cse_tmp_42, cse_tmp_41, cse_tmp_42), 0.25)
        cse_tmp_44 = -1 / cse_tmp_28
        cse_tmp_45 = cse_tmp_0 <= zeta_threshold
        cse_tmp_46 = zeta_threshold - 1
        cse_tmp_47 = 1 - z
        cse_tmp_48 = cse_tmp_47 <= zeta_threshold
        cse_tmp_49 = -cse_tmp_46
        cse_tmp_50 = my_piecewise5(cse_tmp_45, cse_tmp_46, cse_tmp_48, cse_tmp_49, z) + 1
        cse_tmp_51 = NaNMath.pow(zeta_threshold, 1.3333333333333333)
        cse_tmp_52 = 0.184639691595506 * cse_tmp_3 / (1.4645918875615234 * rs)
        cse_tmp_53 = xs1 ^ 2
        cse_tmp_54 = cse_tmp_5 * cse_tmp_53
        cse_tmp_55 = (5 // 72) * cse_tmp_54
        cse_tmp_56 = xs1 ^ 4
        cse_tmp_57 = cse_tmp_11 * cse_tmp_56 - cse_tmp_12 * cse_tmp_53 * u1 + cse_tmp_9 * u1 ^ 2
        cse_tmp_58 = cse_tmp_57 ^ 2 / (cse_tmp_55 + 1) ^ 2
        cse_tmp_59 = NaNMath.sqrt(cse_tmp_58 + 1)
        cse_tmp_60 = cse_tmp_16 * u1 + 1
        cse_tmp_61 = -5 // 81 * cse_tmp_54 + cse_tmp_60
        cse_tmp_62 = (5 // 36) * cse_tmp_54
        cse_tmp_63 = (2 * cse_tmp_57 * cse_tmp_61 + cse_tmp_58 * (cse_tmp_62 + 1) + cse_tmp_61 ^ 2 + cse_tmp_62 * (cse_tmp_57 + cse_tmp_61)) / (cse_tmp_59 * ((5 // 648) * cse_tmp_54 + cse_tmp_55 * cse_tmp_59 + cse_tmp_57 + cse_tmp_60))
        cse_tmp_64 = my_piecewise3(cse_tmp_21 > cse_tmp_63, cse_tmp_21, cse_tmp_63)
        cse_tmp_65 = my_piecewise3(cse_tmp_22 > cse_tmp_64, cse_tmp_64, cse_tmp_22)
        cse_tmp_66 = params_a_pc07_a / cse_tmp_65
        cse_tmp_67 = exp(-params_a_pc07_a / (-cse_tmp_65 + params_a_pc07_a))
        cse_tmp_68 = cse_tmp_63 * my_piecewise5(cse_tmp_63 <= cse_tmp_21, 0, cse_tmp_63 >= cse_tmp_22, 1, NaNMath.pow(cse_tmp_67 + 1, params_a_pc07_b) * NaNMath.pow(cse_tmp_67 + exp(-cse_tmp_66), -params_a_pc07_b) * exp(-cse_tmp_66 * params_a_pc07_b))
        cse_tmp_69 = my_piecewise3(cse_tmp_29 > cse_tmp_68, cse_tmp_68, cse_tmp_29)
        cse_tmp_70 = my_piecewise3(cse_tmp_68 <= 1, my_piecewise3(cse_tmp_68 > cse_tmp_29, 0, exp(-cse_tmp_69 * params_a_c1 / (1 - cse_tmp_69))), my_piecewise3(cse_tmp_68 < cse_tmp_32, 0, -params_a_d * exp(params_a_c2 / (1 - my_piecewise3(cse_tmp_32 > cse_tmp_68, cse_tmp_32, cse_tmp_68)))))
        cse_tmp_71 = 1 - cse_tmp_68
        cse_tmp_72 = cse_tmp_36 * cse_tmp_56 * exp(cse_tmp_35 * cse_tmp_54) + (5 // 972) * cse_tmp_54 + (cse_tmp_37 * cse_tmp_53 + cse_tmp_39 * cse_tmp_71 * exp(-cse_tmp_71 ^ 2 / 2)) ^ 2
        cse_tmp_73 = cse_tmp_54 / 24
        cse_tmp_74 = 0.202105943935811 * NaNMath.pow(my_piecewise3(cse_tmp_73 > cse_tmp_42, cse_tmp_73, cse_tmp_42), 0.25)
        cse_tmp_75 = my_piecewise5(cse_tmp_48, cse_tmp_46, cse_tmp_45, cse_tmp_49, -z) + 1
        my_piecewise3(cse_tmp_0 * cse_tmp_1 <= dens_threshold, 0, -cse_tmp_52 * (1.174 * cse_tmp_33 + (1 - cse_tmp_33) * (cse_tmp_40 * params_a_k1 / (cse_tmp_40 + params_a_k1) + 1)) * my_piecewise3(cse_tmp_43 <= cse_tmp_44, 1, -xc_expm1(-1 / my_piecewise3(cse_tmp_44 > cse_tmp_43, cse_tmp_44, cse_tmp_43))) * my_piecewise3(cse_tmp_50 <= zeta_threshold, cse_tmp_51, NaNMath.pow(cse_tmp_50, 1.3333333333333333))) + my_piecewise3(cse_tmp_1 * cse_tmp_47 <= dens_threshold, 0, -cse_tmp_52 * (1.174 * cse_tmp_70 + (1 - cse_tmp_70) * (cse_tmp_72 * params_a_k1 / (cse_tmp_72 + params_a_k1) + 1)) * my_piecewise3(cse_tmp_74 <= cse_tmp_44, 1, -xc_expm1(-1 / my_piecewise3(cse_tmp_44 > cse_tmp_74, cse_tmp_44, cse_tmp_74))) * my_piecewise3(cse_tmp_75 <= zeta_threshold, cse_tmp_51, NaNMath.pow(cse_tmp_75, 1.3333333333333333)))
    end
end
export mgga_x_scanl_energy

const mgga_x_scanl_defaults = (XC_EPSILON = 2.220446049250313e-16, dens_threshold = 1.0e-15, params_a_c1 = 0.667, params_a_c2 = 0.8, params_a_d = 1.24, params_a_k1 = 0.065, params_a_pc07_a = 1.78472, params_a_pc07_b = 0.258304, zeta_threshold = 2.220446049250313e-16)
const mgga_x_scanl_required = ()

function mgga_x_scanl(rho, sigma, lapl, tau; params = NamedTuple())
    p = resolve_params(mgga_x_scanl_defaults, mgga_x_scanl_required, params)
    v = mgga_variables(rho, sigma, lapl, tau, Val(3))
    return mgga_x_scanl_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.XC_EPSILON, p.dens_threshold, p.params_a_c1, p.params_a_c2, p.params_a_d, p.params_a_k1, p.params_a_pc07_a, p.params_a_pc07_b, p.zeta_threshold)
end

function mgga_x_scanl(na, nb, gaa, gab, gbb, la, lb, ta, tb; params = NamedTuple())
    p = resolve_params(mgga_x_scanl_defaults, mgga_x_scanl_required, params)
    v = mgga_variables(na, nb, gaa, gab, gbb, la, lb, ta, tb, Val(3))
    return mgga_x_scanl_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.XC_EPSILON, p.dens_threshold, p.params_a_c1, p.params_a_c2, p.params_a_d, p.params_a_k1, p.params_a_pc07_a, p.params_a_pc07_b, p.zeta_threshold)
end

export mgga_x_scanl, mgga_x_scanl_defaults, mgga_x_scanl_required

const mgga_x_revscanl_defaults = (XC_EPSILON = 2.220446049250313e-16, dens_threshold = 1.0e-15, params_a_c1 = 0.607, params_a_c2 = 0.7, params_a_d = 1.37, params_a_k1 = 0.065, params_a_pc07_a = 1.78472, params_a_pc07_b = 0.258304, zeta_threshold = 2.220446049250313e-16)
const mgga_x_revscanl_required = ()

function mgga_x_revscanl(rho, sigma, lapl, tau; params = NamedTuple())
    p = resolve_params(mgga_x_revscanl_defaults, mgga_x_revscanl_required, params)
    v = mgga_variables(rho, sigma, lapl, tau, Val(3))
    return mgga_x_scanl_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.XC_EPSILON, p.dens_threshold, p.params_a_c1, p.params_a_c2, p.params_a_d, p.params_a_k1, p.params_a_pc07_a, p.params_a_pc07_b, p.zeta_threshold)
end

function mgga_x_revscanl(na, nb, gaa, gab, gbb, la, lb, ta, tb; params = NamedTuple())
    p = resolve_params(mgga_x_revscanl_defaults, mgga_x_revscanl_required, params)
    v = mgga_variables(na, nb, gaa, gab, gbb, la, lb, ta, tb, Val(3))
    return mgga_x_scanl_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.XC_EPSILON, p.dens_threshold, p.params_a_c1, p.params_a_c2, p.params_a_d, p.params_a_k1, p.params_a_pc07_a, p.params_a_pc07_b, p.zeta_threshold)
end

export mgga_x_revscanl, mgga_x_revscanl_defaults, mgga_x_revscanl_required
