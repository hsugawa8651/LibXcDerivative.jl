# Auto-generated from the Libxc sources
# python/gga_exc/gga_x_ityh.py -- do not edit by hand.
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
# args: rs, z, xt, xs0, xs1, cam_omega, dens_threshold, zeta_threshold
const gga_x_ityh_energy = function (rs, z, xt, xs0, xs1, cam_omega, dens_threshold, zeta_threshold)
    @inbounds begin
        cse_tmp_0 = z + 1
        cse_tmp_1 = (3 // 8) / (pi * rs ^ 3)
        cse_tmp_2 = xs0 ^ 2
        cse_tmp_3 = NaNMath.sqrt(my_piecewise3(cse_tmp_2 > 1 // 16, cse_tmp_2, 1 // 16))
        cse_tmp_4 = 1.5874010519681994
        cse_tmp_5 = 0.00284337563317713 * cse_tmp_4
        cse_tmp_6 = cse_tmp_2 * cse_tmp_5 / (0.0252 * my_piecewise3(cse_tmp_2 < 1 // 16, cse_tmp_2 - 1300075 // 226492416 * xs0 ^ 28 + (676039 // 104857600) * xs0 ^ 26 - 88179 // 12058624 * xs0 ^ 24 + (46189 // 5505024) * xs0 ^ 22 - 12155 // 1245184 * xs0 ^ 20 + (6435 // 557056) * xs0 ^ 18 - 143 // 10240 * xs0 ^ 16 + (231 // 13312) * xs0 ^ 14 - 63 // 2816 * xs0 ^ 12 + (35 // 1152) * xs0 ^ 10 - 5 // 112 * xs0 ^ 8 + (3 // 40) * xs0 ^ 6 - xs0 ^ 4 / 6, cse_tmp_3 * xc_asinh(cse_tmp_3)) + 1) + 1
        cse_tmp_7 = cse_tmp_0 <= zeta_threshold
        cse_tmp_8 = zeta_threshold - 1
        cse_tmp_9 = 1 - z
        cse_tmp_10 = cse_tmp_9 <= zeta_threshold
        cse_tmp_11 = -cse_tmp_8
        cse_tmp_12 = my_piecewise5(cse_tmp_7, cse_tmp_8, cse_tmp_10, cse_tmp_11, z) + 1
        cse_tmp_13 = 0.165390532934988 * 1.2009369551760027 * cam_omega * cse_tmp_4 * rs / 1.2102032422537643
        cse_tmp_14 = cse_tmp_13 / (NaNMath.pow(cse_tmp_12, 0.3333333333333333) * NaNMath.sqrt(cse_tmp_6 ^ (-1)))
        cse_tmp_15 = cse_tmp_14 > 1.35
        cse_tmp_16 = my_piecewise3(cse_tmp_15, cse_tmp_14, 1.35)
        cse_tmp_17 = my_piecewise3(cse_tmp_15, 1.35, cse_tmp_14)
        cse_tmp_18 = 1.772453850905516
        cse_tmp_19 = cse_tmp_17 ^ 2
        cse_tmp_20 = xc_expm1(-1 / (4 * cse_tmp_19))
        cse_tmp_21 = NaNMath.pow(zeta_threshold, 1.3333333333333333)
        cse_tmp_22 = 0.184639691595506 * 1.8171205928321397 / (1.4645918875615234 * rs)
        cse_tmp_23 = xs1 ^ 2
        cse_tmp_24 = NaNMath.sqrt(my_piecewise3(cse_tmp_23 > 1 // 16, cse_tmp_23, 1 // 16))
        cse_tmp_25 = cse_tmp_23 * cse_tmp_5 / (0.0252 * my_piecewise3(cse_tmp_23 < 1 // 16, cse_tmp_23 - 1300075 // 226492416 * xs1 ^ 28 + (676039 // 104857600) * xs1 ^ 26 - 88179 // 12058624 * xs1 ^ 24 + (46189 // 5505024) * xs1 ^ 22 - 12155 // 1245184 * xs1 ^ 20 + (6435 // 557056) * xs1 ^ 18 - 143 // 10240 * xs1 ^ 16 + (231 // 13312) * xs1 ^ 14 - 63 // 2816 * xs1 ^ 12 + (35 // 1152) * xs1 ^ 10 - 5 // 112 * xs1 ^ 8 + (3 // 40) * xs1 ^ 6 - xs1 ^ 4 / 6, cse_tmp_24 * xc_asinh(cse_tmp_24)) + 1) + 1
        cse_tmp_26 = my_piecewise5(cse_tmp_10, cse_tmp_8, cse_tmp_7, cse_tmp_11, -z) + 1
        cse_tmp_27 = cse_tmp_13 / (NaNMath.pow(cse_tmp_26, 0.3333333333333333) * NaNMath.sqrt(cse_tmp_25 ^ (-1)))
        cse_tmp_28 = cse_tmp_27 > 1.35
        cse_tmp_29 = my_piecewise3(cse_tmp_28, cse_tmp_27, 1.35)
        cse_tmp_30 = my_piecewise3(cse_tmp_28, 1.35, cse_tmp_27)
        cse_tmp_31 = cse_tmp_30 ^ 2
        cse_tmp_32 = xc_expm1(-1 / (4 * cse_tmp_31))
        my_piecewise3(cse_tmp_0 * cse_tmp_1 <= dens_threshold, 0, -cse_tmp_22 * cse_tmp_6 * my_piecewise3(cse_tmp_14 >= 1.35, 1 / (36 * cse_tmp_16 ^ 2) - 1 / (960 * cse_tmp_16 ^ 4) + 1 / (26880 * cse_tmp_16 ^ 6) - 1 / (829440 * cse_tmp_16 ^ 8) + 1 / (28385280 * cse_tmp_16 ^ 10) - 1 / (1073479680 * cse_tmp_16 ^ 12) + 1 / (44590694400 * cse_tmp_16 ^ 14), -8 // 3 * cse_tmp_17 * (2 * cse_tmp_17 * (-2 * cse_tmp_19 * cse_tmp_20 + cse_tmp_20 - 1 // 2) + cse_tmp_18 * erf(1 / (2 * cse_tmp_17))) + 1) * my_piecewise3(cse_tmp_12 <= zeta_threshold, cse_tmp_21, NaNMath.pow(cse_tmp_12, 1.3333333333333333))) + my_piecewise3(cse_tmp_1 * cse_tmp_9 <= dens_threshold, 0, -cse_tmp_22 * cse_tmp_25 * my_piecewise3(cse_tmp_27 >= 1.35, 1 / (36 * cse_tmp_29 ^ 2) - 1 / (960 * cse_tmp_29 ^ 4) + 1 / (26880 * cse_tmp_29 ^ 6) - 1 / (829440 * cse_tmp_29 ^ 8) + 1 / (28385280 * cse_tmp_29 ^ 10) - 1 / (1073479680 * cse_tmp_29 ^ 12) + 1 / (44590694400 * cse_tmp_29 ^ 14), -8 // 3 * cse_tmp_30 * (cse_tmp_18 * erf(1 / (2 * cse_tmp_30)) + 2 * cse_tmp_30 * (-2 * cse_tmp_31 * cse_tmp_32 + cse_tmp_32 - 1 // 2)) + 1) * my_piecewise3(cse_tmp_26 <= zeta_threshold, cse_tmp_21, NaNMath.pow(cse_tmp_26, 1.3333333333333333)))
    end
end
export gga_x_ityh_energy

const gga_x_ityh_defaults = (cam_omega = 0.2, dens_threshold = 1.0e-14, zeta_threshold = 2.220446049250313e-16)
const gga_x_ityh_required = ()

function gga_x_ityh(rho, sigma; params = NamedTuple())
    p = resolve_params(gga_x_ityh_defaults, gga_x_ityh_required, params)
    v = gga_variables(rho, sigma, Val(3))
    return gga_x_ityh_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.cam_omega, p.dens_threshold, p.zeta_threshold)
end

function gga_x_ityh(na, nb, gaa, gab, gbb; params = NamedTuple())
    p = resolve_params(gga_x_ityh_defaults, gga_x_ityh_required, params)
    v = gga_variables(na, nb, gaa, gab, gbb, Val(3))
    return gga_x_ityh_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.cam_omega, p.dens_threshold, p.zeta_threshold)
end

export gga_x_ityh, gga_x_ityh_defaults, gga_x_ityh_required
