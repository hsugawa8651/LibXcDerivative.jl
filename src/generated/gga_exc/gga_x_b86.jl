# Auto-generated from the Libxc sources
# python/gga_exc/gga_x_b86.py -- do not edit by hand.
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
# args: rs, z, xt, xs0, xs1, dens_threshold, params_a_beta, params_a_gamma, params_a_omega, zeta_threshold
const gga_x_b86_energy = function (rs, z, xt, xs0, xs1, dens_threshold, params_a_beta, params_a_gamma, params_a_omega, zeta_threshold)
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
        cse_tmp_9 = NaNMath.pow(zeta_threshold, 1.3333333333333333)
        cse_tmp_10 = 0.184639691595506 * 1.8171205928321397 / (1.4645918875615234 * rs)
        cse_tmp_11 = xs1 ^ 2
        cse_tmp_12 = my_piecewise5(cse_tmp_6, cse_tmp_4, cse_tmp_3, cse_tmp_7, -z) + 1
        my_piecewise3(cse_tmp_0 * cse_tmp_1 <= dens_threshold, 0, -cse_tmp_10 * (cse_tmp_2 * params_a_beta * NaNMath.pow(cse_tmp_2 * params_a_gamma + 1, -params_a_omega) + 1) * my_piecewise3(cse_tmp_8 <= zeta_threshold, cse_tmp_9, NaNMath.pow(cse_tmp_8, 1.3333333333333333))) + my_piecewise3(cse_tmp_1 * cse_tmp_5 <= dens_threshold, 0, -cse_tmp_10 * (cse_tmp_11 * params_a_beta * NaNMath.pow(cse_tmp_11 * params_a_gamma + 1, -params_a_omega) + 1) * my_piecewise3(cse_tmp_12 <= zeta_threshold, cse_tmp_9, NaNMath.pow(cse_tmp_12, 1.3333333333333333)))
    end
end
export gga_x_b86_energy

const gga_x_b86_defaults = (dens_threshold = 1.0e-15, params_a_beta = 0.003868780689639527, params_a_gamma = 0.004, params_a_omega = 1.0, zeta_threshold = 2.220446049250313e-16)
const gga_x_b86_required = ()

function gga_x_b86(rho, sigma; params = NamedTuple())
    p = resolve_params(gga_x_b86_defaults, gga_x_b86_required, params)
    v = gga_variables(rho, sigma, Val(3))
    return gga_x_b86_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.dens_threshold, p.params_a_beta, p.params_a_gamma, p.params_a_omega, p.zeta_threshold)
end

function gga_x_b86(na, nb, gaa, gab, gbb; params = NamedTuple())
    p = resolve_params(gga_x_b86_defaults, gga_x_b86_required, params)
    v = gga_variables(na, nb, gaa, gab, gbb, Val(3))
    return gga_x_b86_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.dens_threshold, p.params_a_beta, p.params_a_gamma, p.params_a_omega, p.zeta_threshold)
end

export gga_x_b86, gga_x_b86_defaults, gga_x_b86_required

const gga_x_b86_mgc_defaults = (dens_threshold = 1.0e-15, params_a_beta = 0.0040299798850411735, params_a_gamma = 0.007, params_a_omega = 0.8, zeta_threshold = 2.220446049250313e-16)
const gga_x_b86_mgc_required = ()

function gga_x_b86_mgc(rho, sigma; params = NamedTuple())
    p = resolve_params(gga_x_b86_mgc_defaults, gga_x_b86_mgc_required, params)
    v = gga_variables(rho, sigma, Val(3))
    return gga_x_b86_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.dens_threshold, p.params_a_beta, p.params_a_gamma, p.params_a_omega, p.zeta_threshold)
end

function gga_x_b86_mgc(na, nb, gaa, gab, gbb; params = NamedTuple())
    p = resolve_params(gga_x_b86_mgc_defaults, gga_x_b86_mgc_required, params)
    v = gga_variables(na, nb, gaa, gab, gbb, Val(3))
    return gga_x_b86_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.dens_threshold, p.params_a_beta, p.params_a_gamma, p.params_a_omega, p.zeta_threshold)
end

export gga_x_b86_mgc, gga_x_b86_mgc_defaults, gga_x_b86_mgc_required

const gga_x_b86_r_defaults = (dens_threshold = 1.0e-15, params_a_beta = 0.002031519487163032, params_a_gamma = 0.0028556641652558784, params_a_omega = 0.8, zeta_threshold = 2.220446049250313e-16)
const gga_x_b86_r_required = ()

function gga_x_b86_r(rho, sigma; params = NamedTuple())
    p = resolve_params(gga_x_b86_r_defaults, gga_x_b86_r_required, params)
    v = gga_variables(rho, sigma, Val(3))
    return gga_x_b86_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.dens_threshold, p.params_a_beta, p.params_a_gamma, p.params_a_omega, p.zeta_threshold)
end

function gga_x_b86_r(na, nb, gaa, gab, gbb; params = NamedTuple())
    p = resolve_params(gga_x_b86_r_defaults, gga_x_b86_r_required, params)
    v = gga_variables(na, nb, gaa, gab, gbb, Val(3))
    return gga_x_b86_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.dens_threshold, p.params_a_beta, p.params_a_gamma, p.params_a_omega, p.zeta_threshold)
end

export gga_x_b86_r, gga_x_b86_r_defaults, gga_x_b86_r_required

const gga_x_df3_opt2_defaults = (dens_threshold = 1.0e-15, params_a_beta = 0.002031519487163032, params_a_gamma = 0.0035026198054535036, params_a_omega = 0.8, zeta_threshold = 2.220446049250313e-16)
const gga_x_df3_opt2_required = ()

function gga_x_df3_opt2(rho, sigma; params = NamedTuple())
    p = resolve_params(gga_x_df3_opt2_defaults, gga_x_df3_opt2_required, params)
    v = gga_variables(rho, sigma, Val(3))
    return gga_x_b86_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.dens_threshold, p.params_a_beta, p.params_a_gamma, p.params_a_omega, p.zeta_threshold)
end

function gga_x_df3_opt2(na, nb, gaa, gab, gbb; params = NamedTuple())
    p = resolve_params(gga_x_df3_opt2_defaults, gga_x_df3_opt2_required, params)
    v = gga_variables(na, nb, gaa, gab, gbb, Val(3))
    return gga_x_b86_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.dens_threshold, p.params_a_beta, p.params_a_gamma, p.params_a_omega, p.zeta_threshold)
end

export gga_x_df3_opt2, gga_x_df3_opt2_defaults, gga_x_df3_opt2_required

const gga_x_optb86b_vdw_defaults = (dens_threshold = 1.0e-15, params_a_beta = 0.002031519487163032, params_a_gamma = 0.002031519487163032, params_a_omega = 0.8, zeta_threshold = 2.220446049250313e-16)
const gga_x_optb86b_vdw_required = ()

function gga_x_optb86b_vdw(rho, sigma; params = NamedTuple())
    p = resolve_params(gga_x_optb86b_vdw_defaults, gga_x_optb86b_vdw_required, params)
    v = gga_variables(rho, sigma, Val(3))
    return gga_x_b86_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.dens_threshold, p.params_a_beta, p.params_a_gamma, p.params_a_omega, p.zeta_threshold)
end

function gga_x_optb86b_vdw(na, nb, gaa, gab, gbb; params = NamedTuple())
    p = resolve_params(gga_x_optb86b_vdw_defaults, gga_x_optb86b_vdw_required, params)
    v = gga_variables(na, nb, gaa, gab, gbb, Val(3))
    return gga_x_b86_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.dens_threshold, p.params_a_beta, p.params_a_gamma, p.params_a_omega, p.zeta_threshold)
end

export gga_x_optb86b_vdw, gga_x_optb86b_vdw_defaults, gga_x_optb86b_vdw_required
