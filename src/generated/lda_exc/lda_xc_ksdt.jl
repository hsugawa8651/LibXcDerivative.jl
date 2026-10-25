# Auto-generated from the Libxc sources
# python/lda_exc/lda_xc_ksdt.py -- do not edit by hand.
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
# args: rs, z, params_a_T, params_a_b_0__0, params_a_b_0__1, params_a_b_0__2, params_a_b_0__3, params_a_b_0__4, params_a_b_1__0, params_a_b_1__1, params_a_b_1__2, params_a_b_1__3, params_a_b_1__4, params_a_c_0__0, params_a_c_0__1, params_a_c_0__2, params_a_c_1__0, params_a_c_1__1, params_a_c_1__2, params_a_d_0__0, params_a_d_0__1, params_a_d_0__2, params_a_d_0__3, params_a_d_0__4, params_a_d_1__0, params_a_d_1__1, params_a_d_1__2, params_a_d_1__3, params_a_d_1__4, params_a_e_0__0, params_a_e_0__1, params_a_e_0__2, params_a_e_0__3, params_a_e_0__4, params_a_e_1__0, params_a_e_1__1, params_a_e_1__2, params_a_e_1__3, params_a_e_1__4, params_a_thetaParam, zeta_threshold
const lda_xc_ksdt_energy = function (rs, z, params_a_T, params_a_b_0__0, params_a_b_0__1, params_a_b_0__2, params_a_b_0__3, params_a_b_0__4, params_a_b_1__0, params_a_b_1__1, params_a_b_1__2, params_a_b_1__3, params_a_b_1__4, params_a_c_0__0, params_a_c_0__1, params_a_c_0__2, params_a_c_1__0, params_a_c_1__1, params_a_c_1__2, params_a_d_0__0, params_a_d_0__1, params_a_d_0__2, params_a_d_0__3, params_a_d_0__4, params_a_d_1__0, params_a_d_1__1, params_a_d_1__2, params_a_d_1__3, params_a_d_1__4, params_a_e_0__0, params_a_e_0__1, params_a_e_0__2, params_a_e_0__3, params_a_e_0__4, params_a_e_1__0, params_a_e_1__1, params_a_e_1__2, params_a_e_1__3, params_a_e_1__4, params_a_thetaParam, zeta_threshold)
    @inbounds begin
        cse_tmp_0 = rs ^ (-1)
        cse_tmp_1 = rs ^ 2
        cse_tmp_2 = 2.1450293971110255
        cse_tmp_3 = cse_tmp_2 ^ (-1)
        cse_tmp_4 = params_a_thetaParam * z + 1
        cse_tmp_5 = NaNMath.pow(cse_tmp_4, 0.6666666666666666)
        cse_tmp_6 = cse_tmp_5 * params_a_T
        cse_tmp_7 = 2.080083823051904
        cse_tmp_8 = 1.2599210498948732
        cse_tmp_9 = cse_tmp_7 * cse_tmp_8
        cse_tmp_10 = cse_tmp_3 * cse_tmp_6 * cse_tmp_9
        cse_tmp_11 = (2 // 3 - 0.0139261 * rs) * exp(-4 // 9 * cse_tmp_1 * cse_tmp_10 * (0.254473333333333 * cse_tmp_10 * NaNMath.pow(rs, 2.5) + 1.064009)) / (0.183208 * rs + 1) - 2
        cse_tmp_12 = NaNMath.pow(2, -cse_tmp_11)
        cse_tmp_13 = (cse_tmp_12 - 2) ^ (-1)
        cse_tmp_14 = 1.8171205928321397
        cse_tmp_15 = cse_tmp_2 / (cse_tmp_1 * cse_tmp_5 * params_a_T)
        cse_tmp_16 = (3 // 4) * cse_tmp_14 * cse_tmp_15
        cse_tmp_17 = tanh(cse_tmp_16)
        cse_tmp_18 = NaNMath.pow(cse_tmp_4, 1.3333333333333333) * params_a_T ^ 2 * rs ^ 4 / 4.60115111447049
        cse_tmp_19 = cse_tmp_14 * cse_tmp_18
        cse_tmp_20 = (8 // 27) * cse_tmp_19
        cse_tmp_21 = 3.3019272488946267
        cse_tmp_22 = NaNMath.pow(cse_tmp_4, 2.6666666666666665) * params_a_T ^ 4 * rs ^ 8 / 21.170591578193033
        cse_tmp_23 = cse_tmp_21 * cse_tmp_22
        cse_tmp_24 = (64 // 729) * cse_tmp_23
        cse_tmp_25 = cse_tmp_17 * rs * (cse_tmp_20 * params_a_e_1__1 + cse_tmp_24 * params_a_e_1__2 + params_a_e_1__0) / (cse_tmp_20 * params_a_e_1__3 + cse_tmp_24 * params_a_e_1__4 + 1)
        cse_tmp_26 = NaNMath.sqrt(rs)
        cse_tmp_27 = cse_tmp_7 / 2
        cse_tmp_28 = 1.4645918875615234 * cse_tmp_0 / NaNMath.sqrt(cse_tmp_6)
        cse_tmp_29 = cse_tmp_26 * tanh(1.122462048309373 * cse_tmp_27 * cse_tmp_28)
        cse_tmp_30 = -1 + NaNMath.pow(zeta_threshold, -cse_tmp_11)
        cse_tmp_31 = zeta_threshold - 1
        cse_tmp_32 = -cse_tmp_11
        cse_tmp_33 = -z
        cse_tmp_34 = cse_tmp_4 ^ 2 * params_a_T ^ 3 * rs ^ 6 / 9.869604401089358
        cse_tmp_35 = 1.5874010519681994 * 1.4422495703074083
        cse_tmp_36 = (3 // 8) * cse_tmp_15 * cse_tmp_35
        cse_tmp_37 = tanh(cse_tmp_36)
        cse_tmp_38 = cse_tmp_22 * cse_tmp_9
        cse_tmp_39 = (512 // 729) * cse_tmp_38
        cse_tmp_40 = cse_tmp_18 * cse_tmp_35
        cse_tmp_41 = (16 // 27) * cse_tmp_40
        cse_tmp_42 = cse_tmp_37 * rs * (cse_tmp_39 * params_a_e_0__2 + cse_tmp_41 * params_a_e_0__1 + params_a_e_0__0) / (cse_tmp_39 * params_a_e_0__4 + cse_tmp_41 * params_a_e_0__3 + 1)
        cse_tmp_43 = cse_tmp_26 * tanh(1.7817974362806785 * cse_tmp_28 * cse_tmp_7 / 4)
        cse_tmp_44 = z / 2
        cse_tmp_45 = cse_tmp_44 - 1 // 2
        cse_tmp_46 = cse_tmp_44 + 1 // 2
        cse_tmp_47 = -cse_tmp_46
        -cse_tmp_0 * cse_tmp_12 * cse_tmp_13 * (-cse_tmp_27 * cse_tmp_3 * cse_tmp_37 * cse_tmp_8 * (-0.145809382716049 * cse_tmp_34 + 1.19642249657064 * cse_tmp_38 + 1.80363259259259 * cse_tmp_40 + 0.75) / (3.58926748971193 * cse_tmp_38 + 4.92474666666667 * cse_tmp_40 + 1) - cse_tmp_42 * (params_a_c_0__0 + params_a_c_0__1 * exp(-cse_tmp_36 * params_a_c_0__2)) - cse_tmp_43 * (cse_tmp_39 * params_a_b_0__2 + cse_tmp_41 * params_a_b_0__1 + params_a_b_0__0) / (cse_tmp_39 * params_a_b_0__4 + cse_tmp_41 * params_a_b_0__3 + 1)) * (my_piecewise3(-cse_tmp_45 <= zeta_threshold, cse_tmp_30, xc_expm1(cse_tmp_32 * xc_log1p(my_piecewise3(cse_tmp_47 > cse_tmp_31, cse_tmp_47, cse_tmp_31)))) + my_piecewise3(cse_tmp_46 <= zeta_threshold, cse_tmp_30, xc_expm1(cse_tmp_32 * xc_log1p(my_piecewise3(cse_tmp_45 > cse_tmp_31, cse_tmp_45, cse_tmp_31)))) + 1) / (cse_tmp_42 + cse_tmp_43 * (cse_tmp_39 * params_a_d_0__2 + cse_tmp_41 * params_a_d_0__1 + params_a_d_0__0) / (cse_tmp_39 * params_a_d_0__4 + cse_tmp_41 * params_a_d_0__3 + 1) + 1) + cse_tmp_0 * cse_tmp_13 * (my_piecewise3(1 - z <= zeta_threshold, cse_tmp_30, xc_expm1(cse_tmp_32 * xc_log1p(my_piecewise3(cse_tmp_33 > cse_tmp_31, cse_tmp_33, cse_tmp_31)))) + my_piecewise3(z + 1 <= zeta_threshold, cse_tmp_30, xc_expm1(cse_tmp_32 * xc_log1p(my_piecewise3(z > cse_tmp_31, z, cse_tmp_31))))) * (-cse_tmp_17 * cse_tmp_21 * cse_tmp_3 * (0.901816296296296 * cse_tmp_19 + 0.149552812071331 * cse_tmp_23 - 0.0364523456790123 * cse_tmp_34 + 0.75) / (2 * (2.46237333333333 * cse_tmp_19 + 0.448658436213992 * cse_tmp_23 + 1)) - cse_tmp_25 * (params_a_c_1__0 + params_a_c_1__1 * exp(-cse_tmp_16 * params_a_c_1__2)) - cse_tmp_29 * (cse_tmp_20 * params_a_b_1__1 + cse_tmp_24 * params_a_b_1__2 + params_a_b_1__0) / (cse_tmp_20 * params_a_b_1__3 + cse_tmp_24 * params_a_b_1__4 + 1)) / (cse_tmp_25 + cse_tmp_29 * (cse_tmp_20 * params_a_d_1__1 + cse_tmp_24 * params_a_d_1__2 + params_a_d_1__0) / (cse_tmp_20 * params_a_d_1__3 + cse_tmp_24 * params_a_d_1__4 + 1) + 1)
    end
end
export lda_xc_ksdt_energy

const lda_xc_ksdt_defaults = (params_a_T = 1.0e-8, params_a_b_0__0 = 0.283997, params_a_b_0__1 = 48.932154, params_a_b_0__2 = 0.370919, params_a_b_0__3 = 61.095357, params_a_b_0__4 = 0.8718374227027677, params_a_b_1__0 = 0.329001, params_a_b_1__1 = 111.598308, params_a_b_1__2 = 0.537053, params_a_b_1__3 = 105.086663, params_a_b_1__4 = 1.5904385917270092, params_a_c_0__0 = 0.870089, params_a_c_0__1 = 0.193077, params_a_c_0__2 = 2.414644, params_a_c_1__0 = 0.84893, params_a_c_1__1 = 0.167952, params_a_c_1__2 = 0.08882, params_a_d_0__0 = 0.579824, params_a_d_0__1 = 94.537454, params_a_d_0__2 = 97.839603, params_a_d_0__3 = 59.939999, params_a_d_0__4 = 24.388037, params_a_d_1__0 = 0.55133, params_a_d_1__1 = 180.213159, params_a_d_1__2 = 134.486231, params_a_d_1__3 = 103.861695, params_a_d_1__4 = 17.75071, params_a_e_0__0 = 0.212036, params_a_e_0__1 = 16.731249, params_a_e_0__2 = 28.485792, params_a_e_0__3 = 34.028876, params_a_e_0__4 = 17.235515, params_a_e_1__0 = 0.153124, params_a_e_1__1 = 19.543945, params_a_e_1__2 = 43.400337, params_a_e_1__3 = 120.255145, params_a_e_1__4 = 15.662836, params_a_thetaParam = 0.0, zeta_threshold = 2.220446049250313e-16)
const lda_xc_ksdt_required = ()

function lda_xc_ksdt(rho; params = NamedTuple())
    p = resolve_params(lda_xc_ksdt_defaults, lda_xc_ksdt_required, params)
    v = lda_variables(rho, Val(3))
    return lda_xc_ksdt_energy(v.rs, v.z, p.params_a_T, p.params_a_b_0__0, p.params_a_b_0__1, p.params_a_b_0__2, p.params_a_b_0__3, p.params_a_b_0__4, p.params_a_b_1__0, p.params_a_b_1__1, p.params_a_b_1__2, p.params_a_b_1__3, p.params_a_b_1__4, p.params_a_c_0__0, p.params_a_c_0__1, p.params_a_c_0__2, p.params_a_c_1__0, p.params_a_c_1__1, p.params_a_c_1__2, p.params_a_d_0__0, p.params_a_d_0__1, p.params_a_d_0__2, p.params_a_d_0__3, p.params_a_d_0__4, p.params_a_d_1__0, p.params_a_d_1__1, p.params_a_d_1__2, p.params_a_d_1__3, p.params_a_d_1__4, p.params_a_e_0__0, p.params_a_e_0__1, p.params_a_e_0__2, p.params_a_e_0__3, p.params_a_e_0__4, p.params_a_e_1__0, p.params_a_e_1__1, p.params_a_e_1__2, p.params_a_e_1__3, p.params_a_e_1__4, p.params_a_thetaParam, p.zeta_threshold)
end

function lda_xc_ksdt(na, nb; params = NamedTuple())
    p = resolve_params(lda_xc_ksdt_defaults, lda_xc_ksdt_required, params)
    v = lda_variables(na, nb, Val(3))
    return lda_xc_ksdt_energy(v.rs, v.z, p.params_a_T, p.params_a_b_0__0, p.params_a_b_0__1, p.params_a_b_0__2, p.params_a_b_0__3, p.params_a_b_0__4, p.params_a_b_1__0, p.params_a_b_1__1, p.params_a_b_1__2, p.params_a_b_1__3, p.params_a_b_1__4, p.params_a_c_0__0, p.params_a_c_0__1, p.params_a_c_0__2, p.params_a_c_1__0, p.params_a_c_1__1, p.params_a_c_1__2, p.params_a_d_0__0, p.params_a_d_0__1, p.params_a_d_0__2, p.params_a_d_0__3, p.params_a_d_0__4, p.params_a_d_1__0, p.params_a_d_1__1, p.params_a_d_1__2, p.params_a_d_1__3, p.params_a_d_1__4, p.params_a_e_0__0, p.params_a_e_0__1, p.params_a_e_0__2, p.params_a_e_0__3, p.params_a_e_0__4, p.params_a_e_1__0, p.params_a_e_1__1, p.params_a_e_1__2, p.params_a_e_1__3, p.params_a_e_1__4, p.params_a_thetaParam, p.zeta_threshold)
end

export lda_xc_ksdt, lda_xc_ksdt_defaults, lda_xc_ksdt_required

const lda_xc_corrksdt_defaults = (params_a_T = 1.0e-8, params_a_b_0__0 = 0.342554, params_a_b_0__1 = 9.141315, params_a_b_0__2 = 0.448483, params_a_b_0__3 = 18.553096, params_a_b_0__4 = 1.054149997293224, params_a_b_1__0 = 0.329001, params_a_b_1__1 = 111.598308, params_a_b_1__2 = 0.537053, params_a_b_1__3 = 105.086663, params_a_b_1__4 = 1.5904385917270092, params_a_c_0__0 = 0.87513, params_a_c_0__1 = -0.25632, params_a_c_0__2 = 0.953988, params_a_c_1__0 = 0.84893, params_a_c_1__1 = 0.167952, params_a_c_1__2 = 0.08882, params_a_d_0__0 = 0.725917, params_a_d_0__1 = 2.237347, params_a_d_0__2 = 0.280748, params_a_d_0__3 = 4.185911, params_a_d_0__4 = 0.692183, params_a_d_1__0 = 0.55133, params_a_d_1__1 = 180.213159, params_a_d_1__2 = 134.486231, params_a_d_1__3 = 103.861695, params_a_d_1__4 = 17.75071, params_a_e_0__0 = 0.255415, params_a_e_0__1 = 0.931933, params_a_e_0__2 = 0.115398, params_a_e_0__3 = 17.234117, params_a_e_0__4 = 0.451437, params_a_e_1__0 = 0.153124, params_a_e_1__1 = 19.543945, params_a_e_1__2 = 43.400337, params_a_e_1__3 = 120.255145, params_a_e_1__4 = 15.662836, params_a_thetaParam = 0.0, zeta_threshold = 2.220446049250313e-16)
const lda_xc_corrksdt_required = ()

function lda_xc_corrksdt(rho; params = NamedTuple())
    p = resolve_params(lda_xc_corrksdt_defaults, lda_xc_corrksdt_required, params)
    v = lda_variables(rho, Val(3))
    return lda_xc_ksdt_energy(v.rs, v.z, p.params_a_T, p.params_a_b_0__0, p.params_a_b_0__1, p.params_a_b_0__2, p.params_a_b_0__3, p.params_a_b_0__4, p.params_a_b_1__0, p.params_a_b_1__1, p.params_a_b_1__2, p.params_a_b_1__3, p.params_a_b_1__4, p.params_a_c_0__0, p.params_a_c_0__1, p.params_a_c_0__2, p.params_a_c_1__0, p.params_a_c_1__1, p.params_a_c_1__2, p.params_a_d_0__0, p.params_a_d_0__1, p.params_a_d_0__2, p.params_a_d_0__3, p.params_a_d_0__4, p.params_a_d_1__0, p.params_a_d_1__1, p.params_a_d_1__2, p.params_a_d_1__3, p.params_a_d_1__4, p.params_a_e_0__0, p.params_a_e_0__1, p.params_a_e_0__2, p.params_a_e_0__3, p.params_a_e_0__4, p.params_a_e_1__0, p.params_a_e_1__1, p.params_a_e_1__2, p.params_a_e_1__3, p.params_a_e_1__4, p.params_a_thetaParam, p.zeta_threshold)
end

function lda_xc_corrksdt(na, nb; params = NamedTuple())
    p = resolve_params(lda_xc_corrksdt_defaults, lda_xc_corrksdt_required, params)
    v = lda_variables(na, nb, Val(3))
    return lda_xc_ksdt_energy(v.rs, v.z, p.params_a_T, p.params_a_b_0__0, p.params_a_b_0__1, p.params_a_b_0__2, p.params_a_b_0__3, p.params_a_b_0__4, p.params_a_b_1__0, p.params_a_b_1__1, p.params_a_b_1__2, p.params_a_b_1__3, p.params_a_b_1__4, p.params_a_c_0__0, p.params_a_c_0__1, p.params_a_c_0__2, p.params_a_c_1__0, p.params_a_c_1__1, p.params_a_c_1__2, p.params_a_d_0__0, p.params_a_d_0__1, p.params_a_d_0__2, p.params_a_d_0__3, p.params_a_d_0__4, p.params_a_d_1__0, p.params_a_d_1__1, p.params_a_d_1__2, p.params_a_d_1__3, p.params_a_d_1__4, p.params_a_e_0__0, p.params_a_e_0__1, p.params_a_e_0__2, p.params_a_e_0__3, p.params_a_e_0__4, p.params_a_e_1__0, p.params_a_e_1__1, p.params_a_e_1__2, p.params_a_e_1__3, p.params_a_e_1__4, p.params_a_thetaParam, p.zeta_threshold)
end

export lda_xc_corrksdt, lda_xc_corrksdt_defaults, lda_xc_corrksdt_required

const lda_xc_gdsmfb_defaults = (params_a_T = 1.0e-8, params_a_b_0__0 = 0.3436902, params_a_b_0__1 = 7.82159531356, params_a_b_0__2 = 0.300483986662, params_a_b_0__3 = 15.8443467125, params_a_b_0__4 = 0.7062813835226853, params_a_b_1__0 = 0.84987704, params_a_b_1__1 = 3.04033012073, params_a_b_1__2 = 0.0775730131248, params_a_b_1__3 = 7.57703592489, params_a_b_1__4 = 0.22972614201992675, params_a_c_0__0 = 0.8759442, params_a_c_0__1 = -0.230130843551, params_a_c_0__2 = 1.0, params_a_c_1__0 = 0.91126873, params_a_c_1__1 = -0.0307957123308, params_a_c_1__2 = 1.0, params_a_d_0__0 = 0.72700876, params_a_d_0__1 = 2.38264734144, params_a_d_0__2 = 0.30221237251, params_a_d_0__3 = 4.39347718395, params_a_d_0__4 = 0.729951339845, params_a_d_1__0 = 1.48658718, params_a_d_1__1 = 4.92684905511, params_a_d_1__2 = 0.0849387225179, params_a_d_1__3 = 8.3269821188, params_a_d_1__4 = 0.218864952126, params_a_e_0__0 = 0.25388214, params_a_e_0__1 = 0.815795138599, params_a_e_0__2 = 0.0646844410481, params_a_e_0__3 = 15.0984620477, params_a_e_0__4 = 0.230761357474, params_a_e_1__0 = 0.27454097, params_a_e_1__1 = 0.400994856555, params_a_e_1__2 = 2.88773194962, params_a_e_1__3 = 6.33499237092, params_a_e_1__4 = 24.823008753, params_a_thetaParam = 0.0, zeta_threshold = 2.220446049250313e-16)
const lda_xc_gdsmfb_required = ()

function lda_xc_gdsmfb(rho; params = NamedTuple())
    p = resolve_params(lda_xc_gdsmfb_defaults, lda_xc_gdsmfb_required, params)
    v = lda_variables(rho, Val(3))
    return lda_xc_ksdt_energy(v.rs, v.z, p.params_a_T, p.params_a_b_0__0, p.params_a_b_0__1, p.params_a_b_0__2, p.params_a_b_0__3, p.params_a_b_0__4, p.params_a_b_1__0, p.params_a_b_1__1, p.params_a_b_1__2, p.params_a_b_1__3, p.params_a_b_1__4, p.params_a_c_0__0, p.params_a_c_0__1, p.params_a_c_0__2, p.params_a_c_1__0, p.params_a_c_1__1, p.params_a_c_1__2, p.params_a_d_0__0, p.params_a_d_0__1, p.params_a_d_0__2, p.params_a_d_0__3, p.params_a_d_0__4, p.params_a_d_1__0, p.params_a_d_1__1, p.params_a_d_1__2, p.params_a_d_1__3, p.params_a_d_1__4, p.params_a_e_0__0, p.params_a_e_0__1, p.params_a_e_0__2, p.params_a_e_0__3, p.params_a_e_0__4, p.params_a_e_1__0, p.params_a_e_1__1, p.params_a_e_1__2, p.params_a_e_1__3, p.params_a_e_1__4, p.params_a_thetaParam, p.zeta_threshold)
end

function lda_xc_gdsmfb(na, nb; params = NamedTuple())
    p = resolve_params(lda_xc_gdsmfb_defaults, lda_xc_gdsmfb_required, params)
    v = lda_variables(na, nb, Val(3))
    return lda_xc_ksdt_energy(v.rs, v.z, p.params_a_T, p.params_a_b_0__0, p.params_a_b_0__1, p.params_a_b_0__2, p.params_a_b_0__3, p.params_a_b_0__4, p.params_a_b_1__0, p.params_a_b_1__1, p.params_a_b_1__2, p.params_a_b_1__3, p.params_a_b_1__4, p.params_a_c_0__0, p.params_a_c_0__1, p.params_a_c_0__2, p.params_a_c_1__0, p.params_a_c_1__1, p.params_a_c_1__2, p.params_a_d_0__0, p.params_a_d_0__1, p.params_a_d_0__2, p.params_a_d_0__3, p.params_a_d_0__4, p.params_a_d_1__0, p.params_a_d_1__1, p.params_a_d_1__2, p.params_a_d_1__3, p.params_a_d_1__4, p.params_a_e_0__0, p.params_a_e_0__1, p.params_a_e_0__2, p.params_a_e_0__3, p.params_a_e_0__4, p.params_a_e_1__0, p.params_a_e_1__1, p.params_a_e_1__2, p.params_a_e_1__3, p.params_a_e_1__4, p.params_a_thetaParam, p.zeta_threshold)
end

export lda_xc_gdsmfb, lda_xc_gdsmfb_defaults, lda_xc_gdsmfb_required
