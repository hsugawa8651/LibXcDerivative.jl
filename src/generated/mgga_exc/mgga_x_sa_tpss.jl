# Auto-generated from the Libxc sources
# python/mgga_exc/mgga_x_sa_tpss.py -- do not edit by hand.
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
# args: rs, z, xt, xs0, xs1, u0, u1, t0, t1, dens_threshold, zeta_threshold
const mgga_x_sa_tpss_energy = function (rs, z, xt, xs0, xs1, u0, u1, t0, t1, dens_threshold, zeta_threshold)
    @inbounds begin
        cse_tmp_0 = z + 1
        cse_tmp_1 = (3 // 8) / (pi * rs ^ 3)
        cse_tmp_2 = xs0 ^ 2
        cse_tmp_3 = 1.8171205928321397
        cse_tmp_4 = cse_tmp_3 / 4.60115111447049
        cse_tmp_5 = cse_tmp_4 * (-cse_tmp_2 / 8 + t0)
        cse_tmp_6 = (5 // 9) * cse_tmp_5
        cse_tmp_7 = NaNMath.sqrt(cse_tmp_6 + 1)
        cse_tmp_8 = NaNMath.sqrt(NaNMath.log(cse_tmp_6 + 0.348) + 2.413)
        cse_tmp_9 = 2.23606797749979
        cse_tmp_10 = (2 // 15) * pi * cse_tmp_9
        cse_tmp_11 = cse_tmp_10 * cse_tmp_7 / cse_tmp_8
        cse_tmp_12 = cse_tmp_2 * cse_tmp_4
        cse_tmp_13 = 0.0001464352734375 / 97.40909103400244
        cse_tmp_14 = t0 ^ (-2)
        cse_tmp_15 = xs0 ^ 4
        cse_tmp_16 = cse_tmp_14 * cse_tmp_15
        cse_tmp_17 = (25 // 629856) * 3.3019272488946267 * cse_tmp_9 / 66.50937497420118
        cse_tmp_18 = cse_tmp_12 / 36 + (cse_tmp_5 / 4 - 9 // 20) / NaNMath.sqrt(0.222222222222222 * cse_tmp_5 * (cse_tmp_6 - 1) + 1)
        cse_tmp_19 = (27 // 100) * 21.170591578193033 * cse_tmp_3
        cse_tmp_20 = (-73 // 9720 * cse_tmp_12 * cse_tmp_18 * NaNMath.sqrt(cse_tmp_14 * cse_tmp_19 + 1 // 2) + cse_tmp_12 * (0.02485875 * cse_tmp_16 / (cse_tmp_16 / 64 + 1) ^ 2 + 10 // 81) / 24 + cse_tmp_13 * xs0 ^ 6 + cse_tmp_15 * cse_tmp_17 * cse_tmp_8 / cse_tmp_7 + 0.00172188616792999 * cse_tmp_16 + (146 // 2025) * cse_tmp_18 ^ 2) / (0.0516565850378998 * cse_tmp_12 + 1) ^ 2
        cse_tmp_21 = cse_tmp_0 <= zeta_threshold
        cse_tmp_22 = zeta_threshold - 1
        cse_tmp_23 = 1 - z
        cse_tmp_24 = cse_tmp_23 <= zeta_threshold
        cse_tmp_25 = -cse_tmp_22
        cse_tmp_26 = my_piecewise5(cse_tmp_21, cse_tmp_22, cse_tmp_24, cse_tmp_25, z) + 1
        cse_tmp_27 = NaNMath.pow(zeta_threshold, 1.3333333333333333)
        cse_tmp_28 = 0.184639691595506 * cse_tmp_3 / (1.4645918875615234 * rs)
        cse_tmp_29 = xs1 ^ 2
        cse_tmp_30 = cse_tmp_4 * (-cse_tmp_29 / 8 + t1)
        cse_tmp_31 = (5 // 9) * cse_tmp_30
        cse_tmp_32 = NaNMath.sqrt(cse_tmp_31 + 1)
        cse_tmp_33 = NaNMath.sqrt(NaNMath.log(cse_tmp_31 + 0.348) + 2.413)
        cse_tmp_34 = cse_tmp_10 * cse_tmp_32 / cse_tmp_33
        cse_tmp_35 = cse_tmp_29 * cse_tmp_4
        cse_tmp_36 = t1 ^ (-2)
        cse_tmp_37 = xs1 ^ 4
        cse_tmp_38 = cse_tmp_36 * cse_tmp_37
        cse_tmp_39 = cse_tmp_35 / 36 + (cse_tmp_30 / 4 - 9 // 20) / NaNMath.sqrt(0.222222222222222 * cse_tmp_30 * (cse_tmp_31 - 1) + 1)
        cse_tmp_40 = (cse_tmp_13 * xs1 ^ 6 + cse_tmp_17 * cse_tmp_33 * cse_tmp_37 / cse_tmp_32 - 73 // 9720 * cse_tmp_35 * cse_tmp_39 * NaNMath.sqrt(cse_tmp_19 * cse_tmp_36 + 1 // 2) + cse_tmp_35 * (0.02485875 * cse_tmp_38 / (cse_tmp_38 / 64 + 1) ^ 2 + 10 // 81) / 24 + 0.00172188616792999 * cse_tmp_38 + (146 // 2025) * cse_tmp_39 ^ 2) / (0.0516565850378998 * cse_tmp_35 + 1) ^ 2
        cse_tmp_41 = my_piecewise5(cse_tmp_24, cse_tmp_22, cse_tmp_21, cse_tmp_25, -z) + 1
        my_piecewise3(cse_tmp_0 * cse_tmp_1 <= dens_threshold, 0, -cse_tmp_28 * (cse_tmp_11 * cse_tmp_20 / (cse_tmp_11 + cse_tmp_20) + 1) * my_piecewise3(cse_tmp_26 <= zeta_threshold, cse_tmp_27, NaNMath.pow(cse_tmp_26, 1.3333333333333333))) + my_piecewise3(cse_tmp_1 * cse_tmp_23 <= dens_threshold, 0, -cse_tmp_28 * (cse_tmp_34 * cse_tmp_40 / (cse_tmp_34 + cse_tmp_40) + 1) * my_piecewise3(cse_tmp_41 <= zeta_threshold, cse_tmp_27, NaNMath.pow(cse_tmp_41, 1.3333333333333333)))
    end
end
export mgga_x_sa_tpss_energy

const mgga_x_sa_tpss_defaults = (dens_threshold = 1.0e-15, zeta_threshold = 2.220446049250313e-16)
const mgga_x_sa_tpss_required = ()

function mgga_x_sa_tpss(rho, sigma, lapl, tau; params = NamedTuple())
    p = resolve_params(mgga_x_sa_tpss_defaults, mgga_x_sa_tpss_required, params)
    v = mgga_variables(rho, sigma, lapl, tau, Val(3))
    return mgga_x_sa_tpss_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.dens_threshold, p.zeta_threshold)
end

function mgga_x_sa_tpss(na, nb, gaa, gab, gbb, la, lb, ta, tb; params = NamedTuple())
    p = resolve_params(mgga_x_sa_tpss_defaults, mgga_x_sa_tpss_required, params)
    v = mgga_variables(na, nb, gaa, gab, gbb, la, lb, ta, tb, Val(3))
    return mgga_x_sa_tpss_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.dens_threshold, p.zeta_threshold)
end

export mgga_x_sa_tpss, mgga_x_sa_tpss_defaults, mgga_x_sa_tpss_required
