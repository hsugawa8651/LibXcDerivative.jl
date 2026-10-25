# Auto-generated from the Libxc sources
# python/gga_exc/gga_k_pearson.py -- do not edit by hand.
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
# args: rs, z, xt, xs0, xs1, dens_threshold, zeta_threshold
const gga_k_pearson_energy = function (rs, z, xt, xs0, xs1, dens_threshold, zeta_threshold)
    @inbounds begin
        cse_tmp_0 = z + 1
        cse_tmp_1 = (3 // 8) / (pi * rs ^ 3)
        cse_tmp_2 = 1 / (2304 * 97.40909103400244)
        cse_tmp_3 = (5 // 648) * 1.8171205928321397 / 4.60115111447049
        cse_tmp_4 = cse_tmp_0 <= zeta_threshold
        cse_tmp_5 = zeta_threshold - 1
        cse_tmp_6 = 1 - z
        cse_tmp_7 = cse_tmp_6 <= zeta_threshold
        cse_tmp_8 = -cse_tmp_5
        cse_tmp_9 = my_piecewise5(cse_tmp_4, cse_tmp_5, cse_tmp_7, cse_tmp_8, z)
        cse_tmp_10 = NaNMath.pow(zeta_threshold, 1.6666666666666667) - 1
        cse_tmp_11 = (9 // 80) * 2.2894284851066637 * 2.1450293971110255 / rs ^ 2
        cse_tmp_12 = my_piecewise5(cse_tmp_7, cse_tmp_5, cse_tmp_4, cse_tmp_8, -z)
        my_piecewise3(cse_tmp_0 * cse_tmp_1 <= dens_threshold, 0, cse_tmp_11 * (cse_tmp_3 * xs0 ^ 2 / (cse_tmp_2 * xs0 ^ 6 + 1) + 1) * (my_piecewise3(cse_tmp_9 + 1 <= zeta_threshold, cse_tmp_10, xc_expm1((5 // 3) * xc_log1p(my_piecewise3(cse_tmp_9 > cse_tmp_5, cse_tmp_9, cse_tmp_5)))) + 1)) + my_piecewise3(cse_tmp_1 * cse_tmp_6 <= dens_threshold, 0, cse_tmp_11 * (cse_tmp_3 * xs1 ^ 2 / (cse_tmp_2 * xs1 ^ 6 + 1) + 1) * (my_piecewise3(cse_tmp_12 + 1 <= zeta_threshold, cse_tmp_10, xc_expm1((5 // 3) * xc_log1p(my_piecewise3(cse_tmp_12 > cse_tmp_5, cse_tmp_12, cse_tmp_5)))) + 1))
    end
end
export gga_k_pearson_energy

const gga_k_pearson_defaults = (dens_threshold = 1.0e-14, zeta_threshold = 2.220446049250313e-16)
const gga_k_pearson_required = ()

function gga_k_pearson(rho, sigma; params = NamedTuple())
    p = resolve_params(gga_k_pearson_defaults, gga_k_pearson_required, params)
    v = gga_variables(rho, sigma, Val(3))
    return gga_k_pearson_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.dens_threshold, p.zeta_threshold)
end

function gga_k_pearson(na, nb, gaa, gab, gbb; params = NamedTuple())
    p = resolve_params(gga_k_pearson_defaults, gga_k_pearson_required, params)
    v = gga_variables(na, nb, gaa, gab, gbb, Val(3))
    return gga_k_pearson_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.dens_threshold, p.zeta_threshold)
end

export gga_k_pearson, gga_k_pearson_defaults, gga_k_pearson_required
