# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

@testset "the facts a caller needs before it can call a functional" begin
    # Read from the pinned library at generation time, because none of it
    # is reliably in the name: mgga_x_scanl is deorbitalized SCAN and
    # reads the Laplacian instead of tau, and the _x_/_c_/_xc_ segment is
    # a convention Libxc does not enforce.
    @test LibXcDerivative.libxc_family(:lda_x) === :lda
    @test LibXcDerivative.libxc_kind(:lda_x) === :x
    @test LibXcDerivative.libxc_family(:gga_c_pbe) === :gga
    @test LibXcDerivative.libxc_kind(:gga_c_pbe) === :c
    @test LibXcDerivative.libxc_kind(:lda_k_tf) === :k

    # A hybrid is reported in its underlying family: what a hybrid changes
    # is the mixing, not which arguments its semi-local part reads.
    @test LibXcDerivative.libxc_family(:hyb_gga_xc_hse06) === :gga
    @test LibXcDerivative.libxc_kind(:hyb_gga_xc_hse06) === :xc

    # tau and the Laplacian, which is what makes this a table and not a
    # name test.
    @test LibXcDerivative.needs_tau(:mgga_x_scan)
    @test !LibXcDerivative.needs_laplacian(:mgga_x_scan)
    @test LibXcDerivative.needs_laplacian(:mgga_x_scanl)
    @test LibXcDerivative.libxc_family(:mgga_x_scanl) === :mggal
    @test !LibXcDerivative.needs_tau(:gga_x_pbe)

    # Whether there is an energy at all. The potential-only functionals
    # carry no XC_FLAGS_HAVE_EXC, which is why they ship as *_vxc.
    @test LibXcDerivative.has_exc(:lda_x)
    @test !LibXcDerivative.has_exc(:gga_x_lb)

    # Same refusal as the mixing parameters: a name this package does not
    # ship is not a question with an answer.
    @test_throws ArgumentError LibXcDerivative.libxc_family(:gga_x_not_a_functional)

    # Takes the entry point as well as its name.
    @test LibXcDerivative.libxc_family(gga_x_pbe) === :gga
end

@testset "the facts accessors name themselves when the argument is not one" begin
    # Each accessor reads a table that another function builds, so without a
    # method of its own for anything else, the error a caller sees names that
    # other function rather than the one it called.
    # needs_tau and needs_laplacian are qualified because Libxc.jl exports
    # those two names as well, and a test file that loads both libraries sees
    # neither binding.
    for entry in (libxc_family, libxc_kind, has_exc,
                  LibXcDerivative.needs_tau, LibXcDerivative.needs_laplacian,
                  functional_name, libxc_flags, libxc_derivatives,
                  libxc_references)
        err = try
            entry(42)
            nothing
        catch e
            e
        end
        @test err isa ArgumentError
        msg = sprint(showerror, err)
        @test occursin(string(nameof(entry)), msg)
        @test !occursin("identifier_facts", msg)
        @test !occursin("identifier_text", msg)
        @test occursin("Int64", msg)
    end

    # dft_functional's method comes from an extension, and the message says
    # which one. Asserted on an argument no method of it takes, so it holds
    # whether the extension is loaded or not.
    err = try
        dft_functional(42)
        nothing
    catch e
        e
    end
    @test err isa ArgumentError
    @test occursin("dft_functional", sprint(showerror, err))
    @test occursin("DftFunctionals", sprint(showerror, err))

    # What they do take still answers, by function and by name.
    @test libxc_family(lda_x) === :lda
    @test libxc_family(:lda_x) === :lda
    @test LibXcDerivative.needs_tau(:mgga_x_scan)
    @test !LibXcDerivative.needs_tau(:lda_x)
    @test functional_name(:lda_x) isa String
end
