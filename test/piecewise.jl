# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

@testset "my_piecewise3/5 basics" begin
    @test LibXcDerivative.my_piecewise3(true, 1.0, -1.0) == 1.0
    @test LibXcDerivative.my_piecewise3(false, 1.0, -1.0) == -1.0
    # promote() before ifelse: mismatched branch literal types must not
    # produce a type-unstable Union return (verified with @inferred, not
    # just a value check: this is the whole point of the promote fix).
    @test (@inferred LibXcDerivative.my_piecewise3(true, 0, 1.0)) === 0.0
    @test (@inferred LibXcDerivative.my_piecewise3(false, 0, 1.0)) === 1.0

    @test LibXcDerivative.my_piecewise5(true, 1.0, true, 2.0, 3.0) == 1.0
    @test LibXcDerivative.my_piecewise5(false, 1.0, true, 2.0, 3.0) == 2.0
    @test LibXcDerivative.my_piecewise5(false, 1.0, false, 2.0, 3.0) == 3.0
end
