# Auto-generated from the Libxc sources
# python/gga_exc/gga_k_dk.py -- do not edit by hand.
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
# args: rs, z, xt, xs0, xs1, dens_threshold, params_a_aa_0, params_a_aa_1, params_a_aa_2, params_a_aa_3, params_a_aa_4, params_a_bb_0, params_a_bb_1, params_a_bb_2, params_a_bb_3, params_a_bb_4, zeta_threshold
const gga_k_dk_energy = function (rs, z, xt, xs0, xs1, dens_threshold, params_a_aa_0, params_a_aa_1, params_a_aa_2, params_a_aa_3, params_a_aa_4, params_a_bb_0, params_a_bb_1, params_a_bb_2, params_a_bb_3, params_a_bb_4, zeta_threshold)
    @inbounds begin
        cse_tmp_0 = z + 1
        cse_tmp_1 = (3 // 8) / (pi * rs ^ 3)
        cse_tmp_2 = xs0 ^ 2
        cse_tmp_3 = xs0 ^ 4
        cse_tmp_4 = xs0 ^ 6
        cse_tmp_5 = xs0 ^ 8
        cse_tmp_6 = cse_tmp_0 <= zeta_threshold
        cse_tmp_7 = zeta_threshold - 1
        cse_tmp_8 = 1 - z
        cse_tmp_9 = cse_tmp_8 <= zeta_threshold
        cse_tmp_10 = -cse_tmp_7
        cse_tmp_11 = my_piecewise5(cse_tmp_6, cse_tmp_7, cse_tmp_9, cse_tmp_10, z)
        cse_tmp_12 = NaNMath.pow(zeta_threshold, 1.6666666666666667) - 1
        cse_tmp_13 = (9 // 80) * 2.2894284851066637 * 2.1450293971110255 / rs ^ 2
        cse_tmp_14 = xs1 ^ 2
        cse_tmp_15 = xs1 ^ 4
        cse_tmp_16 = xs1 ^ 6
        cse_tmp_17 = xs1 ^ 8
        cse_tmp_18 = my_piecewise5(cse_tmp_9, cse_tmp_7, cse_tmp_6, cse_tmp_10, -z)
        my_piecewise3(cse_tmp_0 * cse_tmp_1 <= dens_threshold, 0, cse_tmp_13 * (my_piecewise3(cse_tmp_11 + 1 <= zeta_threshold, cse_tmp_12, xc_expm1((5 // 3) * xc_log1p(my_piecewise3(cse_tmp_11 > cse_tmp_7, cse_tmp_11, cse_tmp_7)))) + 1) * (cse_tmp_2 * params_a_aa_1 + cse_tmp_3 * params_a_aa_2 + cse_tmp_4 * params_a_aa_3 + cse_tmp_5 * params_a_aa_4 + params_a_aa_0) / (cse_tmp_2 * params_a_bb_1 + cse_tmp_3 * params_a_bb_2 + cse_tmp_4 * params_a_bb_3 + cse_tmp_5 * params_a_bb_4 + params_a_bb_0)) + my_piecewise3(cse_tmp_1 * cse_tmp_8 <= dens_threshold, 0, cse_tmp_13 * (my_piecewise3(cse_tmp_18 + 1 <= zeta_threshold, cse_tmp_12, xc_expm1((5 // 3) * xc_log1p(my_piecewise3(cse_tmp_18 > cse_tmp_7, cse_tmp_18, cse_tmp_7)))) + 1) * (cse_tmp_14 * params_a_aa_1 + cse_tmp_15 * params_a_aa_2 + cse_tmp_16 * params_a_aa_3 + cse_tmp_17 * params_a_aa_4 + params_a_aa_0) / (cse_tmp_14 * params_a_bb_1 + cse_tmp_15 * params_a_bb_2 + cse_tmp_16 * params_a_bb_3 + cse_tmp_17 * params_a_bb_4 + params_a_bb_0))
    end
end
export gga_k_dk_energy

const gga_k_dk_defaults = (dens_threshold = 1.0e-14, params_a_aa_0 = 1.0, params_a_aa_1 = 0.002894915269207321, params_a_aa_2 = 0.00013261312158741373, params_a_aa_3 = -5.540398637453735e-7, params_a_aa_4 = 2.297777234019837e-9, params_a_bb_0 = 1.0, params_a_bb_1 = -0.00015236396153722742, params_a_bb_2 = 9.284072099806483e-5, params_a_bb_3 = 8.398620696364157e-8, params_a_bb_4 = 0.0, zeta_threshold = 2.220446049250313e-16)
const gga_k_dk_required = ()

function gga_k_dk(rho, sigma; params = NamedTuple())
    p = resolve_params(gga_k_dk_defaults, gga_k_dk_required, params)
    v = gga_variables(rho, sigma, Val(3))
    return gga_k_dk_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.dens_threshold, p.params_a_aa_0, p.params_a_aa_1, p.params_a_aa_2, p.params_a_aa_3, p.params_a_aa_4, p.params_a_bb_0, p.params_a_bb_1, p.params_a_bb_2, p.params_a_bb_3, p.params_a_bb_4, p.zeta_threshold)
end

function gga_k_dk(na, nb, gaa, gab, gbb; params = NamedTuple())
    p = resolve_params(gga_k_dk_defaults, gga_k_dk_required, params)
    v = gga_variables(na, nb, gaa, gab, gbb, Val(3))
    return gga_k_dk_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.dens_threshold, p.params_a_aa_0, p.params_a_aa_1, p.params_a_aa_2, p.params_a_aa_3, p.params_a_aa_4, p.params_a_bb_0, p.params_a_bb_1, p.params_a_bb_2, p.params_a_bb_3, p.params_a_bb_4, p.zeta_threshold)
end

export gga_k_dk, gga_k_dk_defaults, gga_k_dk_required

const gga_k_ernzerhof_defaults = (dens_threshold = 1.0e-14, params_a_aa_0 = 135.0, params_a_aa_1 = 0.4607486196885757, params_a_aa_2 = 0.0013538857815365293, params_a_aa_3 = 0.0, params_a_aa_4 = 0.0, params_a_bb_0 = 135.0, params_a_bb_1 = 0.049365923538061685, params_a_bb_2 = 0.0, params_a_bb_3 = 0.0, params_a_bb_4 = 0.0, zeta_threshold = 2.220446049250313e-16)
const gga_k_ernzerhof_required = ()

function gga_k_ernzerhof(rho, sigma; params = NamedTuple())
    p = resolve_params(gga_k_ernzerhof_defaults, gga_k_ernzerhof_required, params)
    v = gga_variables(rho, sigma, Val(3))
    return gga_k_dk_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.dens_threshold, p.params_a_aa_0, p.params_a_aa_1, p.params_a_aa_2, p.params_a_aa_3, p.params_a_aa_4, p.params_a_bb_0, p.params_a_bb_1, p.params_a_bb_2, p.params_a_bb_3, p.params_a_bb_4, p.zeta_threshold)
end

function gga_k_ernzerhof(na, nb, gaa, gab, gbb; params = NamedTuple())
    p = resolve_params(gga_k_ernzerhof_defaults, gga_k_ernzerhof_required, params)
    v = gga_variables(na, nb, gaa, gab, gbb, Val(3))
    return gga_k_dk_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.dens_threshold, p.params_a_aa_0, p.params_a_aa_1, p.params_a_aa_2, p.params_a_aa_3, p.params_a_aa_4, p.params_a_bb_0, p.params_a_bb_1, p.params_a_bb_2, p.params_a_bb_3, p.params_a_bb_4, p.zeta_threshold)
end

export gga_k_ernzerhof, gga_k_ernzerhof_defaults, gga_k_ernzerhof_required

const gga_k_perdew_defaults = (dens_threshold = 1.0e-14, params_a_aa_0 = 1.0, params_a_aa_1 = 1.4545833923568336, params_a_aa_2 = 0.004432161727584875, params_a_aa_3 = 0.0, params_a_aa_4 = 0.0, params_a_bb_0 = 1.0, params_a_bb_1 = 1.4515358693437506, params_a_bb_2 = 0.0, params_a_bb_3 = 0.0, params_a_bb_4 = 0.0, zeta_threshold = 2.220446049250313e-16)
const gga_k_perdew_required = ()

function gga_k_perdew(rho, sigma; params = NamedTuple())
    p = resolve_params(gga_k_perdew_defaults, gga_k_perdew_required, params)
    v = gga_variables(rho, sigma, Val(3))
    return gga_k_dk_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.dens_threshold, p.params_a_aa_0, p.params_a_aa_1, p.params_a_aa_2, p.params_a_aa_3, p.params_a_aa_4, p.params_a_bb_0, p.params_a_bb_1, p.params_a_bb_2, p.params_a_bb_3, p.params_a_bb_4, p.zeta_threshold)
end

function gga_k_perdew(na, nb, gaa, gab, gbb; params = NamedTuple())
    p = resolve_params(gga_k_perdew_defaults, gga_k_perdew_required, params)
    v = gga_variables(na, nb, gaa, gab, gbb, Val(3))
    return gga_k_dk_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.dens_threshold, p.params_a_aa_0, p.params_a_aa_1, p.params_a_aa_2, p.params_a_aa_3, p.params_a_aa_4, p.params_a_bb_0, p.params_a_bb_1, p.params_a_bb_2, p.params_a_bb_3, p.params_a_bb_4, p.zeta_threshold)
end

export gga_k_perdew, gga_k_perdew_defaults, gga_k_perdew_required

const gga_k_vjks_defaults = (dens_threshold = 1.0e-14, params_a_aa_0 = 1.0, params_a_aa_1 = 0.01471762733748079, params_a_aa_2 = 0.0, params_a_aa_3 = -1.9204159512886074e-7, params_a_aa_4 = 0.0, params_a_bb_0 = 1.0, params_a_bb_1 = 0.010714050938543988, params_a_bb_2 = 1.1670495436844882e-5, params_a_bb_3 = 0.0, params_a_bb_4 = 0.0, zeta_threshold = 2.220446049250313e-16)
const gga_k_vjks_required = ()

function gga_k_vjks(rho, sigma; params = NamedTuple())
    p = resolve_params(gga_k_vjks_defaults, gga_k_vjks_required, params)
    v = gga_variables(rho, sigma, Val(3))
    return gga_k_dk_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.dens_threshold, p.params_a_aa_0, p.params_a_aa_1, p.params_a_aa_2, p.params_a_aa_3, p.params_a_aa_4, p.params_a_bb_0, p.params_a_bb_1, p.params_a_bb_2, p.params_a_bb_3, p.params_a_bb_4, p.zeta_threshold)
end

function gga_k_vjks(na, nb, gaa, gab, gbb; params = NamedTuple())
    p = resolve_params(gga_k_vjks_defaults, gga_k_vjks_required, params)
    v = gga_variables(na, nb, gaa, gab, gbb, Val(3))
    return gga_k_dk_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.dens_threshold, p.params_a_aa_0, p.params_a_aa_1, p.params_a_aa_2, p.params_a_aa_3, p.params_a_aa_4, p.params_a_bb_0, p.params_a_bb_1, p.params_a_bb_2, p.params_a_bb_3, p.params_a_bb_4, p.zeta_threshold)
end

export gga_k_vjks, gga_k_vjks_defaults, gga_k_vjks_required

const gga_k_vsk_defaults = (dens_threshold = 1.0e-14, params_a_aa_0 = 1.0, params_a_aa_1 = 0.002894915269207321, params_a_aa_2 = 0.0, params_a_aa_3 = 1.008496627814284e-7, params_a_aa_4 = 0.0, params_a_bb_0 = 1.0, params_a_bb_1 = -0.00015236396153722742, params_a_bb_2 = 3.6772206412103267e-6, params_a_bb_3 = 0.0, params_a_bb_4 = 0.0, zeta_threshold = 2.220446049250313e-16)
const gga_k_vsk_required = ()

function gga_k_vsk(rho, sigma; params = NamedTuple())
    p = resolve_params(gga_k_vsk_defaults, gga_k_vsk_required, params)
    v = gga_variables(rho, sigma, Val(3))
    return gga_k_dk_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.dens_threshold, p.params_a_aa_0, p.params_a_aa_1, p.params_a_aa_2, p.params_a_aa_3, p.params_a_aa_4, p.params_a_bb_0, p.params_a_bb_1, p.params_a_bb_2, p.params_a_bb_3, p.params_a_bb_4, p.zeta_threshold)
end

function gga_k_vsk(na, nb, gaa, gab, gbb; params = NamedTuple())
    p = resolve_params(gga_k_vsk_defaults, gga_k_vsk_required, params)
    v = gga_variables(na, nb, gaa, gab, gbb, Val(3))
    return gga_k_dk_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.dens_threshold, p.params_a_aa_0, p.params_a_aa_1, p.params_a_aa_2, p.params_a_aa_3, p.params_a_aa_4, p.params_a_bb_0, p.params_a_bb_1, p.params_a_bb_2, p.params_a_bb_3, p.params_a_bb_4, p.zeta_threshold)
end

export gga_k_vsk, gga_k_vsk_defaults, gga_k_vsk_required
