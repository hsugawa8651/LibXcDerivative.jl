#!/usr/bin/env julia
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

# Child entry point for a batch run: generate exactly one functional and exit.
#
# Nothing here is needed to generate a functional interactively: calling
# `generate_functional` directly does the same work in-process. This file
# exists so a batch can impose a wall-clock budget per functional, which is
# only enforceable across a process boundary: generation blocks inside a
# PyCall `ccall`, and a blocking `ccall` stalls Julia's scheduler, so no
# in-process watchdog can either observe or cancel a hang. See
# `run_with_timeout` in generate.jl.
#
# Usage (normally invoked by generate_one_subprocess, not by hand):
#   julia --project=gen gen/generate_one.jl [--report <file>] <family> <name> <argname>...
#
# `--report` names a file to write the emitted positional argument order to.
# The parent cannot observe that order any other way (it sees only an exit
# code), and it is what the manifest records.

include(joinpath(@__DIR__, "generate.jl"))  # main() is guarded; this only defines things

function child_main(args::Vector{String})
    reportfile = nothing
    if length(args) >= 2 && args[1] == "--report"
        reportfile = args[2]
        args = args[3:end]
    end
    if length(args) < 3
        error("usage: generate_one.jl [--report <file>] <family> <name> <argname>... " *
              "(got $(length(args)) positional argument(s))")
    end

    family, name = args[1], args[2]
    argnames = String[args[3:end]...]
    setup_python_path!()
    _, extra_params = generate_functional(family, name, argnames)

    if reportfile !== nothing
        open(reportfile, "w") do io
            TOML.print(io, Dict("argnames" => argnames,
                                "extra_params" => String[extra_params...],
                                "required" => required_params(family, name, String[extra_params...]),
                                "variants" => emitted_variants(family, name, String[extra_params...])))
        end
    end
    return nothing
end

child_main(String[ARGS...])
