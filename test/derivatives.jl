# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

@testset "the slot functions name Libxc's outputs and keep its convention" begin
    # Libxc hands a caller zk, vrho, vsigma, vlapl, vtau and the second
    # derivatives in arrays, and this package hands back one scalar and
    # leaves the derivatives to the caller's AD. That is the design, but it
    # puts one convention in the caller's hands that is easy to get wrong:
    # Libxc's vrho is the derivative of rho*zk, not of zk, and vsigma is
    # rho times the sigma derivative. These functions state it once.
    #
    # ForwardDiff cannot pass through Libxc.jl at all (evaluate! takes
    # Float64 arrays and a Dual is a MethodError), so naming the slots
    # costs nothing in differentiability here and buys the convention.
    rho, sigma, lapl, tau = 0.5, 0.1, 0.05, 0.3
    fun(name) = Libxc.Functional(Symbol(name))

    # LDA: zk and vrho.
    let s = xc_exc_vxc(lda_x, rho)
        @test keys(s) == (:zk, :vrho)
        r0 = only(Libxc.evaluate(fun("lda_x"); rho=reshape([rho],1,1),
                                 derivatives=0:0).zk)
        r1 = only(Libxc.evaluate(fun("lda_x"); rho=reshape([rho],1,1),
                                 derivatives=1:1).vrho)
        @test agrees_with_libxc(s.zk, r0, "lda_x")
        @test agrees_with_libxc(s.vrho, r1, "lda_x")
    end

    # GGA: and vsigma, which is rho * d(zk)/dsigma and not d(rho*zk)/dsigma.
    let s = xc_exc_vxc(gga_x_pbe, rho, sigma)
        @test keys(s) == (:zk, :vrho, :vsigma)
        kw = (; rho=reshape([rho],1,1), sigma=reshape([sigma],1,1))
        r1 = Libxc.evaluate(fun("gga_x_pbe"); kw..., derivatives=1:1)
        @test agrees_with_libxc(s.zk, only(Libxc.evaluate(fun("gga_x_pbe");
                                 kw..., derivatives=0:0).zk), "gga_x_pbe")
        @test agrees_with_libxc(s.vrho, only(r1.vrho), "gga_x_pbe")
        @test agrees_with_libxc(s.vsigma, only(r1.vsigma), "gga_x_pbe")
    end

    # meta-GGA: all four. mgga_x_scanl is used rather than mgga_x_scan
    # because SCAN does not read the laplacian, so its vlapl is zero on
    # both sides and comparing it would test nothing.
    let s = xc_exc_vxc(mgga_x_scanl, rho, sigma, lapl, tau)
        @test keys(s) == (:zk, :vrho, :vsigma, :vlapl, :vtau)
        kw = (; rho=reshape([rho],1,1), sigma=reshape([sigma],1,1),
                lapl=reshape([lapl],1,1), tau=reshape([tau],1,1))
        r1 = Libxc.evaluate(fun("mgga_x_scanl"); kw..., derivatives=1:1)
        @test agrees_with_libxc(s.zk, only(Libxc.evaluate(fun("mgga_x_scanl");
                                 kw..., derivatives=0:0).zk), "mgga_x_scanl")
        # Libxc.jl leaves out the slots a functional has no dependence
        # on, rather than filling them with zero: mgga_x_scanl is
        # deorbitalized SCAN, which reads the laplacian INSTEAD of tau, so
        # its result has vlapl and no vtau at all.
        @test hasproperty(r1, :vlapl)
        @test !hasproperty(r1, :vtau)
        for slot in (:vrho, :vsigma, :vlapl)
            @test agrees_with_libxc(getfield(s, slot),
                                    only(getproperty(r1, slot)), "mgga_x_scanl")
        end
        @test only(r1.vlapl) != 0
        # This differs from Libxc.jl on purpose. The field set here is
        # fixed per family so the return type does not depend on which
        # variables a particular functional happens to read, and a
        # functional that does not read tau gets vtau = 0: the number
        # Libxc would have put there had it filled the slot. Omitting it
        # instead would make the return type vary functional by functional
        # and cost the type stability this whole API is for.
        @test s.vtau == 0
    end

    # Second derivatives, for the families whose fxc Libxc writes as three
    # outputs and one. The meta-GGA fxc has ten and is not offered.
    let s = xc_fxc(gga_x_pbe, rho, sigma)
        @test keys(s) == (:v2rho2, :v2rhosigma, :v2sigma2)
        kw = (; rho=reshape([rho],1,1), sigma=reshape([sigma],1,1))
        r2 = Libxc.evaluate(fun("gga_x_pbe"); kw..., derivatives=2:2)
        @test agrees_with_libxc(s.v2rho2, only(r2.v2rho2), "gga_x_pbe")
        @test agrees_with_libxc(s.v2rhosigma, only(r2.v2rhosigma), "gga_x_pbe")
        @test agrees_with_libxc(s.v2sigma2, only(r2.v2sigma2), "gga_x_pbe")
    end
    let s = xc_fxc(lda_x, rho)
        @test keys(s) == (:v2rho2,)
        @test agrees_with_libxc(s.v2rho2,
            only(Libxc.evaluate(fun("lda_x"); rho=reshape([rho],1,1),
                                derivatives=2:2).v2rho2), "lda_x")
    end

    # Type-stable and allocation-free: the field set is fixed per method,
    # so there is no Val to pass and no Union to infer. A slot API that
    # cost an allocation a point would not be used on a grid.
    @test (@inferred xc_exc_vxc(gga_x_pbe, rho, sigma)) isa
          NamedTuple{(:zk, :vrho, :vsigma), Tuple{Float64, Float64, Float64}}
    @test (@inferred xc_fxc(gga_x_pbe, rho, sigma)) isa
          NamedTuple{(:v2rho2, :v2rhosigma, :v2sigma2), Tuple{Float64, Float64, Float64}}
    # The meta-GGA methods are the ones to assert this on. Libxc clamps
    # only where tau is read, so these two are the only first- and
    # second-derivative methods that call libxc_clamp, and the clamp binds
    # its results to names of their own rather than assigning them back
    # onto rho, sigma, lapl and tau. Assigning them inside a branch is what
    # Julia boxes: the closures under them would capture a variable whose
    # type is Any, inference would give
    # NamedTuple{..., <:NTuple{5, Any}} rather than a concrete type, and
    # every derivative would run through dynamic dispatch. @inferred is
    # what carries these two, so the isa is loose on purpose.
    @test (@inferred xc_exc_vxc(mgga_x_scan, rho, sigma, lapl, tau)) isa
          NamedTuple{(:zk, :vrho, :vsigma, :vlapl, :vtau), NTuple{5, Float64}}
    @test (@inferred xc_fxc(mgga_x_scan, rho, sigma, lapl, tau)) isa NamedTuple

    # Allocation is asserted, in the testset below rather than here, and
    # the figure is zero in a top-level function and inside a testset
    # alike, as long as the entry point is inlined, which is what that
    # testset pins. What is asserted here is the type stability above,
    # which is what the field set being fixed per method buys.

    # Still differentiable, which the array interface it imitates is not:
    # one more step through vrho is Libxc's v2rho2.
    let d = ForwardDiff.derivative(x -> xc_exc_vxc(gga_x_pbe, x, sigma).vrho, rho)
        kw = (; rho=reshape([rho],1,1), sigma=reshape([sigma],1,1))
        @test agrees_with_libxc(d, only(Libxc.evaluate(fun("gga_x_pbe");
                                kw..., derivatives=2:2).v2rho2), "gga_x_pbe")
    end

    # The refusal list is the shipped potential names and nothing else.
    # POTENTIAL_SLOT_NAMES is a tuple of symbols rather than a suffix test
    # so the check costs no allocation, and a hand-written tuple goes stale
    # the moment a potential functional is added, which is what this
    # compares against.
    let shipped = Symbol[]
        root = joinpath(pkgdir(LibXcDerivative), "src", "generated")
        for family in ("lda_vxc", "gga_vxc", "mgga_vxc")
            dir = joinpath(root, family)
            isdir(dir) || continue
            for file in readdir(dir)
                endswith(file, ".jl") || continue
                for line in eachline(joinpath(dir, file))
                    startswith(line, "export ") || continue
                    for name in split(replace(line, "export " => ""), ", ")
                        endswith(strip(name), "_vxc") && push!(shipped, Symbol(strip(name)))
                    end
                end
            end
        end
        @test sort(shipped) == sort(collect(LibXcDerivative.POTENTIAL_SLOT_NAMES))
    end

    # And refused for the potential-only names. Their own value IS vrho,
    # so zk does not exist and d(rho*f)/drho would be a different quantity
    # that no Libxc output corresponds to.
    @test_throws ArgumentError xc_exc_vxc(gga_x_lb_vxc, rho, sigma)
    @test_throws ArgumentError xc_fxc(mgga_x_bj06_vxc, rho, sigma)
end

@testset "the first derivatives come from one pass over the expression" begin
    # Libxc's first-derivative slots are every first derivative of one
    # expression at one point, so a single forward pass carrying one partial
    # per argument produces all of them. What this pins is the number of
    # times the expression is walked, not a time: a time belongs to the
    # machine it was taken on, while the walk count is what the structure
    # decides and is the same everywhere.
    #
    # Pinned with a counting functional rather than a timer. The kernel
    # underneath is the shipped one, so the numbers compared below are the
    # shipped numbers; the wrapper only records how often it is entered.
    #
    # One pass is what the count asserts. A chain per argument walks the
    # expression once per argument instead, which is five walks for the
    # unpolarized meta-GGA path and ten for the polarized one; what the
    # difference costs in time depends on the machine and is not asserted
    # here.
    rho, sigma, lapl, tau = 0.5, 0.1, 0.05, 0.3
    substitute(x, i, v) = ntuple(k -> k == i ? v : x[k], length(x))

    walks = Ref(0)
    counted(args...) = (walks[] += 1; mgga_x_scan(args...))
    # Not a shipped name, so libxc_clamp leaves its arguments alone; at this
    # point the clamp would be inactive anyway, 8*rho*tau = 1.2 against
    # sigma = 0.1. The reference below is therefore the same point.
    @test LibXcDerivative.libxc_clamp(counted, rho, sigma, lapl, tau) ===
          (rho, sigma, lapl, tau)

    # The oracle is the nesting this replaces, written out here: vrho is the
    # derivative of rho*zk and the others are rho times a derivative of zk,
    # which is one chain per argument over g.
    Y = (rho, sigma, lapl, tau)
    g(y) = y[1] * mgga_x_scan(y...)
    refu = ntuple(i -> ForwardDiff.derivative(v -> g(substitute(Y, i, v)), Y[i]), 4)

    walks[] = 0
    s = xc_exc_vxc(counted, rho, sigma, lapl, tau)
    @test walks[] == 1
    @test keys(s) == (:zk, :vrho, :vsigma, :vlapl, :vtau)
    # Not exact equality: taking the same derivatives in one pass reassociates
    # the arithmetic, so the last bits may move. (Across four kernels on
    # 2026-10-23 three agreed bit for bit and mgga_c_m06_l differed by
    # 1.2e-16 relative.)
    @test s.zk ≈ mgga_x_scan(Y...) rtol=1e-14
    @test s.vrho ≈ refu[1] rtol=1e-14
    @test s.vsigma ≈ refu[2] rtol=1e-14
    @test s.vlapl ≈ refu[3] rtol=1e-14
    @test s.vtau ≈ refu[4] rtol=1e-14

    # One pass for the smaller families too, where the counts were three and
    # two: the value and one chain per argument.
    walks[] = 0
    countedg(args...) = (walks[] += 1; gga_x_pbe(args...))
    sg = xc_exc_vxc(countedg, rho, sigma)
    @test walks[] == 1
    @test sg.vrho ≈ ForwardDiff.derivative(x -> x * gga_x_pbe(x, sigma), rho) rtol=1e-14
    @test sg.vsigma ≈ rho * ForwardDiff.derivative(y -> gga_x_pbe(rho, y), sigma) rtol=1e-14

    walks[] = 0
    countedl(args...) = (walks[] += 1; lda_x(args...))
    sl = xc_exc_vxc(countedl, rho)
    @test walks[] == 1
    @test sl.vrho ≈ ForwardDiff.derivative(x -> x * lda_x(x), rho) rtol=1e-14

    # Spin-polarized, where the count was ten. The same substitution gives
    # the reference: position one and two carry the (na + nb) factor, so
    # their chains are the two vrho components, and the rest are the total
    # density times a derivative of zk, which is what vsigma, vlapl and vtau
    # are.
    na, nb = 0.3, 0.2
    gaa, gab, gbb = 0.06, 0.02, 0.04
    la, lb = 0.03, 0.02
    ta, tb = 0.18, 0.12
    X = (na, nb, gaa, gab, gbb, la, lb, ta, tb)
    e(x) = (x[1] + x[2]) * mgga_x_scan(x...)
    refp = ntuple(i -> ForwardDiff.derivative(v -> e(substitute(X, i, v)), X[i]), 9)

    walks[] = 0
    sp = xc_exc_vxc(counted, (na, nb), (gaa, gab, gbb), (la, lb), (ta, tb))
    @test walks[] == 1
    @test keys(sp) == (:zk, :vrho, :vsigma, :vlapl, :vtau)
    @test collect(sp.vrho) ≈ collect(refp[1:2]) rtol=1e-14
    @test collect(sp.vsigma) ≈ collect(refp[3:5]) rtol=1e-14
    @test collect(sp.vlapl) ≈ collect(refp[6:7]) rtol=1e-14
    @test collect(sp.vtau) ≈ collect(refp[8:9]) rtol=1e-14

    # The field set and its types do not move, which is what the grid use in
    # the docstring rests on.
    @test (@inferred xc_exc_vxc(mgga_x_scan, rho, sigma, lapl, tau)) isa
          NamedTuple{(:zk, :vrho, :vsigma, :vlapl, :vtau),
                     NTuple{5, Float64}}
    @test (@inferred xc_exc_vxc(mgga_x_scan, (na, nb), (gaa, gab, gbb),
                                (la, lb), (ta, tb))) isa
          NamedTuple{(:zk, :vrho, :vsigma, :vlapl, :vtau),
                     Tuple{Float64, Tuple{Float64, Float64},
                           Tuple{Float64, Float64, Float64},
                           Tuple{Float64, Float64}, Tuple{Float64, Float64}}}

    # The boundary points, which is where seeding every argument at once
    # couples them. The expression is singular in one of them: at sigma = 0
    # a shared subexpression goes to
    # Inf in the sigma lane and the other lanes come back 0/0 = NaN, which
    # is NaN for vrho where a chain gives -0.781592641797. The entry points fall
    # back to the chains wherever the pass returns anything not finite, so
    # at these points the two must agree exactly, NaN included.
    #
    # Compared at the point the entry point differentiates at, which is the
    # clamped one. At tau = 0 Libxc holds sigma against 8 rho tau and sigma
    # goes to zero, so a chain at the unclamped point is a chain somewhere
    # else: without the clamp, tau = 0 reads as a disagreement of
    # -0.915374 against -0.917590 when each number is right about its own
    # point.
    chain_vrho(h, r, s) = ForwardDiff.derivative(x -> x * h(x, s), r)
    function chain_vrho(h, r, s, l, t)
        r, s, l, t = LibXcDerivative.libxc_clamp(h, r, s, l, t)
        return ForwardDiff.derivative(x -> x * h(x, s, l, t), r)
    end
    for (h, pt) in ((gga_x_pbe, (0.5, 0.0)), (gga_x_pbe, (0.5, 1e-30)),
                    (gga_x_b88, (0.5, 0.0)), (gga_c_pbe, (0.5, 0.0)),
                    (gga_x_wpbeh, (0.5, 0.0)),
                    (mgga_x_scan, (0.5, 0.0, 0.05, 0.3)),
                    (mgga_x_scan, (0.5, 0.1, 0.05, 0.0)),
                    (mgga_x_scan, (0.5, 0.1, 0.0, 0.3)),
                    (mgga_c_m06_l, (0.5, 0.0, 0.05, 0.3)),
                    (mgga_c_m06_l, (0.5, 0.1, 0.05, 0.0)))
        @test isequal(xc_exc_vxc(h, pt...).vrho, chain_vrho(h, pt...))
    end
    # Pinned against the library as well as against our own chain, at the
    # boundary point the one-pass form is singular at.
    @test xc_exc_vxc(mgga_x_scan, 0.5, 0.1, 0.05, 0.0).vrho ≈
          -0.9175897614694103 rtol=1e-12

    # At such a point the fallback is taken, so the expression is walked more
    # than once: the pass, and then the chains. That is what the point costs,
    # and the count says so rather than leaving it to be noticed.
    walks[] = 0
    xc_exc_vxc(counted, 0.5, 0.0, 0.05, 0.3)
    @test walks[] > 1

    # What a sweep over these entry points allocates is asserted in the
    # testset below, which also says why that figure, and not a time, is
    # the one worth pinning.
end

@testset "a sweep over the first-derivative slots allocates nothing" begin
    # Why allocation rather than a time. A time belongs to the machine it
    # was taken on, so a suite cannot assert one; but a sweep over these
    # entry points either touches the heap or it does not, and that is the
    # same answer everywhere. It is also the figure that catches the thing
    # worth catching: the entry point must be small enough for the compiler
    # to inline into the caller's loop, and when it is not, the seeds and
    # the duals stop living in registers and the loop starts allocating.
    #
    # That is not hypothetical. Adding the fallback above pushed these
    # methods over the inliner's threshold, and the gga path went from 193
    # ns and no allocation to 755 ns and 384 bytes a point: the one pass was
    # a loss for the small expressions until the methods were marked
    # `@inline`, after which the same sweep came back at 70 ns and nothing
    # allocated (2026-10-24). Nothing in the suite saw it, because every
    # other test here asks for a value and gets the right one.
    #
    # The bound is zero, not a small number, and it is zero with the clamp
    # in the way as well as without it.
    n = 100
    rho = collect(range(0.05, 5.0, length = n))
    sigma = 0.1 .* rho
    lapl = 0.05 .* rho
    tau = 0.3 .* rho

    # Warmed first: the first call compiles, and a compile allocates.
    slot_sweep_lda(lda_x, rho)
    @test (@allocated slot_sweep_lda(lda_x, rho)) == 0

    slot_sweep_gga(gga_x_pbe, rho, sigma)
    @test (@allocated slot_sweep_gga(gga_x_pbe, rho, sigma)) == 0

    slot_sweep_gga_spin(gga_x_pbe, rho, sigma)
    @test (@allocated slot_sweep_gga_spin(gga_x_pbe, rho, sigma)) == 0

    slot_sweep_mgga(mgga_x_scan, rho, sigma, lapl, tau; enforce_fhc = false)
    @test (@allocated slot_sweep_mgga(mgga_x_scan, rho, sigma, lapl, tau;
                                      enforce_fhc = false)) == 0

    slot_sweep_mgga_spin(mgga_x_scan, rho, sigma, lapl, tau; enforce_fhc = false)
    @test (@allocated slot_sweep_mgga_spin(mgga_x_scan, rho, sigma, lapl, tau;
                                           enforce_fhc = false)) == 0

    # And with the clamp in the way, which it is by default. Zero here
    # needs two things removed together: `libxc_clamp` and the predicate
    # inside it took the functional with no type annotation and never
    # called it, so Julia compiled one generic instance for all functionals
    # and looked the name up at run time, and the table lookup that
    # predicate ended in returned a union of `Nothing` and a struct holding
    # two `Symbol`s, which is not an `isbits` type and is therefore boxed.
    # A type parameter alone took the predicate from 88 to 10 ns a point
    # and kept the box; the lookup alone changed neither figure.
    slot_sweep_mgga(mgga_x_scan, rho, sigma, lapl, tau)
    @test (@allocated slot_sweep_mgga(mgga_x_scan, rho, sigma, lapl, tau)) == 0

    slot_sweep_mgga_spin(mgga_x_scan, rho, sigma, lapl, tau)
    @test (@allocated slot_sweep_mgga_spin(mgga_x_scan, rho, sigma,
                                           lapl, tau)) == 0

    # The clamp called on its own, as a caller of a bare kernel calls it,
    # and the lookup under it.
    clamp_sweep(mgga_x_scan, rho, sigma, lapl, tau)
    @test (@allocated clamp_sweep(mgga_x_scan, rho, sigma, lapl, tau)) == 0

    facts_sweep(:mgga_x_scan, n)
    @test (@allocated facts_sweep(:mgga_x_scan, n)) == 0
end

@testset "xc_kxc and xc_lxc, the third and fourth derivative slots" begin
    # Libxc's C fills these; Libxc.jl does not return them at all, so
    # there is no reference to compare against in this suite and the
    # checks here are of three other kinds: the names and widths against
    # Libxc's own header, an analytic value where one exists, and
    # consistency with the slot below.
    #
    # The names follow a rule rather than a list: for order n, the
    # multisets of (rho, sigma, lapl, tau) in lexicographic order, each
    # variable followed by its multiplicity when that is above one. So
    # v3rho2sigma, v3rhosigmalapl, v4rho2lapltau. The rule is checked
    # against every third- and fourth-order name Libxc declares, which are
    # transcribed here from xc.h of the pinned sources: those sources are
    # not shipped, so the names are copied rather than read.
    declared = Set(["v3lapl2tau", "v3lapl3", "v3lapltau2", "v3rho2lapl", "v3rho2sigma",
                    "v3rho2tau", "v3rho3", "v3rholapl2", "v3rholapltau", "v3rhosigma2",
                    "v3rhosigmalapl", "v3rhosigmatau", "v3rhotau2", "v3sigma2lapl",
                    "v3sigma2tau", "v3sigma3", "v3sigmalapl2", "v3sigmalapltau",
                    "v3sigmatau2", "v3tau3", "v4lapl2tau2", "v4lapl3tau", "v4lapl4",
                    "v4lapltau3", "v4rho2lapl2", "v4rho2lapltau", "v4rho2sigma2",
                    "v4rho2sigmalapl", "v4rho2sigmatau", "v4rho2tau2", "v4rho3lapl",
                    "v4rho3sigma", "v4rho3tau", "v4rho4", "v4rholapl2tau", "v4rholapl3",
                    "v4rholapltau2", "v4rhosigma2lapl", "v4rhosigma2tau", "v4rhosigma3",
                    "v4rhosigmalapl2", "v4rhosigmalapltau", "v4rhosigmatau2", "v4rhotau3",
                    "v4sigma2lapl2", "v4sigma2lapltau", "v4sigma2tau2", "v4sigma3lapl",
                    "v4sigma3tau", "v4sigma4", "v4sigmalapl2tau", "v4sigmalapl3",
                    "v4sigmalapltau2", "v4sigmatau3", "v4tau4"])

    lda = xc_kxc(lda_x, 0.5)
    @test propertynames(lda) == (:v3rho3,)
    gga = xc_kxc(gga_x_pbe, 0.5, 0.3)
    @test propertynames(gga) == (:v3rho3, :v3rho2sigma, :v3rhosigma2, :v3sigma3)
    # The meta-GGA that stands for the family here is the smallest one
    # generated, because what is checked is the field set and not the
    # arithmetic, and the cost of a fourth-order nest is the number of
    # slots times the size of the kernel: 17.0 s on mgga_x_scan, 5.2 s on
    # mgga_c_cs, for the same assertions. The functionals whose numbers
    # are compared against the library keep their own testsets below.
    mgga = xc_kxc(mgga_c_cs, 0.5, 0.05, 0.025, 0.15)
    @test length(propertynames(mgga)) == 20
    lda4 = xc_lxc(lda_x, 0.5)
    @test propertynames(lda4) == (:v4rho4,)
    gga4 = xc_lxc(gga_x_pbe, 0.5, 0.3)
    @test length(propertynames(gga4)) == 5
    mgga4 = xc_lxc(mgga_c_cs, 0.5, 0.05, 0.025, 0.15)
    @test length(propertynames(mgga4)) == 35

    # Every name this package produces is a name Libxc declares.
    for slots in (lda, gga, mgga, lda4, gga4, mgga4)
        for name in propertynames(slots)
            @test string(name) in declared
        end
    end
    # And the first few in Libxc's own order, which is the rule's order.
    @test propertynames(mgga)[1:4] ==
          (:v3rho3, :v3rho2sigma, :v3rho2lapl, :v3rho2tau)

    # An analytic value. Slater exchange is e = c * rho^(4/3) with
    # c = -(3/4)(3/pi)^(1/3), so the third and fourth derivatives of
    # rho*zk are exact: c (4/3)(1/3)(-2/3) rho^(-5/3) and that times
    # (-5/3) rho^(-1).
    let rho = 0.5, c = -(3 / 4) * cbrt(3 / pi)
        third = c * (4 / 3) * (1 / 3) * (-2 / 3) * rho^(-5 / 3)
        fourth = third * (-5 / 3) / rho
        @test xc_kxc(lda_x, rho).v3rho3 ≈ third rtol=1e-12
        @test xc_lxc(lda_x, rho).v4rho4 ≈ fourth rtol=1e-11
    end

    # Consistency with the order below, which is what says the nesting is
    # right rather than merely self-consistent: one more ForwardDiff step
    # through xc_fxc's v2rho2 is v3rho3, and through v3rho3 is v4rho4.
    @test ForwardDiff.derivative(x -> xc_fxc(gga_x_pbe, x, 0.3).v2rho2, 0.5) ≈
          xc_kxc(gga_x_pbe, 0.5, 0.3).v3rho3 rtol=1e-10
    @test ForwardDiff.derivative(x -> xc_kxc(gga_x_pbe, x, 0.3).v3rho3, 0.5) ≈
          xc_lxc(gga_x_pbe, 0.5, 0.3).v4rho4 rtol=1e-9
    # A mixed one too, so that the check is not only about the diagonal.
    @test ForwardDiff.derivative(y -> xc_fxc(gga_x_pbe, 0.5, y).v2rho2, 0.3) ≈
          xc_kxc(gga_x_pbe, 0.5, 0.3).v3rho2sigma rtol=1e-10

    # Mixed partials commute, so a slot must not depend on the order its
    # variables were differentiated in. v3rhosigma2 the other way round.
    g = (x, y) -> x * gga_x_pbe(x, y)
    @test ForwardDiff.derivative(
        x -> ForwardDiff.derivative(
            y -> ForwardDiff.derivative(v -> g(x, v), y), 0.3), 0.5) ≈
          xc_kxc(gga_x_pbe, 0.5, 0.3).v3rhosigma2 rtol=1e-9

    # Refused for the potential-only names, as the lower slots are.
    @test_throws ArgumentError xc_kxc(gga_x_lb_vxc, 0.5, 0.3)
    @test_throws ArgumentError xc_lxc(mgga_x_bj06_vxc, 0.5, 0.05, 0.025, 0.15)

    # Libxc does not provide these for every functional (14 of the 697
    # stop at second order and 21 at third), and that is a fact about
    # Libxc, not a limit here: these come from AD over one expression and
    # answer for any functional that has an energy.
    @test libxc_derivatives(:hyb_gga_xc_hse06) == (0, 1, 2)
    # Not demonstrated on hyb_gga_xc_hse06, which is where that matters
    # most. It holds gga_x_wpbeh, a
    # 158 KiB kernel, and the cost of nesting AD through it climbs
    # steeply: 0.8 s for the value, 3.1 s for the first derivative, 11.9 s
    # for the second and 260 s for the third (2026-10-20), which is more
    # than a suite can carry. The climb is not a fixed ratio either: the
    # third is 21.9x the second where the orders below it are 3.9x
    # apart. The slot functions are
    # shipped for it regardless (a caller who needs HSE06's third
    # derivative gets it in four minutes where Libxc offers nothing at
    # all), but the suite demonstrates the orders on a functional that
    # does not cost minutes.
    @test xc_kxc(gga_c_pbe, 0.5, 0.3).v3rho3 isa Float64
    @test xc_lxc(gga_c_pbe, 0.5, 0.3).v4rho4 isa Float64

    # The field set without an evaluation, which is what slot_names is
    # for: asking the result costs the derivative, and at high order on a
    # large kernel that is minutes.
    @test slot_names(:lda, 3) == (:v3rho3,)
    @test slot_names(:gga, 3) == propertynames(gga)
    @test slot_names(:mgga, 3) == propertynames(mgga)
    @test slot_names(:gga, 4) == propertynames(gga4)
    @test slot_names(:mgga, 4) == propertynames(mgga4)
    @test slot_names(:mgga, 2) == propertynames(
        xc_fxc(mgga_x_scan, 0.5, 0.05, 0.025, 0.15))
    @test slot_names(:gga, 1) == propertynames(xc_exc_vxc(gga_x_pbe, 0.5, 0.3))
    @test slot_names(:mgga, 1) == propertynames(
        xc_exc_vxc(mgga_x_scan, 0.5, 0.05, 0.025, 0.15))
    @test slot_names(:mggal, 4) == slot_names(:mgga, 4)   # same arguments
    @test_throws ArgumentError slot_names(:gga, 5)
    @test_throws ArgumentError slot_names(:not_a_family, 2)
    # Every name it produces for every family and order is a name Libxc
    # declares, and between them they are the whole v3/v4 set. 55 distinct
    # names, not the 66 slots: a GGA's four third-order slots include the
    # LDA's one, and a meta-GGA's twenty include those, so the union over
    # families is the meta-GGA's 20 + 35. Asserted as 66 first, which
    # confused the number of slots with the number of names.
    generated = Set{String}()
    for family in (:lda, :gga, :mgga), order in (3, 4)
        union!(generated, string.(slot_names(family, order)))
    end
    @test generated == declared
    @test length(generated) == 55
    @test length(slot_names(:mgga, 3)) + length(slot_names(:mgga, 4)) == 55
    # And the per-family slot counts, which are what a caller allocates
    # for: 1, 4, 20 at third order and 1, 5, 35 at fourth.
    @test length.(slot_names.((:lda, :gga, :mgga), 3)) == (1, 4, 20)
    @test length.(slot_names.((:lda, :gga, :mgga), 4)) == (1, 5, 35)
end

@testset "xc_lxc answers for a spin-polarized density" begin
    # Fourth derivatives with a spin axis per slot: 495 components for a
    # meta-GGA, 70 for a GGA, 5 for an LDA. The widths and the ordering
    # are the same rule the second and third orders follow, extended:
    # nothing new had to be determined, which is the point of having read
    # the rule off the library rather than tabulating one order at a time.
    na, nb = 0.3, 0.2
    gaa, gab, gbb = 0.12, 0.05, 0.08
    la, lb, ta, tb = 0.02, 0.015, 0.09, 0.06

    lda = xc_lxc(lda_x, (na, nb))
    @test propertynames(lda) == (:v4rho4,)
    @test length(lda.v4rho4) == 5           # C(5,4)

    gga = xc_lxc(gga_c_pbe, (na, nb), (gaa, gab, gbb))
    @test length(propertynames(gga)) == 5
    @test sum(length, gga) == 70
    @test slot_widths(:gga, 4) == (5, 12, 18, 20, 15)

    # The meta-GGA case: 495 components. Evaluating them is 51 s, half of
    # this suite's whole run, and the cost is irreducible: a fourth
    # derivative costs about 0.06 s per component to compile whatever
    # kernel it differentiates, so the smallest meta-GGA generated is
    # already the cheap one. So the default run checks the layout, which
    # is free, and the two numbers that came out of the MAXORDER=4
    # comparison through nested chains written out on the kernel, 0.6 s
    # each; all 495 are evaluated when asked for:
    #
    #   LIBXCDERIVATIVE_TEST_FULL_MGGA_LXC=1 julia --project=test test/runtests.jl
    #
    # What is not given up, because the slots can be asked for one at a
    # time: that every one of the thirty-five has a method, and that the
    # widest of them runs and returns the width slot_widths states. The
    # polarized GGA fourth order above comes out of the same generator,
    # 70 components, and is evaluated whole by default.
    #
    # Evaluating all 495 needs 1860 MB and no measurable time: four
    # megabytes more than libxc's own call for the same numbers.
    @test sum(slot_widths(:mgga, 4)) == 495
    @test maximum(slot_widths(:mgga, 4)) == 24
    @test length(slot_names(:mgga, 4)) == 35
    @test slot_names(:mgga, 4)[1] === :v4rho4
    # hasmethod is true of anything now that each entry point has a varargs
    # method of its own, so what is asserted is where the method a call lands
    # on was defined: the extension, and not that fallback.
    from_extension(f, types) = parentmodule(which(f, types)) !== LibXcDerivative
    @test from_extension(xc_lxc, Tuple{typeof(mgga_c_cs), Tuple{Float64,Float64},
                                       Tuple{Float64,Float64,Float64},
                                       Tuple{Float64,Float64},
                                       Tuple{Float64,Float64}})

    # Every one of the thirty-five has a method of its own, which costs
    # nothing to ask, and the widest is evaluated, which is what ties the
    # layout rule to what the generator emitted at this order. The widest
    # is v4rhosigma2lapl with 24 components: 2 * C(4,2) * 2, a rho
    # channel against a sigma pair against a Laplacian channel, and not
    # v4sigma4, which is C(6,4) = 15: the name is read off the rule, not
    # from "sigma to the fourth".
    for name in slot_names(:mgga, 4)
        @test from_extension(xc_lxc, Tuple{typeof(mgga_c_cs), Val{name},
                                           Tuple{Float64,Float64},
                                           Tuple{Float64,Float64,Float64},
                                           Tuple{Float64,Float64},
                                           Tuple{Float64,Float64}})
    end
    widest = slot_names(:mgga, 4)[argmax(slot_widths(:mgga, 4))]
    @test widest === :v4rhosigma2lapl
    @test length(xc_lxc(mgga_c_cs, widest, (na, nb), (gaa, gab, gbb),
                        (la, lb), (ta, tb))) == 24

    # Two of the 495 by name, through chains on the kernel. All 495 were
    # compared against a MAXORDER=4 build of the pinned sources, to a
    # worst 6.60e-16 of the tensor's own scale; the suite cannot reach
    # that build, and these two are the ones that comparison turned on.
    #
    # d4 e / d rho_a^4, the value libxc gives.
    cs4 = (a, b) -> (a + b) * mgga_c_cs(a, b, gaa, gab, gbb, la, lb, ta, tb)
    @test ForwardDiff.derivative(
        a1 -> ForwardDiff.derivative(
            a2 -> ForwardDiff.derivative(
                a3 -> ForwardDiff.derivative(a4 -> cs4(a4, nb), a3),
                a2), a1), na) ≈ 3.956207127039 rtol=1e-11

    # And d4 e / d rho_a^2 d sigma_aa^2, which is one of the components
    # libxc returns as an exact zero: mgga_c_cs has no fourth-order
    # rho-rho-sigma-sigma dependence at all.
    #
    # The criterion matters. A relative difference against
    # max(|reference|, 1e-12) reports failure
    # wherever libxc returns an exact zero, which it does for 40 of the
    # 495: ours are 2e-17 there, and 1e-17 over the 1e-12 floor reads as
    # 1e-5, so numbers that are right read as a failure. Scaling by the
    # tensor's largest component
    # instead does not blow up at a zero.
    cs_mix = (a, s) -> (a + nb) * mgga_c_cs(a, nb, s, gab, gbb, la, lb, ta, tb)
    @test abs(ForwardDiff.derivative(
        a1 -> ForwardDiff.derivative(
            a2 -> ForwardDiff.derivative(
                s1 -> ForwardDiff.derivative(s2 -> cs_mix(a2, s2), s1), gaa),
            a1), na)) < 1e-15

    # The whole tensor, when asked for: that the generated method runs
    # and that what it returns is laid out the way slot_widths says.
    if get(ENV, "LIBXCDERIVATIVE_TEST_FULL_MGGA_LXC", "0") != "0"
        mgga = xc_lxc(mgga_c_cs, (na, nb), (gaa, gab, gbb), (la, lb), (ta, tb))
        @test length(propertynames(mgga)) == 35
        @test sum(length, mgga) == 495
        @test propertynames(mgga) == slot_names(:mgga, 4)
        @test length.(values(mgga)) == slot_widths(:mgga, 4)
        @test abs(mgga.v4rho2sigma2[1]) < 1e-15
        @test mgga.v4rho4[1] ≈ 3.956207127039 rtol=1e-11
    end

    # The diagonal component against a nested derivative written out
    # here, for the reason the third order gives: the order below is
    # generated by the same rule, so agreeing with it cannot catch a rule
    # that is wrong the same way at both orders, and a dual in xc_kxc's
    # own argument re-specialises all thirty-five of its components,
    # 10.0 s against 0.2 s for the chain.
    e4 = (a, b) -> (a + b) * gga_c_pbe(a, b, gaa, gab, gbb)
    @test ForwardDiff.derivative(
        a1 -> ForwardDiff.derivative(
            a2 -> ForwardDiff.derivative(
                a3 -> ForwardDiff.derivative(a4 -> e4(a4, nb), a3),
                a2), a1), na) ≈
          gga.v4rho4[1] rtol=1e-8
    # And a mixed one through the order below, which is what says the
    # product order holds at this order too and that xc_kxc is itself
    # differentiable.
    @test ForwardDiff.derivative(
        x -> xc_kxc(gga_c_pbe, (na, nb), (x, gab, gbb)).v3rho3[1], gaa) ≈
          gga.v4rho3sigma[1] rtol=1e-8

    # The unpolarized limit, with the factor this order needs: each
    # channel is half the total, so a fourth derivative in the total is a
    # sixteenth of the sum over channels with their multiplicities.
    both = xc_lxc(gga_c_pbe, (0.25, 0.25), (0.075, 0.075, 0.075))
    one = xc_lxc(gga_c_pbe, 0.5, 0.3)
    @test (both.v4rho4[1] + 4both.v4rho4[2] + 6both.v4rho4[3] +
           4both.v4rho4[4] + both.v4rho4[5]) / 16 ≈ one.v4rho4 rtol=1e-8

    # Refused for the potential-only names.
    @test_throws ArgumentError xc_lxc(gga_x_lb_vxc, (na, nb), (gaa, gab, gbb))
end

@testset "xc_kxc answers for a spin-polarized density" begin
    # Third derivatives with a spin axis per slot. The widths follow the
    # rule the second order established: for each variable with
    # multiplicity k and spin width w, C(w+k-1, k), multiplied over the
    # variables, and the ordering follows it too: each variable's spin
    # multiset in lexicographic order, the first variable's axis
    # outermost.
    #
    # Both were confirmed against Libxc before this was written, and that
    # needed a MAXORDER=4 build: Libxc.jl returns nothing above second
    # order, and the MAXORDER=2 build this suite compares against exports
    # the kxc entry points but has no implementation behind them. All 35
    # components of a polarized GGA third derivative matched to 1.0e-14
    # with nothing skipped, on gga_c_pbe, which has no vanishing
    # component. The comparison lives in the generator, since the suite
    # cannot reach that build; what the suite holds is the shape, the
    # unpolarized limit, and consistency with the order below.
    na, nb = 0.3, 0.2
    gaa, gab, gbb = 0.12, 0.05, 0.08

    lda = xc_kxc(lda_x, (na, nb))
    @test propertynames(lda) == (:v3rho3,)
    @test length(lda.v3rho3) == 4           # C(4,3), the rho triple

    gga = xc_kxc(gga_c_pbe, (na, nb), (gaa, gab, gbb))
    @test propertynames(gga) == (:v3rho3, :v3rho2sigma, :v3rhosigma2, :v3sigma3)
    @test length(gga.v3rho3) == 4           # C(4,3)
    @test length(gga.v3rho2sigma) == 9      # C(3,2) * 3
    @test length(gga.v3rhosigma2) == 12     # 2 * C(4,2)
    @test length(gga.v3sigma3) == 10        # C(5,3)
    @test sum(length, gga) == 35

    # The widths are what slot_names_polarized states, so a caller can
    # size an array without evaluating a third derivative.
    @test slot_widths(:gga, 3) == (4, 9, 12, 10)
    @test slot_widths(:lda, 3) == (4,)
    @test sum(slot_widths(:mgga, 3)) == 165
    @test sum(slot_widths(:mgga, 2)) == 45   # the order already shipped
    @test sum(slot_widths(:gga, 2)) == 15
    @test sum(slot_widths(:lda, 2)) == 3

    # The diagonal component against a nested derivative written out
    # here, rather than against one more step through the slot below.
    # Both relations hold, and this one is the stronger of the two: the
    # order below is generated by the same rule, so agreeing with it does
    # not rule out a rule that is wrong in the same way at both orders.
    # It is also what the suite can afford: wrapping xc_fxc's own
    # argument in a dual re-specialises all fifteen of its components,
    # 2.2 s, where the chain alone is 0.2 s.
    e3 = (a, b) -> (a + b) * gga_c_pbe(a, b, gaa, gab, gbb)
    @test ForwardDiff.derivative(
        a1 -> ForwardDiff.derivative(
            a2 -> ForwardDiff.derivative(a3 -> e3(a3, nb), a2), a1), na) ≈
          gga.v3rho3[1] rtol=1e-9
    # And a mixed one through the order below, which is what says the
    # product order is right and, being a dual in the slot function's own
    # argument, that the slot functions are themselves differentiable:
    # the test that found the opaque Vector{Any} closure. Kept on the
    # cheaper of the two directions: a dual in sigma costs 1.3 s against
    # 2.2 s in rho. Differentiating v2rho2's alpha-alpha in sigma_aa
    # gives the first component of v3rho2sigma.
    @test ForwardDiff.derivative(
        x -> xc_fxc(gga_c_pbe, (na, nb), (x, gab, gbb)).v2rho2[1], gaa) ≈
          gga.v3rho2sigma[1] rtol=1e-9

    # The unpolarized limit, with the factor the second order needed: a
    # third derivative in the total density is an eighth of the sum over
    # the three channels taken with their multiplicities, since each
    # channel is half the total.
    both = xc_kxc(gga_c_pbe, (0.25, 0.25), (0.075, 0.075, 0.075))
    one = xc_kxc(gga_c_pbe, 0.5, 0.3)
    @test (both.v3rho3[1] + 3both.v3rho3[2] + 3both.v3rho3[3] +
           both.v3rho3[4]) / 8 ≈ one.v3rho3 rtol=1e-9

    # Refused for the potential-only names.
    @test_throws ArgumentError xc_kxc(gga_x_lb_vxc, (na, nb), (gaa, gab, gbb))
end

@testset "xc_fxc answers for a spin-polarized density" begin
    # The last of Libxc's output slots this package did not reach. Each
    # second derivative carries a spin axis of its own, and the layouts
    # were read off the library rather than assumed: two probes,
    # because one is not enough.
    #
    # An exchange functional fixes the layout by its zeros: exchange is
    # spin-separable, so every alpha-beta entry vanishes and the
    # alpha-alpha ones differ from beta-beta. But that leaves the
    # positions that are zero undetermined, and comparing zero with zero
    # establishes nothing. A correlation functional that depends on both
    # tau and the Laplacian (mgga_c_b94) has no vanishing component,
    # and matching all ten slots against our own Hessian there agreed to
    # 1.8e-9 with nothing skipped.
    #
    # The layouts that came out:
    #   v2rho2      (3)  rho_a rho_a, rho_a rho_b, rho_b rho_b
    #   v2rhosigma  (6)  rho_a x (aa, ab, bb) then rho_b x (aa, ab, bb)
    #   v2sigma2    (6)  the upper triangle, row major:
    #                    aa aa, aa ab, aa bb, ab ab, ab bb, bb bb
    # and the meta-GGA slots follow the same rule: the first quantity's
    # spin axis outermost, the upper triangle when both are the same
    # quantity.
    na, nb = 0.3, 0.2
    gaa, gab, gbb = 0.12, 0.05, 0.08
    la, lb, ta, tb = 0.02, 0.015, 0.09, 0.06

    lda = xc_fxc(lda_x, (na, nb))
    @test propertynames(lda) == (:v2rho2,)
    @test length(lda.v2rho2) == 3
    ref_lda = Libxc.evaluate(Libxc.Functional(:lda_x; n_spin=2);
                             rho = reshape([na, nb], 2, 1), derivatives = 2:2)
    @test collect(lda.v2rho2) ≈ vec(ref_lda.v2rho2) rtol=1e-11

    # A correlation GGA, so that no component is identically zero.
    gga = xc_fxc(gga_c_pbe, (na, nb), (gaa, gab, gbb))
    @test propertynames(gga) == (:v2rho2, :v2rhosigma, :v2sigma2)
    @test length(gga.v2rho2) == 3
    @test length(gga.v2rhosigma) == 6
    @test length(gga.v2sigma2) == 6
    ref_gga = Libxc.evaluate(Libxc.Functional(:gga_c_pbe; n_spin=2);
                             rho = reshape([na, nb], 2, 1),
                             sigma = reshape([gaa, gab, gbb], 3, 1),
                             derivatives = 2:2)
    for slot in (:v2rho2, :v2rhosigma, :v2sigma2)
        @test collect(getproperty(gga, slot)) ≈
              vec(getproperty(ref_gga, slot)) rtol=1e-10
    end
    @test all(!iszero, gga.v2sigma2)   # nothing compared against zero here

    # And exchange, where the alpha-beta entries vanish: asserted as
    # negligible with their reason, which is also what fixed the layout.
    # Not as exactly zero: they are structurally zero but computed
    # through arithmetic, so rho_a x sigma_bb comes back as -6.9e-18 while
    # rho_a x sigma_ab is exactly 0. Asserting equality with zero passed
    # for one and failed for the other.
    x = xc_fxc(gga_x_pbe, (na, nb), (gaa, gab, gbb))
    @test abs(x.v2rhosigma[2]) < 1e-15   # rho_a x sigma_ab
    @test abs(x.v2rhosigma[3]) < 1e-15   # rho_a x sigma_bb
    @test abs(x.v2sigma2[3]) < 1e-15     # sigma_aa x sigma_bb
    @test abs(x.v2rhosigma[1]) > 1e-3    # rho_a x sigma_aa does not vanish

    # The ten meta-GGA slots, on the functional that has no zeros.
    mgga = xc_fxc(mgga_c_b94, (na, nb), (gaa, gab, gbb), (la, lb), (ta, tb))
    widths = (v2rho2 = 3, v2rhosigma = 6, v2rholapl = 4, v2rhotau = 4,
              v2sigma2 = 6, v2sigmalapl = 6, v2sigmatau = 6,
              v2lapl2 = 3, v2lapltau = 4, v2tau2 = 3)
    @test propertynames(mgga) == keys(widths)
    ref_mgga = Libxc.evaluate(Libxc.Functional(:mgga_c_b94; n_spin=2);
                              rho = reshape([na, nb], 2, 1),
                              sigma = reshape([gaa, gab, gbb], 3, 1),
                              lapl = reshape([la, lb], 2, 1),
                              tau = reshape([ta, tb], 2, 1), derivatives = 2:2)
    for (slot, width) in pairs(widths)
        @test length(getproperty(mgga, slot)) == width
        @test collect(getproperty(mgga, slot)) ≈
              vec(getproperty(ref_mgga, slot)) rtol=1e-8
    end

    # Reaching the unpolarized answer from the polarized side for the
    # second derivative. The density and the gradient are not related the
    # same way, and the first attempt here assumed they were.
    both = xc_fxc(gga_c_pbe, (0.25, 0.25), (0.075, 0.075, 0.075))
    one = xc_fxc(gga_c_pbe, 0.5, 0.3)
    # rho_s = rho/2, so d/drho is half the sum of the two channel
    # derivatives and the second derivative carries a factor of a quarter:
    # (aa + 2ab + bb)/4. Asserted as v2rho2[1] alone first, which is
    # fifteen times too large: the polarization curvature is in it,
    # since moving one channel moves zeta while moving the total does not.
    @test (both.v2rho2[1] + 2both.v2rho2[2] + both.v2rho2[3]) / 4 ≈
          one.v2rho2 rtol=1e-11
    # The gradient components are not scaled that way (sigma_total is
    # sigma_aa + 2 sigma_ab + sigma_bb, and each was set to a quarter of
    # it), so the alpha-alpha component matches directly, as it does for
    # the first derivative.
    @test both.v2sigma2[1] ≈ one.v2sigma2 rtol=1e-11
    @test both.v2rhosigma[1] ≈ one.v2rhosigma rtol=1e-11

    # Refused for the potential-only names.
    @test_throws ArgumentError xc_fxc(gga_x_lb_vxc, (na, nb), (gaa, gab, gbb))
end

@testset "the slot functions answer for a spin-polarized density too" begin
    # The entry points have taken spin-resolved arguments all along:
    # f(na, nb, gaa, gab, gbb), but the slot layer had only the
    # unpolarized methods, so asking for vrho on a polarized density was
    # a MethodError. The kernels could do it; the layer could not.
    #
    # Libxc's widths, which the field sets below follow: vrho has two
    # components, vsigma three, vlapl and vtau two. zk stays a scalar.
    #
    # The convention was read off the library rather than assumed:
    # vrho[s] is the derivative of (rho_total * zk) with respect to
    # rho_s, and vsigma[i] is rho_total times the derivative of zk with
    # respect to sigma_i, both confirmed to 2.6e-15 before this was
    # written.
    na, nb = 0.3, 0.2
    gaa, gab, gbb = 0.12, 0.05, 0.08
    la, lb, ta, tb = 0.02, 0.015, 0.09, 0.06

    lda = xc_exc_vxc(lda_x, (na, nb))
    @test propertynames(lda) == (:zk, :vrho)
    @test length(lda.vrho) == 2
    ref_lda = Libxc.evaluate(Libxc.Functional(:lda_x; n_spin=2);
                             rho = reshape([na, nb], 2, 1), derivatives = 0:1)
    @test lda.zk ≈ only(ref_lda.zk) rtol=1e-12
    @test collect(lda.vrho) ≈ vec(ref_lda.vrho) rtol=1e-12

    # A correlation functional, so that the alpha-beta gradient term is
    # not identically zero: PBE exchange is spin-separable and its
    # vsigma[2] is exactly 0, which would make a comparison there a test
    # of nothing.
    gga = xc_exc_vxc(gga_c_pbe, (na, nb), (gaa, gab, gbb))
    @test propertynames(gga) == (:zk, :vrho, :vsigma)
    @test length(gga.vsigma) == 3
    ref_gga = Libxc.evaluate(Libxc.Functional(:gga_c_pbe; n_spin=2);
                             rho = reshape([na, nb], 2, 1),
                             sigma = reshape([gaa, gab, gbb], 3, 1),
                             derivatives = 0:1)
    @test gga.zk ≈ only(ref_gga.zk) rtol=1e-12
    @test collect(gga.vrho) ≈ vec(ref_gga.vrho) rtol=1e-12
    @test collect(gga.vsigma) ≈ vec(ref_gga.vsigma) rtol=1e-12
    @test abs(gga.vsigma[2]) > 1e-6   # the cross term is really there

    # And exchange, where it is zero, asserted as a zero rather than
    # passed over: spin-separable exchange has no alpha-beta gradient
    # dependence at all.
    x = xc_exc_vxc(gga_x_pbe, (na, nb), (gaa, gab, gbb))
    @test x.vsigma[2] == 0.0

    mgga = xc_exc_vxc(mgga_x_br89, (na, nb), (gaa, gab, gbb), (la, lb), (ta, tb))
    @test propertynames(mgga) == (:zk, :vrho, :vsigma, :vlapl, :vtau)
    @test length(mgga.vlapl) == 2 && length(mgga.vtau) == 2
    ref_mgga = Libxc.evaluate(Libxc.Functional(:mgga_x_br89; n_spin=2);
                              rho = reshape([na, nb], 2, 1),
                              sigma = reshape([gaa, gab, gbb], 3, 1),
                              lapl = reshape([la, lb], 2, 1),
                              tau = reshape([ta, tb], 2, 1), derivatives = 0:1)
    @test mgga.zk ≈ only(ref_mgga.zk) rtol=1e-9
    for slot in (:vrho, :vsigma, :vlapl, :vtau)
        @test collect(getproperty(mgga, slot)) ≈ vec(getproperty(ref_mgga, slot)) rtol=1e-9
    end

    # Reaching the unpolarized answer from the polarized side, which says
    # the two methods are the same function: half the density in each
    # channel, with sigma split so that the total gradient matches, since
    # sigma_total = sigma_aa + 2 sigma_ab + sigma_bb.
    both = xc_exc_vxc(gga_c_pbe, (0.25, 0.25), (0.075, 0.075, 0.075))
    one = xc_exc_vxc(gga_c_pbe, 0.5, 0.3)
    @test both.zk ≈ one.zk rtol=1e-12
    @test both.vrho[1] ≈ one.vrho rtol=1e-12
    # The gradient components come back in the ratio 1 : 2 : 1, which is
    # that same relation differentiated: the cross term enters
    # sigma_total twice. Asserted as the ratio rather than as a sum:
    # written as sum(vsigma) == one.vsigma first, which is four times too
    # large and is what made the factor visible.
    @test both.vsigma[1] ≈ one.vsigma rtol=1e-12
    @test both.vsigma[3] ≈ one.vsigma rtol=1e-12
    @test both.vsigma[2] ≈ 2 * one.vsigma rtol=1e-12

    # Still differentiable, which is the reason these are AD and not
    # generated code: one more step through a polarized vrho component.
    @test ForwardDiff.derivative(
        a -> xc_exc_vxc(lda_x, (a, nb)).vrho[1], na) isa Float64

    # Refused for the potential-only names, as the unpolarized methods are.
    @test_throws ArgumentError xc_exc_vxc(gga_x_lb_vxc, (na, nb), (gaa, gab, gbb))
end

@testset "xc_fxc covers a meta-GGA's ten second derivatives" begin
    # Libxc writes fxc as one output for an LDA, three for a GGA and ten
    # for a meta-GGA. The first two shipped; the ten did not, and asking
    # for them was a MethodError: the least legible way for a package to
    # say "not implemented".
    #
    # The field set is fixed by the family, as it is for xc_exc_vxc: a
    # functional with no Laplacian dependence gets zeros in those four
    # slots rather than a narrower NamedTuple, so the return type does
    # not vary functional by functional. Libxc.jl does the opposite and
    # leaves the fields out, so both halves are asserted below.
    rho, sigma, lapl, tau = 0.5, 0.05, 0.025, 0.15
    slots = (:v2rho2, :v2rhosigma, :v2rholapl, :v2rhotau, :v2sigma2,
             :v2sigmalapl, :v2sigmatau, :v2lapl2, :v2lapltau, :v2tau2)

    # mgga_x_br89 reads both tau and the Laplacian, so the vendored
    # library fills all ten and every one can be compared.
    s_br89 = xc_fxc(mgga_x_br89, rho, sigma, lapl, tau)
    @test propertynames(s_br89) == slots
    ref = Libxc.evaluate(Libxc.Functional(:mgga_x_br89);
                         rho = reshape([rho], 1, 1),
                         sigma = reshape([sigma], 1, 1),
                         lapl = reshape([lapl], 1, 1),
                         tau = reshape([tau], 1, 1), derivatives = 2:2)
    for slot in slots
        @test only(getproperty(ref, slot)) ≈ getproperty(s_br89, slot) rtol=1e-9
    end

    # mgga_x_scan reads tau and not the Laplacian. Libxc.jl returns six
    # fields for it and no v2lapl ones at all; here the four are present
    # and exactly zero, which is the number Libxc would have written had
    # it filled a slot.
    s_scan = xc_fxc(mgga_x_scan, rho, sigma, lapl, tau)
    @test propertynames(s_scan) == slots
    scan_ref = Libxc.evaluate(Libxc.Functional(:mgga_x_scan);
                              rho = reshape([rho], 1, 1),
                              sigma = reshape([sigma], 1, 1),
                              lapl = reshape([lapl], 1, 1),
                              tau = reshape([tau], 1, 1), derivatives = 2:2)
    for slot in (:v2rho2, :v2rhosigma, :v2rhotau, :v2sigma2, :v2sigmatau, :v2tau2)
        @test only(getproperty(scan_ref, slot)) ≈ getproperty(s_scan, slot) rtol=1e-9
    end
    for slot in (:v2rholapl, :v2sigmalapl, :v2lapl2, :v2lapltau)
        @test !(slot in propertynames(scan_ref))   # absent there
        @test getproperty(s_scan, slot) == 0.0     # zero here
    end

    # Mixed partials commute, so the cross terms must not depend on which
    # variable was differentiated first. Computed the other way round
    # here, which is the check that the nesting order in the
    # implementation is not quietly wrong in one of the six cross slots.
    g = (x, y, l, t) -> x * mgga_x_br89(x, y, l, t)
    other_way(i, j, v) = ForwardDiff.derivative(
        a -> ForwardDiff.derivative(b -> g(setindex!(copy(v), b, j)...),
                                    v[j]), v[i])
    let v = [rho, sigma, lapl, tau]
        # v2rhosigma with sigma outermost rather than rho
        @test ForwardDiff.derivative(
            x -> ForwardDiff.derivative(y -> g(x, y, lapl, tau), sigma), rho) ≈
              s_br89.v2rhosigma rtol=1e-10
        @test ForwardDiff.derivative(
            t -> ForwardDiff.derivative(l -> g(rho, sigma, l, t), lapl), tau) ≈
              s_br89.v2lapltau rtol=1e-10
    end

    # And refused for the potential-only names, as the other slots are.
    @test_throws ArgumentError xc_fxc(mgga_x_bj06_vxc, rho, sigma, lapl, tau)
end

@testset "one slot at a time" begin
    # Asking for the whole fourth derivative of a spin-polarized meta-GGA
    # compiles 495 depth-four chains, 51 s, and a caller who wants one of
    # the thirty-five slots pays for all of them. What costs is the number
    # of distinct position tuples, not the size of the kernel and not the
    # size of the function: measured at depth four on one meta-GGA, ten
    # tuples cost 14.1 s and ninety cost 110.8 s, and splitting them over
    # ninety functions instead of one changed that to 139.5 s: the same
    # order. So the slots can be asked for one at a time, and the whole
    # tuple is assembled from them, which leaves the chains written in one
    # place.
    #
    # The name is positional and comes straight after the functional,
    # because it decides what the call returns rather than modifying it,
    # and because a Symbol in that position cannot be mistaken for a
    # density. Val is the type-stable form; a Symbol forwards to it.
    na, nb = 0.3, 0.2
    gaa, gab, gbb = 0.12, 0.05, 0.08
    la, lb, ta, tb = 0.02, 0.015, 0.09, 0.06

    # The one this exists for: a slot of a polarized meta-GGA fourth
    # derivative, five components out of 495, against the number the
    # MAXORDER=4 build of the pinned sources gives.
    v = xc_lxc(mgga_c_cs, :v4rho4, (na, nb), (gaa, gab, gbb), (la, lb), (ta, tb))
    @test length(v) == slot_widths(:mgga, 4)[1]
    @test v[1] ≈ 3.956207127039 rtol=1e-11
    @test xc_lxc(mgga_c_cs, Val(:v4rho4), (na, nb), (gaa, gab, gbb),
                 (la, lb), (ta, tb)) == v

    # And that one slot is the same thing the whole tuple holds, over
    # every slot of an order where the whole tuple is affordable: the
    # polarized GGA fourth derivative, 70 components, which the testset
    # above already pays for. Exact equality, not a tolerance: the two
    # run the same chain, and anything else would mean the assembled
    # tuple is not made of these.
    gga4 = xc_lxc(gga_c_pbe, (na, nb), (gaa, gab, gbb))
    for name in slot_names(:gga, 4)
        @test xc_lxc(gga_c_pbe, name, (na, nb), (gaa, gab, gbb)) ==
              getproperty(gga4, name)
    end

    # The third order and the second, polarized, and the unpolarized
    # orders too, so the rule is one rule and not three.
    gga3 = xc_kxc(gga_c_pbe, (na, nb), (gaa, gab, gbb))
    for name in slot_names(:gga, 3)
        @test xc_kxc(gga_c_pbe, name, (na, nb), (gaa, gab, gbb)) ==
              getproperty(gga3, name)
    end
    gga2 = xc_fxc(gga_c_pbe, (na, nb), (gaa, gab, gbb))
    for name in slot_names(:gga, 2)
        @test xc_fxc(gga_c_pbe, name, (na, nb), (gaa, gab, gbb)) ==
              getproperty(gga2, name)
    end
    lda4 = xc_lxc(lda_x, (na, nb))
    @test xc_lxc(lda_x, :v4rho4, (na, nb)) == lda4.v4rho4

    # Unpolarized: the slot holds a scalar there, as it does in the whole
    # tuple. On the meta-GGA the testset above has already evaluated, so
    # the specialisations are the same ones.
    mgga3 = xc_kxc(mgga_c_cs, 0.5, 0.05, 0.025, 0.15)
    for name in slot_names(:mgga, 3)
        @test xc_kxc(mgga_c_cs, name, 0.5, 0.05, 0.025, 0.15) ===
              getproperty(mgga3, name)
    end
    @test xc_lxc(gga_c_pbe, :v4rho4, 0.5, 0.3) ===
          xc_lxc(gga_c_pbe, 0.5, 0.3).v4rho4

    # A name that is not a slot of that family and order says so, and
    # names what is. A MethodError would be the other outcome, and it
    # would not tell a caller that `v4sigma4` is spelled without the
    # `rho`.
    err = try
        xc_lxc(gga_c_pbe, :v4sigma5, (na, nb), (gaa, gab, gbb))
    catch e
        e
    end
    @test err isa ArgumentError
    @test occursin("v4sigma4", sprint(showerror, err))
    @test_throws ArgumentError xc_kxc(mgga_c_cs, :v4rho4, 0.5, 0.05, 0.025, 0.15)

    # And refused for the potential-only names, as the whole tuple is.
    @test_throws ArgumentError xc_lxc(gga_x_lb_vxc, :v4rho4, (na, nb),
                                      (gaa, gab, gbb))
    @test_throws ArgumentError xc_kxc(gga_x_lb_vxc, :v3rho3, 0.5, 0.3)
end

@testset "the inputs Libxc clamps before its kernel sees them" begin
    # Libxc does not hand a caller's numbers to the kernel. For a functional
    # that needs tau, work_mgga_inc.c:57-80 clamps the gradient to what the
    # kinetic energy density allows, sigma <- min(sigma, 8 rho tau), so that
    # the Fermi hole curvature 1 - sigma/(8 rho tau) cannot go negative.
    # Spin-polarized it is per channel, and sigma_ab is left alone.
    #
    # Any real density satisfies tau >= sigma/(8 rho), so this does nothing to
    # physical input, which is why the sweeps, which stay above the bound by
    # a guard of their own, are unaffected. Below it the two implementations
    # answer different questions, which is what the clamp settles.
    rho, lapl, tau = 0.5, 0.0, 0.05
    bound = 8 * rho * tau                      # 0.2

    # The helper, which is what a caller of a bare kernel needs.
    @test libxc_clamp(mgga_x_scan, rho, 1.0, lapl, tau) ===
          (rho, bound, lapl, tau)
    @test libxc_clamp(mgga_x_scan, rho, 0.05, lapl, tau) ===
          (rho, 0.05, lapl, tau)               # inside the bound, unchanged
    # A GGA has no tau to form a curvature from, and gets its arguments back.
    @test libxc_clamp(gga_x_pbe, rho, 1.0) === (rho, 1.0)
    # So does a function this package does not ship: the slot layer does not
    # require the name to be one of ours, and an error here would shut out a
    # caller passing its own functional.
    let mine = (r, s, l, t) -> r + s + l + t
        @test libxc_clamp(mine, rho, 1.0, lapl, tau) === (rho, 1.0, lapl, tau)
    end
    # Polarized: each channel against its own 8 n t, and sigma_ab untouched.
    @test libxc_clamp(mgga_x_scan, (0.3, 0.2), (0.12, 0.05, 0.08),
                      (0.0, 0.0), (0.01, 0.06)) ===
          ((0.3, 0.2), (0.024, 0.05, 0.08), (0.0, 0.0), (0.01, 0.06))

    # And the slot functions apply it, so that they answer as Libxc does
    # above the bound as well as below it. Five times the bound here.
    ref = Libxc.evaluate(Libxc.Functional(:hyb_mgga_x_bmk);
                         rho = reshape([rho], 1, 1),
                         sigma = reshape([1.0], 1, 1),
                         lapl = reshape([lapl], 1, 1),
                         tau = reshape([tau], 1, 1), derivatives = 0:1)
    got = xc_exc_vxc(hyb_mgga_x_bmk, rho, 1.0, lapl, tau)
    @test got.zk ≈ only(ref.zk) rtol=1e-9
    @test got.vrho ≈ only(ref.vrho) rtol=1e-9
    @test got.vsigma ≈ only(ref.vsigma) rtol=1e-9
    @test got.vtau ≈ only(ref.vtau) rtol=1e-9

    # Without the clamp the kernel is evaluated at the caller's own gradient,
    # which is what enforce_fhc=false asks for.
    # The difference is 15 % in the energy density here, not a rounding
    # matter, and on hyb_mgga_x_cf22d at the same point it is a factor of
    # eleven.
    raw = xc_exc_vxc(hyb_mgga_x_bmk, rho, 1.0, lapl, tau; enforce_fhc=false)
    @test !isapprox(raw.zk, only(ref.zk), rtol=1e-3)
    @test raw.zk ≈ rho * hyb_mgga_x_bmk(rho, 1.0, lapl, tau) / rho rtol=1e-12
    @test raw.zk ≈ hyb_mgga_x_bmk(rho, 1.0, lapl, tau) rtol=1e-12

    # The second derivatives too, which is where the clamp could have been
    # got wrong in a way the value does not show: Libxc evaluates the
    # kernel's derivatives at the clamped point and returns them as
    # derivatives with respect to the argument it was given, carrying no
    # chain rule for the clamp itself. Clamping the point the slot layer
    # differentiates at is exactly that; a min() inside the expression is
    # not, and matches none of the three first derivatives.
    ref2 = Libxc.evaluate(Libxc.Functional(:hyb_mgga_x_bmk);
                          rho = reshape([rho], 1, 1),
                          sigma = reshape([1.0], 1, 1),
                          lapl = reshape([lapl], 1, 1),
                          tau = reshape([tau], 1, 1), derivatives = 2:2)
    f2 = xc_fxc(hyb_mgga_x_bmk, rho, 1.0, lapl, tau)
    for slot in (:v2rho2, :v2rhosigma, :v2rhotau, :v2sigma2, :v2sigmatau,
                 :v2tau2)
        @test getproperty(f2, slot) ≈ only(getproperty(ref2, slot)) rtol=1e-9
    end

    # Polarized, with one channel over its bound and the other under it.
    na, nb = 0.3, 0.2
    saa, sab, sbb = 0.12, 0.05, 0.08
    ta, tb = 0.01, 0.06
    @test saa > 8na * ta        # channel a is over
    @test sbb <= 8nb * tb       # channel b is under
    pref = Libxc.evaluate(Libxc.Functional(:hyb_mgga_x_bmk; n_spin=2);
                          rho = reshape([na, nb], 2, 1),
                          sigma = reshape([saa, sab, sbb], 3, 1),
                          lapl = reshape([0.0, 0.0], 2, 1),
                          tau = reshape([ta, tb], 2, 1), derivatives = 0:1)
    pgot = xc_exc_vxc(hyb_mgga_x_bmk, (na, nb), (saa, sab, sbb), (0.0, 0.0),
                      (ta, tb))
    @test pgot.zk ≈ only(pref.zk) rtol=1e-9
    @test all(pgot.vrho .≈ Tuple(pref.vrho)) || all(
        isapprox(pgot.vrho[i], pref.vrho[i]; rtol=1e-9) for i in 1:2)
    @test all(isapprox(pgot.vsigma[i], pref.vsigma[i]; rtol=1e-9) for i in 1:3)

    # Inside the bound nothing is clamped, so the two forms agree there and
    # the corpus sweeps above are untouched by any of this.
    inside = (rho, 0.05, lapl, tau)
    @test xc_exc_vxc(hyb_mgga_x_bmk, inside...).zk ===
          xc_exc_vxc(hyb_mgga_x_bmk, inside...; enforce_fhc=false).zk
end

@testset "what Libxc carries about a functional besides its arithmetic" begin
    # The citations have no second source. Libxc's SymPy sources carry the
    # mathematics and not the bibliography, so a package generated from
    # them cannot know what to cite unless it reads the library's own
    # reference tables, which is what the generated table here is.
    @test functional_name(:mgga_x_scan) ==
          "SCAN exchange of Sun, Ruzsinszky, and Perdew"
    @test occursin("Perdew", functional_name(:gga_x_pbe))

    # The full flag set, Libxc's own spelling of each bit, not the five
    # that identifier_facts picks out.
    flags = libxc_flags(:mgga_x_scan)
    @test :needs_tau in flags
    @test :dim3 in flags
    @test :have_exc in flags
    @test !(:needs_laplacian in flags)
    @test :hyb_cam in libxc_flags(:hyb_gga_xc_hse06)
    # Yukawa screening, which is the flag Libxc.jl misspells in its own
    # decoding; here it is the name Libxc gives the bit.
    @test :hyb_camy in libxc_flags(:hyb_gga_xc_camy_b3lyp)

    # The have_ bits come from the MAXORDER=4 build, as libxc_derivatives
    # does, and for the same reason: in the MAXORDER=2 build they report
    # what it compiled. Read from there, have_kxc and have_lxc were absent
    # for all 697 identifiers.
    @test :have_kxc in libxc_flags(:mgga_x_scan)
    @test :have_lxc in libxc_flags(:mgga_x_scan)
    @test :have_fxc in libxc_flags(:hyb_gga_xc_hse06)
    @test !(:have_kxc in libxc_flags(:hyb_gga_xc_hse06))   # a real ceiling
    # The counts, so that a build ceiling cannot hide as a property: a
    # flag that is 0 or 697 everywhere is the signature of one.
    ids = available_identifiers()
    @test count(n -> :have_kxc in libxc_flags(n), ids) == 683
    @test count(n -> :have_lxc in libxc_flags(n), ids) == 662
    @test count(n -> :needs_tau in libxc_flags(n), ids) == 219

    # Two flags this table cannot answer honestly, and says so rather
    # than pretending. on_host and on_device are set from a C file's
    # default (func_info.c:14-16) by whether libxc was built with CUDA or
    # HIP, not by anything about the functional, and the pinned build has
    # neither, so all 697 read on_host. stable is declared in xc.h and
    # set by nothing, so none carry it; that zero is correct.
    @test count(n -> :on_host in libxc_flags(n), ids) == length(ids)
    @test count(n -> :on_device in libxc_flags(n), ids) == 0
    @test count(n -> :stable in libxc_flags(n), ids) == 0
    @test count(n -> :development in libxc_flags(n), ids) == 13

    # A third flag of the same kind, and one the rule above does not
    # catch on its own. enforce_fhc is
    # set for all 697, including LDAs that have no tau to compute a Fermi
    # hole curvature from, because functionals.c:355 ORs it into every
    # functional at init time under #ifdef
    # XC_ENFORCE_FERMI_HOLE_CURVATURE, and CMakeLists.txt:162 defaults
    # DISABLE_FHC to OFF, so the pinned build defines it. It is a build
    # option, not a property.
    @test count(n -> :enforce_fhc in libxc_flags(n), ids) == length(ids)
    @test :enforce_fhc in libxc_flags(:lda_x)

    # Three files in the pinned sources name the flag, and only one of them
    # is a functional declaring it for itself: functionals.c sets it for
    # everything at init and xc_func_set_fhc_enforcement toggles it;
    # work_mgga_inc.c is where it is acted on, sigma <- min(sigma, 8 rho
    # tau); mgga_x_sa_tpss is the one functional whose own info carries it.
    # Not asserted: the sources are not shipped, and a search whose answer
    # is written beside it would only repeat itself.

    # So the rule is checked rather than only stated. Every flag at
    # either end (carried by all 697 or by none) has to be named in
    # libxc_flags's docstring, which is where the reason it is at that end
    # is written down, build setting or property. A rule that is stated and
    # not checked is how a build setting comes to read as a property.
    #
    # The twenty names are transcribed from the generator's table, which
    # the package does not ship, so a bit added upstream has to be copied
    # here by hand.
    let src = read(joinpath(pkgdir(LibXcDerivative), "src", "identifiers.jl"), String),
        doc = match(r"\"\"\"\n    libxc_flags\(f\)\n(.*?)\"\"\""s, src).captures[1],
        names = [:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim1,
                 :dim2, :dim3, :hyb_cam, :hyb_camy, :vv10, :hyb_lc, :hyb_lcy,
                 :stable, :development, :needs_laplacian, :needs_tau,
                 :enforce_fhc, :on_device, :on_host]
        @test length(names) == 20
        ends = [f for f in names
                if count(n -> f in libxc_flags(n), ids) in (0, length(ids))]
        @test length(ends) == 8
        for flag in ends
            @test occursin(string(flag), doc)
        end
    end

    # Which orders Libxc itself provides. Not a statement about this
    # package, where a derivative comes from the caller's AD over one
    # expression: Libxc.jl stops at 2, while one more ForwardDiff step
    # through xc_fxc gives a third derivative here.
    #
    # Read from a MAXORDER=4 build of the pinned sources, which the
    # numbers depend on. XC_FLAGS_I_HAVE_KXC is 0 when
    # XC_MAXORDER < 3 (util.h:146), and every functional's flags fold in
    # MAPLE2C_FLAGS, which is generated with the build's maxorder, so a
    # default MAXORDER=2 build reports what it compiled: (0,1,2) for 690
    # identifiers and (1,2) for seven, with nothing claiming a third
    # order anywhere. All-identical across a corpus is the signature of a
    # build ceiling, not a property.
    @test libxc_derivatives(:mgga_x_scan) == (0, 1, 2, 3, 4)
    @test libxc_derivatives(:lda_x) == (0, 1, 2, 3, 4)
    # The potential-only ones start at 1: Libxc fills their potential and
    # the orders above it and no zeroth one, which is the absence that
    # makes them special.
    @test libxc_derivatives(:gga_x_lb) == (1, 2, 3, 4)
    @test 0 ∉ libxc_derivatives(:gga_x_lb)
    # And a real ceiling, which is what the order-4 build is for: HSE06
    # stops at 2 because gga_x_wpbeh has no third derivative, and that is
    # the functional's own limit rather than the build's.
    @test libxc_derivatives(:hyb_gga_xc_hse06) == (0, 1, 2)
    @test libxc_derivatives(:gga_x_wpbeh) == (0, 1, 2)

    # The distribution over the corpus, as a gate: a build ceiling would
    # make it one value, and it does not.
    orders = Dict{Any,Int}()
    for name in available_identifiers()
        k = libxc_derivatives(name)
        orders[k] = get(orders, k, 0) + 1
    end
    @test orders[(0, 1, 2, 3, 4)] == 655
    @test orders[(0, 1, 2, 3)] == 21
    @test orders[(0, 1, 2)] == 14
    @test orders[(1, 2, 3, 4)] == 7
    @test length(orders) == 4
    @test sum(values(orders)) == length(available_identifiers())

    # The papers, with the four fields Libxc stores per reference.
    refs = libxc_references(:mgga_x_scan)
    @test !isempty(refs)
    @test occursin("Sun", first(refs).reference)
    @test startswith(first(refs).doi, "10.")
    @test occursin("@article", first(refs).bibtex)
    @test !isempty(first(refs).key)
    # Slater exchange cites the two 1920s papers.
    @test length(libxc_references(:lda_x)) >= 2
    @test any(occursin("Dirac", r.reference) for r in libxc_references(:lda_x))
    # Every reference carries a BibTeX entry; 25 of the 845 carry no DOI,
    # and they are the ones that have none to carry: conference
    # proceedings, a 1956 Soviet journal, and one that reads "Defined
    # through Gaussian implementation". Asserted as the measured counts
    # rather than as "every reference has both", which is what this test
    # claimed first and what the docstring would have shipped.
    without_doi = 0
    without_bibtex = 0
    total_refs = 0
    for name in available_identifiers()
        for r in libxc_references(name)
            total_refs += 1
            isempty(r.doi) && (without_doi += 1)
            isempty(r.bibtex) && (without_bibtex += 1)
        end
    end
    @test total_refs == 845
    @test without_bibtex == 0
    @test without_doi == 25
    @test isempty(libxc_references(:gga_k_ge2)[1].doi)   # the 1956 one

    # The list of what this package serves, which Libxc.jl offers as
    # available_functionals and this did not offer at all.
    ids = available_identifiers()
    @test length(ids) == length(LibXcDerivative.IDENTIFIER_FACTS)
    @test :hyb_gga_xc_hse06 in ids
    @test :gga_x_lb in ids            # under its own name, not gga_x_lb_vxc
    @test issorted(ids)               # a list a reader can scan
    @test eltype(ids) === Symbol

    # Refused for a name this package does not ship, as the other tables
    # are.
    @test_throws ArgumentError functional_name(:gga_x_not_a_functional)
    @test_throws ArgumentError libxc_references(:lda_x_1d_soft)

    # Takes the entry point as well as its name.
    @test functional_name(gga_x_pbe) == functional_name(:gga_x_pbe)
end

@testset "the extension refuses argument types rather than passing them on" begin
    # A call whose argument count the extension takes could otherwise go in
    # and fail on the pass it runs, under a name that is not part of the
    # interface. Its methods take real arguments, so these reach the entry
    # point's own method instead.
    for entry in (xc_exc_vxc, xc_fxc, xc_kxc, xc_lxc)
        err = try
            entry(lda_x, "abc")
            nothing
        catch e
            e
        end
        @test err isa ArgumentError
        msg = sprint(showerror, err)
        @test occursin(string(nameof(entry)), msg)
        @test !occursin("_one_pass", msg)
        @test !occursin("_seeded_pass", msg)
        @test occursin("String", msg)
    end

    # The same for the gradient over the parameters, which names itself
    # rather than the kernel it would have differentiated.
    err = try
        param_gradient(gga_x_pbe, "abc")
        nothing
    catch e
        e
    end
    @test err isa ArgumentError
    msg = sprint(showerror, err)
    @test occursin("param_gradient", msg)
    @test !occursin("gga_x_pbe(", msg)
    @test occursin("String", msg)

    # And the real arguments still reach the extension.
    @test param_gradient(gga_x_pbe, 0.5, 0.1) isa NamedTuple
    @test xc_fxc(lda_x, 0.5).v2rho2 isa Float64
    @test xc_kxc(gga_c_pbe, 0.5, 0.3).v3rho3 isa Float64
end
