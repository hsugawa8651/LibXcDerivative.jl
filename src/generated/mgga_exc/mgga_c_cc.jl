# Auto-generated from the Libxc sources
# python/mgga_exc/mgga_c_cc.py -- do not edit by hand.
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
# args: rs, z, xt, xs0, xs1, u0, u1, t0, t1, zeta_threshold
const mgga_c_cc_energy = function (rs, z, xt, xs0, xs1, u0, u1, t0, t1, zeta_threshold)
    @inbounds begin
        cse_tmp_0 = z + 1
        cse_tmp_1 = 1 - z
        cse_tmp_2 = cse_tmp_0 <= zeta_threshold
        cse_tmp_3 = NaNMath.pow(zeta_threshold, 1.6666666666666667) - 1
        cse_tmp_4 = zeta_threshold - 1
        cse_tmp_5 = xc_log1p(my_piecewise3(z > cse_tmp_4, z, cse_tmp_4))
        cse_tmp_6 = cse_tmp_1 <= zeta_threshold
        cse_tmp_7 = -z
        cse_tmp_8 = xc_log1p(my_piecewise3(cse_tmp_7 > cse_tmp_4, cse_tmp_7, cse_tmp_4))
        cse_tmp_9 = t0 * (my_piecewise3(cse_tmp_2, cse_tmp_3, xc_expm1((5 // 3) * cse_tmp_5)) + 1) + t1 * (my_piecewise3(cse_tmp_6, cse_tmp_3, xc_expm1((5 // 3) * cse_tmp_8)) + 1)
        cse_tmp_10 = 1.2599210498948732
        cse_tmp_11 = NaNMath.sqrt(rs)
        cse_tmp_12 = NaNMath.pow(rs, 1.5)
        cse_tmp_13 = rs ^ 2
        cse_tmp_14 = (-0.01328816518 * rs - 0.0621814) * xc_log1p((0.47231125998 * cse_tmp_11 + 0.10186556948 * cse_tmp_12 + 0.030651699316 * cse_tmp_13 + 0.22308199064 * rs) ^ (-1))
        cse_tmp_15 = 0.5848223622634646207262238663759 * (-0.00375733525 * rs - 0.0337738) * xc_log1p((0.3497952466 * cse_tmp_11 + 0.029729725188 * cse_tmp_12 + 0.016775784198 * cse_tmp_13 + 0.12236585478 * rs) ^ (-1))
        cse_tmp_16 = NaNMath.pow(zeta_threshold, 1.3333333333333333) - 1
        cse_tmp_17 = (my_piecewise3(cse_tmp_2, cse_tmp_16, xc_expm1((4 // 3) * cse_tmp_5)) + my_piecewise3(cse_tmp_6, cse_tmp_16, xc_expm1((4 // 3) * cse_tmp_8))) / (2 * cse_tmp_10 - 2)
        (cse_tmp_0 * cse_tmp_1 + 1.5874010519681994 * z ^ 2 * (2 * cse_tmp_10 * cse_tmp_9 - xt ^ 2) / (4 * cse_tmp_9)) * (cse_tmp_14 - cse_tmp_15 * cse_tmp_17 + cse_tmp_17 * z ^ 4 * (-cse_tmp_14 + cse_tmp_15 + (-0.006388517036 * rs - 0.0310907) * xc_log1p((0.43896648423 * cse_tmp_11 + 0.10465751434 * cse_tmp_12 + 0.019436972919 * cse_tmp_13 + 0.19269083139 * rs) ^ (-1))))
    end
end
export mgga_c_cc_energy

const mgga_c_cc_defaults = (zeta_threshold = 2.220446049250313e-16,)
const mgga_c_cc_required = ()

function mgga_c_cc(rho, sigma, lapl, tau; params = NamedTuple())
    p = resolve_params(mgga_c_cc_defaults, mgga_c_cc_required, params)
    v = mgga_variables(rho, sigma, lapl, tau, Val(3))
    return mgga_c_cc_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.zeta_threshold)
end

function mgga_c_cc(na, nb, gaa, gab, gbb, la, lb, ta, tb; params = NamedTuple())
    p = resolve_params(mgga_c_cc_defaults, mgga_c_cc_required, params)
    v = mgga_variables(na, nb, gaa, gab, gbb, la, lb, ta, tb, Val(3))
    return mgga_c_cc_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.zeta_threshold)
end

export mgga_c_cc, mgga_c_cc_defaults, mgga_c_cc_required
