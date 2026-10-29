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
    # The generator and the reference-comparison scripts are under the same
    # licence and audited with the rest, as the README's reason covers them
    # too: the generator transcribes constants from util.h. Both are
    # tracked, so an installed copy carries them; the guard is there so
    # that a directory which is absent is skipped rather than raising.
    #
    # Walked down rather than read one directory deep, so that a file put in
    # a subdirectory of its own is checked as well. gen/libxc-upstream is
    # left out: it is Libxc's own tree under Libxc's own notice, and this
    # package's notice does not belong in it. A directory named build is left
    # out for the same reason: it holds what that tree was compiled into.
    is_source(p) = endswith(p, ".jl") || endswith(p, ".py") || endswith(p, ".c")
    for top in ("gen", "reftest")
        isdir(joinpath(root, top)) || continue
        queue = [joinpath(root, top)]
        while !isempty(queue)
            for e in readdir(popfirst!(queue); join=true)
                if isdir(e)
                    basename(e) in ("libxc-upstream", "build") || push!(queue, e)
                elseif is_source(e)
                    has_notice(e) || push!(missing_header, relpath(e, root))
                end
            end
        end
    end
    @test isempty(missing_header)
    # And the count, so that a directory dropping out of the walk above shows
    # up rather than passing quietly.
    @test length(readdir(joinpath(root, "src", "generated", "gga_exc"))) > 100
end
