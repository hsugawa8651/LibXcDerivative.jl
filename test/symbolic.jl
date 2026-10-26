# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

@testset "my_piecewise3 frozen-branch derivative" begin
    # d/dx [x>thr ? x^3 : -x^3], both branches and orders 1-4, cross-checked
    # against the closed-form derivative rather than just a numeric probe.
    f(x, thr) = LibXcDerivative.my_piecewise3(x > thr, x^3, -x^3)
    for (x, thr) in ((2.0, 1.0), (0.5, 1.0))
        sign = x > thr ? 1 : -1
        @test ForwardDiff.derivative(xx -> f(xx, thr), x) ≈ sign * 3x^2
    end
end

@testset "my_piecewise3/5 traced and differentiated symbolically" begin
    # What @register_symbolic and @register_derivative in the Symbolics
    # extension are for, and the only thing in this package that needs
    # Symbolics at all. The frozen-branch test above does not reach them:
    # ForwardDiff goes through the `ifelse` body and never consults a
    # registration. Without the derivative rules a derivative of the
    # registered call comes back zero rather than as an error, which is what
    # the asserts below catch.
    @variables x thr

    # Registered, so a symbolic call resolves to a term; without the
    # registration there is no method for symbolic arguments at all.
    term = LibXcDerivative.my_piecewise3(x > thr, x^3, -x^3)
    @test occursin("my_piecewise3", string(term))

    # The derivative is the frozen-branch rule: each branch's own
    # derivative, selected by the same condition, and the condition itself
    # contributes nothing.
    d = Symbolics.expand_derivatives(Symbolics.Differential(x)(term))
    @test occursin("my_piecewise3", string(d))
    @test isequal(Symbolics.expand_derivatives(Symbolics.Differential(thr)(term)), 0)

    # And the whole path (trace, differentiate, generate, run) gives the
    # closed-form derivative on both branches, which is what says the rule
    # composes through the chain rule rather than merely being present.
    g = eval(Symbolics.build_function(d, x, thr))
    @test g(2.0, 1.0) ≈ 3 * 2.0^2
    @test g(0.5, 1.0) ≈ -3 * 0.5^2

    # The five-argument form, c1 ? t1 : (c2 ? t2 : e), registers three
    # derivatives: the two branch values and the fallthrough. The outer
    # condition has to be the tighter one for all three to be reachable.
    term5 = LibXcDerivative.my_piecewise5(x > 2thr, x^2, x > thr, x^3, -x)
    d5 = Symbolics.expand_derivatives(Symbolics.Differential(x)(term5))
    @test occursin("my_piecewise5", string(d5))
    g5 = eval(Symbolics.build_function(d5, x, thr))
    @test g5(3.0, 1.0) ≈ 2 * 3.0          # x > 2thr: d(x^2)
    @test g5(1.5, 1.0) ≈ 3 * 1.5^2        # thr < x <= 2thr: d(x^3)
    @test g5(0.5, 1.0) ≈ -1.0             # x <= thr: d(-x)
end

@testset "my_piecewise3/5 crash on an unclamped domain-restricted branch (Base.sqrt)" begin
    # x < 0, so the true branch (0.0) is selected and sqrt(x) is
    # discarded, yet it still throws, because both arguments are
    # computed before my_piecewise3/ifelse makes the selection.
    x = -1.0
    @test_throws DomainError LibXcDerivative.my_piecewise3(x < 0, 0.0, sqrt(x))
    # Confirms this is genuinely about eager evaluation, not something
    # specific to my_piecewise3's implementation: bare ifelse crashes
    # identically.
    @test_throws DomainError ifelse(x < 0, 0.0, sqrt(x))

    # my_piecewise5 nests two nested ifelse calls (c1 ? t1 : (c2 ? t2 :
    # e)); c1=true alone selects t1, but the *inner* ifelse(c2, t2, e)
    # is still evaluated as an argument to the outer one, so a
    # domain-restricted `e` crashes even though neither c2 nor e
    # matters to the result actually selected.
    @test_throws DomainError LibXcDerivative.my_piecewise5(true, 0.0, true, 0.0, sqrt(x))
end
