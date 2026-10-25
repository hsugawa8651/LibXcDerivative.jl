# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

using LibXcDerivative
using Test
using ForwardDiff
using Libxc

@testset "LibXcDerivative.jl" begin
    include("piecewise.jl")
    include("libxc_names.jl")
    include("generated_audit.jl")
    include("generated_lda.jl")
end
