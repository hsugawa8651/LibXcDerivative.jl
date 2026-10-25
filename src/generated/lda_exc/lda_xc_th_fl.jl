# Auto-generated from the Libxc sources
# python/lda_exc/lda_xc_th_fl.py -- do not edit by hand.
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
# args: rs, z, params_a_omega_0, params_a_omega_1, params_a_omega_2, params_a_omega_3
const lda_xc_th_fl_energy = function (rs, z, params_a_omega_0, params_a_omega_1, params_a_omega_2, params_a_omega_3)
    @inbounds begin
        cse_tmp_0 = z + 1
        cse_tmp_1 = (3 // 16) * 1.4422495703074083 / (4.60115111447049 * rs ^ 4)
        cse_tmp_2 = 1 - z
        cse_tmp_3 = (3 // 32) * 2.449489742783178 / (5.568327996831708 * NaNMath.pow(rs, 4.5))
        cse_tmp_4 = (3 // 32) * 2.080083823051904 / (6.738808595698141 * rs ^ 5)
        cse_tmp_5 = (3 // 16) * 1.4142135623730951 * 1.2009369551760027 / (3.8019656152149746 * NaNMath.pow(rs, 3.5))
        (4 // 3) * pi * rs ^ 3 * (params_a_omega_0 * (NaNMath.pow(cse_tmp_0, 1.1666666666666667) * cse_tmp_5 + NaNMath.pow(cse_tmp_2, 1.1666666666666667) * cse_tmp_5) + params_a_omega_1 * (NaNMath.pow(cse_tmp_0, 1.3333333333333333) * cse_tmp_1 + cse_tmp_1 * NaNMath.pow(cse_tmp_2, 1.3333333333333333)) + params_a_omega_2 * (NaNMath.pow(cse_tmp_0, 1.5) * cse_tmp_3 + NaNMath.pow(cse_tmp_2, 1.5) * cse_tmp_3) + params_a_omega_3 * (NaNMath.pow(cse_tmp_0, 1.6666666666666667) * cse_tmp_4 + NaNMath.pow(cse_tmp_2, 1.6666666666666667) * cse_tmp_4))
    end
end
export lda_xc_th_fl_energy

const lda_xc_th_fl_defaults = (params_a_omega_0 = -1.06141, params_a_omega_1 = 0.898203, params_a_omega_2 = -1.34439, params_a_omega_3 = 0.302369)
const lda_xc_th_fl_required = ()

function lda_xc_th_fl(rho; params = NamedTuple())
    p = resolve_params(lda_xc_th_fl_defaults, lda_xc_th_fl_required, params)
    v = lda_variables(rho, Val(3))
    return lda_xc_th_fl_energy(v.rs, v.z, p.params_a_omega_0, p.params_a_omega_1, p.params_a_omega_2, p.params_a_omega_3)
end

function lda_xc_th_fl(na, nb; params = NamedTuple())
    p = resolve_params(lda_xc_th_fl_defaults, lda_xc_th_fl_required, params)
    v = lda_variables(na, nb, Val(3))
    return lda_xc_th_fl_energy(v.rs, v.z, p.params_a_omega_0, p.params_a_omega_1, p.params_a_omega_2, p.params_a_omega_3)
end

export lda_xc_th_fl, lda_xc_th_fl_defaults, lda_xc_th_fl_required
