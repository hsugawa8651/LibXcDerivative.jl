# Auto-generated from the Libxc sources
# python/gga_exc/gga_x_q2d.py -- do not edit by hand.
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
# args: rs, z, xt, xs0, xs1, dens_threshold, zeta_threshold
const gga_x_q2d_energy = function (rs, z, xt, xs0, xs1, dens_threshold, zeta_threshold)
    @inbounds begin
        cse_tmp_0 = z + 1
        cse_tmp_1 = (3 // 8) / (pi * rs ^ 3)
        cse_tmp_2 = 1 / (2304 * 97.40909103400244)
        cse_tmp_3 = 1.8171205928321397
        cse_tmp_4 = cse_tmp_3 / 4.60115111447049
        cse_tmp_5 = cse_tmp_4 * xs0 ^ 2
        cse_tmp_6 = cse_tmp_5 / 24
        cse_tmp_7 = 0.00181145833333333 * 1.2599210498948732 * 2.498049532966813 / 14.454942539276981
        cse_tmp_8 = cse_tmp_0 <= zeta_threshold
        cse_tmp_9 = zeta_threshold - 1
        cse_tmp_10 = 1 - z
        cse_tmp_11 = cse_tmp_10 <= zeta_threshold
        cse_tmp_12 = -cse_tmp_9
        cse_tmp_13 = my_piecewise5(cse_tmp_8, cse_tmp_9, cse_tmp_11, cse_tmp_12, z) + 1
        cse_tmp_14 = NaNMath.pow(zeta_threshold, 1.3333333333333333)
        cse_tmp_15 = 0.184639691595506 * cse_tmp_3 / (1.4645918875615234 * rs)
        cse_tmp_16 = cse_tmp_4 * xs1 ^ 2
        cse_tmp_17 = cse_tmp_16 / 24
        cse_tmp_18 = my_piecewise5(cse_tmp_11, cse_tmp_9, cse_tmp_8, cse_tmp_12, -z) + 1
        my_piecewise3(cse_tmp_0 * cse_tmp_1 <= dens_threshold, 0, -cse_tmp_15 * (cse_tmp_7 * (cse_tmp_6 + 1) * NaNMath.pow(Abs(xs0), 3.5) + (10 - cse_tmp_6) * (cse_tmp_6 + 10) * (0.0041358024691358 * cse_tmp_5 / ((5 // 972) * cse_tmp_5 + 0.804) + 1)) * my_piecewise3(cse_tmp_13 <= zeta_threshold, cse_tmp_14, NaNMath.pow(cse_tmp_13, 1.3333333333333333)) / (cse_tmp_2 * xs0 ^ 6 + 100)) + my_piecewise3(cse_tmp_1 * cse_tmp_10 <= dens_threshold, 0, -cse_tmp_15 * (cse_tmp_7 * (cse_tmp_17 + 1) * NaNMath.pow(Abs(xs1), 3.5) + (10 - cse_tmp_17) * (cse_tmp_17 + 10) * (0.0041358024691358 * cse_tmp_16 / ((5 // 972) * cse_tmp_16 + 0.804) + 1)) * my_piecewise3(cse_tmp_18 <= zeta_threshold, cse_tmp_14, NaNMath.pow(cse_tmp_18, 1.3333333333333333)) / (cse_tmp_2 * xs1 ^ 6 + 100))
    end
end
export gga_x_q2d_energy

const gga_x_q2d_defaults = (dens_threshold = 1.0e-15, zeta_threshold = 2.220446049250313e-16)
const gga_x_q2d_required = ()

function gga_x_q2d(rho, sigma; params = NamedTuple())
    p = resolve_params(gga_x_q2d_defaults, gga_x_q2d_required, params)
    v = gga_variables(rho, sigma, Val(3))
    return gga_x_q2d_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.dens_threshold, p.zeta_threshold)
end

function gga_x_q2d(na, nb, gaa, gab, gbb; params = NamedTuple())
    p = resolve_params(gga_x_q2d_defaults, gga_x_q2d_required, params)
    v = gga_variables(na, nb, gaa, gab, gbb, Val(3))
    return gga_x_q2d_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.dens_threshold, p.zeta_threshold)
end

export gga_x_q2d, gga_x_q2d_defaults, gga_x_q2d_required
