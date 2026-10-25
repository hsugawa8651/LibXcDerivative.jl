# Auto-generated from the Libxc sources
# python/gga_exc/gga_x_ft97.py -- do not edit by hand.
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
# args: rs, z, xt, xs0, xs1, dens_threshold, params_a_beta0, params_a_beta1, params_a_beta2, zeta_threshold
const gga_x_ft97_energy = function (rs, z, xt, xs0, xs1, dens_threshold, params_a_beta0, params_a_beta1, params_a_beta2, zeta_threshold)
    @inbounds begin
        cse_tmp_0 = z + 1
        cse_tmp_1 = (3 // 8) / (pi * rs ^ 3)
        cse_tmp_2 = xs0 ^ 2
        cse_tmp_3 = cse_tmp_0 <= zeta_threshold
        cse_tmp_4 = zeta_threshold - 1
        cse_tmp_5 = 1 - z
        cse_tmp_6 = cse_tmp_5 <= zeta_threshold
        cse_tmp_7 = -cse_tmp_4
        cse_tmp_8 = my_piecewise5(cse_tmp_3, cse_tmp_4, cse_tmp_6, cse_tmp_7, z) + 1
        cse_tmp_9 = (9 // 256) * 2.080083823051904 / (21.170591578193033 * rs ^ 8)
        cse_tmp_10 = cse_tmp_2 * NaNMath.pow(cse_tmp_8, 2.6666666666666665) * cse_tmp_9
        cse_tmp_11 = cse_tmp_10 * params_a_beta1 / (cse_tmp_10 + params_a_beta2) + params_a_beta0
        cse_tmp_12 = 0.676994198375506 * 1.5874010519681994
        cse_tmp_13 = NaNMath.pow(zeta_threshold, 1.3333333333333333)
        cse_tmp_14 = 0.184639691595506 * 1.8171205928321397 / (1.4645918875615234 * rs)
        cse_tmp_15 = xs1 ^ 2
        cse_tmp_16 = my_piecewise5(cse_tmp_6, cse_tmp_4, cse_tmp_3, cse_tmp_7, -z) + 1
        cse_tmp_17 = cse_tmp_15 * NaNMath.pow(cse_tmp_16, 2.6666666666666665) * cse_tmp_9
        cse_tmp_18 = cse_tmp_17 * params_a_beta1 / (cse_tmp_17 + params_a_beta2) + params_a_beta0
        my_piecewise3(cse_tmp_0 * cse_tmp_1 <= dens_threshold, 0, -cse_tmp_14 * (cse_tmp_11 * cse_tmp_12 * cse_tmp_2 / NaNMath.sqrt(9 * cse_tmp_11 ^ 2 * cse_tmp_2 * xc_asinh(cse_tmp_2) ^ 2 + 1) + 1) * my_piecewise3(cse_tmp_8 <= zeta_threshold, cse_tmp_13, NaNMath.pow(cse_tmp_8, 1.3333333333333333))) + my_piecewise3(cse_tmp_1 * cse_tmp_5 <= dens_threshold, 0, -cse_tmp_14 * (cse_tmp_12 * cse_tmp_15 * cse_tmp_18 / NaNMath.sqrt(9 * cse_tmp_15 * cse_tmp_18 ^ 2 * xc_asinh(cse_tmp_15) ^ 2 + 1) + 1) * my_piecewise3(cse_tmp_16 <= zeta_threshold, cse_tmp_13, NaNMath.pow(cse_tmp_16, 1.3333333333333333)))
    end
end
export gga_x_ft97_energy

const gga_x_ft97_defaults = NamedTuple()
const gga_x_ft97_required = (:dens_threshold, :params_a_beta0, :params_a_beta1, :params_a_beta2, :zeta_threshold)

function gga_x_ft97(rho, sigma; params = NamedTuple())
    p = resolve_params(gga_x_ft97_defaults, gga_x_ft97_required, params)
    v = gga_variables(rho, sigma, Val(3))
    return gga_x_ft97_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.dens_threshold, p.params_a_beta0, p.params_a_beta1, p.params_a_beta2, p.zeta_threshold)
end

function gga_x_ft97(na, nb, gaa, gab, gbb; params = NamedTuple())
    p = resolve_params(gga_x_ft97_defaults, gga_x_ft97_required, params)
    v = gga_variables(na, nb, gaa, gab, gbb, Val(3))
    return gga_x_ft97_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.dens_threshold, p.params_a_beta0, p.params_a_beta1, p.params_a_beta2, p.zeta_threshold)
end

export gga_x_ft97, gga_x_ft97_defaults, gga_x_ft97_required

const gga_x_ft97_a_defaults = (dens_threshold = 1.0e-15, params_a_beta0 = 0.00293, params_a_beta1 = 0.0, params_a_beta2 = 0.0, zeta_threshold = 2.220446049250313e-16)
const gga_x_ft97_a_required = ()

function gga_x_ft97_a(rho, sigma; params = NamedTuple())
    p = resolve_params(gga_x_ft97_a_defaults, gga_x_ft97_a_required, params)
    v = gga_variables(rho, sigma, Val(3))
    return gga_x_ft97_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.dens_threshold, p.params_a_beta0, p.params_a_beta1, p.params_a_beta2, p.zeta_threshold)
end

function gga_x_ft97_a(na, nb, gaa, gab, gbb; params = NamedTuple())
    p = resolve_params(gga_x_ft97_a_defaults, gga_x_ft97_a_required, params)
    v = gga_variables(na, nb, gaa, gab, gbb, Val(3))
    return gga_x_ft97_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.dens_threshold, p.params_a_beta0, p.params_a_beta1, p.params_a_beta2, p.zeta_threshold)
end

export gga_x_ft97_a, gga_x_ft97_a_defaults, gga_x_ft97_a_required

const gga_x_ft97_b_defaults = (dens_threshold = 1.0e-15, params_a_beta0 = 0.002913644, params_a_beta1 = 0.0009474169, params_a_beta2 = 6.255746320201e6, zeta_threshold = 2.220446049250313e-16)
const gga_x_ft97_b_required = ()

function gga_x_ft97_b(rho, sigma; params = NamedTuple())
    p = resolve_params(gga_x_ft97_b_defaults, gga_x_ft97_b_required, params)
    v = gga_variables(rho, sigma, Val(3))
    return gga_x_ft97_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.dens_threshold, p.params_a_beta0, p.params_a_beta1, p.params_a_beta2, p.zeta_threshold)
end

function gga_x_ft97_b(na, nb, gaa, gab, gbb; params = NamedTuple())
    p = resolve_params(gga_x_ft97_b_defaults, gga_x_ft97_b_required, params)
    v = gga_variables(na, nb, gaa, gab, gbb, Val(3))
    return gga_x_ft97_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.dens_threshold, p.params_a_beta0, p.params_a_beta1, p.params_a_beta2, p.zeta_threshold)
end

export gga_x_ft97_b, gga_x_ft97_b_defaults, gga_x_ft97_b_required
