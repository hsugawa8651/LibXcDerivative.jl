```@meta
DocTestSetup = quote
    using LibXcDerivative, ForwardDiff, TOML
end
```

# What is Libxc's and what is ours

This package answers two very different kinds of question, and a caller who
mixes them up gets a confident wrong answer. One kind is *what is this
functional*: its family, which arguments it reads, who to cite. Libxc is the
authority on those, and they are read out of Libxc rather than parsed from a
name. The other kind is *what can you compute*, and there this package's
answer is not Libxc's.

## The fact layer reports Libxc, not this package

```jldoctest
julia> identifier_facts(:mgga_x_scanl)
IdentifierFacts(:mggal, :x, true, false, true)

julia> libxc_derivatives(:hyb_gga_xc_hse06)
(0, 1, 2)
```

That second line says Libxc provides the energy, the potential and the second
derivative for HSE06, and nothing above. It does **not** say this package stops
there. One more `ForwardDiff` step through [`xc_fxc`](@ref) gives the third
derivative of the same functional, expensively at 260 s of compilation, but it
comes out. [`libxc_derivatives`](@ref) is a fact about Libxc that a caller
porting from Libxc may need; it is not a limit here.

Running the other way: Libxc provides a third derivative for 688 of its 702
identifiers and a fourth for 667, while the slot layer here answers for
anything with an energy, at each of the four orders Libxc names. And running the other way again: Libxc
computes things no expression here does at all. See [Limitations](@ref).

## A flag can be a fact about the build instead

Reading a property out of Libxc means reading it out of **a** Libxc, and a
build has settings. The same mistake was made four times here before the rule
was written down, and each time it shipped as if it were a property of the
functional:

| what was read | what it actually depended on |
|---|---|
| `libxc_derivatives` | `MAXORDER`: the default build is 2, so everything looked capped at 2 |
| `:have_kxc`, `:have_lxc` | the same, those bits being `#define`d to 0 below the matching order |
| `:on_host`, `:on_device` | whether the library was built with CUDA or HIP |
| `:enforce_fhc` | the `DISABLE_FHC` CMake option, OR'd into every functional at init |

The giveaway each time was the **shape of the count**. A flag carried by all
697 identifiers, or by none, is the shape a build setting makes;
`:needs_tau` at 219 and `:development` at 13 are the shape of a property.
Eight of the twenty bits sit at one end or the other, and each of the eight is
accounted for in [`libxc_flags`](@ref)'s own docstring, with a test that fails
if a flag reaches 0 or 697 and the docstring does not name it. Stating the rule
without checking it is exactly how `:enforce_fhc` got shipped as a fact.

So: three of the eight are not facts about the functional at all.

```jldoctest
julia> :enforce_fhc in libxc_flags(:lda_x)   # an LDA has no tau to clamp
true
```

The tables in this package are read from a `MAXORDER=4` build of the pinned
sources, which is why the orders above are right. Values are still compared
against the `MAXORDER=2` build, which is what everything else uses.

## Two things that look like gaps and are not

* **No integer identifier.** Libxc has `XC_GGA_X_PBE = 101`, and six C
  functions that translate between numbers and names. There is no number
  anywhere here, but there is none in `Libxc.jl` either: its `Functional` has
  no `number` field. Code that selects a functional by Libxc's integer has
  nothing to port *to* in either package.
* **`is_hybrid` and friends are defined but not exported.** All four of
  `is_hybrid`, `is_range_separated`, `is_global_hybrid` and `is_vv10` exist as
  `LibXcDerivative.is_hybrid` and so on. They are left unexported on purpose:
  `Libxc.jl` exports the same four words, and `using LibXcDerivative, Libxc`,
  which is precisely what someone porting writes, would then make every use of
  them ambiguous.

Every function named on this page is listed, with its full
docstring, under [Public methods](@ref).
