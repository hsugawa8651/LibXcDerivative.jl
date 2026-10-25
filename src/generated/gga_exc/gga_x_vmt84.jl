# Auto-generated from the Libxc sources
# python/gga_exc/gga_x_vmt84.py -- do not edit by hand.
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
# args: rs, z, xt, xs0, xs1, dens_threshold, params_a_alpha, params_a_mu, zeta_threshold
const gga_x_vmt84_energy = function (rs, z, xt, xs0, xs1, dens_threshold, params_a_alpha, params_a_mu, zeta_threshold)
    @inbounds begin
        cse_tmp_0 = z + 1
        cse_tmp_1 = (3 // 8) / (pi * rs ^ 3)
        cse_tmp_2 = 1.8171205928321397
        cse_tmp_3 = cse_tmp_2 / (24 * 4.60115111447049)
        cse_tmp_4 = cse_tmp_3 * xs0 ^ 2
        cse_tmp_5 = cse_tmp_4 * params_a_mu
        cse_tmp_6 = cse_tmp_4 * params_a_alpha
        cse_tmp_7 = 3.3019272488946267
        cse_tmp_8 = cse_tmp_7 * params_a_alpha / 21.170591578193033
        cse_tmp_9 = cse_tmp_8 * xs0 ^ 4
        cse_tmp_10 = cse_tmp_9 / 576
        cse_tmp_11 = params_a_alpha ^ 9 / (542822550634340773842124800 * 854273519913.8881)
        cse_tmp_12 = 1.1107134652876787e-08
        cse_tmp_13 = params_a_alpha ^ 6
        cse_tmp_14 = params_a_alpha ^ 3 / (127401984 * 9488.531016070574)
        cse_tmp_15 = cse_tmp_2 * params_a_alpha ^ 11 / (3962100880303698980809385548185600 * 382880221366141.06)
        cse_tmp_16 = 2.4781982684336344e-11
        cse_tmp_17 = params_a_alpha ^ 8
        cse_tmp_18 = cse_tmp_2 * params_a_alpha ^ 5 / (211344603217920 * 4252702.174637001)
        cse_tmp_19 = 0.0022311769379619183
        cse_tmp_20 = params_a_alpha ^ 2
        cse_tmp_21 = 5.529298824226284e-14
        cse_tmp_22 = params_a_alpha ^ 10
        cse_tmp_23 = cse_tmp_7 * params_a_alpha ^ 7 / (654444626054133841920 * 1906035376.3434184)
        cse_tmp_24 = 4.9781505284931216e-06
        cse_tmp_25 = params_a_alpha ^ 4
        cse_tmp_26 = my_piecewise3(cse_tmp_10 > 1 // 16, cse_tmp_10, 1 // 16)
        cse_tmp_27 = cse_tmp_0 <= zeta_threshold
        cse_tmp_28 = zeta_threshold - 1
        cse_tmp_29 = 1 - z
        cse_tmp_30 = cse_tmp_29 <= zeta_threshold
        cse_tmp_31 = -cse_tmp_28
        cse_tmp_32 = my_piecewise5(cse_tmp_27, cse_tmp_28, cse_tmp_30, cse_tmp_31, z) + 1
        cse_tmp_33 = NaNMath.pow(zeta_threshold, 1.3333333333333333)
        cse_tmp_34 = 0.184639691595506 * cse_tmp_2 / (1.4645918875615234 * rs)
        cse_tmp_35 = cse_tmp_3 * xs1 ^ 2
        cse_tmp_36 = cse_tmp_35 * params_a_mu
        cse_tmp_37 = cse_tmp_35 * params_a_alpha
        cse_tmp_38 = cse_tmp_8 * xs1 ^ 4
        cse_tmp_39 = cse_tmp_38 / 576
        cse_tmp_40 = my_piecewise3(cse_tmp_39 > 1 // 16, cse_tmp_39, 1 // 16)
        cse_tmp_41 = my_piecewise5(cse_tmp_30, cse_tmp_28, cse_tmp_27, cse_tmp_31, -z) + 1
        my_piecewise3(cse_tmp_0 * cse_tmp_1 <= dens_threshold, 0, -cse_tmp_34 * (cse_tmp_5 * exp(-cse_tmp_6) / (cse_tmp_5 + 1) + cse_tmp_6 * (1 - cse_tmp_4) * my_piecewise3(cse_tmp_10 < 1 // 16, -cse_tmp_11 * xs0 ^ 36 + cse_tmp_12 * cse_tmp_13 * xs0 ^ 24 / 142023573362442240 - cse_tmp_14 * xs0 ^ 12 - cse_tmp_15 * xs0 ^ 44 + cse_tmp_16 * cse_tmp_17 * cse_tmp_2 * xs0 ^ 32 / 565440156910771639418880 - cse_tmp_18 * xs0 ^ 20 + cse_tmp_19 * cse_tmp_2 * cse_tmp_20 * xs0 ^ 8 / 331776 + cse_tmp_21 * cse_tmp_22 * cse_tmp_7 * xs0 ^ 40 / 3439323680819183143063702732800 - cse_tmp_23 * xs0 ^ 28 + cse_tmp_24 * cse_tmp_25 * cse_tmp_7 * xs0 ^ 16 / 366917713920 - cse_tmp_9 / 1152 + 1, -xc_expm1(-cse_tmp_26) / cse_tmp_26) + 1) * my_piecewise3(cse_tmp_32 <= zeta_threshold, cse_tmp_33, NaNMath.pow(cse_tmp_32, 1.3333333333333333))) + my_piecewise3(cse_tmp_1 * cse_tmp_29 <= dens_threshold, 0, -cse_tmp_34 * (cse_tmp_36 * exp(-cse_tmp_37) / (cse_tmp_36 + 1) + cse_tmp_37 * (1 - cse_tmp_35) * my_piecewise3(cse_tmp_39 < 1 // 16, -cse_tmp_11 * xs1 ^ 36 + cse_tmp_12 * cse_tmp_13 * xs1 ^ 24 / 142023573362442240 - cse_tmp_14 * xs1 ^ 12 - cse_tmp_15 * xs1 ^ 44 + cse_tmp_16 * cse_tmp_17 * cse_tmp_2 * xs1 ^ 32 / 565440156910771639418880 - cse_tmp_18 * xs1 ^ 20 + cse_tmp_19 * cse_tmp_2 * cse_tmp_20 * xs1 ^ 8 / 331776 + cse_tmp_21 * cse_tmp_22 * cse_tmp_7 * xs1 ^ 40 / 3439323680819183143063702732800 - cse_tmp_23 * xs1 ^ 28 + cse_tmp_24 * cse_tmp_25 * cse_tmp_7 * xs1 ^ 16 / 366917713920 - cse_tmp_38 / 1152 + 1, -xc_expm1(-cse_tmp_40) / cse_tmp_40) + 1) * my_piecewise3(cse_tmp_41 <= zeta_threshold, cse_tmp_33, NaNMath.pow(cse_tmp_41, 1.3333333333333333)))
    end
end
export gga_x_vmt84_energy

const gga_x_vmt84_defaults = NamedTuple()
const gga_x_vmt84_required = (:dens_threshold, :params_a_alpha, :params_a_mu, :zeta_threshold)

function gga_x_vmt84(rho, sigma; params = NamedTuple())
    p = resolve_params(gga_x_vmt84_defaults, gga_x_vmt84_required, params)
    v = gga_variables(rho, sigma, Val(3))
    return gga_x_vmt84_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.dens_threshold, p.params_a_alpha, p.params_a_mu, p.zeta_threshold)
end

function gga_x_vmt84(na, nb, gaa, gab, gbb; params = NamedTuple())
    p = resolve_params(gga_x_vmt84_defaults, gga_x_vmt84_required, params)
    v = gga_variables(na, nb, gaa, gab, gbb, Val(3))
    return gga_x_vmt84_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.dens_threshold, p.params_a_alpha, p.params_a_mu, p.zeta_threshold)
end

export gga_x_vmt84, gga_x_vmt84_defaults, gga_x_vmt84_required

const gga_x_vmt84_ge_defaults = (dens_threshold = 1.0e-15, params_a_alpha = 2.3e-5, params_a_mu = 0.12345679012345678, zeta_threshold = 2.220446049250313e-16)
const gga_x_vmt84_ge_required = ()

function gga_x_vmt84_ge(rho, sigma; params = NamedTuple())
    p = resolve_params(gga_x_vmt84_ge_defaults, gga_x_vmt84_ge_required, params)
    v = gga_variables(rho, sigma, Val(3))
    return gga_x_vmt84_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.dens_threshold, p.params_a_alpha, p.params_a_mu, p.zeta_threshold)
end

function gga_x_vmt84_ge(na, nb, gaa, gab, gbb; params = NamedTuple())
    p = resolve_params(gga_x_vmt84_ge_defaults, gga_x_vmt84_ge_required, params)
    v = gga_variables(na, nb, gaa, gab, gbb, Val(3))
    return gga_x_vmt84_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.dens_threshold, p.params_a_alpha, p.params_a_mu, p.zeta_threshold)
end

export gga_x_vmt84_ge, gga_x_vmt84_ge_defaults, gga_x_vmt84_ge_required

const gga_x_vmt84_pbe_defaults = (dens_threshold = 1.0e-15, params_a_alpha = 7.4e-5, params_a_mu = 0.2195149727645171, zeta_threshold = 2.220446049250313e-16)
const gga_x_vmt84_pbe_required = ()

function gga_x_vmt84_pbe(rho, sigma; params = NamedTuple())
    p = resolve_params(gga_x_vmt84_pbe_defaults, gga_x_vmt84_pbe_required, params)
    v = gga_variables(rho, sigma, Val(3))
    return gga_x_vmt84_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.dens_threshold, p.params_a_alpha, p.params_a_mu, p.zeta_threshold)
end

function gga_x_vmt84_pbe(na, nb, gaa, gab, gbb; params = NamedTuple())
    p = resolve_params(gga_x_vmt84_pbe_defaults, gga_x_vmt84_pbe_required, params)
    v = gga_variables(na, nb, gaa, gab, gbb, Val(3))
    return gga_x_vmt84_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.dens_threshold, p.params_a_alpha, p.params_a_mu, p.zeta_threshold)
end

export gga_x_vmt84_pbe, gga_x_vmt84_pbe_defaults, gga_x_vmt84_pbe_required
