# Auto-generated from the Libxc sources
# python/mgga_exc/mgga_x_sregtm_v3.py -- do not edit by hand.
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
# args: rs, z, xt, xs0, xs1, u0, u1, t0, t1, dens_threshold, zeta_threshold
const mgga_x_sregtm_v3_energy = function (rs, z, xt, xs0, xs1, u0, u1, t0, t1, dens_threshold, zeta_threshold)
    @inbounds begin
        cse_tmp_0 = z + 1
        cse_tmp_1 = (3 // 8) / (pi * rs ^ 3)
        cse_tmp_2 = xs0 ^ 2
        cse_tmp_3 = 1.8171205928321397
        cse_tmp_4 = 4.60115111447049
        cse_tmp_5 = cse_tmp_3 / cse_tmp_4
        cse_tmp_6 = cse_tmp_2 * cse_tmp_5
        cse_tmp_7 = (5 // 24) * cse_tmp_6 + 0.58568
        cse_tmp_8 = -cse_tmp_2 / 8 + t0
        cse_tmp_9 = (5 // 9) * cse_tmp_5
        cse_tmp_10 = cse_tmp_8 * cse_tmp_9
        cse_tmp_11 = cse_tmp_7 + 3 * my_piecewise3(cse_tmp_10 > 0, cse_tmp_10, 0)
        cse_tmp_12 = cse_tmp_7 ^ 3 / cse_tmp_11 ^ 3
        cse_tmp_13 = (cse_tmp_12 + 1) ^ (-2)
        cse_tmp_14 = 3.3019272488946267
        cse_tmp_15 = 0.00268994904622629 * cse_tmp_14 / 21.170591578193033
        cse_tmp_16 = cse_tmp_15 * xs0 ^ 4 + 0.150454888888889 * cse_tmp_6 + 1
        cse_tmp_17 = -0.043662396 * cse_tmp_14 * cse_tmp_4
        cse_tmp_18 = cse_tmp_7 / cse_tmp_11
        cse_tmp_19 = 1 - cse_tmp_18
        cse_tmp_20 = cse_tmp_5 / 4
        cse_tmp_21 = cse_tmp_20 * cse_tmp_8 + cse_tmp_6 / 36 - 9 // 20
        cse_tmp_22 = cse_tmp_0 <= zeta_threshold
        cse_tmp_23 = zeta_threshold - 1
        cse_tmp_24 = 1 - z
        cse_tmp_25 = cse_tmp_24 <= zeta_threshold
        cse_tmp_26 = -cse_tmp_23
        cse_tmp_27 = my_piecewise5(cse_tmp_22, cse_tmp_23, cse_tmp_25, cse_tmp_26, z) + 1
        cse_tmp_28 = NaNMath.pow(zeta_threshold, 1.3333333333333333)
        cse_tmp_29 = 0.184639691595506 * cse_tmp_3 / (1.4645918875615234 * rs)
        cse_tmp_30 = xs1 ^ 2
        cse_tmp_31 = cse_tmp_30 * cse_tmp_5
        cse_tmp_32 = (5 // 24) * cse_tmp_31 + 0.58568
        cse_tmp_33 = -cse_tmp_30 / 8 + t1
        cse_tmp_34 = cse_tmp_33 * cse_tmp_9
        cse_tmp_35 = cse_tmp_32 + 3 * my_piecewise3(cse_tmp_34 > 0, cse_tmp_34, 0)
        cse_tmp_36 = cse_tmp_32 ^ 3 / cse_tmp_35 ^ 3
        cse_tmp_37 = (cse_tmp_36 + 1) ^ (-2)
        cse_tmp_38 = cse_tmp_15 * xs1 ^ 4 + 0.150454888888889 * cse_tmp_31 + 1
        cse_tmp_39 = cse_tmp_32 / cse_tmp_35
        cse_tmp_40 = 1 - cse_tmp_39
        cse_tmp_41 = cse_tmp_20 * cse_tmp_33 + cse_tmp_31 / 36 - 9 // 20
        cse_tmp_42 = my_piecewise5(cse_tmp_25, cse_tmp_23, cse_tmp_22, cse_tmp_26, -z) + 1
        my_piecewise3(cse_tmp_0 * cse_tmp_1 <= dens_threshold, 0, -cse_tmp_29 * (cse_tmp_13 * cse_tmp_19 * NaNMath.pow(-146 // 135 * cse_tmp_18 * cse_tmp_19 * cse_tmp_21 + (292 // 405) * cse_tmp_21 ^ 2 + (5 // 12) * cse_tmp_6 * ((25 // 8748) * cse_tmp_6 + 10 // 81) + 1, 0.1) * (-cse_tmp_12 + cse_tmp_18 + 1 - cse_tmp_7 ^ 4 / cse_tmp_11 ^ 4 - cse_tmp_7 ^ 5 / cse_tmp_11 ^ 5) + cse_tmp_13 * (3 * cse_tmp_12 + cse_tmp_7 ^ 2 / cse_tmp_11 ^ 2) * (NaNMath.pow(cse_tmp_16, -0.2) + (7 // 9) * (0.0573502824074074 * cse_tmp_6 + cse_tmp_9 * (-cse_tmp_17 - 0.14554132 * t0)) / NaNMath.pow(cse_tmp_16, 0.4))) * my_piecewise3(cse_tmp_27 <= zeta_threshold, cse_tmp_28, NaNMath.pow(cse_tmp_27, 1.3333333333333333))) + my_piecewise3(cse_tmp_1 * cse_tmp_24 <= dens_threshold, 0, -cse_tmp_29 * (cse_tmp_37 * cse_tmp_40 * NaNMath.pow((5 // 12) * cse_tmp_31 * ((25 // 8748) * cse_tmp_31 + 10 // 81) - 146 // 135 * cse_tmp_39 * cse_tmp_40 * cse_tmp_41 + (292 // 405) * cse_tmp_41 ^ 2 + 1, 0.1) * (-cse_tmp_32 ^ 5 / cse_tmp_35 ^ 5 - cse_tmp_32 ^ 4 / cse_tmp_35 ^ 4 - cse_tmp_36 + cse_tmp_39 + 1) + cse_tmp_37 * (NaNMath.pow(cse_tmp_38, -0.2) + (7 // 9) * (0.0573502824074074 * cse_tmp_31 + cse_tmp_9 * (-cse_tmp_17 - 0.14554132 * t1)) / NaNMath.pow(cse_tmp_38, 0.4)) * (cse_tmp_32 ^ 2 / cse_tmp_35 ^ 2 + 3 * cse_tmp_36)) * my_piecewise3(cse_tmp_42 <= zeta_threshold, cse_tmp_28, NaNMath.pow(cse_tmp_42, 1.3333333333333333)))
    end
end
export mgga_x_sregtm_v3_energy

const mgga_x_sregtm_v3_defaults = (dens_threshold = 1.0e-15, zeta_threshold = 2.220446049250313e-16)
const mgga_x_sregtm_v3_required = ()

function mgga_x_sregtm_v3(rho, sigma, lapl, tau; params = NamedTuple())
    p = resolve_params(mgga_x_sregtm_v3_defaults, mgga_x_sregtm_v3_required, params)
    v = mgga_variables(rho, sigma, lapl, tau, Val(3))
    return mgga_x_sregtm_v3_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.dens_threshold, p.zeta_threshold)
end

function mgga_x_sregtm_v3(na, nb, gaa, gab, gbb, la, lb, ta, tb; params = NamedTuple())
    p = resolve_params(mgga_x_sregtm_v3_defaults, mgga_x_sregtm_v3_required, params)
    v = mgga_variables(na, nb, gaa, gab, gbb, la, lb, ta, tb, Val(3))
    return mgga_x_sregtm_v3_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.dens_threshold, p.zeta_threshold)
end

export mgga_x_sregtm_v3, mgga_x_sregtm_v3_defaults, mgga_x_sregtm_v3_required
