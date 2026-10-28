# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

@testset "gga_c_ft97 keeps its high derivatives finite on the E1 tail" begin
    # Far out on the tail Libxc replaces 1 - y*xc_E1_scaled(y) by its
    # asymptotic series in 1/y, because there the value and every derivative
    # of the direct form are built by cancellation (e1_scaled_G,
    # maple/util.mpl:43). Upstream writes the series as factorial(k)/y^k and
    # then differentiates it symbolically, so its C never forms y^k. Here the
    # expression is differentiated at run time and the quotient rule squares
    # the denominator: at rho = 0.05 the argument is 1.7e17, (y^9)^2 is
    # 1.2e310, and the overflow turned every third- and fourth-order slot
    # into NaN while Libxc returned a number. The same chain in BigFloat is
    # finite and agrees with Libxc to 7e-16, which puts the fault in the
    # Float64 grouping rather than in the expression.
    d(f) = x -> ForwardDiff.derivative(f, x)
    e(r, s) = r * gga_c_ft97(r, s)
    for (rho, sigma) in ((0.05, 0.005), (0.5, 0.05), (5.0, 0.5))
        f64 = r -> e(r, sigma)
        fbig = r -> e(r, big(sigma))
        for order in 0:4
            if order > 0
                f64 = d(f64)
                fbig = d(fbig)
            end
            got = f64(rho)
            want = setprecision(() -> fbig(big(rho)), BigFloat, 256)
            @test isfinite(got)
            @test got ≈ Float64(want) rtol=1e-12
        end
    end
end

@testset "erfc resolves, and differentiates" begin
    # Qualified, because this package does not export erfc: it is
    # SpecialFunctions', and re-exporting it put a name into a caller's
    # scope that this package neither defines nor documents. The kernels
    # call it by its bare name and resolve it inside the module.
    #
    # erfc is SymPy's own name, passed through by libxc_codegen and used by
    # gga_c_lypr.
    @test SpecialFunctions.erfc(0.5) ≈ 0.4795001221869535 rtol=1e-15
    @test ForwardDiff.derivative(SpecialFunctions.erfc, 0.5) ≈
          -2 / sqrt(pi) * exp(-0.25) rtol=1e-14
end

@testset "gga_x_pbe_energy matches Libxc.jl reference (unpolarized + polarized)" begin
    kappa, mu = 0.8040, 0.2195149727645171
    dens_threshold = zeta_threshold = 1e-15
    mine(rs, z, xt, xs0, xs1) = LibXcDerivative.gga_x_pbe_energy(
        rs, z, xt, xs0, xs1, dens_threshold, kappa, mu, zeta_threshold)

    fun1 = Libxc.Functional(:gga_x_pbe; n_spin=1)
    for (ρ, σ) in ((0.1, 0.01), (0.5, 0.05), (1.0, 0.2), (0.05, 0.001))
        v = gga_variables(ρ, σ, Val(3))
        rs, xt, xs0 = v.rs, v.xt, v.xs0
        ref = only(Libxc.evaluate(fun1; rho=reshape([ρ], 1, 1),
                                   sigma=reshape([σ], 1, 1), derivatives=0:0).zk)
        @test mine(rs, 0.0, xt, xs0, xs0) ≈ ref atol=1e-12
    end

    fun2 = Libxc.Functional(:gga_x_pbe; n_spin=2)
    for (na, nb, gaa, gab, gbb) in ((0.06, 0.04, 0.01, 0.002, 0.008),
                                    (0.3, 0.2, 0.05, 0.01, 0.03))
        v = gga_variables(na, nb, gaa, gab, gbb, Val(3))
        rs, z, xt, xs0, xs1 = v.rs, v.z, v.xt, v.xs0, v.xs1
        ref = only(Libxc.evaluate(fun2; rho=reshape([na, nb], 2, 1),
                                   sigma=reshape([gaa, gab, gbb], 3, 1), derivatives=0:0).zk)
        @test mine(rs, z, xt, xs0, xs1) ≈ ref atol=1e-12
    end
end

@testset "gga_x_pbe_energy type stability and differentiability" begin
    kappa, mu = 0.8040, 0.2195149727645171
    f(rs, z, xt, xs0, xs1) = LibXcDerivative.gga_x_pbe_energy(
        rs, z, xt, xs0, xs1, 1e-15, kappa, mu, 1e-15)
    args = (1.0, 0.1, 0.3, 0.25, 0.2)
    @test (@inferred f(args...)) isa Float64
    d_ad = ForwardDiff.derivative(r -> f(r, args[2:end]...), args[1])
    h = 1e-6
    d_fd = (f(args[1] + h, args[2:end]...) - f(args[1] - h, args[2:end]...)) / 2h
    @test d_ad ≈ d_fd rtol=1e-5
end

# gga_x_pbepow is the test case for the eager-evaluation question that
# my_piecewise3/5 raises: both branches are evaluated, so a branch that is
# numerically unstable or domain-restricted at the other branch's values
# could misbehave even though its result is discarded. Its own comments
# flag exactly this: `pbepow_f0_large` is "unstable... for small s",
# and the piecewise wrapping it clamps that branch's argument via
# `m_max(s2, pbepow_s2_cut)` so it never actually sees a small s2, even
# though ifelse evaluates it regardless of which branch is selected.
# `m_min`/`m_max` are themselves just `my_piecewise3` under the hood
# (`python/libxc_codegen.py:427-432`, `m_min(x1,x2) = my_piecewise3(Gt(x1,x2),
# x2,x1)`), so no new Julia registration should be needed: deep_inline
# flattens them into ordinary my_piecewise3 calls like everything else.
#
# Scope, precisely: `pbepow_f0_large`'s
# "instability" for small s2 is a *precision-loss* concern (as s2 -> 0+,
# kappa/(m*mu*s2) -> +Inf, xc_log1p(+Inf) = +Inf, xc_expm1(-Inf) = -1:
# a well-defined finite limit in plain IEEE double arithmetic, not a
# DomainError/NaN). This test therefore demonstrates the clamp-before-
# call pattern survives translation for that (milder) failure mode, at
# points spanning and landing exactly on the s2_cut=1 boundary. It does
# NOT demonstrate safety for the sharper form of the same concern: an
# unclamped `sqrt`/`log` of a possibly-*negative* quantity in an
# unselected branch, which would throw a DomainError in Julia regardless
# of what value the selected branch settles on. No functional here
# exercises that.
@testset "gga_x_pbepow_energy matches Libxc.jl reference, incl. exactly at s2_cut" begin
    dens_threshold = zeta_threshold = 1e-15
    mine(rs, z, xt, xs0, xs1) = LibXcDerivative.gga_x_pbepow_energy(
        rs, z, xt, xs0, xs1, dens_threshold, zeta_threshold)

    # s2 = X2S^2 * xs0^2 is the argument my_piecewise3 branches on
    # (pbepow_s2_cut = 1); X2S = (1/2)*(6*pi^2)^(-1/3)
    # (python/libxc_codegen.py:92). Solving xs0(rho, sigma)'s own definition
    # for the sigma that lands exactly on s2 = 1, rather than a
    # hand-picked round sigma value that only approximately brackets it.
    X2S = (1 / 2) * (6π^2)^(-1 / 3)
    ρ0 = 0.1
    xs0_at_cut = 1 / X2S
    σ_at_cut = 4 * ((ρ0 / 2)^(4 / 3) * xs0_at_cut)^2

    fun1 = Libxc.Functional(:gga_x_pbepow; n_spin=1)
    # sigma chosen to sweep s2 = X2S^2 * xs0^2 across, exactly on, and
    # far from the s2_cut=1 branch boundary (not just "some reasonable
    # gradient" as gga_x_pbe's test did): this is precisely where
    # the clamping this test exists to check would matter if it were
    # missing or wrong.
    for (ρ, σ) in ((0.1, 0.01), (0.1, 1.0), (0.1, 5.0), (0.1, 50.0), (0.1, 1e-8),
                   (ρ0, σ_at_cut))
        v = gga_variables(ρ, σ, Val(3))
        rs, xt, xs0 = v.rs, v.xt, v.xs0
        ref = only(Libxc.evaluate(fun1; rho=reshape([ρ], 1, 1),
                                   sigma=reshape([σ], 1, 1), derivatives=0:0).zk)
        @test mine(rs, 0.0, xt, xs0, xs0) ≈ ref atol=1e-10
    end
end

@testset "gga_x_pbepow_energy type stability and differentiability" begin
    dens_threshold = zeta_threshold = 1e-15
    f(rs, z, xt, xs0, xs1) = LibXcDerivative.gga_x_pbepow_energy(
        rs, z, xt, xs0, xs1, dens_threshold, zeta_threshold)
    args = (1.0, 0.1, 0.3, 0.25, 0.2)
    @test (@inferred f(args...)) isa Float64
    d_ad = ForwardDiff.derivative(r -> f(r, args[2:end]...), args[1])
    h = 1e-6
    d_fd = (f(args[1] + h, args[2:end]...) - f(args[1] - h, args[2:end]...)) / 2h
    @test d_ad ≈ d_fd rtol=1e-5
end

@testset "reduced variables: GGA" begin
    # Same source, the gradient half (python/libxc_codegen.py:4376-4389):
    # unpolarized xt = sqrt(gaa)/na^(4/3) with xs0 = xs1 =
    # sqrt(gaa/4)/(na/2)^(4/3); polarized xt = sqrt(gaa + 2gab + gbb)
    # over n_tot^(4/3), xs0 = sqrt(gaa)/na^(4/3), xs1 = sqrt(gbb)/nb^(4/3).
    ρ, σ = 1.0, 0.5
    u = gga_variables(ρ, σ, Val(3))
    @test u.rs ≈ (3 / (4π * ρ))^(1 / 3)
    @test u.z == 0.0
    @test u.xt ≈ sqrt(σ) / ρ^(4 / 3)
    @test u.xs0 ≈ sqrt(σ / 4) / (ρ / 2)^(4 / 3)
    @test u.xs1 == u.xs0

    na, nb, gaa, gab, gbb = 0.3, 0.2, 0.1, 0.05, 0.04
    q = gga_variables(na, nb, gaa, gab, gbb, Val(3))
    @test q.rs ≈ (3 / (4π * (na + nb)))^(1 / 3)
    @test q.z ≈ (na - nb) / (na + nb)
    @test q.xt ≈ sqrt(gaa + 2gab + gbb) / (na + nb)^(4 / 3)
    @test q.xs0 ≈ sqrt(gaa) / na^(4 / 3)
    @test q.xs1 ≈ sqrt(gbb) / nb^(4 / 3)

    # Again the agreement between the two methods, which for GGA also
    # pins down how sigma splits across channels: equal spins carry
    # gaa = gab = gbb = sigma/4.
    e = gga_variables(ρ / 2, ρ / 2, σ / 4, σ / 4, σ / 4, Val(3))
    @test e.rs ≈ u.rs
    @test e.z == 0.0
    @test e.xt ≈ u.xt
    @test e.xs0 ≈ u.xs0
    @test e.xs1 ≈ u.xs1

    @test isbits(u)
    @test (@inferred gga_variables(ρ, σ, Val(3))) isa NamedTuple
    @test (@inferred gga_variables(na, nb, gaa, gab, gbb, Val(3))) isa NamedTuple
end

@testset "gga_c_wi and gga_c_sg4 follow the corrections made after 7.0.0" begin
    # Libxc 7.1.0 changed both (its ChangeLog.md):
    # GGA_C_WI had typos in its parameter values (#549), and GGA_C_SG4's
    # mu^MGE2 became 0.26 (#584). Libxc.jl vendors 7.0.0 and so returns
    # the old values: for gga_c_wi not even the right sign at low
    # density. The references are from the pinned 7.1.2 build
    # (2026-09-20, sigma = 0.1 rho, unpolarized).
    #
    #   rho    gga_c_wi 7.1.2           7.0.0
    #   0.05   -0.025076155294920178    0.0014603360357727036
    #   0.5    -0.06551757993522471     -0.0063490649987631995
    #   5.0    -0.11382178270895744     -0.011374653274382108
    #
    #   rho    gga_c_sg4 7.1.2          7.0.0
    #   0.05   -0.023842067892297817    -0.02376744136951196
    #   0.5    -0.06426752025393583     -0.06425819850631662
    #   5.0    -0.08488511037915306     -0.08488465995320707
    pinned = Dict(
        :gga_c_wi => (-0.025076155294920178, -0.06551757993522471,
                      -0.11382178270895744),
        :gga_c_sg4 => (-0.023842067892297817, -0.06426752025393583,
                       -0.08488511037915306))
    for (name, refs) in pinned, (ρ, ref) in zip((0.05, 0.5, 5.0), refs)
        f = getfield(LibXcDerivative, name)
        @test f(ρ, 0.1ρ) ≈ ref rtol=1e-13
        # Stops being true if Libxc.jl moves past 7.0.0, at which point
        # the special case these two need here can go.
        old = only(Libxc.evaluate(Libxc.Functional(name); rho=reshape([ρ], 1, 1),
                                  sigma=reshape([0.1ρ], 1, 1),
                                  derivatives=0:0).zk)
        @test !isapprox(f(ρ, 0.1ρ), old; rtol=1e-9)
    end
end

@testset "nothing is exported that this package did not define" begin
    # The export list named erf and erfc, which are SpecialFunctions'. That
    # re-exported them: `using LibXcDerivative` put into the caller's scope a
    # name this package neither defines nor documents as its own, and which
    # then collides with `using SpecialFunctions`. The generated kernels call
    # erf by its bare name, but they resolve it inside this module and never
    # needed it exported.
    #
    # xc_erfcx and BesselI are this package's own names (one-line
    # pass-throughs, but names it owns and documents under Libxc's spelling), so they stay.
    for n in (:erf, :erfc, :erfcx, :besseli, :gamma, :expint)
        @test !(n in names(LibXcDerivative))
    end
    @test :xc_erfcx in names(LibXcDerivative)
    @test :BesselI in names(LibXcDerivative)
    # And a kernel that calls erf still returns a number, which is what the
    # export was not needed for.
    @test gga_x_wpbeh(0.5, 0.3) isa Float64
end
