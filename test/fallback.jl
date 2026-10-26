# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

@testset "a slot with no method for these arguments says so by its own name" begin
    # Asserted on argument counts no method of the extension takes, so that
    # what is asserted holds whether the extension is loaded or not: with it
    # loaded these reach the fallback, and without it every call does.
    for entry in (xc_exc_vxc, xc_fxc, xc_kxc, xc_lxc)
        err = try
            entry(lda_x)
            nothing
        catch e
            e
        end
        @test err isa ArgumentError
        msg = sprint(showerror, err)
        @test occursin(string(nameof(entry)), msg)
        # The pass the extension runs is not part of the interface, and a
        # caller that never named it should not be told about it.
        @test !occursin("_one_pass", msg)
        @test !occursin("_seeded_pass", msg)
        @test occursin("typeof(lda_x)", msg)
    end

    # The two that take a family and an order are typed in the extension, so
    # a wrong type reaches the fallback as well as a wrong count.
    for entry in (slot_names, slot_widths)
        for args in (("lda", 2), (:lda,), (:lda, 2, 3))
            err = try
                entry(args...)
                nothing
            catch e
                e
            end
            @test err isa ArgumentError
            @test occursin(string(nameof(entry)), sprint(showerror, err))
        end
    end

    # Building the message must not fail on something that is not a
    # functional at all: libxc_family refuses what it does not know, and the
    # fallback says what it can instead of propagating that refusal.
    err = try
        xc_exc_vxc(sin)
        nothing
    catch e
        e
    end
    @test err isa ArgumentError
    @test occursin("xc_exc_vxc", sprint(showerror, err))

    # A functional it does know is named with its family.
    err = try
        xc_fxc(lda_x)
        nothing
    catch e
        e
    end
    @test occursin("lda", sprint(showerror, err))

    # What the extension does take goes to the extension.
    @test xc_exc_vxc(lda_x, 0.5).zk isa Float64
    @test slot_names(:lda, 2) === (:v2rho2,)
    # Three, not one: the width is the spin-polarized one, and an LDA's
    # second derivative has the (aa, ab, bb) components.
    @test slot_widths(:lda, 2) === (3,)
end
