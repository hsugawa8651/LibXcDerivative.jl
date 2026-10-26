# Auto-generated from the Libxc sources
# python/mgga_exc/mgga_x_r2scan.py -- do not edit by hand.
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
# args: rs, z, xt, xs0, xs1, u0, u1, t0, t1, XC_EPSILON, dens_threshold, params_a_c1, params_a_c2, params_a_d, params_a_dp2, params_a_eta, params_a_k1, zeta_threshold
const mgga_x_r2scan_energy = function (rs, z, xt, xs0, xs1, u0, u1, t0, t1, XC_EPSILON, dens_threshold, params_a_c1, params_a_c2, params_a_d, params_a_dp2, params_a_eta, params_a_k1, zeta_threshold)
    @inbounds begin
        cse_tmp_0 = z + 1
        cse_tmp_1 = (3 // 8) / (pi * rs ^ 3)
        cse_tmp_2 = -0.27123702538979 * params_a_eta - 0.120549789062129
        cse_tmp_3 = 3.3019272488946267
        cse_tmp_4 = cse_tmp_3 / (576 * 21.170591578193033 * params_a_dp2 ^ 4)
        cse_tmp_5 = xs0 ^ 2
        cse_tmp_6 = 1.8171205928321397
        cse_tmp_7 = 4.60115111447049
        cse_tmp_8 = cse_tmp_6 / (24 * cse_tmp_7)
        cse_tmp_9 = cse_tmp_5 * cse_tmp_8
        cse_tmp_10 = cse_tmp_9 * (cse_tmp_2 * exp(-cse_tmp_4 * xs0 ^ 4) + 10 // 81)
        cse_tmp_11 = cse_tmp_10 * params_a_k1 / (cse_tmp_10 + params_a_k1)
        cse_tmp_12 = cse_tmp_5 / 8
        cse_tmp_13 = (3 // 10) * cse_tmp_3 * cse_tmp_7
        cse_tmp_14 = (-cse_tmp_12 + t0) / (cse_tmp_12 * params_a_eta + cse_tmp_13)
        cse_tmp_15 = my_piecewise3(cse_tmp_14 > 0, 0, cse_tmp_14)
        cse_tmp_16 = cse_tmp_14 > 2.5
        cse_tmp_17 = my_piecewise3(cse_tmp_16, 2.5, cse_tmp_14)
        cse_tmp_18 = NaNMath.pow(XC_EPSILON, 1.3333333333333333)
        cse_tmp_19 = 0.202105943935811 * NaNMath.pow(my_piecewise3(cse_tmp_9 > cse_tmp_18, cse_tmp_9, cse_tmp_18), 0.25)
        cse_tmp_20 = -1 / NaNMath.log(XC_EPSILON)
        cse_tmp_21 = cse_tmp_0 <= zeta_threshold
        cse_tmp_22 = zeta_threshold - 1
        cse_tmp_23 = 1 - z
        cse_tmp_24 = cse_tmp_23 <= zeta_threshold
        cse_tmp_25 = -cse_tmp_22
        cse_tmp_26 = my_piecewise5(cse_tmp_21, cse_tmp_22, cse_tmp_24, cse_tmp_25, z) + 1
        cse_tmp_27 = NaNMath.pow(zeta_threshold, 1.3333333333333333)
        cse_tmp_28 = 0.184639691595506 * cse_tmp_6 / (1.4645918875615234 * rs)
        cse_tmp_29 = xs1 ^ 2
        cse_tmp_30 = cse_tmp_29 * cse_tmp_8
        cse_tmp_31 = cse_tmp_30 * (cse_tmp_2 * exp(-cse_tmp_4 * xs1 ^ 4) + 10 // 81)
        cse_tmp_32 = cse_tmp_31 * params_a_k1 / (cse_tmp_31 + params_a_k1)
        cse_tmp_33 = cse_tmp_29 / 8
        cse_tmp_34 = (-cse_tmp_33 + t1) / (cse_tmp_13 + cse_tmp_33 * params_a_eta)
        cse_tmp_35 = my_piecewise3(cse_tmp_34 > 0, 0, cse_tmp_34)
        cse_tmp_36 = cse_tmp_34 > 2.5
        cse_tmp_37 = my_piecewise3(cse_tmp_36, 2.5, cse_tmp_34)
        cse_tmp_38 = 0.202105943935811 * NaNMath.pow(my_piecewise3(cse_tmp_30 > cse_tmp_18, cse_tmp_30, cse_tmp_18), 0.25)
        cse_tmp_39 = my_piecewise5(cse_tmp_24, cse_tmp_22, cse_tmp_21, cse_tmp_25, -z) + 1
        my_piecewise3(cse_tmp_0 * cse_tmp_1 <= dens_threshold, 0, -cse_tmp_28 * (cse_tmp_11 + (0.174 - cse_tmp_11) * my_piecewise5(cse_tmp_14 <= 0, exp(-cse_tmp_15 * params_a_c1 / (1 - cse_tmp_15)), cse_tmp_14 <= 2.5, -0.023185843322 * cse_tmp_17 ^ 7 + 0.234528941479 * cse_tmp_17 ^ 6 - 0.887998041597 * cse_tmp_17 ^ 5 + 1.45129704449 * cse_tmp_17 ^ 4 - 0.663086601049 * cse_tmp_17 ^ 3 - 0.4445555 * cse_tmp_17 ^ 2 - 0.667 * cse_tmp_17 + 1, -params_a_d * exp(params_a_c2 / (1 - my_piecewise3(cse_tmp_16, cse_tmp_14, 2.5)))) + 1) * my_piecewise3(cse_tmp_19 <= cse_tmp_20, 1, -xc_expm1(-1 / my_piecewise3(cse_tmp_20 > cse_tmp_19, cse_tmp_20, cse_tmp_19))) * my_piecewise3(cse_tmp_26 <= zeta_threshold, cse_tmp_27, NaNMath.pow(cse_tmp_26, 1.3333333333333333))) + my_piecewise3(cse_tmp_1 * cse_tmp_23 <= dens_threshold, 0, -cse_tmp_28 * (cse_tmp_32 + (0.174 - cse_tmp_32) * my_piecewise5(cse_tmp_34 <= 0, exp(-cse_tmp_35 * params_a_c1 / (1 - cse_tmp_35)), cse_tmp_34 <= 2.5, -0.023185843322 * cse_tmp_37 ^ 7 + 0.234528941479 * cse_tmp_37 ^ 6 - 0.887998041597 * cse_tmp_37 ^ 5 + 1.45129704449 * cse_tmp_37 ^ 4 - 0.663086601049 * cse_tmp_37 ^ 3 - 0.4445555 * cse_tmp_37 ^ 2 - 0.667 * cse_tmp_37 + 1, -params_a_d * exp(params_a_c2 / (1 - my_piecewise3(cse_tmp_36, cse_tmp_34, 2.5)))) + 1) * my_piecewise3(cse_tmp_38 <= cse_tmp_20, 1, -xc_expm1(-1 / my_piecewise3(cse_tmp_20 > cse_tmp_38, cse_tmp_20, cse_tmp_38))) * my_piecewise3(cse_tmp_39 <= zeta_threshold, cse_tmp_27, NaNMath.pow(cse_tmp_39, 1.3333333333333333)))
    end
end
export mgga_x_r2scan_energy

const mgga_x_r2scan_defaults = (XC_EPSILON = 2.220446049250313e-16, dens_threshold = 1.0e-11, params_a_c1 = 0.667, params_a_c2 = 0.8, params_a_d = 1.24, params_a_dp2 = 0.361, params_a_eta = 0.001, params_a_k1 = 0.065, zeta_threshold = 2.220446049250313e-16)
const mgga_x_r2scan_required = ()

function mgga_x_r2scan(rho, sigma, lapl, tau; params = NamedTuple())
    p = resolve_params(mgga_x_r2scan_defaults, mgga_x_r2scan_required, params)
    v = mgga_variables(rho, sigma, lapl, tau, Val(3))
    return mgga_x_r2scan_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.XC_EPSILON, p.dens_threshold, p.params_a_c1, p.params_a_c2, p.params_a_d, p.params_a_dp2, p.params_a_eta, p.params_a_k1, p.zeta_threshold)
end

function mgga_x_r2scan(na, nb, gaa, gab, gbb, la, lb, ta, tb; params = NamedTuple())
    p = resolve_params(mgga_x_r2scan_defaults, mgga_x_r2scan_required, params)
    v = mgga_variables(na, nb, gaa, gab, gbb, la, lb, ta, tb, Val(3))
    return mgga_x_r2scan_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.XC_EPSILON, p.dens_threshold, p.params_a_c1, p.params_a_c2, p.params_a_d, p.params_a_dp2, p.params_a_eta, p.params_a_k1, p.zeta_threshold)
end

export mgga_x_r2scan, mgga_x_r2scan_defaults, mgga_x_r2scan_required

const mgga_x_r2scan01_defaults = (XC_EPSILON = 2.220446049250313e-16, dens_threshold = 1.0e-11, params_a_c1 = 0.667, params_a_c2 = 0.8, params_a_d = 1.24, params_a_dp2 = 0.361, params_a_eta = 0.01, params_a_k1 = 0.065, zeta_threshold = 2.220446049250313e-16)
const mgga_x_r2scan01_required = ()

function mgga_x_r2scan01(rho, sigma, lapl, tau; params = NamedTuple())
    p = resolve_params(mgga_x_r2scan01_defaults, mgga_x_r2scan01_required, params)
    v = mgga_variables(rho, sigma, lapl, tau, Val(3))
    return mgga_x_r2scan_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.XC_EPSILON, p.dens_threshold, p.params_a_c1, p.params_a_c2, p.params_a_d, p.params_a_dp2, p.params_a_eta, p.params_a_k1, p.zeta_threshold)
end

function mgga_x_r2scan01(na, nb, gaa, gab, gbb, la, lb, ta, tb; params = NamedTuple())
    p = resolve_params(mgga_x_r2scan01_defaults, mgga_x_r2scan01_required, params)
    v = mgga_variables(na, nb, gaa, gab, gbb, la, lb, ta, tb, Val(3))
    return mgga_x_r2scan_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.XC_EPSILON, p.dens_threshold, p.params_a_c1, p.params_a_c2, p.params_a_d, p.params_a_dp2, p.params_a_eta, p.params_a_k1, p.zeta_threshold)
end

export mgga_x_r2scan01, mgga_x_r2scan01_defaults, mgga_x_r2scan01_required
