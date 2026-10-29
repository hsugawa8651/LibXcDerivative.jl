#!/usr/bin/env julia
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
#
# Maintainer-only tool, and the second half of a refresh: writes
# src/generated/mixes.jl, the entry points for the Libxc functionals that are
# a weighted sum of kernels this package already has.
#
# Run after the kernels, in a process of its own:
#   cd gen && julia --project=. generate_mixes.jl
#
# A process of its own is the point: the recipes are checked against the
# kernels as they now stand on disk, so this has to load the corpus the
# generator just wrote rather than whatever was loaded before it ran.

include(joinpath(@__DIR__, "generate.jl"))
using LibXcDerivative
using TOML

"""
    available_entry_points() -> Dict(name => family)

Every functional this package can already be called for with a density
alone: kernels whose own name Libxc registers, plus the variant entry
points: read from the manifest and checked against what actually loaded.
"""
function available_entry_points()
    manifest = TOML.parsefile(MANIFEST_PATH)
    out = Dict{String,String}()
    for (family, entries) in manifest
        entries isa Dict || continue
        for (name, entry) in entries
            entry isa Dict || continue
            get(entry, "status", "") == "ok" || continue
            get(entry, "held_back", false) === true && continue
            for candidate in vcat([name], get(entry, "variants", String[]))
                isdefined(LibXcDerivative, Symbol(candidate)) || continue
                required = getfield(LibXcDerivative, Symbol(candidate, "_required"))
                isempty(required) && (out[candidate] = family)
            end
        end
    end
    return out
end

"""
    mix_source(name, family, components, available) -> String

The two entry points for one mixed functional: the sum of its components,
each called with the arguments its own family takes.

The coefficients are written out as Libxc computed them rather than as the
round numbers a paper gives: B3LYP's 0.08 is 1 - 0.92 inside Libxc and
arrives as 0.08000000000000007, and tidying it would make this disagree
with the library it is checked against.
"""
function mix_source(name::AbstractString, family::AbstractString,
                    components::Vector{Tuple{Float64,String}},
                    overrides::Vector{Dict{String,Float64}},
                    available::AbstractDict{String,String})
    _, (unpolarized, polarized) = FAMILY_ENTRY[family]
    io = IOBuffer()
    println(io)
    println(io, "const $(name)_components = (")
    for (i, (coefficient, component)) in enumerate(components)
        over = overrides[i]
        settings = isempty(over) ? "NamedTuple()" :
            "(; " * join(("$k = $(repr(v))" for (k, v) in sort(collect(over))), ", ") * ")"
        println(io, "    ($(repr(coefficient)), :$component, $settings),")
    end
    println(io, ")")
    println(io, "const $(name)_defaults = NamedTuple()")
    println(io, "const $(name)_required = ()")
    for args in (unpolarized, polarized)
        println(io)
        println(io, "function $name(", join(args, ", "), ")")
        terms = String[]
        for (i, (coefficient, component)) in enumerate(components)
            # Each component takes the arguments of its own family, which may
            # be fewer than this functional's: a GGA mix can hold an LDA
            # component, and then only the density is passed on.
            _, (cu, cp) = FAMILY_ENTRY[available[component]]
            take = length(args) == length(unpolarized) ? cu : cp
            over = overrides[i]
            # Libxc does not leave a component at its own defaults: the
            # parent sets its external parameters, and a range-separated
            # hybrid's short-range exchange carries the parent's omega rather
            # than its own. Written out beside the coefficient for that
            # reason: without it the sum is 50 % wrong for cam_pbeh.
            settings = isempty(over) ? "" :
                "; params = (; " *
                join(("$k = $(repr(v))" for (k, v) in sort(collect(over))), ", ") * ")"
            push!(terms, "$(repr(coefficient)) * $component(" *
                         join(args[1:length(take)], ", ") * settings * ")")
        end
        println(io, "    return ", join(terms, " +\n           "))
        println(io, "end")
    end
    println(io)
    println(io, "export $name, $(name)_components, $(name)_defaults, $(name)_required")
    return String(take!(io))
end

"""
    write_mixes(; path) -> Vector{String}

Write `src/generated/mixes.jl` and record what went into it in the
manifest, under a `mix` table of its own: these are not generated from a
python source, so they are not a family.
"""
function write_mixes(; path::AbstractString=joinpath(GENERATED_DIR, "mixes.jl"))
    ensure_pinned_libxc()
    # The components' parameter struct layouts are read from the kernels'
    # own python modules, so the upstream python has to be importable here
    # too: not only in the process that generated the kernels.
    setup_python_path!()
    available = available_entry_points()
    println("entry points already available: ", length(available))
    mixes = emitted_mixes(available)
    println("mixed functionals that reproduce the pinned library: ", length(mixes))

    open(path, "w") do io
        println(io, "# Auto-generated by gen/generate_mixes.jl from libxc-upstream")
        println(io, "# -- do not edit by hand.")
        println(io, "#")
        println(io, "# Libxc evaluates these by mixing others rather than from a kernel of")
        println(io, "# their own, and the recipe -- which functionals, with which")
        println(io, "# coefficients -- is read from the pinned library at generation time")
        println(io, "# and written out here. Only the ones whose every component this")
        println(io, "# package already has, and which reproduce the library's own energy")
        println(io, "# density at three densities, are written: see emitted_mixes in")
        println(io, "# gen/generate.jl.")
        println(io, "#")
        println(io, "# This Source Code Form is subject to the terms of the Mozilla Public")
        println(io, "# License, v. 2.0. If a copy of the MPL was not distributed with this")
        println(io, "# file, You can obtain one at http://mozilla.org/MPL/2.0/.")
        for (name, family, components, overrides) in mixes
            print(io, mix_source(name, family, components, overrides, available))
        end
    end
    println("Wrote ", path)

    manifest = isfile(MANIFEST_PATH) ? TOML.parsefile(MANIFEST_PATH) : Dict{String,Any}()
    table = Dict{String,Any}()
    commit = upstream_commit()
    for (name, family, components, overrides) in mixes
        # Recorded per entry, not once at the top level: the rest of the
        # manifest is a table of tables, and a bare string beside them makes
        # every `for (family, entries) in manifest, (name, entry) in entries`
        # iterate that string's characters instead (which is exactly what it
        # did, in three testsets at once, when this was written the other way).
        table[name] = Dict{String,Any}(
            "family" => family,
            "components" => [[c, n] for (c, n) in components],
            "overrides" => [Dict{String,Any}(k => v for (k, v) in o) for o in overrides],
            "generated_at" => Dates.format(Dates.now(), "yyyy-mm-ddTHH:MM:SS"),
            "upstream_commit" => commit)
    end
    manifest["mix"] = table
    # Every value at the top of the manifest is a table of entries. A bare
    # one beside them is not just untidy: `for (family, entries) in manifest,
    # (name, entry) in entries` then iterates that value's characters, which
    # broke three testsets at once the first time this wrote one.
    for (key, value) in collect(manifest)
        value isa Dict || delete!(manifest, key)
    end
    # Written back after that sweep, which is what took them out: the three
    # keys write_manifest states once at the top are strings, so a mixes-only
    # refresh left the file with no corpus-wide commit, version or time at
    # all, and test/manifest.jl asks for all three. A refresh of the mixes
    # is a write of this file, so it stamps them the way the other writer
    # does.
    manifest["upstream_commit"] = commit
    manifest["upstream_version"] = join(string.(pinned_libxc_version()), ".")
    manifest["generated_at"] = Dates.format(Dates.now(),
                                            Dates.dateformat"yyyy-mm-dd\THH:MM:SS")
    open(MANIFEST_PATH, "w") do io
        # The same header write_manifest writes, so that a refresh of the
        # kernels and a refresh of the mixes leave the same file.
        println(io, "# Generated functionals: what was produced, from which upstream")
        println(io, "# commit, and in what positional argument order. Written by")
        println(io, "# gen/generate.jl -- do not edit by hand.")
        TOML.print(io, manifest; sorted=true)
    end
    println("manifest: ", MANIFEST_PATH, " (mix: ", length(mixes), ")")
    return first.(mixes)
end

"""
    write_mixing_parameters(served; path) -> Int

Write `src/generated/mixing_parameters.jl`: for every functional this package
serves, what Libxc keeps beside it rather than inside a kernel.

Only the functionals that have something to say are written: a hybrid, a
range-separated hybrid or a VV10 functional. For everything else the three
flags are false and the five numbers are zero, which the package layer
supplies without a table entry.

`served` is every name a caller can reach, which is why this runs here: the
mix entry points are part of that set and do not exist until `write_mixes`
has written them.
"""
function write_mixing_parameters(served::Vector{String};
                                 path::AbstractString=joinpath(GENERATED_DIR,
                                                               "mixing_parameters.jl"))
    ensure_pinned_libxc()
    rows = Tuple{String,NamedTuple}[]
    for name in sort(served; lt=natural_lt)
        p = pinned_mixing_parameters(name)
        p === nothing && continue
        (p.hybrid || p.vv10) || continue
        push!(rows, (name, p))
    end

    open(path, "w") do io
        println(io, "# Auto-generated by gen/generate_mixes.jl from libxc-upstream")
        println(io, "# -- do not edit by hand.")
        println(io, "#")
        println(io, "# What Libxc keeps on xc_func_type rather than in a kernel: the")
        println(io, "# exact-exchange fraction of a hybrid, the range-separation")
        println(io, "# parameters of a screened one, and the two VV10 constants. Read from")
        println(io, "# the pinned library at generation time, so these are the library's")
        println(io, "# values and not a paper's -- see pinned_mixing_parameters in")
        println(io, "# gen/generate.jl and src/hybrids.jl for what reads them.")
        println(io, "#")
        println(io, "# Only the functionals that have something to say are listed. For")
        println(io, "# every other name the flags are false and the numbers zero, which")
        println(io, "# src/hybrids.jl supplies without an entry here.")
        println(io, "#")
        println(io, "# This Source Code Form is subject to the terms of the Mozilla Public")
        println(io, "# License, v. 2.0. If a copy of the MPL was not distributed with this")
        println(io, "# file, You can obtain one at http://mozilla.org/MPL/2.0/.")
        println(io)
        println(io, "const MIXING_PARAMETERS = Dict{Symbol,MixingParameters}(")
        for (name, v) in rows
            println(io, "    :", name, " => MixingParameters(",
                    v.hybrid, ", ", v.range_separated, ", ", v.vv10, ", ",
                    repr(v.cam_alpha), ", ", repr(v.cam_beta), ", ", repr(v.cam_omega), ", ",
                    repr(v.nlc_b), ", ", repr(v.nlc_C), "),")
        end
        println(io, ")")
    end
    println("Wrote ", path, " (", length(rows), " functionals with mixing parameters)")
    return length(rows)
end

"""
    identifier_names_with_potentials(served) -> Vector{String}

`served` plus the potential-only functionals under the names Libxc registers.

Those ship as `<name>_vxc`, so `available_entry_points` passes over them, but
what they are is a question a caller can ask, and the answer is the
interesting one, that Libxc reports no energy for them. The variants are
walked as well as the kernels' own names: a kernel stands for several
registered functionals, and `gga_x_lbm` reaches `gga_x_lb`'s kernel the way
`available_entry_points` finds it. Looking only at kernel names missed five of
the eight.
"""
function identifier_names_with_potentials(served::Vector{String})
    names = copy(served)
    manifest = TOML.parsefile(MANIFEST_PATH)
    for (family, entries) in manifest
        endswith(family, "_vxc") || continue
        entries isa AbstractDict || continue
        for (name, entry) in entries
            entry isa AbstractDict || continue
            for candidate in vcat([name], get(entry, "variants", String[]))
                isdefined(LibXcDerivative, Symbol(candidate, "_vxc")) &&
                    push!(names, candidate)
            end
        end
    end
    return sort(unique(names); lt=natural_lt)
end

"""
    write_identifier_facts(served; path) -> Int

Write `src/generated/identifier_facts.jl`: for every functional this package
serves, the facts a caller has to know before it can call it.

Read from the pinned library rather than parsed from the name, because the
name does not carry them: `mgga_x_scanl` reads the Laplacian instead of tau,
and the `_x_`/`_c_`/`_xc_` segment is a convention Libxc does not enforce.
See `pinned_identifier_facts` for the two conventions applied on the way out.
"""
function write_identifier_facts(served::Vector{String};
                                path::AbstractString=joinpath(GENERATED_DIR,
                                                              "identifier_facts.jl"))
    ensure_pinned_libxc()
    rows = Tuple{String,NamedTuple}[]
    for name in identifier_names_with_potentials(served)
        facts = pinned_identifier_facts(name)
        facts === nothing && continue
        push!(rows, (name, facts))
    end

    open(path, "w") do io
        println(io, "# Auto-generated by gen/generate_mixes.jl from libxc-upstream")
        println(io, "# -- do not edit by hand.")
        println(io, "#")
        println(io, "# What a caller has to know before it can call a functional: its")
        println(io, "# family, its kind, which arguments it reads, and whether it has an")
        println(io, "# energy. Read from the pinned library at generation time -- none of")
        println(io, "# it is reliably in the name, which is the whole reason this file")
        println(io, "# exists. See pinned_identifier_facts in gen/generate.jl and")
        println(io, "# src/identifiers.jl for what reads it.")
        println(io, "#")
        println(io, "# This Source Code Form is subject to the terms of the Mozilla Public")
        println(io, "# License, v. 2.0. If a copy of the MPL was not distributed with this")
        println(io, "# file, You can obtain one at http://mozilla.org/MPL/2.0/.")
        println(io)
        println(io, "const IDENTIFIER_FACTS = Dict{Symbol,IdentifierFacts}(")
        for (name, v) in rows
            println(io, "    :", name, " => IdentifierFacts(",
                    repr(v.family), ", ", repr(v.kind), ", ",
                    v.has_exc, ", ", v.needs_tau, ", ", v.needs_laplacian, "),")
        end
        println(io, ")")
    end
    println("Wrote ", path, " (", length(rows), " identifiers)")
    return length(rows)
end

"""
    write_identifier_text(served; path) -> Int

Write `src/generated/identifier_text.jl`: the sentence naming each functional,
its full flag set, the derivative orders Libxc provides for it, and the papers
Libxc asks to be cited.

The citations are the reason this file exists. Libxc's SymPy sources carry the
mathematics and not the bibliography, so a package generated from them has no
way to know what to cite; the four fields per reference come out of the pinned
build's own tables. Measured over the corpus: 834 references across 687
identifiers, at most five for one functional, and the bibtex entries are 344
KiB of the 633 KiB this file holds.

That it ships as a generated source rather than as data read at run time was
decided by measuring, in this order. A stand-in table of the same shape parses
and evaluates in 0.16 s, which is the same order as one of the larger kernels
already shipped. In the package itself precompiling takes 7.1 s against 6.7 s
without the file, on the minimum of three runs: about 0.4 s, but the runs
spread by as much as that difference, so 0.4 s is an upper bound rather than a
figure. Load time, on five runs each, is 1.65-2.23 s with it and 1.39-2.37 s
without: the spread swallows the difference and this measurement does not
resolve one.

The spread has a cause, and it is not the file: the machine was carrying a
load average of 4.1 over one minute and 5.5 over fifteen on eight physical
cores, with an editor, a browser and the window server competing. No thermal
warning had been recorded, so it is contention and not throttling. Measuring
this properly means measuring it on a quiet machine; the upper bound above is
small enough that it was not worth one.
"""
function write_identifier_text(served::Vector{String};
                               path::AbstractString=joinpath(GENERATED_DIR,
                                                              "identifier_text.jl"))
    ensure_pinned_libxc()
    names = identifier_names_with_potentials(served)
    rows = Tuple{String,NamedTuple}[]
    for name in names
        text = pinned_identifier_text(name)
        text === nothing && continue
        push!(rows, (name, text))
    end

    open(path, "w") do io
        println(io, "# Auto-generated by gen/generate_mixes.jl from libxc-upstream")
        println(io, "# -- do not edit by hand.")
        println(io, "#")
        println(io, "# What Libxc carries about a functional besides its arithmetic: the")
        println(io, "# sentence naming it, its flags, the derivative orders the library")
        println(io, "# provides, and the papers it asks to be cited. Read from the pinned")
        println(io, "# build -- the SymPy sources this package generates from carry the")
        println(io, "# mathematics and not the bibliography, so there is no second source")
        println(io, "# for the citations. See pinned_identifier_text in gen/generate.jl")
        println(io, "# and src/identifiers.jl for what reads it.")
        println(io, "#")
        println(io, "# This Source Code Form is subject to the terms of the Mozilla Public")
        println(io, "# License, v. 2.0. If a copy of the MPL was not distributed with this")
        println(io, "# file, You can obtain one at http://mozilla.org/MPL/2.0/.")
        println(io)
        println(io, "const IDENTIFIER_TEXT = Dict{Symbol,IdentifierText}(")
        for (name, v) in rows
            println(io, "    :", name, " => IdentifierText(")
            println(io, "        ", repr(v.name), ",")
            println(io, "        ", repr(Tuple(v.flags)), ",")
            println(io, "        ", repr(Tuple(v.derivatives)), ",")
            println(io, "        LibxcReference[")
            for r in v.references
                println(io, "            LibxcReference(", repr(r.reference), ", ",
                        repr(r.doi), ", ", repr(r.bibtex), ", ", repr(r.key), "),")
            end
            println(io, "        ]),")
        end
        println(io, ")")
    end
    println("Wrote ", path, " (", length(rows), " identifiers, ",
            sum(length(v.references) for (_, v) in rows), " references, ",
            round(filesize(path) / 1024; digits=1), " KiB)")
    return length(rows)
end

"""
    write_source_version(; path) -> String

Write `src/generated/source_version.jl`: which Libxc the expressions came
from, as the two constants `src/source_version.jl` hands out.

The commit is the identifying half -- the pinned tree is a development
branch, so its own version number does not name it -- and the version is the
readable half, read from a build of that tree rather than from a string in
the sources.

Written here rather than into the manifest alone, because the manifest is
data about a generating run and this is a fact a caller of the package has
to be able to ask for: there is no library at run time to ask instead.
"""
function write_source_version(; path::AbstractString=joinpath(GENERATED_DIR,
                                                              "source_version.jl"))
    ensure_pinned_libxc()
    version = join(string.(pinned_libxc_version()), ".")
    commit = upstream_commit()
    open(path, "w") do io
        println(io, "# Auto-generated by gen/generate_mixes.jl from libxc-upstream")
        println(io, "# -- do not edit by hand.")
        println(io, "#")
        println(io, "# Which Libxc the expressions in this package were translated from:")
        println(io, "# the Libxc commit they were generated from, and the version")
        println(io, "# that tree calls itself. Read through libxc_source_commit() and")
        println(io, "# libxc_source_version() in src/source_version.jl.")
        println(io, "#")
        println(io, "# This Source Code Form is subject to the terms of the Mozilla Public")
        println(io, "# License, v. 2.0. If a copy of the MPL was not distributed with this")
        println(io, "# file, You can obtain one at http://mozilla.org/MPL/2.0/.")
        println(io)
        println(io, "const LIBXC_SOURCE_VERSION = v", repr(version))
        println(io, "const LIBXC_SOURCE_COMMIT = ", repr(commit))
    end
    println("Wrote ", path, " (", version, ", ", commit[1:min(7, end)], ")")
    return commit
end

if abspath(PROGRAM_FILE) == @__FILE__
    mixes = write_mixes()
    # Every name a caller can reach: the kernels and variants that were
    # already available, plus the mix entry points just written.
    served = sort(unique(vcat(collect(keys(available_entry_points())), mixes)))
    write_mixing_parameters(served)
    write_identifier_facts(served)
    write_identifier_text(served)
    write_source_version()
end
