# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

@testset "no generated file raises to a non-integer power" begin
    # `^` is the one domain-restricted operation the bare-name audit
    # above cannot see, because it is spelled as an operator rather
    # than as a Base name: `(-8.0)^(4/3)` throws a DomainError where
    # C's pow returns NaN, so a non-integer exponent has to reach
    # NaNMath.pow instead. An integer exponent is fine: Julia raises
    # a negative base to one without complaint.
    gendir = joinpath(pkgdir(LibXcDerivative), "src", "generated")
    files = String[]
    for (root, _, fs) in walkdir(gendir), f in fs
        endswith(f, ".jl") && push!(files, joinpath(root, f))
    end
    @test !isempty(files)

    function scan_pows!(found, label, x)
        if x isa Expr
            if x.head === :call && x.args[1] === :^ && length(x.args) == 3 &&
               !(x.args[3] isa Integer)
                push!(found, (label, x.args[3]))
            end
            for a in x.args
                scan_pows!(found, label, a)
            end
        end
        return nothing
    end

    # The detector has teeth: the shapes this is looking for are found
    # when they are present. Without this the testset below would pass
    # just as well with a scan that never matches anything.
    witness = Tuple{String,Any}[]
    scan_pows!(witness, "mutation", :(x^1.5 + y^(4 // 3) + z^2))
    @test length(witness) == 2

    fractional = Tuple{String,Any}[]
    for file in files
        scan_pows!(fractional, basename(file),
                   Meta.parseall(read(file, String); filename=file))
    end
    @test fractional == Tuple{String,Any}[]
end

@testset "no generated file calls a bare Base function that throws" begin
    # The audit above asks whether a name resolves, which `log1p` does:
    # it is in Base, so a generated file calling it passes that gate and
    # then behaves differently from Libxc. Libxc's own names are the C
    # library functions, which return NaN outside their domain, and this
    # package ports them that way (xc_log1p, xc_atanh). Base throws a
    # DomainError there instead, and a kernel that throws where Libxc
    # returns a number is a different function, not a stricter one.
    #
    # The generator maps each of these to its NaNMath or Libxc
    # equivalent as it prints: generated code holds NaNMath.log,
    # xc_log1p and no bare `log`, so what this catches is one of them
    # reaching a generated file unmapped.
    domain_restricted = Set([:log, :log1p, :log2, :log10, :sqrt,
                             :atanh, :acosh, :asin, :acos])
    gendir = joinpath(pkgdir(LibXcDerivative), "src", "generated")
    files = String[]
    for (root, _, fs) in walkdir(gendir), f in fs
        endswith(f, ".jl") && push!(files, joinpath(root, f))
    end
    @test !isempty(files)

    bare = Tuple{String,Symbol}[]
    function scan!(found, file, x)
        if x isa Expr
            if x.head === :call && x.args[1] isa Symbol &&
               x.args[1] in domain_restricted
                push!(found, (basename(file), x.args[1]))
            end
            for a in x.args
                scan!(found, file, a)
            end
        end
        return nothing
    end
    for file in files
        scan!(bare, file, Meta.parseall(read(file, String); filename=file))
    end
    @test unique(bare) == Tuple{String,Symbol}[]
end
