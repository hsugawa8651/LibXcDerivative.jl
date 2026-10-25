# Auto-generated from the Libxc sources
# python/lda_exc/lda_x_sloc.py -- do not edit by hand.
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
# args: rs, z, params_a_a, params_a_b, zeta_threshold
const lda_x_sloc_energy = function (rs, z, params_a_a, params_a_b, zeta_threshold)
    @inbounds begin
        cse_tmp_0 = z + 1
        cse_tmp_1 = params_a_b + 1
        cse_tmp_2 = NaNMath.pow(zeta_threshold, cse_tmp_1)
        cse_tmp_3 = 1 - z
        -params_a_a * NaNMath.pow((3 // 4) / (pi * rs ^ 3), params_a_b) * (my_piecewise3(cse_tmp_0 <= zeta_threshold, cse_tmp_2, NaNMath.pow(cse_tmp_0, cse_tmp_1)) + my_piecewise3(cse_tmp_3 <= zeta_threshold, cse_tmp_2, NaNMath.pow(cse_tmp_3, cse_tmp_1))) / (2 * params_a_b + 2)
    end
end
export lda_x_sloc_energy

const lda_x_sloc_defaults = (params_a_a = 1.67, params_a_b = 0.3, zeta_threshold = 2.220446049250313e-16)
const lda_x_sloc_required = ()

function lda_x_sloc(rho; params = NamedTuple())
    p = resolve_params(lda_x_sloc_defaults, lda_x_sloc_required, params)
    v = lda_variables(rho, Val(3))
    return lda_x_sloc_energy(v.rs, v.z, p.params_a_a, p.params_a_b, p.zeta_threshold)
end

function lda_x_sloc(na, nb; params = NamedTuple())
    p = resolve_params(lda_x_sloc_defaults, lda_x_sloc_required, params)
    v = lda_variables(na, nb, Val(3))
    return lda_x_sloc_energy(v.rs, v.z, p.params_a_a, p.params_a_b, p.zeta_threshold)
end

export lda_x_sloc, lda_x_sloc_defaults, lda_x_sloc_required

const lda_x_t_sloc_defaults = (params_a_a = 1.775, params_a_b = 0.26, zeta_threshold = 2.220446049250313e-16)
const lda_x_t_sloc_required = ()

function lda_x_t_sloc(rho; params = NamedTuple())
    p = resolve_params(lda_x_t_sloc_defaults, lda_x_t_sloc_required, params)
    v = lda_variables(rho, Val(3))
    return lda_x_sloc_energy(v.rs, v.z, p.params_a_a, p.params_a_b, p.zeta_threshold)
end

function lda_x_t_sloc(na, nb; params = NamedTuple())
    p = resolve_params(lda_x_t_sloc_defaults, lda_x_t_sloc_required, params)
    v = lda_variables(na, nb, Val(3))
    return lda_x_sloc_energy(v.rs, v.z, p.params_a_a, p.params_a_b, p.zeta_threshold)
end

export lda_x_t_sloc, lda_x_t_sloc_defaults, lda_x_t_sloc_required
