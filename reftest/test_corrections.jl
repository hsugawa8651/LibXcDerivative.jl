#!/usr/bin/env julia
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

# Which functionals upstream changed after the release Libxc.jl vendors.
#
#     julia --project=reftest reftest/test_corrections.jl
#
# The suite in test/ excludes a list of names from its comparison against
# the vendored library, on the grounds that the vendored library is the one
# out of date. It cannot check that claim: it has one library to call, so
# "upstream changed this functional" and "this package translated it wrongly"
# look the same from there -- both are a disagreement with the only reference
# in the room. Five names sat excluded with no cause recorded for that
# reason.
#
# Here both libraries are callable, and the question separates. The vendored
# 7.0.0 comes through Libxc.jl, the pinned sources through the build under
# gen/build, and the three answers are compared at the same points:
#
#   * the libraries disagree and this package agrees with the pinned one
#     -> upstream changed the functional, and the exclusion is earned;
#   * the libraries agree and this package does not
#     -> the translation is the odd one out, and no exclusion is justified.
#
# So this file is what makes the list in test/corrected_after_7_0_0.jl a
# measurement rather than a reading of the ChangeLog, and what fails when a
# the pin moves to a commit that corrects another functional.
#
# The sweep is over the identifiers that have an energy, which is where the
# list's names are. The potential-only ones are not covered here:
# mgga_x_2d_prhg07_prp10, which the vendored library computes as a different
# function after a missing XC_NEEDS_TAU flag was added upstream, is held by a
# testset of its own in test/generated_values.jl instead.

using Test
using LibXcDerivative
using Libxc
using ForwardDiff
using TOML

const HERE = normpath(joinpath(@__DIR__, "..", "gen"))
const GENERATED_DIR = normpath(joinpath(@__DIR__, "..", "src", "generated"))
include(joinpath(HERE, "pinned.jl"))
include(joinpath(@__DIR__, "..", "test", "corrected_after_7_0_0.jl"))

# The same three densities the suite and the agreement records use.
const POINTS = [(rho, 0.1rho, 0.05rho, 0.3rho) for rho in (0.05, 0.5, 5.0)]

# The three names the package gives an absolute floor to, in
# LIBXC_PLATFORM_FLOOR. Nothing upstream changed for them: all three pairs
# of implementations differ by about the same amount, and that amount is
# where these expressions run out of significance. Measured at rho = 5, in
# absolute terms, with the energy around 0.1:
#
#   name                 |ours-pinned|  |ours-vendored|  |pinned-vendored|
#   hyb_mgga_x_m05           2.1e-10         2.2e-11          2.4e-10
#   hyb_mgga_x_m08_hx        1.7e-10         5.0e-11          1.2e-10
#   mgga_c_m08_hx            3.1e-10         1.8e-11          2.9e-10
#
# Which pair looks worst is the machine, not the functional: the pair the
# suite measures is the closest of the three here and crosses the strict
# bound elsewhere, which is what the floor is for. They are the same
# Minnesota significance loss that LIBXC_LOOSE_AGREEMENT records for
# m08_so, m06_hf and four others; what keeps them out of that table is that
# they lose to rounding rather than to cancellation, so the bound they need
# is absolute and not relative.
#
# The floor is wider than any of the figures above, so these three cannot
# come out of the sweep below as a disagreement at all. That is asserted
# where the sweep is read, not assumed here.
const AT_THE_FLOOR = ("hyb_mgga_x_m05", "hyb_mgga_x_m08_hx", "mgga_c_m08_hx")

# What counts as a disagreement is the suite's own rule, not a figure chosen
# here: `agrees_with_libxc` holds a functional to atol=1e-10, unless
# LIBXC_PLATFORM_FLOOR gives it a wider absolute bound or
# LIBXC_LOOSE_AGREEMENT a relative one, and a mix inherits its components'.
# Any other threshold answers a different question: a flat 1e-10 relative
# flags the whole KCIS and Minnesota set, whose significance loss the suite
# accepts by name, and would have this file demanding exclusions the suite
# does not need.
agrees(a, b, name) = LibXcDerivative.agrees_with_libxc(a, b, name)

"""
    pinned_zk(name, rho, sigma, lapl, tau) -> Float64 | nothing

The energy per particle the pinned library returns, by the family Libxc says
the functional belongs to rather than by the manifest: a mix has no entry of
its own there, while the library evaluates it like anything else.
"""
function pinned_zk(name, rho, sigma, lapl, tau)
    fam = libxc_family(Symbol(name))
    family = fam === :lda ? "lda_exc" : fam === :gga ? "gga_exc" : "mgga_exc"
    slots = pinned_slots(family, name, rho, sigma, lapl, tau)
    slots === nothing ? nothing : get(slots, "zk", nothing)
end

function vendored_zk(name, rho, sigma, lapl, tau)
    fun = try
        Libxc.Functional(Symbol(name))
    catch
        return nothing          # absent from the vendored library
    end
    fam = libxc_family(Symbol(name))
    try
        if fam === :mgga || fam === :mggal
            only(Libxc.evaluate(fun; rho=reshape([rho], 1, 1),
                                sigma=reshape([sigma], 1, 1),
                                lapl=reshape([lapl], 1, 1),
                                tau=reshape([tau], 1, 1),
                                derivatives=0:0).zk)
        elseif fam === :gga
            only(Libxc.evaluate(fun; rho=reshape([rho], 1, 1),
                                sigma=reshape([sigma], 1, 1),
                                derivatives=0:0).zk)
        else
            only(Libxc.evaluate(fun; rho=reshape([rho], 1, 1),
                                derivatives=0:0).zk)
        end
    catch
        nothing
    end
end

function ours_zk(name, rho, sigma, lapl, tau)
    f = getfield(LibXcDerivative, Symbol(name))
    fam = libxc_family(Symbol(name))
    try
        fam === :lda ? f(rho) :
        fam === :gga ? f(rho, sigma) : f(rho, sigma, lapl, tau)
    catch
        nothing
    end
end

reldiff(a, b) = (a === nothing || b === nothing || !isfinite(a) || !isfinite(b)) ?
                nothing : abs(a - b) / max(abs(b), 1e-300)

"""
    survey() -> (changed, changed_abs, mistranslated, compared)

Sweep every identifier this package ships with an energy, and report the
names where the two libraries disagree (`changed` relative, `changed_abs`
absolute), the names where they agree while this package does not
(`mistranslated`), and how many were compared at all.

Both figures for the disagreement, because the strict tier is an absolute
bound while a table of names is easier to read as relative: `mgga_c_m08_hx`
is 2.9e-10 apart on an energy of 0.155, which is 1.9e-09 the other way.
"""
function survey()
    changed = Dict{String,Float64}()
    changed_abs = Dict{String,Float64}()
    mistranslated = Dict{String,Float64}()
    compared = 0
    for id in available_identifiers()
        name = String(id)
        isdefined(LibXcDerivative, id) || continue
        has_exc(id) || continue
        req = Symbol(id, :_required)
        isdefined(LibXcDerivative, req) &&
            !isempty(getfield(LibXcDerivative, req)) && continue
        libs_differ = false
        ours_differs = false
        worst_libs = 0.0
        worst_libs_abs = 0.0
        worst_ours = 0.0
        seen = false
        for (rho, sigma, lapl, tau) in POINTS
            v = vendored_zk(name, rho, sigma, lapl, tau)
            v === nothing && break
            p = pinned_zk(name, rho, sigma, lapl, tau)
            o = ours_zk(name, rho, sigma, lapl, tau)
            (p === nothing || o === nothing) && break
            dl = reldiff(p, v)
            do_ = reldiff(o, p)
            (dl === nothing || do_ === nothing) && break
            seen = true
            worst_libs = max(worst_libs, dl)
            worst_libs_abs = max(worst_libs_abs, abs(p - v))
            worst_ours = max(worst_ours, do_)
            agrees(p, v, name) || (libs_differ = true)
            agrees(o, p, name) || (ours_differs = true)
        end
        seen || continue
        compared += 1
        if libs_differ
            changed[name] = worst_libs
            changed_abs[name] = worst_libs_abs
        end
        !libs_differ && ours_differs && (mistranslated[name] = worst_ours)
    end
    return (changed, changed_abs, mistranslated, compared)
end

@testset "what upstream changed after the release Libxc.jl vendors" begin
    ensure_pinned_libxc()
    changed, changed_abs, mistranslated, compared = survey()

    # The sweep has to reach most of the corpus for its silence to mean
    # anything. What it does not reach is a functional the vendored library
    # does not have at all, or one of the five this package cannot evaluate.
    @test compared > 600

    @testset "every name the suite excludes is one the libraries disagree on" begin
        # A release that caught the vendored library up on one of these, or
        # an entry put here from a reading of the ChangeLog that the numbers
        # do not support, fails this.
        for name in CORRECTED_AFTER_7_0_0
            @test haskey(changed, name)
        end
    end

    @testset "and every name they disagree on is accounted for" begin
        # The other direction, which is what makes a move of the pin that
        # corrects another functional fail here rather than somewhere
        # downstream. Three kinds of name come out of the sweep, and all
        # three are named rather than bounded:
        #
        #   * the list itself;
        #   * a mix holding one of its components, which the suite excludes
        #     through `<name>_components` rather than by name -- the five HSE
        #     entry points and LC-wPBE hold gga_x_wpbeh, and
        #     hyb_gga_xc_hjs_b97x holds gga_x_hjs_b97x;
        #   * three Minnesota names the floor covers, which come out of the
        #     sweep as agreement rather than as a disagreement.
        inherits(name) =
            isdefined(LibXcDerivative, Symbol(name, :_components)) &&
            any(string(c[2]) in CORRECTED_AFTER_7_0_0
                for c in getfield(LibXcDerivative, Symbol(name, :_components)))
        unexplained = [name for name in sort(collect(keys(changed)))
                       if !(name in CORRECTED_AFTER_7_0_0) && !inherits(name) &&
                          !(name in AT_THE_FLOOR)]
        @test isempty(unexplained)
        # The three the floor covers go the other way. `agrees` is the
        # package's own rule, and the floor is wider than the difference
        # between any two of the three implementations, so the sweep reads
        # them as agreement: a real correction to one of them would be
        # orders of magnitude larger and would appear here.
        #
        # Checked that they were compared before checking that they are
        # quiet, because a name the vendored library does not have is quiet
        # for a different reason, and this testset would then be reporting
        # that it looked rather than that it found nothing.
        for name in AT_THE_FLOOR
            @test pinned_zk(name, 5.0, 0.5, 0.25, 1.5) !== nothing
            @test vendored_zk(name, 5.0, 0.5, 0.25, 1.5) !== nothing
            @test !haskey(changed, name)
        end
    end

    @testset "and this package follows the pinned library, not the other" begin
        # The other half of the question, and the one that says the
        # exclusions are not this package excusing itself: for each of them,
        # the difference against the pinned sources is at the rounding
        # floor: the worst is 7.5e-15 (lda_c_1d_loos).
        for name in CORRECTED_AFTER_7_0_0
            worst = 0.0
            for (rho, sigma, lapl, tau) in POINTS
                d = reldiff(ours_zk(name, rho, sigma, lapl, tau),
                            pinned_zk(name, rho, sigma, lapl, tau))
                d === nothing && continue
                worst = max(worst, d)
            end
            @test worst < 1e-13
        end
    end

    @testset "no functional is excluded that this package simply gets wrong" begin
        # The failure mode the suite cannot see from where it stands: the
        # libraries agree and this package does not. Nothing in the corpus
        # does this, and a name that started doing it would belong in a
        # correction here, never in the exclusion list.
        @test isempty(mistranslated)
    end

    # Printed as well as asserted, because the figures are the reason the
    # list reads the way it does and a run should show them.
    println("compared ", compared, " identifiers against both libraries")
    for name in sort(collect(keys(changed)))
        println("  changed upstream: ", rpad(name, 22), changed[name])
    end
end
