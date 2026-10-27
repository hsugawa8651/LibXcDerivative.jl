# Public methods

The package exports **2659** names, of which **52** are hand-written. The list
below is that hand-written surface; the functionals themselves are described by
their naming rule rather than enumerated.

The generated names are not a fixed number per functional, and the shape is
worth knowing before reading the rule:

| names | how many | what they are |
|---|---|---|
| `<name>` | 715 | an entry point under a functional's own name |
| `<name>_vxc` | 8 | an entry point returning a potential (group 8) |
| `<name>_defaults`, `<name>_required` | 732 each | one pair per entry point |
| `<name>_energy` | 279 | a kernel, fewer than the entry points because several registered names share one |
| `<name>_potential` | 4 | the potential-only kernels |
| `<name>_components` | 154 | the recipe of a functional Libxc evaluates as a weighted sum |

The 732 entry points cover Libxc's 697 identifiers, plus 35 kernels Libxc does
not register under a name of their own but which are callable here anyway.

The grouping follows Libxc's own division of its C API where there is one, with
one group added: Libxc's kernels call mathematical helpers that `xc.h` does not
declare, and this package exports them because its kernels call them too.

## 1. The functionals themselves

Not listed here, there being 697 of them. Each identifier gives at least three
exported names, and a fourth if it has a kernel of its own:

| name | what it is |
|---|---|
| `gga_x_pbe` | the entry point: density in, `zk` out, `params` keyword |
| `gga_x_pbe_defaults` | the thresholds and constants Libxc uses, a `NamedTuple` |
| `gga_x_pbe_required` | what has no default and must be supplied |
| `gga_x_pbe_energy` | the kernel: reduced variables and every parameter, positional |

Only 245 of the 697 have a `<name>_energy` of their own. The rest reach a
kernel registered under another name: `gga_x_xpbe` and `gga_x_t_pbe2` both call
`gga_x_pbe_energy` with different parameter values, so `gga_x_xpbe_energy` does
not exist. A functional Libxc evaluates as a weighted sum has a
`<name>_components` instead of a kernel.

Seven identifiers that return a potential instead carry a `_vxc` suffix on the
entry point (group 8). [`available_identifiers`](@ref) lists every identifier;
[Calling a functional](@ref) explains the names.

## 2. Evaluation and derivatives

```@docs
xc_exc_vxc
xc_fxc
xc_kxc
xc_lxc
slot_names
slot_widths
param_gradient
```

## 3. Preparing the input

```@docs
libxc_clamp
LibXcDerivative.resolve_params
param_names
param_defaults
param_point
params_from
LibXcDerivative.THRESHOLD_PARAMS
```

`param_gradient` belongs with the derivatives above and is documented there.

## 4. Facts about a functional

```@docs
identifier_facts
IdentifierFacts
libxc_family
libxc_kind
has_exc
needs_tau
needs_laplacian
libxc_flags
libxc_derivatives
libxc_references
LibxcReference
identifier_text
IdentifierText
functional_name
available_identifiers
```

How closely those facts are this package's rather than Libxc's is the subject
of [What is Libxc's and what is ours](@ref).

### Which Libxc the expressions came from

There is no library at run time to ask for a version, so the package carries
the answer.

```@docs
libxc_source_version
libxc_source_commit
```

### How close the package claims to be

Not exported, and in the package rather than in `test/`, so that everything
holding a functional to the rule reads the same copy of it.

```@docs
LibXcDerivative.LIBXC_LOOSE_AGREEMENT
LibXcDerivative.LIBXC_PLATFORM_FLOOR
LibXcDerivative.libxc_loose_tolerance
LibXcDerivative.agrees_with_libxc
```

## 5. The mixing layer

What Libxc keeps beside a functional rather than inside a kernel.

```@docs
mixing_parameters
MixingParameters
exx_coefficient
cam_alpha
cam_beta
cam_omega
nlc_b
nlc_C
xc_hyb_exx_coef
xc_hyb_cam_coef
```

`is_hybrid`, `is_range_separated`, `is_global_hybrid` and `is_vv10` belong here
too. They are **defined but not exported**, because `Libxc.jl` exports the same
four words and `using LibXcDerivative, Libxc` would make every bare use of them
ambiguous. Reach them as `LibXcDerivative.is_hybrid` and so on.

```@docs
LibXcDerivative.is_hybrid
LibXcDerivative.is_range_separated
LibXcDerivative.is_global_hybrid
LibXcDerivative.is_vv10
```

## 6. Reduced variables

Libxc does not hand a density to a kernel; it hands reduced variables. These
are Libxc's own definitions, transcribed from `libxc_codegen.py`.

```@docs
lda_variables
gga_variables
mgga_variables
```

## 7. Libxc's mathematical functions

Libxc's kernels call helpers under Libxc's own spellings, declared in
Libxc's `src/util.h` rather than in its public `xc.h`. This package's kernels call them
under the same names, so they are exported under the same names, which is also
what makes a generated file readable next to the `.py` it came from.

```@docs
xc_log1p
xc_expm1
xc_asinh
xc_atanh
xc_x_minus_log1p
atan2
xc_erfcx
Abs
BesselI
br89_x
mbrxc_x
LambertW
xc_dilogarithm
xc_E1_scaled
my_piecewise3
my_piecewise5
```

## 8. Potential-only entry points

Seven identifiers for which Libxc reports no energy at all. They return a
potential directly, so they have no `zk`, and the derivative functions in group
2 refuse them by name rather than returning a meaningless number.

There are eight entry points for those seven identifiers. The eighth,
`mgga_x_2d_prp10_vxc`, is one of the 35 kernels Libxc does not register under a
name of its own: the only registered functional built on it is
`mgga_x_2d_prhg07_prp10`. It is callable here, and there is nothing in Libxc to
compare it against on its own, which the test suite asserts by name rather than
skipping.

```@docs
lda_xc_tih_vxc
gga_x_lb_vxc
gga_x_lbm_vxc
mgga_x_bj06_vxc
mgga_x_tb09_vxc
mgga_x_rpp09_vxc
mgga_x_2d_prhg07_prp10_vxc
mgga_x_2d_prp10_vxc
```

## 9. Connections to other packages

```@docs
dft_functional
```

`dft_functional` wraps an entry point in the interface `DftFunctionals.jl`
defines, which is what `DFTK.jl` consumes, including the spin-resolved
evaluation that interface's own generic path declines. The extension also
provides `potential_terms` and `energy_density` for the meta-GGA families.

### Which extension gives you what

Everything in this package that differentiates, or that speaks another
package's interface, lives in an extension. Loading the package alone leaves
those names **defined with zero methods**, so calling one raises a
`MethodError` rather than anything that mentions an extension.

| load this | and these work |
|---|---|
| nothing | groups 1, 3 (`libxc_clamp`), 4, 5, 6, 7, 8 |
| `ForwardDiff` | group 2 in full |
| `ChainRulesCore` | Zygote over the scalar entry points (the `NaNMath.sqrt` rule lives there) |
| `Symbolics` | symbolic tracing through a functional |
| `DftFunctionals` + `ComponentArrays` | group 9 |

None of those four is a dependency of this package.

## What Libxc has and this does not

* **`evaluate!` and the array interface**, about 33 C functions. Absent, and
  the one gap that needs a design decision rather than transcription.
* **A version constant** (`Libxc.libxc_version`). Absent.
* **Integer identifiers** (`XC_GGA_X_PBE = 101`) and the six C functions that
  translate between numbers and names. Absent, and absent from `Libxc.jl`
  too, whose `Functional` has no `number` field.

[Limitations](@ref) says more about each.

## Methods that come from elsewhere

Three functions a caller may expect to find here are deliberately *not*
exported, because they belong to packages the caller can load directly:

| what | where it comes from |
|---|---|
| `erf`, `erfc` | `SpecialFunctions`: the kernels call them and resolve them internally; 16 of 283 do |
| `sqrt`, `pow`, `log` on arguments that may go out of domain | `NaNMath`, which is a dependency, and whose spellings appear in the generated files |
| derivative rules for the above | `DiffRules` (for ForwardDiff) and `ChainRulesCore` (for Zygote) |

`erf` and `erfc` are not re-exported: that would put two names into the
caller's scope that this package neither defines nor documents.
