# Auto-generated from the Libxc sources
# python/mgga_vxc/mgga_x_2d_prp10.py -- do not edit by hand.
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
# args: rs, z, xt, xs0, xs1, u0, u1, t0, t1, XC_EPSILON
const mgga_x_2d_prp10_potential = function (rs, z, xt, xs0, xs1, u0, u1, t0, t1, XC_EPSILON)
    @inbounds begin
        cse_tmp_0 = 0.3183098861837907
        cse_tmp_1 = xs0 ^ 2 / 8
        cse_tmp_2 = -cse_tmp_1 + t0
        cse_tmp_3 = 8 * XC_EPSILON * (cse_tmp_1 + t0)
        cse_tmp_4 = cse_tmp_0 * (cse_tmp_1 - t0 + u0 / 4)
        1.4142135623730951 * NaNMath.sqrt(z + 1) * ((4 // 3) * cse_tmp_0 * NaNMath.sqrt(my_piecewise3(cse_tmp_2 > cse_tmp_3, cse_tmp_2, cse_tmp_3)) - pi * BesselI(0, LambertW(exp(-1) * my_piecewise3(cse_tmp_4 > -0.9999999999, cse_tmp_4, -0.9999999999)) / 2 + 1 // 2)) / (2 * 1.772453850905516 * rs)
    end
end
export mgga_x_2d_prp10_potential

const mgga_x_2d_prp10_vxc_defaults = (XC_EPSILON = 2.220446049250313e-16,)
const mgga_x_2d_prp10_vxc_required = ()

"""
    mgga_x_2d_prp10_vxc(rho, sigma, lapl, tau)

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
function mgga_x_2d_prp10_vxc(rho, sigma, lapl, tau; params = NamedTuple())
    p = resolve_params(mgga_x_2d_prp10_vxc_defaults, mgga_x_2d_prp10_vxc_required, params)
    v = mgga_variables(rho, sigma, lapl, tau, Val(2))
    return mgga_x_2d_prp10_potential(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.XC_EPSILON)
end

export mgga_x_2d_prp10_vxc, mgga_x_2d_prp10_vxc_defaults, mgga_x_2d_prp10_vxc_required

const mgga_x_2d_prhg07_prp10_vxc_defaults = (XC_EPSILON = 2.220446049250313e-16,)
const mgga_x_2d_prhg07_prp10_vxc_required = ()

"""
    mgga_x_2d_prhg07_prp10_vxc(rho, sigma, lapl, tau)

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
function mgga_x_2d_prhg07_prp10_vxc(rho, sigma, lapl, tau; params = NamedTuple())
    p = resolve_params(mgga_x_2d_prhg07_prp10_vxc_defaults, mgga_x_2d_prhg07_prp10_vxc_required, params)
    v = mgga_variables(rho, sigma, lapl, tau, Val(2))
    return mgga_x_2d_prp10_potential(v.rs, v.z, v.xt, v.xs0, v.xs1, v.u0, v.u1, v.t0, v.t1, p.XC_EPSILON)
end

export mgga_x_2d_prhg07_prp10_vxc, mgga_x_2d_prhg07_prp10_vxc_defaults, mgga_x_2d_prhg07_prp10_vxc_required
