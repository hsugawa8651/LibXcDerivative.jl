# Auto-generated from the Libxc sources
# python/gga_exc/gga_x_b88.py -- do not edit by hand.
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
# args: rs, z, xt, xs0, xs1, dens_threshold, params_a_beta, params_a_gamma, zeta_threshold
const gga_x_b88_energy = function (rs, z, xt, xs0, xs1, dens_threshold, params_a_beta, params_a_gamma, zeta_threshold)
    @inbounds begin
        cse_tmp_0 = z + 1
        cse_tmp_1 = (3 // 8) / (pi * rs ^ 3)
        cse_tmp_2 = xs0 ^ 2
        cse_tmp_3 = NaNMath.sqrt(my_piecewise3(cse_tmp_2 > 1 // 16, cse_tmp_2, 1 // 16))
        cse_tmp_4 = params_a_beta * params_a_gamma
        cse_tmp_5 = 0.676994198375506 * 1.5874010519681994 * params_a_beta
        cse_tmp_6 = cse_tmp_0 <= zeta_threshold
        cse_tmp_7 = zeta_threshold - 1
        cse_tmp_8 = 1 - z
        cse_tmp_9 = cse_tmp_8 <= zeta_threshold
        cse_tmp_10 = -cse_tmp_7
        cse_tmp_11 = my_piecewise5(cse_tmp_6, cse_tmp_7, cse_tmp_9, cse_tmp_10, z) + 1
        cse_tmp_12 = NaNMath.pow(zeta_threshold, 1.3333333333333333)
        cse_tmp_13 = 0.184639691595506 * 1.8171205928321397 / (1.4645918875615234 * rs)
        cse_tmp_14 = xs1 ^ 2
        cse_tmp_15 = NaNMath.sqrt(my_piecewise3(cse_tmp_14 > 1 // 16, cse_tmp_14, 1 // 16))
        cse_tmp_16 = my_piecewise5(cse_tmp_9, cse_tmp_7, cse_tmp_6, cse_tmp_10, -z) + 1
        my_piecewise3(cse_tmp_0 * cse_tmp_1 <= dens_threshold, 0, -cse_tmp_13 * (cse_tmp_2 * cse_tmp_5 / (cse_tmp_4 * my_piecewise3(cse_tmp_2 < 1 // 16, cse_tmp_2 - 1300075 // 226492416 * xs0 ^ 28 + (676039 // 104857600) * xs0 ^ 26 - 88179 // 12058624 * xs0 ^ 24 + (46189 // 5505024) * xs0 ^ 22 - 12155 // 1245184 * xs0 ^ 20 + (6435 // 557056) * xs0 ^ 18 - 143 // 10240 * xs0 ^ 16 + (231 // 13312) * xs0 ^ 14 - 63 // 2816 * xs0 ^ 12 + (35 // 1152) * xs0 ^ 10 - 5 // 112 * xs0 ^ 8 + (3 // 40) * xs0 ^ 6 - xs0 ^ 4 / 6, cse_tmp_3 * xc_asinh(cse_tmp_3)) + 1) + 1) * my_piecewise3(cse_tmp_11 <= zeta_threshold, cse_tmp_12, NaNMath.pow(cse_tmp_11, 1.3333333333333333))) + my_piecewise3(cse_tmp_1 * cse_tmp_8 <= dens_threshold, 0, -cse_tmp_13 * (cse_tmp_14 * cse_tmp_5 / (cse_tmp_4 * my_piecewise3(cse_tmp_14 < 1 // 16, cse_tmp_14 - 1300075 // 226492416 * xs1 ^ 28 + (676039 // 104857600) * xs1 ^ 26 - 88179 // 12058624 * xs1 ^ 24 + (46189 // 5505024) * xs1 ^ 22 - 12155 // 1245184 * xs1 ^ 20 + (6435 // 557056) * xs1 ^ 18 - 143 // 10240 * xs1 ^ 16 + (231 // 13312) * xs1 ^ 14 - 63 // 2816 * xs1 ^ 12 + (35 // 1152) * xs1 ^ 10 - 5 // 112 * xs1 ^ 8 + (3 // 40) * xs1 ^ 6 - xs1 ^ 4 / 6, cse_tmp_15 * xc_asinh(cse_tmp_15)) + 1) + 1) * my_piecewise3(cse_tmp_16 <= zeta_threshold, cse_tmp_12, NaNMath.pow(cse_tmp_16, 1.3333333333333333)))
    end
end
export gga_x_b88_energy

const gga_x_b88_defaults = (dens_threshold = 1.0e-15, params_a_beta = 0.0042, params_a_gamma = 6.0, zeta_threshold = 2.220446049250313e-16)
const gga_x_b88_required = ()

function gga_x_b88(rho, sigma; params = NamedTuple())
    p = resolve_params(gga_x_b88_defaults, gga_x_b88_required, params)
    v = gga_variables(rho, sigma, Val(3))
    return gga_x_b88_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.dens_threshold, p.params_a_beta, p.params_a_gamma, p.zeta_threshold)
end

function gga_x_b88(na, nb, gaa, gab, gbb; params = NamedTuple())
    p = resolve_params(gga_x_b88_defaults, gga_x_b88_required, params)
    v = gga_variables(na, nb, gaa, gab, gbb, Val(3))
    return gga_x_b88_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.dens_threshold, p.params_a_beta, p.params_a_gamma, p.zeta_threshold)
end

export gga_x_b88, gga_x_b88_defaults, gga_x_b88_required

const gga_x_b88_6311g_defaults = (dens_threshold = 1.0e-15, params_a_beta = 0.0051, params_a_gamma = 6.0, zeta_threshold = 2.220446049250313e-16)
const gga_x_b88_6311g_required = ()

function gga_x_b88_6311g(rho, sigma; params = NamedTuple())
    p = resolve_params(gga_x_b88_6311g_defaults, gga_x_b88_6311g_required, params)
    v = gga_variables(rho, sigma, Val(3))
    return gga_x_b88_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.dens_threshold, p.params_a_beta, p.params_a_gamma, p.zeta_threshold)
end

function gga_x_b88_6311g(na, nb, gaa, gab, gbb; params = NamedTuple())
    p = resolve_params(gga_x_b88_6311g_defaults, gga_x_b88_6311g_required, params)
    v = gga_variables(na, nb, gaa, gab, gbb, Val(3))
    return gga_x_b88_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.dens_threshold, p.params_a_beta, p.params_a_gamma, p.zeta_threshold)
end

export gga_x_b88_6311g, gga_x_b88_6311g_defaults, gga_x_b88_6311g_required

const gga_x_b88m_defaults = (dens_threshold = 1.0e-15, params_a_beta = 0.0045, params_a_gamma = 6.0, zeta_threshold = 2.220446049250313e-16)
const gga_x_b88m_required = ()

function gga_x_b88m(rho, sigma; params = NamedTuple())
    p = resolve_params(gga_x_b88m_defaults, gga_x_b88m_required, params)
    v = gga_variables(rho, sigma, Val(3))
    return gga_x_b88_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.dens_threshold, p.params_a_beta, p.params_a_gamma, p.zeta_threshold)
end

function gga_x_b88m(na, nb, gaa, gab, gbb; params = NamedTuple())
    p = resolve_params(gga_x_b88m_defaults, gga_x_b88m_required, params)
    v = gga_variables(na, nb, gaa, gab, gbb, Val(3))
    return gga_x_b88_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.dens_threshold, p.params_a_beta, p.params_a_gamma, p.zeta_threshold)
end

export gga_x_b88m, gga_x_b88m_defaults, gga_x_b88m_required

const gga_x_df3_opt1_defaults = (dens_threshold = 1.0e-15, params_a_beta = 0.0018903811666999264, params_a_gamma = 7.61598219052071, zeta_threshold = 2.220446049250313e-16)
const gga_x_df3_opt1_required = ()

function gga_x_df3_opt1(rho, sigma; params = NamedTuple())
    p = resolve_params(gga_x_df3_opt1_defaults, gga_x_df3_opt1_required, params)
    v = gga_variables(rho, sigma, Val(3))
    return gga_x_b88_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.dens_threshold, p.params_a_beta, p.params_a_gamma, p.zeta_threshold)
end

function gga_x_df3_opt1(na, nb, gaa, gab, gbb; params = NamedTuple())
    p = resolve_params(gga_x_df3_opt1_defaults, gga_x_df3_opt1_required, params)
    v = gga_variables(na, nb, gaa, gab, gbb, Val(3))
    return gga_x_b88_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.dens_threshold, p.params_a_beta, p.params_a_gamma, p.zeta_threshold)
end

export gga_x_df3_opt1, gga_x_df3_opt1_defaults, gga_x_df3_opt1_required

const gga_x_eb88_defaults = (dens_threshold = 1.0e-15, params_a_beta = 0.003968502629920499, params_a_gamma = 6.0, zeta_threshold = 2.220446049250313e-16)
const gga_x_eb88_required = ()

function gga_x_eb88(rho, sigma; params = NamedTuple())
    p = resolve_params(gga_x_eb88_defaults, gga_x_eb88_required, params)
    v = gga_variables(rho, sigma, Val(3))
    return gga_x_b88_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.dens_threshold, p.params_a_beta, p.params_a_gamma, p.zeta_threshold)
end

function gga_x_eb88(na, nb, gaa, gab, gbb; params = NamedTuple())
    p = resolve_params(gga_x_eb88_defaults, gga_x_eb88_required, params)
    v = gga_variables(na, nb, gaa, gab, gbb, Val(3))
    return gga_x_b88_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.dens_threshold, p.params_a_beta, p.params_a_gamma, p.zeta_threshold)
end

export gga_x_eb88, gga_x_eb88_defaults, gga_x_eb88_required

const gga_x_llp_defaults = (dens_threshold = 1.0e-15, params_a_beta = 0.004089846716401565, params_a_gamma = 6.186050909570543, zeta_threshold = 2.220446049250313e-16)
const gga_x_llp_required = ()

function gga_x_llp(rho, sigma; params = NamedTuple())
    p = resolve_params(gga_x_llp_defaults, gga_x_llp_required, params)
    v = gga_variables(rho, sigma, Val(3))
    return gga_x_b88_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.dens_threshold, p.params_a_beta, p.params_a_gamma, p.zeta_threshold)
end

function gga_x_llp(na, nb, gaa, gab, gbb; params = NamedTuple())
    p = resolve_params(gga_x_llp_defaults, gga_x_llp_required, params)
    v = gga_variables(na, nb, gaa, gab, gbb, Val(3))
    return gga_x_b88_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.dens_threshold, p.params_a_beta, p.params_a_gamma, p.zeta_threshold)
end

export gga_x_llp, gga_x_llp_defaults, gga_x_llp_required

const gga_x_mb88_defaults = (dens_threshold = 1.0e-15, params_a_beta = 0.0011, params_a_gamma = 6.0, zeta_threshold = 2.220446049250313e-16)
const gga_x_mb88_required = ()

function gga_x_mb88(rho, sigma; params = NamedTuple())
    p = resolve_params(gga_x_mb88_defaults, gga_x_mb88_required, params)
    v = gga_variables(rho, sigma, Val(3))
    return gga_x_b88_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.dens_threshold, p.params_a_beta, p.params_a_gamma, p.zeta_threshold)
end

function gga_x_mb88(na, nb, gaa, gab, gbb; params = NamedTuple())
    p = resolve_params(gga_x_mb88_defaults, gga_x_mb88_required, params)
    v = gga_variables(na, nb, gaa, gab, gbb, Val(3))
    return gga_x_b88_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.dens_threshold, p.params_a_beta, p.params_a_gamma, p.zeta_threshold)
end

export gga_x_mb88, gga_x_mb88_defaults, gga_x_mb88_required

const gga_x_optb88_vdw_defaults = (dens_threshold = 1.0e-15, params_a_beta = 0.00336865923905927, params_a_gamma = 6.98131700797731, zeta_threshold = 2.220446049250313e-16)
const gga_x_optb88_vdw_required = ()

function gga_x_optb88_vdw(rho, sigma; params = NamedTuple())
    p = resolve_params(gga_x_optb88_vdw_defaults, gga_x_optb88_vdw_required, params)
    v = gga_variables(rho, sigma, Val(3))
    return gga_x_b88_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.dens_threshold, p.params_a_beta, p.params_a_gamma, p.zeta_threshold)
end

function gga_x_optb88_vdw(na, nb, gaa, gab, gbb; params = NamedTuple())
    p = resolve_params(gga_x_optb88_vdw_defaults, gga_x_optb88_vdw_required, params)
    v = gga_variables(na, nb, gaa, gab, gbb, Val(3))
    return gga_x_b88_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.dens_threshold, p.params_a_beta, p.params_a_gamma, p.zeta_threshold)
end

export gga_x_optb88_vdw, gga_x_optb88_vdw_defaults, gga_x_optb88_vdw_required
