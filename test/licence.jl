# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

@testset "every source file carries the licence header" begin
    # MPL-2.0 is per file, so a file without the notice is not covered by it.
    # The README says why the package is MPL-2.0 (it is a derivative of
    # Libxc, the generated kernels plainly and the hand-written parts as
    # transcriptions), and this is what keeps the notice from being missing
    # from a file somebody adds later. The generated kernels carry it because
    # the generator writes it; everything else carries it because of this.
    #
    # The notice wraps, so the part on one line is what is looked for, and
    # it has to be in the first few lines: a file that merely mentions the
    # phrase further down (this testset does, in this comment) is not a
    # file carrying the notice.
    root = pkgdir(LibXcDerivative)
    has_notice(f) = any(occursin("Mozilla Public", l)
                        for l in Iterators.take(eachline(f), 6))
    missing_header = String[]
    for dir in ("src", "ext", "test"), f in readdir(joinpath(root, dir); join=true)
        endswith(f, ".jl") || continue
        has_notice(f) || push!(missing_header, relpath(f, root))
    end
    for sub in ("lda_exc", "lda_vxc", "gga_exc", "gga_vxc", "mgga_exc", "mgga_vxc")
        d = joinpath(root, "src", "generated", sub)
        isdir(d) || continue
        for f in readdir(d; join=true)
            endswith(f, ".jl") || continue
            has_notice(f) || push!(missing_header, relpath(f, root))
        end
    end
    # The generator is not shipped here. Where it is present it is under the
    # same licence and audited with the rest, as the README's reason covers it
    # too: it transcribes constants from util.h.
    if isdir(joinpath(root, "gen"))
        for f in readdir(joinpath(root, "gen"); join=true)
            (endswith(f, ".jl") || endswith(f, ".py") || endswith(f, ".c")) || continue
            has_notice(f) || push!(missing_header, relpath(f, root))
        end
    end
    @test isempty(missing_header)
    # And the count, so that a directory dropping out of the walk above shows
    # up rather than passing quietly.
    @test length(readdir(joinpath(root, "src", "generated", "gga_exc"))) > 100
end
