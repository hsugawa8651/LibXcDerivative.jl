# Auto-generated from the Libxc sources
# python/mgga_exc/mgga_xc_lp90.py -- do not edit by hand.
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
# args: rs, z, xt, xs0, xs1, u0, u1, t0, t1, params_a_c0, params_a_d0, params_a_k, zeta_threshold
const mgga_xc_lp90_energy = function (rs, z, xt, xs0, xs1, u0, u1, t0, t1, params_a_c0, params_a_d0, params_a_k, zeta_threshold)
    @inbounds begin
        cse_tmp_0 = NaNMath.pow(zeta_threshold, 1.6666666666666667) - 1
        cse_tmp_1 = zeta_threshold - 1
        cse_tmp_2 = -z
        (-params_a_c0 - params_a_d0 * (xt ^ 2 / 8 - 1.2599210498948732 * (u0 * (my_piecewise3(z + 1 <= zeta_threshold, cse_tmp_0, xc_expm1((5 // 3) * xc_log1p(my_piecewise3(z > cse_tmp_1, z, cse_tmp_1)))) + 1) + u1 * (my_piecewise3(1 - z <= zeta_threshold, cse_tmp_0, xc_expm1((5 // 3) * xc_log1p(my_piecewise3(cse_tmp_2 > cse_tmp_1, cse_tmp_2, cse_tmp_1)))) + 1)) / 32)) / (params_a_k + 3.3019272488946267 * 1.4645918875615234 * rs / 3)
    end
end
export mgga_xc_lp90_energy

const mgga_xc_lp90_defaults = (params_a_c0 = 0.80569, params_a_d0 = 0.024271, params_a_k = 0.0040743, zeta_threshold = 2.220446049250313e-16)
const mgga_xc_lp90_required = ()

function mgga_xc_lp90(rho, sigma, lapl, tau; params = NamedTuple())
    p = resolve_params(mgga_xc_lp90_defaults, mgga_xc_lp90_required, params)
    v = mgga_variables(rho, sigma, lapl, tau, Val(3))
    return mgga_xc_lp90_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.params_a_c0, p.params_a_d0, p.params_a_k, p.zeta_threshold)
end

function mgga_xc_lp90(na, nb, gaa, gab, gbb, la, lb, ta, tb; params = NamedTuple())
    p = resolve_params(mgga_xc_lp90_defaults, mgga_xc_lp90_required, params)
    v = mgga_variables(na, nb, gaa, gab, gbb, la, lb, ta, tb, Val(3))
    return mgga_xc_lp90_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.params_a_c0, p.params_a_d0, p.params_a_k, p.zeta_threshold)
end

export mgga_xc_lp90, mgga_xc_lp90_defaults, mgga_xc_lp90_required
