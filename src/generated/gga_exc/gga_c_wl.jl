# Auto-generated from the Libxc sources
# python/gga_exc/gga_c_wl.py -- do not edit by hand.
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
# args: rs, z, xt, xs0, xs1
const gga_c_wl_energy = function (rs, z, xt, xs0, xs1)
    @inbounds begin
        NaNMath.sqrt((1 - z) * (z + 1)) * (0.06001 * xt - 0.7486) / (rs + 0.9 * xs0 + 0.9 * xs1 + 3.60073)
    end
end
export gga_c_wl_energy

const gga_c_wl_defaults = NamedTuple()
const gga_c_wl_required = ()

function gga_c_wl(rho, sigma; params = NamedTuple())
    p = resolve_params(gga_c_wl_defaults, gga_c_wl_required, params)
    v = gga_variables(rho, sigma, Val(3))
    return gga_c_wl_energy(v.rs, v.z, v.xt, v.xs0, v.xs1)
end

function gga_c_wl(na, nb, gaa, gab, gbb; params = NamedTuple())
    p = resolve_params(gga_c_wl_defaults, gga_c_wl_required, params)
    v = gga_variables(na, nb, gaa, gab, gbb, Val(3))
    return gga_c_wl_energy(v.rs, v.z, v.xt, v.xs0, v.xs1)
end

export gga_c_wl, gga_c_wl_defaults, gga_c_wl_required
