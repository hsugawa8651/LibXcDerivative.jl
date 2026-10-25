# Auto-generated from the Libxc sources
# python/lda_exc/lda_c_1d_css.py -- do not edit by hand.
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
# args: rs, z, params_a_ferro_0, params_a_ferro_1, params_a_ferro_2, params_a_ferro_3, params_a_ferro_4, params_a_ferro_5, params_a_ferro_6, params_a_ferro_7, params_a_ferro_8, params_a_ferro_9, params_a_para_0, params_a_para_1, params_a_para_2, params_a_para_3, params_a_para_4, params_a_para_5, params_a_para_6, params_a_para_7, params_a_para_8, params_a_para_9
const lda_c_1d_css_energy = function (rs, z, params_a_ferro_0, params_a_ferro_1, params_a_ferro_2, params_a_ferro_3, params_a_ferro_4, params_a_ferro_5, params_a_ferro_6, params_a_ferro_7, params_a_ferro_8, params_a_ferro_9, params_a_para_0, params_a_para_1, params_a_para_2, params_a_para_3, params_a_para_4, params_a_para_5, params_a_para_6, params_a_para_7, params_a_para_8, params_a_para_9)
    @inbounds begin
        cse_tmp_0 = rs ^ 2
        cse_tmp_1 = 2 * rs
        cse_tmp_2 = (-cse_tmp_0 * params_a_para_4 - rs) * xc_log1p(params_a_para_7 * rs + params_a_para_8 * NaNMath.pow(rs, params_a_para_9)) / (cse_tmp_1 * params_a_para_1 + 2 * params_a_para_0 + 2 * params_a_para_2 * NaNMath.pow(rs, params_a_para_5) + 2 * params_a_para_3 * NaNMath.pow(rs, params_a_para_6))
        cse_tmp_2 + z ^ 2 * (-cse_tmp_2 + (-cse_tmp_0 * params_a_ferro_4 - rs) * xc_log1p(params_a_ferro_7 * rs + params_a_ferro_8 * NaNMath.pow(rs, params_a_ferro_9)) / (cse_tmp_1 * params_a_ferro_1 + 2 * params_a_ferro_0 + 2 * params_a_ferro_2 * NaNMath.pow(rs, params_a_ferro_5) + 2 * params_a_ferro_3 * NaNMath.pow(rs, params_a_ferro_6)))
    end
end
export lda_c_1d_css_energy

const lda_c_1d_css_defaults = (params_a_ferro_0 = 5.24, params_a_ferro_1 = 0.0, params_a_ferro_2 = 1.568, params_a_ferro_3 = 0.12856, params_a_ferro_4 = 0.003201, params_a_ferro_5 = 2.0, params_a_ferro_6 = 3.0, params_a_ferro_7 = 0.0538, params_a_ferro_8 = 1.56e-5, params_a_ferro_9 = 2.958, params_a_para_0 = 18.4, params_a_para_1 = 0.0, params_a_para_2 = 7.501, params_a_para_3 = 0.10185, params_a_para_4 = 0.012827, params_a_para_5 = 2.0, params_a_para_6 = 3.0, params_a_para_7 = 1.511, params_a_para_8 = 0.258, params_a_para_9 = 4.424)
const lda_c_1d_css_required = ()

function lda_c_1d_css(rho; params = NamedTuple())
    p = resolve_params(lda_c_1d_css_defaults, lda_c_1d_css_required, params)
    v = lda_variables(rho, Val(1))
    return lda_c_1d_css_energy(v.rs, v.z, p.params_a_ferro_0, p.params_a_ferro_1, p.params_a_ferro_2, p.params_a_ferro_3, p.params_a_ferro_4, p.params_a_ferro_5, p.params_a_ferro_6, p.params_a_ferro_7, p.params_a_ferro_8, p.params_a_ferro_9, p.params_a_para_0, p.params_a_para_1, p.params_a_para_2, p.params_a_para_3, p.params_a_para_4, p.params_a_para_5, p.params_a_para_6, p.params_a_para_7, p.params_a_para_8, p.params_a_para_9)
end

function lda_c_1d_css(na, nb; params = NamedTuple())
    p = resolve_params(lda_c_1d_css_defaults, lda_c_1d_css_required, params)
    v = lda_variables(na, nb, Val(1))
    return lda_c_1d_css_energy(v.rs, v.z, p.params_a_ferro_0, p.params_a_ferro_1, p.params_a_ferro_2, p.params_a_ferro_3, p.params_a_ferro_4, p.params_a_ferro_5, p.params_a_ferro_6, p.params_a_ferro_7, p.params_a_ferro_8, p.params_a_ferro_9, p.params_a_para_0, p.params_a_para_1, p.params_a_para_2, p.params_a_para_3, p.params_a_para_4, p.params_a_para_5, p.params_a_para_6, p.params_a_para_7, p.params_a_para_8, p.params_a_para_9)
end

export lda_c_1d_css, lda_c_1d_css_defaults, lda_c_1d_css_required
