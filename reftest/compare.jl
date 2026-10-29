# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

# Compare the shipped kernels against a build of the pinned Libxc sources,
# without generating anything.
#
#     julia --project=reftest reftest/compare.jl lda_exc lda_x
#     julia --project=reftest reftest/compare.jl lda_exc          # whole family
#     julia --project=reftest reftest/compare.jl --high lda_exc   # orders 3 and 4
#
# The suite in test/ compares values against the build Libxc.jl vendors, which
# is 7.0.0 and stops at second derivatives. This compares against the pinned
# sources themselves, which is a different question and needs a build the
# suite cannot assume: the kernels were translated from these sources, so this
# is the comparison that says the translation is right, and it is the only one
# that can reach the third and fourth derivatives.
#
# Generating needs Libxc's SymPy sources through PyCall and so a working
# Python; this needs neither, which is why gen/pinned.jl exists as a file of
# its own and why this environment does not carry PyCall. A Python install
# that has stopped working does not stop anyone verifying what is shipped.

using LibXcDerivative
using ForwardDiff          # the slot layer the comparison reads lives behind it
using TOML
using Printf

const HERE = normpath(joinpath(@__DIR__, "..", "gen"))
const GENERATED_DIR = normpath(joinpath(@__DIR__, "..", "src", "generated"))
include(joinpath(HERE, "pinned.jl"))

function report(family::AbstractString, kernel::AbstractString)
    r = agreement_for(family, kernel)
    isempty(r) && return false
    ok = true
    for name in sort(collect(keys(r)))
        slots = r[name]
        @printf("%-34s", name)
        for slot in sort(collect(keys(slots)))
            absdiff, scaled, pointwise = slots[slot]
            @printf("  %s abs=%.2e rel=%.2e/%.2e", slot, absdiff, scaled, pointwise)
        end
        println()
    end
    return ok
end

# The third and fourth derivatives, against the MAXORDER=4 build. One line a
# name, the worst slot only: a meta-GGA has 55 of them at these two orders and
# the slot that disagrees most is the question being asked.
#
# The relative figures are what to read, and there are two: scaled by the
# largest value the slot takes in the sweep, then the worst per-point ratio.
# A fourth-order slot is enormous where the gradient is small, so
# `gga_x_pbe`'s `v4sigma4` differing by 1e-9 in absolute terms is a relative
# 4e-14; the second figure is the one that says whether a point where the
# slot is small did as well (`gga_x_beefvdw` reports 5.9e-08 and 3.5e-06).
# The slot reported is the worst on the first of the two, which is the
# ranking these tables have always used.
function report_high(family::AbstractString, kernel::AbstractString)
    r = high_agreement_for(family, kernel)
    isempty(r) && return false
    for name in sort(collect(keys(r)))
        slots = r[name]
        worst_slot = argmax(s -> slots[s][2], keys(slots))
        absdiff, scaled, pointwise = slots[worst_slot]
        @printf("%-34s %2d slots  worst %-18s abs=%.2e rel=%.2e/%.2e\n",
                name, length(slots), worst_slot, absdiff, scaled, pointwise)
        flush(stdout)
    end
    return true
end

function main(args)
    high = !isempty(args) && args[1] == "--high"
    high && (args = args[2:end])
    isempty(args) && error("usage: compare.jl [--high] <family> [kernel]")
    family = args[1]
    kernels = length(args) >= 2 ? [args[2]] :
        sort([first(splitext(f)) for f in readdir(joinpath(GENERATED_DIR, family))
              if endswith(f, ".jl")])
    println("pinned libxc version: ", pinned_libxc_version())
    println("upstream commit:      ", upstream_commit_of_manifest())
    high && println("orders 3 and 4, against the MAXORDER=4 build")
    flush(stdout)
    for k in kernels
        done = high ? report_high(family, k) : report(family, k)
        done || println(rpad(k, 34), "  (no shipped entry point to compare)")
        flush(stdout)
    end
end

# The commit the manifest records, so a run says which sources it is checking
# against rather than leaving that to be looked up.
function upstream_commit_of_manifest()
    isfile(MANIFEST_PATH) || return "unknown"
    m = TOML.parsefile(MANIFEST_PATH)
    for (_, fam) in m, (_, entry) in fam
        entry isa Dict && haskey(entry, "upstream_commit") &&
            return entry["upstream_commit"]
    end
    return "unknown"
end

abspath(PROGRAM_FILE) == abspath(@__FILE__) && main(ARGS)
