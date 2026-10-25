# Auto-generated from the Libxc sources
# python/gga_exc/gga_k_mpbe.py -- do not edit by hand.
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
# args: rs, z, xt, xs0, xs1, dens_threshold, params_a_a, params_a_c1, params_a_c2, params_a_c3, zeta_threshold
const gga_k_mpbe_energy = function (rs, z, xt, xs0, xs1, dens_threshold, params_a_a, params_a_c1, params_a_c2, params_a_c3, zeta_threshold)
    @inbounds begin
        cse_tmp_0 = z + 1
        cse_tmp_1 = (3 // 8) / (pi * rs ^ 3)
        cse_tmp_2 = cse_tmp_0 <= zeta_threshold
        cse_tmp_3 = zeta_threshold - 1
        cse_tmp_4 = 1 - z
        cse_tmp_5 = cse_tmp_4 <= zeta_threshold
        cse_tmp_6 = -cse_tmp_3
        cse_tmp_7 = my_piecewise5(cse_tmp_2, cse_tmp_3, cse_tmp_5, cse_tmp_6, z)
        cse_tmp_8 = NaNMath.pow(zeta_threshold, 1.6666666666666667) - 1
        cse_tmp_9 = xs0 ^ 2
        cse_tmp_10 = 1.8171205928321397 / (24 * 4.60115111447049)
        cse_tmp_11 = cse_tmp_10 * params_a_a
        cse_tmp_12 = cse_tmp_11 * cse_tmp_9 + 1
        cse_tmp_13 = params_a_c3 / (2304 * 97.40909103400244)
        cse_tmp_14 = cse_tmp_10 * params_a_c1
        cse_tmp_15 = 3.3019272488946267 * params_a_c2 / (576 * 21.170591578193033)
        cse_tmp_16 = (9 // 80) * 2.2894284851066637 * 2.1450293971110255 / rs ^ 2
        cse_tmp_17 = my_piecewise5(cse_tmp_5, cse_tmp_3, cse_tmp_2, cse_tmp_6, -z)
        cse_tmp_18 = xs1 ^ 2
        cse_tmp_19 = cse_tmp_11 * cse_tmp_18 + 1
        my_piecewise3(cse_tmp_0 * cse_tmp_1 <= dens_threshold, 0, cse_tmp_16 * (my_piecewise3(cse_tmp_7 + 1 <= zeta_threshold, cse_tmp_8, xc_expm1((5 // 3) * xc_log1p(my_piecewise3(cse_tmp_7 > cse_tmp_3, cse_tmp_7, cse_tmp_3)))) + 1) * (1 + cse_tmp_14 * cse_tmp_9 / cse_tmp_12 + cse_tmp_15 * xs0 ^ 4 / cse_tmp_12 ^ 2 + cse_tmp_13 * xs0 ^ 6 / cse_tmp_12 ^ 3)) + my_piecewise3(cse_tmp_1 * cse_tmp_4 <= dens_threshold, 0, cse_tmp_16 * (my_piecewise3(cse_tmp_17 + 1 <= zeta_threshold, cse_tmp_8, xc_expm1((5 // 3) * xc_log1p(my_piecewise3(cse_tmp_17 > cse_tmp_3, cse_tmp_17, cse_tmp_3)))) + 1) * (cse_tmp_13 * xs1 ^ 6 / cse_tmp_19 ^ 3 + cse_tmp_14 * cse_tmp_18 / cse_tmp_19 + cse_tmp_15 * xs1 ^ 4 / cse_tmp_19 ^ 2 + 1))
    end
end
export gga_k_mpbe_energy

const gga_k_mpbe_defaults = NamedTuple()
const gga_k_mpbe_required = (:dens_threshold, :params_a_a, :params_a_c1, :params_a_c2, :params_a_c3, :zeta_threshold)

function gga_k_mpbe(rho, sigma; params = NamedTuple())
    p = resolve_params(gga_k_mpbe_defaults, gga_k_mpbe_required, params)
    v = gga_variables(rho, sigma, Val(3))
    return gga_k_mpbe_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.dens_threshold, p.params_a_a, p.params_a_c1, p.params_a_c2, p.params_a_c3, p.zeta_threshold)
end

function gga_k_mpbe(na, nb, gaa, gab, gbb; params = NamedTuple())
    p = resolve_params(gga_k_mpbe_defaults, gga_k_mpbe_required, params)
    v = gga_variables(na, nb, gaa, gab, gbb, Val(3))
    return gga_k_mpbe_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.dens_threshold, p.params_a_a, p.params_a_c1, p.params_a_c2, p.params_a_c3, p.zeta_threshold)
end

export gga_k_mpbe, gga_k_mpbe_defaults, gga_k_mpbe_required

const gga_k_pbe2_defaults = (dens_threshold = 1.0e-15, params_a_a = 0.2942, params_a_c1 = 2.0309, params_a_c2 = 0.0, params_a_c3 = 0.0, zeta_threshold = 2.220446049250313e-16)
const gga_k_pbe2_required = ()

function gga_k_pbe2(rho, sigma; params = NamedTuple())
    p = resolve_params(gga_k_pbe2_defaults, gga_k_pbe2_required, params)
    v = gga_variables(rho, sigma, Val(3))
    return gga_k_mpbe_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.dens_threshold, p.params_a_a, p.params_a_c1, p.params_a_c2, p.params_a_c3, p.zeta_threshold)
end

function gga_k_pbe2(na, nb, gaa, gab, gbb; params = NamedTuple())
    p = resolve_params(gga_k_pbe2_defaults, gga_k_pbe2_required, params)
    v = gga_variables(na, nb, gaa, gab, gbb, Val(3))
    return gga_k_mpbe_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.dens_threshold, p.params_a_a, p.params_a_c1, p.params_a_c2, p.params_a_c3, p.zeta_threshold)
end

export gga_k_pbe2, gga_k_pbe2_defaults, gga_k_pbe2_required

const gga_k_pbe3_defaults = (dens_threshold = 1.0e-15, params_a_a = 4.1355, params_a_c1 = -3.7425, params_a_c2 = 50.258, params_a_c3 = 0.0, zeta_threshold = 2.220446049250313e-16)
const gga_k_pbe3_required = ()

function gga_k_pbe3(rho, sigma; params = NamedTuple())
    p = resolve_params(gga_k_pbe3_defaults, gga_k_pbe3_required, params)
    v = gga_variables(rho, sigma, Val(3))
    return gga_k_mpbe_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.dens_threshold, p.params_a_a, p.params_a_c1, p.params_a_c2, p.params_a_c3, p.zeta_threshold)
end

function gga_k_pbe3(na, nb, gaa, gab, gbb; params = NamedTuple())
    p = resolve_params(gga_k_pbe3_defaults, gga_k_pbe3_required, params)
    v = gga_variables(na, nb, gaa, gab, gbb, Val(3))
    return gga_k_mpbe_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.dens_threshold, p.params_a_a, p.params_a_c1, p.params_a_c2, p.params_a_c3, p.zeta_threshold)
end

export gga_k_pbe3, gga_k_pbe3_defaults, gga_k_pbe3_required

const gga_k_pbe4_defaults = (dens_threshold = 1.0e-15, params_a_a = 1.7107, params_a_c1 = -7.2333, params_a_c2 = 61.645, params_a_c3 = -93.683, zeta_threshold = 2.220446049250313e-16)
const gga_k_pbe4_required = ()

function gga_k_pbe4(rho, sigma; params = NamedTuple())
    p = resolve_params(gga_k_pbe4_defaults, gga_k_pbe4_required, params)
    v = gga_variables(rho, sigma, Val(3))
    return gga_k_mpbe_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.dens_threshold, p.params_a_a, p.params_a_c1, p.params_a_c2, p.params_a_c3, p.zeta_threshold)
end

function gga_k_pbe4(na, nb, gaa, gab, gbb; params = NamedTuple())
    p = resolve_params(gga_k_pbe4_defaults, gga_k_pbe4_required, params)
    v = gga_variables(na, nb, gaa, gab, gbb, Val(3))
    return gga_k_mpbe_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.dens_threshold, p.params_a_a, p.params_a_c1, p.params_a_c2, p.params_a_c3, p.zeta_threshold)
end

export gga_k_pbe4, gga_k_pbe4_defaults, gga_k_pbe4_required
