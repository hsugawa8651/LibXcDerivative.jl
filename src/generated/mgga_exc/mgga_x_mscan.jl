# Auto-generated from the Libxc sources
# python/mgga_exc/mgga_x_mscan.py -- do not edit by hand.
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
# args: rs, z, xt, xs0, xs1, u0, u1, t0, t1, XC_EPSILON, dens_threshold, params_a_c1, params_a_c2, params_a_d, params_a_k1, zeta_threshold
const mgga_x_mscan_energy = function (rs, z, xt, xs0, xs1, u0, u1, t0, t1, XC_EPSILON, dens_threshold, params_a_c1, params_a_c2, params_a_d, params_a_k1, zeta_threshold)
    @inbounds begin
        cse_tmp_0 = 0.2173369174628993
        cse_tmp_1 = xt ^ 2
        cse_tmp_2 = cse_tmp_0 * cse_tmp_1
        cse_tmp_3 = 1.4422495703074083 * cse_tmp_2
        cse_tmp_4 = cse_tmp_3 / 12
        cse_tmp_5 = NaNMath.pow(XC_EPSILON, 1.3333333333333333)
        cse_tmp_6 = 0.202105943935811 * NaNMath.pow(my_piecewise3(cse_tmp_4 > cse_tmp_5, cse_tmp_4, cse_tmp_5), 0.25)
        cse_tmp_7 = NaNMath.log(XC_EPSILON)
        cse_tmp_8 = -1 / cse_tmp_7
        cse_tmp_9 = z + 1
        cse_tmp_10 = (3 // 8) / (pi * rs ^ 3)
        cse_tmp_11 = cse_tmp_9 <= zeta_threshold
        cse_tmp_12 = zeta_threshold - 1
        cse_tmp_13 = 1 - z
        cse_tmp_14 = cse_tmp_13 <= zeta_threshold
        cse_tmp_15 = -cse_tmp_12
        cse_tmp_16 = my_piecewise5(cse_tmp_11, cse_tmp_12, cse_tmp_14, cse_tmp_15, z)
        cse_tmp_17 = cse_tmp_16 + 1
        cse_tmp_18 = NaNMath.pow(zeta_threshold, 1.3333333333333333)
        cse_tmp_19 = 1.8171205928321397
        cse_tmp_20 = 0.184639691595506 * cse_tmp_19 / (1.4645918875615234 * rs)
        cse_tmp_21 = my_piecewise5(cse_tmp_14, cse_tmp_12, cse_tmp_11, cse_tmp_15, -z) + 1
        cse_tmp_22 = NaNMath.pow(cse_tmp_17, 2.6666666666666665)
        cse_tmp_23 = 0.0472353356922751
        cse_tmp_24 = cse_tmp_23 / rs ^ 8
        cse_tmp_25 = 2.080083823051904 * cse_tmp_24
        cse_tmp_26 = (9 // 256) * cse_tmp_25
        cse_tmp_27 = cse_tmp_22 * cse_tmp_26
        cse_tmp_28 = NaNMath.pow(1 - cse_tmp_16, 2.6666666666666665)
        cse_tmp_29 = cse_tmp_26 * cse_tmp_28
        cse_tmp_30 = 3.3019272488946267
        cse_tmp_31 = (9 // 2048) * cse_tmp_25
        cse_tmp_32 = (5 // 9) * cse_tmp_0 * cse_tmp_19 * (-9 // 512 * cse_tmp_1 * cse_tmp_24 * cse_tmp_30 + cse_tmp_22 * cse_tmp_31 * xs0 ^ 2 + cse_tmp_27 * t0 + cse_tmp_28 * cse_tmp_31 * xs1 ^ 2 + cse_tmp_29 * t1) / (cse_tmp_27 + cse_tmp_29)
        cse_tmp_33 = -cse_tmp_7 / (-cse_tmp_7 + params_a_c1)
        cse_tmp_34 = my_piecewise3(cse_tmp_33 > cse_tmp_32, cse_tmp_32, cse_tmp_33)
        cse_tmp_35 = NaNMath.log(XC_EPSILON / my_piecewise3(params_a_d >= 0, params_a_d, -params_a_d))
        cse_tmp_36 = -(-cse_tmp_35 + params_a_c2) / cse_tmp_35
        cse_tmp_37 = my_piecewise3(cse_tmp_32 <= 1, my_piecewise3(cse_tmp_32 > cse_tmp_33, 0, exp(-cse_tmp_34 * params_a_c1 / (1 - cse_tmp_34))), my_piecewise3(cse_tmp_32 < cse_tmp_36, 0, -params_a_d * exp(params_a_c2 / (1 - my_piecewise3(cse_tmp_36 > cse_tmp_32, cse_tmp_36, cse_tmp_32)))))
        cse_tmp_38 = cse_tmp_19 * cse_tmp_2
        cse_tmp_39 = 73 // 648 - 100 // 6561 / params_a_k1
        cse_tmp_40 = 1 - cse_tmp_32
        cse_tmp_41 = -cse_tmp_23 * cse_tmp_30 * cse_tmp_39 * xt ^ 4 * exp((27 // 80) * cse_tmp_38 * cse_tmp_39) / 576 + (5 // 972) * cse_tmp_38 + ((7 // 12960) * 1.7817974362806785 * 8.54400374531753 * cse_tmp_3 + 12.083045973594572 * cse_tmp_40 * exp(-cse_tmp_40 ^ 2 / 2) / 100) ^ 2
        (1.174 * cse_tmp_37 + (1 - cse_tmp_37) * (cse_tmp_41 * params_a_k1 / (cse_tmp_41 + params_a_k1) + 1)) * (my_piecewise3(cse_tmp_10 * cse_tmp_13 <= dens_threshold, 0, -cse_tmp_20 * my_piecewise3(cse_tmp_21 <= zeta_threshold, cse_tmp_18, NaNMath.pow(cse_tmp_21, 1.3333333333333333))) + my_piecewise3(cse_tmp_10 * cse_tmp_9 <= dens_threshold, 0, -cse_tmp_20 * my_piecewise3(cse_tmp_17 <= zeta_threshold, cse_tmp_18, NaNMath.pow(cse_tmp_17, 1.3333333333333333)))) * my_piecewise3(cse_tmp_6 <= cse_tmp_8, 1, -xc_expm1(-1 / my_piecewise3(cse_tmp_8 > cse_tmp_6, cse_tmp_8, cse_tmp_6)))
    end
end
export mgga_x_mscan_energy

const mgga_x_mscan_defaults = (XC_EPSILON = 2.220446049250313e-16, dens_threshold = 1.0e-15, params_a_c1 = 0.667, params_a_c2 = 0.8, params_a_d = 1.24, params_a_k1 = 0.065, zeta_threshold = 2.220446049250313e-16)
const mgga_x_mscan_required = ()

function mgga_x_mscan(rho, sigma, lapl, tau; params = NamedTuple())
    p = resolve_params(mgga_x_mscan_defaults, mgga_x_mscan_required, params)
    v = mgga_variables(rho, sigma, lapl, tau, Val(3))
    return mgga_x_mscan_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.XC_EPSILON, p.dens_threshold, p.params_a_c1, p.params_a_c2, p.params_a_d, p.params_a_k1, p.zeta_threshold)
end

function mgga_x_mscan(na, nb, gaa, gab, gbb, la, lb, ta, tb; params = NamedTuple())
    p = resolve_params(mgga_x_mscan_defaults, mgga_x_mscan_required, params)
    v = mgga_variables(na, nb, gaa, gab, gbb, la, lb, ta, tb, Val(3))
    return mgga_x_mscan_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.XC_EPSILON, p.dens_threshold, p.params_a_c1, p.params_a_c2, p.params_a_d, p.params_a_k1, p.zeta_threshold)
end

export mgga_x_mscan, mgga_x_mscan_defaults, mgga_x_mscan_required
