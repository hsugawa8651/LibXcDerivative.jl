# Auto-generated from the Libxc sources
# python/gga_exc/gga_x_g96.py -- do not edit by hand.
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
# args: rs, z, xt, xs0, xs1, dens_threshold, zeta_threshold
const gga_x_g96_energy = function (rs, z, xt, xs0, xs1, dens_threshold, zeta_threshold)
    @inbounds begin
        cse_tmp_0 = z + 1
        cse_tmp_1 = (3 // 8) / (pi * rs ^ 3)
        cse_tmp_2 = 0.00494156349179202 * 1.5874010519681994
        cse_tmp_3 = cse_tmp_0 <= zeta_threshold
        cse_tmp_4 = zeta_threshold - 1
        cse_tmp_5 = 1 - z
        cse_tmp_6 = cse_tmp_5 <= zeta_threshold
        cse_tmp_7 = -cse_tmp_4
        cse_tmp_8 = my_piecewise5(cse_tmp_3, cse_tmp_4, cse_tmp_6, cse_tmp_7, z) + 1
        cse_tmp_9 = NaNMath.pow(zeta_threshold, 1.3333333333333333)
        cse_tmp_10 = 0.184639691595506 * 1.8171205928321397 / (1.4645918875615234 * rs)
        cse_tmp_11 = my_piecewise5(cse_tmp_6, cse_tmp_4, cse_tmp_3, cse_tmp_7, -z) + 1
        my_piecewise3(cse_tmp_0 * cse_tmp_1 <= dens_threshold, 0, -cse_tmp_10 * (cse_tmp_2 * NaNMath.pow(xs0, 1.5) + 1) * my_piecewise3(cse_tmp_8 <= zeta_threshold, cse_tmp_9, NaNMath.pow(cse_tmp_8, 1.3333333333333333))) + my_piecewise3(cse_tmp_1 * cse_tmp_5 <= dens_threshold, 0, -cse_tmp_10 * (cse_tmp_2 * NaNMath.pow(xs1, 1.5) + 1) * my_piecewise3(cse_tmp_11 <= zeta_threshold, cse_tmp_9, NaNMath.pow(cse_tmp_11, 1.3333333333333333)))
    end
end
export gga_x_g96_energy

const gga_x_g96_defaults = (dens_threshold = 1.0e-15, zeta_threshold = 2.220446049250313e-16)
const gga_x_g96_required = ()

function gga_x_g96(rho, sigma; params = NamedTuple())
    p = resolve_params(gga_x_g96_defaults, gga_x_g96_required, params)
    v = gga_variables(rho, sigma, Val(3))
    return gga_x_g96_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.dens_threshold, p.zeta_threshold)
end

function gga_x_g96(na, nb, gaa, gab, gbb; params = NamedTuple())
    p = resolve_params(gga_x_g96_defaults, gga_x_g96_required, params)
    v = gga_variables(na, nb, gaa, gab, gbb, Val(3))
    return gga_x_g96_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.dens_threshold, p.zeta_threshold)
end

export gga_x_g96, gga_x_g96_defaults, gga_x_g96_required
