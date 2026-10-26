# Auto-generated from the Libxc sources
# python/mgga_exc/mgga_x_mggac.py -- do not edit by hand.
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
# args: rs, z, xt, xs0, xs1, u0, u1, t0, t1, XC_EPSILON, dens_threshold, zeta_threshold
const mgga_x_mggac_energy = function (rs, z, xt, xs0, xs1, u0, u1, t0, t1, XC_EPSILON, dens_threshold, zeta_threshold)
    @inbounds begin
        cse_tmp_0 = z + 1
        cse_tmp_1 = (3 // 8) / (pi * rs ^ 3)
        cse_tmp_2 = 1.8171205928321397
        cse_tmp_3 = cse_tmp_2 / 4.60115111447049
        cse_tmp_4 = (10 // 9) * cse_tmp_3
        cse_tmp_5 = (8 * t0 - xs0 ^ 2) / (8 * t0)
        cse_tmp_6 = NaNMath.pow(XC_EPSILON, 0.6666666666666666)
        cse_tmp_7 = my_piecewise3(cse_tmp_5 > cse_tmp_6, cse_tmp_5, cse_tmp_6)
        cse_tmp_8 = cse_tmp_7 * t0
        cse_tmp_9 = 3.3019272488946267 / 21.170591578193033
        cse_tmp_10 = 1.16202777777778 * cse_tmp_9
        cse_tmp_11 = cse_tmp_7 ^ 2 * t0 ^ 2
        cse_tmp_12 = 0.0555555555555556 * cse_tmp_3
        cse_tmp_13 = 3.48608333333333 * cse_tmp_9
        cse_tmp_14 = 1.2599210498948732
        cse_tmp_15 = (4 // 3) * 2.1450293971110255 * cse_tmp_14
        cse_tmp_16 = mbrxc_x(cse_tmp_15 * (-cse_tmp_11 * cse_tmp_13 + cse_tmp_12 * cse_tmp_8 + 1) / (cse_tmp_10 * cse_tmp_11 + cse_tmp_4 * cse_tmp_8 + 3.712))
        cse_tmp_17 = NaNMath.sqrt(XC_EPSILON)
        cse_tmp_18 = 1.4645918875615234
        cse_tmp_19 = cse_tmp_14 * cse_tmp_18
        cse_tmp_20 = 1.01549129756326 * cse_tmp_19
        cse_tmp_21 = 0.112832366395918 * cse_tmp_19
        cse_tmp_22 = 0.097788050876462 * cse_tmp_19
        cse_tmp_23 = 0.0745051816201615 * cse_tmp_19
        cse_tmp_24 = my_piecewise3(cse_tmp_16 > cse_tmp_17, cse_tmp_16, cse_tmp_17)
        cse_tmp_25 = 0.338497099187753 * cse_tmp_19
        cse_tmp_26 = cse_tmp_0 <= zeta_threshold
        cse_tmp_27 = zeta_threshold - 1
        cse_tmp_28 = 1 - z
        cse_tmp_29 = cse_tmp_28 <= zeta_threshold
        cse_tmp_30 = -cse_tmp_27
        cse_tmp_31 = my_piecewise5(cse_tmp_26, cse_tmp_27, cse_tmp_29, cse_tmp_30, z) + 1
        cse_tmp_32 = NaNMath.pow(zeta_threshold, 1.3333333333333333)
        cse_tmp_33 = 0.0923198457977528 * cse_tmp_2 / (cse_tmp_18 * rs)
        cse_tmp_34 = (8 * t1 - xs1 ^ 2) / (8 * t1)
        cse_tmp_35 = my_piecewise3(cse_tmp_34 > cse_tmp_6, cse_tmp_34, cse_tmp_6)
        cse_tmp_36 = cse_tmp_35 * t1
        cse_tmp_37 = cse_tmp_35 ^ 2 * t1 ^ 2
        cse_tmp_38 = mbrxc_x(cse_tmp_15 * (cse_tmp_12 * cse_tmp_36 - cse_tmp_13 * cse_tmp_37 + 1) / (cse_tmp_10 * cse_tmp_37 + cse_tmp_36 * cse_tmp_4 + 3.712))
        cse_tmp_39 = my_piecewise3(cse_tmp_38 > cse_tmp_17, cse_tmp_38, cse_tmp_17)
        cse_tmp_40 = my_piecewise5(cse_tmp_29, cse_tmp_27, cse_tmp_26, cse_tmp_30, -z) + 1
        my_piecewise3(cse_tmp_0 * cse_tmp_1 <= dens_threshold, 0, cse_tmp_33 * my_piecewise3(cse_tmp_31 <= zeta_threshold, cse_tmp_32, NaNMath.pow(cse_tmp_31, 1.3333333333333333)) * my_piecewise3(cse_tmp_16 < cse_tmp_17, 0.083997428316961 * cse_tmp_14 * cse_tmp_16 ^ 5 * cse_tmp_18 + 0.112832366395918 * cse_tmp_14 * cse_tmp_16 ^ 3 * cse_tmp_18 - cse_tmp_16 ^ 6 * cse_tmp_23 - cse_tmp_16 ^ 4 * cse_tmp_22 - cse_tmp_16 ^ 2 * cse_tmp_21 - cse_tmp_20, -cse_tmp_25 * (-cse_tmp_24 * (cse_tmp_24 + 5) - (cse_tmp_24 ^ 2 + 5 * cse_tmp_24 + 8) * xc_expm1(-cse_tmp_24)) * exp(cse_tmp_24 / 3) / (cse_tmp_24 * NaNMath.pow(cse_tmp_24 + 1, 0.3333333333333333)))) + my_piecewise3(cse_tmp_1 * cse_tmp_28 <= dens_threshold, 0, cse_tmp_33 * my_piecewise3(cse_tmp_40 <= zeta_threshold, cse_tmp_32, NaNMath.pow(cse_tmp_40, 1.3333333333333333)) * my_piecewise3(cse_tmp_38 < cse_tmp_17, 0.083997428316961 * cse_tmp_14 * cse_tmp_18 * cse_tmp_38 ^ 5 + 0.112832366395918 * cse_tmp_14 * cse_tmp_18 * cse_tmp_38 ^ 3 - cse_tmp_20 - cse_tmp_21 * cse_tmp_38 ^ 2 - cse_tmp_22 * cse_tmp_38 ^ 4 - cse_tmp_23 * cse_tmp_38 ^ 6, -cse_tmp_25 * (-cse_tmp_39 * (cse_tmp_39 + 5) - (cse_tmp_39 ^ 2 + 5 * cse_tmp_39 + 8) * xc_expm1(-cse_tmp_39)) * exp(cse_tmp_39 / 3) / (cse_tmp_39 * NaNMath.pow(cse_tmp_39 + 1, 0.3333333333333333))))
    end
end
export mgga_x_mggac_energy

const mgga_x_mggac_defaults = (XC_EPSILON = 2.220446049250313e-16, dens_threshold = 1.0e-12, zeta_threshold = 2.220446049250313e-16)
const mgga_x_mggac_required = ()

function mgga_x_mggac(rho, sigma, lapl, tau; params = NamedTuple())
    p = resolve_params(mgga_x_mggac_defaults, mgga_x_mggac_required, params)
    v = mgga_variables(rho, sigma, lapl, tau, Val(3))
    return mgga_x_mggac_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.XC_EPSILON, p.dens_threshold, p.zeta_threshold)
end

function mgga_x_mggac(na, nb, gaa, gab, gbb, la, lb, ta, tb; params = NamedTuple())
    p = resolve_params(mgga_x_mggac_defaults, mgga_x_mggac_required, params)
    v = mgga_variables(na, nb, gaa, gab, gbb, la, lb, ta, tb, Val(3))
    return mgga_x_mggac_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.XC_EPSILON, p.dens_threshold, p.zeta_threshold)
end

export mgga_x_mggac, mgga_x_mggac_defaults, mgga_x_mggac_required
