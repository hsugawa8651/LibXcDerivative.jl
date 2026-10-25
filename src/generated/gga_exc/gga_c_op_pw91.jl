# Auto-generated from the Libxc sources
# python/gga_exc/gga_c_op_pw91.py -- do not edit by hand.
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
# args: rs, z, xt, xs0, xs1, XC_EPSILON, dens_threshold, zeta_threshold
const gga_c_op_pw91_energy = function (rs, z, xt, xs0, xs1, XC_EPSILON, dens_threshold, zeta_threshold)
    @inbounds begin
        cse_tmp_0 = z + 1
        cse_tmp_1 = 1 / (pi * rs ^ 3)
        cse_tmp_2 = (3 // 8) * cse_tmp_1
        cse_tmp_3 = 1 - z
        cse_tmp_4 = zeta_threshold - 1
        cse_tmp_5 = -cse_tmp_4
        cse_tmp_6 = my_piecewise5(cse_tmp_0 <= zeta_threshold, cse_tmp_4, cse_tmp_3 <= zeta_threshold, cse_tmp_5, z)
        cse_tmp_7 = 1 - cse_tmp_6
        cse_tmp_8 = cse_tmp_6 + 1
        cse_tmp_9 = cse_tmp_8 <= zeta_threshold
        cse_tmp_10 = cse_tmp_7 <= zeta_threshold
        cse_tmp_11 = xs0 ^ 2
        cse_tmp_12 = 1.8171205928321397
        cse_tmp_13 = 0.2173369174628993
        cse_tmp_14 = cse_tmp_12 * cse_tmp_13
        cse_tmp_15 = cse_tmp_11 * cse_tmp_14
        cse_tmp_16 = cse_tmp_15 / 24
        cse_tmp_17 = 84465.0602600037 / 90032220.84293328
        cse_tmp_18 = 1.081935890528998e-06
        cse_tmp_19 = 27.2325284343021 / 9488.531016070574
        cse_tmp_20 = 0.010265982254684336
        cse_tmp_21 = 2.413990407301591e-09
        cse_tmp_22 = 2930.92130214545 * cse_tmp_12 / 4252702.174637001
        cse_tmp_23 = 2.2905222852177984e-05
        cse_tmp_24 = 1.41255411207091 * cse_tmp_12 / 448.1939477706577
        cse_tmp_25 = 3.3019272488946267
        cse_tmp_26 = 425108.831527707 * cse_tmp_25 / 1906035376.3434184
        cse_tmp_27 = 5.110560498665783e-08
        cse_tmp_28 = 108.991304827776 * cse_tmp_25 / 200877.81481824708
        cse_tmp_29 = 0.0004849171180109538
        cse_tmp_30 = cse_tmp_25 / 21.170591578193033
        cse_tmp_31 = cse_tmp_30 * xs0 ^ 4
        cse_tmp_32 = NaNMath.sqrt(my_piecewise3(cse_tmp_16 > 0.00102844465039636, cse_tmp_16, 0.00102844465039636))
        cse_tmp_33 = 0.19645 * my_piecewise3(2.53214080666667 * cse_tmp_15 < 1 // 16, 0.324816666666667 * cse_tmp_11 * cse_tmp_12 * cse_tmp_13 + 188568.597099655 * cse_tmp_12 * cse_tmp_21 * xs0 ^ 26 + 53.4855652473206 * cse_tmp_12 * cse_tmp_23 * xs0 ^ 14 - cse_tmp_17 * xs0 ^ 24 + 1369.76028018547 * cse_tmp_18 * xs0 ^ 18 - cse_tmp_19 * xs0 ^ 12 + 0.937187577417183 * cse_tmp_20 * xs0 ^ 6 - cse_tmp_22 * xs0 ^ 20 - cse_tmp_24 * xs0 ^ 8 + 6378.96061984544 * cse_tmp_25 * cse_tmp_27 * xs0 ^ 22 + 2.43420152126636 * cse_tmp_25 * cse_tmp_29 * xs0 ^ 10 - cse_tmp_26 * xs0 ^ 28 - cse_tmp_28 * xs0 ^ 16 - 0.137080256058685 * cse_tmp_31, cse_tmp_32 * xc_asinh(7.7956 * cse_tmp_32)) + 1
        cse_tmp_34 = 0.225664732791835 * 1.4645918875615234 * cse_tmp_25 * rs
        cse_tmp_35 = xs1 ^ 2
        cse_tmp_36 = cse_tmp_14 * cse_tmp_35
        cse_tmp_37 = cse_tmp_36 / 24
        cse_tmp_38 = cse_tmp_30 * xs1 ^ 4
        cse_tmp_39 = NaNMath.sqrt(my_piecewise3(cse_tmp_37 > 0.00102844465039636, cse_tmp_37, 0.00102844465039636))
        cse_tmp_40 = 0.19645 * my_piecewise3(2.53214080666667 * cse_tmp_36 < 1 // 16, 0.324816666666667 * cse_tmp_12 * cse_tmp_13 * cse_tmp_35 + 188568.597099655 * cse_tmp_12 * cse_tmp_21 * xs1 ^ 26 + 53.4855652473206 * cse_tmp_12 * cse_tmp_23 * xs1 ^ 14 - cse_tmp_17 * xs1 ^ 24 + 1369.76028018547 * cse_tmp_18 * xs1 ^ 18 - cse_tmp_19 * xs1 ^ 12 + 0.937187577417183 * cse_tmp_20 * xs1 ^ 6 - cse_tmp_22 * xs1 ^ 20 - cse_tmp_24 * xs1 ^ 8 + 6378.96061984544 * cse_tmp_25 * cse_tmp_27 * xs1 ^ 22 + 2.43420152126636 * cse_tmp_25 * cse_tmp_29 * xs1 ^ 10 - cse_tmp_26 * xs1 ^ 28 - cse_tmp_28 * xs1 ^ 16 - 0.137080256058685 * cse_tmp_38, cse_tmp_39 * xc_asinh(7.7956 * cse_tmp_39)) + 1
        cse_tmp_41 = my_piecewise3(cse_tmp_2 * cse_tmp_7 <= dens_threshold, 0, cse_tmp_34 * (6.94444444444444e-6 * cse_tmp_38 + cse_tmp_40) / ((cse_tmp_37 * (0.2743 - 0.1508 * exp(-25 // 6 * cse_tmp_36)) + cse_tmp_40) * NaNMath.pow(my_piecewise5(cse_tmp_10, cse_tmp_4, cse_tmp_9, cse_tmp_5, -cse_tmp_6) + 1, 0.3333333333333333))) + my_piecewise3(cse_tmp_2 * cse_tmp_8 <= dens_threshold, 0, cse_tmp_34 * (6.94444444444444e-6 * cse_tmp_31 + cse_tmp_33) / ((cse_tmp_16 * (0.2743 - 0.1508 * exp(-25 // 6 * cse_tmp_15)) + cse_tmp_33) * NaNMath.pow(my_piecewise5(cse_tmp_9, cse_tmp_4, cse_tmp_10, cse_tmp_5, cse_tmp_6) + 1, 0.3333333333333333)))
        cse_tmp_42 = my_piecewise3(my_piecewise3(cse_tmp_41 >= 0, cse_tmp_41, -cse_tmp_41) < XC_EPSILON, XC_EPSILON, cse_tmp_41)
        my_piecewise3(cse_tmp_0 * cse_tmp_2 <= dens_threshold && cse_tmp_2 * cse_tmp_3 <= dens_threshold || 1 - my_piecewise3(z >= 0, z, -z) <= zeta_threshold, 0, -3 // 16 * cse_tmp_1 * cse_tmp_7 * cse_tmp_8 * (0.5764 + 3.60663084 / cse_tmp_42) / (1.788764629788 / cse_tmp_42 ^ 2 + 15.0327320916244 / cse_tmp_42 ^ 3 + 31.5815266717518 / cse_tmp_42 ^ 4))
    end
end
export gga_c_op_pw91_energy

const gga_c_op_pw91_defaults = (XC_EPSILON = 2.220446049250313e-16, dens_threshold = 1.0e-10, zeta_threshold = 2.220446049250313e-16)
const gga_c_op_pw91_required = ()

function gga_c_op_pw91(rho, sigma; params = NamedTuple())
    p = resolve_params(gga_c_op_pw91_defaults, gga_c_op_pw91_required, params)
    v = gga_variables(rho, sigma, Val(3))
    return gga_c_op_pw91_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.XC_EPSILON, p.dens_threshold, p.zeta_threshold)
end

function gga_c_op_pw91(na, nb, gaa, gab, gbb; params = NamedTuple())
    p = resolve_params(gga_c_op_pw91_defaults, gga_c_op_pw91_required, params)
    v = gga_variables(na, nb, gaa, gab, gbb, Val(3))
    return gga_c_op_pw91_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.XC_EPSILON, p.dens_threshold, p.zeta_threshold)
end

export gga_c_op_pw91, gga_c_op_pw91_defaults, gga_c_op_pw91_required
