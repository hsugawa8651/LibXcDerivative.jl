# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

# Sweeps for the allocation testset in derivatives.jl. They are here, at
# the top level of a file, rather than inside a testset: a closure defined
# in a testset body can box what it captures, and the figure then counts
# the box instead of the call.
#
# Each of them consumes every slot it produces, so that none can be
# eliminated, and reads its inputs from arrays, so that the call cannot be
# constant-folded. The ones that take a functional take it as an argument
# with a type parameter, which forces specialization.
function slot_sweep_lda(f::F, r) where {F}
    acc = 0.0
    for i in eachindex(r)
        v = xc_exc_vxc(f, r[i])
        acc += v.zk + v.vrho
    end
    return acc
end
function slot_sweep_gga(f::F, r, s) where {F}
    acc = 0.0
    for i in eachindex(r)
        v = xc_exc_vxc(f, r[i], s[i])
        acc += v.zk + v.vrho + v.vsigma
    end
    return acc
end
function slot_sweep_gga_spin(f::F, r, s) where {F}
    acc = 0.0
    for i in eachindex(r)
        v = xc_exc_vxc(f, (0.6 * r[i], 0.4 * r[i]),
                       (s[i], 0.5 * s[i], 0.25 * s[i]))
        acc += v.zk + v.vrho[1] + v.vrho[2] +
               v.vsigma[1] + v.vsigma[2] + v.vsigma[3]
    end
    return acc
end
# The clamp on its own, and the table lookup it ends in, for the same
# reason: both are on the meta-GGA path, and both allocate unless the
# functional reaches them as a type parameter.
function clamp_sweep(f::F, r, s, l, t) where {F}
    acc = 0.0
    for i in eachindex(r)
        cr, cs, cl, ct = libxc_clamp(f, r[i], s[i], l[i], t[i])
        acc += cr + cs + cl + ct
    end
    return acc
end
function facts_sweep(name::Symbol, n)
    acc = 0
    for _ in 1:n
        acc += LibXcDerivative.needs_tau(name) ? 1 : 0
    end
    return acc
end
function slot_sweep_mgga(f::F, r, s, l, t; enforce_fhc::Bool=true) where {F}
    acc = 0.0
    for i in eachindex(r)
        v = xc_exc_vxc(f, r[i], s[i], l[i], t[i]; enforce_fhc)
        acc += v.zk + v.vrho + v.vsigma + v.vlapl + v.vtau
    end
    return acc
end
function slot_sweep_mgga_spin(f::F, r, s, l, t; enforce_fhc::Bool=true) where {F}
    acc = 0.0
    for i in eachindex(r)
        v = xc_exc_vxc(f, (0.6 * r[i], 0.4 * r[i]),
                       (s[i], 0.5 * s[i], 0.25 * s[i]),
                       (0.6 * l[i], 0.4 * l[i]), (0.6 * t[i], 0.4 * t[i]);
                       enforce_fhc)
        acc += v.zk + v.vrho[1] + v.vrho[2] +
               v.vsigma[1] + v.vsigma[2] + v.vsigma[3] +
               v.vlapl[1] + v.vlapl[2] + v.vtau[1] + v.vtau[2]
    end
    return acc
end

@testset "the densities the sweeps use are physical" begin
    # Every comparison below feeds a meta-GGA sigma = 0.1 rho and
    # tau = 0.3 rho. Those are not independent: any real density has
    # tau >= sigma / (8 rho), the von Weizsäcker bound, so this shape is
    # physical only for rho >= 0.1 / (8 * 0.3) = 0.0417.
    #
    # Below it the two part company, measured on mgga_c_rregtm exactly at
    # the bound. The cause is not SCAN's alpha clamp: that one is in the
    # Maple source (mgga_x_scan.mpl:32, m_max on the cutoff), so it is in
    # the kernel here too. What Libxc does and this does not is clamp the
    # input
    # before the kernel sees it, sigma <- min(sigma, 8 rho tau) in
    # work_mgga_inc.c:59-78, which is why the parting shows on
    # hyb_mgga_x_bmk and hyb_mgga_x_cf22d as well, neither of them SCAN.
    # libxc_clamp is that rule, and the slot functions apply it; the
    # kernels compared below are the expression itself and do not, so the
    # sweeps must stay above the bound, and rho = 0.05 is only 20 %
    # clear. This is the guard that fails if someone lowers it.
    for rho in (0.05, 0.5, 5.0)
        sigma, tau = 0.1rho, 0.3rho
        @test tau >= sigma / (8 * rho)
    end
    # And the bound is where it is said to be: just below, it fails.
    let rho = 0.04, sigma = 0.1rho, tau = 0.3rho
        @test tau < sigma / (8 * rho)
    end
end
