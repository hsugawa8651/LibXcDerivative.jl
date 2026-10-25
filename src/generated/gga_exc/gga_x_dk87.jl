# Auto-generated from the Libxc sources
# python/gga_exc/gga_x_dk87.py -- do not edit by hand.
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
# args: rs, z, xt, xs0, xs1, dens_threshold, params_a_a1, params_a_alpha, params_a_b1, zeta_threshold
const gga_x_dk87_energy = function (rs, z, xt, xs0, xs1, dens_threshold, params_a_a1, params_a_alpha, params_a_b1, zeta_threshold)
    @inbounds begin
        cse_tmp_0 = z + 1
        cse_tmp_1 = (3 // 8) / (pi * rs ^ 3)
        cse_tmp_2 = xs0 ^ 2
        cse_tmp_3 = 0.00365660446653437 * 2.6207413942088964 / 6.738808595698141
        cse_tmp_4 = cse_tmp_0 <= zeta_threshold
        cse_tmp_5 = zeta_threshold - 1
        cse_tmp_6 = 1 - z
        cse_tmp_7 = cse_tmp_6 <= zeta_threshold
        cse_tmp_8 = -cse_tmp_5
        cse_tmp_9 = my_piecewise5(cse_tmp_4, cse_tmp_5, cse_tmp_7, cse_tmp_8, z) + 1
        cse_tmp_10 = NaNMath.pow(zeta_threshold, 1.3333333333333333)
        cse_tmp_11 = 0.184639691595506 * 1.8171205928321397 / (1.4645918875615234 * rs)
        cse_tmp_12 = xs1 ^ 2
        cse_tmp_13 = my_piecewise5(cse_tmp_7, cse_tmp_5, cse_tmp_4, cse_tmp_8, -z) + 1
        my_piecewise3(cse_tmp_0 * cse_tmp_1 <= dens_threshold, 0, -cse_tmp_11 * (cse_tmp_2 * cse_tmp_3 * (params_a_a1 * NaNMath.pow(xs0, params_a_alpha) + 1) / (cse_tmp_2 * params_a_b1 + 1) + 1) * my_piecewise3(cse_tmp_9 <= zeta_threshold, cse_tmp_10, NaNMath.pow(cse_tmp_9, 1.3333333333333333))) + my_piecewise3(cse_tmp_1 * cse_tmp_6 <= dens_threshold, 0, -cse_tmp_11 * (cse_tmp_12 * cse_tmp_3 * (params_a_a1 * NaNMath.pow(xs1, params_a_alpha) + 1) / (cse_tmp_12 * params_a_b1 + 1) + 1) * my_piecewise3(cse_tmp_13 <= zeta_threshold, cse_tmp_10, NaNMath.pow(cse_tmp_13, 1.3333333333333333)))
    end
end
export gga_x_dk87_energy

const gga_x_dk87_defaults = NamedTuple()
const gga_x_dk87_required = (:dens_threshold, :params_a_a1, :params_a_alpha, :params_a_b1, :zeta_threshold)

function gga_x_dk87(rho, sigma; params = NamedTuple())
    p = resolve_params(gga_x_dk87_defaults, gga_x_dk87_required, params)
    v = gga_variables(rho, sigma, Val(3))
    return gga_x_dk87_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.dens_threshold, p.params_a_a1, p.params_a_alpha, p.params_a_b1, p.zeta_threshold)
end

function gga_x_dk87(na, nb, gaa, gab, gbb; params = NamedTuple())
    p = resolve_params(gga_x_dk87_defaults, gga_x_dk87_required, params)
    v = gga_variables(na, nb, gaa, gab, gbb, Val(3))
    return gga_x_dk87_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.dens_threshold, p.params_a_a1, p.params_a_alpha, p.params_a_b1, p.zeta_threshold)
end

export gga_x_dk87, gga_x_dk87_defaults, gga_x_dk87_required

const gga_x_dk87_r1_defaults = (dens_threshold = 1.0e-15, params_a_a1 = 0.861504, params_a_alpha = 1.0, params_a_b1 = 0.044286, zeta_threshold = 2.220446049250313e-16)
const gga_x_dk87_r1_required = ()

function gga_x_dk87_r1(rho, sigma; params = NamedTuple())
    p = resolve_params(gga_x_dk87_r1_defaults, gga_x_dk87_r1_required, params)
    v = gga_variables(rho, sigma, Val(3))
    return gga_x_dk87_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.dens_threshold, p.params_a_a1, p.params_a_alpha, p.params_a_b1, p.zeta_threshold)
end

function gga_x_dk87_r1(na, nb, gaa, gab, gbb; params = NamedTuple())
    p = resolve_params(gga_x_dk87_r1_defaults, gga_x_dk87_r1_required, params)
    v = gga_variables(na, nb, gaa, gab, gbb, Val(3))
    return gga_x_dk87_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.dens_threshold, p.params_a_a1, p.params_a_alpha, p.params_a_b1, p.zeta_threshold)
end

export gga_x_dk87_r1, gga_x_dk87_r1_defaults, gga_x_dk87_r1_required

const gga_x_dk87_r2_defaults = (dens_threshold = 1.0e-15, params_a_a1 = 0.861213, params_a_alpha = 0.98, params_a_b1 = 0.042076, zeta_threshold = 2.220446049250313e-16)
const gga_x_dk87_r2_required = ()

function gga_x_dk87_r2(rho, sigma; params = NamedTuple())
    p = resolve_params(gga_x_dk87_r2_defaults, gga_x_dk87_r2_required, params)
    v = gga_variables(rho, sigma, Val(3))
    return gga_x_dk87_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.dens_threshold, p.params_a_a1, p.params_a_alpha, p.params_a_b1, p.zeta_threshold)
end

function gga_x_dk87_r2(na, nb, gaa, gab, gbb; params = NamedTuple())
    p = resolve_params(gga_x_dk87_r2_defaults, gga_x_dk87_r2_required, params)
    v = gga_variables(na, nb, gaa, gab, gbb, Val(3))
    return gga_x_dk87_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.dens_threshold, p.params_a_a1, p.params_a_alpha, p.params_a_b1, p.zeta_threshold)
end

export gga_x_dk87_r2, gga_x_dk87_r2_defaults, gga_x_dk87_r2_required
