# Auto-generated from the Libxc sources
# python/mgga_exc/mgga_x_mcml.py -- do not edit by hand.
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
# args: rs, z, xt, xs0, xs1, u0, u1, t0, t1, dens_threshold, zeta_threshold
const mgga_x_mcml_energy = function (rs, z, xt, xs0, xs1, u0, u1, t0, t1, dens_threshold, zeta_threshold)
    @inbounds begin
        cse_tmp_0 = z + 1
        cse_tmp_1 = (3 // 8) / (pi * rs ^ 3)
        cse_tmp_2 = xs0 ^ 2
        cse_tmp_3 = 1.8171205928321397
        cse_tmp_4 = cse_tmp_3 / 4.60115111447049
        cse_tmp_5 = cse_tmp_4 / 24
        cse_tmp_6 = cse_tmp_2 * cse_tmp_5 + 6.5124
        cse_tmp_7 = cse_tmp_6 ^ (-7)
        cse_tmp_8 = cse_tmp_6 ^ (-6)
        cse_tmp_9 = cse_tmp_6 ^ (-5)
        cse_tmp_10 = cse_tmp_6 ^ (-4)
        cse_tmp_11 = cse_tmp_6 ^ (-3)
        cse_tmp_12 = cse_tmp_6 ^ (-2)
        cse_tmp_13 = cse_tmp_6 ^ (-1)
        cse_tmp_14 = (5 // 9) * cse_tmp_4
        cse_tmp_15 = cse_tmp_14 * (-cse_tmp_2 / 8 + t0)
        cse_tmp_16 = cse_tmp_15 > 10000.0
        cse_tmp_17 = my_piecewise3(cse_tmp_16, cse_tmp_15, 10000.0)
        cse_tmp_18 = my_piecewise3(cse_tmp_16, 10000.0, cse_tmp_15)
        cse_tmp_19 = cse_tmp_18 ^ 3
        cse_tmp_20 = my_piecewise3(cse_tmp_15 >= 10000.0, 5 // 4 - 3 // 4 / cse_tmp_17 ^ 2 - 1 / (16 * cse_tmp_17 ^ 3), (5 * cse_tmp_18 ^ 6 - 3 * cse_tmp_18 ^ 4 + 3 * cse_tmp_18 ^ 2 + cse_tmp_19) / (cse_tmp_19 * (4 * cse_tmp_19 + 1) + 1))
        cse_tmp_21 = cse_tmp_20 ^ 2
        cse_tmp_22 = cse_tmp_20 ^ 3
        cse_tmp_23 = cse_tmp_20 ^ 4
        cse_tmp_24 = cse_tmp_20 ^ 5
        cse_tmp_25 = cse_tmp_20 ^ 6
        cse_tmp_26 = cse_tmp_20 ^ 7
        cse_tmp_27 = cse_tmp_0 <= zeta_threshold
        cse_tmp_28 = zeta_threshold - 1
        cse_tmp_29 = 1 - z
        cse_tmp_30 = cse_tmp_29 <= zeta_threshold
        cse_tmp_31 = -cse_tmp_28
        cse_tmp_32 = my_piecewise5(cse_tmp_27, cse_tmp_28, cse_tmp_30, cse_tmp_31, z) + 1
        cse_tmp_33 = NaNMath.pow(zeta_threshold, 1.3333333333333333)
        cse_tmp_34 = 0.184639691595506 * cse_tmp_3 / (1.4645918875615234 * rs)
        cse_tmp_35 = xs1 ^ 2
        cse_tmp_36 = cse_tmp_35 * cse_tmp_5 + 6.5124
        cse_tmp_37 = cse_tmp_36 ^ (-7)
        cse_tmp_38 = cse_tmp_36 ^ (-6)
        cse_tmp_39 = cse_tmp_36 ^ (-5)
        cse_tmp_40 = cse_tmp_36 ^ (-4)
        cse_tmp_41 = cse_tmp_36 ^ (-3)
        cse_tmp_42 = cse_tmp_36 ^ (-2)
        cse_tmp_43 = cse_tmp_36 ^ (-1)
        cse_tmp_44 = cse_tmp_14 * (-cse_tmp_35 / 8 + t1)
        cse_tmp_45 = cse_tmp_44 > 10000.0
        cse_tmp_46 = my_piecewise3(cse_tmp_45, cse_tmp_44, 10000.0)
        cse_tmp_47 = my_piecewise3(cse_tmp_45, 10000.0, cse_tmp_44)
        cse_tmp_48 = cse_tmp_47 ^ 3
        cse_tmp_49 = my_piecewise3(cse_tmp_44 >= 10000.0, 5 // 4 - 3 // 4 / cse_tmp_46 ^ 2 - 1 / (16 * cse_tmp_46 ^ 3), (5 * cse_tmp_47 ^ 6 - 3 * cse_tmp_47 ^ 4 + 3 * cse_tmp_47 ^ 2 + cse_tmp_48) / (cse_tmp_48 * (4 * cse_tmp_48 + 1) + 1))
        cse_tmp_50 = cse_tmp_49 ^ 2
        cse_tmp_51 = cse_tmp_49 ^ 3
        cse_tmp_52 = cse_tmp_49 ^ 4
        cse_tmp_53 = cse_tmp_49 ^ 5
        cse_tmp_54 = cse_tmp_49 ^ 6
        cse_tmp_55 = cse_tmp_49 ^ 7
        cse_tmp_56 = my_piecewise5(cse_tmp_30, cse_tmp_28, cse_tmp_27, cse_tmp_31, -z) + 1
        my_piecewise3(cse_tmp_0 * cse_tmp_1 <= dens_threshold, 0, -cse_tmp_34 * (-2146671.464473209 * cse_tmp_10 * cse_tmp_20 + 2983063.574524986 * cse_tmp_10 * cse_tmp_21 + 420679.37924971 * cse_tmp_10 * cse_tmp_22 - 3850436.497459403 * cse_tmp_10 * cse_tmp_23 + 3314307.067628512 * cse_tmp_10 * cse_tmp_24 - 1184520.868316188 * cse_tmp_10 * cse_tmp_25 + 154697.0048185611 * cse_tmp_10 * cse_tmp_26 + 350898.6189912025 * cse_tmp_10 + 115473.863130355 * cse_tmp_11 * cse_tmp_20 - 163466.5554678523 * cse_tmp_11 * cse_tmp_21 - 15315.05949447743 * cse_tmp_11 * cse_tmp_22 + 198846.0652019835 * cse_tmp_11 * cse_tmp_23 - 171108.9384205077 * cse_tmp_11 * cse_tmp_24 + 60057.78014491514 * cse_tmp_11 * cse_tmp_25 - 7603.992167046412 * cse_tmp_11 * cse_tmp_26 - 19910.21621205205 * cse_tmp_11 - 2993.683893648461 * cse_tmp_12 * cse_tmp_20 + 3957.520085169941 * cse_tmp_12 * cse_tmp_21 + 1039.754342304997 * cse_tmp_12 * cse_tmp_22 - 5770.093744814911 * cse_tmp_12 * cse_tmp_23 + 4644.152605011283 * cse_tmp_12 * cse_tmp_24 - 1540.247720972315 * cse_tmp_12 * cse_tmp_25 + 181.4496666411464 * cse_tmp_12 * cse_tmp_26 + 537.7706986894427 * cse_tmp_12 + 30.75892520717642 * cse_tmp_13 * cse_tmp_20 - 25.36401209503385 * cse_tmp_13 * cse_tmp_21 - 41.85008687888828 * cse_tmp_13 * cse_tmp_22 + 86.96748856629755 * cse_tmp_13 * cse_tmp_23 - 58.3658407971521 * cse_tmp_13 * cse_tmp_24 + 16.74395060375635 * cse_tmp_13 * cse_tmp_25 - 1.614694805554658 * cse_tmp_13 * cse_tmp_26 + 1.883358793056443 * cse_tmp_13 + 185132150.9285095 * cse_tmp_20 * cse_tmp_7 - 98627275.07572448 * cse_tmp_20 * cse_tmp_8 + 20641413.8779294 * cse_tmp_20 * cse_tmp_9 - 0.2480544735250277 * cse_tmp_20 - 208175972.7060195 * cse_tmp_21 * cse_tmp_7 + 120960607.21347 * cse_tmp_21 * cse_tmp_8 - 27220455.70802359 * cse_tmp_21 * cse_tmp_9 - 0.6241128578137353 * cse_tmp_21 - 154619509.9941386 * cse_tmp_22 * cse_tmp_7 + 57719754.77060121 * cse_tmp_22 * cse_tmp_8 - 7495921.708901889 * cse_tmp_22 * cse_tmp_9 + 1.565969177240412 * cse_tmp_22 + 457922246.6512626 * cse_tmp_23 * cse_tmp_7 - 217533988.6061401 * cse_tmp_23 * cse_tmp_8 + 40657309.22807712 * cse_tmp_23 * cse_tmp_9 - 1.82716478016568 * cse_tmp_23 - 361441606.3023786 * cse_tmp_24 * cse_tmp_7 + 177071200.4833126 * cse_tmp_24 * cse_tmp_8 - 34152405.62917035 * cse_tmp_24 * cse_tmp_9 + 1.11047904356314 * cse_tmp_24 + 127326684.6329339 * cse_tmp_25 * cse_tmp_7 - 62959561.10440211 * cse_tmp_25 * cse_tmp_8 + 12220239.62190516 * cse_tmp_25 * cse_tmp_9 - 0.3394086026355644 * cse_tmp_25 - 16894514.4825585 * cse_tmp_26 * cse_tmp_7 + 8360182.099762933 * cse_tmp_26 * cse_tmp_8 - 1616430.036952583 * cse_tmp_26 * cse_tmp_9 + 0.04092301938620932 * cse_tmp_26 - 30802511.04522659 * cse_tmp_7 + 16148767.15916041 * cse_tmp_8 - 3345796.653349333 * cse_tmp_9 + 1.005524561589378) * my_piecewise3(cse_tmp_32 <= zeta_threshold, cse_tmp_33, NaNMath.pow(cse_tmp_32, 1.3333333333333333))) + my_piecewise3(cse_tmp_1 * cse_tmp_29 <= dens_threshold, 0, -cse_tmp_34 * (185132150.9285095 * cse_tmp_37 * cse_tmp_49 - 208175972.7060195 * cse_tmp_37 * cse_tmp_50 - 154619509.9941386 * cse_tmp_37 * cse_tmp_51 + 457922246.6512626 * cse_tmp_37 * cse_tmp_52 - 361441606.3023786 * cse_tmp_37 * cse_tmp_53 + 127326684.6329339 * cse_tmp_37 * cse_tmp_54 - 16894514.4825585 * cse_tmp_37 * cse_tmp_55 - 30802511.04522659 * cse_tmp_37 - 98627275.07572448 * cse_tmp_38 * cse_tmp_49 + 120960607.21347 * cse_tmp_38 * cse_tmp_50 + 57719754.77060121 * cse_tmp_38 * cse_tmp_51 - 217533988.6061401 * cse_tmp_38 * cse_tmp_52 + 177071200.4833126 * cse_tmp_38 * cse_tmp_53 - 62959561.10440211 * cse_tmp_38 * cse_tmp_54 + 8360182.099762933 * cse_tmp_38 * cse_tmp_55 + 16148767.15916041 * cse_tmp_38 + 20641413.8779294 * cse_tmp_39 * cse_tmp_49 - 27220455.70802359 * cse_tmp_39 * cse_tmp_50 - 7495921.708901889 * cse_tmp_39 * cse_tmp_51 + 40657309.22807712 * cse_tmp_39 * cse_tmp_52 - 34152405.62917035 * cse_tmp_39 * cse_tmp_53 + 12220239.62190516 * cse_tmp_39 * cse_tmp_54 - 1616430.036952583 * cse_tmp_39 * cse_tmp_55 - 3345796.653349333 * cse_tmp_39 - 2146671.464473209 * cse_tmp_40 * cse_tmp_49 + 2983063.574524986 * cse_tmp_40 * cse_tmp_50 + 420679.37924971 * cse_tmp_40 * cse_tmp_51 - 3850436.497459403 * cse_tmp_40 * cse_tmp_52 + 3314307.067628512 * cse_tmp_40 * cse_tmp_53 - 1184520.868316188 * cse_tmp_40 * cse_tmp_54 + 154697.0048185611 * cse_tmp_40 * cse_tmp_55 + 350898.6189912025 * cse_tmp_40 + 115473.863130355 * cse_tmp_41 * cse_tmp_49 - 163466.5554678523 * cse_tmp_41 * cse_tmp_50 - 15315.05949447743 * cse_tmp_41 * cse_tmp_51 + 198846.0652019835 * cse_tmp_41 * cse_tmp_52 - 171108.9384205077 * cse_tmp_41 * cse_tmp_53 + 60057.78014491514 * cse_tmp_41 * cse_tmp_54 - 7603.992167046412 * cse_tmp_41 * cse_tmp_55 - 19910.21621205205 * cse_tmp_41 - 2993.683893648461 * cse_tmp_42 * cse_tmp_49 + 3957.520085169941 * cse_tmp_42 * cse_tmp_50 + 1039.754342304997 * cse_tmp_42 * cse_tmp_51 - 5770.093744814911 * cse_tmp_42 * cse_tmp_52 + 4644.152605011283 * cse_tmp_42 * cse_tmp_53 - 1540.247720972315 * cse_tmp_42 * cse_tmp_54 + 181.4496666411464 * cse_tmp_42 * cse_tmp_55 + 537.7706986894427 * cse_tmp_42 + 30.75892520717642 * cse_tmp_43 * cse_tmp_49 - 25.36401209503385 * cse_tmp_43 * cse_tmp_50 - 41.85008687888828 * cse_tmp_43 * cse_tmp_51 + 86.96748856629755 * cse_tmp_43 * cse_tmp_52 - 58.3658407971521 * cse_tmp_43 * cse_tmp_53 + 16.74395060375635 * cse_tmp_43 * cse_tmp_54 - 1.614694805554658 * cse_tmp_43 * cse_tmp_55 + 1.883358793056443 * cse_tmp_43 - 0.2480544735250277 * cse_tmp_49 - 0.6241128578137353 * cse_tmp_50 + 1.565969177240412 * cse_tmp_51 - 1.82716478016568 * cse_tmp_52 + 1.11047904356314 * cse_tmp_53 - 0.3394086026355644 * cse_tmp_54 + 0.04092301938620932 * cse_tmp_55 + 1.005524561589378) * my_piecewise3(cse_tmp_56 <= zeta_threshold, cse_tmp_33, NaNMath.pow(cse_tmp_56, 1.3333333333333333)))
    end
end
export mgga_x_mcml_energy

const mgga_x_mcml_defaults = (dens_threshold = 1.0e-14, zeta_threshold = 2.220446049250313e-16)
const mgga_x_mcml_required = ()

function mgga_x_mcml(rho, sigma, lapl, tau; params = NamedTuple())
    p = resolve_params(mgga_x_mcml_defaults, mgga_x_mcml_required, params)
    v = mgga_variables(rho, sigma, lapl, tau, Val(3))
    return mgga_x_mcml_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.dens_threshold, p.zeta_threshold)
end

function mgga_x_mcml(na, nb, gaa, gab, gbb, la, lb, ta, tb; params = NamedTuple())
    p = resolve_params(mgga_x_mcml_defaults, mgga_x_mcml_required, params)
    v = mgga_variables(na, nb, gaa, gab, gbb, la, lb, ta, tb, Val(3))
    return mgga_x_mcml_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.dens_threshold, p.zeta_threshold)
end

export mgga_x_mcml, mgga_x_mcml_defaults, mgga_x_mcml_required
