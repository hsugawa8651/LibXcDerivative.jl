# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

@testset "br89_x inverts Becke-Roussel's equation, and differentiates" begin
    # x(Q) solves x*exp(-2x/3) = rhs*(x - 2) with rhs = (2/3)*pi^(2/3)/Q,
    # which Libxc gets from Brent's method (xc_mgga_x_br89_get_x,
    # src/mgga_x_br89.c:49). References from the pinned 7.1.2 build
    # (2026-10-06), spanning both brackets: Q < 0 puts the root below 2
    # and Q > 0 above it.
    refs = ((-10.0, 0.29685329933267046),
            (-1.0, 1.6151991380209472),
            (-0.1, 1.962911639826339),
            (-1e-6, 1.9999996313377038),
            (0.0, 2.0),                      # the degenerate case C returns flat
            (1e-13, 2.0000000000000373),     # inside the tolerance C tests against
            (1e-6, 2.00000036866225),
            (0.1, 2.0366357367111183),
            (1.0, 2.343561005633382),
            (10.0, 3.968875696706638),
            (100.0, 6.885906023124722))
    for (Q, x) in refs
        @test br89_x(Q) ≈ x rtol=1e-12
    end

    # The defining equation itself, which is what says the iteration
    # converged rather than merely returning something near the reference.
    #
    # The tolerance cannot be a constant. The right-hand side forms
    # `x - 2` from an `x` that is near 2, so its own relative error is
    # about eps*|x|/|x - 2|: at Q = 1e-13, where x - 2 is 4e-14, that is
    # a percent, and no solver can do better through this expression.
    # The reference comparison above is the one that pins the value;
    # this one checks the equation to whatever precision subtracting
    # leaves available.
    for (Q, _) in refs
        Q == 0.0 && continue
        x = br89_x(Q)
        rhs = (2 / 3) * cbrt(π)^2 / Q
        tol = max(1e-12, 8 * eps() * abs(x) / abs(x - 2))
        @test x * exp(-2x / 3) ≈ rhs * (x - 2) rtol=tol
    end

    # Libxc declares the derivative analytically rather than leaving it to
    # the solver (the fdiff of class br89_x in
    # python/mgga_exc/mgga_x_br89.py), and differentiating through the
    # iteration has to agree with it.
    dfdx(x) = -(2 / 3) * exp(-2x / 3) * (x^2 - 2x + 3) / (x - 2)^2
    for Q in (-10.0, -1.0, -0.1, 0.1, 1.0, 10.0, 100.0)
        analytic = -(2 / 3) * cbrt(π)^2 / (Q^2 * dfdx(br89_x(Q)))
        @test ForwardDiff.derivative(br89_x, Q) ≈ analytic rtol=1e-7
    end
end

@testset "mbrxc_x inverts the modified Becke-Roussel equation" begin
    # The same shape as br89_x one equation over: x solves
    # (1 + x)^(5/3) * exp(-2x/3) = rhs * (x - 3) with
    # rhs = (32*pi)^(2/3)/(6Q) (xc_mgga_x_mbrxc_get_x,
    # src/mgga_x_mbrxc_bg.c:24). References from the pinned 7.1.2 build
    # (2026-10-06); the lower bracket reaches -1, where (1 + x)^(5/3)
    # vanishes, so the negative side is sampled down to Q = -100.
    refs = ((-100.0, -0.778603526239921),
            (-10.0, 0.060476953413372225),
            (-1.0, 2.5840069078333863),
            (-0.1, 2.961784016660355),
            (0.0, 3.0),
            (1e-13, 3.000000000000038),
            (0.1, 3.037499542262573),
            (1.0, 3.3452209365560464),
            (10.0, 4.978102128135321),
            (100.0, 8.062500584043613),
            (1000.0, 11.544070236553022))
    for (Q, x) in refs
        @test mbrxc_x(Q) ≈ x rtol=1e-12
    end

    for (Q, _) in refs
        Q == 0.0 && continue
        x = mbrxc_x(Q)
        rhs = cbrt(32π)^2 / (6Q)
        tol = max(1e-12, 8 * eps() * abs(x) / abs(x - 3))
        @test (1 + x) * cbrt(1 + x)^2 * exp(-2x / 3) ≈ rhs * (x - 3) rtol=tol
    end

    # Against the derivative Libxc declares (the fdiff of class mbrxc_x
    # in python/mgga_exc/mgga_x_mbrxc_bg.py).
    dfdx(x) = -(2 / 3) * cbrt(1 + x)^2 * exp(-2x / 3) *
              (x^2 - 3x + 6) / (x - 3)^2
    for Q in (-100.0, -10.0, -1.0, -0.1, 0.1, 1.0, 10.0, 100.0)
        analytic = -cbrt(32π)^2 / 6 / (Q^2 * dfdx(mbrxc_x(Q)))
        @test ForwardDiff.derivative(mbrxc_x, Q) ≈ analytic rtol=1e-7
    end
end

@testset "BesselI matches the pinned build at the orders Libxc uses" begin
    # Libxc's own name for the modified Bessel function of the first
    # kind, reached only at orders 0 and 1: its SymPy sources call
    # BesselI(0, .) and BesselI(1, .), which the C path rewrites to
    # xc_bessel_I0 and xc_bessel_I1 (python/mgga_exc/mgga_x_2d_prhg07.py
    # header). References from the pinned 7.1.2 build (2026-10-06), which
    # the standard implementation reproduces to rounding, so this is a
    # pass-through to SpecialFunctions rather than a port.
    refs = ((0.0, 1.0, 0.0),
            (0.5, 1.0634833707413236, 0.2578943053908963),
            (1.0, 1.2660658777520086, 0.565159103992485),
            (3.75, 9.118945860844567, 7.780015229824415),     # series/asymptotic switch
            (10.0, 2815.7166284662544, 2670.9883037012546),
            (50.0, 2.9325537838493355e20, 2.9030785901035563e20))
    for (x, i0, i1) in refs
        @test BesselI(0, x) ≈ i0 rtol=1e-14
        @test BesselI(1, x) ≈ i1 rtol=1e-14
    end

    # I0' = I1, which is what the kernel differentiates through.
    for x in (0.5, 1.0, 3.75)
        @test ForwardDiff.derivative(y -> BesselI(0, y), x) ≈ BesselI(1, x) rtol=1e-12
    end
end

@testset "reduced variables: meta-GGA" begin
    # The kinetic half of the same source (python/libxc_codegen.py:4395-4413).
    # Meta-GGA kernels take nine variables, the five GGA ones followed by
    # the reduced Laplacian u and the reduced kinetic energy density t,
    # both per channel and both over n^(1 + 2/dim): n^(5/3) in three
    # dimensions, against n^(4/3) for the gradient.
    #
    # Unpolarized halves the input as well as the density, exactly as the
    # gradient half does: u0 = (la/2)/(na/2)^exp_kin with Libxc's `na`
    # being the total. Getting that wrong scales every meta-GGA by a
    # constant, which no single-functional comparison would localise.
    ρ, σ, λ, τ = 1.0, 0.5, 0.2, 0.7
    u = mgga_variables(ρ, σ, λ, τ, Val(3))
    @test u.rs ≈ (3 / (4π * ρ))^(1 / 3)
    @test u.z == 0.0
    @test u.xt ≈ sqrt(σ) / ρ^(4 / 3)
    @test u.xs0 ≈ sqrt(σ / 4) / (ρ / 2)^(4 / 3)
    @test u.xs1 == u.xs0
    @test u.u0 ≈ (λ / 2) / (ρ / 2)^(5 / 3)
    @test u.u1 == u.u0
    @test u.t0 ≈ (τ / 2) / (ρ / 2)^(5 / 3)
    @test u.t1 == u.t0

    na, nb, gaa, gab, gbb = 0.3, 0.2, 0.1, 0.05, 0.04
    la, lb, ta, tb = 0.07, 0.03, 0.9, 0.6
    q = mgga_variables(na, nb, gaa, gab, gbb, la, lb, ta, tb, Val(3))
    @test q.rs ≈ (3 / (4π * (na + nb)))^(1 / 3)
    @test q.z ≈ (na - nb) / (na + nb)
    @test q.xt ≈ sqrt(gaa + 2gab + gbb) / (na + nb)^(4 / 3)
    @test q.xs0 ≈ sqrt(gaa) / na^(4 / 3)
    @test q.xs1 ≈ sqrt(gbb) / nb^(4 / 3)
    @test q.u0 ≈ la / na^(5 / 3)
    @test q.u1 ≈ lb / nb^(5 / 3)
    @test q.t0 ≈ ta / na^(5 / 3)
    @test q.t1 ≈ tb / nb^(5 / 3)

    # The two methods agree on the equal-spin case, which is what says
    # they share a convention rather than each being separately
    # plausible. The Laplacian and tau split per channel, so equal spins
    # carry half of each.
    e = mgga_variables(ρ / 2, ρ / 2, σ / 4, σ / 4, σ / 4,
                       λ / 2, λ / 2, τ / 2, τ / 2, Val(3))
    for k in (:rs, :xt, :xs0, :xs1, :u0, :u1, :t0, :t1)
        @test getfield(e, k) ≈ getfield(u, k)
    end
    @test e.z == 0.0

    # The exponent per dimension, pinned to what it claims to be rather
    # than to a rounding of itself.
    for n in (0.05, 1.0, 7.0)
        @test LibXcDerivative._pow_kin(n, Val(3)) ≈ Float64(big(n)^(big(5) / 3)) rtol=1e-15
        @test LibXcDerivative._pow_kin(n, Val(2)) ≈ n^2 rtol=1e-15
        @test LibXcDerivative._pow_kin(n, Val(1)) ≈ n^3 rtol=1e-15
    end

    @test isbits(u)
    @test (@inferred mgga_variables(ρ, σ, λ, τ, Val(3))) isa NamedTuple
    @test (@inferred mgga_variables(na, nb, gaa, gab, gbb,
                                    la, lb, ta, tb, Val(3))) isa NamedTuple

    # The dimension stays explicit here too, for the reason it does
    # elsewhere: a default silently generates 2D functionals with 3D
    # constants.
    @test_throws MethodError mgga_variables(ρ, σ, λ, τ)
    @test_throws MethodError mgga_variables(na, nb, gaa, gab, gbb, la, lb, ta, tb)
end
