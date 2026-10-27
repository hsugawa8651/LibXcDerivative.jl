```@meta
DocTestSetup = quote
    using LibXcDerivative, ForwardDiff, TOML
end
```

# Coming from Libxc.jl

`Libxc.jl` wraps Libxc's C library: a functional is an object you construct,
and you fill arrays through it. In this package a functional is a function
and the spin case is the shape of the call. Everything `Libxc.jl` answers has
an answer here, in a different form, with **one exception** named at the
bottom of this page.

## Side by side

### Getting a functional

| `Libxc.jl` | this package |
|---|---|
| `f = Functional(:gga_x_pbe)` | nothing to construct: `gga_x_pbe` *is* the functional |
| `Functional(:gga_x_pbe; n_spin = 2)` | the shape of the call: `gga_x_pbe(na, nb, gaa, gab, gbb)` |
| `f.identifier` | the `Symbol` you were going to pass |
| `f.pointer_` | there is no C object |

### Evaluating

| `Libxc.jl` | this package |
|---|---|
| `evaluate(f, rho = ρ)` → `.zk` | `gga_x_pbe(rho, sigma)` |
| `evaluate(f, rho = ρ)` → `.vrho`, `.vsigma` | [`xc_exc_vxc`](@ref)`(gga_x_pbe, rho, sigma)` |
| `evaluate(f, rho = ρ)` → `.v2rho2` … | [`xc_fxc`](@ref)`(gga_x_pbe, rho, sigma)` |
| — (returns nothing above second order) | [`xc_kxc`](@ref), [`xc_lxc`](@ref) |
| — | `xc_kxc(f, :v3rho3, …)`, one slot by name |
| `evaluate!(f, …)` into your arrays | **absent**, see below |

`evaluate` gives a `Dict`-like result whose keys depend on what was asked for;
the slot functions give a `NamedTuple` whose field set is fixed by the family,
so it is type-stable and there is no order to pass.

One deliberate difference inside that: `Libxc.jl` leaves out the fields a
functional has no dependence on, so a meta-GGA without a Laplacian gets a
narrower result. In this package those slots are present and zero, which is
the number Libxc would have written had it filled them. The test suite asserts
both behaviours, so the difference is pinned rather than incidental.

### Differentiating

| `Libxc.jl` | this package |
|---|---|
| a dual number through `evaluate` | the entry points are plain arithmetic |
| — | derivatives with respect to the parameters |
| orders fixed when the C library was built | the order is a property of the call |

`Libxc.jl` has no differentiation rules, and its `evaluate!` methods are typed
`rho::Array{Float64}`, so a dual number cannot enter them at all: what comes
back is a `MethodError`. Asking the vendored build for a third derivative is
refused in the same spirit, by an `ArgumentError` naming the orders it has.
[Derivatives](@ref) has what this package does instead, and over how much of
the corpus.

### Asking about a functional

| `Libxc.jl` | this package |
|---|---|
| `f.name` | [`functional_name`](@ref)`(:gga_x_pbe)` |
| `f.kind` | [`libxc_kind`](@ref) |
| `f.family` | [`libxc_family`](@ref) |
| `f.flags` | [`libxc_flags`](@ref) |
| `f.derivatives` / `supported_derivatives(f)` | [`libxc_derivatives`](@ref) |
| `f.references` | [`libxc_references`](@ref) |
| `f.spin_dimensions` | [`slot_widths`](@ref)`(family, order)` |
| `f.n_spin` | the shape of the call |
| `available_functionals()` | [`available_identifiers`](@ref) |
| `is_lda(f)`, `is_gga(f)`, `is_mgga(f)` | `libxc_family(f) === :lda` and so on |
| `needs_tau(f)`, `needs_laplacian(f)` | same names, same meaning |
| `is_hybrid`, `is_range_separated`, `is_global_hybrid`, `is_vv10` | defined, **not exported**: `LibXcDerivative.is_hybrid(f)` |
| — | [`mixing_parameters`](@ref), [`exx_coefficient`](@ref), [`cam_omega`](@ref) … |
| — | `<name>_defaults`, `<name>_required` |
| `Libxc.libxc_version` | [`libxc_source_version`](@ref), [`libxc_source_commit`](@ref): which Libxc the expressions came from |

The four `is_*` predicates are unexported on purpose. `Libxc.jl` exports the
same words, and `using LibXcDerivative, Libxc`, which is what someone porting
actually writes, would make every bare use of them ambiguous.

`available_identifiers` is a renaming rather than a form change, for the same
reason.

## A worked port

```julia
# Libxc.jl
using Libxc
f = Functional(:gga_x_pbe; n_spin = 1)
r = evaluate(f, rho = [1.0], sigma = [0.2])
r.zk[1], r.vrho[1], r.vsigma[1]
```

```jldoctest
julia> using LibXcDerivative, ForwardDiff

julia> s = xc_exc_vxc(gga_x_pbe, 1.0, 0.2);

julia> s.zk, s.vrho, s.vsigma
(-0.739404537509313, -0.983620539433825, -0.0042228323348605734)
```

Over a grid, the difference is that Libxc fills your arrays and this
broadcasts:

```julia
v = xc_exc_vxc.(gga_x_pbe, rho, sigma)          # Vector of NamedTuple
cols = (; vrho = getfield.(v, :vrho), vsigma = getfield.(v, :vsigma))
```

## The one thing that is missing

**`evaluate!`, writing into arrays you own.** There is no in-place entry
point. This is not an oversight waiting to be filled in by transcription:
`Libxc.jl`'s `evaluate!` is primitive because the *C* API is primitive. It
checks shapes, works out the highest order from the output names, and then
makes one `ccall` per family passing `C_NULL` for the outputs you did not ask
for, so Libxc does not compute them. None of that has a counterpart here,
where there is no C call to make one of and nothing is computed that was not
asked for. What an in-place form here would mean is the `potential_terms!` and
`kernel_terms!` of `DftFunctionals.jl`, implemented on top of the expressions,
and whether a no-allocation form is needed at all has not been measured. The
extension on `DftFunctionals` supplies the out-of-place half, `energy_density`
and `potential_terms`.

## Which Libxc the expressions came from

`Libxc.libxc_version` reports the version of the library a caller has loaded.
There is no library here, so the question this package answers instead is
which Libxc the expressions were generated from:

```jldoctest
julia> libxc_source_version()
v"7.1.2"

julia> libxc_source_commit()[1:7]
"5d5076f"
```

## And what runs the other way

`Libxc.jl` vendors a released Libxc; this package is generated from a pinned
development state after 7.1.2. Eleven functionals changed upstream *after*
the release `Libxc.jl` vendors, so on those the two packages disagree and this
one is the newer. [How closely it matches Libxc](@ref) names them.
