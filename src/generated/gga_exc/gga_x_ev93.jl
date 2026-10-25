# Auto-generated from the Libxc sources
# python/gga_exc/gga_x_ev93.py -- do not edit by hand.
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
# args: rs, z, xt, xs0, xs1, dens_threshold, params_a_a1, params_a_a2, params_a_a3, params_a_b1, params_a_b2, params_a_b3, zeta_threshold
const gga_x_ev93_energy = function (rs, z, xt, xs0, xs1, dens_threshold, params_a_a1, params_a_a2, params_a_a3, params_a_b1, params_a_b2, params_a_b3, zeta_threshold)
    @inbounds begin
        cse_tmp_0 = z + 1
        cse_tmp_1 = (3 // 8) / (pi * rs ^ 3)
        cse_tmp_2 = 1 / (2304 * 97.40909103400244)
        cse_tmp_3 = cse_tmp_2 * xs0 ^ 6
        cse_tmp_4 = 1.8171205928321397
        cse_tmp_5 = cse_tmp_4 / (24 * 4.60115111447049)
        cse_tmp_6 = cse_tmp_5 * xs0 ^ 2
        cse_tmp_7 = 3.3019272488946267 / (576 * 21.170591578193033)
        cse_tmp_8 = cse_tmp_7 * xs0 ^ 4
        cse_tmp_9 = cse_tmp_0 <= zeta_threshold
        cse_tmp_10 = zeta_threshold - 1
        cse_tmp_11 = 1 - z
        cse_tmp_12 = cse_tmp_11 <= zeta_threshold
        cse_tmp_13 = -cse_tmp_10
        cse_tmp_14 = my_piecewise5(cse_tmp_9, cse_tmp_10, cse_tmp_12, cse_tmp_13, z) + 1
        cse_tmp_15 = NaNMath.pow(zeta_threshold, 1.3333333333333333)
        cse_tmp_16 = 0.184639691595506 * cse_tmp_4 / (1.4645918875615234 * rs)
        cse_tmp_17 = cse_tmp_2 * xs1 ^ 6
        cse_tmp_18 = cse_tmp_5 * xs1 ^ 2
        cse_tmp_19 = cse_tmp_7 * xs1 ^ 4
        cse_tmp_20 = my_piecewise5(cse_tmp_12, cse_tmp_10, cse_tmp_9, cse_tmp_13, -z) + 1
        my_piecewise3(cse_tmp_0 * cse_tmp_1 <= dens_threshold, 0, -cse_tmp_16 * (cse_tmp_3 * params_a_a3 + cse_tmp_6 * params_a_a1 + cse_tmp_8 * params_a_a2 + 1) * my_piecewise3(cse_tmp_14 <= zeta_threshold, cse_tmp_15, NaNMath.pow(cse_tmp_14, 1.3333333333333333)) / (cse_tmp_3 * params_a_b3 + cse_tmp_6 * params_a_b1 + cse_tmp_8 * params_a_b2 + 1)) + my_piecewise3(cse_tmp_1 * cse_tmp_11 <= dens_threshold, 0, -cse_tmp_16 * (cse_tmp_17 * params_a_a3 + cse_tmp_18 * params_a_a1 + cse_tmp_19 * params_a_a2 + 1) * my_piecewise3(cse_tmp_20 <= zeta_threshold, cse_tmp_15, NaNMath.pow(cse_tmp_20, 1.3333333333333333)) / (cse_tmp_17 * params_a_b3 + cse_tmp_18 * params_a_b1 + cse_tmp_19 * params_a_b2 + 1))
    end
end
export gga_x_ev93_energy

const gga_x_ev93_defaults = (dens_threshold = 1.0e-15, params_a_a1 = 1.647127, params_a_a2 = 0.980118, params_a_a3 = 0.017399, params_a_b1 = 1.523671, params_a_b2 = 0.367229, params_a_b3 = 0.011282, zeta_threshold = 2.220446049250313e-16)
const gga_x_ev93_required = ()

function gga_x_ev93(rho, sigma; params = NamedTuple())
    p = resolve_params(gga_x_ev93_defaults, gga_x_ev93_required, params)
    v = gga_variables(rho, sigma, Val(3))
    return gga_x_ev93_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.dens_threshold, p.params_a_a1, p.params_a_a2, p.params_a_a3, p.params_a_b1, p.params_a_b2, p.params_a_b3, p.zeta_threshold)
end

function gga_x_ev93(na, nb, gaa, gab, gbb; params = NamedTuple())
    p = resolve_params(gga_x_ev93_defaults, gga_x_ev93_required, params)
    v = gga_variables(na, nb, gaa, gab, gbb, Val(3))
    return gga_x_ev93_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.dens_threshold, p.params_a_a1, p.params_a_a2, p.params_a_a3, p.params_a_b1, p.params_a_b2, p.params_a_b3, p.zeta_threshold)
end

export gga_x_ev93, gga_x_ev93_defaults, gga_x_ev93_required

const gga_x_ecmv92_defaults = (dens_threshold = 1.0e-15, params_a_a1 = 27.8428, params_a_a2 = 11.7683, params_a_a3 = 0.0, params_a_b1 = 27.5026, params_a_b2 = 5.7728, params_a_b3 = 0.0, zeta_threshold = 2.220446049250313e-16)
const gga_x_ecmv92_required = ()

function gga_x_ecmv92(rho, sigma; params = NamedTuple())
    p = resolve_params(gga_x_ecmv92_defaults, gga_x_ecmv92_required, params)
    v = gga_variables(rho, sigma, Val(3))
    return gga_x_ev93_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.dens_threshold, p.params_a_a1, p.params_a_a2, p.params_a_a3, p.params_a_b1, p.params_a_b2, p.params_a_b3, p.zeta_threshold)
end

function gga_x_ecmv92(na, nb, gaa, gab, gbb; params = NamedTuple())
    p = resolve_params(gga_x_ecmv92_defaults, gga_x_ecmv92_required, params)
    v = gga_variables(na, nb, gaa, gab, gbb, Val(3))
    return gga_x_ev93_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.dens_threshold, p.params_a_a1, p.params_a_a2, p.params_a_a3, p.params_a_b1, p.params_a_b2, p.params_a_b3, p.zeta_threshold)
end

export gga_x_ecmv92, gga_x_ecmv92_defaults, gga_x_ecmv92_required
