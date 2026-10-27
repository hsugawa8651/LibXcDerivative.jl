```@meta
DocTestSetup = quote
    using LibXcDerivative, ForwardDiff, TOML
end
```

# How closely it matches Libxc

The kernels are translations, so the question that matters is how closely they
reproduce the library they were translated from. The answer is recorded in the
shipped files rather than only claimed here.

## Two builds, because one question needs each

| build | used for |
|---|---|
| the one `Libxc.jl` vendors, **7.0.0** | the corpus-wide comparison the test suite runs, which anyone can reproduce with `] add Libxc` |
| a build of the pinned sources, plus a `MAXORDER=4` one | the kernel-by-kernel comparison, and the third and fourth derivatives, which the vendored build does not implement |

The vendored build is what the suite can rely on, and the one a reader can
check for themselves. But it is a *release*, and the kernels here were
translated from a development state after 7.1.2, so where upstream changed a
functional in between, the vendored build is the one out of date. Eleven
functionals are in that position, with the worst relative difference between
the two libraries beside each:

| functional | between the two libraries | what upstream changed |
|---|---|---|
| `gga_c_wi` | 18.2 | typos in parameter values |
| `lda_c_1d_loos` | 0.889 | corrected coefficients |
| `hyb_mgga_xc_x1b95` | 1.38 | the `a1` coefficient and the exchange prefactor |
| `hyb_mgga_xc_xb1k` | 0.419 | the same correction |
| `mgga_c_rregtm` | 0.355 | not named in the ChangeLog; measured only |
| `hyb_mgga_xc_b0kcis` | 0.109 | no longer double-counts correlation |
| `mgga_xc_lp90` | 4.7e-2 | not named in the ChangeLog; measured only |
| `gga_c_sg4` | 3.1e-3 | `mu^MGE2` became 0.26 |
| `mgga_xc_otpss_d` | 2.4e-3 | correlation parameters corrected to match the erratum |
| `gga_x_hjs_b97x` | 1.1e-6 | not named in the ChangeLog; measured only |
| `gga_x_wpbeh` | 5.6e-9 | exact Ernzerhof–Gustavsson constants in the low-gradient switch, which is what made HSE06's molecular gradients inconsistent |

These eleven are compared against the pinned sources instead
(`CORRECTED_AFTER_7_0_0` in `test/corrected_after_7_0_0.jl`). Six further
identifiers are mixes holding one of them and inherit the difference.

What puts a functional in that table is the measurement and not the ChangeLog,
because from inside the suite the two readings of a disagreement, upstream
changing the functional or this package translating it wrongly, are the same
observation: there is one library to call. Called against both, each of the
eleven has the two libraries differing while this package follows the pinned
one to 7.5e-15 or better. Three of the eleven have no ChangeLog entry naming
them.

## What the manifest records

`src/generated/manifest.toml` says once, at the top, which Libxc the corpus
came from, and then repeats it per entry so that a partial regeneration cannot
leave the file self-inconsistent: 441 copies, all checked against the one at
the top by the suite.

```jldoctest
julia> using TOML

julia> m = TOML.parsefile(joinpath(pkgdir(LibXcDerivative), "src", "generated", "manifest.toml"));

julia> m["upstream_version"], m["upstream_commit"][1:7]
("7.1.2", "5d5076f")

julia> using Dates

julia> DateTime(m["generated_at"]) isa DateTime
true
```

Each kernel entry carries an `agreement` table: the inputs used, the Libxc
version measured against, when, and three figures per entry-point name and
per slot. Every one of the 283 kernels has one, covering 543 entry-point names
at orders 0 through 2: `zk`, `vrho` and `v2rho2`, which is as far as the pinned
`MAXORDER=2` build goes.

The three figures are the worst absolute difference over the sweep, that
difference divided by the largest value the slot takes on it, and the worst of
the per-point ratios. Two relative figures because neither alone is honest:
the scaled one hides a point where the slot is small, and the pointwise one
reports a zero crossing as a disagreement. Both are explained below, with what
separating them is worth in practice.

Beside it, 275 of those kernels carry a `high_agreement` table of the same
shape, covering 530 names at third and fourth order: the `v3*` and `v4*`
slots, up to 55 of them for a meta-GGA. Those orders are measured against a
`MAXORDER=4` build of the pinned sources, since the library Libxc.jl vendors
stops at second order. Four kernels with an energy
have no `high_agreement` table, and the reason is upstream's: `gga_x_wpbeh`,
`mgga_x_r2scan`, `mgga_c_r2scan` and `mgga_x_r4scan` are capped at second
order in Libxc's own generator, their piecewise junctions being only `C2`
there, so there is nothing above second order to compare against.

The worst recorded differences, over all of it:

| slot | worst relative difference | on |
|---|---|---|
| `zk` | 2.1e-9 | `hyb_mgga_x_m06_hf` |
| `vrho` | 1.0e-9 | `mgga_c_m08_hx` |
| `v2rho2` | 3.0e-9 | `gga_x_beefvdw` |

The manifest holds these figures rather than the prose, so each one is stated
once and in the same units.

## Above second order, where the measure has to be chosen first

The orders above second need a build configured for them, which the library
Libxc.jl vendors is not; the manifest's `high_agreement` table holds them,
measured against a `MAXORDER=4` build of the pinned sources. Two things about
those comparisons belong here, because each has already caught a wrong
claim.

**One figure scaled by the quantity, one taken pointwise, and both recorded.**
`gga_c_pbe`'s `v2rho2` changes sign at `rho` ≈ 0.7348. Two values that differ
by 2.8e-17 there differ by 1.3e-10 *relatively*, so a pointwise relative
difference reports the zero crossing rather than the agreement. Dividing the
largest absolute difference over a sweep by the largest value on it gives
3.2e-15 for the same pair, which is where every other component of that tensor
sits.

That scaled figure has the opposite failure, and it is larger than it looks.
Where a slot is small at one point and large at another, dividing by the
largest value hides how badly the small point did: `gga_x_beefvdw`'s
`v3rhosigma2` reports 5.9e-08 scaled against 4.2e-06 pointwise, a factor of
71, and its `v4rho2sigma2` a factor of 334. A `BigFloat` evaluation of that
expression says it is ill conditioned rather than wrong, but 5.9e-08 is not
what a caller differentiating it there gets. So both figures are written down,
for every slot, and the pointwise one is never the smaller of the two.

**At third order the `sigma` direction loses digits, and nothing else does.**
Over `rho` log-spaced on `[1e-3, 10]` with `sigma = rho^(8/3)`, 20,000 points,
scaled as above, against a `MAXORDER=3` build of the pinned sources:

| slot | `gga_x_pbe` | `gga_c_pbe` |
|---|---|---|
| `v3rho3` | 4.5e-15 | 4.6e-14 |
| `v3rho2sigma` | 4.8e-15 | 3.7e-15 |
| `v3rhosigma2` | 7.3e-15 | 6.1e-15 |
| `v3sigma3` | **8.7e-13** | **1.1e-12** |

Differentiating three times in the one variable that enters only through `s^2`
is where the chain keeps subtracting nearly equal terms. It is the direction
and not the functional: both of these show it, and the other three components
of the same tensor stay where the second derivatives are.

Corpus-wide, 1e-12 is not the worst case, and the worst case is not this
package's: over all three families, 530 names have a third or fourth
derivative to compare, 98 of them are above 1e-12, and the worst is 4.4e-6
(`mgga_x_br89_explicit`, `v4rhotau3`). Evaluating the same expression in
`BigFloat` shows neither side at fault there: that kernel is too ill
conditioned for a fourth derivative in double precision. The bounds held at
these orders are therefore per kernel rather than corpus-wide, 1e-12 for the
`gga_x_pbe` and `mgga_x_scan` kernels and 1e-10 across the variants that come
back from the same call.

## Tolerance tiers

Everything is held to `atol=1e-10` against Libxc, except for eight kernels and
variant entry points that are allowed a relative bound of `1e-7` instead, with
the measured worst case recorded beside each in
[`LibXcDerivative.LIBXC_LOOSE_AGREEMENT`](@ref).

Three things about that tier are deliberate:

* **The strict bound is the default.** With the looser one as the default, a
  functional that began disagreeing by 1e-8 would ship with nothing noticing.
* **One figure for the whole tier, not one fitted per entry.** Everything that
  misses 1e-10 lies between 2.7e-10 and 2.4e-8, so `1e-7` is where the
  boundary falls on its own. A figure chosen to admit a particular functional
  is a figure that admits whatever comes next, and `gga_x_hjs_b97x`, whose
  1.1e-6 has no identified cause, is outside it and is not shipped at all.
* **A mix inherits its components' bound**, read off the `<name>_components`
  the generated source carries rather than from a second list. The four mixes
  holding `mgga_c_kcis` miss `atol=1e-10` by about 2e-9, which is that
  kernel's own 2.4e-8 arriving with its coefficient.

The table lives in the package rather than in the test suite, so everything
that holds a functional to the rule reads the same copy of it.

## Checking it yourself

The test suite compares against `Libxc.jl`'s vendored library, so the
comparison needs nothing but Julia:

```
julia --project=test test/runtests.jl
```

Every function named on this page is listed, with its full
docstring, under [Public methods](@ref).
