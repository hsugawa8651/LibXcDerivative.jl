# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

# `lda_x_energy`'s positional argument order is whatever
# `sort(extra_params)` produced when it was generated; see the `#
# args:` comment the generator writes atop
# src/generated/lda_exc/lda_x.jl. Named locals + a keyword-style call
# below make that order visible at the call site instead of leaving it
# implicit in five bare positional floats, and keep these tests from
# silently breaking (wrong value, not an error, which is what a
# positional-only call gives when the sort order shifts under it) the
# next time argument order shifts.
lda_x_call(; rs, z, dens_threshold=1e-15, params_a_alpha=1.0, zeta_threshold=1e-15) =
    lda_x_energy(rs, z, dens_threshold, params_a_alpha, zeta_threshold)

@testset "lda_x_energy matches the closed-form Dirac exchange energy density" begin
    # Unpolarized (z=0): epsilon_x(rs) = -(3/(4*pi)) * (9*pi/4)^(1/3) / rs,
    # with alpha=1 (standard LDA) and thresholds set far below any rs/z
    # tested here so the low-density/zeta guards never engage.
    closed_form(rs) = -(3 / (4 * pi)) * (9 * pi / 4)^(1 / 3) / rs
    for rs in (0.5, 1.0, 2.0, 5.0)
        got = lda_x_call(; rs, z=0.0)
        @test got ≈ closed_form(rs)
    end
end

@testset "lda_x_energy type stability" begin
    @test (@inferred lda_x_call(; rs=2.0, z=0.0)) isa Float64
end

@testset "lda_x_energy differentiable, matches finite differences" begin
    rs, z = 2.0, 0.0
    d_ad = ForwardDiff.derivative(r -> lda_x_call(; rs=r, z), rs)
    h = 1e-6
    d_fd = (lda_x_call(; rs=rs + h, z) - lda_x_call(; rs=rs - h, z)) / 2h
    @test d_ad ≈ d_fd rtol=1e-6
end

# Cross-validation against the real compiled Libxc C library (via
# Libxc.jl), not a hand-derived closed form: Libxc's own testing
# philosophy (independent numeric ground truth, not "trust the other
# implementation") applied at the scale a single closed-form check
# doesn't reach. rho -> rs conversion: rs = (3/(4*pi*rho))^(1/3).
@testset "lda_x_energy matches Libxc.jl reference (rho -> rs conversion)" begin
    fun = Libxc.Functional(:lda_x)
    for ρ in (0.001, 0.01, 0.1, 1.0, 10.0)
        rs = lda_variables(ρ, Val(3)).rs
        mine = lda_x_call(; rs, z=0.0)
        ref = only(Libxc.evaluate(fun; rho=reshape([ρ], 1, 1), derivatives=0:0).zk)
        @test mine ≈ ref atol=1e-12
    end
end

@testset "lda_c_pw_energy matches Libxc.jl reference (unpolarized + polarized)" begin
    # Standard PW92 parametrization defaults, transcribed from
    # python/lda_exc/lda_c_pw.py (`lda_c_pw_params`
    # branch): the same source generate.jl reads, so this is the
    # correct default for the un-parametrized functional Libxc.jl also
    # evaluates by default.
    pp     = (1.0, 1.0, 1.0)
    a      = (0.031091, 0.015545, 0.016887)
    alpha1 = (0.21370, 0.20548, 0.11125)
    beta1  = (7.5957, 14.1189, 10.357)
    beta2  = (3.5876, 6.1977, 3.6231)
    beta3  = (1.6382, 3.3662, 0.88026)
    beta4  = (0.49294, 0.62517, 0.49671)
    fz20   = 1.709921
    zeta_threshold = 1e-15

    mine(rs, z) = LibXcDerivative.lda_c_pw_energy(
        rs, z,
        a[1], a[2], a[3], alpha1[1], alpha1[2], alpha1[3],
        beta1[1], beta1[2], beta1[3], beta2[1], beta2[2], beta2[3],
        beta3[1], beta3[2], beta3[3], beta4[1], beta4[2], beta4[3],
        fz20, pp[1], pp[2], pp[3], zeta_threshold,
    )

    fun2 = Libxc.Functional(:lda_c_pw; n_spin=2)
    function reference(ρ, z)
        ρa, ρb = ρ * (1 + z) / 2, ρ * (1 - z) / 2
        only(Libxc.evaluate(fun2; rho=reshape([ρa, ρb], 2, 1), derivatives=0:0).zk)
    end

    for (ρ, z) in ((0.01, 0.0), (0.05, 0.0), (0.1, 0.0), (0.5, 0.0), (1.0, 0.0),
                   (0.05, 0.5), (0.5, 0.5))
        rs = lda_variables(ρ, Val(3)).rs
        @test mine(rs, z) ≈ reference(ρ, z) atol=1e-12
    end
end

@testset "three lda_exc functionals with a screening parameter match Libxc.jl" begin
    # The screening parameters are Libxc's own defaults, which is what
    # Libxc.Functional hands the C code being compared against:
    # 0.3 for pmgb06 (src/lda_c_pmgb06.c:22) and 0.5 for pw_erf
    # (src/lda_c_pw_erf.c:26). w20 takes no external parameters.
    zt = 1e-15

    cases = (
        (:lda_c_pmgb06, (rs, z) -> LibXcDerivative.lda_c_pmgb06_energy(rs, z, 0.3, zt)),
        (:lda_c_pw_erf, (rs, z) -> LibXcDerivative.lda_c_pw_erf_energy(rs, z, 0.5, zt)),
        (:lda_c_w20,    (rs, z) -> LibXcDerivative.lda_c_w20_energy(rs, z, zt)),
    )

    for (name, mine) in cases
        fun = Libxc.Functional(name)
        for ρ in (0.01, 0.1, 1.0, 10.0)
            rs = lda_variables(ρ, Val(3)).rs
            ref = only(Libxc.evaluate(fun; rho=reshape([ρ], 1, 1), derivatives=0:0).zk)
            @test mine(rs, 0.0) ≈ ref atol=1e-12
        end
    end
end

@testset "reduced variables: LDA" begin
    # Libxc's kernels do not take a density: they take its own reduced
    # variables, and until now the conversion to them existed only inside
    # this file, transcribed by hand for each testset that needed it. It
    # is part of the package now: rs = (3/(4*pi*n))^(1/3) and
    # z = (na - nb)/(na + nb), as libxc_codegen.py:4353-4356 defines them
    # (RS_FACTOR / n_tot^(1/dim) with dim = 3).
    v = lda_variables(1.0, Val(3))
    @test v.rs ≈ (3 / (4π))^(1 / 3)
    @test v.z == 0.0

    p = lda_variables(0.3, 0.2, Val(3))
    @test p.rs ≈ (3 / (4π * 0.5))^(1 / 3)
    @test p.z ≈ (0.3 - 0.2) / 0.5

    # The one-argument method is the equal-spin case of the two-argument
    # one, which is the property that says the two agree on a convention
    # rather than each being separately plausible.
    @test lda_variables(0.5, 0.5, Val(3)).rs ≈ lda_variables(1.0, Val(3)).rs
    @test lda_variables(0.5, 0.5, Val(3)).z == 0.0

    # Fully polarized: z = 1 at nb = 0, without dividing by zero.
    @test lda_variables(1.0, 0.0, Val(3)).z == 1.0

    @test isbits(v)
    @test (@inferred lda_variables(1.0, Val(3))) isa NamedTuple
    @test (@inferred lda_variables(0.3, 0.2, Val(3))) isa NamedTuple

    # The rs factors are written as literals, so pin them to the values
    # they claim to be rather than to a rounding of themselves.
    @test LibXcDerivative.RS_FACTOR_3D === Float64(cbrt(big(3) / (4 * big(π))))
    @test LibXcDerivative.RS_FACTOR_2D === Float64(1 / sqrt(big(π)))
    @test LibXcDerivative.RS_FACTOR_1D === 0.5
end

@testset "entry points: overrides, and what they refuse" begin
    # A misspelled parameter must not be silently ignored. merge() would
    # simply add it as a new field, leaving the default in force and the
    # caller's value discarded: a silently wrong number, which is the
    # failure this package keeps having to design against.
    @test_throws ArgumentError lda_c_pk09(0.5; params = (; zeta_threshhold = 1e-12))

    # A parameter with no default is demanded by name rather than filled
    # in with something plausible. lda_c_epc18 is one of the three left:
    # its Python source is a kernel shared by XC_LDA_C_EPC18_1 and _2,
    # which differ precisely in these parameters, so there is no single
    # value to read.
    err = try; lda_c_epc18(0.5); catch e; e; end
    @test err isa ArgumentError
    @test occursin("params_a_a", sprint(showerror, err))

    # And a parameter that does have a default is used without being
    # asked for. lda_x's alpha is assigned in lda_x_init rather than
    # exposed as an external parameter, and is read from the params
    # struct the library initialised.
    @test lda_x_required == ()
    @test lda_x_defaults.params_a_alpha == 1.0
    @test lda_x(0.5) ≈ only(Libxc.evaluate(Libxc.Functional(:lda_x);
                            rho=reshape([0.5], 1, 1), derivatives=0:0).zk) atol=1e-12

    # An accepted override actually takes effect.
    @test lda_c_pk09(0.5; params = (; zeta_threshold = 1e-10)) isa Float64

    # The properties the NamedTuple form was chosen for, checked through
    # the generated entry point rather than on a hand-written stand-in.
    @test (@inferred lda_c_pk09(0.5)) isa Float64
    # Measured inside a function on purpose: @allocated on a call written
    # directly in a testset body reports the scope's own boxing, not the
    # call's, and reads as a 16-byte allocation that is not there.
    call_pk09() = lda_c_pk09(0.5)
    call_pk09()
    @test @allocated(call_pk09()) == 0
    @test ForwardDiff.derivative(lda_c_pk09, 0.5) isa Float64
end

@testset "lda_c_1d_loos follows the pinned source, not the vendored library" begin
    # This one disagrees with Libxc.jl by a factor of four, far outside
    # anything a threshold or a variable convention could explain: the
    # value Libxc returns is not even in the range this kernel takes.
    #
    # It is not a porting error. The expression below is transcribed by
    # hand from python/lda_exc/lda_c_1d_loos.py, and it
    # reproduces the generated kernel to ten significant digits at every
    # density checked. The pinned C driver agrees on the variable too: it
    # calls the kernel with 0.5/na (maple2c/lda_exc/lda_c_1d_loos.c:189),
    # which is what lda_variables gives in one dimension.
    #
    # So the pinned sources and the library Libxc.jl vendors compute
    # different functions here, and this package follows the pinned
    # sources. That is
    # worth a standing check rather than an exclusion, so the hand
    # transcription is the oracle.
    η0 = -log(sqrt(2π)) + 3 / 4
    η1 = 0.359933
    ε0 = -π^2 / 360
    ε1 = 0.00845
    κ = 0.414254
    c0 = κ * η0
    c1 = 4κ * η0 + κ * sqrt(κ) * η1
    c2 = 5ε0 + ε1 / κ
    c3 = ε1
    upstream(rs) = begin
        t = 2 / (sqrt(1 + 4κ * rs) + 1)
        t^2 * (c0 * (1 - t)^3 + c1 * t * (1 - t)^2 + c2 * t^2 * (1 - t) + c3 * t^3)
    end

    for ρ in (0.05, 0.5, 2.0, 5.0)
        @test lda_c_1d_loos(ρ) ≈ upstream(0.5 / ρ) rtol=1e-12
    end

    # And it really is a disagreement, not a coincidence of the points
    # chosen: without this the test above would still pass if the vendored
    # library happened to agree after all.
    ref = only(Libxc.evaluate(Libxc.Functional(:lda_c_1d_loos);
                              rho=reshape([0.5], 1, 1), derivatives=0:0).zk)
    @test !isapprox(lda_c_1d_loos(0.5), ref; rtol=1e-3)
end

@testset "polarized lda_x_rel matches the version-matched library" begin
    # Both lda_x_rel and lda_c_pk09 disagree with Libxc.jl once
    # spin-polarized. Libxc.jl vendors Libxc 7.0.0; the pinned sources are
    # 7.1.2, so "the library disagrees" is the obvious explanation, and
    # it holds for only one of them.
    #
    # Building the pinned 7.1.2 and asking it settles
    # both, in opposite directions (2026-09-06, na=0.06, nb=0.04):
    #
    #                 pinned 7.1.2            ours                    7.0.0
    #   lda_x_rel     -0.34584113975025621    -0.34584113975025715    -0.34584191948667659
    #   lda_c_pk09    -0.052584383542939123   -0.052583023178648831   -0.052584383542937423
    #
    # lda_x_rel is a version difference and this package is right.
    # lda_c_pk09 is not: 7.1.2 and 7.0.0 agree with each other and this
    # package is the odd one out, so the port is wrong. See the test
    # below.
    @test lda_x_rel(0.06, 0.04) ≈ -0.34584113975025621 rtol=1e-13
    ref = only(Libxc.evaluate(Libxc.Functional(:lda_x_rel; n_spin=2);
                              rho=reshape([0.06, 0.04], 2, 1),
                              derivatives=0:0).zk)
    @test !isapprox(lda_x_rel(0.06, 0.04), ref; rtol=1e-9)
    @test lda_x_rel(0.1) ≈ only(Libxc.evaluate(Libxc.Functional(:lda_x_rel);
                                rho=reshape([0.1], 1, 1),
                                derivatives=0:0).zk) atol=1e-10
end

@testset "lda_c_pk09 is right when spin-polarized" begin
    # The z dependence is what an argument-name collision in generation
    # disturbs: such a collision reads as 2.6e-5 relative at z=0.2 and
    # 3.4e-2 at z=0.98 while agreeing exactly at z=0. The value below is
    # what Libxc 7.1.2 returns.
    @test lda_c_pk09(0.06, 0.04) ≈ -0.052584383542939123 rtol=1e-12

    # Unpolarized is unaffected and stays checked, which is what locates
    # the defect in the z dependence.
    @test lda_c_pk09(0.1) ≈ only(Libxc.evaluate(Libxc.Functional(:lda_c_pk09);
                                 rho=reshape([0.1], 1, 1),
                                 derivatives=0:0).zk) atol=1e-12
end
