# Auto-generated from the Libxc sources
# python/lda_vxc/lda_xc_tih.py -- do not edit by hand.
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
# args: rs, z
const lda_xc_tih_potential = function (rs, z)
    @inbounds begin
        cse_tmp_0 = 1 / (pi * rs ^ 3)
        -0.909651 * tanh(0.0037243275 * cse_tmp_0 - 1.41063) - 0.915745 * tanh(0.0078264 * cse_tmp_0 - 0.420166) - 1.30351 * tanh(0.025109175 * cse_tmp_0 + 1.0953) - 1.29598 * tanh(0.029312775 * cse_tmp_0 - 0.354691) + 1.04305 * tanh(0.1024485 * cse_tmp_0 + 0.0748531) - 1.37026 * tanh(0.11429925 * cse_tmp_0 - 0.414661) - 1.95026 * tanh(0.33184125 * cse_tmp_0 + 1.47409) - 0.991782 * tanh(3.0217875 * cse_tmp_0 + 0.48315) + 0.625039
    end
end
export lda_xc_tih_potential

const lda_xc_tih_vxc_defaults = NamedTuple()
const lda_xc_tih_vxc_required = ()

"""
    lda_xc_tih_vxc(rho)

The exchange-correlation POTENTIAL, not an energy density.

Libxc files this functional under one of its `*_vxc` families, where the
maple source is the potential itself: the C carries `#define XC_NO_EXC`,
and the library reports no `XC_FLAGS_HAVE_EXC` for it. There is no energy
here to differentiate, and this potential is not the functional derivative
of one. The functionals Libxc files this way -- LB94, BJ06, TB09, RPP09
and this one -- were put forward as potentials to begin with, which is why
Libxc generates them apart from the energies.

So the contract the rest of this package keeps does not hold for this
name. Everywhere else a name returns an energy density and the caller
differentiates it to get a potential; here the potential is what comes
back, and differentiating it gives Libxc's next derivative order.

Checked against the library Libxc.jl vendors for the value and its first
derivative, which is as far as that library goes. Only `vrho` is
non-zero -- Libxc returns exactly 0 for `vsigma`, `vlapl` and `vtau`
here -- so there is no counterpart to those and none is offered.

Spin-resolved arguments are not taken: a potential has one component per
spin channel, and this kernel returns a single scalar.
"""
function lda_xc_tih_vxc(rho; params = NamedTuple())
    p = resolve_params(lda_xc_tih_vxc_defaults, lda_xc_tih_vxc_required, params)
    v = lda_variables(rho, Val(3))
    return lda_xc_tih_potential(v.rs, v.z)
end

export lda_xc_tih_vxc, lda_xc_tih_vxc_defaults, lda_xc_tih_vxc_required
