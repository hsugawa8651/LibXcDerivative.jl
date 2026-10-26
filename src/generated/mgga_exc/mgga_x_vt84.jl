# Auto-generated from the Libxc sources
# python/mgga_exc/mgga_x_vt84.py -- do not edit by hand.
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
# args: rs, z, xt, xs0, xs1, u0, u1, t0, t1, dens_threshold, zeta_threshold
const mgga_x_vt84_energy = function (rs, z, xt, xs0, xs1, u0, u1, t0, t1, dens_threshold, zeta_threshold)
    @inbounds begin
        cse_tmp_0 = z + 1
        cse_tmp_1 = (3 // 8) / (pi * rs ^ 3)
        cse_tmp_2 = xs0 ^ 2
        cse_tmp_3 = 1.8171205928321397
        cse_tmp_4 = cse_tmp_3 / 4.60115111447049
        cse_tmp_5 = cse_tmp_2 * cse_tmp_4
        cse_tmp_6 = 0.0587337447961372 * cse_tmp_5 + 1
        cse_tmp_7 = xs0 ^ 6
        cse_tmp_8 = 0.000106470764746228 / 97.40909103400244
        cse_tmp_9 = t0 ^ (-2)
        cse_tmp_10 = xs0 ^ 4
        cse_tmp_11 = cse_tmp_10 * cse_tmp_9
        cse_tmp_12 = 21.170591578193033
        cse_tmp_13 = 2.65059349544446e-5 * 3.3019272488946267 / cse_tmp_12
        cse_tmp_14 = cse_tmp_4 * (-cse_tmp_2 / 8 + t0)
        cse_tmp_15 = cse_tmp_5 / 36 + (cse_tmp_14 / 4 - 9 // 20) / NaNMath.sqrt(0.222222222222222 * cse_tmp_14 * ((5 // 9) * cse_tmp_14 - 1) + 1)
        cse_tmp_16 = (27 // 100) * cse_tmp_12 * cse_tmp_3
        cse_tmp_17 = cse_tmp_10 * cse_tmp_13 + 0.00195779149320457 * cse_tmp_11 + (146 // 2025) * cse_tmp_15 ^ 2 - 73 // 9720 * cse_tmp_15 * cse_tmp_5 * NaNMath.sqrt(cse_tmp_16 * cse_tmp_9 + 1 // 2) + cse_tmp_5 * (0.00419826171875 * cse_tmp_7 / (t0 ^ 3 * (cse_tmp_11 / 64 + 1) ^ 2) + 10 // 81) / 24 + cse_tmp_7 * cse_tmp_8
        cse_tmp_18 = cse_tmp_6 ^ 2
        cse_tmp_19 = cse_tmp_17 / cse_tmp_18
        cse_tmp_20 = cse_tmp_0 <= zeta_threshold
        cse_tmp_21 = zeta_threshold - 1
        cse_tmp_22 = 1 - z
        cse_tmp_23 = cse_tmp_22 <= zeta_threshold
        cse_tmp_24 = -cse_tmp_21
        cse_tmp_25 = my_piecewise5(cse_tmp_20, cse_tmp_21, cse_tmp_23, cse_tmp_24, z) + 1
        cse_tmp_26 = NaNMath.pow(zeta_threshold, 1.3333333333333333)
        cse_tmp_27 = 0.184639691595506 * cse_tmp_3 / (1.4645918875615234 * rs)
        cse_tmp_28 = xs1 ^ 2
        cse_tmp_29 = cse_tmp_28 * cse_tmp_4
        cse_tmp_30 = 0.0587337447961372 * cse_tmp_29 + 1
        cse_tmp_31 = xs1 ^ 6
        cse_tmp_32 = t1 ^ (-2)
        cse_tmp_33 = xs1 ^ 4
        cse_tmp_34 = cse_tmp_32 * cse_tmp_33
        cse_tmp_35 = cse_tmp_4 * (-cse_tmp_28 / 8 + t1)
        cse_tmp_36 = cse_tmp_29 / 36 + (cse_tmp_35 / 4 - 9 // 20) / NaNMath.sqrt(0.222222222222222 * cse_tmp_35 * ((5 // 9) * cse_tmp_35 - 1) + 1)
        cse_tmp_37 = cse_tmp_13 * cse_tmp_33 - 73 // 9720 * cse_tmp_29 * cse_tmp_36 * NaNMath.sqrt(cse_tmp_16 * cse_tmp_32 + 1 // 2) + cse_tmp_29 * (0.00419826171875 * cse_tmp_31 / (t1 ^ 3 * (cse_tmp_34 / 64 + 1) ^ 2) + 10 // 81) / 24 + cse_tmp_31 * cse_tmp_8 + 0.00195779149320457 * cse_tmp_34 + (146 // 2025) * cse_tmp_36 ^ 2
        cse_tmp_38 = cse_tmp_30 ^ 2
        cse_tmp_39 = cse_tmp_37 / cse_tmp_38
        cse_tmp_40 = my_piecewise5(cse_tmp_23, cse_tmp_21, cse_tmp_20, cse_tmp_24, -z) + 1
        my_piecewise3(cse_tmp_0 * cse_tmp_1 <= dens_threshold, 0, -cse_tmp_27 * (cse_tmp_19 * exp(-0.0001863 * cse_tmp_19) / (cse_tmp_19 + 1) - (-1 + (10 // 81) * cse_tmp_18 / cse_tmp_17) * xc_expm1(-0.00150903 * cse_tmp_17 ^ 2 / cse_tmp_6 ^ 4) + 1) * my_piecewise3(cse_tmp_25 <= zeta_threshold, cse_tmp_26, NaNMath.pow(cse_tmp_25, 1.3333333333333333))) + my_piecewise3(cse_tmp_1 * cse_tmp_22 <= dens_threshold, 0, -cse_tmp_27 * (cse_tmp_39 * exp(-0.0001863 * cse_tmp_39) / (cse_tmp_39 + 1) - (-1 + (10 // 81) * cse_tmp_38 / cse_tmp_37) * xc_expm1(-0.00150903 * cse_tmp_37 ^ 2 / cse_tmp_30 ^ 4) + 1) * my_piecewise3(cse_tmp_40 <= zeta_threshold, cse_tmp_26, NaNMath.pow(cse_tmp_40, 1.3333333333333333)))
    end
end
export mgga_x_vt84_energy

const mgga_x_vt84_defaults = (dens_threshold = 1.0e-14, zeta_threshold = 2.220446049250313e-16)
const mgga_x_vt84_required = ()

function mgga_x_vt84(rho, sigma, lapl, tau; params = NamedTuple())
    p = resolve_params(mgga_x_vt84_defaults, mgga_x_vt84_required, params)
    v = mgga_variables(rho, sigma, lapl, tau, Val(3))
    return mgga_x_vt84_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.dens_threshold, p.zeta_threshold)
end

function mgga_x_vt84(na, nb, gaa, gab, gbb, la, lb, ta, tb; params = NamedTuple())
    p = resolve_params(mgga_x_vt84_defaults, mgga_x_vt84_required, params)
    v = mgga_variables(na, nb, gaa, gab, gbb, la, lb, ta, tb, Val(3))
    return mgga_x_vt84_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.dens_threshold, p.zeta_threshold)
end

export mgga_x_vt84, mgga_x_vt84_defaults, mgga_x_vt84_required
