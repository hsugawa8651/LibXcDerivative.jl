```@meta
DocTestSetup = quote
    using LibXcDerivative, ForwardDiff, TOML
end
```

# Calling a functional

A functional is a function. There is no object to construct, no handle to free,
and nothing to initialise: `using LibXcDerivative` brings 697 functionals into
scope, and each one is called with a density.

```jldoctest
julia> lda_x(0.5)
-0.5861944813475805

julia> gga_x_pbe(1.0, 0.2)
-0.739404537509313
```

The value is Libxc's `zk`: the exchange-correlation energy **per particle**,
not per unit volume. The energy density is `rho * zk`, and that distinction is
the one place where Libxc's conventions bite hardest. See
[Derivatives](@ref).

## How many arguments

The argument list is fixed by the family, which [`libxc_family`](@ref) answers,
and the spin case is the shape of the call rather than a flag passed to it:

| family | unpolarized | spin-polarized |
|---|---|---|
| `:lda` | `f(rho)` | `f(na, nb)` |
| `:gga` | `f(rho, sigma)` | `f(na, nb, gaa, gab, gbb)` |
| `:mgga` | `f(rho, sigma, lapl, tau)` | `f(na, nb, gaa, gab, gbb, la, lb, ta, tb)` |
| `:mggal` | `f(rho, sigma, lapl, tau)` | `f(na, nb, gaa, gab, gbb, la, lb, ta, tb)` |

`sigma` is `|∇rho|²`, and spin-polarized it is the three pseudo-spin
components `(aa, ab, bb)` in Libxc's order. `lapl` is `∇²rho` and `tau` is the
kinetic energy density. A meta-GGA that has no Laplacian dependence still takes
the argument. `:mgga` and `:mggal` differ in whether it is read, which
[`needs_laplacian`](@ref) answers, not in the call.

```jldoctest
julia> libxc_family(:mgga_x_scanl), needs_laplacian(:mgga_x_scanl)
(:mggal, true)
```

That example is the reason the family is read from Libxc rather than parsed off
the name: `mgga_x_scanl` says only `mgga`, and reads the Laplacian.

## Parameters

Every functional carries the thresholds and constants Libxc itself uses. They
are in `<name>_defaults`, a `NamedTuple`:

```jldoctest
julia> gga_x_pbe_defaults
(dens_threshold = 1.0e-15, params_a_kappa = 0.804, params_a_mu = 0.2195149727645171, zeta_threshold = 2.220446049250313e-16)
```

and overridden through the `params` keyword:

```jldoctest
julia> gga_x_pbe(1.0, 0.2; params = (; params_a_kappa = 0.9))
-0.7394046660259388
```

### An override that names nothing is refused

```julia
julia> gga_x_pbe(1.0, 0.2; params = (; params_a_kapa = 0.9))
ERROR: ArgumentError: unknown parameter(s) (:params_a_kapa,); this functional
accepts (:dens_threshold, :params_a_kappa, :params_a_mu, :zeta_threshold)
```

This is deliberate, and it is the one place where the package is stricter than
`merge` would be. `merge(defaults, params)` accepts an unknown name silently:
it adds a field nobody reads, the default stays in force, and the caller's
value is discarded without a word. A misspelled parameter would then produce a
plausible number that is not the one asked for. Both checks run on tuples of
symbols, so they happen at compile time and the call still allocates nothing.

### Some functionals have no defaults to fall back on

`<name>_required` names what the caller still has to supply. For most
functionals it is empty. Where it is not, Libxc has no default for those values
either, since they come from the C side's own initialisation, and leaving them
out is an error rather than a guess:

```jldoctest
julia> mgga_k_lk_defaults, mgga_k_lk_required
(NamedTuple(), (:dens_threshold, :params_a_kappa, :zeta_threshold))
```

```julia
julia> mgga_k_lk(1.0, 0.2, 0.0, 0.5)
ERROR: ArgumentError: missing parameter(s) (:dens_threshold, :params_a_kappa,
:zeta_threshold): this functional has no default for them, so they have to be
given explicitly
```

## The kernel underneath, and its argument order

Each entry point is a thin wrapper: it resolves the parameters, converts the
density to Libxc's reduced variables, and calls a kernel named
`<name>_energy`. Several registered names can share one kernel: `gga_x_pbe`,
`gga_x_xpbe` and `gga_x_t_pbe2` all call `gga_x_pbe_energy` with different
parameter values, exactly as Libxc registers them.

The kernel is exported too, and it takes reduced variables and every parameter
as **positional** arguments. Its order is whatever `sort(extra_params)`
produced when the file was generated, and it is written in an `# args:`
comment at the top of the file:

```
# args: rs, z, xt, xs0, xs1, dens_threshold, params_a_kappa, params_a_mu, zeta_threshold
```

A positional call against that order is fragile in the quietest way, giving a
wrong number rather than an error if the order shifts, so a call site that
wants the kernel is better off naming its arguments:

```julia
pbe_kernel(; rs, z, xt, xs0, xs1, dens_threshold, params_a_kappa, params_a_mu, zeta_threshold) =
    gga_x_pbe_energy(rs, z, xt, xs0, xs1, dens_threshold, params_a_kappa, params_a_mu, zeta_threshold)
```

The reduced variables themselves come from [`lda_variables`](@ref),
[`gga_variables`](@ref) and [`mgga_variables`](@ref), which are Libxc's own
definitions transcribed from `libxc_codegen.py`.

## Functionals Libxc builds by mixing others

154 identifiers are not kernels of their own: Libxc evaluates them as a
weighted sum of other functionals. In this package they are written out as
that sum, so they are called exactly like any other name, and the coefficients
come from
Libxc rather than from the name.

What Libxc keeps beside a functional rather than inside a kernel (a hybrid's
exact-exchange fraction, a screened functional's range-separation parameters,
the VV10 constants) is reached through [`mixing_parameters`](@ref) and the
accessors beside it, for the 180 identifiers that have any:

```jldoctest
julia> exx_coefficient(:hyb_gga_xc_pbeh)          # a global hybrid: one fraction
0.25

julia> exx_coefficient(:hyb_gga_xc_hse06) === nothing   # screened: there is not one
true

julia> xc_hyb_cam_coef(:hyb_gga_xc_hse06)
(omega = 0.11, alpha = 0.0, beta = 0.25)
```

`exx_coefficient` answers `nothing` for a range-separated functional rather
than inventing a single number for it, which is why the screened ones are
read through [`xc_hyb_cam_coef`](@ref) instead.

A name this package does not ship is refused here rather than answered with a
zero entry, for the same reason a misspelled parameter is: "not a hybrid" for a
typo would silently leave exact exchange out of a calculation that needed it.

## The seven that return a potential

Seven identifiers have no energy at all, Libxc reporting none for them, so they
ship under a `*_vxc` name and return a potential directly. They are counted
apart from the 690, and the slot functions refuse them by name rather than
returning a meaningless `zk`:

```jldoctest
julia> has_exc(:mgga_x_tb09), mgga_x_tb09_vxc(0.5, 0.1, 0.0, 0.3)
(false, -1.0439878034148984)
```
