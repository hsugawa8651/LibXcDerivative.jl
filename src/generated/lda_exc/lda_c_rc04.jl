# Auto-generated from the Libxc sources
# python/lda_exc/lda_c_rc04.py -- do not edit by hand.
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
# args: rs, z, zeta_threshold
const lda_c_rc04_energy = function (rs, z, zeta_threshold)
    @inbounds begin
        cse_tmp_0 = NaNMath.pow(zeta_threshold, 0.6666666666666666) - 1
        cse_tmp_1 = zeta_threshold - 1
        cse_tmp_2 = -z
        (0.897889 - 0.655868 * atan(3.177037 * rs + 4.88827)) * (my_piecewise3(1 - z <= zeta_threshold, cse_tmp_0, xc_expm1((2 // 3) * xc_log1p(my_piecewise3(cse_tmp_2 > cse_tmp_1, cse_tmp_2, cse_tmp_1)))) / 2 + my_piecewise3(z + 1 <= zeta_threshold, cse_tmp_0, xc_expm1((2 // 3) * xc_log1p(my_piecewise3(z > cse_tmp_1, z, cse_tmp_1)))) / 2 + 1) ^ 3 / rs
    end
end
export lda_c_rc04_energy

const lda_c_rc04_defaults = (zeta_threshold = 2.220446049250313e-16,)
const lda_c_rc04_required = ()

function lda_c_rc04(rho; params = NamedTuple())
    p = resolve_params(lda_c_rc04_defaults, lda_c_rc04_required, params)
    v = lda_variables(rho, Val(3))
    return lda_c_rc04_energy(v.rs, v.z, p.zeta_threshold)
end

function lda_c_rc04(na, nb; params = NamedTuple())
    p = resolve_params(lda_c_rc04_defaults, lda_c_rc04_required, params)
    v = lda_variables(na, nb, Val(3))
    return lda_c_rc04_energy(v.rs, v.z, p.zeta_threshold)
end

export lda_c_rc04, lda_c_rc04_defaults, lda_c_rc04_required
