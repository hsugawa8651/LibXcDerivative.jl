# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

@testset "Zygote differentiates NaNMath.sqrt and the kernels that use it" begin
    # NaNMath.sqrt calls the LLVM intrinsic directly for Float64
    # (NaNMath.jl 1.1.4, NaNMath/src/NaNMath.jl:60), which Zygote cannot
    # see through, and ChainRules has no rules for NaNMath. Generated
    # kernels take every square root through it, 307 calls, so without
    # the rules the extension defines a gradient of one of them stops
    # with "Non-differentiable function Core.Intrinsics.sqrt_llvm", while
    # ForwardDiff, which has DiffRules' NaNMath rules, returns a number.
    for x in (0.3, 4.0)
        @test only(Zygote.gradient(NaNMath.sqrt, x)) ≈ 1 / (2 * sqrt(x)) rtol=1e-15
    end
    @test isnan(only(Zygote.gradient(NaNMath.sqrt, -1.0)))

    # Whole kernels, against ForwardDiff: two that go through it, one
    # (gga_x_pbe) that never touches NaNMath.sqrt, and lda_c_pk09 for
    # xc_atanh.
    for f in (r -> lda_c_pw(r), r -> lda_c_pk09(r),
              r -> gga_c_pbe(r, 0.1r), r -> gga_x_pbe(r, 0.1r))
        for r in (0.05, 0.5)
            @test only(Zygote.gradient(f, r)) ≈ ForwardDiff.derivative(f, r) rtol=1e-12
        end
    end
end

@testset "a zero cotangent stays zero through NaNMath.sqrt" begin
    # Written to the contract NaNMath's own rules would have, so that
    # dropping this extension changes no number: a zero (co)tangent stays
    # zero where the derivative is Inf (x = 0) or NaN (x < 0), and
    # x = -0.0 differentiates to +Inf rather than -Inf.
    #
    # A plain Δ / 2y would give 0/0 = NaN for a zero cotangent, where
    # ChainRules asks for zero: a zero cotangent is an output the loss
    # does not depend on.
    #
    # Measured, so as not to claim more than this does: a kernel
    # differentiated at sigma = 0 comes back NaN with these rules and
    # without them, from a 0 * Inf formed at another node, and ForwardDiff
    # returns NaN there too. What they fix is the rule's own contract.
    for x in (0.0, -0.0)
        y, ∂ = frule((NoTangent(), 1.0), NaNMath.sqrt, x)
        @test y == x
        @test ∂ == Inf
        @test last(frule((NoTangent(), 0.0), NaNMath.sqrt, x)) === 0.0
        _, pullback = rrule(NaNMath.sqrt, x)
        @test pullback(1.0)[2] == Inf
        @test pullback(0.0)[2] === 0.0
        @test iszero(pullback(ZeroTangent())[2])
    end
    # Below zero the value is NaN and so is the derivative, but a zero
    # cotangent is still zero: nothing flowed back along that path.
    @test isnan(last(frule((NoTangent(), 1.0), NaNMath.sqrt, -1.0)))
    @test last(frule((NoTangent(), 0.0), NaNMath.sqrt, -1.0)) === 0.0
    _, negative_pullback = rrule(NaNMath.sqrt, -1.0)
    @test isnan(negative_pullback(1.0)[2])
    @test negative_pullback(0.0)[2] === 0.0
    # Away from the edge nothing changes, and the first argument is the
    # function, which has no tangent.
    _, ordinary = rrule(NaNMath.sqrt, 4.0)
    @test ordinary(1.0)[1] === NoTangent()
    @test ordinary(1.0)[2] === 0.25
    @test last(frule((NoTangent(), 1.0f0), NaNMath.sqrt, 4.0f0)) === 0.25f0
end

@testset "LambertW solves w exp(w) = z, and differentiates" begin
    # The references are from the pinned 7.1.2 build (2026-09-20), which
    # ports Rickard Armiento's Fortran
    # (libxc-upstream/src/special_functions.c:20).
    refs = ((-0.3140862435046707, -0.5377777364075198),   # sqrt/Taylor switch
            (-0.1, -0.11183255915896298),
            (-1e-6, -1.0000010000015e-6),                 # series branch
            (-1e-8, -1.0000000100000002e-8),
            (0.0, 0.0),
            (0.5, 0.35173371124919584),
            (1.149876485041417, 0.6191164424581125),      # Taylor/log switch
            (2.0, 0.8526055020137255),
            (10.0, 1.7455280027406994),
            (1e3, 5.249602852401596),
            (1e10, 20.028685413304952))
    for (z, ref) in refs
        @test LambertW(z) ≈ ref rtol=1e-14
    end
    # The defining relation, which the references above cannot be wrong
    # about together.
    for z in (-0.3, -0.05, 0.2, 3.0, 1e6)
        w = LambertW(z)
        @test w * exp(w) ≈ z rtol=1e-13
    end

    # At the branch point W = -1, and libxc answers -1 for the few
    # floating-point steps below it as well (special_functions.c:27).
    @test LambertW(-1 / MathConstants.e) == -1.0
    @test LambertW(-1 / MathConstants.e - 5eps()) == -1.0
    # Further out the function is undefined. libxc prints and calls
    # abort(); NaN is what the generated kernels need, since ifelse
    # evaluates the branch it discards (see xc_log1p).
    @test isnan(LambertW(-0.4))
    @test isnan(LambertW(-1.0))

    @test (@inferred LambertW(0.5)) isa Float64

    # W'(z) = W / (z (1 + W)) away from zero, and 1 at zero.
    for z in (-0.3, -0.05, 0.2, 3.0, 1e6)
        w = LambertW(z)
        @test ForwardDiff.derivative(LambertW, z) ≈ w / (z * (1 + w)) rtol=1e-10
        @test only(Zygote.gradient(LambertW, z)) ≈ w / (z * (1 + w)) rtol=1e-10
    end
    @test ForwardDiff.derivative(LambertW, 0.0) ≈ 1.0 rtol=1e-10
end

@testset "xc_dilogarithm matches the pinned libxc on every branch" begin
    # References from the pinned 7.1.2 build (2026-09-20). The points
    # cover all six branches of
    # libxc-upstream/src/special_functions.c:181, including the ones
    # that only differ past FLT_RADIX/DBL_EPSILON ~ 9e15.
    refs = ((-1e17, -767.7692110309767),
            (-1e3, -25.502475813889966),
            (-1.0, -0.8224670334241131),
            (-0.9, -0.7521631792172616),
            (-0.5, -0.4484142069236462),
            (-0.1, -0.09760523522932159),
            (0.0, 0.0),
            (0.25, 0.2676526390827326),
            (0.5, 0.5822405264650126),
            (0.75, 0.978469392930306),
            (1.0, 1.6449340668482264),
            (1.5, 2.3743952702724798),
            (2.0, 2.4674011002723395),
            (3.0, 2.320180423313098),
            (1e3, -20.56967361356751),
            (1e17, -762.834408830432))
    for (x, ref) in refs
        @test xc_dilogarithm(x) ≈ ref rtol=1e-14
    end

    # Closed forms, which the references cannot all be wrong about
    # together: Li2(1), Li2(-1), and Li2(1/2).
    @test xc_dilogarithm(1.0) ≈ pi^2 / 6 rtol=1e-15
    @test xc_dilogarithm(-1.0) ≈ -pi^2 / 12 rtol=1e-15
    @test xc_dilogarithm(0.5) ≈ pi^2 / 12 - log(2)^2 / 2 rtol=1e-15

    @test (@inferred xc_dilogarithm(0.25)) isa Float64

    # Li2'(x) = -log(1 - x)/x, which is what libxc_codegen emits for it
    # (libxc_codegen.xc_dilogarithm.fdiff). Only below 1: past that the
    # logarithm turns complex and the real branch keeps just its real
    # part. gga_x_gg99 evaluates at -exp(-2r), so the negative side is
    # the one that matters anyway.
    for x in (-0.9, -0.5, -0.1, 0.25, 0.75)
        d = -log1p(-x) / x
        @test ForwardDiff.derivative(xc_dilogarithm, x) ≈ d rtol=1e-9
        @test only(Zygote.gradient(xc_dilogarithm, x)) ≈ d rtol=1e-9
    end
    @test ForwardDiff.derivative(xc_dilogarithm, 0.0) ≈ 1.0 rtol=1e-9
end

@testset "xc_E1_scaled matches the pinned libxc on every branch" begin
    # exp(x) E1(x), which stays finite where exp(x), and E1(x) separately
    # overflow and underflow. References from the pinned 7.1.2 build
    # (2026-09-20); the points cover all six Chebyshev ranges of
    # libxc-upstream/src/expint_e1.c:85, on both sides of the origin.
    refs = ((-20.0, -0.05279779527964813),
            (-10.0, -0.1131470204734108),
            (-6.0, -0.2131473100815936),
            (-4.0, -0.3595520078636207),
            (-2.0, -0.6704827097900734),
            (-1.0, -0.6971748832350662),
            (-0.5, -0.2754982985512703),
            (1e-3, 6.337874070325488),
            (0.5, 0.9229106324837305),
            (1.0, 0.5963473623231941),
            (2.0, 0.3613286168882226),
            (4.0, 0.2063456499010558),
            (10.0, 0.09156333393978809),
            (100.0, 0.00990194228673302),
            (800.0, 0.0012484413916743504),
            (1e5, 9.999900001999939e-6))
    for (x, ref) in refs
        @test xc_E1_scaled(x) ≈ ref rtol=1e-13
    end

    # Far out the scaled function decays like 1/x, where forming exp(x)
    # on its own would have overflowed long before.
    @test xc_E1_scaled(1e5) ≈ 1e-5 rtol=1e-4
    # E1 diverges at the origin. libxc prints there and returns 0.0;
    # the limit is what this returns instead.
    @test xc_E1_scaled(0.0) == Inf

    @test (@inferred xc_E1_scaled(0.5)) isa Float64

    # d/dx [exp(x) E1(x)] = exp(x) E1(x) - 1/x, the derivative
    # libxc_codegen gives it (python/libxc_codegen.py:801).
    for x in (-2.0, -0.5, 0.5, 5.0, 50.0)
        d = xc_E1_scaled(x) - 1 / x
        @test ForwardDiff.derivative(xc_E1_scaled, x) ≈ d rtol=1e-9
        @test only(Zygote.gradient(xc_E1_scaled, x)) ≈ d rtol=1e-9
    end
end

@testset "xc_erfcx is the scaled complementary error function" begin
    # exp(x^2) * erfc(x), which Libxc gives a name of its own
    # (libxc-upstream/src/faddeeva.c, Steven G. Johnson's port of
    # Faddeeva) because the two factors overflow and underflow long
    # before their product does. gga_x_wpbeh is what needs it: the
    # omega-PBE exchange hole is built out of it, and the kernel cannot
    # be printed without it.
    #
    # A pass-through to SpecialFunctions.erfcx, which this package
    # already depends on for erf and erfc.

    # Values against a reference computed at higher precision, which is
    # independent of the Float64 implementation rather than a restatement
    # of it.
    for x in (-3.0, -1.0, -0.25, 0.0, 0.25, 1.0, 3.0, 12.0, 30.0)
        ref = Float64(exp(big(x)^2) * SpecialFunctions.erfc(big(x)))
        @test xc_erfcx(x) ≈ ref rtol=1e-15
    end
    @test xc_erfcx(0.0) == 1.0

    # Why the name exists. At x = 30 the naive form is exp(900) * 0,
    # which is Inf * 0 = NaN, while the function it stands for is
    # perfectly ordinary there and decays like 1/(x*sqrt(pi)).
    @test isnan(exp(30.0^2) * SpecialFunctions.erfc(30.0))
    @test xc_erfcx(30.0) ≈ 0.018795888861416754 rtol=1e-14
    @test xc_erfcx(30.0) ≈ 1 / (30 * sqrt(pi)) rtol=1e-3

    # The derivative, which libxc_codegen declares as
    # 2*y*xc_erfcx(y) - 2/sqrt(pi) (its xc_erfcx.fdiff, via
    # _ERFCX_DERIV). Both AD systems reproduce it: in Float64 they agree
    # with that expression to the last bit, since SpecialFunctions
    # differentiates by it as well.
    f64_rule(x) = 2x * xc_erfcx(x) - 2 / sqrt(pi)
    for x in (-2.0, -0.5, 0.0, 0.5, 2.0, 8.0, 30.0)
        @test ForwardDiff.derivative(xc_erfcx, x) == f64_rule(x)
        @test only(Zygote.gradient(xc_erfcx, x)) == f64_rule(x)
    end

    # Against higher precision, which is a different question, the rule
    # loses digits at large x, and that is the expression's doing, not
    # the implementation's. Its two terms are 2x*erfcx(x) -> 2/sqrt(pi),
    # and 2/sqrt(pi), so they cancel: the larger term is 131 times the
    # answer at x = 8 and 1803 times it at x = 30, and the error tracks
    # that ratio times eps rather than staying at eps.
    #
    # This is why Libxc ships hand-written derivatives for this function
    # and calls them cancellation-free (xc_erfcx_jet,
    # libxc-upstream/src/util.h:393). A caller differentiating through
    # xc_erfcx at large argument gets the naive rule and should know it;
    # the gate here is that the loss is bounded by the cancellation and
    # no worse.
    for x in (0.5, 2.0, 4.0, 8.0, 30.0)
        exact = 2 * big(x) * exp(big(x)^2) * erfc(big(x)) - 2 / sqrt(big(pi))
        cancellation = max(abs(2x * xc_erfcx(x)), 2 / sqrt(pi)) / abs(Float64(exact))
        relative = abs((ForwardDiff.derivative(xc_erfcx, x) - exact) / exact)
        @test relative < 4 * cancellation * eps(Float64)
    end
    # Where nothing cancels, the full precision is there.
    @test ForwardDiff.derivative(xc_erfcx, 0.0) ≈ -2 / sqrt(pi) rtol=1e-16
    # The second order is right too, at an argument where the first
    # order does not already cancel.
    let x = 0.75
        second = Float64(2 * exp(big(x)^2) * erfc(big(x)) +
                         2 * big(x) * (2 * big(x) * exp(big(x)^2) * erfc(big(x)) -
                                       2 / sqrt(big(pi))))
        @test ForwardDiff.derivative(y -> ForwardDiff.derivative(xc_erfcx, y), x) ≈
              second rtol=1e-13
    end

    @test (@inferred xc_erfcx(0.5)) isa Float64
end

@testset "NaNMath returns NaN where Base throws" begin
    @test isnan(NaNMath.sqrt(-1.0))
    @test isnan(NaNMath.log(-1.0))
    @test isnan(NaNMath.pow(-1.0, 1.5))
    # The three cases above all throw through Base.
    @test_throws DomainError sqrt(-1.0)
    @test_throws DomainError log(-1.0)
    @test_throws DomainError (-1.0)^1.5
end
