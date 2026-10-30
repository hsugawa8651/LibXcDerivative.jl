# LibXcDerivative.jl

[![Dev](https://img.shields.io/badge/docs-dev-blue.svg)](https://hsugawa8651.github.io/LibXcDerivative.jl/dev/)
[![CI](https://github.com/hsugawa8651/LibXcDerivative.jl/actions/workflows/CI.yml/badge.svg)](https://github.com/hsugawa8651/LibXcDerivative.jl/actions/workflows/CI.yml)

Libxc's exchange-correlation functionals as native Julia expressions, generated
from Libxc's own SymPy sources rather than called through a C library.

Each functional ships as a plain `.jl` file holding an ordinary Julia function,
so it differentiates with ForwardDiff, participates in normal precompilation,
and carries no runtime dependency on Python or on libxc itself.

```julia
julia> using LibXcDerivative

julia> lda_c_vwn(0.5)              # a density is all it takes
-0.0658940199667419

julia> lda_c_vwn(0.3, 0.2)         # spin-resolved
-0.06502411505799888

julia> hyb_gga_xc_hse06(0.5, 0.3)  # a screened hybrid's semi-local part
-0.5183657836346022

julia> gga_x_pbe(1.0, 0.2; params = (; params_a_kappa = 0.804,
                                       params_a_mu = 0.2195149727645171))
-0.739404537509313
```

`<name>_defaults` holds the thresholds and parameters Libxc itself uses for
that functional and `<name>_required` names what it still needs from the
caller. An override that names something the functional does not have is
refused rather than ignored.

## Status

Early, and not registered.

> **This package provides 697 of Libxc's 702 identifiers as Julia expressions,
> generated from the pinned Libxc sources and evaluated with no Libxc at run
> time. The five that are not here have no expression to translate: Libxc
> computes them by runtime quadrature, or through spline helpers. They
> differentiate to third and fourth order through automatic differentiation,
> which the build `Libxc.jl` vendors does not reach, and every one of the 283
> kernels carries its measured agreement with a build of the pinned sources.
> Libxc's array interface, its GPU path and `evaluate!` have no counterpart
> here.**

Each of the 697 can be called from a density alone, and 690 of them carry an
energy. They come from 283 generated kernels (43 `lda_exc`,
127 `gga_exc`, 109 `mgga_exc`, and four in the potential-only families), plus
154 functionals that Libxc evaluates by mixing others and that are written out
here as the weighted sum of kernels already present, and the variant entry
points that reach a shared kernel under each registered name.

The other seven return a potential rather than an energy. Libxc reports no
energy for them at all, so they ship under a `*_vxc` name and are counted apart
from the 690 rather than left out of the 697.

That leaves 5 identifiers unreached, over four kernels. Four of them need
runtime quadrature and so have no closed form, and the fifth is held back
because its body calls spline helpers with no Julia equivalent.
`src/generated/manifest.toml` records every functional, its status, and for a
held-back one the reason.

Every identifier callable from a density alone is compared against the
installed Libxc library in the test suite. Seventeen are compared against the
pinned upstream source instead, each for a measured reason: eleven changed
upstream after the release Libxc.jl vendors, and six are mixes holding one of
those eleven. Eight kernels and the mixes built on them are allowed a relative
bound rather than the strict absolute one, with the measured worst case
recorded beside each.

Beyond the energy density, the package answers the derivative slots by name,
the mixing parameters Libxc keeps outside a kernel, the facts Libxc holds about
an identifier, and the `DftFunctionals` interface that `DFTK.jl` consumes.
[Public methods](https://hsugawa8651.github.io/LibXcDerivative.jl/dev/api/)
lists every exported name.

A potential or a higher derivative comes from automatic differentiation over
the generated expression rather than from generated code. The test suite checks
the first derivative against Libxc's `vrho`, `vsigma` and `v2rho2` slots.

## Which Libxc this was made from

The functionals are generated from Libxc's SymPy sources, pinned at one commit:

| | |
|---|---|
| commit | `5d5076f478ada04ca9c076ec3be788ca8e0efc7a`, 2026-08-29, on `devel` |
| version it declares | 7.1.2 (`configure.ac`'s `AC_INIT`) |
| last release in its ChangeLog | 7.1.2, 2026-07-20, with entries after it under `[Unreleased]` |

So the pinned sources are a development state after 7.1.2, not a release. The
commit is recorded per functional in `src/generated/manifest.toml` as
`upstream_commit`, so what any shipped kernel was translated from is in the
shipped files rather than only here. `libxc_source_commit` answers the same
question at run time.

Values are checked against two builds: the one `Libxc.jl` vendors, 7.0.0,
which anyone can reproduce, and a build of the pinned sources for the orders
the vendored one does not reach. [How closely it matches
Libxc](https://hsugawa8651.github.io/LibXcDerivative.jl/dev/matching/) gives
the figures.

Eleven functionals changed upstream after 7.0.0, so for those the vendored
build is the one out of date; they are compared against the pinned sources
instead (`CORRECTED_AFTER_7_0_0` in `test/corrected_after_7_0_0.jl`). What
puts a functional on that list is a measurement rather than a reading of the
ChangeLog: both libraries and this package are asked the same question, which
is the only way to tell "upstream changed it" from "this package translated it
wrongly".

Libxc's sources are not redistributed here.

## Licensing

**MPL-2.0**, the same licence as Libxc, and for the same reason: this package
is a derivative of it.

That is not confined to the generated files, though they are the clearest case:
each one says in its own header which upstream source it was translated from.
The hand-written parts are transcriptions too: `src/variables.jl` follows
`libxc_codegen.py`'s definitions of the reduced variables, `src/libxc_names.jl`
ports `xc_x_minus_log1p` from `libxc-upstream/src/util.c` including the Taylor
branch that makes it accurate, and `src/my_piecewise.jl` mirrors Libxc's own
piecewise semantics.

Licensing the package as a whole under MPL-2.0 avoids having to draw and then
maintain a line between those. MPL-2.0's copyleft is per file and does not
reach into code that merely uses this package.

Libxc is copyright M. A. L. Marques and the other authors listed in its own
`AUTHORS`. Its sources are not redistributed here.

## Generating

`gen/` is tracked in this repository and comes along with it, but nothing in
it is loaded: `using LibXcDerivative` reads `src/` and the extensions only,
and `gen/` has an environment of its own whose dependencies, PyCall above
all, are not this package's. It is here so that the expressions in
`src/generated/`, which no one wrote by hand, can be read next to the scripts
that wrote them.

Running it needs Python with SymPy (through PyCall), CMake, and a C compiler,
and Libxc's own sources, which are not tracked here. The generator reads them
from `gen/libxc-upstream`, a directory git ignores, so a copy installed with
`Pkg.add` has the generator's scripts without the sources they read:
regenerating means cloning Libxc into that directory at the commit
`src/generated/manifest.toml` names. See `gen/README.md` for the workflow and
for what is known not to work yet.

Verifying is separate and cheaper. `reftest/` compares the shipped kernels
against a build of the pinned sources and imports no PyCall, so a Python
install that has stopped working does not stop anyone checking what is
shipped; it still needs that clone and a C toolchain, because it builds
Libxc to compare against.
