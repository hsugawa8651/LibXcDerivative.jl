# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

# The tier and the rule come from the package (src/tolerance.jl), which is
# the one thing this file and the generator both read. Stating them here as
# well is how gga_xc_beefvdw fell between the two gates.
const agrees_with_libxc = LibXcDerivative.agrees_with_libxc

@testset "the agreement tier lives in one place and is inherited" begin
    # The table and the rule live in the package, which is the one thing
    # the generator and the tests both read. Stated in two places they can
    # disagree, and gga_xc_beefvdw is where that shows: it misses 1e-10 by
    # 8.9e-10 only because it holds gga_x_beefvdw, whose own tier allows
    # 7e-10.
    @test LibXcDerivative.libxc_loose_tolerance("gga_x_beefvdw") == 1e-7
    @test LibXcDerivative.libxc_loose_tolerance("gga_x_pbe") === nothing

    # Inherited through a mix: a weighted sum is no better than the
    # component that agrees least well, and the components are read from
    # the functional's own `_components` rather than listed again.
    @test LibXcDerivative.libxc_loose_tolerance("gga_xc_beefvdw") == 1e-7
    @test LibXcDerivative.libxc_loose_tolerance("hyb_gga_xc_b3lyp") === nothing

    # The predicate both callers use.
    @test LibXcDerivative.agrees_with_libxc(1.0, 1.0 + 1e-11, "gga_x_pbe")
    @test !LibXcDerivative.agrees_with_libxc(1.0, 1.0 + 1e-8, "gga_x_pbe")
    @test LibXcDerivative.agrees_with_libxc(1.0, 1.0 + 1e-8, "gga_x_beefvdw")
    @test !LibXcDerivative.agrees_with_libxc(1.0, 1.0 + 1e-5, "gga_x_beefvdw")

    # Every name in the table has to be a functional that ships, so an
    # entry cannot outlive what it was written for.
    for name in keys(LibXcDerivative.LIBXC_LOOSE_AGREEMENT)
        @test isdefined(LibXcDerivative, Symbol(name))
    end
end

@testset "the loose tolerance tier releases exactly what it is for" begin
    # Every name in the table has to be callable: a tier entry for
    # something that does not ship claims a tolerance for nothing, and
    # would sit there unnoticed after the functional was withdrawn.
    for name in keys(LibXcDerivative.LIBXC_LOOSE_AGREEMENT)
        @test isdefined(LibXcDerivative, Symbol(name))
        @test isempty(getfield(LibXcDerivative, Symbol(name, "_required")))
    end

    # hyb_mgga_x_m08_so belongs in this tier on two measurements that are
    # each easy to read wrongly. In absolute terms it is 1.62e-10 against
    # the pinned library, nearer than the 1.67e-10 of hyb_mgga_x_m08_hx,
    # which ships; the relative figure for the same comparison is 1.3e-9,
    # and placed beside an absolute bound of 1e-10 it reads as a miss. And
    # its shape is this tier's, which the first two entries alone do not
    # show: the Minnesota members here are all worst at the HIGHEST
    # density.
    @test isdefined(LibXcDerivative, :hyb_mgga_x_m08_so)
    @test haskey(LibXcDerivative.LIBXC_LOOSE_AGREEMENT, "hyb_mgga_x_m08_so")

    # Both halves of why it is in the tier rather than held or strict:
    # the strict bound really does fail for it, and the tier's bound
    # really does hold. Measured against the vendored library at the
    # inputs the sweeps use, its worst case is 2.16e-10 absolute and
    # 1.34e-9 relative.
    let f = hyb_mgga_x_m08_so, rho = 5.0
        sigma, lapl, tau = 0.1rho, 0.05rho, 0.3rho
        ref = only(Libxc.evaluate(Libxc.Functional(:hyb_mgga_x_m08_so);
                                  rho=reshape([rho], 1, 1),
                                  sigma=reshape([sigma], 1, 1),
                                  lapl=reshape([lapl], 1, 1),
                                  tau=reshape([tau], 1, 1),
                                  derivatives=0:0).zk)
        mine = f(rho, sigma, lapl, tau)
        @test !isapprox(mine, ref; atol=1e-10)
        @test isapprox(mine, ref; rtol=LibXcDerivative.LIBXC_LOOSE_AGREEMENT["hyb_mgga_x_m08_so"])
    end

    # The two shapes the tier holds, pinned so the docstring cannot drift
    # back to describing only the first. The KCIS pair loses significance
    # at low density; the Minnesota entries lose it at high density. A
    # tier described by one of those would have refused the other, and
    # that is how m08_so came to be held.
    function worst_density(name, kind)
        fun = Libxc.Functional(Symbol(name))
        f = getfield(LibXcDerivative, Symbol(name))
        best, at = -1.0, 0.0
        for rho in (0.05, 0.5, 5.0)
            sigma, lapl, tau = 0.1rho, 0.05rho, 0.3rho
            kw = kind === :mgga ?
                (; rho=reshape([rho], 1, 1), sigma=reshape([sigma], 1, 1),
                   lapl=reshape([lapl], 1, 1), tau=reshape([tau], 1, 1)) :
                (; rho=reshape([rho], 1, 1), sigma=reshape([sigma], 1, 1))
            ref = only(Libxc.evaluate(fun; kw..., derivatives=0:0).zk)
            mine = kind === :mgga ? f(rho, sigma, lapl, tau) : f(rho, sigma)
            d = abs(mine - ref)
            d > best && ((best, at) = (d, rho))
        end
        return at
    end
    @test worst_density("mgga_c_kcis", :mgga) == 0.05
    @test worst_density("mgga_c_kcisk", :mgga) == 0.05
    @test worst_density("hyb_mgga_x_m06_hf", :mgga) == 5.0
    @test worst_density("mgga_x_m06_l", :mgga) == 5.0
    @test worst_density("hyb_mgga_x_m08_so", :mgga) == 5.0

    # gga_x_hjs_b97x is not among them, though the vendored 7.0.0 puts it
    # at 1.1e-6: against the pinned 7.1.2 it agrees to 2.8e-15, so it
    # ships and is checked in "three more follow the corrections made
    # after 7.0.0" instead.
    @test isdefined(LibXcDerivative, :gga_x_hjs_b97x)
end

@testset "every functional callable from a density alone matches the vendored library" begin
    # The claim this whole layer exists to make, checked across everything
    # that can make it rather than on a chosen example or two: if a
    # functional needs no parameter beyond the thresholds, calling it with
    # a density has to give what Libxc gives for the same density.
    #
    # Driven off the manifest and `<name>_required`, so a functional that
    # gains an entry point later is covered without editing this test, and
    # one that loses its defaults stops being claimed here.
    manifest = TOML.parsefile(joinpath(pkgdir(LibXcDerivative), "src",
                                       "generated", "manifest.toml"))
    checked = String[]
    skipped_absent = String[]
    for (family, entries) in manifest_families(manifest), (name, entry) in entries
        get(entry, "status", "") == "ok" || continue
        # The potential-only families are not energies, so Libxc has no
        # zk to compare against. They are checked in "the potential-only
        # functionals return a potential, not an energy", against vrho
        # and one derivative. Named here rather than skipped by accident:
        # these ship under `<name>_vxc`, so the bare-name lookup below
        # would pass them over without saying so.
        endswith(family, "_vxc") && continue
        isdefined(LibXcDerivative, Symbol(name)) || continue
        isempty(getfield(LibXcDerivative, Symbol(name, "_required"))) || continue
        f = getfield(LibXcDerivative, Symbol(name))
        # Changed upstream after the vendored 7.0.0, so the vendored
        # library is the one that is wrong; checked against the pinned
        # library in their own testsets below. lda_c_1d_loos is in that
        # list for the same measured reason as the rest, which is what
        # replaced the by-name skip it had here.
        name in CORRECTED_AFTER_7_0_0 && continue
        fun = try
            Libxc.Functional(Symbol(name))
        catch
            # Libxc.jl vendors an older library than the pinned sources.
            push!(skipped_absent, name)
            continue
        end
        for ρ in (0.05, 0.5, 5.0)
            # One shape of input per family, scaled with the density so
            # that the reduced variables stay in a sensible range across
            # the three decades.
            σ, λ, τ = 0.1ρ, 0.05ρ, 0.3ρ
            ref = if family == "mgga_exc"
                only(Libxc.evaluate(fun; rho=reshape([ρ], 1, 1),
                                    sigma=reshape([σ], 1, 1),
                                    lapl=reshape([λ], 1, 1),
                                    tau=reshape([τ], 1, 1),
                                    derivatives=0:0).zk)
            elseif family == "gga_exc"
                only(Libxc.evaluate(fun; rho=reshape([ρ], 1, 1),
                                    sigma=reshape([σ], 1, 1),
                                    derivatives=0:0).zk)
            else
                only(Libxc.evaluate(fun; rho=reshape([ρ], 1, 1),
                                    derivatives=0:0).zk)
            end
            mine = if family == "mgga_exc"
                f(ρ, σ, λ, τ)
            elseif family == "gga_exc"
                f(ρ, σ)
            else
                f(ρ)
            end
            @test agrees_with_libxc(mine, ref, name)
        end
        push!(checked, name)
    end

    # Guards against the sweep quietly checking nothing, and pins the
    # count so that losing entry points shows up as a failure here rather
    # than as a test that stopped looking. 144 is what the LDA and GGA
    # families alone reach: 149 callable from a density, less gga_c_wi,
    # gga_c_sg4 and lda_c_1d_loos (checked against the pinned source in
    # their own testsets below), less lda_c_rpaf and lda_xc_th_fl
    # (absent from the vendored library). Meta-GGA adds to that, which
    # is why this is a lower bound rather than an equality.
    @test length(checked) >= 144
    # Pinned so that a functional the vendored library stops providing
    # shows up here rather than being skipped in silence. The meta-GGA
    # names are ones 7.1.2 added after the 7.0.0 Libxc.jl vendors.
    @test issubset(skipped_absent,
                   ["lda_c_1d_css", "lda_c_epc18", "lda_c_rpaf",
                    "lda_xc_1d_ehwlrg", "lda_xc_th_fl",
                    "hyb_mgga_x_wr2scan", "hyb_mgga_xc_coach",
                    "mgga_c_lak", "mgga_c_mscan", "mgga_x_mscan",
                    "mgga_x_sregtm_v1", "mgga_x_sregtm_v2",
                    "mgga_x_sregtm_v3"])
end

@testset "every variant entry point agrees with the vendored library" begin
    # The sweep above walks the manifest's kernels. A kernel several
    # Libxc functionals share has parameters and so never reaches it,
    # which left the 248 variant entry points (the ones that carry
    # those functionals' own parameter values, and the only way to call
    # them by name) checked by nothing that runs on every commit. They
    # were compared by hand when they were written (2026-10-06), and again
    # when gga_xc_b97's twenty-four were added (2026-10-08); a
    # measurement is not a gate, and regenerating the corpus is exactly
    # when one is wanted.
    manifest = TOML.parsefile(joinpath(pkgdir(LibXcDerivative), "src",
                                       "generated", "manifest.toml"))
    checked = String[]
    absent = String[]
    for (family, entries) in manifest_families(manifest), (kernel, entry) in entries
        get(entry, "status", "") == "ok" || continue
        get(entry, "held_back", false) === true && continue
        # As in the sweep above: a potential has no zk, and these ship
        # under `<name>_vxc`, which the bare-name `getfield` below would
        # throw on rather than skip.
        endswith(family, "_vxc") && continue
        for name in get(entry, "variants", String[])
            # A variant entry point carries every parameter that
            # distinguishes it, so it is callable from a density by
            # construction; the assertion says so rather than skipping
            # quietly if that stops being true.
            @test isempty(getfield(LibXcDerivative, Symbol(name, "_required")))
            f = getfield(LibXcDerivative, Symbol(name))
            fun = try
                Libxc.Functional(Symbol(name))
            catch
                # Newer than the library Libxc.jl vendors.
                push!(absent, name)
                continue
            end
            # Corrected upstream after 7.0.0: checked against the
            # pinned library in its own testset below.
            name == "gga_x_hjs_b97x" && (push!(checked, name); continue)
            for rho in (0.05, 0.5, 5.0)
                sigma, lapl, tau = 0.1rho, 0.05rho, 0.3rho
                ref = if family == "mgga_exc"
                    only(Libxc.evaluate(fun; rho=reshape([rho], 1, 1),
                                        sigma=reshape([sigma], 1, 1),
                                        lapl=reshape([lapl], 1, 1),
                                        tau=reshape([tau], 1, 1),
                                        derivatives=0:0).zk)
                elseif family == "gga_exc"
                    only(Libxc.evaluate(fun; rho=reshape([rho], 1, 1),
                                        sigma=reshape([sigma], 1, 1),
                                        derivatives=0:0).zk)
                else
                    only(Libxc.evaluate(fun; rho=reshape([rho], 1, 1),
                                        derivatives=0:0).zk)
                end
                mine = if family == "mgga_exc"
                    f(rho, sigma, lapl, tau)
                elseif family == "gga_exc"
                    f(rho, sigma)
                else
                    f(rho)
                end
                @test agrees_with_libxc(mine, ref, name)
            end
            push!(checked, name)
        end
    end

    # Pinned the way the kernel sweep's count is: losing entry points has
    # to fail here rather than leave a sweep that stopped looking. 274 of
    # the 291 are checked; the other 17 are the pinned absences below,
    # every one of them a name newer than the library Libxc.jl vendors.
    @test length(checked) >= 274
    @test issubset(absent,
                   ["gga_c_bkl1", "gga_c_bkl2", "gga_x_df3_opt1",
                    "gga_x_df3_opt2", "gga_x_llp", "gga_x_t_pbe1",
                    "gga_x_t_pbe2", "gga_xc_dlb97",
                    "hyb_mgga_x_pi_m06_2x", "hyb_mgga_x_pi_m06_2x_dl",
                    "lda_c_bj89", "lda_c_lp96_b", "lda_k_lp96_b",
                    "lda_x_t_sloc", "mgga_c_pi_m06_2x",
                    "mgga_c_pi_m06_2x_dl", "mgga_x_gp86"])

    # The sweep has teeth: what it checks is the parameter values each
    # entry point carries, not just that the kernel they share has the
    # right shape. gga_xc_hcth_120 is one of the twenty-four reaching
    # gga_xc_b97, whose fifteen array parameters are the only thing
    # telling it from the other twenty-three; moving one of them by a
    # millionth moves the answer by 6.4e-7, four orders past the atol
    # above. Without this, a sweep that compared the kernel's default
    # instead of the variant's values would pass just as well.
    let d = gga_xc_hcth_120_defaults,
        ref = only(Libxc.evaluate(Libxc.Functional(:gga_xc_hcth_120);
                                  rho=reshape([0.5], 1, 1),
                                  sigma=reshape([0.05], 1, 1),
                                  derivatives=0:0).zk),
        nudged = gga_xc_hcth_120(0.5, 0.05;
                                 params = (; params_a_c_x_0 =
                                             d.params_a_c_x_0 * (1 + 1e-6)))
        @test gga_xc_hcth_120(0.5, 0.05) ≈ ref atol=1e-10
        @test !isapprox(nudged, ref; atol=1e-10)
    end

    # An entry point's name has to belong to one kernel only. Two kernels
    # claiming the same Libxc functional, or a variant named after a
    # kernel that ships a file of its own, would define it twice and the
    # include order would decide which one answers: silently, and
    # differently depending on the filesystem.
    owners = Dict{String,Vector{String}}()
    kernels = Set{String}()
    for (_, entries) in manifest_families(manifest), (kernel, entry) in entries
        get(entry, "status", "") == "ok" || continue
        get(entry, "held_back", false) === true && continue
        push!(kernels, kernel)
        for name in get(entry, "variants", String[])
            push!(get!(owners, name, String[]), kernel)
        end
    end
    @test all(length(v) == 1 for v in values(owners))
    @test isempty(intersect(keys(owners), kernels))
end

@testset "every mixed functional agrees with the vendored library" begin
    # Libxc evaluates these by mixing others, so this package evaluates
    # them as the weighted sum of kernels it already has
    # (src/generated/mixes.jl). Each was checked against the pinned library
    # before it was written out; this is the gate
    # that keeps checking, which is a different thing: the variant
    # entry points were checked once when written and then went 248
    # functionals without one.
    manifest = TOML.parsefile(joinpath(pkgdir(LibXcDerivative), "src",
                                       "generated", "manifest.toml"))
    mixes = get(manifest, "mix", Dict{String,Any}())
    # Which family each component belongs to, for calling it with the
    # arguments it takes: a GGA mix can hold an LDA component.
    component_family = Dict{String,String}()
    for (family, entries) in manifest_families(manifest)
        entries isa Dict || continue
        for (nm, entry) in entries
            entry isa Dict && haskey(entry, "status") || continue
            component_family[nm] = family
            for v in get(entry, "variants", String[])
                component_family[v] = family
            end
        end
    end
    checked = String[]
    absent = String[]
    for (name, entry) in mixes
        family = entry["family"]
        components = entry["components"]
        overrides = entry["overrides"]
        @test length(overrides) == length(components)
        @test !isempty(components)
        @test isempty(getfield(LibXcDerivative, Symbol(name, "_required")))
        f = getfield(LibXcDerivative, Symbol(name))
        # Every component has to be a functional this package can call
        # on its own: a mix referring to something absent would be an
        # UndefVarError at the first call rather than a failure here.
        for c in components
            @test isdefined(LibXcDerivative, Symbol(c[2]))
        end
        # The generated function has to be the sum the manifest records,
        # with each component called the way its own family is called.
        # This is what catches an emission bug (a coefficient written
        # to the wrong term, or a component handed the wrong arguments)
        # independently of which library the result is compared against.
        for rho in (0.05, 0.5, 5.0)
            sigma, lapl, tau = 0.1rho, 0.05rho, 0.3rho
            recipe = 0.0
            for (i, c) in enumerate(components)
                g = getfield(LibXcDerivative, Symbol(c[2]))
                cf = component_family[c[2]]
                # Libxc sets its components' external parameters from the
                # parent's, so the recipe is the coefficient, the
                # component and what the parent changed in it.
                over = NamedTuple(Symbol(k) => v for (k, v) in overrides[i])
                recipe += c[1] * (cf == "mgga_exc" ? g(rho, sigma, lapl, tau; params=over) :
                                  cf == "gga_exc" ? g(rho, sigma; params=over) :
                                  g(rho; params=over))
            end
            mine = family == "mgga_exc" ? f(rho, sigma, lapl, tau) :
                   family == "gga_exc" ? f(rho, sigma) : f(rho)
            @test mine === recipe
        end

        # Five disagree with the library Libxc.jl vendors while agreeing
        # with the pinned 7.1.2 they were generated and checked against:
        # hyb_mgga_xc_x1b95 by 1.4, hyb_mgga_xc_xb1k by 0.42,
        # hyb_mgga_xc_b0kcis by 0.11, mgga_xc_otpss_d by 2.4e-3 and
        # hyb_gga_xc_hjs_b97x by 1.0e-6: outside anything a tolerance
        # explains, and the same shape as gga_c_wi/gga_c_sg4 above, where
        # 7.0.0 is the one out of date. The recipe check above still
        # applies to them.
        #
        # All five now come out of CORRECTED_AFTER_7_0_0 rather than being
        # named here -- directly for a name upstream changed, and through
        # the components for a mix holding one, which is how the five HSE
        # entry points that hold gga_x_wpbeh are excluded without touching
        # any list. Three of them sat here by name with no cause recorded
        # until the two libraries were put in one table: see
        # test/corrected_after_7_0_0.jl for what that measurement says.
        inherits_a_correction = any(
            string(c[2]) in CORRECTED_AFTER_7_0_0
            for c in getfield(LibXcDerivative, Symbol(name, "_components")))
        (name in CORRECTED_AFTER_7_0_0 || inherits_a_correction) &&
            (push!(checked, name); continue)

        fun = try
            Libxc.Functional(Symbol(name))
        catch
            push!(absent, name)
            continue
        end
        for rho in (0.05, 0.5, 5.0)
            sigma, lapl, tau = 0.1rho, 0.05rho, 0.3rho
            ref = if family == "mgga_exc"
                only(Libxc.evaluate(fun; rho=reshape([rho], 1, 1),
                                    sigma=reshape([sigma], 1, 1),
                                    lapl=reshape([lapl], 1, 1),
                                    tau=reshape([tau], 1, 1),
                                    derivatives=0:0).zk)
            elseif family == "gga_exc"
                only(Libxc.evaluate(fun; rho=reshape([rho], 1, 1),
                                    sigma=reshape([sigma], 1, 1),
                                    derivatives=0:0).zk)
            else
                only(Libxc.evaluate(fun; rho=reshape([rho], 1, 1),
                                    derivatives=0:0).zk)
            end
            mine = family == "mgga_exc" ? f(rho, sigma, lapl, tau) :
                   family == "gga_exc" ? f(rho, sigma) : f(rho)
            @test agrees_with_libxc(mine, ref, name)

            # The spin-resolved entry point has to answer the same thing
            # for an unpolarized density, which is what says the two were
            # written with the same components in the same order.
            mine_polarized = family == "mgga_exc" ?
                    f(rho/2, rho/2, sigma/4, sigma/4, sigma/4,
                      lapl/2, lapl/2, tau/2, tau/2) :
                family == "gga_exc" ?
                    f(rho/2, rho/2, sigma/4, sigma/4, sigma/4) :
                    f(rho/2, rho/2)
            @test mine_polarized ≈ mine rtol=1e-12
        end
        push!(checked, name)
    end

    # Pinned like the other two sweeps: 90 is what the recipes reproduce,
    # and losing them has to fail here.
    # 147 is what the recipes reproduce once the parents' parameter
    # overrides are passed to the components; 90 is what they reproduce
    # without them.
    @test length(mixes) >= 149
    @test length(checked) + length(absent) == length(mixes)
    # Newer than the library Libxc.jl vendors, pinned as the other two
    # sweeps pin theirs.
    @test issubset(absent, ["hyb_gga_xc_cqtp25", "hyb_lda_xc_b93",
                            "mgga_xc_t_hle17"])
end

@testset "three functionals sit at the floor of the strict bound" begin
    # These three use half of atol=1e-10 rather than a few percent of it, and
    # what keeps them out of LIBXC_LOOSE_AGREEMENT is which pair is compared
    # rather than any margin. Ours against the vendored library is the
    # closest of the three pairings available: at rho = 5 the differences are
    # 2.2e-11 for ours against vendored, 2.1e-10 for ours against the pinned
    # source, and 2.4e-10 for pinned against vendored.
    # The suite sees one pair, so what it can pin is how much of the bound
    # that pair uses.
    #
    # Worth pinning because of what happens next: when Libxc_jll moves and
    # the pair moves with it, these are the three that go red, and the
    # failure should read as the floor shifting rather than as a regression
    # here. Measured at rho in (0.05, 0.5, 5.0): on the ubuntu runner
    # hyb_mgga_x_m05 is 1.8e-10 out and mgga_c_m08_hx is 1.1e-10, both over
    # the strict bound, while the values themselves agree to ten digits.
    #
    # That is why the three are in LIBXC_PLATFORM_FLOOR with an absolute
    # bound of 1e-9 rather than held to the strict one. A figure pinned to
    # four digits would fail on a machine whose libm rounds differently,
    # which says nothing about this package; the band below says the thing
    # that matters, that they are inside their own bound and above a
    # floor.
    #
    # Not given the loose tier, deliberately: LIBXC_LOOSE_AGREEMENT hands
    # out 1e-7, which would hide a later disagreement of 1e-8 in exactly
    # these three. 1e-9 keeps that disagreement failing.
    at_the_floor = ("hyb_mgga_x_m05", "hyb_mgga_x_m08_hx", "mgga_c_m08_hx")
    for name in at_the_floor
        # Kept out of the loose tier, and given a bound of their own, which
        # is the decision this pins.
        @test !haskey(LibXcDerivative.LIBXC_LOOSE_AGREEMENT, name)
        @test LibXcDerivative.libxc_loose_tolerance(name) === nothing
        @test LibXcDerivative.LIBXC_PLATFORM_FLOOR[name] == 1e-9

        f = getfield(LibXcDerivative, Symbol(name))
        fun = Libxc.Functional(Symbol(name))
        worst = 0.0
        for rho in (0.05, 0.5, 5.0)
            sigma, lapl, tau = 0.1rho, 0.05rho, 0.3rho
            ref = only(Libxc.evaluate(fun; rho=reshape([rho], 1, 1),
                                      sigma=reshape([sigma], 1, 1),
                                      lapl=reshape([lapl], 1, 1),
                                      tau=reshape([tau], 1, 1),
                                      derivatives=0:0).zk)
            worst = max(worst, abs(f(rho, sigma, lapl, tau) - ref))
        end
        # Inside their own bound, so the suite is green; and above a
        # hundredth of it, so "at the floor" is asserted and not just said
        # in a comment.
        @test worst < 1e-9
        @test worst > 1e-11
    end

    # The same three names, in the file that can see all three pairings. If
    # one is added or dropped there, this is where the two lists part.
    @test sort(collect(at_the_floor)) ==
          sort(["hyb_mgga_x_m05", "hyb_mgga_x_m08_hx", "mgga_c_m08_hx"])
end

@testset "the potential-only functionals return a potential, not an energy" begin
    # Libxc has four sources under python/{lda,gga,mgga}_vxc whose maple
    # code is the POTENTIAL and not an energy: their C files carry
    # `#define XC_NO_EXC`, and the library reports no XC_FLAGS_HAVE_EXC for
    # the six functionals built on them. The package's usual contract
    # (one energy expression, the named derivatives taken from it) does
    # not hold for these. LB94, BJ06, TB09 and RPP09 are potentials that
    # are not the functional derivative of any energy, which is the whole
    # reason Libxc generates them separately.
    #
    # So they ship under their own `_vxc` names, they are counted apart
    # from the energy functionals, and the claim stops at one derivative:
    # Libxc has vxc and fxc for them and nothing above, so there is no
    # reference for a second step and none is asserted.
    names = ("lda_xc_tih", "gga_x_lb", "gga_x_lbm",
             "mgga_x_bj06", "mgga_x_tb09", "mgga_x_rpp09")
    for n in names
        @test isdefined(LibXcDerivative, Symbol(n, "_vxc"))
        # The bare name is reserved for functionals that return an energy
        # density. Handing a potential out under it would read as one.
        @test !isdefined(LibXcDerivative, Symbol(n))
    end

    # The kernel closure is named for what it returns. `_energy` on one of
    # these would be a lie, and it is what the generator emitted before the
    # families were given an entry layer.
    for n in ("lda_xc_tih", "gga_x_lb", "mgga_x_tb09")
        @test isdefined(LibXcDerivative, Symbol(n, "_potential"))
        @test !isdefined(LibXcDerivative, Symbol(n, "_energy"))
    end

    # Value against Libxc's vrho, and one ForwardDiff step against its
    # v2rho2. Only vrho is non-zero: Libxc returns exactly 0.0 for
    # vsigma, vlapl and vtau here, so those are not compared: 0 against
    # an output this package does not have would test nothing.
    lda = ("lda_xc_tih",)
    gga = ("gga_x_lb", "gga_x_lbm")
    mgga = ("mgga_x_bj06", "mgga_x_tb09", "mgga_x_rpp09")
    for name in names
        f = getfield(LibXcDerivative, Symbol(name, "_vxc"))
        fun = Libxc.Functional(Symbol(name))
        for rho in (0.05, 0.5, 5.0)
            sigma, lapl, tau = 0.1rho, 0.05rho, 0.3rho
            # Both signs of the laplacian: it is a signed quantity, and a
            # one-sided sweep leaves half its range unchecked.
            lapls = name in mgga ? (lapl, -lapl) : (lapl,)
            for l in lapls
                kw = if name in lda
                    (; rho = reshape([rho], 1, 1))
                elseif name in gga
                    (; rho = reshape([rho], 1, 1), sigma = reshape([sigma], 1, 1))
                else
                    (; rho = reshape([rho], 1, 1), sigma = reshape([sigma], 1, 1),
                       lapl = reshape([l], 1, 1), tau = reshape([tau], 1, 1))
                end
                call(x) = name in lda ? f(x) :
                          name in gga ? f(x, sigma) : f(x, sigma, l, tau)
                ref1 = only(Libxc.evaluate(fun; kw..., derivatives = 1:1).vrho)
                ref2 = only(Libxc.evaluate(fun; kw..., derivatives = 2:2).v2rho2)
                @test agrees_with_libxc(call(rho), ref1, name)
                @test agrees_with_libxc(ForwardDiff.derivative(call, rho), ref2, name)
            end
        end
    end

    # The gradient enters as x = sqrt(sigma)/n^(4/3), so a vanishing
    # gradient is where a chain rule back to sigma would show. Libxc's own
    # source for gga_x_lb records a fourth derivative coming back as
    # 6.6e+63 against a true -1.2e+02 when that chain is built, so the one
    # step this package does claim is checked down there too.
    for name in gga
        f = getfield(LibXcDerivative, Symbol(name, "_vxc"))
        fun = Libxc.Functional(Symbol(name))
        rho = 0.5
        for sigma in (1e-9 * rho^(8 / 3), 1e-4 * rho^(8 / 3))
            kw = (; rho = reshape([rho], 1, 1), sigma = reshape([sigma], 1, 1))
            ref1 = only(Libxc.evaluate(fun; kw..., derivatives = 1:1).vrho)
            ref2 = only(Libxc.evaluate(fun; kw..., derivatives = 2:2).v2rho2)
            @test agrees_with_libxc(f(rho, sigma), ref1, name)
            @test agrees_with_libxc(
                ForwardDiff.derivative(x -> f(x, sigma), rho), ref2, name)
        end
    end

    # Counted apart from the energy functionals: no name belongs to both
    # sets. The coverage figures this package publishes are "energy N plus
    # potential M", never one sum, because the two are not the same claim.
    for n in names
        @test !isdefined(LibXcDerivative, Symbol(n, "_energy"))
    end
end

@testset "the manifest carries each name's agreement with the pinned library" begin
    # Two libraries answer here, and only one of them the suite can call:
    # the one Libxc.jl vendors. The agreement that decides what ships is
    # against the pinned library, the one the expressions came from, so it
    # cannot be measured from inside the suite at all.
    #
    # The figures therefore live in the manifest, keyed by Libxc's own
    # output name and carrying both an absolute and a relative worst case.
    # Held in prose instead, a figure can be read against the wrong
    # library, or a relative figure compared against an absolute bound.
    # This testset is what keeps them from going stale.
    manifest = TOML.parsefile(joinpath(pkgdir(LibXcDerivative), "src",
                                       "generated", "manifest.toml"))
    recorded = String[]
    missing_record = String[]
    for (family, entries) in manifest_families(manifest), (kernel, entry) in entries
        entry isa Dict || continue
        get(entry, "status", "") == "ok" || continue
        get(entry, "held_back", false) === true && continue
        # A name callable from a density alone is one this can measure.
        callable = String[]
        for name in vcat([kernel], String[v for v in get(entry, "variants", String[])])
            sym = Symbol(name, endswith(family, "_vxc") ? "_vxc" : "")
            isdefined(LibXcDerivative, sym) || continue
            req = Symbol(sym, "_required")
            isdefined(LibXcDerivative, req) &&
                !isempty(getfield(LibXcDerivative, req)) && continue
            push!(callable, name)
        end
        isempty(callable) && continue
        agreement = get(entry, "agreement", nothing)
        if agreement === nothing
            push!(missing_record, "$family/$kernel")
            continue
        end
        # The inputs are written down beside the numbers. A measurement
        # whose inputs were only described could not be reproduced: that
        # is what happened to the speed figures taken on 10-06.
        @test haskey(agreement, "inputs")
        @test haskey(agreement, "libxc")
        for name in callable
            haskey(agreement, name) || (push!(missing_record, "$family/$name"); continue)
            push!(recorded, name)
            slots = endswith(family, "_vxc") ? ("vrho", "v2rho2") :
                                               ("zk", "vrho", "v2rho2")
            for slot in slots
                @test haskey(agreement[name], slot)
                # Three figures, always: the absolute difference, that
                # difference over the largest value the slot takes in the
                # sweep, and the worst per-point ratio. Recording one of
                # them is how a relative 1.3e-9 came to be read against
                # atol=1e-10; recording only the scaled relative one is
                # optimistic where a slot is small at one point and large
                # at another, by a factor of 71 at third order.
                @test length(agreement[name][slot]) == 3
                @test all(x -> x isa Real && isfinite(x) && x >= 0,
                          agreement[name][slot])
                # The pointwise ratio divides the same difference by a
                # value no larger, so it is never the smaller of the two.
                @test agreement[name][slot][3] >= agreement[name][slot][2]
            end
        end
    end
    # One name has no record, and cannot: mgga_x_2d_prp10 is a kernel
    # whose own name Libxc does not register (the only functional built
    # on it is mgga_x_2d_prhg07_prp10), so there is nothing to measure it
    # against. Asserted by name rather than skipped, because "no record"
    # and "no counterpart in Libxc" have to stay distinguishable.
    @test sort(missing_record) == ["mgga_vxc/mgga_x_2d_prp10"]
    # The corpus is in the hundreds; a record for a handful would mean the
    # pass had not been run.
    @test length(recorded) > 500

    # And the figures themselves are bounded, which is the claim this
    # package makes turned into a gate instead of a sentence. Measured
    # across 531 names on 2026-10-08: the worst absolute difference is
    # 1.24e-9 on zk (gga_x_beefvdw), 1.65e-9 on vrho (the same), and
    # 1.26e-8 on v2rho2 (again the same), and the worst relative one is
    # 2.1e-9, 1.0e-9 and 3.0e-9 on those three. The bounds below leave
    # roughly a decade over that, so a regression anywhere in the corpus
    # trips one assertion rather than going unnoticed until someone
    # measures by hand.
    #
    # The pointwise ratio, recorded since 2026-10-15, is bounded here too
    # and sits close to the scaled one at these orders: 2.9e-9 on zk
    # (hyb_mgga_x_m06_hf), 2.6e-9 on vrho (mgga_c_m08_hx) and 3.9e-9 on
    # v2rho2 (hyb_mgga_x_m08_hx). It is at third and fourth order that the
    # two part company, which is what high_agreement records.
    #
    # The functionals at the top of that list are the ones already known
    # to lose significance (gga_x_beefvdw and the Minnesota M05/M06/M08
    # series), and most of them are named in LIBXC_LOOSE_AGREEMENT for
    # the same reason.
    worst = Dict("zk" => 0.0, "vrho" => 0.0, "v2rho2" => 0.0)
    worst_rel = Dict("zk" => 0.0, "vrho" => 0.0, "v2rho2" => 0.0)
    worst_point = Dict("zk" => 0.0, "vrho" => 0.0, "v2rho2" => 0.0)
    for (family, entries) in manifest_families(manifest), (_, entry) in entries
        entry isa Dict || continue
        agreement = get(entry, "agreement", nothing)
        agreement === nothing && continue
        for (name, slots) in agreement
            slots isa Dict || continue
            for (slot, figures) in slots
                haskey(worst, slot) || continue
                worst[slot] = max(worst[slot], figures[1])
                worst_rel[slot] = max(worst_rel[slot], figures[2])
                worst_point[slot] = max(worst_point[slot], figures[3])
            end
        end
    end
    @test worst["zk"] < 1e-8
    @test worst["vrho"] < 1e-8
    @test worst["v2rho2"] < 1e-7
    @test worst_rel["zk"] < 1e-8
    @test worst_rel["vrho"] < 1e-8
    @test worst_rel["v2rho2"] < 1e-8
    @test worst_point["zk"] < 1e-8
    @test worst_point["vrho"] < 1e-8
    @test worst_point["v2rho2"] < 1e-8
end
