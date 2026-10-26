# Auto-generated from the Libxc sources
# python/mgga_exc/mgga_c_ccalda.py -- do not edit by hand.
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
# args: rs, z, xt, xs0, xs1, u0, u1, t0, t1, params_a_c, zeta_threshold
const mgga_c_ccalda_energy = function (rs, z, xt, xs0, xs1, u0, u1, t0, t1, params_a_c, zeta_threshold)
    @inbounds begin
        cse_tmp_0 = xt ^ 2
        cse_tmp_1 = z + 1 <= zeta_threshold
        cse_tmp_2 = NaNMath.pow(zeta_threshold, 1.6666666666666667) - 1
        cse_tmp_3 = zeta_threshold - 1
        cse_tmp_4 = xc_log1p(my_piecewise3(z > cse_tmp_3, z, cse_tmp_3))
        cse_tmp_5 = 1 - z <= zeta_threshold
        cse_tmp_6 = -z
        cse_tmp_7 = xc_log1p(my_piecewise3(cse_tmp_6 > cse_tmp_3, cse_tmp_6, cse_tmp_3))
        cse_tmp_8 = t0 * (my_piecewise3(cse_tmp_1, cse_tmp_2, xc_expm1((5 // 3) * cse_tmp_4)) + 1) + t1 * (my_piecewise3(cse_tmp_5, cse_tmp_2, xc_expm1((5 // 3) * cse_tmp_7)) + 1)
        cse_tmp_9 = NaNMath.sqrt(rs)
        cse_tmp_10 = NaNMath.pow(rs, 1.5)
        cse_tmp_11 = rs ^ 2
        cse_tmp_12 = (-0.01328816518 * rs - 0.0621814) * xc_log1p((0.10186556948 * cse_tmp_10 + 0.030651699316 * cse_tmp_11 + 0.47231125998 * cse_tmp_9 + 0.22308199064 * rs) ^ (-1))
        cse_tmp_13 = 0.5848223622634646207262238663759 * (-0.00375733525 * rs - 0.0337738) * xc_log1p((0.029729725188 * cse_tmp_10 + 0.016775784198 * cse_tmp_11 + 0.3497952466 * cse_tmp_9 + 0.12236585478 * rs) ^ (-1))
        cse_tmp_14 = 1.2599210498948732
        cse_tmp_15 = NaNMath.pow(zeta_threshold, 1.3333333333333333) - 1
        cse_tmp_16 = (my_piecewise3(cse_tmp_1, cse_tmp_15, xc_expm1((4 // 3) * cse_tmp_4)) + my_piecewise3(cse_tmp_5, cse_tmp_15, xc_expm1((4 // 3) * cse_tmp_7))) / (2 * cse_tmp_14 - 2)
        cse_tmp_17 = cse_tmp_12 - cse_tmp_13 * cse_tmp_16 + cse_tmp_16 * z ^ 4 * (-cse_tmp_12 + cse_tmp_13 + (-0.006388517036 * rs - 0.0310907) * xc_log1p((0.10465751434 * cse_tmp_10 + 0.019436972919 * cse_tmp_11 + 0.43896648423 * cse_tmp_9 + 0.19269083139 * rs) ^ (-1)))
        cse_tmp_18 = (10 // 9) * 1.4422495703074083 * params_a_c * (-cse_tmp_0 / 8 + cse_tmp_14 * cse_tmp_8 / 4) / 4.60115111447049
        cse_tmp_19 = (cse_tmp_18 + 1) ^ (-1)
        -1.5874010519681994 * cse_tmp_0 * cse_tmp_17 * z ^ 2 * (params_a_c + 1) * my_piecewise3(cse_tmp_18 <= 1, cse_tmp_18 * cse_tmp_19, 1 - cse_tmp_19) / (4 * cse_tmp_8 * params_a_c) + cse_tmp_17
    end
end
export mgga_c_ccalda_energy

const mgga_c_ccalda_defaults = (params_a_c = 10000.0, zeta_threshold = 2.220446049250313e-16)
const mgga_c_ccalda_required = ()

function mgga_c_ccalda(rho, sigma, lapl, tau; params = NamedTuple())
    p = resolve_params(mgga_c_ccalda_defaults, mgga_c_ccalda_required, params)
    v = mgga_variables(rho, sigma, lapl, tau, Val(3))
    return mgga_c_ccalda_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.params_a_c, p.zeta_threshold)
end

function mgga_c_ccalda(na, nb, gaa, gab, gbb, la, lb, ta, tb; params = NamedTuple())
    p = resolve_params(mgga_c_ccalda_defaults, mgga_c_ccalda_required, params)
    v = mgga_variables(na, nb, gaa, gab, gbb, la, lb, ta, tb, Val(3))
    return mgga_c_ccalda_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.params_a_c, p.zeta_threshold)
end

export mgga_c_ccalda, mgga_c_ccalda_defaults, mgga_c_ccalda_required
