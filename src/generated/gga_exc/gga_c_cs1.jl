# Auto-generated from the Libxc sources
# python/gga_exc/gga_c_cs1.py -- do not edit by hand.
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
# args: rs, z, xt, xs0, xs1, zeta_threshold
const gga_c_cs1_energy = function (rs, z, xt, xs0, xs1, zeta_threshold)
    @inbounds begin
        cse_tmp_0 = z + 1
        cse_tmp_1 = 1 - z
        cse_tmp_2 = 1.4645918875615234
        cse_tmp_3 = 1.4422495703074083 / (2 * cse_tmp_2 * rs)
        cse_tmp_4 = NaNMath.pow(cse_tmp_0, 0.3333333333333333) * cse_tmp_3
        cse_tmp_5 = zeta_threshold - 1
        cse_tmp_6 = NaNMath.pow(cse_tmp_1, 0.3333333333333333) * cse_tmp_3
        cse_tmp_7 = -z
        cse_tmp_0 * cse_tmp_1 * (2.86308e-7 * xt ^ 4 / (0.006 * xt ^ 2 + 1) ^ 2 - 0.159068) / (4 * (0.116333333333333 * 3.3019272488946267 * cse_tmp_2 * rs + 1)) + cse_tmp_4 * (5.58864e-6 * xs0 ^ 4 / (0.006 * xs0 ^ 2 + 1) ^ 2 - 0.018897) * (my_piecewise3(cse_tmp_0 <= zeta_threshold, cse_tmp_5, xc_expm1(xc_log1p(my_piecewise3(z > cse_tmp_5, z, cse_tmp_5)))) / 2 + 1 // 2) / (cse_tmp_4 + 0.349) + cse_tmp_6 * (5.58864e-6 * xs1 ^ 4 / (0.006 * xs1 ^ 2 + 1) ^ 2 - 0.018897) * (my_piecewise3(cse_tmp_1 <= zeta_threshold, cse_tmp_5, xc_expm1(xc_log1p(my_piecewise3(cse_tmp_7 > cse_tmp_5, cse_tmp_7, cse_tmp_5)))) / 2 + 1 // 2) / (cse_tmp_6 + 0.349)
    end
end
export gga_c_cs1_energy

const gga_c_cs1_defaults = (zeta_threshold = 2.220446049250313e-16,)
const gga_c_cs1_required = ()

function gga_c_cs1(rho, sigma; params = NamedTuple())
    p = resolve_params(gga_c_cs1_defaults, gga_c_cs1_required, params)
    v = gga_variables(rho, sigma, Val(3))
    return gga_c_cs1_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.zeta_threshold)
end

function gga_c_cs1(na, nb, gaa, gab, gbb; params = NamedTuple())
    p = resolve_params(gga_c_cs1_defaults, gga_c_cs1_required, params)
    v = gga_variables(na, nb, gaa, gab, gbb, Val(3))
    return gga_c_cs1_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.zeta_threshold)
end

export gga_c_cs1, gga_c_cs1_defaults, gga_c_cs1_required
