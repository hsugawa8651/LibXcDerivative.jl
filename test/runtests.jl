# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

using LibXcDerivative
using Test
using ForwardDiff
using Libxc
using SpecialFunctions
using TOML

@testset "LibXcDerivative.jl" begin
    include("piecewise.jl")
    include("libxc_names.jl")
    include("generated_audit.jl")
    include("generated_lda.jl")
    include("generated_gga.jl")
    include("generated_mgga.jl")
    include("generated_values.jl")
    include("manifest.jl")
    include("facts.jl")
    include("mixing.jl")
    include("parameters.jl")
end
