# Auto-generated from the Libxc sources
# python/mgga_exc/mgga_x_gdme.py -- do not edit by hand.
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
# args: rs, z, xt, xs0, xs1, u0, u1, t0, t1, dens_threshold, params_a_AA, params_a_BB, params_a_a, zeta_threshold
const mgga_x_gdme_energy = function (rs, z, xt, xs0, xs1, u0, u1, t0, t1, dens_threshold, params_a_AA, params_a_BB, params_a_a, zeta_threshold)
    @inbounds begin
        cse_tmp_0 = z + 1
        cse_tmp_1 = (3 // 8) / (pi * rs ^ 3)
        cse_tmp_2 = 0.451329465583671 * 1.4422495703074083 * (params_a_AA + (3 // 5) * params_a_BB) / 4.60115111447049
        cse_tmp_3 = params_a_a ^ 2 - params_a_a + 1 // 2
        cse_tmp_4 = 0.0752215775972785 * 1.2599210498948732 * 2.080083823051904 * params_a_BB / 21.170591578193033
        cse_tmp_5 = cse_tmp_0 <= zeta_threshold
        cse_tmp_6 = zeta_threshold - 1
        cse_tmp_7 = 1 - z
        cse_tmp_8 = cse_tmp_7 <= zeta_threshold
        cse_tmp_9 = -cse_tmp_6
        cse_tmp_10 = my_piecewise5(cse_tmp_5, cse_tmp_6, cse_tmp_8, cse_tmp_9, z) + 1
        cse_tmp_11 = NaNMath.pow(zeta_threshold, 1.3333333333333333)
        cse_tmp_12 = 0.184639691595506 * 1.8171205928321397 / (1.4645918875615234 * rs)
        cse_tmp_13 = my_piecewise5(cse_tmp_8, cse_tmp_6, cse_tmp_5, cse_tmp_9, -z) + 1
        my_piecewise3(cse_tmp_0 * cse_tmp_1 <= dens_threshold, 0, -cse_tmp_12 * (cse_tmp_2 + cse_tmp_4 * (cse_tmp_3 * u0 - 2 * t0)) * my_piecewise3(cse_tmp_10 <= zeta_threshold, cse_tmp_11, NaNMath.pow(cse_tmp_10, 1.3333333333333333))) + my_piecewise3(cse_tmp_1 * cse_tmp_7 <= dens_threshold, 0, -cse_tmp_12 * (cse_tmp_2 + cse_tmp_4 * (cse_tmp_3 * u1 - 2 * t1)) * my_piecewise3(cse_tmp_13 <= zeta_threshold, cse_tmp_11, NaNMath.pow(cse_tmp_13, 1.3333333333333333)))
    end
end
export mgga_x_gdme_energy

const mgga_x_gdme_defaults = NamedTuple()
const mgga_x_gdme_required = (:dens_threshold, :params_a_AA, :params_a_BB, :params_a_a, :zeta_threshold)

function mgga_x_gdme(rho, sigma, lapl, tau; params = NamedTuple())
    p = resolve_params(mgga_x_gdme_defaults, mgga_x_gdme_required, params)
    v = mgga_variables(rho, sigma, lapl, tau, Val(3))
    return mgga_x_gdme_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.dens_threshold, p.params_a_AA, p.params_a_BB, p.params_a_a, p.zeta_threshold)
end

function mgga_x_gdme(na, nb, gaa, gab, gbb, la, lb, ta, tb; params = NamedTuple())
    p = resolve_params(mgga_x_gdme_defaults, mgga_x_gdme_required, params)
    v = mgga_variables(na, nb, gaa, gab, gbb, la, lb, ta, tb, Val(3))
    return mgga_x_gdme_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.dens_threshold, p.params_a_AA, p.params_a_BB, p.params_a_a, p.zeta_threshold)
end

export mgga_x_gdme, mgga_x_gdme_defaults, mgga_x_gdme_required

const mgga_x_gdme_0_defaults = (dens_threshold = 1.0e-15, params_a_AA = 7.0685834705770345, params_a_BB = 9.16297857297023, params_a_a = 0.0, zeta_threshold = 2.220446049250313e-16)
const mgga_x_gdme_0_required = ()

function mgga_x_gdme_0(rho, sigma, lapl, tau; params = NamedTuple())
    p = resolve_params(mgga_x_gdme_0_defaults, mgga_x_gdme_0_required, params)
    v = mgga_variables(rho, sigma, lapl, tau, Val(3))
    return mgga_x_gdme_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.dens_threshold, p.params_a_AA, p.params_a_BB, p.params_a_a, p.zeta_threshold)
end

function mgga_x_gdme_0(na, nb, gaa, gab, gbb, la, lb, ta, tb; params = NamedTuple())
    p = resolve_params(mgga_x_gdme_0_defaults, mgga_x_gdme_0_required, params)
    v = mgga_variables(na, nb, gaa, gab, gbb, la, lb, ta, tb, Val(3))
    return mgga_x_gdme_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.dens_threshold, p.params_a_AA, p.params_a_BB, p.params_a_a, p.zeta_threshold)
end

export mgga_x_gdme_0, mgga_x_gdme_0_defaults, mgga_x_gdme_0_required

const mgga_x_gdme_kos_defaults = (dens_threshold = 1.0e-15, params_a_AA = 7.0685834705770345, params_a_BB = 9.16297857297023, params_a_a = 0.00638, zeta_threshold = 2.220446049250313e-16)
const mgga_x_gdme_kos_required = ()

function mgga_x_gdme_kos(rho, sigma, lapl, tau; params = NamedTuple())
    p = resolve_params(mgga_x_gdme_kos_defaults, mgga_x_gdme_kos_required, params)
    v = mgga_variables(rho, sigma, lapl, tau, Val(3))
    return mgga_x_gdme_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.dens_threshold, p.params_a_AA, p.params_a_BB, p.params_a_a, p.zeta_threshold)
end

function mgga_x_gdme_kos(na, nb, gaa, gab, gbb, la, lb, ta, tb; params = NamedTuple())
    p = resolve_params(mgga_x_gdme_kos_defaults, mgga_x_gdme_kos_required, params)
    v = mgga_variables(na, nb, gaa, gab, gbb, la, lb, ta, tb, Val(3))
    return mgga_x_gdme_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.dens_threshold, p.params_a_AA, p.params_a_BB, p.params_a_a, p.zeta_threshold)
end

export mgga_x_gdme_kos, mgga_x_gdme_kos_defaults, mgga_x_gdme_kos_required

const mgga_x_gdme_nv_defaults = (dens_threshold = 1.0e-15, params_a_AA = 7.0685834705770345, params_a_BB = 9.16297857297023, params_a_a = 0.5, zeta_threshold = 2.220446049250313e-16)
const mgga_x_gdme_nv_required = ()

function mgga_x_gdme_nv(rho, sigma, lapl, tau; params = NamedTuple())
    p = resolve_params(mgga_x_gdme_nv_defaults, mgga_x_gdme_nv_required, params)
    v = mgga_variables(rho, sigma, lapl, tau, Val(3))
    return mgga_x_gdme_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.dens_threshold, p.params_a_AA, p.params_a_BB, p.params_a_a, p.zeta_threshold)
end

function mgga_x_gdme_nv(na, nb, gaa, gab, gbb, la, lb, ta, tb; params = NamedTuple())
    p = resolve_params(mgga_x_gdme_nv_defaults, mgga_x_gdme_nv_required, params)
    v = mgga_variables(na, nb, gaa, gab, gbb, la, lb, ta, tb, Val(3))
    return mgga_x_gdme_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.dens_threshold, p.params_a_AA, p.params_a_BB, p.params_a_a, p.zeta_threshold)
end

export mgga_x_gdme_nv, mgga_x_gdme_nv_defaults, mgga_x_gdme_nv_required

const mgga_x_gdme_vt_defaults = (dens_threshold = 1.0e-15, params_a_AA = 7.31275, params_a_BB = 5.43182, params_a_a = 0.0, zeta_threshold = 2.220446049250313e-16)
const mgga_x_gdme_vt_required = ()

function mgga_x_gdme_vt(rho, sigma, lapl, tau; params = NamedTuple())
    p = resolve_params(mgga_x_gdme_vt_defaults, mgga_x_gdme_vt_required, params)
    v = mgga_variables(rho, sigma, lapl, tau, Val(3))
    return mgga_x_gdme_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.dens_threshold, p.params_a_AA, p.params_a_BB, p.params_a_a, p.zeta_threshold)
end

function mgga_x_gdme_vt(na, nb, gaa, gab, gbb, la, lb, ta, tb; params = NamedTuple())
    p = resolve_params(mgga_x_gdme_vt_defaults, mgga_x_gdme_vt_required, params)
    v = mgga_variables(na, nb, gaa, gab, gbb, la, lb, ta, tb, Val(3))
    return mgga_x_gdme_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.dens_threshold, p.params_a_AA, p.params_a_BB, p.params_a_a, p.zeta_threshold)
end

export mgga_x_gdme_vt, mgga_x_gdme_vt_defaults, mgga_x_gdme_vt_required
