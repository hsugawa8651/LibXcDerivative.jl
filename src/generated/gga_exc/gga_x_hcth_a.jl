# Auto-generated from the Libxc sources
# python/gga_exc/gga_x_hcth_a.py -- do not edit by hand.
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
# args: rs, z, xt, xs0, xs1, dens_threshold, params_a_beta, params_a_c0, params_a_c1, params_a_c2, params_a_gamma, zeta_threshold
const gga_x_hcth_a_energy = function (rs, z, xt, xs0, xs1, dens_threshold, params_a_beta, params_a_c0, params_a_c1, params_a_c2, params_a_gamma, zeta_threshold)
    @inbounds begin
        cse_tmp_0 = z + 1
        cse_tmp_1 = (3 // 8) / (pi * rs ^ 3)
        cse_tmp_2 = -params_a_c0
        cse_tmp_3 = xs0 ^ 2
        cse_tmp_4 = cse_tmp_3 < 1 // 16
        cse_tmp_5 = cse_tmp_3 - 1300075 // 226492416 * xs0 ^ 28 + (676039 // 104857600) * xs0 ^ 26 - 88179 // 12058624 * xs0 ^ 24 + (46189 // 5505024) * xs0 ^ 22 - 12155 // 1245184 * xs0 ^ 20 + (6435 // 557056) * xs0 ^ 18 - 143 // 10240 * xs0 ^ 16 + (231 // 13312) * xs0 ^ 14 - 63 // 2816 * xs0 ^ 12 + (35 // 1152) * xs0 ^ 10 - 5 // 112 * xs0 ^ 8 + (3 // 40) * xs0 ^ 6 - xs0 ^ 4 / 6
        cse_tmp_6 = NaNMath.sqrt(my_piecewise3(cse_tmp_3 > 1 // 16, cse_tmp_3, 1 // 16))
        cse_tmp_7 = cse_tmp_6 * xc_asinh(cse_tmp_6)
        cse_tmp_8 = params_a_beta * params_a_gamma
        cse_tmp_9 = 0.676994198375506 * 1.5874010519681994
        cse_tmp_10 = cse_tmp_9 * params_a_beta * params_a_c1
        cse_tmp_11 = cse_tmp_5 * cse_tmp_8
        cse_tmp_12 = cse_tmp_7 * cse_tmp_8
        cse_tmp_13 = my_piecewise3(cse_tmp_4, cse_tmp_11, cse_tmp_12) + 1
        cse_tmp_14 = cse_tmp_3 / cse_tmp_13 ^ 2
        cse_tmp_15 = cse_tmp_9 * params_a_c2
        cse_tmp_16 = cse_tmp_0 <= zeta_threshold
        cse_tmp_17 = zeta_threshold - 1
        cse_tmp_18 = 1 - z
        cse_tmp_19 = cse_tmp_18 <= zeta_threshold
        cse_tmp_20 = -cse_tmp_17
        cse_tmp_21 = my_piecewise5(cse_tmp_16, cse_tmp_17, cse_tmp_19, cse_tmp_20, z) + 1
        cse_tmp_22 = NaNMath.pow(zeta_threshold, 1.3333333333333333)
        cse_tmp_23 = 0.184639691595506 * 1.8171205928321397 / (1.4645918875615234 * rs)
        cse_tmp_24 = xs1 ^ 2
        cse_tmp_25 = cse_tmp_24 < 1 // 16
        cse_tmp_26 = cse_tmp_24 - 1300075 // 226492416 * xs1 ^ 28 + (676039 // 104857600) * xs1 ^ 26 - 88179 // 12058624 * xs1 ^ 24 + (46189 // 5505024) * xs1 ^ 22 - 12155 // 1245184 * xs1 ^ 20 + (6435 // 557056) * xs1 ^ 18 - 143 // 10240 * xs1 ^ 16 + (231 // 13312) * xs1 ^ 14 - 63 // 2816 * xs1 ^ 12 + (35 // 1152) * xs1 ^ 10 - 5 // 112 * xs1 ^ 8 + (3 // 40) * xs1 ^ 6 - xs1 ^ 4 / 6
        cse_tmp_27 = NaNMath.sqrt(my_piecewise3(cse_tmp_24 > 1 // 16, cse_tmp_24, 1 // 16))
        cse_tmp_28 = cse_tmp_27 * xc_asinh(cse_tmp_27)
        cse_tmp_29 = cse_tmp_26 * cse_tmp_8
        cse_tmp_30 = cse_tmp_28 * cse_tmp_8
        cse_tmp_31 = my_piecewise3(cse_tmp_25, cse_tmp_29, cse_tmp_30) + 1
        cse_tmp_32 = cse_tmp_24 / cse_tmp_31 ^ 2
        cse_tmp_33 = my_piecewise5(cse_tmp_19, cse_tmp_17, cse_tmp_16, cse_tmp_20, -z) + 1
        my_piecewise3(cse_tmp_0 * cse_tmp_1 <= dens_threshold, 0, -cse_tmp_23 * (-cse_tmp_10 * cse_tmp_3 / (cse_tmp_8 * my_piecewise3(cse_tmp_4, cse_tmp_5, cse_tmp_7) + 1) - cse_tmp_2 - cse_tmp_15 * (cse_tmp_13 * my_piecewise3(cse_tmp_4, -cse_tmp_11 * cse_tmp_14, -cse_tmp_12 * cse_tmp_14) + cse_tmp_3) / cse_tmp_13) * my_piecewise3(cse_tmp_21 <= zeta_threshold, cse_tmp_22, NaNMath.pow(cse_tmp_21, 1.3333333333333333))) + my_piecewise3(cse_tmp_1 * cse_tmp_18 <= dens_threshold, 0, -cse_tmp_23 * (-cse_tmp_10 * cse_tmp_24 / (cse_tmp_8 * my_piecewise3(cse_tmp_25, cse_tmp_26, cse_tmp_28) + 1) - cse_tmp_15 * (cse_tmp_24 + cse_tmp_31 * my_piecewise3(cse_tmp_25, -cse_tmp_29 * cse_tmp_32, -cse_tmp_30 * cse_tmp_32)) / cse_tmp_31 - cse_tmp_2) * my_piecewise3(cse_tmp_33 <= zeta_threshold, cse_tmp_22, NaNMath.pow(cse_tmp_33, 1.3333333333333333)))
    end
end
export gga_x_hcth_a_energy

const gga_x_hcth_a_defaults = (dens_threshold = 1.0e-15, params_a_beta = 0.0042, params_a_c0 = 1.09878, params_a_c1 = -2.51173, params_a_c2 = 0.0156233, params_a_gamma = 6.0, zeta_threshold = 2.220446049250313e-16)
const gga_x_hcth_a_required = ()

function gga_x_hcth_a(rho, sigma; params = NamedTuple())
    p = resolve_params(gga_x_hcth_a_defaults, gga_x_hcth_a_required, params)
    v = gga_variables(rho, sigma, Val(3))
    return gga_x_hcth_a_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.dens_threshold, p.params_a_beta, p.params_a_c0, p.params_a_c1, p.params_a_c2, p.params_a_gamma, p.zeta_threshold)
end

function gga_x_hcth_a(na, nb, gaa, gab, gbb; params = NamedTuple())
    p = resolve_params(gga_x_hcth_a_defaults, gga_x_hcth_a_required, params)
    v = gga_variables(na, nb, gaa, gab, gbb, Val(3))
    return gga_x_hcth_a_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.dens_threshold, p.params_a_beta, p.params_a_c0, p.params_a_c1, p.params_a_c2, p.params_a_gamma, p.zeta_threshold)
end

export gga_x_hcth_a, gga_x_hcth_a_defaults, gga_x_hcth_a_required
