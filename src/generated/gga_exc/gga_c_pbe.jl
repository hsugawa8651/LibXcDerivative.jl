# Auto-generated from the Libxc sources
# python/gga_exc/gga_c_pbe.py -- do not edit by hand.
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
# args: rs, z, xt, xs0, xs1, params_a_BB, params_a_beta, params_a_gamma, params_a_tscale, zeta_threshold
const gga_c_pbe_energy = function (rs, z, xt, xs0, xs1, params_a_BB, params_a_beta, params_a_gamma, params_a_tscale, zeta_threshold)
    @inbounds begin
        cse_tmp_0 = z + 1 <= zeta_threshold
        cse_tmp_1 = NaNMath.pow(zeta_threshold, 0.6666666666666666) - 1
        cse_tmp_2 = zeta_threshold - 1
        cse_tmp_3 = xc_log1p(my_piecewise3(z > cse_tmp_2, z, cse_tmp_2))
        cse_tmp_4 = 1 - z <= zeta_threshold
        cse_tmp_5 = -z
        cse_tmp_6 = xc_log1p(my_piecewise3(cse_tmp_5 > cse_tmp_2, cse_tmp_5, cse_tmp_2))
        cse_tmp_7 = my_piecewise3(cse_tmp_0, cse_tmp_1, xc_expm1((2 // 3) * cse_tmp_3)) / 2 + my_piecewise3(cse_tmp_4, cse_tmp_1, xc_expm1((2 // 3) * cse_tmp_6)) / 2 + 1
        cse_tmp_8 = cse_tmp_7 ^ 3
        cse_tmp_9 = params_a_gamma ^ (-1)
        cse_tmp_10 = NaNMath.sqrt(rs)
        cse_tmp_11 = NaNMath.pow(rs, 1.5)
        cse_tmp_12 = rs ^ 2
        cse_tmp_13 = (-0.01328816518 * rs - 0.0621814) * xc_log1p((0.47231125998 * cse_tmp_10 + 0.10186556948 * cse_tmp_11 + 0.030651699316 * cse_tmp_12 + 0.22308199064 * rs) ^ (-1))
        cse_tmp_14 = 0.5848223622634646207262238663759 * (-0.00375733525 * rs - 0.0337738) * xc_log1p((0.3497952466 * cse_tmp_10 + 0.029729725188 * cse_tmp_11 + 0.016775784198 * cse_tmp_12 + 0.12236585478 * rs) ^ (-1))
        cse_tmp_15 = 1.2599210498948732
        cse_tmp_16 = NaNMath.pow(zeta_threshold, 1.3333333333333333) - 1
        cse_tmp_17 = (my_piecewise3(cse_tmp_0, cse_tmp_16, xc_expm1((4 // 3) * cse_tmp_3)) + my_piecewise3(cse_tmp_4, cse_tmp_16, xc_expm1((4 // 3) * cse_tmp_6))) / (2 * cse_tmp_15 - 2)
        cse_tmp_18 = cse_tmp_9 * (cse_tmp_13 - cse_tmp_14 * cse_tmp_17 + cse_tmp_17 * z ^ 4 * (-cse_tmp_13 + cse_tmp_14 + (-0.006388517036 * rs - 0.0310907) * xc_log1p((0.43896648423 * cse_tmp_10 + 0.10465751434 * cse_tmp_11 + 0.019436972919 * cse_tmp_12 + 0.19269083139 * rs) ^ (-1)))) / cse_tmp_8
        cse_tmp_19 = cse_tmp_9 * params_a_beta / xc_expm1(-cse_tmp_18)
        cse_tmp_8 * params_a_gamma * xc_log1p(xc_expm1(cse_tmp_18) / (cse_tmp_19 * (cse_tmp_15 * params_a_tscale ^ 2 * xt ^ 2 / (32 * cse_tmp_7 ^ 2 * rs) + 1.5874010519681994 * cse_tmp_19 * params_a_BB * params_a_tscale ^ 4 * xt ^ 4 / (1024 * cse_tmp_12 * cse_tmp_7 ^ 4)) + 1))
    end
end
export gga_c_pbe_energy

const gga_c_pbe_defaults = (params_a_BB = 1.0, params_a_beta = 0.06672455060314922, params_a_gamma = 0.031090690869654894, params_a_tscale = 1.0, zeta_threshold = 2.220446049250313e-16)
const gga_c_pbe_required = ()

function gga_c_pbe(rho, sigma; params = NamedTuple())
    p = resolve_params(gga_c_pbe_defaults, gga_c_pbe_required, params)
    v = gga_variables(rho, sigma, Val(3))
    return gga_c_pbe_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.params_a_BB, p.params_a_beta, p.params_a_gamma, p.params_a_tscale, p.zeta_threshold)
end

function gga_c_pbe(na, nb, gaa, gab, gbb; params = NamedTuple())
    p = resolve_params(gga_c_pbe_defaults, gga_c_pbe_required, params)
    v = gga_variables(na, nb, gaa, gab, gbb, Val(3))
    return gga_c_pbe_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.params_a_BB, p.params_a_beta, p.params_a_gamma, p.params_a_tscale, p.zeta_threshold)
end

export gga_c_pbe, gga_c_pbe_defaults, gga_c_pbe_required

const gga_c_apbe_defaults = (params_a_BB = 1.0, params_a_beta = 0.07903052324102346, params_a_gamma = 0.031090690869654894, params_a_tscale = 1.0, zeta_threshold = 2.220446049250313e-16)
const gga_c_apbe_required = ()

function gga_c_apbe(rho, sigma; params = NamedTuple())
    p = resolve_params(gga_c_apbe_defaults, gga_c_apbe_required, params)
    v = gga_variables(rho, sigma, Val(3))
    return gga_c_pbe_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.params_a_BB, p.params_a_beta, p.params_a_gamma, p.params_a_tscale, p.zeta_threshold)
end

function gga_c_apbe(na, nb, gaa, gab, gbb; params = NamedTuple())
    p = resolve_params(gga_c_apbe_defaults, gga_c_apbe_required, params)
    v = gga_variables(na, nb, gaa, gab, gbb, Val(3))
    return gga_c_pbe_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.params_a_BB, p.params_a_beta, p.params_a_gamma, p.params_a_tscale, p.zeta_threshold)
end

export gga_c_apbe, gga_c_apbe_defaults, gga_c_apbe_required

const gga_c_bkl1_defaults = (params_a_BB = 1.0, params_a_beta = 0.06672455060314922, params_a_gamma = 0.031090690869654894, params_a_tscale = 2.5, zeta_threshold = 2.220446049250313e-16)
const gga_c_bkl1_required = ()

function gga_c_bkl1(rho, sigma; params = NamedTuple())
    p = resolve_params(gga_c_bkl1_defaults, gga_c_bkl1_required, params)
    v = gga_variables(rho, sigma, Val(3))
    return gga_c_pbe_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.params_a_BB, p.params_a_beta, p.params_a_gamma, p.params_a_tscale, p.zeta_threshold)
end

function gga_c_bkl1(na, nb, gaa, gab, gbb; params = NamedTuple())
    p = resolve_params(gga_c_bkl1_defaults, gga_c_bkl1_required, params)
    v = gga_variables(na, nb, gaa, gab, gbb, Val(3))
    return gga_c_pbe_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.params_a_BB, p.params_a_beta, p.params_a_gamma, p.params_a_tscale, p.zeta_threshold)
end

export gga_c_bkl1, gga_c_bkl1_defaults, gga_c_bkl1_required

const gga_c_bkl2_defaults = (params_a_BB = 1.0, params_a_beta = 0.06672455060314922, params_a_gamma = 0.031090690869654894, params_a_tscale = 0.5, zeta_threshold = 2.220446049250313e-16)
const gga_c_bkl2_required = ()

function gga_c_bkl2(rho, sigma; params = NamedTuple())
    p = resolve_params(gga_c_bkl2_defaults, gga_c_bkl2_required, params)
    v = gga_variables(rho, sigma, Val(3))
    return gga_c_pbe_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.params_a_BB, p.params_a_beta, p.params_a_gamma, p.params_a_tscale, p.zeta_threshold)
end

function gga_c_bkl2(na, nb, gaa, gab, gbb; params = NamedTuple())
    p = resolve_params(gga_c_bkl2_defaults, gga_c_bkl2_required, params)
    v = gga_variables(na, nb, gaa, gab, gbb, Val(3))
    return gga_c_pbe_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.params_a_BB, p.params_a_beta, p.params_a_gamma, p.params_a_tscale, p.zeta_threshold)
end

export gga_c_bkl2, gga_c_bkl2_defaults, gga_c_bkl2_required

const gga_c_mggac_defaults = (params_a_BB = 1.0, params_a_beta = 0.03, params_a_gamma = 0.031090690869654894, params_a_tscale = 1.0, zeta_threshold = 2.220446049250313e-16)
const gga_c_mggac_required = ()

function gga_c_mggac(rho, sigma; params = NamedTuple())
    p = resolve_params(gga_c_mggac_defaults, gga_c_mggac_required, params)
    v = gga_variables(rho, sigma, Val(3))
    return gga_c_pbe_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.params_a_BB, p.params_a_beta, p.params_a_gamma, p.params_a_tscale, p.zeta_threshold)
end

function gga_c_mggac(na, nb, gaa, gab, gbb; params = NamedTuple())
    p = resolve_params(gga_c_mggac_defaults, gga_c_mggac_required, params)
    v = gga_variables(na, nb, gaa, gab, gbb, Val(3))
    return gga_c_pbe_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.params_a_BB, p.params_a_beta, p.params_a_gamma, p.params_a_tscale, p.zeta_threshold)
end

export gga_c_mggac, gga_c_mggac_defaults, gga_c_mggac_required

const gga_c_pbe_gaussian_defaults = (params_a_BB = 1.0, params_a_beta = 0.0667263212, params_a_gamma = 0.031090690869654894, params_a_tscale = 1.0, zeta_threshold = 2.220446049250313e-16)
const gga_c_pbe_gaussian_required = ()

function gga_c_pbe_gaussian(rho, sigma; params = NamedTuple())
    p = resolve_params(gga_c_pbe_gaussian_defaults, gga_c_pbe_gaussian_required, params)
    v = gga_variables(rho, sigma, Val(3))
    return gga_c_pbe_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.params_a_BB, p.params_a_beta, p.params_a_gamma, p.params_a_tscale, p.zeta_threshold)
end

function gga_c_pbe_gaussian(na, nb, gaa, gab, gbb; params = NamedTuple())
    p = resolve_params(gga_c_pbe_gaussian_defaults, gga_c_pbe_gaussian_required, params)
    v = gga_variables(na, nb, gaa, gab, gbb, Val(3))
    return gga_c_pbe_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.params_a_BB, p.params_a_beta, p.params_a_gamma, p.params_a_tscale, p.zeta_threshold)
end

export gga_c_pbe_gaussian, gga_c_pbe_gaussian_defaults, gga_c_pbe_gaussian_required

const gga_c_pbe_jrgx_defaults = (params_a_BB = 1.0, params_a_beta = 0.03752636431497906, params_a_gamma = 0.031090690869654894, params_a_tscale = 1.0, zeta_threshold = 2.220446049250313e-16)
const gga_c_pbe_jrgx_required = ()

function gga_c_pbe_jrgx(rho, sigma; params = NamedTuple())
    p = resolve_params(gga_c_pbe_jrgx_defaults, gga_c_pbe_jrgx_required, params)
    v = gga_variables(rho, sigma, Val(3))
    return gga_c_pbe_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.params_a_BB, p.params_a_beta, p.params_a_gamma, p.params_a_tscale, p.zeta_threshold)
end

function gga_c_pbe_jrgx(na, nb, gaa, gab, gbb; params = NamedTuple())
    p = resolve_params(gga_c_pbe_jrgx_defaults, gga_c_pbe_jrgx_required, params)
    v = gga_variables(na, nb, gaa, gab, gbb, Val(3))
    return gga_c_pbe_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.params_a_BB, p.params_a_beta, p.params_a_gamma, p.params_a_tscale, p.zeta_threshold)
end

export gga_c_pbe_jrgx, gga_c_pbe_jrgx_defaults, gga_c_pbe_jrgx_required

const gga_c_pbe_mol_defaults = (params_a_BB = 1.0, params_a_beta = 0.08384, params_a_gamma = 0.031090690869654894, params_a_tscale = 1.0, zeta_threshold = 2.220446049250313e-16)
const gga_c_pbe_mol_required = ()

function gga_c_pbe_mol(rho, sigma; params = NamedTuple())
    p = resolve_params(gga_c_pbe_mol_defaults, gga_c_pbe_mol_required, params)
    v = gga_variables(rho, sigma, Val(3))
    return gga_c_pbe_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.params_a_BB, p.params_a_beta, p.params_a_gamma, p.params_a_tscale, p.zeta_threshold)
end

function gga_c_pbe_mol(na, nb, gaa, gab, gbb; params = NamedTuple())
    p = resolve_params(gga_c_pbe_mol_defaults, gga_c_pbe_mol_required, params)
    v = gga_variables(na, nb, gaa, gab, gbb, Val(3))
    return gga_c_pbe_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.params_a_BB, p.params_a_beta, p.params_a_gamma, p.params_a_tscale, p.zeta_threshold)
end

export gga_c_pbe_mol, gga_c_pbe_mol_defaults, gga_c_pbe_mol_required

const gga_c_pbe_sol_defaults = (params_a_BB = 1.0, params_a_beta = 0.046, params_a_gamma = 0.031090690869654894, params_a_tscale = 1.0, zeta_threshold = 2.220446049250313e-16)
const gga_c_pbe_sol_required = ()

function gga_c_pbe_sol(rho, sigma; params = NamedTuple())
    p = resolve_params(gga_c_pbe_sol_defaults, gga_c_pbe_sol_required, params)
    v = gga_variables(rho, sigma, Val(3))
    return gga_c_pbe_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.params_a_BB, p.params_a_beta, p.params_a_gamma, p.params_a_tscale, p.zeta_threshold)
end

function gga_c_pbe_sol(na, nb, gaa, gab, gbb; params = NamedTuple())
    p = resolve_params(gga_c_pbe_sol_defaults, gga_c_pbe_sol_required, params)
    v = gga_variables(na, nb, gaa, gab, gbb, Val(3))
    return gga_c_pbe_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.params_a_BB, p.params_a_beta, p.params_a_gamma, p.params_a_tscale, p.zeta_threshold)
end

export gga_c_pbe_sol, gga_c_pbe_sol_defaults, gga_c_pbe_sol_required

const gga_c_pbefe_defaults = (params_a_BB = 1.0, params_a_beta = 0.043, params_a_gamma = 0.031090690869654894, params_a_tscale = 1.0, zeta_threshold = 2.220446049250313e-16)
const gga_c_pbefe_required = ()

function gga_c_pbefe(rho, sigma; params = NamedTuple())
    p = resolve_params(gga_c_pbefe_defaults, gga_c_pbefe_required, params)
    v = gga_variables(rho, sigma, Val(3))
    return gga_c_pbe_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.params_a_BB, p.params_a_beta, p.params_a_gamma, p.params_a_tscale, p.zeta_threshold)
end

function gga_c_pbefe(na, nb, gaa, gab, gbb; params = NamedTuple())
    p = resolve_params(gga_c_pbefe_defaults, gga_c_pbefe_required, params)
    v = gga_variables(na, nb, gaa, gab, gbb, Val(3))
    return gga_c_pbe_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.params_a_BB, p.params_a_beta, p.params_a_gamma, p.params_a_tscale, p.zeta_threshold)
end

export gga_c_pbefe, gga_c_pbefe_defaults, gga_c_pbefe_required

const gga_c_pbeint_defaults = (params_a_BB = 1.0, params_a_beta = 0.052, params_a_gamma = 0.031090690869654894, params_a_tscale = 1.0, zeta_threshold = 2.220446049250313e-16)
const gga_c_pbeint_required = ()

function gga_c_pbeint(rho, sigma; params = NamedTuple())
    p = resolve_params(gga_c_pbeint_defaults, gga_c_pbeint_required, params)
    v = gga_variables(rho, sigma, Val(3))
    return gga_c_pbe_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.params_a_BB, p.params_a_beta, p.params_a_gamma, p.params_a_tscale, p.zeta_threshold)
end

function gga_c_pbeint(na, nb, gaa, gab, gbb; params = NamedTuple())
    p = resolve_params(gga_c_pbeint_defaults, gga_c_pbeint_required, params)
    v = gga_variables(na, nb, gaa, gab, gbb, Val(3))
    return gga_c_pbe_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.params_a_BB, p.params_a_beta, p.params_a_gamma, p.params_a_tscale, p.zeta_threshold)
end

export gga_c_pbeint, gga_c_pbeint_defaults, gga_c_pbeint_required

const gga_c_rge2_defaults = (params_a_BB = 1.0, params_a_beta = 0.053, params_a_gamma = 0.031090690869654894, params_a_tscale = 1.0, zeta_threshold = 2.220446049250313e-16)
const gga_c_rge2_required = ()

function gga_c_rge2(rho, sigma; params = NamedTuple())
    p = resolve_params(gga_c_rge2_defaults, gga_c_rge2_required, params)
    v = gga_variables(rho, sigma, Val(3))
    return gga_c_pbe_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.params_a_BB, p.params_a_beta, p.params_a_gamma, p.params_a_tscale, p.zeta_threshold)
end

function gga_c_rge2(na, nb, gaa, gab, gbb; params = NamedTuple())
    p = resolve_params(gga_c_rge2_defaults, gga_c_rge2_required, params)
    v = gga_variables(na, nb, gaa, gab, gbb, Val(3))
    return gga_c_pbe_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.params_a_BB, p.params_a_beta, p.params_a_gamma, p.params_a_tscale, p.zeta_threshold)
end

export gga_c_rge2, gga_c_rge2_defaults, gga_c_rge2_required

const gga_c_spbe_defaults = (params_a_BB = 0.0, params_a_beta = 0.06672455060314922, params_a_gamma = 0.031090690869654894, params_a_tscale = 1.0, zeta_threshold = 2.220446049250313e-16)
const gga_c_spbe_required = ()

function gga_c_spbe(rho, sigma; params = NamedTuple())
    p = resolve_params(gga_c_spbe_defaults, gga_c_spbe_required, params)
    v = gga_variables(rho, sigma, Val(3))
    return gga_c_pbe_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.params_a_BB, p.params_a_beta, p.params_a_gamma, p.params_a_tscale, p.zeta_threshold)
end

function gga_c_spbe(na, nb, gaa, gab, gbb; params = NamedTuple())
    p = resolve_params(gga_c_spbe_defaults, gga_c_spbe_required, params)
    v = gga_variables(na, nb, gaa, gab, gbb, Val(3))
    return gga_c_pbe_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.params_a_BB, p.params_a_beta, p.params_a_gamma, p.params_a_tscale, p.zeta_threshold)
end

export gga_c_spbe, gga_c_spbe_defaults, gga_c_spbe_required

const gga_c_tm_pbe_defaults = (params_a_BB = 1.0, params_a_beta = -0.052728, params_a_gamma = -0.0156, params_a_tscale = 1.0, zeta_threshold = 2.220446049250313e-16)
const gga_c_tm_pbe_required = ()

function gga_c_tm_pbe(rho, sigma; params = NamedTuple())
    p = resolve_params(gga_c_tm_pbe_defaults, gga_c_tm_pbe_required, params)
    v = gga_variables(rho, sigma, Val(3))
    return gga_c_pbe_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.params_a_BB, p.params_a_beta, p.params_a_gamma, p.params_a_tscale, p.zeta_threshold)
end

function gga_c_tm_pbe(na, nb, gaa, gab, gbb; params = NamedTuple())
    p = resolve_params(gga_c_tm_pbe_defaults, gga_c_tm_pbe_required, params)
    v = gga_variables(na, nb, gaa, gab, gbb, Val(3))
    return gga_c_pbe_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.params_a_BB, p.params_a_beta, p.params_a_gamma, p.params_a_tscale, p.zeta_threshold)
end

export gga_c_tm_pbe, gga_c_tm_pbe_defaults, gga_c_tm_pbe_required

const gga_c_xpbe_defaults = (params_a_BB = 1.0, params_a_beta = 0.089809, params_a_gamma = 0.0204335576602504, params_a_tscale = 1.0, zeta_threshold = 2.220446049250313e-16)
const gga_c_xpbe_required = ()

function gga_c_xpbe(rho, sigma; params = NamedTuple())
    p = resolve_params(gga_c_xpbe_defaults, gga_c_xpbe_required, params)
    v = gga_variables(rho, sigma, Val(3))
    return gga_c_pbe_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.params_a_BB, p.params_a_beta, p.params_a_gamma, p.params_a_tscale, p.zeta_threshold)
end

function gga_c_xpbe(na, nb, gaa, gab, gbb; params = NamedTuple())
    p = resolve_params(gga_c_xpbe_defaults, gga_c_xpbe_required, params)
    v = gga_variables(na, nb, gaa, gab, gbb, Val(3))
    return gga_c_pbe_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.params_a_BB, p.params_a_beta, p.params_a_gamma, p.params_a_tscale, p.zeta_threshold)
end

export gga_c_xpbe, gga_c_xpbe_defaults, gga_c_xpbe_required
