# Auto-generated from the Libxc sources
# python/lda_exc/lda_c_chachiyo.py -- do not edit by hand.
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
# args: rs, z, params_a_af, params_a_ap, params_a_bf, params_a_bp, params_a_cf, params_a_cp, zeta_threshold
const lda_c_chachiyo_energy = function (rs, z, params_a_af, params_a_ap, params_a_bf, params_a_bp, params_a_cf, params_a_cp, zeta_threshold)
    @inbounds begin
        cse_tmp_0 = rs ^ (-1)
        cse_tmp_1 = rs ^ (-2)
        cse_tmp_2 = params_a_ap * xc_log1p(cse_tmp_0 * params_a_bp + cse_tmp_1 * params_a_cp)
        cse_tmp_3 = NaNMath.pow(zeta_threshold, 1.3333333333333333) - 1
        cse_tmp_4 = zeta_threshold - 1
        cse_tmp_5 = -z
        cse_tmp_2 + (-cse_tmp_2 + params_a_af * xc_log1p(cse_tmp_0 * params_a_bf + cse_tmp_1 * params_a_cf)) * (my_piecewise3(1 - z <= zeta_threshold, cse_tmp_3, xc_expm1((4 // 3) * xc_log1p(my_piecewise3(cse_tmp_5 > cse_tmp_4, cse_tmp_5, cse_tmp_4)))) + my_piecewise3(z + 1 <= zeta_threshold, cse_tmp_3, xc_expm1((4 // 3) * xc_log1p(my_piecewise3(z > cse_tmp_4, z, cse_tmp_4))))) / (-2 + 2 * 1.2599210498948732)
    end
end
export lda_c_chachiyo_energy

const lda_c_chachiyo_defaults = (params_a_af = -0.007772675, params_a_ap = -0.01554535, params_a_bf = 27.4203609, params_a_bp = 20.4562557, params_a_cf = 27.4203609, params_a_cp = 20.4562557, zeta_threshold = 2.220446049250313e-16)
const lda_c_chachiyo_required = ()

function lda_c_chachiyo(rho; params = NamedTuple())
    p = resolve_params(lda_c_chachiyo_defaults, lda_c_chachiyo_required, params)
    v = lda_variables(rho, Val(3))
    return lda_c_chachiyo_energy(v.rs, v.z, p.params_a_af, p.params_a_ap, p.params_a_bf, p.params_a_bp, p.params_a_cf, p.params_a_cp, p.zeta_threshold)
end

function lda_c_chachiyo(na, nb; params = NamedTuple())
    p = resolve_params(lda_c_chachiyo_defaults, lda_c_chachiyo_required, params)
    v = lda_variables(na, nb, Val(3))
    return lda_c_chachiyo_energy(v.rs, v.z, p.params_a_af, p.params_a_ap, p.params_a_bf, p.params_a_bp, p.params_a_cf, p.params_a_cp, p.zeta_threshold)
end

export lda_c_chachiyo, lda_c_chachiyo_defaults, lda_c_chachiyo_required

const lda_c_karasiev_defaults = (params_a_af = -0.007772675, params_a_ap = -0.01554535, params_a_bf = 28.3559732, params_a_bp = 21.7392245, params_a_cf = 27.4203609, params_a_cp = 20.4562557, zeta_threshold = 2.220446049250313e-16)
const lda_c_karasiev_required = ()

function lda_c_karasiev(rho; params = NamedTuple())
    p = resolve_params(lda_c_karasiev_defaults, lda_c_karasiev_required, params)
    v = lda_variables(rho, Val(3))
    return lda_c_chachiyo_energy(v.rs, v.z, p.params_a_af, p.params_a_ap, p.params_a_bf, p.params_a_bp, p.params_a_cf, p.params_a_cp, p.zeta_threshold)
end

function lda_c_karasiev(na, nb; params = NamedTuple())
    p = resolve_params(lda_c_karasiev_defaults, lda_c_karasiev_required, params)
    v = lda_variables(na, nb, Val(3))
    return lda_c_chachiyo_energy(v.rs, v.z, p.params_a_af, p.params_a_ap, p.params_a_bf, p.params_a_bp, p.params_a_cf, p.params_a_cp, p.zeta_threshold)
end

export lda_c_karasiev, lda_c_karasiev_defaults, lda_c_karasiev_required
