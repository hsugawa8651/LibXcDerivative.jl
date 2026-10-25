# Auto-generated from the Libxc sources
# python/gga_exc/gga_c_sogga11.py -- do not edit by hand.
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
# args: rs, z, xt, xs0, xs1, params_a_sogga11_a_0, params_a_sogga11_a_1, params_a_sogga11_a_2, params_a_sogga11_a_3, params_a_sogga11_a_4, params_a_sogga11_a_5, params_a_sogga11_b_0, params_a_sogga11_b_1, params_a_sogga11_b_2, params_a_sogga11_b_3, params_a_sogga11_b_4, params_a_sogga11_b_5, zeta_threshold
const gga_c_sogga11_energy = function (rs, z, xt, xs0, xs1, params_a_sogga11_a_0, params_a_sogga11_a_1, params_a_sogga11_a_2, params_a_sogga11_a_3, params_a_sogga11_a_4, params_a_sogga11_a_5, params_a_sogga11_b_0, params_a_sogga11_b_1, params_a_sogga11_b_2, params_a_sogga11_b_3, params_a_sogga11_b_4, params_a_sogga11_b_5, zeta_threshold)
    @inbounds begin
        cse_tmp_0 = NaNMath.sqrt(rs)
        cse_tmp_1 = NaNMath.pow(rs, 1.5)
        cse_tmp_2 = rs ^ 2
        cse_tmp_3 = (-0.01328816518 * rs - 0.0621814) * xc_log1p((0.47231125998 * cse_tmp_0 + 0.10186556948 * cse_tmp_1 + 0.030651699316 * cse_tmp_2 + 0.22308199064 * rs) ^ (-1))
        cse_tmp_4 = 0.5848223622634646207262238663759 * (-0.00375733525 * rs - 0.0337738) * xc_log1p((0.3497952466 * cse_tmp_0 + 0.029729725188 * cse_tmp_1 + 0.016775784198 * cse_tmp_2 + 0.12236585478 * rs) ^ (-1))
        cse_tmp_5 = 1.2599210498948732
        cse_tmp_6 = z + 1 <= zeta_threshold
        cse_tmp_7 = NaNMath.pow(zeta_threshold, 1.3333333333333333) - 1
        cse_tmp_8 = zeta_threshold - 1
        cse_tmp_9 = xc_log1p(my_piecewise3(z > cse_tmp_8, z, cse_tmp_8))
        cse_tmp_10 = 1 - z <= zeta_threshold
        cse_tmp_11 = -z
        cse_tmp_12 = xc_log1p(my_piecewise3(cse_tmp_11 > cse_tmp_8, cse_tmp_11, cse_tmp_8))
        cse_tmp_13 = (my_piecewise3(cse_tmp_10, cse_tmp_7, xc_expm1((4 // 3) * cse_tmp_12)) + my_piecewise3(cse_tmp_6, cse_tmp_7, xc_expm1((4 // 3) * cse_tmp_9))) / (2 * cse_tmp_5 - 2)
        cse_tmp_14 = -cse_tmp_13 * cse_tmp_4 + cse_tmp_13 * z ^ 4 * (-cse_tmp_3 + cse_tmp_4 + (-0.006388517036 * rs - 0.0310907) * xc_log1p((0.43896648423 * cse_tmp_0 + 0.10465751434 * cse_tmp_1 + 0.019436972919 * cse_tmp_2 + 0.19269083139 * rs) ^ (-1))) + cse_tmp_3
        cse_tmp_15 = NaNMath.pow(zeta_threshold, 0.6666666666666666) - 1
        cse_tmp_16 = my_piecewise3(cse_tmp_10, cse_tmp_15, xc_expm1((2 // 3) * cse_tmp_12)) / 2 + my_piecewise3(cse_tmp_6, cse_tmp_15, xc_expm1((2 // 3) * cse_tmp_9)) / 2 + 1
        cse_tmp_17 = 0.0020851975375 * cse_tmp_16 * cse_tmp_5 * xt ^ 2 / (cse_tmp_14 * rs)
        cse_tmp_18 = xc_expm1(cse_tmp_17)
        cse_tmp_19 = 1 - cse_tmp_17
        cse_tmp_20 = 1.5874010519681994
        cse_tmp_14 * (-cse_tmp_17 * params_a_sogga11_a_1 / cse_tmp_19 - cse_tmp_18 ^ 5 * params_a_sogga11_b_5 + cse_tmp_18 ^ 4 * params_a_sogga11_b_4 - cse_tmp_18 ^ 3 * params_a_sogga11_b_3 + cse_tmp_18 ^ 2 * params_a_sogga11_b_2 - cse_tmp_18 * params_a_sogga11_b_1 + params_a_sogga11_a_0 + params_a_sogga11_b_0 + 4.34804877039606e-6 * cse_tmp_16 ^ 2 * cse_tmp_20 * params_a_sogga11_a_2 * xt ^ 4 / (cse_tmp_14 ^ 2 * cse_tmp_19 ^ 2 * cse_tmp_2) - 1.81330811779195e-8 * cse_tmp_16 ^ 3 * params_a_sogga11_a_3 * xt ^ 6 / (cse_tmp_14 ^ 3 * cse_tmp_19 ^ 3 * rs ^ 3) + 3.78110562194854e-11 * cse_tmp_16 ^ 4 * cse_tmp_5 * params_a_sogga11_a_4 * xt ^ 8 / (cse_tmp_14 ^ 4 * cse_tmp_19 ^ 4 * rs ^ 4) - 7.88435213191451e-14 * cse_tmp_16 ^ 5 * cse_tmp_20 * params_a_sogga11_a_5 * xt ^ 10 / (cse_tmp_14 ^ 5 * cse_tmp_19 ^ 5 * rs ^ 5))
    end
end
export gga_c_sogga11_energy

const gga_c_sogga11_defaults = (params_a_sogga11_a_0 = 0.5, params_a_sogga11_a_1 = -4.62334, params_a_sogga11_a_2 = 8.0041, params_a_sogga11_a_3 = -130.226, params_a_sogga11_a_4 = 38.2685, params_a_sogga11_a_5 = 69.5599, params_a_sogga11_b_0 = 0.5, params_a_sogga11_b_1 = 3.62334, params_a_sogga11_b_2 = 9.36393, params_a_sogga11_b_3 = 34.5114, params_a_sogga11_b_4 = -18.5684, params_a_sogga11_b_5 = -0.16519, zeta_threshold = 2.220446049250313e-16)
const gga_c_sogga11_required = ()

function gga_c_sogga11(rho, sigma; params = NamedTuple())
    p = resolve_params(gga_c_sogga11_defaults, gga_c_sogga11_required, params)
    v = gga_variables(rho, sigma, Val(3))
    return gga_c_sogga11_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.params_a_sogga11_a_0, p.params_a_sogga11_a_1, p.params_a_sogga11_a_2, p.params_a_sogga11_a_3, p.params_a_sogga11_a_4, p.params_a_sogga11_a_5, p.params_a_sogga11_b_0, p.params_a_sogga11_b_1, p.params_a_sogga11_b_2, p.params_a_sogga11_b_3, p.params_a_sogga11_b_4, p.params_a_sogga11_b_5, p.zeta_threshold)
end

function gga_c_sogga11(na, nb, gaa, gab, gbb; params = NamedTuple())
    p = resolve_params(gga_c_sogga11_defaults, gga_c_sogga11_required, params)
    v = gga_variables(na, nb, gaa, gab, gbb, Val(3))
    return gga_c_sogga11_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.params_a_sogga11_a_0, p.params_a_sogga11_a_1, p.params_a_sogga11_a_2, p.params_a_sogga11_a_3, p.params_a_sogga11_a_4, p.params_a_sogga11_a_5, p.params_a_sogga11_b_0, p.params_a_sogga11_b_1, p.params_a_sogga11_b_2, p.params_a_sogga11_b_3, p.params_a_sogga11_b_4, p.params_a_sogga11_b_5, p.zeta_threshold)
end

export gga_c_sogga11, gga_c_sogga11_defaults, gga_c_sogga11_required

const gga_c_sogga11_x_defaults = (params_a_sogga11_a_0 = 0.5, params_a_sogga11_a_1 = 78.2439, params_a_sogga11_a_2 = 25.7211, params_a_sogga11_a_3 = -13.883, params_a_sogga11_a_4 = -9.87375, params_a_sogga11_a_5 = -14.1357, params_a_sogga11_b_0 = 0.5, params_a_sogga11_b_1 = -79.2439, params_a_sogga11_b_2 = 16.3725, params_a_sogga11_b_3 = 2.08129, params_a_sogga11_b_4 = 7.50769, params_a_sogga11_b_5 = -10.1861, zeta_threshold = 2.220446049250313e-16)
const gga_c_sogga11_x_required = ()

function gga_c_sogga11_x(rho, sigma; params = NamedTuple())
    p = resolve_params(gga_c_sogga11_x_defaults, gga_c_sogga11_x_required, params)
    v = gga_variables(rho, sigma, Val(3))
    return gga_c_sogga11_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.params_a_sogga11_a_0, p.params_a_sogga11_a_1, p.params_a_sogga11_a_2, p.params_a_sogga11_a_3, p.params_a_sogga11_a_4, p.params_a_sogga11_a_5, p.params_a_sogga11_b_0, p.params_a_sogga11_b_1, p.params_a_sogga11_b_2, p.params_a_sogga11_b_3, p.params_a_sogga11_b_4, p.params_a_sogga11_b_5, p.zeta_threshold)
end

function gga_c_sogga11_x(na, nb, gaa, gab, gbb; params = NamedTuple())
    p = resolve_params(gga_c_sogga11_x_defaults, gga_c_sogga11_x_required, params)
    v = gga_variables(na, nb, gaa, gab, gbb, Val(3))
    return gga_c_sogga11_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.params_a_sogga11_a_0, p.params_a_sogga11_a_1, p.params_a_sogga11_a_2, p.params_a_sogga11_a_3, p.params_a_sogga11_a_4, p.params_a_sogga11_a_5, p.params_a_sogga11_b_0, p.params_a_sogga11_b_1, p.params_a_sogga11_b_2, p.params_a_sogga11_b_3, p.params_a_sogga11_b_4, p.params_a_sogga11_b_5, p.zeta_threshold)
end

export gga_c_sogga11_x, gga_c_sogga11_x_defaults, gga_c_sogga11_x_required
