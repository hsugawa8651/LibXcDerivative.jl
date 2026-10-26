# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

@testset "no docstring is detached from what it documents" begin
    # A comment between a docstring and the definition under it silences the
    # docstring: the parser emits a LineNumberNode for the comment line, the
    # string is left as a bare literal rather than becoming a `@doc`
    # macrocall, and nothing is attached. The file still reads as though the
    # name were documented, so a long docstring can be lost without anything
    # looking wrong, and Documenter's `@docs` block refuses the name.
    #
    # Checked as text rather than through `Base.Docs.meta`, because the
    # generator's files are not loaded as a module, and moving a definition
    # out of a file is what leaves a docstring behind in it.
    root = pkgdir(LibXcDerivative)
    detached = String[]
    for dir in ("src", "ext", "gen", "test", "reftest")
        isdir(joinpath(root, dir)) || continue
        for f in readdir(joinpath(root, dir); join=true)
            endswith(f, ".jl") || continue
            inside, expect = false, false
            for (n, line) in enumerate(eachline(f))
                if startswith(line, "\"\"\"")
                    inside, expect = !inside, !inside ? false : true
                    continue
                end
                inside && continue
                if expect
                    startswith(lstrip(line), "#") &&
                        push!(detached, "$(relpath(f, root)):$n")
                    expect = false
                end
            end
        end
    end
    @test isempty(detached)
end
