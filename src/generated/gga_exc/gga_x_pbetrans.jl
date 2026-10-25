# Auto-generated from the Libxc sources
# python/gga_exc/gga_x_pbetrans.py -- do not edit by hand.
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
# args: rs, z, xt, xs0, xs1, dens_threshold, zeta_threshold
const gga_x_pbetrans_energy = function (rs, z, xt, xs0, xs1, dens_threshold, zeta_threshold)
    @inbounds begin
        cse_tmp_0 = z + 1
        cse_tmp_1 = (3 // 8) / (pi * rs ^ 3)
        cse_tmp_2 = 1.8171205928321397
        cse_tmp_3 = cse_tmp_2 / 4.60115111447049
        cse_tmp_4 = cse_tmp_3 * xs0 ^ 2
        cse_tmp_5 = 0.009125 * cse_tmp_4
        cse_tmp_6 = 3.3019272488946267
        cse_tmp_7 = 2.1450293971110255
        cse_tmp_8 = cse_tmp_6 / (12 * cse_tmp_7)
        cse_tmp_9 = 2 * 1.4422495703074083 * cse_tmp_7
        cse_tmp_10 = 1.227 - 0.413 / (1 + exp(-cse_tmp_9 * (cse_tmp_8 * Abs(xs0) - 3)))
        cse_tmp_11 = (cse_tmp_10 + cse_tmp_5) ^ (-1)
        cse_tmp_12 = 8.3265625e-5 * cse_tmp_6 / 21.170591578193033
        cse_tmp_13 = cse_tmp_0 <= zeta_threshold
        cse_tmp_14 = zeta_threshold - 1
        cse_tmp_15 = 1 - z
        cse_tmp_16 = cse_tmp_15 <= zeta_threshold
        cse_tmp_17 = -cse_tmp_14
        cse_tmp_18 = my_piecewise5(cse_tmp_13, cse_tmp_14, cse_tmp_16, cse_tmp_17, z) + 1
        cse_tmp_19 = NaNMath.pow(zeta_threshold, 1.3333333333333333)
        cse_tmp_20 = 0.184639691595506 * cse_tmp_2 / (1.4645918875615234 * rs)
        cse_tmp_21 = cse_tmp_3 * xs1 ^ 2
        cse_tmp_22 = 0.009125 * cse_tmp_21
        cse_tmp_23 = 1.227 - 0.413 / (1 + exp(-cse_tmp_9 * (cse_tmp_8 * Abs(xs1) - 3)))
        cse_tmp_24 = (cse_tmp_22 + cse_tmp_23) ^ (-1)
        cse_tmp_25 = my_piecewise5(cse_tmp_16, cse_tmp_14, cse_tmp_13, cse_tmp_17, -z) + 1
        my_piecewise3(cse_tmp_0 * cse_tmp_1 <= dens_threshold, 0, -cse_tmp_20 * my_piecewise3(cse_tmp_18 <= zeta_threshold, cse_tmp_19, NaNMath.pow(cse_tmp_18, 1.3333333333333333)) * my_piecewise3(cse_tmp_4 / 24 < 1, -cse_tmp_11 * cse_tmp_12 * xs0 ^ 4 + cse_tmp_5 + 1, cse_tmp_10 * cse_tmp_11 * cse_tmp_5 + 1)) + my_piecewise3(cse_tmp_1 * cse_tmp_15 <= dens_threshold, 0, -cse_tmp_20 * my_piecewise3(cse_tmp_25 <= zeta_threshold, cse_tmp_19, NaNMath.pow(cse_tmp_25, 1.3333333333333333)) * my_piecewise3(cse_tmp_21 / 24 < 1, -cse_tmp_12 * cse_tmp_24 * xs1 ^ 4 + cse_tmp_22 + 1, cse_tmp_22 * cse_tmp_23 * cse_tmp_24 + 1))
    end
end
export gga_x_pbetrans_energy

const gga_x_pbetrans_defaults = (dens_threshold = 1.0e-15, zeta_threshold = 2.220446049250313e-16)
const gga_x_pbetrans_required = ()

function gga_x_pbetrans(rho, sigma; params = NamedTuple())
    p = resolve_params(gga_x_pbetrans_defaults, gga_x_pbetrans_required, params)
    v = gga_variables(rho, sigma, Val(3))
    return gga_x_pbetrans_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.dens_threshold, p.zeta_threshold)
end

function gga_x_pbetrans(na, nb, gaa, gab, gbb; params = NamedTuple())
    p = resolve_params(gga_x_pbetrans_defaults, gga_x_pbetrans_required, params)
    v = gga_variables(na, nb, gaa, gab, gbb, Val(3))
    return gga_x_pbetrans_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.dens_threshold, p.zeta_threshold)
end

export gga_x_pbetrans, gga_x_pbetrans_defaults, gga_x_pbetrans_required
