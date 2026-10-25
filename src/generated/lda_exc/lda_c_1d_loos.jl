# Auto-generated from the Libxc sources
# python/lda_exc/lda_c_1d_loos.py -- do not edit by hand.
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
# args: rs, z
const lda_c_1d_loos_energy = function (rs, z)
    @inbounds begin
        cse_tmp_0 = NaNMath.sqrt(1.657016 * rs + 1) + 1
        cse_tmp_1 = NaNMath.log(1.4142135623730951 * 1.772453850905516)
        cse_tmp_2 = 2 / cse_tmp_0
        cse_tmp_3 = 1 - cse_tmp_2
        cse_tmp_4 = 4 / cse_tmp_0 ^ 2
        cse_tmp_4 * (cse_tmp_2 * cse_tmp_3 ^ 2 * (1.33872895878891 - 1.657016 * cse_tmp_1) + cse_tmp_3 ^ 3 * (0.3106905 - 0.414254 * cse_tmp_1) + cse_tmp_3 * cse_tmp_4 * (0.0203981132348752 - 9.869604401089358 / 72) + 0.0676 / cse_tmp_0 ^ 3)
    end
end
export lda_c_1d_loos_energy

const lda_c_1d_loos_defaults = NamedTuple()
const lda_c_1d_loos_required = ()

function lda_c_1d_loos(rho; params = NamedTuple())
    p = resolve_params(lda_c_1d_loos_defaults, lda_c_1d_loos_required, params)
    v = lda_variables(rho, Val(1))
    return lda_c_1d_loos_energy(v.rs, v.z)
end

function lda_c_1d_loos(na, nb; params = NamedTuple())
    p = resolve_params(lda_c_1d_loos_defaults, lda_c_1d_loos_required, params)
    v = lda_variables(na, nb, Val(1))
    return lda_c_1d_loos_energy(v.rs, v.z)
end

export lda_c_1d_loos, lda_c_1d_loos_defaults, lda_c_1d_loos_required
