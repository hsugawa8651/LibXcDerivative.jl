#!/usr/bin/env julia
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

# Tests for the third and fourth derivative comparison in gen/pinned.jl.
#
#     julia --project=reftest reftest/test_pinned.jl
#
# These need a MAXORDER=4 build of the pinned sources, which is what reaches
# past the second derivative: the default build stops at MAXORDER=2 and the
# build Libxc.jl vendors stops there too, so nothing else in this repository
# can check an order above the second against Libxc at all. No PyCall, as
# everywhere under reftest/.

using Test
using LibXcDerivative
using ForwardDiff
using TOML

# The two paths pinned.jl expects its includer to define, as compare.jl does.
const HERE = normpath(joinpath(@__DIR__, "..", "gen"))
const GENERATED_DIR = normpath(joinpath(@__DIR__, "..", "src", "generated"))
include(joinpath(HERE, "pinned.jl"))

@testset "third and fourth derivatives against a MAXORDER=4 build" begin

    @testset "lda_x" begin
        got = pinned_high_slots("lda_exc", "lda_x", 0.5, 0.1, 0.0, 0.15)
        @test got !== nothing
        @test sort(collect(keys(got))) == ["v3rho3", "v4rho4"]
        @test got["v3rho3"] ≈ xc_kxc(lda_x, :v3rho3, 0.5) atol=1e-10
        @test got["v4rho4"] ≈ xc_lxc(lda_x, :v4rho4, 0.5) atol=1e-10
    end

    @testset "the slot set is the one Libxc names, per family" begin
        for (family, name, prefix) in (("lda_exc", "lda_x", :lda),
                                       ("gga_exc", "gga_x_pbe", :gga),
                                       ("mgga_exc", "mgga_x_scan", :mgga))
            got = pinned_high_slots(family, name, 0.5, 0.05, 0.0, 0.15)
            expected = sort(String[String(s) for s in
                                   (slot_names(prefix, 3)..., slot_names(prefix, 4)...)])
            @test sort(collect(keys(got))) == expected
        end
    end

    @testset "a *_vxc family is refused rather than compared" begin
        @test pinned_high_slots("gga_vxc", "gga_x_lb", 0.5, 0.05, 0.0, 0.15) === nothing
        @test shipped_high_slots("gga_vxc", "gga_x_lb", 0.5, 0.05, 0.0, 0.15) === nothing
    end

    @testset "high_agreement_for: a GGA and a meta-GGA agree slot by slot" begin
        # On the relative figure, not the absolute one. A fourth-order slot is
        # enormous where the gradient is small: `gga_x_pbe`'s `v4sigma4` is
        # about 3e4 at these points, so an absolute difference of 1.1e-9 is a
        # relative 3.6e-14. Holding an absolute threshold here is the mistake
        # `agreement_for` records for `hyb_mgga_x_m08_so`, one order up.
        #
        # The bounds below are these two kernels and their variants, and
        # nothing more. A sweep of all three families, 503 names with a third
        # or fourth derivative to compare, puts 94 of them above 1e-12 and the
        # worst at 4.4e-06 (`mgga_x_br89_explicit`, `v4rhotau3`); a `BigFloat`
        # evaluation of the same expression shows that neither side is at
        # fault there, the kernel is simply too ill conditioned for a fourth
        # derivative in double precision. Read as a corpus-wide bound these
        # numbers would be wrong by six orders of magnitude.
        #
        # Measured: 3.58e-14 for the `gga_x_pbe` kernel and 1.33e-14 for the
        # `mgga_x_scan` kernel. Over everything the same call returns, 18
        # names for the first and 2 for the second, the worst is 2.68e-11
        # (`gga_x_t_pbe2`, `v4sigma4`), which is why the second bound is two
        # orders looser than the first and not the 2.30e-13 written here
        # before: that figure came from a measurement over part of the
        # variants, and the bound set from it had never been run.
        for (family, kernel) in (("gga_exc", "gga_x_pbe"),
                                 ("mgga_exc", "mgga_x_scan"))
            r = high_agreement_for(family, kernel)
            @test !isempty(r)
            @test haskey(r, kernel)
            @test maximum(v[2] for v in values(r[kernel])) < 1e-12
            # The variants come back from the same call, so checking them
            # costs nothing beyond the comparison already made.
            @test maximum(v[2] for slots in values(r) for v in values(slots)) < 1e-10
        end
    end

    @testset "the measure is recorded three ways, not one" begin
        # `worst_abs / max|ref|` is the figure these tables have carried, and
        # it is optimistic where a slot is small at one point and large at
        # another: dividing the worst difference by the largest value the slot
        # takes anywhere in the sweep hides how badly the small point did.
        # Measured on `gga_x_beefvdw`, whose `v3rhosigma2` reports 5.92e-08
        # scaled and 4.23e-06 pointwise, a factor of 71, and whose
        # `v4rho2sigma2` reaches 334; a `BigFloat` evaluation says the
        # expression itself is ill conditioned there, so the pointwise figure
        # is the one that describes what a caller gets.
        #
        # Both are kept. The pointwise ratio is the one that blows up at a
        # zero crossing (`gga_c_pbe`'s `v2rho2` crosses at rho = 0.735, where
        # a difference at the rounding floor reads as 1.3e-10), which is why
        # the scaled figure exists and why neither replaces the other.
        r = high_agreement_for("gga_exc", "gga_x_beefvdw")
        @test !isempty(r)
        figures = r["gga_x_beefvdw"]["v3rhosigma2"]
        @test length(figures) == 3
        @test all(x -> x isa Real && isfinite(x) && x >= 0, figures)
        # Pointwise is never below scaled: the same worst difference is
        # divided by a value no larger than the one the scaled figure uses.
        @test figures[3] >= figures[2]
        # And here it is 71 times larger, which is the whole reason for
        # carrying it.
        @test figures[3] > 20 * figures[2]
        @test figures[2] ≈ 5.923e-8 rtol=0.01
        @test figures[3] ≈ 4.233e-6 rtol=0.01

        # The ordering holds everywhere, not only where it is interesting.
        # Counted rather than asserted slot by slot: these two kernels carry
        # 20 names and 55 slots each at these two orders, and a thousand
        # passing assertions say no more than one does.
        function count_violations()
            bad = 0
            total = 0
            for (family, kernel) in (("lda_exc", "lda_x"), ("gga_exc", "gga_x_pbe"))
                for (_, slots) in high_agreement_for(family, kernel),
                    (_, f) in slots
                    total += 1
                    (length(f) == 3 && f[3] >= f[2]) || (bad += 1)
                end
            end
            return (bad, total)
        end
        bad, total = count_violations()
        @test total > 100
        @test bad == 0
    end

    @testset "no name has got further from the library than the record says" begin
        # What the per-name record in the manifest is for. A single bound
        # cannot be had at these orders -- the three families' medians span
        # three decades and the worst case is 4.4e-06 on an expression that
        # is ill conditioned rather than wrong -- so the question a test can
        # ask is not "is everything below X" but "is anything worse than it
        # was". `record_high_agreement!` writes the figures and this reads
        # them back.
        #
        # Measured live for two kernels rather than for the corpus: recording
        # the whole corpus is hours of wall clock, and these two carry 20
        # names and 57 slots between them. Slack of 1.5 on the scaled figure,
        # since the comparison is against the same build and the same
        # expressions and should reproduce exactly; what it leaves room for
        # is a different compiler's rounding, not a change in the kernels.
        #
        # The gate is the record's own size and not a number written here:
        # every name and slot the record covers has to come back from the
        # live measurement, which has teeth whether the corpus has been
        # recorded in full or one family at a time, and an empty record
        # fails rather than passing vacuously.
        manifest = TOML.parsefile(MANIFEST_PATH)
        function check_against_record()
            worse = String[]
            missed = String[]
            changed = 0
            compared = 0
            in_record = 0
            for (family, kernel) in (("lda_exc", "lda_x"), ("gga_exc", "gga_x_pbe"))
                entry = get(manifest[family][kernel], "high_agreement", nothing)
                entry === nothing && continue
                for (name, recorded) in entry
                    recorded isa AbstractDict || continue   # inputs, libxc, ...
                    in_record += length(recorded)
                end
                for (name, slots) in high_agreement_for(family, kernel)
                    recorded = get(entry, name, nothing)
                    recorded === nothing && continue
                    for (slot, figures) in slots
                        r = get(recorded, slot, nothing)
                        r === nothing && continue
                        compared += 1
                        figures[2] == r[2] || (changed += 1)
                        figures[2] <= max(1.5 * r[2], 1e-16) ||
                            push!(worse, "$name/$slot")
                    end
                end
            end
            return (worse, changed, compared, in_record)
        end
        worse, changed, compared, in_record = check_against_record()
        @test in_record > 0
        @test compared == in_record
        @test isempty(worse)
        # And it reproduces exactly, which is the stronger statement the
        # slack above does not make. Counted rather than asserted per slot,
        # because a legitimate improvement would show up here and should be
        # read rather than fail.
        @test changed == 0
    end

    @testset "an order the build does not have is skipped, not asked for" begin
        # Libxc answers a derivative it does not implement by calling abort():
        # xc_gga_lxc on gga_c_gapc prints "Functional 'GapC' does not provide
        # an implementation of lxc" and takes the process with it. This test
        # passing at all is the gate working; it fails by killing the run.
        got = pinned_high_slots("gga_exc", "gga_c_gapc", 0.5, 0.05, 0.0, 0.15)
        @test got !== nothing
        @test sort(collect(keys(got))) == sort(String[String(s) for s in slot_names(:gga, 3)])
        @test !any(startswith(k, "v4") for k in keys(got))
    end

    # A kernel shared by variants that differ in their parameters has no
    # entry point of its own, so there is nothing on this side to call for
    # the kernel's own name, while the variants that carry the numbers do
    # have one. lda_c_1d_css stood here until the params reader learned to
    # read a struct's leading run of doubles, and mgga_c_m06l before that;
    # no kernel is left whose variants have nothing either.
    @testset "a kernel whose parameters have no default has nothing to compare" begin
        @test shipped_high_slots("lda_exc", "lda_c_epc18", 0.5, 0.05, 0.0, 0.15) === nothing
        records = high_agreement_for("lda_exc", "lda_c_epc18")
        @test !haskey(records, "lda_c_epc18")
        @test sort(collect(keys(records))) == ["lda_c_epc18_1", "lda_c_epc18_2"]
    end
end
