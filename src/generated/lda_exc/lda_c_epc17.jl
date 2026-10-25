# Auto-generated from the Libxc sources
# python/lda_exc/lda_c_epc17.py -- do not edit by hand.
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
# args: rs, z, dens_threshold, params_a_a, params_a_b, params_a_c, zeta_threshold
const lda_c_epc17_energy = function (rs, z, dens_threshold, params_a_a, params_a_b, params_a_c, zeta_threshold)
    @inbounds begin
        cse_tmp_0 = z + 1
        cse_tmp_1 = 1 / (pi * rs ^ 3)
        cse_tmp_2 = (3 // 8) * cse_tmp_1
        cse_tmp_3 = 1 - z
        cse_tmp_4 = cse_tmp_0 <= zeta_threshold
        cse_tmp_5 = zeta_threshold - 1
        cse_tmp_6 = cse_tmp_3 <= zeta_threshold
        cse_tmp_7 = -cse_tmp_5
        cse_tmp_8 = (my_piecewise5(cse_tmp_4, cse_tmp_5, cse_tmp_6, cse_tmp_7, z) + 1) * (my_piecewise5(cse_tmp_6, cse_tmp_5, cse_tmp_4, cse_tmp_7, -z) + 1)
        my_piecewise3(cse_tmp_0 * cse_tmp_2 <= dens_threshold && cse_tmp_2 * cse_tmp_3 <= dens_threshold, 0, -3 // 16 * cse_tmp_1 * cse_tmp_8 / (-cse_tmp_2 * NaNMath.sqrt(cse_tmp_8) * params_a_b + (9 // 64) * cse_tmp_8 * params_a_c / (9.869604401089358 * rs ^ 6) + params_a_a))
    end
end
export lda_c_epc17_energy

const lda_c_epc17_defaults = (dens_threshold = 1.0e-15, params_a_a = 2.35, params_a_b = 2.4, params_a_c = 3.2, zeta_threshold = 2.220446049250313e-16)
const lda_c_epc17_required = ()

function lda_c_epc17(rho; params = NamedTuple())
    p = resolve_params(lda_c_epc17_defaults, lda_c_epc17_required, params)
    v = lda_variables(rho, Val(3))
    return lda_c_epc17_energy(v.rs, v.z, p.dens_threshold, p.params_a_a, p.params_a_b, p.params_a_c, p.zeta_threshold)
end

function lda_c_epc17(na, nb; params = NamedTuple())
    p = resolve_params(lda_c_epc17_defaults, lda_c_epc17_required, params)
    v = lda_variables(na, nb, Val(3))
    return lda_c_epc17_energy(v.rs, v.z, p.dens_threshold, p.params_a_a, p.params_a_b, p.params_a_c, p.zeta_threshold)
end

export lda_c_epc17, lda_c_epc17_defaults, lda_c_epc17_required

const lda_c_epc17_2_defaults = (dens_threshold = 1.0e-15, params_a_a = 2.35, params_a_b = 2.4, params_a_c = 6.6, zeta_threshold = 2.220446049250313e-16)
const lda_c_epc17_2_required = ()

function lda_c_epc17_2(rho; params = NamedTuple())
    p = resolve_params(lda_c_epc17_2_defaults, lda_c_epc17_2_required, params)
    v = lda_variables(rho, Val(3))
    return lda_c_epc17_energy(v.rs, v.z, p.dens_threshold, p.params_a_a, p.params_a_b, p.params_a_c, p.zeta_threshold)
end

function lda_c_epc17_2(na, nb; params = NamedTuple())
    p = resolve_params(lda_c_epc17_2_defaults, lda_c_epc17_2_required, params)
    v = lda_variables(na, nb, Val(3))
    return lda_c_epc17_energy(v.rs, v.z, p.dens_threshold, p.params_a_a, p.params_a_b, p.params_a_c, p.zeta_threshold)
end

export lda_c_epc17_2, lda_c_epc17_2_defaults, lda_c_epc17_2_required
