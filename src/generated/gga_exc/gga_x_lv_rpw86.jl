# Auto-generated from the Libxc sources
# python/gga_exc/gga_x_lv_rpw86.py -- do not edit by hand.
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
# args: rs, z, xt, xs0, xs1, dens_threshold, zeta_threshold
const gga_x_lv_rpw86_energy = function (rs, z, xt, xs0, xs1, dens_threshold, zeta_threshold)
    @inbounds begin
        cse_tmp_0 = z + 1
        cse_tmp_1 = (3 // 8) / (pi * rs ^ 3)
        cse_tmp_2 = 7.07465277777778e-5 / 97.40909103400244
        cse_tmp_3 = 1.8171205928321397
        cse_tmp_4 = cse_tmp_3 / 4.60115111447049
        cse_tmp_5 = cse_tmp_4 * xs0 ^ 2
        cse_tmp_6 = 0.0300868055555556 * 3.3019272488946267 / 21.170591578193033
        cse_tmp_7 = cse_tmp_5 / 24
        cse_tmp_8 = cse_tmp_7 >= 10000
        cse_tmp_9 = cse_tmp_7 > 10000
        cse_tmp_10 = my_piecewise3(cse_tmp_9, cse_tmp_7, 10000)
        cse_tmp_11 = cse_tmp_10 ^ (-9)
        cse_tmp_12 = cse_tmp_10 ^ (-6)
        cse_tmp_13 = cse_tmp_10 ^ (-3)
        cse_tmp_14 = my_piecewise3(cse_tmp_9, 10000, cse_tmp_7)
        cse_tmp_15 = 0.02178 * cse_tmp_14 ^ 3
        cse_tmp_16 = cse_tmp_0 <= zeta_threshold
        cse_tmp_17 = zeta_threshold - 1
        cse_tmp_18 = 1 - z
        cse_tmp_19 = cse_tmp_18 <= zeta_threshold
        cse_tmp_20 = -cse_tmp_17
        cse_tmp_21 = my_piecewise5(cse_tmp_16, cse_tmp_17, cse_tmp_19, cse_tmp_20, z) + 1
        cse_tmp_22 = NaNMath.pow(zeta_threshold, 1.3333333333333333)
        cse_tmp_23 = 0.184639691595506 * cse_tmp_3 / (1.4645918875615234 * rs)
        cse_tmp_24 = cse_tmp_4 * xs1 ^ 2
        cse_tmp_25 = cse_tmp_24 / 24
        cse_tmp_26 = cse_tmp_25 >= 10000
        cse_tmp_27 = cse_tmp_25 > 10000
        cse_tmp_28 = my_piecewise3(cse_tmp_27, cse_tmp_25, 10000)
        cse_tmp_29 = cse_tmp_28 ^ (-9)
        cse_tmp_30 = cse_tmp_28 ^ (-6)
        cse_tmp_31 = cse_tmp_28 ^ (-3)
        cse_tmp_32 = my_piecewise3(cse_tmp_27, 10000, cse_tmp_25)
        cse_tmp_33 = 0.02178 * cse_tmp_32 ^ 3
        cse_tmp_34 = my_piecewise5(cse_tmp_19, cse_tmp_17, cse_tmp_16, cse_tmp_20, -z) + 1
        my_piecewise3(cse_tmp_0 * cse_tmp_1 <= dens_threshold, 0, -cse_tmp_23 * (NaNMath.pow(cse_tmp_2 * xs0 ^ 6 + 0.077125 * cse_tmp_5 + cse_tmp_6 * xs0 ^ 4 + 1, 0.06666666666666667) * my_piecewise3(cse_tmp_8, -147204.096085483 * cse_tmp_11 + 2787.91757629724 * cse_tmp_12 - 52.8007346189164 * cse_tmp_13 + 1.0, cse_tmp_15 / (cse_tmp_15 + 1.15)) + my_piecewise3(cse_tmp_8, 96789.0826566834 * cse_tmp_11 - 2108.06622026256 * cse_tmp_12 + 45.9136822773186 * cse_tmp_13 + 4.33170084685236 / cse_tmp_10 ^ 2 - 198.884336402771 / cse_tmp_10 ^ 5 + 9131.51223153221 / cse_tmp_10 ^ 8, (0.0943444444444444 * cse_tmp_14 + 1) / (cse_tmp_15 + 1))) * my_piecewise3(cse_tmp_21 <= zeta_threshold, cse_tmp_22, NaNMath.pow(cse_tmp_21, 1.3333333333333333))) + my_piecewise3(cse_tmp_1 * cse_tmp_18 <= dens_threshold, 0, -cse_tmp_23 * (NaNMath.pow(cse_tmp_2 * xs1 ^ 6 + 0.077125 * cse_tmp_24 + cse_tmp_6 * xs1 ^ 4 + 1, 0.06666666666666667) * my_piecewise3(cse_tmp_26, -147204.096085483 * cse_tmp_29 + 2787.91757629724 * cse_tmp_30 - 52.8007346189164 * cse_tmp_31 + 1.0, cse_tmp_33 / (cse_tmp_33 + 1.15)) + my_piecewise3(cse_tmp_26, 96789.0826566834 * cse_tmp_29 - 2108.06622026256 * cse_tmp_30 + 45.9136822773186 * cse_tmp_31 + 4.33170084685236 / cse_tmp_28 ^ 2 - 198.884336402771 / cse_tmp_28 ^ 5 + 9131.51223153221 / cse_tmp_28 ^ 8, (0.0943444444444444 * cse_tmp_32 + 1) / (cse_tmp_33 + 1))) * my_piecewise3(cse_tmp_34 <= zeta_threshold, cse_tmp_22, NaNMath.pow(cse_tmp_34, 1.3333333333333333)))
    end
end
export gga_x_lv_rpw86_energy

const gga_x_lv_rpw86_defaults = (dens_threshold = 1.0e-15, zeta_threshold = 2.220446049250313e-16)
const gga_x_lv_rpw86_required = ()

function gga_x_lv_rpw86(rho, sigma; params = NamedTuple())
    p = resolve_params(gga_x_lv_rpw86_defaults, gga_x_lv_rpw86_required, params)
    v = gga_variables(rho, sigma, Val(3))
    return gga_x_lv_rpw86_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.dens_threshold, p.zeta_threshold)
end

function gga_x_lv_rpw86(na, nb, gaa, gab, gbb; params = NamedTuple())
    p = resolve_params(gga_x_lv_rpw86_defaults, gga_x_lv_rpw86_required, params)
    v = gga_variables(na, nb, gaa, gab, gbb, Val(3))
    return gga_x_lv_rpw86_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.dens_threshold, p.zeta_threshold)
end

export gga_x_lv_rpw86, gga_x_lv_rpw86_defaults, gga_x_lv_rpw86_required
