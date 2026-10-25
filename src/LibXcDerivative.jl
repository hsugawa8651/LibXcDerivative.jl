# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

module LibXcDerivative

using NaNMath

include("my_piecewise.jl")
export my_piecewise3, my_piecewise5

include("entrypoint.jl")

include("variables.jl")
export lda_variables, gga_variables, mgga_variables

include("libxc_names.jl")
# Libxc's own spellings of the functions its kernels call. erf and erfc are
# not among them: they are SpecialFunctions', and exporting them put a name
# into the caller's scope that this package neither defines nor documents.
# The kernels call them by their bare names and resolve them inside this
# module, which needs no export.
export xc_log1p, xc_expm1, xc_asinh, xc_atanh, xc_x_minus_log1p, atan2,
       xc_erfcx, Abs,
       BesselI, br89_x, mbrxc_x
export LambertW, xc_dilogarithm, xc_E1_scaled, xc_e1_scaled_G

# Which Libxc the expressions came from. The constants it reads are generated
# and included below; the accessors are here.
include("source_version.jl")
export libxc_source_version, libxc_source_commit

const GENERATED_DIR = joinpath(@__DIR__, "generated")

# The two constants src/source_version.jl hands out: which Libxc commit the
# expressions were generated from, and what those sources call themselves.
isfile(joinpath(GENERATED_DIR, "source_version.jl")) &&
    include(joinpath(GENERATED_DIR, "source_version.jl"))

end # module LibXcDerivative
