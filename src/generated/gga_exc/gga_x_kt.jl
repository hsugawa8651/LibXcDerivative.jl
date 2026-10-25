# Auto-generated from the Libxc sources
# python/gga_exc/gga_x_kt.py -- do not edit by hand.
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
# args: rs, z, xt, xs0, xs1, dens_threshold, params_a_delta, params_a_gamma, zeta_threshold
const gga_x_kt_energy = function (rs, z, xt, xs0, xs1, dens_threshold, params_a_delta, params_a_gamma, zeta_threshold)
    @inbounds begin
        cse_tmp_0 = z + 1
        cse_tmp_1 = (3 // 8) / (pi * rs ^ 3)
        cse_tmp_2 = cse_tmp_0 <= zeta_threshold
        cse_tmp_3 = zeta_threshold - 1
        cse_tmp_4 = 1 - z
        cse_tmp_5 = cse_tmp_4 <= zeta_threshold
        cse_tmp_6 = -cse_tmp_3
        cse_tmp_7 = my_piecewise5(cse_tmp_2, cse_tmp_3, cse_tmp_5, cse_tmp_6, z) + 1
        cse_tmp_8 = NaNMath.pow(cse_tmp_7, 1.3333333333333333)
        cse_tmp_9 = 1.4422495703074083 / (4.60115111447049 * rs ^ 4)
        cse_tmp_10 = (3 // 16) * cse_tmp_9
        cse_tmp_11 = 0.126936412195407 * 1.5874010519681994 * cse_tmp_9 * params_a_gamma
        cse_tmp_12 = NaNMath.pow(zeta_threshold, 1.3333333333333333)
        cse_tmp_13 = 0.184639691595506 * 1.8171205928321397 / (1.4645918875615234 * rs)
        cse_tmp_14 = my_piecewise5(cse_tmp_5, cse_tmp_3, cse_tmp_2, cse_tmp_6, -z) + 1
        cse_tmp_15 = NaNMath.pow(cse_tmp_14, 1.3333333333333333)
        my_piecewise3(cse_tmp_0 * cse_tmp_1 <= dens_threshold, 0, -cse_tmp_13 * (-cse_tmp_11 * cse_tmp_8 * xs0 ^ 2 / (cse_tmp_10 * cse_tmp_8 + params_a_delta) + 1) * my_piecewise3(cse_tmp_7 <= zeta_threshold, cse_tmp_12, cse_tmp_8)) + my_piecewise3(cse_tmp_1 * cse_tmp_4 <= dens_threshold, 0, -cse_tmp_13 * (-cse_tmp_11 * cse_tmp_15 * xs1 ^ 2 / (cse_tmp_10 * cse_tmp_15 + params_a_delta) + 1) * my_piecewise3(cse_tmp_14 <= zeta_threshold, cse_tmp_12, cse_tmp_15))
    end
end
export gga_x_kt_energy

const gga_x_kt_defaults = NamedTuple()
const gga_x_kt_required = (:dens_threshold, :params_a_delta, :params_a_gamma, :zeta_threshold)

function gga_x_kt(rho, sigma; params = NamedTuple())
    p = resolve_params(gga_x_kt_defaults, gga_x_kt_required, params)
    v = gga_variables(rho, sigma, Val(3))
    return gga_x_kt_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.dens_threshold, p.params_a_delta, p.params_a_gamma, p.zeta_threshold)
end

function gga_x_kt(na, nb, gaa, gab, gbb; params = NamedTuple())
    p = resolve_params(gga_x_kt_defaults, gga_x_kt_required, params)
    v = gga_variables(na, nb, gaa, gab, gbb, Val(3))
    return gga_x_kt_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.dens_threshold, p.params_a_delta, p.params_a_gamma, p.zeta_threshold)
end

export gga_x_kt, gga_x_kt_defaults, gga_x_kt_required

const gga_x_kt1_defaults = (dens_threshold = 1.0e-15, params_a_delta = 0.1, params_a_gamma = -0.006, zeta_threshold = 2.220446049250313e-16)
const gga_x_kt1_required = ()

function gga_x_kt1(rho, sigma; params = NamedTuple())
    p = resolve_params(gga_x_kt1_defaults, gga_x_kt1_required, params)
    v = gga_variables(rho, sigma, Val(3))
    return gga_x_kt_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.dens_threshold, p.params_a_delta, p.params_a_gamma, p.zeta_threshold)
end

function gga_x_kt1(na, nb, gaa, gab, gbb; params = NamedTuple())
    p = resolve_params(gga_x_kt1_defaults, gga_x_kt1_required, params)
    v = gga_variables(na, nb, gaa, gab, gbb, Val(3))
    return gga_x_kt_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.dens_threshold, p.params_a_delta, p.params_a_gamma, p.zeta_threshold)
end

export gga_x_kt1, gga_x_kt1_defaults, gga_x_kt1_required
