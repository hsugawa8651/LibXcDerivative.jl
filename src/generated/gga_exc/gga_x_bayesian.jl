# Auto-generated from the Libxc sources
# python/gga_exc/gga_x_bayesian.py -- do not edit by hand.
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
# args: rs, z, xt, xs0, xs1, dens_threshold, zeta_threshold
const gga_x_bayesian_energy = function (rs, z, xt, xs0, xs1, dens_threshold, zeta_threshold)
    @inbounds begin
        cse_tmp_0 = z + 1
        cse_tmp_1 = (3 // 8) / (pi * rs ^ 3)
        cse_tmp_2 = 1.8171205928321397
        cse_tmp_3 = cse_tmp_2 / 4.60115111447049
        cse_tmp_4 = 0.0790083333333333 * cse_tmp_3
        cse_tmp_5 = 3.3019272488946267 / (12 * 2.1450293971110255)
        cse_tmp_6 = xs0 ^ 2 / (cse_tmp_5 * Abs(xs0) + 1) ^ 2
        cse_tmp_7 = cse_tmp_3 / 24
        cse_tmp_8 = cse_tmp_0 <= zeta_threshold
        cse_tmp_9 = zeta_threshold - 1
        cse_tmp_10 = 1 - z
        cse_tmp_11 = cse_tmp_10 <= zeta_threshold
        cse_tmp_12 = -cse_tmp_9
        cse_tmp_13 = my_piecewise5(cse_tmp_8, cse_tmp_9, cse_tmp_11, cse_tmp_12, z) + 1
        cse_tmp_14 = NaNMath.pow(zeta_threshold, 1.3333333333333333)
        cse_tmp_15 = 0.184639691595506 * cse_tmp_2 / (1.4645918875615234 * rs)
        cse_tmp_16 = xs1 ^ 2 / (cse_tmp_5 * Abs(xs1) + 1) ^ 2
        cse_tmp_17 = my_piecewise5(cse_tmp_11, cse_tmp_9, cse_tmp_8, cse_tmp_12, -z) + 1
        my_piecewise3(cse_tmp_0 * cse_tmp_1 <= dens_threshold, 0, -cse_tmp_15 * (cse_tmp_6 * cse_tmp_7 * (cse_tmp_4 * cse_tmp_6 + 0.1926) + 1.0008) * my_piecewise3(cse_tmp_13 <= zeta_threshold, cse_tmp_14, NaNMath.pow(cse_tmp_13, 1.3333333333333333))) + my_piecewise3(cse_tmp_1 * cse_tmp_10 <= dens_threshold, 0, -cse_tmp_15 * (cse_tmp_16 * cse_tmp_7 * (cse_tmp_16 * cse_tmp_4 + 0.1926) + 1.0008) * my_piecewise3(cse_tmp_17 <= zeta_threshold, cse_tmp_14, NaNMath.pow(cse_tmp_17, 1.3333333333333333)))
    end
end
export gga_x_bayesian_energy

const gga_x_bayesian_defaults = (dens_threshold = 1.0e-15, zeta_threshold = 2.220446049250313e-16)
const gga_x_bayesian_required = ()

function gga_x_bayesian(rho, sigma; params = NamedTuple())
    p = resolve_params(gga_x_bayesian_defaults, gga_x_bayesian_required, params)
    v = gga_variables(rho, sigma, Val(3))
    return gga_x_bayesian_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.dens_threshold, p.zeta_threshold)
end

function gga_x_bayesian(na, nb, gaa, gab, gbb; params = NamedTuple())
    p = resolve_params(gga_x_bayesian_defaults, gga_x_bayesian_required, params)
    v = gga_variables(na, nb, gaa, gab, gbb, Val(3))
    return gga_x_bayesian_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.dens_threshold, p.zeta_threshold)
end

export gga_x_bayesian, gga_x_bayesian_defaults, gga_x_bayesian_required
