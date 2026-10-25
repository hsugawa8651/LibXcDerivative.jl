# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

@testset "xc_log1p and xc_atanh return NaN outside their domain, as in C" begin
    # Libxc defines both as the C library functions (src/util.h:347,349),
    # which return NaN outside the domain. Base's log1p and atanh throw a
    # DomainError there instead. Generated kernels select branches with
    # ifelse, which evaluates the branch it discards too, so a throw
    # there stopped a whole evaluation that Libxc completes.
    @test isnan(xc_log1p(-2.0))
    @test isnan(xc_atanh(1.5))
    @test isnan(xc_atanh(-1.5))
    @test xc_atanh(1.0) == Inf   # the boundary, as C's atanh gives it
    @test isnan(LibXcDerivative.my_piecewise3(true, 0.0, xc_log1p(-2.0))) == false

    # Inside the domain nothing changes.
    for x in (-0.9, -1e-12, 1e-12, 0.3, 5.0)
        @test xc_log1p(x) === log1p(x)
    end
    for x in (-0.99, -0.3, 1e-12, 0.3, 0.99)
        @test xc_atanh(x) === atanh(x)
    end

    # And they still differentiate, first and second order.
    for x in (-0.5, 0.3)
        @test ForwardDiff.derivative(xc_log1p, x) ≈ 1 / (1 + x) rtol=1e-15
        @test ForwardDiff.derivative(xc_atanh, x) ≈ 1 / (1 - x^2) rtol=1e-15
        @test ForwardDiff.derivative(y -> ForwardDiff.derivative(xc_atanh, y), x) ≈
              2x / (1 - x^2)^2 rtol=1e-14
    end
end

@testset "xc_e1_scaled_G stays accurate where its definition cancels" begin
    # 1 - y*xc_E1_scaled(y), which Libxc keeps as a quantity of its own
    # because y*xc_E1_scaled(y) tends to one: far out the difference is all
    # cancellation (e1_scaled_G, maple/util.mpl:41).
    for y in (0.5, 2.0, 10.0, 50.0, 99.0)
        @test xc_e1_scaled_G(y) == 1 - y * xc_E1_scaled(y)
    end
    # Above the crossover the asymptotic series takes over. Just past it the
    # direct form is still accurate, so that is where the two can be compared.
    for y in (100.0, 100.001, 120.0)
        @test xc_e1_scaled_G(y) ≈ 1 - y * xc_E1_scaled(y) rtol=1e-13
    end
    # And this is what the construct is for: at y = 1e17 the direct form has
    # nothing left but rounding, 2.2e-16 where the value is 1e-17.
    @test xc_e1_scaled_G(1e17) ≈ 1e-17 rtol=1e-15
    @test !isapprox(1 - 1e17 * xc_E1_scaled(1e17), 1e-17; rtol=0.5)
    # G' = G - (1-G)/y, which follows from xc_E1_scaled' = xc_E1_scaled - 1/y.
    # The expressions this package ships carry the same rule.
    for y in (0.5, 10.0, 99.0, 150.0)
        g = xc_e1_scaled_G(y)
        @test ForwardDiff.derivative(xc_e1_scaled_G, y) ≈ g - (1 - g) / y rtol=1e-11
    end
    # Far out the derivative is -1/y^2. The identity above cannot be used as
    # the reference there: (1-G)/y equals G to the last bit, so it cancels to
    # zero while the series differentiates cleanly.
    @test ForwardDiff.derivative(xc_e1_scaled_G, 1e17) ≈ -1e-34 rtol=1e-14
    @test (@inferred xc_e1_scaled_G(150.0)) isa Float64
end

@testset "xc_x_minus_log1p keeps full precision where the direct form cancels" begin
    # xc_x_minus_log1p is the one Libxc-renamed function ported here as a
    # real implementation rather than a pass-through (src/util.c:39): at
    # small x, `x - log1p(x)` subtracts two nearly equal quantities to
    # produce a result of order x^2/2, and loses most of its significant
    # digits doing so. This checks the ported Taylor branch actually buys
    # that precision back, against a BigFloat reference: writing
    # `x - log1p(x)` and calling it done would pass a Libxc cross-check at
    # ordinary densities while being badly wrong here.
    exact(x) = Float64(big(x) - log1p(big(x)))

    for x in (1e-10, 1e-8, 1e-6, 1e-3, 0.1, -0.1, -0.2)
        @test xc_x_minus_log1p(x) ≈ exact(x) rtol=1e-15
    end

    # The direct form is genuinely worse in the same regime: without
    # this the test above could pass for a version that never needed the
    # Taylor branch at all. At x=1e-10 the direct form keeps only ~6
    # significant digits (measured, not estimated).
    @test abs((1e-10 - log1p(1e-10)) - exact(1e-10)) / exact(1e-10) > 1e-8
    @test abs(xc_x_minus_log1p(1e-10) - exact(1e-10)) / exact(1e-10) < 1e-15

    # Outside the cancellation regime the two agree, and the |x| = 0.25
    # branch cutoff introduces no visible step: the difference across it
    # is the function's own slope x/(1+x) = 0.2 times the 2e-10 step.
    for x in (0.5, -0.5, 1.0, 10.0)
        @test xc_x_minus_log1p(x) == x - log1p(x)
    end
    @test xc_x_minus_log1p(0.2500000001) - xc_x_minus_log1p(0.2499999999) ≈ 0.2 * 2e-10 rtol=1e-3
end
