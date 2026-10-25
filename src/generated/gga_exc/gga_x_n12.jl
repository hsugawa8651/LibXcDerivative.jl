# Auto-generated from the Libxc sources
# python/gga_exc/gga_x_n12.py -- do not edit by hand.
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
# args: rs, z, xt, xs0, xs1, dens_threshold, params_a_CC_0__0, params_a_CC_0__1, params_a_CC_0__2, params_a_CC_0__3, params_a_CC_1__0, params_a_CC_1__1, params_a_CC_1__2, params_a_CC_1__3, params_a_CC_2__0, params_a_CC_2__1, params_a_CC_2__2, params_a_CC_2__3, params_a_CC_3__0, params_a_CC_3__1, params_a_CC_3__2, params_a_CC_3__3, zeta_threshold
const gga_x_n12_energy = function (rs, z, xt, xs0, xs1, dens_threshold, params_a_CC_0__0, params_a_CC_0__1, params_a_CC_0__2, params_a_CC_0__3, params_a_CC_1__0, params_a_CC_1__1, params_a_CC_1__2, params_a_CC_1__3, params_a_CC_2__0, params_a_CC_2__1, params_a_CC_2__2, params_a_CC_2__3, params_a_CC_3__0, params_a_CC_3__1, params_a_CC_3__2, params_a_CC_3__3, zeta_threshold)
    @inbounds begin
        cse_tmp_0 = z + 1
        cse_tmp_1 = (3 // 8) / (pi * rs ^ 3)
        cse_tmp_2 = 0.004 * xs0 ^ 2
        cse_tmp_3 = cse_tmp_2 + 1
        cse_tmp_4 = cse_tmp_2 / cse_tmp_3
        cse_tmp_5 = xs0 ^ 4 / cse_tmp_3 ^ 2
        cse_tmp_6 = 1.6e-5 * cse_tmp_5
        cse_tmp_7 = xs0 ^ 6 / cse_tmp_3 ^ 3
        cse_tmp_8 = 6.4e-8 * cse_tmp_7
        cse_tmp_9 = cse_tmp_0 <= zeta_threshold
        cse_tmp_10 = zeta_threshold - 1
        cse_tmp_11 = 1 - z
        cse_tmp_12 = cse_tmp_11 <= zeta_threshold
        cse_tmp_13 = -cse_tmp_10
        cse_tmp_14 = my_piecewise5(cse_tmp_9, cse_tmp_10, cse_tmp_12, cse_tmp_13, z)
        cse_tmp_15 = cse_tmp_14 + 1
        cse_tmp_16 = cse_tmp_15 <= zeta_threshold
        cse_tmp_17 = -1 + NaNMath.pow(zeta_threshold, -0.3333333333333333)
        cse_tmp_18 = 1.4645918875615234
        cse_tmp_19 = 0.266666666666667 * 2.080083823051904 * cse_tmp_18 * rs
        cse_tmp_20 = cse_tmp_19 * (my_piecewise3(cse_tmp_16, cse_tmp_17, xc_expm1(-xc_log1p(my_piecewise3(cse_tmp_14 > cse_tmp_10, cse_tmp_14, cse_tmp_10)) / 3)) + 1) + 1
        cse_tmp_21 = 1.6e-5 * params_a_CC_1__2
        cse_tmp_22 = 6.4e-8 * params_a_CC_1__3
        cse_tmp_23 = NaNMath.pow(zeta_threshold, 1.3333333333333333)
        cse_tmp_24 = 0.184639691595506 * 1.8171205928321397 / (cse_tmp_18 * rs)
        cse_tmp_25 = 0.004 * xs1 ^ 2
        cse_tmp_26 = cse_tmp_25 + 1
        cse_tmp_27 = cse_tmp_25 / cse_tmp_26
        cse_tmp_28 = xs1 ^ 4 / cse_tmp_26 ^ 2
        cse_tmp_29 = 1.6e-5 * cse_tmp_28
        cse_tmp_30 = xs1 ^ 6 / cse_tmp_26 ^ 3
        cse_tmp_31 = 6.4e-8 * cse_tmp_30
        cse_tmp_32 = my_piecewise5(cse_tmp_12, cse_tmp_10, cse_tmp_9, cse_tmp_13, -z)
        cse_tmp_33 = cse_tmp_32 + 1
        cse_tmp_34 = cse_tmp_33 <= zeta_threshold
        cse_tmp_35 = cse_tmp_19 * (my_piecewise3(cse_tmp_34, cse_tmp_17, xc_expm1(-xc_log1p(my_piecewise3(cse_tmp_32 > cse_tmp_10, cse_tmp_32, cse_tmp_10)) / 3)) + 1) + 1
        my_piecewise3(cse_tmp_0 * cse_tmp_1 <= dens_threshold, 0, -cse_tmp_24 * (cse_tmp_4 * params_a_CC_0__1 + cse_tmp_6 * params_a_CC_0__2 + cse_tmp_8 * params_a_CC_0__3 + params_a_CC_0__0 + (cse_tmp_21 * cse_tmp_5 + cse_tmp_22 * cse_tmp_7 + cse_tmp_4 * params_a_CC_1__1 + params_a_CC_1__0) / cse_tmp_20 + (cse_tmp_4 * params_a_CC_2__1 + cse_tmp_6 * params_a_CC_2__2 + cse_tmp_8 * params_a_CC_2__3 + params_a_CC_2__0) / cse_tmp_20 ^ 2 + (cse_tmp_4 * params_a_CC_3__1 + cse_tmp_6 * params_a_CC_3__2 + cse_tmp_8 * params_a_CC_3__3 + params_a_CC_3__0) / cse_tmp_20 ^ 3) * my_piecewise3(cse_tmp_16, cse_tmp_23, NaNMath.pow(cse_tmp_15, 1.3333333333333333))) + my_piecewise3(cse_tmp_1 * cse_tmp_11 <= dens_threshold, 0, -cse_tmp_24 * (cse_tmp_27 * params_a_CC_0__1 + cse_tmp_29 * params_a_CC_0__2 + cse_tmp_31 * params_a_CC_0__3 + params_a_CC_0__0 + (cse_tmp_21 * cse_tmp_28 + cse_tmp_22 * cse_tmp_30 + cse_tmp_27 * params_a_CC_1__1 + params_a_CC_1__0) / cse_tmp_35 + (cse_tmp_27 * params_a_CC_2__1 + cse_tmp_29 * params_a_CC_2__2 + cse_tmp_31 * params_a_CC_2__3 + params_a_CC_2__0) / cse_tmp_35 ^ 2 + (cse_tmp_27 * params_a_CC_3__1 + cse_tmp_29 * params_a_CC_3__2 + cse_tmp_31 * params_a_CC_3__3 + params_a_CC_3__0) / cse_tmp_35 ^ 3) * my_piecewise3(cse_tmp_34, cse_tmp_23, NaNMath.pow(cse_tmp_33, 1.3333333333333333)))
    end
end
export gga_x_n12_energy

const gga_x_n12_defaults = (dens_threshold = 1.0e-14, params_a_CC_0__0 = 1.0, params_a_CC_0__1 = 0.50788, params_a_CC_0__2 = 0.168233, params_a_CC_0__3 = 0.128887, params_a_CC_1__0 = 0.0860211, params_a_CC_1__1 = -17.1008, params_a_CC_1__2 = 65.0814, params_a_CC_1__3 = -70.1726, params_a_CC_2__0 = -0.390755, params_a_CC_2__1 = 51.3392, params_a_CC_2__2 = -166.22, params_a_CC_2__3 = 142.738, params_a_CC_3__0 = 0.403611, params_a_CC_3__1 = -34.4631, params_a_CC_3__2 = 76.1661, params_a_CC_3__3 = -2.41834, zeta_threshold = 2.220446049250313e-16)
const gga_x_n12_required = ()

function gga_x_n12(rho, sigma; params = NamedTuple())
    p = resolve_params(gga_x_n12_defaults, gga_x_n12_required, params)
    v = gga_variables(rho, sigma, Val(3))
    return gga_x_n12_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.dens_threshold, p.params_a_CC_0__0, p.params_a_CC_0__1, p.params_a_CC_0__2, p.params_a_CC_0__3, p.params_a_CC_1__0, p.params_a_CC_1__1, p.params_a_CC_1__2, p.params_a_CC_1__3, p.params_a_CC_2__0, p.params_a_CC_2__1, p.params_a_CC_2__2, p.params_a_CC_2__3, p.params_a_CC_3__0, p.params_a_CC_3__1, p.params_a_CC_3__2, p.params_a_CC_3__3, p.zeta_threshold)
end

function gga_x_n12(na, nb, gaa, gab, gbb; params = NamedTuple())
    p = resolve_params(gga_x_n12_defaults, gga_x_n12_required, params)
    v = gga_variables(na, nb, gaa, gab, gbb, Val(3))
    return gga_x_n12_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.dens_threshold, p.params_a_CC_0__0, p.params_a_CC_0__1, p.params_a_CC_0__2, p.params_a_CC_0__3, p.params_a_CC_1__0, p.params_a_CC_1__1, p.params_a_CC_1__2, p.params_a_CC_1__3, p.params_a_CC_2__0, p.params_a_CC_2__1, p.params_a_CC_2__2, p.params_a_CC_2__3, p.params_a_CC_3__0, p.params_a_CC_3__1, p.params_a_CC_3__2, p.params_a_CC_3__3, p.zeta_threshold)
end

export gga_x_n12, gga_x_n12_defaults, gga_x_n12_required

const gga_x_gam_defaults = (dens_threshold = 1.0e-14, params_a_CC_0__0 = 1.3273, params_a_CC_0__1 = 0.886102, params_a_CC_0__2 = -5.73833, params_a_CC_0__3 = 8.60197, params_a_CC_1__0 = -0.786018, params_a_CC_1__1 = -4.78787, params_a_CC_1__2 = 3.90989, params_a_CC_1__3 = -2.11611, params_a_CC_2__0 = 0.802575, params_a_CC_2__1 = 14.4363, params_a_CC_2__2 = 8.42735, params_a_CC_2__3 = -6.21552, params_a_CC_3__0 = -0.142331, params_a_CC_3__1 = -13.4598, params_a_CC_3__2 = 1.52355, params_a_CC_3__3 = -10.053, zeta_threshold = 2.220446049250313e-16)
const gga_x_gam_required = ()

function gga_x_gam(rho, sigma; params = NamedTuple())
    p = resolve_params(gga_x_gam_defaults, gga_x_gam_required, params)
    v = gga_variables(rho, sigma, Val(3))
    return gga_x_n12_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.dens_threshold, p.params_a_CC_0__0, p.params_a_CC_0__1, p.params_a_CC_0__2, p.params_a_CC_0__3, p.params_a_CC_1__0, p.params_a_CC_1__1, p.params_a_CC_1__2, p.params_a_CC_1__3, p.params_a_CC_2__0, p.params_a_CC_2__1, p.params_a_CC_2__2, p.params_a_CC_2__3, p.params_a_CC_3__0, p.params_a_CC_3__1, p.params_a_CC_3__2, p.params_a_CC_3__3, p.zeta_threshold)
end

function gga_x_gam(na, nb, gaa, gab, gbb; params = NamedTuple())
    p = resolve_params(gga_x_gam_defaults, gga_x_gam_required, params)
    v = gga_variables(na, nb, gaa, gab, gbb, Val(3))
    return gga_x_n12_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.dens_threshold, p.params_a_CC_0__0, p.params_a_CC_0__1, p.params_a_CC_0__2, p.params_a_CC_0__3, p.params_a_CC_1__0, p.params_a_CC_1__1, p.params_a_CC_1__2, p.params_a_CC_1__3, p.params_a_CC_2__0, p.params_a_CC_2__1, p.params_a_CC_2__2, p.params_a_CC_2__3, p.params_a_CC_3__0, p.params_a_CC_3__1, p.params_a_CC_3__2, p.params_a_CC_3__3, p.zeta_threshold)
end

export gga_x_gam, gga_x_gam_defaults, gga_x_gam_required

const hyb_gga_x_n12_sx_defaults = (dens_threshold = 1.0e-14, params_a_CC_0__0 = 0.681116, params_a_CC_0__1 = 1.88858, params_a_CC_0__2 = 1.7859, params_a_CC_0__3 = 0.879456, params_a_CC_1__0 = -0.081227, params_a_CC_1__1 = -1.08723, params_a_CC_1__2 = -4.18682, params_a_CC_1__3 = -30.0, params_a_CC_2__0 = 0.536236, params_a_CC_2__1 = -5.45678, params_a_CC_2__2 = 30.0, params_a_CC_2__3 = 55.1105, params_a_CC_3__0 = -0.709913, params_a_CC_3__1 = 13.0001, params_a_CC_3__2 = -72.4877, params_a_CC_3__3 = 29.8363, zeta_threshold = 2.220446049250313e-16)
const hyb_gga_x_n12_sx_required = ()

function hyb_gga_x_n12_sx(rho, sigma; params = NamedTuple())
    p = resolve_params(hyb_gga_x_n12_sx_defaults, hyb_gga_x_n12_sx_required, params)
    v = gga_variables(rho, sigma, Val(3))
    return gga_x_n12_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.dens_threshold, p.params_a_CC_0__0, p.params_a_CC_0__1, p.params_a_CC_0__2, p.params_a_CC_0__3, p.params_a_CC_1__0, p.params_a_CC_1__1, p.params_a_CC_1__2, p.params_a_CC_1__3, p.params_a_CC_2__0, p.params_a_CC_2__1, p.params_a_CC_2__2, p.params_a_CC_2__3, p.params_a_CC_3__0, p.params_a_CC_3__1, p.params_a_CC_3__2, p.params_a_CC_3__3, p.zeta_threshold)
end

function hyb_gga_x_n12_sx(na, nb, gaa, gab, gbb; params = NamedTuple())
    p = resolve_params(hyb_gga_x_n12_sx_defaults, hyb_gga_x_n12_sx_required, params)
    v = gga_variables(na, nb, gaa, gab, gbb, Val(3))
    return gga_x_n12_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.dens_threshold, p.params_a_CC_0__0, p.params_a_CC_0__1, p.params_a_CC_0__2, p.params_a_CC_0__3, p.params_a_CC_1__0, p.params_a_CC_1__1, p.params_a_CC_1__2, p.params_a_CC_1__3, p.params_a_CC_2__0, p.params_a_CC_2__1, p.params_a_CC_2__2, p.params_a_CC_2__3, p.params_a_CC_3__0, p.params_a_CC_3__1, p.params_a_CC_3__2, p.params_a_CC_3__3, p.zeta_threshold)
end

export hyb_gga_x_n12_sx, hyb_gga_x_n12_sx_defaults, hyb_gga_x_n12_sx_required
