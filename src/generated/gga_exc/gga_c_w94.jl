# Auto-generated from the Libxc sources
# python/gga_exc/gga_c_w94.py -- do not edit by hand.
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
# args: rs, z, xt, xs0, xs1, XC_EPSILON
const gga_c_w94_energy = function (rs, z, xt, xs0, xs1, XC_EPSILON)
    @inbounds begin
        cse_tmp_0 = my_piecewise3(z >= 0, z, -z)
        cse_tmp_1 = NaNMath.pow(XC_EPSILON, 0.6666666666666666)
        cse_tmp_2 = my_piecewise3(cse_tmp_0 > cse_tmp_1, cse_tmp_0, cse_tmp_1)
        cse_tmp_3 = 1 - cse_tmp_1
        -NaNMath.sqrt(1 - NaNMath.pow(my_piecewise3(cse_tmp_2 > cse_tmp_3, cse_tmp_3, cse_tmp_2), 1.6666666666666667)) / (0.00367333333333333 * 3.3019272488946267 * 1.4645918875615234 * rs * xt ^ 2 + rs + 0.15067 * NaNMath.pow(Abs(xt), 3.1875) + 11.8)
    end
end
export gga_c_w94_energy

const gga_c_w94_defaults = (XC_EPSILON = 2.220446049250313e-16,)
const gga_c_w94_required = ()

function gga_c_w94(rho, sigma; params = NamedTuple())
    p = resolve_params(gga_c_w94_defaults, gga_c_w94_required, params)
    v = gga_variables(rho, sigma, Val(3))
    return gga_c_w94_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.XC_EPSILON)
end

function gga_c_w94(na, nb, gaa, gab, gbb; params = NamedTuple())
    p = resolve_params(gga_c_w94_defaults, gga_c_w94_required, params)
    v = gga_variables(na, nb, gaa, gab, gbb, Val(3))
    return gga_c_w94_energy(v.rs, v.z, v.xt, v.xs0, v.xs1, p.XC_EPSILON)
end

export gga_c_w94, gga_c_w94_defaults, gga_c_w94_required
