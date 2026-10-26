# Auto-generated from the Libxc sources
# python/mgga_exc/mgga_x_rscan.py -- do not edit by hand.
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
# args: rs, z, xt, xs0, xs1, u0, u1, t0, t1, XC_EPSILON, dens_threshold, params_a_alphar, params_a_c2, params_a_d, params_a_k1, params_a_taur, zeta_threshold
const mgga_x_rscan_energy = function (rs, z, xt, xs0, xs1, u0, u1, t0, t1, XC_EPSILON, dens_threshold, params_a_alphar, params_a_c2, params_a_d, params_a_k1, params_a_taur, zeta_threshold)
    @inbounds begin
        cse_tmp_0 = z + 1
        cse_tmp_1 = (3 // 8) / (pi * rs ^ 3)
        cse_tmp_2 = cse_tmp_0 <= zeta_threshold
        cse_tmp_3 = zeta_threshold - 1
        cse_tmp_4 = 1 - z
        cse_tmp_5 = cse_tmp_4 <= zeta_threshold
        cse_tmp_6 = -cse_tmp_3
        cse_tmp_7 = my_piecewise5(cse_tmp_2, cse_tmp_3, cse_tmp_5, cse_tmp_6, z) + 1
        cse_tmp_8 = params_a_taur / 2
        cse_tmp_9 = 0.6827840632552957
        cse_tmp_10 = (27 // 320) * 2.2894284851066637 * cse_tmp_9 / rs ^ 5
        cse_tmp_11 = cse_tmp_10 * NaNMath.pow(cse_tmp_7, 1.6666666666666667) + cse_tmp_8
        cse_tmp_12 = xs0 ^ 2
        cse_tmp_13 = -cse_tmp_12 / 8 + t0
        cse_tmp_14 = my_piecewise3(cse_tmp_13 > 0, cse_tmp_13, 0)
        cse_tmp_15 = 1.4422495703074083
        cse_tmp_16 = (27 // 1024) * cse_tmp_15 / (45.41154128945516 * rs ^ 10)
        cse_tmp_17 = (243 // 32768) / (306.01968478528147 * rs ^ 15)
        cse_tmp_18 = cse_tmp_14 ^ 3 * cse_tmp_17 * cse_tmp_7 ^ 5 / (cse_tmp_11 ^ 3 * (params_a_alphar + cse_tmp_14 ^ 2 * cse_tmp_16 * NaNMath.pow(cse_tmp_7, 3.3333333333333335) / cse_tmp_11 ^ 2))
        cse_tmp_19 = cse_tmp_18 > 2.5
        cse_tmp_20 = my_piecewise3(cse_tmp_19, 2.5, cse_tmp_18)
        cse_tmp_21 = my_piecewise3(cse_tmp_18 <= 2.5, -0.023185843322 * cse_tmp_20 ^ 7 + 0.234528941479 * cse_tmp_20 ^ 6 - 0.887998041597 * cse_tmp_20 ^ 5 + 1.45129704449 * cse_tmp_20 ^ 4 - 0.663086601049 * cse_tmp_20 ^ 3 - 0.4445555 * cse_tmp_20 ^ 2 - 0.667 * cse_tmp_20 + 1, -params_a_d * exp(params_a_c2 / (1 - my_piecewise3(cse_tmp_19, cse_tmp_18, 2.5))))
        cse_tmp_22 = 1.8171205928321397
        cse_tmp_23 = 0.2173369174628993
        cse_tmp_24 = cse_tmp_22 * cse_tmp_23
        cse_tmp_25 = cse_tmp_12 * cse_tmp_24
        cse_tmp_26 = 73 // 648 - 100 // 6561 / params_a_k1
        cse_tmp_27 = (27 // 80) * cse_tmp_26
        cse_tmp_28 = -3.3019272488946267 * cse_tmp_26 / (576 * 21.170591578193033)
        cse_tmp_29 = (7 // 12960) * 1.7817974362806785 * 8.54400374531753 * cse_tmp_15 * cse_tmp_23
        cse_tmp_30 = 1 - cse_tmp_18
        cse_tmp_31 = 12.083045973594572 / 100
        cse_tmp_32 = (5 // 972) * cse_tmp_25 + cse_tmp_28 * xs0 ^ 4 * exp(cse_tmp_25 * cse_tmp_27) + (cse_tmp_12 * cse_tmp_29 + cse_tmp_30 * cse_tmp_31 * exp(-cse_tmp_30 ^ 2 / 2)) ^ 2
        cse_tmp_33 = cse_tmp_25 / 24
        cse_tmp_34 = NaNMath.pow(XC_EPSILON, 1.3333333333333333)
        cse_tmp_35 = 0.202105943935811 * NaNMath.pow(my_piecewise3(cse_tmp_33 > cse_tmp_34, cse_tmp_33, cse_tmp_34), 0.25)
        cse_tmp_36 = -1 / NaNMath.log(XC_EPSILON)
        cse_tmp_37 = NaNMath.pow(zeta_threshold, 1.3333333333333333)
        cse_tmp_38 = 0.184639691595506 * cse_tmp_22 * cse_tmp_9 / rs
        cse_tmp_39 = my_piecewise5(cse_tmp_5, cse_tmp_3, cse_tmp_2, cse_tmp_6, -z) + 1
        cse_tmp_40 = cse_tmp_10 * NaNMath.pow(cse_tmp_39, 1.6666666666666667) + cse_tmp_8
        cse_tmp_41 = xs1 ^ 2
        cse_tmp_42 = -cse_tmp_41 / 8 + t1
        cse_tmp_43 = my_piecewise3(cse_tmp_42 > 0, cse_tmp_42, 0)
        cse_tmp_44 = cse_tmp_17 * cse_tmp_39 ^ 5 * cse_tmp_43 ^ 3 / (cse_tmp_40 ^ 3 * (cse_tmp_16 * NaNMath.pow(cse_tmp_39, 3.3333333333333335) * cse_tmp_43 ^ 2 / cse_tmp_40 ^ 2 + params_a_alphar))
        cse_tmp_45 = cse_tmp_44 > 2.5
        cse_tmp_46 = my_piecewise3(cse_tmp_45, 2.5, cse_tmp_44)
        cse_tmp_47 = my_piecewise3(cse_tmp_44 <= 2.5, -0.023185843322 * cse_tmp_46 ^ 7 + 0.234528941479 * cse_tmp_46 ^ 6 - 0.887998041597 * cse_tmp_46 ^ 5 + 1.45129704449 * cse_tmp_46 ^ 4 - 0.663086601049 * cse_tmp_46 ^ 3 - 0.4445555 * cse_tmp_46 ^ 2 - 0.667 * cse_tmp_46 + 1, -params_a_d * exp(params_a_c2 / (1 - my_piecewise3(cse_tmp_45, cse_tmp_44, 2.5))))
        cse_tmp_48 = cse_tmp_24 * cse_tmp_41
        cse_tmp_49 = 1 - cse_tmp_44
        cse_tmp_50 = cse_tmp_28 * xs1 ^ 4 * exp(cse_tmp_27 * cse_tmp_48) + (5 // 972) * cse_tmp_48 + (cse_tmp_29 * cse_tmp_41 + cse_tmp_31 * cse_tmp_49 * exp(-cse_tmp_49 ^ 2 / 2)) ^ 2
        cse_tmp_51 = cse_tmp_48 / 24
        cse_tmp_52 = 0.202105943935811 * NaNMath.pow(my_piecewise3(cse_tmp_51 > cse_tmp_34, cse_tmp_51, cse_tmp_34), 0.25)
        my_piecewise3(cse_tmp_0 * cse_tmp_1 <= dens_threshold, 0, -cse_tmp_38 * (1.174 * cse_tmp_21 + (1 - cse_tmp_21) * (cse_tmp_32 * params_a_k1 / (cse_tmp_32 + params_a_k1) + 1)) * my_piecewise3(cse_tmp_35 <= cse_tmp_36, 1, -xc_expm1(-1 / my_piecewise3(cse_tmp_36 > cse_tmp_35, cse_tmp_36, cse_tmp_35))) * my_piecewise3(cse_tmp_7 <= zeta_threshold, cse_tmp_37, NaNMath.pow(cse_tmp_7, 1.3333333333333333))) + my_piecewise3(cse_tmp_1 * cse_tmp_4 <= dens_threshold, 0, -cse_tmp_38 * (1.174 * cse_tmp_47 + (1 - cse_tmp_47) * (cse_tmp_50 * params_a_k1 / (cse_tmp_50 + params_a_k1) + 1)) * my_piecewise3(cse_tmp_39 <= zeta_threshold, cse_tmp_37, NaNMath.pow(cse_tmp_39, 1.3333333333333333)) * my_piecewise3(cse_tmp_52 <= cse_tmp_36, 1, -xc_expm1(-1 / my_piecewise3(cse_tmp_36 > cse_tmp_52, cse_tmp_36, cse_tmp_52))))
    end
end
export mgga_x_rscan_energy

const mgga_x_rscan_defaults = (XC_EPSILON = 2.220446049250313e-16, dens_threshold = 1.0e-11, params_a_alphar = 0.001, params_a_c2 = 0.8, params_a_d = 1.24, params_a_k1 = 0.065, params_a_taur = 0.0001, zeta_threshold = 2.220446049250313e-16)
const mgga_x_rscan_required = ()

function mgga_x_rscan(rho, sigma, lapl, tau; params = NamedTuple())
    p = resolve_params(mgga_x_rscan_defaults, mgga_x_rscan_required, params)
    v = mgga_variables(rho, sigma, lapl, tau, Val(3))
    return mgga_x_rscan_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.XC_EPSILON, p.dens_threshold, p.params_a_alphar, p.params_a_c2, p.params_a_d, p.params_a_k1, p.params_a_taur, p.zeta_threshold)
end

function mgga_x_rscan(na, nb, gaa, gab, gbb, la, lb, ta, tb; params = NamedTuple())
    p = resolve_params(mgga_x_rscan_defaults, mgga_x_rscan_required, params)
    v = mgga_variables(na, nb, gaa, gab, gbb, la, lb, ta, tb, Val(3))
    return mgga_x_rscan_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.XC_EPSILON, p.dens_threshold, p.params_a_alphar, p.params_a_c2, p.params_a_d, p.params_a_k1, p.params_a_taur, p.zeta_threshold)
end

export mgga_x_rscan, mgga_x_rscan_defaults, mgga_x_rscan_required
