# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

@testset "what happens outside the valid arguments" begin
    # src/variables.jl says what rho, sigma and tau may be. Each of
    # those statements was measured before it was written, and this is
    # where the measurements live, so that a change in the behaviour
    # shows up as a failing test rather than as a docstring that has
    # quietly stopped being true.

    # rho <= 0 takes the density-threshold branch and answers with zero,
    # for a negative density as much as for zero, and the library
    # answers the same, so nothing is reported on either side.
    @test lda_x(0.0) == 0.0
    @test lda_x(-1.0) == 0.0
    @test only(Libxc.evaluate(Libxc.Functional(:lda_x);
                              rho=reshape([-1.0], 1, 1),
                              derivatives=0:0).zk) == 0.0

    # A negative sigma is not a value a squared gradient takes. The
    # variables layer reaches it through Base's sqrt and says so; the
    # library clamps to zero and returns the sigma = 0 answer instead,
    # which is the defensive choice for arrays off a grid. Both halves
    # are pinned: the throw here, and that the library does not.
    @test_throws DomainError gga_x_pbe(1.0, -0.1)
    @test only(Libxc.evaluate(Libxc.Functional(:gga_x_pbe);
                              rho=reshape([1.0], 1, 1),
                              sigma=reshape([-0.1], 1, 1),
                              derivatives=0:0).zk) ≈ gga_x_pbe(1.0, 0.0) atol=1e-10

    # tau below sigma/(8 rho) is a combination no density produces, and
    # nothing reports it: a finite number comes back. The testset above
    # keeps the sweeps out of that region; this records what is there.
    @test isfinite(mgga_x_scan(1.0, 0.1, 0.05, 0.0))
    @test isfinite(mgga_x_scan(1.0, 0.1, 0.05, -0.1))

    # gab is bounded by Cauchy-Schwarz, gab^2 <= gaa * gbb, and the
    # bound is not decoration: a correlation functional moves when gab
    # is pushed past it. An exchange functional does not use gab at all,
    # so it cannot notice, which is why the first assertion needs a
    # correlation functional to have any force.
    @test gga_c_pbe(0.5, 0.5, 0.1, 0.1, 0.1) !=
          gga_c_pbe(0.5, 0.5, 0.1, 10.0, 0.1)
    @test gga_x_pbe(0.5, 0.5, 0.1, 0.1, 0.1) ==
          gga_x_pbe(0.5, 0.5, 0.1, 10.0, 0.1)
end

@testset "lda_c_pw_energy type stability and differentiability" begin
    rs, z = 1.0, 0.3
    common = (0.031091, 0.015545, 0.016887, 0.21370, 0.20548, 0.11125,
              7.5957, 14.1189, 10.357, 3.5876, 6.1977, 3.6231,
              1.6382, 3.3662, 0.88026, 0.49294, 0.62517, 0.49671,
              1.709921, 1.0, 1.0, 1.0, 1e-15)
    f(rs, z) = LibXcDerivative.lda_c_pw_energy(rs, z, common...)
    @test (@inferred f(rs, z)) isa Float64
    d_ad = ForwardDiff.derivative(r -> f(r, z), rs)
    h = 1e-6
    d_fd = (f(rs + h, z) - f(rs - h, z)) / 2h
    @test d_ad ≈ d_fd rtol=1e-5
end

@testset "generated entry points supply Libxc's own thresholds" begin
    # The point of the whole layer: a functional is callable from a
    # density, with the thresholds Libxc itself would use, and the
    # positional order of the kernel never reaches the caller.
    for (name, f) in ((:lda_c_pk09, lda_c_pk09),      # one threshold
                      (:lda_c_gk72, lda_c_gk72),      # no extra arguments at all
                      (:lda_c_2d_amgb, lda_c_2d_amgb))
        fun = Libxc.Functional(name)
        for ρ in (0.01, 0.1, 1.0, 10.0)
            ref = only(Libxc.evaluate(fun; rho=reshape([ρ], 1, 1), derivatives=0:0).zk)
            @test f(ρ) ≈ ref atol=1e-12
        end
    end

    # Spin-resolved, against Libxc's own two-channel evaluation:
    # including a two-dimensional functional, since the entry point is
    # what carries the dimension through to the variable layer.
    for name in (:lda_c_gk72, :lda_c_2d_amgb)
        f = getfield(LibXcDerivative, name)
        fun2 = Libxc.Functional(name; n_spin=2)
        for (na, nb) in ((0.06, 0.04), (0.3, 0.2))
            ref = only(Libxc.evaluate(fun2; rho=reshape([na, nb], 2, 1),
                                      derivatives=0:0).zk)
            @test f(na, nb) ≈ ref atol=1e-12
        end
    end

    # GGA, both spin cases.
    gfun1 = Libxc.Functional(:gga_x_pbepow; n_spin=1)
    for (ρ, σ) in ((0.1, 0.01), (1.0, 0.2))
        ref = only(Libxc.evaluate(gfun1; rho=reshape([ρ], 1, 1),
                                  sigma=reshape([σ], 1, 1), derivatives=0:0).zk)
        @test gga_x_pbepow(ρ, σ) ≈ ref atol=1e-10
    end
    gfun2 = Libxc.Functional(:gga_x_pbepow; n_spin=2)
    for (na, nb, gaa, gab, gbb) in ((0.06, 0.04, 0.01, 0.002, 0.008),)
        ref = only(Libxc.evaluate(gfun2; rho=reshape([na, nb], 2, 1),
                                  sigma=reshape([gaa, gab, gbb], 3, 1),
                                  derivatives=0:0).zk)
        @test gga_x_pbepow(na, nb, gaa, gab, gbb) ≈ ref atol=1e-10
    end

    # The defaults are bound to a name of their own, and hold what Libxc
    # holds: not one constant reused everywhere (lda_c_wigner's density
    # threshold is 1e-24 where lda_x's is 1e-15).
    # Three different density thresholds among the functionals shipped
    # here: 1e-15 for lda_x, 1e-24 for lda_c_wigner, 1e-12 for
    # gga_x_pbepow (gga_x_pbepow.c:26), which is why they are read per
    # functional rather than written down once.
    @test lda_c_pk09_defaults.zeta_threshold === eps(Float64)
    @test lda_c_gk72_defaults === NamedTuple()
    @test gga_x_pbepow_defaults.dens_threshold == 1e-12
    @test lda_x_defaults.dens_threshold == 1e-15
end

@testset "reduced variables: dimensionality" begin
    # rs is dimension-dependent and six shipped functionals are not 3D:
    # RS_FACTOR is 1/2 in 1D, 1/sqrt(pi) in 2D and (3/(4pi))^(1/3) in 3D,
    # with rs = RS_FACTOR / n^(1/dim) (python/libxc_codegen.py:79-83, 113).
    # Assuming 3D everywhere gives a plausible number that is simply the
    # wrong functional's answer, which is how this was found: lda_c_2d_amgb
    # disagreed with Libxc in the third digit.
    n = 2.0
    @test lda_variables(n, Val(1)).rs ≈ 0.5 / n
    @test lda_variables(n, Val(2)).rs ≈ (1 / sqrt(π)) / sqrt(n)
    @test lda_variables(n, Val(3)).rs ≈ (3 / (4π * n))^(1 / 3)

    # There is no default. Three dimensions is the common case, not a
    # safe assumption: a caller who leaves the dimension out gets a
    # MethodError rather than an answer to a different question.
    @test_throws MethodError lda_variables(n)
    @test_throws MethodError lda_variables(0.3, 0.2)
    @test_throws MethodError gga_variables(n, 0.5)
    @test_throws MethodError gga_variables(0.3, 0.2, 0.1, 0.02, 0.08)

    # z does not depend on the dimension.
    @test lda_variables(0.3, 0.2, Val(2)).z ≈ (0.3 - 0.2) / 0.5

    # The gradient exponent is 1 + 1/dim, so it moves too.
    @test gga_variables(n, 0.5, Val(2)).xt ≈ sqrt(0.5) / n^(3 / 2)
    @test gga_variables(n, 0.5, Val(3)).xt ≈ sqrt(0.5) / n^(4 / 3)

    @test (@inferred lda_variables(n, Val(2))) isa NamedTuple
    @test (@inferred gga_variables(n, 0.5, Val(2))) isa NamedTuple
end

@testset "a parameter with no default is demanded, by name" begin
    # Reading defaults from a library built from the pinned sources
    # rather than from the older one Libxc.jl vendors changed what is
    # knowable: lda_c_rpaf's threshold is readable now, so it is callable
    # from a density, and lda_c_epc18 gets its thresholds while still
    # demanding the parameters that distinguish its two variants.
    @test lda_c_rpaf_required == ()
    @test lda_c_rpaf_defaults.zeta_threshold === eps(Float64)

    @test lda_c_epc18_defaults.dens_threshold == 1e-15
    @test lda_c_epc18_required == (:params_a_a, :params_a_b, :params_a_c)

    # The refusal names what is missing, so a caller learns it from the
    # error rather than by reading the generated source.
    err = try; lda_c_epc18(0.5); catch e; e; end
    @test err isa ArgumentError
    @test occursin("params_a_a", sprint(showerror, err))
    @test lda_c_epc18(0.5; params = (; params_a_a = 1.0, params_a_b = 1.0,
                                     params_a_c = 1.0)) isa Float64

    # Only two functionals still demand anything, and for a reason that is
    # not "nobody has got to it": both are kernels shared by variants that
    # differ in their parameters, so there is no single set to read.
    for name in ("lda_c_epc18", "lda_xc_1d_ehwlrg")
        @test !isempty(getfield(LibXcDerivative, Symbol(name, "_required")))
    end
    # lda_c_1d_css was the third until its struct's leading run of doubles
    # was read: twenty parameters, the row css_set_ext_params picks for
    # Libxc's published default (interaction = 1, beta = 1.0).
    @test isempty(lda_c_1d_css_required)
    @test lda_c_1d_css_defaults.params_a_para_0 == 18.40
    @test lda_c_1d_css_defaults.params_a_ferro_0 == 5.24
end

@testset "three more follow the corrections made after 7.0.0" begin
    # These three differ from the 7.0.0 Libxc.jl vendors by 36 %, 4.7 %
    # and 1.1e-6, and agree with the pinned 7.1.2 they were generated
    # from to 5e-16 or better. A reason that does not name which library
    # it was measured against cannot tell those two apart, which is what
    # putting both in the same table is for.
    #
    # References from the pinned 7.1.2 build (2026-10-08, sigma = 0.1 rho,
    # lapl = 0.05 rho, tau = 0.3 rho, unpolarized).
    for (f, refs) in ((mgga_c_rregtm, (-0.02465160132523822,
                                       -0.03878465040963223,
                                       -0.027033962707573134)),
                      (mgga_xc_lp90, (-0.31240846072083844,
                                      -0.637986837943708,
                                      -1.3681256241945674)))
        for (rho, ref) in zip((0.05, 0.5, 5.0), refs)
            @test f(rho, 0.1rho, 0.05rho, 0.3rho) ≈ ref rtol=1e-13
        end
    end
    for (rho, ref) in zip((0.05, 0.5, 5.0), (-0.2237223693556993,
                                             -0.5269100059430111,
                                             -1.2019700601735115))
        @test gga_x_hjs_b97x(rho, 0.1rho) ≈ ref rtol=1e-13
    end

    # And the vendored library genuinely differs, which is what says
    # these references are not just this package agreeing with itself.
    rregtm_vendored = only(Libxc.evaluate(Libxc.Functional(:mgga_c_rregtm);
                                          rho=reshape([0.5], 1, 1),
                                          sigma=reshape([0.05], 1, 1),
                                          lapl=reshape([0.025], 1, 1),
                                          tau=reshape([0.15], 1, 1),
                                          derivatives=0:0).zk)
    @test !isapprox(mgga_c_rregtm(0.5, 0.05, 0.025, 0.15), rregtm_vendored;
                    rtol=1e-3)
end

@testset "mgga_x_2d_prhg07_prp10 follows the pinned library, not the vendored one" begin
    # The seventh potential functional, kept out of the sweep above for
    # the same reason gga_x_hjs_b97x and the gga_c_wi pair are: the two
    # libraries compute different functions here. Against the library
    # Libxc.jl vendors it is out by 5 to 29 %, which is no tolerance
    # question; against the pinned 7.1.2 the expressions were generated
    # from it agrees to 4e-16, and one ForwardDiff step to 5e-14.
    #
    # References from the pinned 7.1.2 build (2026-10-08), at the inputs
    # the sweeps use: sigma = 0.1 rho, lapl = 0.05 rho, tau = 0.3 rho.
    # The pinned library cannot be called from here (it is not shipped
    # with this package), so the numbers are transcribed, as they are for
    # every other pinned reference in this file.
    refs = ((0.05, -0.42096747517305233, -0.07172292678217662),
            (0.5,  -1.4213978095798718,  -1.9547185539947365),
            (5.0,  -5.042539864964262,   -0.5538061941534778))
    f = mgga_x_2d_prhg07_prp10_vxc
    for (rho, vrho, v2rho2) in refs
        sigma, lapl, tau = 0.1rho, 0.05rho, 0.3rho
        @test f(rho, sigma, lapl, tau) ≈ vrho atol=1e-12
        @test ForwardDiff.derivative(x -> f(x, sigma, lapl, tau), rho) ≈
              v2rho2 atol=1e-10
        # And the vendored library really does differ, so this testset is
        # not quietly duplicating the sweep it was split out of.
        ref = only(Libxc.evaluate(Libxc.Functional(:mgga_x_2d_prhg07_prp10);
                                  rho=reshape([rho], 1, 1),
                                  sigma=reshape([sigma], 1, 1),
                                  lapl=reshape([lapl], 1, 1),
                                  tau=reshape([tau], 1, 1),
                                  derivatives=1:1).vrho)
        @test !isapprox(ref, vrho; rtol=1e-3)
    end
end
