# Auto-generated from the Libxc sources
# python/gga_exc/gga_x_pw91.py -- do not edit by hand.
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
# args: rs, z, xt, xs0, xs1, dens_threshold, params_a_a, params_a_alpha, params_a_b, params_a_c, params_a_d, params_a_expo, params_a_f, zeta_threshold
const gga_x_pw91_energy = function (rs, z, xt, xs0, xs1, dens_threshold, params_a_a, params_a_alpha, params_a_b, params_a_c, params_a_d, params_a_expo, params_a_f, zeta_threshold)
    @inbounds begin
        cse_tmp_0 = z + 1
        cse_tmp_1 = (3 // 8) / (pi * rs ^ 3)
        cse_tmp_2 = xs0 ^ 2
        cse_tmp_3 = 1.8171205928321397
        cse_tmp_4 = 0.2173369174628993
        cse_tmp_5 = cse_tmp_3 * cse_tmp_4 / 24
        cse_tmp_6 = cse_tmp_2 * cse_tmp_5
        cse_tmp_7 = params_a_expo / 2
        cse_tmp_8 = params_a_b ^ 2
        cse_tmp_9 = (29393 // 113267782428181659648) * params_a_b ^ 23 / 90032220.84293328
        cse_tmp_10 = 1.081935890528998e-06
        cse_tmp_11 = params_a_b ^ 17
        cse_tmp_12 = (7 // 1660944384) * params_a_b ^ 11 / 9488.531016070574
        cse_tmp_13 = 0.010265982254684336
        cse_tmp_14 = params_a_b ^ 5
        cse_tmp_15 = 2.413990407301591e-09
        cse_tmp_16 = params_a_b ^ 25
        cse_tmp_17 = (12155 // 365504053351809024) * cse_tmp_3 * params_a_b ^ 19 / 4252702.174637001
        cse_tmp_18 = 2.2905222852177984e-05
        cse_tmp_19 = params_a_b ^ 13
        cse_tmp_20 = (5 // 6193152) * cse_tmp_3 * params_a_b ^ 7 / 448.1939477706577
        cse_tmp_21 = 3.3019272488946267
        cse_tmp_22 = (1300075 // 3676258543978604182634496) * cse_tmp_21 * params_a_b ^ 27 / 1906035376.3434184
        cse_tmp_23 = 5.110560498665783e-08
        cse_tmp_24 = params_a_b ^ 21
        cse_tmp_25 = (143 // 31310311587840) * cse_tmp_21 * params_a_b ^ 15 / 200877.81481824708
        cse_tmp_26 = 0.0004849171180109538
        cse_tmp_27 = params_a_b ^ 9
        cse_tmp_28 = cse_tmp_21 * params_a_b ^ 3 / (3456 * 21.170591578193033)
        cse_tmp_29 = 1 / (16 * cse_tmp_8)
        cse_tmp_30 = NaNMath.sqrt(my_piecewise3(cse_tmp_6 > cse_tmp_29, cse_tmp_6, cse_tmp_29))
        cse_tmp_31 = params_a_a * my_piecewise3(cse_tmp_6 * cse_tmp_8 < 1 // 16, (715 // 757013755723776) * cse_tmp_10 * cse_tmp_11 * xs0 ^ 18 - cse_tmp_12 * xs0 ^ 12 + cse_tmp_13 * cse_tmp_14 * xs0 ^ 6 / 30720 + (676039 // 70915481172426778214400) * cse_tmp_15 * cse_tmp_16 * cse_tmp_3 * xs0 ^ 26 - cse_tmp_17 * xs0 ^ 20 + (77 // 565325070336) * cse_tmp_18 * cse_tmp_19 * cse_tmp_3 * xs0 ^ 14 + cse_tmp_2 * cse_tmp_3 * cse_tmp_4 * params_a_b / 24 - cse_tmp_20 * xs0 ^ 8 + (46189 // 38781903766170894336) * cse_tmp_21 * cse_tmp_23 * cse_tmp_24 * xs0 ^ 22 + (35 // 1528823808) * cse_tmp_21 * cse_tmp_26 * cse_tmp_27 * xs0 ^ 10 - cse_tmp_22 * xs0 ^ 28 - cse_tmp_25 * xs0 ^ 16 - cse_tmp_28 * xs0 ^ 4 - cse_tmp_9 * xs0 ^ 24, cse_tmp_30 * xc_asinh(cse_tmp_30 * params_a_b)) + 1
        cse_tmp_32 = cse_tmp_0 <= zeta_threshold
        cse_tmp_33 = zeta_threshold - 1
        cse_tmp_34 = 1 - z
        cse_tmp_35 = cse_tmp_34 <= zeta_threshold
        cse_tmp_36 = -cse_tmp_33
        cse_tmp_37 = my_piecewise5(cse_tmp_32, cse_tmp_33, cse_tmp_35, cse_tmp_36, z) + 1
        cse_tmp_38 = NaNMath.pow(zeta_threshold, 1.3333333333333333)
        cse_tmp_39 = 0.184639691595506 * cse_tmp_3 / (1.4645918875615234 * rs)
        cse_tmp_40 = xs1 ^ 2
        cse_tmp_41 = cse_tmp_40 * cse_tmp_5
        cse_tmp_42 = NaNMath.sqrt(my_piecewise3(cse_tmp_41 > cse_tmp_29, cse_tmp_41, cse_tmp_29))
        cse_tmp_43 = params_a_a * my_piecewise3(cse_tmp_41 * cse_tmp_8 < 1 // 16, (715 // 757013755723776) * cse_tmp_10 * cse_tmp_11 * xs1 ^ 18 - cse_tmp_12 * xs1 ^ 12 + cse_tmp_13 * cse_tmp_14 * xs1 ^ 6 / 30720 + (676039 // 70915481172426778214400) * cse_tmp_15 * cse_tmp_16 * cse_tmp_3 * xs1 ^ 26 - cse_tmp_17 * xs1 ^ 20 + (77 // 565325070336) * cse_tmp_18 * cse_tmp_19 * cse_tmp_3 * xs1 ^ 14 - cse_tmp_20 * xs1 ^ 8 + (46189 // 38781903766170894336) * cse_tmp_21 * cse_tmp_23 * cse_tmp_24 * xs1 ^ 22 + (35 // 1528823808) * cse_tmp_21 * cse_tmp_26 * cse_tmp_27 * xs1 ^ 10 - cse_tmp_22 * xs1 ^ 28 - cse_tmp_25 * xs1 ^ 16 - cse_tmp_28 * xs1 ^ 4 + cse_tmp_3 * cse_tmp_4 * cse_tmp_40 * params_a_b / 24 - cse_tmp_9 * xs1 ^ 24, cse_tmp_42 * xc_asinh(cse_tmp_42 * params_a_b)) + 1
        cse_tmp_44 = my_piecewise5(cse_tmp_35, cse_tmp_33, cse_tmp_32, cse_tmp_36, -z) + 1
        my_piecewise3(cse_tmp_0 * cse_tmp_1 <= dens_threshold, 0, -cse_tmp_39 * (cse_tmp_31 + cse_tmp_6 * (params_a_c + params_a_d * exp(-cse_tmp_6 * params_a_alpha))) * my_piecewise3(cse_tmp_37 <= zeta_threshold, cse_tmp_38, NaNMath.pow(cse_tmp_37, 1.3333333333333333)) / (cse_tmp_31 + NaNMath.pow(cse_tmp_6, cse_tmp_7) * params_a_f)) + my_piecewise3(cse_tmp_1 * cse_tmp_34 <= dens_threshold, 0, -cse_tmp_39 * (cse_tmp_41 * (params_a_c + params_a_d * exp(-cse_tmp_41 * params_a_alpha)) + cse_tmp_43) * my_piecewise3(cse_tmp_44 <= zeta_threshold, cse_tmp_38, NaNMath.pow(cse_tmp_44, 1.3333333333333333)) / (NaNMath.pow(cse_tmp_41, cse_tmp_7) * params_a_f + cse_tmp_43))
    end
end
export gga_x_pw91_energy

const gga_x_pw91_defaults = (dens_threshold = 1.0e-15, params_a_a = 0.19645, params_a_alpha = 100.0, params_a_b = 7.7956, params_a_c = 0.2743, params_a_d = -0.1508, params_a_expo = 4.0, params_a_f = 0.004, zeta_threshold = 2.220446049250313e-16)
const gga_x_pw91_required = ()

function gga_x_pw91(rho, sigma; params = NamedTuple())
    p = resolve_params(gga_x_pw91_defaults, gga_x_pw91_required, params)
    v = gga_variables(rho, sigma, Val(3))
    return gga_x_pw91_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.dens_threshold, p.params_a_a, p.params_a_alpha, p.params_a_b, p.params_a_c, p.params_a_d, p.params_a_expo, p.params_a_f, p.zeta_threshold)
end

function gga_x_pw91(na, nb, gaa, gab, gbb; params = NamedTuple())
    p = resolve_params(gga_x_pw91_defaults, gga_x_pw91_required, params)
    v = gga_variables(na, nb, gaa, gab, gbb, Val(3))
    return gga_x_pw91_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.dens_threshold, p.params_a_a, p.params_a_alpha, p.params_a_b, p.params_a_c, p.params_a_d, p.params_a_expo, p.params_a_f, p.zeta_threshold)
end

export gga_x_pw91, gga_x_pw91_defaults, gga_x_pw91_required

const gga_x_mpw91_defaults = (dens_threshold = 1.0e-15, params_a_a = 0.19925436482652492, params_a_alpha = 100.0, params_a_b = 7.795554179441507, params_a_c = 0.27821157721542716, params_a_d = -0.15475478709197044, params_a_expo = 3.72, params_a_f = 0.002233276157114453, zeta_threshold = 2.220446049250313e-16)
const gga_x_mpw91_required = ()

function gga_x_mpw91(rho, sigma; params = NamedTuple())
    p = resolve_params(gga_x_mpw91_defaults, gga_x_mpw91_required, params)
    v = gga_variables(rho, sigma, Val(3))
    return gga_x_pw91_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.dens_threshold, p.params_a_a, p.params_a_alpha, p.params_a_b, p.params_a_c, p.params_a_d, p.params_a_expo, p.params_a_f, p.zeta_threshold)
end

function gga_x_mpw91(na, nb, gaa, gab, gbb; params = NamedTuple())
    p = resolve_params(gga_x_mpw91_defaults, gga_x_mpw91_required, params)
    v = gga_variables(na, nb, gaa, gab, gbb, Val(3))
    return gga_x_pw91_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.dens_threshold, p.params_a_a, p.params_a_alpha, p.params_a_b, p.params_a_c, p.params_a_d, p.params_a_expo, p.params_a_f, p.zeta_threshold)
end

export gga_x_mpw91, gga_x_mpw91_defaults, gga_x_mpw91_required

const gga_x_pw91_mod_defaults = (dens_threshold = 1.0e-15, params_a_a = 0.196447965321926, params_a_alpha = 100.0, params_a_b = 7.795554179441507, params_a_c = 0.2742931042969, params_a_d = -0.1508363141734433, params_a_expo = 4.0, params_a_f = 0.003968803415078375, zeta_threshold = 2.220446049250313e-16)
const gga_x_pw91_mod_required = ()

function gga_x_pw91_mod(rho, sigma; params = NamedTuple())
    p = resolve_params(gga_x_pw91_mod_defaults, gga_x_pw91_mod_required, params)
    v = gga_variables(rho, sigma, Val(3))
    return gga_x_pw91_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.dens_threshold, p.params_a_a, p.params_a_alpha, p.params_a_b, p.params_a_c, p.params_a_d, p.params_a_expo, p.params_a_f, p.zeta_threshold)
end

function gga_x_pw91_mod(na, nb, gaa, gab, gbb; params = NamedTuple())
    p = resolve_params(gga_x_pw91_mod_defaults, gga_x_pw91_mod_required, params)
    v = gga_variables(na, nb, gaa, gab, gbb, Val(3))
    return gga_x_pw91_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.dens_threshold, p.params_a_a, p.params_a_alpha, p.params_a_b, p.params_a_c, p.params_a_d, p.params_a_expo, p.params_a_f, p.zeta_threshold)
end

export gga_x_pw91_mod, gga_x_pw91_mod_defaults, gga_x_pw91_mod_required
