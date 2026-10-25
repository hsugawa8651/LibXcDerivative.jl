# Auto-generated from the Libxc sources
# python/gga_exc/gga_x_sfat_pbe.py -- do not edit by hand.
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
# args: rs, z, xt, xs0, xs1, cam_omega, dens_threshold, zeta_threshold
const gga_x_sfat_pbe_energy = function (rs, z, xt, xs0, xs1, cam_omega, dens_threshold, zeta_threshold)
    @inbounds begin
        cse_tmp_0 = z + 1
        cse_tmp_1 = (3 // 8) / (pi * rs ^ 3)
        cse_tmp_2 = xs0 ^ 2
        cse_tmp_3 = 1.8171205928321397
        cse_tmp_4 = cse_tmp_3 / 4.60115111447049
        cse_tmp_5 = 0.009146457198521546 * cse_tmp_4
        cse_tmp_6 = 0.007353751587611323 * cse_tmp_4
        cse_tmp_7 = cse_tmp_2 * cse_tmp_6 / (cse_tmp_2 * cse_tmp_5 + 0.804) + 1
        cse_tmp_8 = cse_tmp_0 <= zeta_threshold
        cse_tmp_9 = zeta_threshold - 1
        cse_tmp_10 = 1 - z
        cse_tmp_11 = cse_tmp_10 <= zeta_threshold
        cse_tmp_12 = -cse_tmp_9
        cse_tmp_13 = my_piecewise5(cse_tmp_8, cse_tmp_9, cse_tmp_11, cse_tmp_12, z) + 1
        cse_tmp_14 = 0.165390532934988 * 1.5874010519681994 * 1.2009369551760027 * cam_omega * rs / 1.2102032422537643
        cse_tmp_15 = cse_tmp_14 * NaNMath.sqrt(cse_tmp_7) / NaNMath.pow(cse_tmp_13, 0.3333333333333333)
        cse_tmp_16 = cse_tmp_15 > 1.92
        cse_tmp_17 = my_piecewise3(cse_tmp_16, cse_tmp_15, 1.92)
        cse_tmp_18 = my_piecewise3(cse_tmp_16, 1.92, cse_tmp_15)
        cse_tmp_19 = cse_tmp_18 ^ 2
        cse_tmp_20 = NaNMath.pow(zeta_threshold, 1.3333333333333333)
        cse_tmp_21 = 0.184639691595506 * cse_tmp_3 / (1.4645918875615234 * rs)
        cse_tmp_22 = xs1 ^ 2
        cse_tmp_23 = cse_tmp_22 * cse_tmp_6 / (cse_tmp_22 * cse_tmp_5 + 0.804) + 1
        cse_tmp_24 = my_piecewise5(cse_tmp_11, cse_tmp_9, cse_tmp_8, cse_tmp_12, -z) + 1
        cse_tmp_25 = cse_tmp_14 * NaNMath.sqrt(cse_tmp_23) / NaNMath.pow(cse_tmp_24, 0.3333333333333333)
        cse_tmp_26 = cse_tmp_25 > 1.92
        cse_tmp_27 = my_piecewise3(cse_tmp_26, cse_tmp_25, 1.92)
        cse_tmp_28 = my_piecewise3(cse_tmp_26, 1.92, cse_tmp_25)
        cse_tmp_29 = cse_tmp_28 ^ 2
        my_piecewise3(cse_tmp_0 * cse_tmp_1 <= dens_threshold, 0, -cse_tmp_21 * cse_tmp_7 * my_piecewise3(cse_tmp_15 >= 1.92, 1 / (9 * cse_tmp_17 ^ 2) - 1 / (30 * cse_tmp_17 ^ 4) + 1 / (70 * cse_tmp_17 ^ 6) - 1 / (135 * cse_tmp_17 ^ 8) + 1 / (231 * cse_tmp_17 ^ 10) - 1 / (364 * cse_tmp_17 ^ 12) + 1 / (540 * cse_tmp_17 ^ 14) - 1 / (765 * cse_tmp_17 ^ 16) + 1 / (1045 * cse_tmp_17 ^ 18) - 1 / (1386 * cse_tmp_17 ^ 20) + 1 / (1794 * cse_tmp_17 ^ 22) - 1 / (2275 * cse_tmp_17 ^ 24) + 1 / (2835 * cse_tmp_17 ^ 26) - 1 / (3480 * cse_tmp_17 ^ 28) + 1 / (4216 * cse_tmp_17 ^ 30) - 1 / (5049 * cse_tmp_17 ^ 32) + 1 / (5985 * cse_tmp_17 ^ 34), -8 // 3 * cse_tmp_18 * (cse_tmp_18 * (-(cse_tmp_19 + 3) * xc_log1p(cse_tmp_19 ^ (-1)) + 1) / 4 + atan2(1, cse_tmp_18)) + 1) * my_piecewise3(cse_tmp_13 <= zeta_threshold, cse_tmp_20, NaNMath.pow(cse_tmp_13, 1.3333333333333333))) + my_piecewise3(cse_tmp_1 * cse_tmp_10 <= dens_threshold, 0, -cse_tmp_21 * cse_tmp_23 * my_piecewise3(cse_tmp_25 >= 1.92, 1 / (9 * cse_tmp_27 ^ 2) - 1 / (30 * cse_tmp_27 ^ 4) + 1 / (70 * cse_tmp_27 ^ 6) - 1 / (135 * cse_tmp_27 ^ 8) + 1 / (231 * cse_tmp_27 ^ 10) - 1 / (364 * cse_tmp_27 ^ 12) + 1 / (540 * cse_tmp_27 ^ 14) - 1 / (765 * cse_tmp_27 ^ 16) + 1 / (1045 * cse_tmp_27 ^ 18) - 1 / (1386 * cse_tmp_27 ^ 20) + 1 / (1794 * cse_tmp_27 ^ 22) - 1 / (2275 * cse_tmp_27 ^ 24) + 1 / (2835 * cse_tmp_27 ^ 26) - 1 / (3480 * cse_tmp_27 ^ 28) + 1 / (4216 * cse_tmp_27 ^ 30) - 1 / (5049 * cse_tmp_27 ^ 32) + 1 / (5985 * cse_tmp_27 ^ 34), -8 // 3 * cse_tmp_28 * (cse_tmp_28 * (-(cse_tmp_29 + 3) * xc_log1p(cse_tmp_29 ^ (-1)) + 1) / 4 + atan2(1, cse_tmp_28)) + 1) * my_piecewise3(cse_tmp_24 <= zeta_threshold, cse_tmp_20, NaNMath.pow(cse_tmp_24, 1.3333333333333333)))
    end
end
export gga_x_sfat_pbe_energy

const gga_x_sfat_pbe_defaults = (cam_omega = 0.44, dens_threshold = 1.0e-15, zeta_threshold = 2.220446049250313e-16)
const gga_x_sfat_pbe_required = ()

function gga_x_sfat_pbe(rho, sigma; params = NamedTuple())
    p = resolve_params(gga_x_sfat_pbe_defaults, gga_x_sfat_pbe_required, params)
    v = gga_variables(rho, sigma, Val(3))
    return gga_x_sfat_pbe_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.cam_omega, p.dens_threshold, p.zeta_threshold)
end

function gga_x_sfat_pbe(na, nb, gaa, gab, gbb; params = NamedTuple())
    p = resolve_params(gga_x_sfat_pbe_defaults, gga_x_sfat_pbe_required, params)
    v = gga_variables(na, nb, gaa, gab, gbb, Val(3))
    return gga_x_sfat_pbe_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.cam_omega, p.dens_threshold, p.zeta_threshold)
end

export gga_x_sfat_pbe, gga_x_sfat_pbe_defaults, gga_x_sfat_pbe_required
