# Auto-generated from the Libxc sources
# python/lda_exc/lda_c_rpa.py -- do not edit by hand.
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
# args: rs, z
const lda_c_rpa_energy = function (rs, z)
    @inbounds begin
        cse_tmp_0 = NaNMath.log(rs)
        0.0311 * cse_tmp_0 + rs * (0.018 * cse_tmp_0 - 0.036) / 2 - 0.048
    end
end
export lda_c_rpa_energy

const lda_c_rpa_defaults = NamedTuple()
const lda_c_rpa_required = ()

function lda_c_rpa(rho; params = NamedTuple())
    p = resolve_params(lda_c_rpa_defaults, lda_c_rpa_required, params)
    v = lda_variables(rho, Val(3))
    return lda_c_rpa_energy(v.rs, v.z)
end

function lda_c_rpa(na, nb; params = NamedTuple())
    p = resolve_params(lda_c_rpa_defaults, lda_c_rpa_required, params)
    v = lda_variables(na, nb, Val(3))
    return lda_c_rpa_energy(v.rs, v.z)
end

export lda_c_rpa, lda_c_rpa_defaults, lda_c_rpa_required
