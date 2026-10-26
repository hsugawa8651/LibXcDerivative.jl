# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

# The manifest's families, without its top-level provenance keys. It holds
# upstream_commit, upstream_version and generated_at at the top, so iterating
# it directly hands a String where a table is expected, which showed up as
# a BoundsError on a Char, the destructuring of "7.1.2" one character at a
# time. Going through this means the next key added at the top does not break
# seven loops.
manifest_families(m) = [(k, v) for (k, v) in m if v isa AbstractDict]

@testset "the manifest says once which Libxc the corpus came from" begin
    # Every entry carries upstream_commit, 441 of them, which answers the
    # question per functional and leaves the corpus-wide one to be inferred
    # from 441 copies. Nothing checked that they agreed, and a partial
    # regeneration is exactly what would leave them disagreeing: the
    # generator writes the commit it sees now onto the names it regenerated
    # and carries the rest over.
    #
    # So the provenance is stated once at the top, where a reader looks
    # first, and the per-entry copies are checked against it.
    manifest = TOML.parsefile(joinpath(pkgdir(LibXcDerivative), "src",
                                       "generated", "manifest.toml"))
    @test haskey(manifest, "upstream_commit")
    @test haskey(manifest, "upstream_version")
    @test haskey(manifest, "generated_at")
    @test manifest["upstream_commit"] isa String
    @test length(manifest["upstream_commit"]) == 40
    # A version, because a commit identifies without saying anything: 7.1.2
    # is what a reader compares against a release, and the commit is what
    # makes it exact.
    @test occursin(r"^\d+\.\d+\.\d+$", manifest["upstream_version"])

    # And every entry agrees with it, which is the check that was missing.
    families = [v for (k, v) in manifest if v isa AbstractDict]
    @test length(families) == 7
    n = 0
    for family in families, (_, entry) in family
        entry isa AbstractDict && haskey(entry, "upstream_commit") || continue
        @test entry["upstream_commit"] == manifest["upstream_commit"]
        n += 1
    end
    @test n == 441
end

@testset "the manifest carries no path from the machine that wrote it" begin
    # The manifest ships with the package, and what it records for a
    # functional that failed is the error the generator saw: including,
    # until this gate, absolute paths out of the maintainer's home
    # directory. They say nothing a reader can use and name a machine
    # that is not theirs, so the generator rewrites them before writing.
    text = read(joinpath(pkgdir(LibXcDerivative), "src", "generated",
                         "manifest.toml"), String)
    leaks = unique([first(m.match, 60)
                    for m in eachmatch(r"(?:~|/(?:Users|home))/[^/\s\"]+/[^\s\"]*",
                                       text)])
    @test leaks == String[]
end

@testset "the manifest carries each name's third and fourth derivatives" begin
    # The orders above second are measured against a MAXORDER=4 build of
    # the pinned source, which is a build of our own: the library
    # Libxc.jl vendors stops at second order, so this record has no
    # counterpart the suite can call. It is written per name because at
    # these orders a corpus-wide bound cannot be had -- the figures span
    # decades from one name to the next -- and the gates below are what
    # keeps the record from going stale.
    manifest = TOML.parsefile(joinpath(pkgdir(LibXcDerivative), "src",
                                       "generated", "manifest.toml"))
    names_per_family = Dict{String,Int}()
    worst_scaled = 0.0
    worst_scaled_at = ""
    slots_seen = 0
    wrong_order = String[]
    wrong_shape = String[]
    wrong_ratio = String[]
    blown = Tuple{String,Float64}[]
    for (family, entries) in manifest_families(manifest), (_, entry) in entries
        entry isa Dict || continue
        high = get(entry, "high_agreement", nothing)
        high === nothing && continue
        # The inputs and the library are written beside the numbers, and
        # the note says MAXORDER=4: a figure from the vendored library
        # could not reach these orders at all, so the two records must
        # stay distinguishable by what is in them.
        @test haskey(high, "inputs")
        @test occursin("MAXORDER=4", high["libxc"])
        for (name, slots) in high
            slots isa Dict || continue
            names_per_family[family] = get(names_per_family, family, 0) + 1
            for (slot, figures) in slots
                # Collected rather than asserted one slot at a time: the
                # record holds 12,720 of them, and four assertions apiece
                # would be two and a half times the rest of the suite. A
                # name in the list is what a failure needs anyway.
                startswith(slot, "v3") || startswith(slot, "v4") ||
                    push!(wrong_order, "$name/$slot")
                if length(figures) != 3 ||
                        !all(x -> x isa Real && isfinite(x) && x >= 0, figures)
                    push!(wrong_shape, "$name/$slot")
                elseif figures[3] < figures[2]
                    push!(wrong_ratio, "$name/$slot")
                else
                    slots_seen += 1
                    if figures[2] > worst_scaled
                        worst_scaled = figures[2]
                        worst_scaled_at = "$name/$slot"
                    end
                    # Kept to be asserted on below rather than bounded here.
                    figures[3] > 1e-3 &&
                        push!(blown, ("$name/$slot", figures[2]))
                end
            end
        end
    end
    # Only the orders the vendored library cannot reach; three figures
    # each, finite and non-negative; and the pointwise ratio divides the
    # same difference by a value no larger, so it is never the smaller.
    @test isempty(wrong_order)
    @test isempty(wrong_shape)
    @test isempty(wrong_ratio)
    @test slots_seen > 10_000
    # All three families that have an energy to differentiate are in the
    # record; the *_vxc families are absent by construction, since the
    # expressions there are potentials, so the orders are shifted by one.
    #
    # Four kernels in those three families have no record either, and the
    # reason is upstream's rather than ours: gga_x_wpbeh, mgga_x_r2scan,
    # mgga_c_r2scan and mgga_x_r4scan are capped at second order in
    # Libxc's generator because their piecewise junctions are only C2
    # there, so the MAXORDER=4 build has nothing above second order to
    # compare against. Our own expressions differentiate straight through
    # those junctions and will return a third or fourth derivative that
    # Libxc considers meaningless; docs/src/limits.md says so.
    @test sort(collect(keys(names_per_family))) ==
          ["gga_exc", "lda_exc", "mgga_exc"]
    @test sum(values(names_per_family)) > 500

    # The scaled relative figure is the one that can be bounded. Measured
    # across 530 names on 2026-10-16, the worst is 4.38e-6
    # (mgga_x_br89_explicit, v4rhotau3), where a BigFloat evaluation
    # shows the expression itself is ill conditioned rather than either
    # side being wrong. The bound leaves a factor of two over that, which
    # is as much slack as a figure this close to the top of the record
    # can be given.
    @test worst_scaled < 1e-5
    @test worst_scaled_at == "mgga_x_br89_explicit/v4rhotau3"

    # The absolute figure is *not* bounded, and deliberately not asserted
    # on: the worst is 0.345 (mgga_x_br89_explicit, v4sigma4), because a
    # fourth derivative is simply large there. An absolute bound is the
    # wrong instrument at these orders.
    #
    # Neither is the pointwise ratio bounded, for the opposite reason: it
    # divides by the reference value at each point, and at these orders a
    # slot passes through zero, so the ratio runs away. Four slots are
    # above 1 and one reaches 2.5e+51 (gga_x_pbepow, v3sigma3) with an
    # absolute difference of 9.6e-12. What can be asserted is that every
    # such blow-up is a reference near zero rather than a disagreement:
    # where the ratio is above 1e-3, the scaled figure stays below 1e-9
    # (the worst among those 24 slots is 9.0e-11).
    @test !isempty(blown)
    @test isempty([n for (n, scaled) in blown if scaled >= 1e-9])
end

@testset "which Libxc sources the expressions were translated from" begin
    # This package calls no Libxc at run time, which is the point of it, and
    # that is exactly why the question "which Libxc is this?" has to be
    # answerable from inside: there is no library to ask for a version. The
    # answer is the Libxc commit the expressions were generated from and
    # the version that tree calls itself, written into the package by the
    # generator.
    #
    # The same statement is in the README and in two documentation pages,
    # which is the shape of claim that goes stale: the three have to be the
    # same statement, and this is the one that is executed.
    @test libxc_source_version() isa VersionNumber
    @test libxc_source_commit() isa String

    manifest = TOML.parsefile(joinpath(pkgdir(LibXcDerivative), "src",
                                       "generated", "manifest.toml"))
    @test libxc_source_version() == VersionNumber(manifest["upstream_version"])
    @test libxc_source_commit() == manifest["upstream_commit"]
    # A full commit, not an abbreviation: an abbreviation is ambiguous in a
    # repository the size of Libxc's, and shortening it is the caller's to do.
    @test occursin(r"^[0-9a-f]{40}$", libxc_source_commit())

    # Constants, so asking costs nothing and nothing is read at call time.
    @test @inferred(libxc_source_version()) isa VersionNumber
    @test @inferred(libxc_source_commit()) isa String

    # And the version is the pinned tree's own, which is newer than the
    # library Libxc.jl vendors -- the difference the correction list exists
    # for.
    @test libxc_source_version() > v"7.0.0"
end
