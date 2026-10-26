# Auto-generated from the Libxc sources
# python/mgga_exc/mgga_c_ltapw.py -- do not edit by hand.
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
# args: rs, z, xt, xs0, xs1, u0, u1, t0, t1, params_a_ltafrac, zeta_threshold
const mgga_c_ltapw_energy = function (rs, z, xt, xs0, xs1, u0, u1, t0, t1, params_a_ltafrac, zeta_threshold)
    @inbounds begin
        cse_tmp_0 = 1.8171205928321397
        cse_tmp_1 = (5 // 9) * cse_tmp_0 / 4.60115111447049
        cse_tmp_2 = (3 // 5) * params_a_ltafrac
        cse_tmp_3 = (3 // 8) / (pi * rs ^ 3)
        cse_tmp_4 = cse_tmp_3 * NaNMath.pow(cse_tmp_1 * t0, cse_tmp_2) * (z + 1)
        cse_tmp_5 = cse_tmp_3 * NaNMath.pow(cse_tmp_1 * t1, cse_tmp_2) * (1 - z)
        cse_tmp_6 = cse_tmp_4 + cse_tmp_5
        cse_tmp_7 = cse_tmp_0 / (1.4645918875615234 * NaNMath.pow(cse_tmp_6, 0.3333333333333333))
        cse_tmp_8 = 1.7320508075688772 / (1.772453850905516 * NaNMath.sqrt(cse_tmp_6))
        cse_tmp_9 = 3.3019272488946267 / (2.1450293971110255 * NaNMath.pow(cse_tmp_6, 0.6666666666666666))
        cse_tmp_10 = 1.5874010519681994 * 1.2009369551760027 / (1.2102032422537643 * NaNMath.pow(cse_tmp_6, 0.16666666666666666))
        cse_tmp_11 = (-0.0066441467 * cse_tmp_7 - 0.062182) * xc_log1p((0.2361579087 * cse_tmp_10 + 0.1115420716 * cse_tmp_7 + 0.0509332762 * cse_tmp_8 + 0.00766299877 * cse_tmp_9) ^ (-1))
        cse_tmp_12 = 0.58482233974552 * (-0.00187867875 * cse_tmp_7 - 0.033774) * xc_log1p((0.174898659 * cse_tmp_10 + 0.0611832897 * cse_tmp_7 + 0.01486495062 * cse_tmp_8 + 0.004193970885 * cse_tmp_9) ^ (-1))
        cse_tmp_13 = cse_tmp_4 - cse_tmp_5
        cse_tmp_14 = cse_tmp_13 / cse_tmp_6
        cse_tmp_15 = NaNMath.pow(zeta_threshold, 1.3333333333333333) - 1
        cse_tmp_16 = zeta_threshold - 1
        cse_tmp_17 = -cse_tmp_14
        cse_tmp_18 = (my_piecewise3(1 - cse_tmp_14 <= zeta_threshold, cse_tmp_15, xc_expm1((4 // 3) * xc_log1p(my_piecewise3(cse_tmp_17 > cse_tmp_16, cse_tmp_17, cse_tmp_16)))) + my_piecewise3(cse_tmp_14 + 1 <= zeta_threshold, cse_tmp_15, xc_expm1((4 // 3) * xc_log1p(my_piecewise3(cse_tmp_14 > cse_tmp_16, cse_tmp_14, cse_tmp_16))))) / (-2 + 2 * 1.2599210498948732)
        cse_tmp_11 - cse_tmp_12 * cse_tmp_18 + cse_tmp_13 ^ 4 * cse_tmp_18 * (-cse_tmp_11 + cse_tmp_12 + (-0.0031941866 * cse_tmp_7 - 0.03109) * xc_log1p((0.2194783005 * cse_tmp_10 + 0.0963432465 * cse_tmp_7 + 0.052327579 * cse_tmp_8 + 0.004859133825 * cse_tmp_9) ^ (-1))) / cse_tmp_6 ^ 4
    end
end
export mgga_c_ltapw_energy

const mgga_c_ltapw_defaults = NamedTuple()
const mgga_c_ltapw_required = (:params_a_ltafrac, :zeta_threshold)

function mgga_c_ltapw(rho, sigma, lapl, tau; params = NamedTuple())
    p = resolve_params(mgga_c_ltapw_defaults, mgga_c_ltapw_required, params)
    v = mgga_variables(rho, sigma, lapl, tau, Val(3))
    return mgga_c_ltapw_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.params_a_ltafrac, p.zeta_threshold)
end

function mgga_c_ltapw(na, nb, gaa, gab, gbb, la, lb, ta, tb; params = NamedTuple())
    p = resolve_params(mgga_c_ltapw_defaults, mgga_c_ltapw_required, params)
    v = mgga_variables(na, nb, gaa, gab, gbb, la, lb, ta, tb, Val(3))
    return mgga_c_ltapw_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.params_a_ltafrac, p.zeta_threshold)
end

export mgga_c_ltapw, mgga_c_ltapw_defaults, mgga_c_ltapw_required

const mgga_c_hltapw_defaults = (params_a_ltafrac = 0.5, zeta_threshold = 2.220446049250313e-16)
const mgga_c_hltapw_required = ()

function mgga_c_hltapw(rho, sigma, lapl, tau; params = NamedTuple())
    p = resolve_params(mgga_c_hltapw_defaults, mgga_c_hltapw_required, params)
    v = mgga_variables(rho, sigma, lapl, tau, Val(3))
    return mgga_c_ltapw_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.params_a_ltafrac, p.zeta_threshold)
end

function mgga_c_hltapw(na, nb, gaa, gab, gbb, la, lb, ta, tb; params = NamedTuple())
    p = resolve_params(mgga_c_hltapw_defaults, mgga_c_hltapw_required, params)
    v = mgga_variables(na, nb, gaa, gab, gbb, la, lb, ta, tb, Val(3))
    return mgga_c_ltapw_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.params_a_ltafrac, p.zeta_threshold)
end

export mgga_c_hltapw, mgga_c_hltapw_defaults, mgga_c_hltapw_required
