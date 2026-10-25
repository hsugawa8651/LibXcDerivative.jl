# Auto-generated from the Libxc sources
# python/lda_exc/lda_xc_teter93.py -- do not edit by hand.
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
# args: rs, z, zeta_threshold
const lda_xc_teter93_energy = function (rs, z, zeta_threshold)
    @inbounds begin
        cse_tmp_0 = rs ^ 2
        cse_tmp_1 = NaNMath.pow(zeta_threshold, 1.3333333333333333) - 1
        cse_tmp_2 = zeta_threshold - 1
        cse_tmp_3 = -z
        cse_tmp_4 = (my_piecewise3(1 - z <= zeta_threshold, cse_tmp_1, xc_expm1((4 // 3) * xc_log1p(my_piecewise3(cse_tmp_3 > cse_tmp_2, cse_tmp_3, cse_tmp_2)))) + my_piecewise3(z + 1 <= zeta_threshold, cse_tmp_1, xc_expm1((4 // 3) * xc_log1p(my_piecewise3(z > cse_tmp_2, z, cse_tmp_2))))) / (-2 + 2 * 1.2599210498948732)
        cse_tmp_5 = rs ^ 3
        (-cse_tmp_0 * (0.1574201515892867 * cse_tmp_4 + 0.7405551735357053) - 0.119086804055547 * cse_tmp_4 - cse_tmp_5 * (0.003532336663397157 * cse_tmp_4 + 0.01968227878617998) - rs * (0.6157402568883345 * cse_tmp_4 + 2.217058676663745) - 0.4581652932831429) / (cse_tmp_0 * (0.2673612973836267 * cse_tmp_4 + 4.504130959426697) + cse_tmp_5 * (0.2052004607777787 * cse_tmp_4 + 1.110667363742916) + rs ^ 4 * (0.004200005045691381 * cse_tmp_4 + 0.02359291751427506) + rs)
    end
end
export lda_xc_teter93_energy

const lda_xc_teter93_defaults = (zeta_threshold = 2.220446049250313e-16,)
const lda_xc_teter93_required = ()

function lda_xc_teter93(rho; params = NamedTuple())
    p = resolve_params(lda_xc_teter93_defaults, lda_xc_teter93_required, params)
    v = lda_variables(rho, Val(3))
    return lda_xc_teter93_energy(v.rs, v.z, p.zeta_threshold)
end

function lda_xc_teter93(na, nb; params = NamedTuple())
    p = resolve_params(lda_xc_teter93_defaults, lda_xc_teter93_required, params)
    v = lda_variables(na, nb, Val(3))
    return lda_xc_teter93_energy(v.rs, v.z, p.zeta_threshold)
end

export lda_xc_teter93, lda_xc_teter93_defaults, lda_xc_teter93_required
