# Auto-generated from the Libxc sources
# python/gga_exc/gga_x_2d_pbe.py -- do not edit by hand.
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
# args: rs, z, xt, xs0, xs1, dens_threshold, zeta_threshold
const gga_x_2d_pbe_energy = function (rs, z, xt, xs0, xs1, dens_threshold, zeta_threshold)
    @inbounds begin
        cse_tmp_0 = z + 1
        cse_tmp_1 = 0.3183098861837907
        cse_tmp_2 = cse_tmp_1 / (2 * rs ^ 2)
        cse_tmp_3 = xs0 ^ 2
        cse_tmp_4 = 0.0221591796875 * cse_tmp_1
        cse_tmp_5 = 0.010202086328125 * cse_tmp_1
        cse_tmp_6 = cse_tmp_0 <= zeta_threshold
        cse_tmp_7 = zeta_threshold - 1
        cse_tmp_8 = 1 - z
        cse_tmp_9 = cse_tmp_8 <= zeta_threshold
        cse_tmp_10 = -cse_tmp_7
        cse_tmp_11 = my_piecewise5(cse_tmp_6, cse_tmp_7, cse_tmp_9, cse_tmp_10, z)
        cse_tmp_12 = NaNMath.pow(zeta_threshold, 1.5) - 1
        cse_tmp_13 = (2 // 3) * 1.4142135623730951 * cse_tmp_1 / rs
        cse_tmp_14 = xs1 ^ 2
        cse_tmp_15 = my_piecewise5(cse_tmp_9, cse_tmp_7, cse_tmp_6, cse_tmp_10, -z)
        my_piecewise3(cse_tmp_0 * cse_tmp_2 <= dens_threshold, 0, -cse_tmp_13 * (cse_tmp_3 * cse_tmp_5 / (cse_tmp_3 * cse_tmp_4 + 0.4604) + 1) * (my_piecewise3(cse_tmp_11 + 1 <= zeta_threshold, cse_tmp_12, xc_expm1((3 // 2) * xc_log1p(my_piecewise3(cse_tmp_11 > cse_tmp_7, cse_tmp_11, cse_tmp_7)))) + 1)) + my_piecewise3(cse_tmp_2 * cse_tmp_8 <= dens_threshold, 0, -cse_tmp_13 * (cse_tmp_14 * cse_tmp_5 / (cse_tmp_14 * cse_tmp_4 + 0.4604) + 1) * (my_piecewise3(cse_tmp_15 + 1 <= zeta_threshold, cse_tmp_12, xc_expm1((3 // 2) * xc_log1p(my_piecewise3(cse_tmp_15 > cse_tmp_7, cse_tmp_15, cse_tmp_7)))) + 1))
    end
end
export gga_x_2d_pbe_energy

const gga_x_2d_pbe_defaults = (dens_threshold = 1.0e-15, zeta_threshold = 2.220446049250313e-16)
const gga_x_2d_pbe_required = ()

function gga_x_2d_pbe(rho, sigma; params = NamedTuple())
    p = resolve_params(gga_x_2d_pbe_defaults, gga_x_2d_pbe_required, params)
    v = gga_variables(rho, sigma, Val(2))
    return gga_x_2d_pbe_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.dens_threshold, p.zeta_threshold)
end

function gga_x_2d_pbe(na, nb, gaa, gab, gbb; params = NamedTuple())
    p = resolve_params(gga_x_2d_pbe_defaults, gga_x_2d_pbe_required, params)
    v = gga_variables(na, nb, gaa, gab, gbb, Val(2))
    return gga_x_2d_pbe_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.dens_threshold, p.zeta_threshold)
end

export gga_x_2d_pbe, gga_x_2d_pbe_defaults, gga_x_2d_pbe_required
