# Auto-generated from the Libxc sources
# python/gga_exc/gga_x_htbs.py -- do not edit by hand.
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
# args: rs, z, xt, xs0, xs1, dens_threshold, zeta_threshold
const gga_x_htbs_energy = function (rs, z, xt, xs0, xs1, dens_threshold, zeta_threshold)
    @inbounds begin
        cse_tmp_0 = z + 1
        cse_tmp_1 = (3 // 8) / (pi * rs ^ 3)
        cse_tmp_2 = cse_tmp_0 <= zeta_threshold
        cse_tmp_3 = zeta_threshold - 1
        cse_tmp_4 = 1 - z
        cse_tmp_5 = cse_tmp_4 <= zeta_threshold
        cse_tmp_6 = -cse_tmp_3
        cse_tmp_7 = my_piecewise5(cse_tmp_2, cse_tmp_3, cse_tmp_5, cse_tmp_6, z) + 1
        cse_tmp_8 = NaNMath.pow(zeta_threshold, 1.3333333333333333)
        cse_tmp_9 = 0.2173369174628993
        cse_tmp_10 = 1.8171205928321397
        cse_tmp_11 = xs0 ^ 2
        cse_tmp_12 = cse_tmp_10 * cse_tmp_11
        cse_tmp_13 = cse_tmp_12 * cse_tmp_9
        cse_tmp_14 = cse_tmp_13 / 24
        cse_tmp_15 = xs0 ^ 4
        cse_tmp_16 = 3.3019272488946267
        cse_tmp_17 = cse_tmp_16 / 21.170591578193033
        cse_tmp_18 = cse_tmp_15 * cse_tmp_17
        cse_tmp_19 = (5 // 972) * cse_tmp_13 + 0.004002424276710846 * cse_tmp_13 * exp(-cse_tmp_14) + xc_log1p(1.378032870687816e-5 * cse_tmp_18)
        cse_tmp_20 = 0.804 * cse_tmp_19 / (cse_tmp_19 + 0.804) + 1
        cse_tmp_21 = 2.1450293971110255
        cse_tmp_22 = 0.001152649091403213 * cse_tmp_21
        cse_tmp_23 = 1 - 0.804 * xc_expm1(-cse_tmp_12 * cse_tmp_22)
        cse_tmp_24 = Abs(xs0)
        cse_tmp_25 = 0.190125 * cse_tmp_16 / cse_tmp_21
        cse_tmp_26 = 0.0869791666666667 / 9.869604401089358
        cse_tmp_27 = 0.000162760416666667 * cse_tmp_10 / 45.41154128945516
        cse_tmp_28 = cse_tmp_11 * cse_tmp_24 * cse_tmp_26 - 0.195 * cse_tmp_13 + cse_tmp_15 * cse_tmp_24 * cse_tmp_27 - 0.00260416666666667 * cse_tmp_18 + cse_tmp_24 * cse_tmp_25
        cse_tmp_29 = 0.184639691595506 * cse_tmp_10 / (1.4645918875615234 * rs)
        cse_tmp_30 = my_piecewise5(cse_tmp_5, cse_tmp_3, cse_tmp_2, cse_tmp_6, -z) + 1
        cse_tmp_31 = xs1 ^ 2
        cse_tmp_32 = cse_tmp_10 * cse_tmp_31
        cse_tmp_33 = cse_tmp_32 * cse_tmp_9
        cse_tmp_34 = cse_tmp_33 / 24
        cse_tmp_35 = xs1 ^ 4
        cse_tmp_36 = cse_tmp_17 * cse_tmp_35
        cse_tmp_37 = (5 // 972) * cse_tmp_33 + 0.004002424276710846 * cse_tmp_33 * exp(-cse_tmp_34) + xc_log1p(1.378032870687816e-5 * cse_tmp_36)
        cse_tmp_38 = 0.804 * cse_tmp_37 / (cse_tmp_37 + 0.804) + 1
        cse_tmp_39 = 1 - 0.804 * xc_expm1(-cse_tmp_22 * cse_tmp_32)
        cse_tmp_40 = Abs(xs1)
        cse_tmp_41 = cse_tmp_25 * cse_tmp_40 + cse_tmp_26 * cse_tmp_31 * cse_tmp_40 + cse_tmp_27 * cse_tmp_35 * cse_tmp_40 - 0.195 * cse_tmp_33 - 0.00260416666666667 * cse_tmp_36
        my_piecewise3(cse_tmp_0 * cse_tmp_1 <= dens_threshold, 0, -cse_tmp_29 * my_piecewise3(cse_tmp_7 <= zeta_threshold, cse_tmp_8, NaNMath.pow(cse_tmp_7, 1.3333333333333333)) * my_piecewise5(cse_tmp_14 <= 0.36, cse_tmp_20, cse_tmp_14 >= 6.76, cse_tmp_23, cse_tmp_20 * (1.40608 - cse_tmp_28) + cse_tmp_23 * (cse_tmp_28 - 0.40608))) + my_piecewise3(cse_tmp_1 * cse_tmp_4 <= dens_threshold, 0, -cse_tmp_29 * my_piecewise3(cse_tmp_30 <= zeta_threshold, cse_tmp_8, NaNMath.pow(cse_tmp_30, 1.3333333333333333)) * my_piecewise5(cse_tmp_34 <= 0.36, cse_tmp_38, cse_tmp_34 >= 6.76, cse_tmp_39, cse_tmp_38 * (1.40608 - cse_tmp_41) + cse_tmp_39 * (cse_tmp_41 - 0.40608)))
    end
end
export gga_x_htbs_energy

const gga_x_htbs_defaults = (dens_threshold = 1.0e-15, zeta_threshold = 2.220446049250313e-16)
const gga_x_htbs_required = ()

function gga_x_htbs(rho, sigma; params = NamedTuple())
    p = resolve_params(gga_x_htbs_defaults, gga_x_htbs_required, params)
    v = gga_variables(rho, sigma, Val(3))
    return gga_x_htbs_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.dens_threshold, p.zeta_threshold)
end

function gga_x_htbs(na, nb, gaa, gab, gbb; params = NamedTuple())
    p = resolve_params(gga_x_htbs_defaults, gga_x_htbs_required, params)
    v = gga_variables(na, nb, gaa, gab, gbb, Val(3))
    return gga_x_htbs_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.dens_threshold, p.zeta_threshold)
end

export gga_x_htbs, gga_x_htbs_defaults, gga_x_htbs_required
