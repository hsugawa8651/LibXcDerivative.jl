# Auto-generated from the Libxc sources
# python/lda_exc/lda_c_gk72.py -- do not edit by hand.
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
# args: rs, z
const lda_c_gk72_energy = function (rs, z)
    @inbounds begin
        cse_tmp_0 = NaNMath.log(rs)
        my_piecewise5(rs < 0.7, 0.009 * cse_tmp_0 * rs + 0.0311 * cse_tmp_0 - 0.01 * rs - 0.048, rs < 10, 0.01898 * cse_tmp_0 - 0.06156, -0.438 / rs - 1.47 / rs ^ 2 + 1.325 / NaNMath.pow(rs, 1.5) - 0.4 / NaNMath.pow(rs, 2.5))
    end
end
export lda_c_gk72_energy

const lda_c_gk72_defaults = NamedTuple()
const lda_c_gk72_required = ()

function lda_c_gk72(rho; params = NamedTuple())
    p = resolve_params(lda_c_gk72_defaults, lda_c_gk72_required, params)
    v = lda_variables(rho, Val(3))
    return lda_c_gk72_energy(v.rs, v.z)
end

function lda_c_gk72(na, nb; params = NamedTuple())
    p = resolve_params(lda_c_gk72_defaults, lda_c_gk72_required, params)
    v = lda_variables(na, nb, Val(3))
    return lda_c_gk72_energy(v.rs, v.z)
end

export lda_c_gk72, lda_c_gk72_defaults, lda_c_gk72_required
