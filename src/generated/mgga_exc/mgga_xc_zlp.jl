# Auto-generated from the Libxc sources
# python/mgga_exc/mgga_xc_zlp.py -- do not edit by hand.
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
# args: rs, z, xt, xs0, xs1, u0, u1, t0, t1, zeta_threshold
const mgga_xc_zlp_energy = function (rs, z, xt, xs0, xs1, u0, u1, t0, t1, zeta_threshold)
    @inbounds begin
        cse_tmp_0 = 1.4645918875615234
        cse_tmp_1 = 1.8171205928321397 / cse_tmp_0
        cse_tmp_2 = NaNMath.pow(zeta_threshold, 1.6666666666666667) - 1
        cse_tmp_3 = zeta_threshold - 1
        cse_tmp_4 = -z
        0.0010235535 * cse_tmp_1 * (-0.01077545 * cse_tmp_1 * (xt ^ 2 / 8 - 1.2599210498948732 * (u0 * (my_piecewise3(z + 1 <= zeta_threshold, cse_tmp_2, xc_expm1((5 // 3) * xc_log1p(my_piecewise3(z > cse_tmp_3, z, cse_tmp_3)))) + 1) + u1 * (my_piecewise3(1 - z <= zeta_threshold, cse_tmp_2, xc_expm1((5 // 3) * xc_log1p(my_piecewise3(cse_tmp_4 > cse_tmp_3, cse_tmp_4, cse_tmp_3)))) + 1)) / 32) - 0.414216 * cse_tmp_1) * xc_x_minus_log1p(162.831416888972 * 3.3019272488946267 * cse_tmp_0 * rs) / rs ^ 2
    end
end
export mgga_xc_zlp_energy

const mgga_xc_zlp_defaults = (zeta_threshold = 2.220446049250313e-16,)
const mgga_xc_zlp_required = ()

function mgga_xc_zlp(rho, sigma, lapl, tau; params = NamedTuple())
    p = resolve_params(mgga_xc_zlp_defaults, mgga_xc_zlp_required, params)
    v = mgga_variables(rho, sigma, lapl, tau, Val(3))
    return mgga_xc_zlp_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.zeta_threshold)
end

function mgga_xc_zlp(na, nb, gaa, gab, gbb, la, lb, ta, tb; params = NamedTuple())
    p = resolve_params(mgga_xc_zlp_defaults, mgga_xc_zlp_required, params)
    v = mgga_variables(na, nb, gaa, gab, gbb, la, lb, ta, tb, Val(3))
    return mgga_xc_zlp_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.zeta_threshold)
end

export mgga_xc_zlp, mgga_xc_zlp_defaults, mgga_xc_zlp_required
