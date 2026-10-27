# LibXcDerivative.jl

Libxc's exchange-correlation functionals as native Julia expressions, generated
from Libxc's own SymPy sources rather than called through a C library.

```julia
using LibXcDerivative

lda_c_vwn(0.5)                        # a density is all it takes
lda_c_vwn(0.3, 0.2)                   # spin-resolved
hyb_gga_xc_hse06(0.5, 0.3)            # a screened hybrid's semi-local part
```

Each functional ships as a plain `.jl` file holding an ordinary Julia function.
It precompiles with the package, it differentiates with whatever automatic
differentiation the caller already uses, and it does not call Libxc at run
time.

## What this package is

> **This package provides 697 of Libxc's 702 identifiers as Julia expressions,
> generated from the pinned Libxc sources and evaluated with no Libxc at run
> time. The five that are not here have no expression to translate: Libxc
> computes them by runtime quadrature, or through spline helpers. They
> differentiate to third and fourth order through automatic differentiation,
> which the build `Libxc.jl` vendors does not reach, and every one of the 283
> kernels carries its measured agreement with a build of the pinned sources.
> Libxc's array interface, its GPU path and `evaluate!` have no counterpart
> here.**

That sentence is the claim the rest of these pages qualify, and every clause in
it is narrower than it could have been written:

* **697 of 702.** [Limitations](@ref) accounts for the five that are not
  here, one by one.
* **no expression to translate.** Four kernels, five identifiers between them.
  Libxc integrates three of them numerically at run time, and the body of the
  fourth calls spline helpers the generator does not resolve. They are not
  translation failures: for the first three there is no closed form to
  translate at all.
* **as Julia expressions.** Energy densities only. A potential, a kernel, or a
  fourth derivative is obtained by differentiating the expression, not by
  running generated derivative code as Libxc does.
* **no Libxc at run time.** No dependency on Libxc, on its C library, or on
  Python. It is *not* a dependency-free package: 16 of the 283 kernels call
  `erf` or `erfc` from `SpecialFunctions`, which reaches C, as Libxc's own
  kernels do through libm. See [Limitations](@ref).
* **third and fourth order.** The build of Libxc that `Libxc.jl` vendors
  returns nothing above second order, so there is no second opinion to check
  those against except a build of Libxc made for the purpose, which is what
  [How closely it matches Libxc](@ref) describes.
* **through automatic differentiation.** True of the scalar entry points,
  which are plain arithmetic, with one measured exception: 20 of the 154
  weighted sums overflow `Rational{Int128}` under Zygote. It is *not* true of
  the named-slot layer ([`xc_fxc`](@ref) and friends), which differentiates
  internally and therefore needs ForwardDiff specifically. [Derivatives](@ref)
  has the table.
* **every one of the 283 kernels.** `src/generated/manifest.toml` carries an
  agreement table per kernel: 543 entry-point names at orders 0 through 2,
  which is as far as the pinned `MAXORDER=2` build goes. Third and fourth
  order are measured against a build made for it, separately. See
  [How closely it matches Libxc](@ref).
* **no counterpart here.** Libxc fills arrays through about 33 C functions and
  carries a GPU path; neither is reproduced, and `Libxc.jl`'s `evaluate!` is
  the Julia face of the former. See [Limitations](@ref).

Two things it is *not*. It is not a drop-in replacement for `Libxc.jl`: there
is no in-place `evaluate!` and no functional object. And it is not a superset
of Libxc, which computes things no expression here does.

## Coverage, measured

The three words in the table are not interchangeable: an *identifier* is a
name Libxc registers, a *kernel* is one generated expression, and a
*functional* is what is callable under an identifier, which is either a kernel
of its own or a weighted sum of other functionals.

| | |
|---|---|
| identifiers callable from a density alone | **697** of Libxc's 702 |
| of those, with an energy | 690 |
| returning a potential instead | 7 |
| generated kernels | 283 |
| functionals written as a weighted sum of those | 154 |
| identifiers with mixing parameters Libxc keeps outside a kernel | 180 |
| literature citations carried | 845, over 439 distinct papers |

The remaining 5 are accounted for one at a time in
`src/generated/manifest.toml`, which also records what each shipped functional
was generated from and how closely it was measured to agree.

## Where to go next

| if you want to | read |
|---|---|
| call a functional and pass its parameters | [Calling a functional](@ref) |
| a potential, a kernel, or a fourth derivative | [Derivatives](@ref) |
| to know which facts are Libxc's and which are this package's | [What is Libxc's and what is ours](@ref) |
| to port code that uses `Libxc.jl` | [Coming from Libxc.jl](@ref) |
| to know how closely the numbers agree, and against what | [How closely it matches Libxc](@ref) |
| to know what does not work | [Limitations](@ref) |
| the list of exported functions | [Public methods](@ref) |
