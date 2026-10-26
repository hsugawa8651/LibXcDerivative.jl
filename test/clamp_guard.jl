# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

@testset "the input clamp refuses arguments it cannot use" begin
    # Every shape a family has is a method of its own, so a call that is
    # not one of them has nothing to do but refuse. The name in the message
    # is the clamp's own, which is what a caller can act on.
    for args in ((lda_x, "abc"), (lda_x, 0.5, 0.1, 0.2),
                 (lda_x, 0.5, 0.1, 0.2, 0.3, 0.4), (lda_x,))
        err = try
            LibXcDerivative.libxc_clamp(args...)
            nothing
        catch e
            e
        end
        @test err isa ArgumentError
        @test occursin("libxc_clamp", sprint(showerror, err))
    end

    # The shapes the families have pass through, and the meta-GGA one
    # clamps. These are the forms the slot methods call it with.
    @test LibXcDerivative.libxc_clamp(lda_x, 0.5) === (0.5,)
    @test LibXcDerivative.libxc_clamp(gga_x_pbe, 0.5, 1.0) === (0.5, 1.0)
    @test LibXcDerivative.libxc_clamp(mgga_x_scan, 0.5, 1.0, 0.0, 0.05) ===
          (0.5, 0.2, 0.0, 0.05)
    @test LibXcDerivative.libxc_clamp(lda_x, (0.3, 0.2)) === ((0.3, 0.2),)
    @test LibXcDerivative.libxc_clamp(gga_x_pbe, (0.3, 0.2),
                                      (0.12, 0.05, 0.08)) ===
          ((0.3, 0.2), (0.12, 0.05, 0.08))
end
