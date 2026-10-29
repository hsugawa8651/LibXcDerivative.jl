```@meta
DocTestSetup = quote
    using LibXcDerivative, ForwardDiff, TOML
end
```

# Limitations

Everything on this page is a thing the package does not do, or does
differently from what a reader would reasonably assume. None of it is a plan;
it is the current state.

## Functionals that are not here

697 of Libxc's 702 identifiers are callable. The other 5 are accounted for
one at a time in `src/generated/manifest.toml`, and they all have the same
kind of reason: **four kernels are held back**, each one recorded there.

| kernel | why |
|---|---|
| `lda_x_1d_exponential` | `int1`/`int2` are run-time numerical quadrature (`xc_integrate`), not a closed form |
| `lda_x_1d_soft` | the same, and the derivative path additionally needs Bessel `K0`/`K1` |
| `gga_x_fd_lb94` | `fd_int0`/`fd_int1` are run-time quadrature, and the integrand depends on the `beta` parameter |
| `hyb_gga_xc_case21` | demands array parameters with no upstream default, and its generated body calls `cbspline`/`xbspline`, which the generator does not resolve |

Supporting the first three means a quadrature layer, which this package does
not have. They are not translation failures: Libxc computes them by
integrating at run time, so there is no expression to translate.

Those four kernels account for all five of the identifiers, since
`gga_x_fd_lb94` and `gga_x_fd_revlb94` are two identifiers over one kernel.

Nothing else is missing for want of a parameter. `lda_c_1d_csc` was, and its
reason was in the reader rather than in Libxc: its kernel asks for twenty
parameters, `css_set_ext_params` computes them from the two Libxc publishes,
and the struct it computes them into declares `int interaction` after them.
The reader took that int as a reason to report no fields at all, when the
twenty doubles before it are at offsets that need no layout model: the struct
begins at offset 0 and a double is eight bytes aligned to eight. Read that
far, the entry point carries the row `css_set_ext_params` picks for Libxc's
published default, `interaction = 1` and `beta = 1.0`, and agrees with the
library to 1e-16. The other eight rows of that table are reachable by passing
`params_a_para_*` and `params_a_ferro_*`; what this package does not have is
Libxc's own spelling of the choice, which is the two parameters it publishes.

The nine Minnesota correlation identifiers were unreachable for a different
reason until this generator stopped reading an auxiliary functional as a sign
that the kernel is one piece of an answer rather than the answer. Libxc attaches
`lda_c_pw_mod` to each of the nine and leaves `mix_coef` NULL, which is its
own switch for whether an auxiliary is applied at all (`gga.c:159`,
`mgga.c:289`), and nothing on the evaluation path reads it: the LDA part is
inside the expression already (`python/mgga_exc/mgga_c_m05.py` includes
`lda_c_pw`). Given the parameters Libxc's own initialised struct holds for
each, the `mgga_c_m06l` kernel reproduces all nine, and they now ship.

## No array interface, and no `evaluate!`

Libxc's C API has about 33 functions for filling arrays and evaluating in
place; `Libxc.jl`'s `evaluate!` is the Julia face of them. There is nothing
equivalent here, and adding one would need a design decision rather than a
transcription, because the C form is primitive for reasons that do not carry
over. Over a grid, the form here is broadcast:

```julia
v = xc_exc_vxc.(gga_x_pbe, rho, sigma)
```

Whether an allocation-free form is actually needed has not been measured. See
[Coming from Libxc.jl](@ref).

## No runtime version constant

`Libxc.libxc_version` reports the version of the shared library a caller has
loaded. There is no such thing here, because there is no shared library:
[`libxc_source_version`](@ref) and [`libxc_source_commit`](@ref) say which
Libxc the shipped expressions were generated from, which is a different
question and the only one this package can answer.

## Precision and element types

The kernels are generic arithmetic, so `BigFloat` works and so does any `Dual`
number. **`Float32` does not stay `Float32`**, and more to the point it does
not buy `Float64` accuracy:

```jldoctest
julia> lda_x(0.5), lda_x(0.5f0)
(-0.5861944813475805, -0.5861944741391046)
```

The result is a `Float64` either way, the kernels carrying `Float64` literals
and `//` rationals that promote, but the `Float32` call has done part of its
work in single precision and agrees only to about 1e-8. A `Float64` result
carrying `Float32` accuracy is worse than an error, so do not feed `Float32`
densities in expecting either behaviour.

## The GPU has not been tried

Nothing here has been run on a GPU. The structure is more favourable than
Libxc's, since Libxc picks host or device at build time while a Julia
expression would pick a back end at run time, but that is an argument, not a
measurement. Two concrete obstacles are known:

* Apple GPUs have no `Float64`, and this package promotes `Float32` to
  `Float64` (above), so the whole corpus would have to be regenerated to run
  there at all.
* Every one of the 283 kernels contains `//` rationals, and 16 of them call
  `erf`/`erfc`; the branching `my_piecewise3`/`my_piecewise5` form is also not
  what GPU code wants.

## It is not a dependency-free package

The claim is "no Libxc at run time", not "no C at run time". The dependency
tree is `NaNMath` and `SpecialFunctions`, and `SpecialFunctions`'s `erf` and
`erfc` reach `libopenspecfun`/`libopenlibm`. 16 of the 283 kernels call them.

Libxc does the same thing through libm, so this is not a difference between
the two packages. But "pure Julia" would be the wrong phrase for it, and
automatic differentiation still passes through, since `SpecialFunctions`
carries the derivative rules.

`erf` and `erfc` are *not* re-exported. The kernels call them by their bare
names and resolve them inside the module; a caller who wants them writes
`using SpecialFunctions`.

## Automatic differentiation

* The named-slot layer is **ForwardDiff-only**; see [Derivatives](@ref).
* Under Zygote, 134 of the 154 functionals Libxc evaluates as a weighted sum
  differentiate. The other 20 raise an `OverflowError` in `Rational{Int128}`,
  from differentiating the `//` literals in the kernels. It is not an
  input-range problem and has no fix in hand.
* Enzyme and the other AD packages have not been tried.

## Cost at high order

First-call compilation can be minutes, and it is decided by the **size of the
expression** rather than by the order, though superlinearly, and with the
attenuated kernels as outliers. A third derivative of `hyb_gga_xc_hse06` took
260 s and its fourth was stopped after twelve minutes, while a fourth
derivative of `gga_xc_hcth_120`, whose kernel is a third the size, is 10.7 s
for all five slots. [Derivatives](@ref) has the numbers and the slot-by-name
form.

For scale, measured on 2026-10-20 at fourth order, whole tuple: 10.7 s for
`gga_xc_hcth_120` (5 slots), 15.6 s for `mgga_x_scan` and 26.8 s for
`mgga_c_m06_l` (35 slots each). One slot of any of them was 1 to 4 s when that
was measured, on 2026-10-16. Repeating a first-call figure on the same machine
moves it by about a tenth, and the three above moved by as much as a seventh
between those two dates, not all in the same direction, so read them as scale
rather than as benchmarks. It is
`gga_x_wpbeh` and the functionals holding it that are the exception, by two
orders of magnitude.

How much that form saves depends on the kernel, and on the large ones it is
less than the whole tuple suggests. Measured on 2026-10-16: `mgga_x_scan`'s
fourth derivative is 13.8 s for all thirty-five slots and 1.7 s for `v4rho4`
alone, a factor of eight, because the slots share most of the work. But
`hyb_gga_xc_hse06`'s third derivative is 251 s for its four slots and 55 to
77 s for one of them, which is no more than paying for one slot instead of
four. What the form does buy there is reachability rather than speed: one
fourth-order slot of that functional returns in 194 to 298 s, where the whole
tuple does not finish in twelve minutes.

Once compiled, every one of these is microseconds rather than seconds, but
compilation is not the whole cost: above the first derivative these calls
allocate. Measured on 2026-10-27 and alike under 1.10, 1.11 and 1.12, per
point: 2064 bytes for an unpolarized third derivative of a meta-GGA, the same
for each of the four measured, 5840 for `mgga_x_scan`'s fourth, 2720 for its
spin-polarized second, and 1168 for a spin-polarized third derivative of
`gga_x_pbe`. Under 1.11 and 1.12 the other orders above the first derivative
are zero, as is everything at and below it, which is where the suite pins it;
under 1.10 two of those others are not. What accounts for any of this is not
established here, and `bench/allocation.jl` takes all of the figures again.

A caller who needs a particular functional and slot can move the compilation
to their own build with `PrecompileTools`, and pay it once rather than once
per session.

## Above the order Libxc generates, for the kernels it caps

Libxc's own generator caps some functionals below fourth order, and for some
of them the reason is not cost: a piecewise junction whose branches match to
only finite order, so the derivatives past it jump. `gga_x_wpbeh` (an
erf-attenuation junction) and the regularized SCAN family
(`mgga_x_r2scan`, `mgga_c_r2scan`, `mgga_x_r4scan`) stop at second order;
`mgga_x_rscan`, `mgga_c_rscan`, `lda_c_pk09` and `mgga_c_b94` stop at third.

This package has no such cap. The expressions differentiate straight through
those junctions, so a third or fourth derivative comes back where Libxc
generates none, and at the junction it is the one-sided value of whichever
branch the condition selects. Nothing says so at the call site. The manifest
records the absence rather than a figure: those four kernels carry no
`high_agreement` table, because the build measured against has nothing above
second order in them.

The 260 s third derivative of `hyb_gga_xc_hse06` quoted above is an instance:
the cost is in the `gga_x_wpbeh` kernel it holds, which is one of the four.

## At a zero of `sigma`, the second derivatives that involve it are `NaN`

The second derivatives that differentiate in `sigma` come back `NaN` where
`sigma = 0`, and Libxc returns a number there. On `gga_x_pbe` at `rho = 0.5`,
measured on 2026-10-23, Libxc gives `v2rhosigma = 0.02845666103` and
`v2sigma2 = 0.0009664794713` against `NaN` here, while `v2rho2` agrees to
fourteen digits. Of ten GGA kernels tried at that point, all ten were `NaN`
here and a number in Libxc, and Libxc's numbers differ widely between them:
`0` for `gga_c_lyp`, `-3.44888e+17` for `gga_c_p86`.

The reason is that the singularity is removable and only Libxc can see it.
Its generator simplified the expression before printing it, so the printed
form carries the finite limit. This package differentiates the expression it
was given, and the `sigma` derivative of the term that limit came from is
infinite at zero. The chain is not wrong; a limit is not visible to a
derivative taken at the point.

`tau = 0` reaches the same place, but through the clamp rather than on its
own: Libxc holds `sigma` against `8·rho·tau`, so `sigma` goes to zero there
and the `sigma` slots go with it. The slots that differentiate in `tau` stay
finite. On `mgga_x_scan` at `rho = 0.5`, `sigma = 0.1`, `lapl = 0.05`,
`tau = 0`, `v2rhotau = -0.024360211` and `v2tau2 = 0.053858037`, while
`v2rhosigma` and `v2sigma2` are `NaN`; with `enforce_fhc=false`, which leaves
`sigma` at `0.1`, all four are finite.

The first derivatives are not affected. There the slots come from one forward
pass where every one of them is finite, and from a chain per slot where they
are not, and a chain seeds one argument, so `vrho` stays finite at
`sigma = 0`: `-0.781592641797` for `gga_x_pbe` at `rho = 0.5`. `vsigma`
itself is `NaN` at `sigma = 0`, which is the derivative's own singularity
rather than a defect of the path.

Away from zero, a second derivative in `sigma` is not reliable at a `sigma`
far below the scale the expression was written for, and the error is not
monotonic, so there is no threshold to quote. For `gga_c_pbe`'s `v2sigma2`
against Libxc, relative, measured on 2026-10-23: `1.3e-11` at
`sigma = 1e-5`, `8.8e-07` at `1e-10`, `1.4e-02` at `1e-14`, `9.2e-01` at
`1e-16`, then `1.2e-16` from `1e-18` to `1e-25`, and `1.0e+12` at `1e-28`
and worse below. A second derivative in `sigma` forms terms of order
`1/sigma`, and what the cancellation between them leaves depends on the
expression rather than on the size of `sigma` alone.

Where the library has the slot, which is up to second order in a default
build, it is the one to trust at these points.

The suite does not compare there. It takes its points from the manifest,
where `sigma = 0.1 rho` and `tau = 0.3 rho`, so `sigma = 0`, `tau = 0` and a
`sigma` near the limits of double precision are never reached. All of the
above was found by comparing against the library by hand.

## Outside Libxc's input clamp, the two are different functions

For a `tau`-reading functional above the von Weizsäcker bound
`tau ≥ sigma/(8·rho)`, Libxc clamps its input and this package follows. With
`enforce_fhc=false`, or when a kernel is called directly, the two part company
by 2 % to a factor of eleven. That region is unphysical, so no real
density reaches it, and [`libxc_clamp`](@ref) is there for a caller who needs
to know what Libxc would have done.

One functional also genuinely disagrees: `mgga_x_2d_prhg07_prp10` is computed
as a different function by the library `Libxc.jl` vendors. This package
follows the pinned sources.

## The generator ships, but cannot be run from an installed copy

`gen/` is in the repository and tracked, so `Pkg.add` brings it along with
everything else. What it is not is part of the *loaded* package: `using
LibXcDerivative` reads `src/` and the extensions and nothing else, and `gen/`
has an environment of its own whose dependencies, PyCall above all, are not
this package's. It is here to be read against `src/generated/`, not to be
run as part of using the package.

Running it needs Python with SymPy through PyCall, CMake, a C compiler, and
Libxc's own sources, which are **not tracked here**. The generator reads
them from `gen/libxc-upstream`, a directory git ignores, so an installed
copy has the generator's scripts and not the sources they read:
regenerating means cloning Libxc into that directory at the commit
`src/generated/manifest.toml` names.

Verifying is a separate matter and deliberately cheaper. `reftest/` compares
the shipped kernels against a build of the pinned sources and imports no
PyCall, so a Python install that has stopped working does not stop anyone
checking what is shipped. It still needs that clone and a C toolchain,
because it builds Libxc to compare against.
