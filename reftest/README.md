# Checking the shipped kernels against the sources they came from

The test suite compares this package against the Libxc the `Libxc.jl`
package vendors, which is the only library it can call. The agreement that
decided what ships is against the pinned sources under
`gen/libxc-upstream`, and those figures live in
`src/generated/manifest.toml` because the suite cannot measure them: it
would have to build that library first.

These two scripts build it and measure them. They are what the manifest's
numbers can be re-derived from, and they reach the two places the suite
cannot: the pinned library itself, and third and fourth order, which the
vendored build does not compute.

```
julia --project=reftest -e 'using Pkg; Pkg.develop(path="."); Pkg.instantiate()'
julia --project=reftest reftest/test_pinned.jl
julia --project=reftest reftest/test_corrections.jl
```

Run from the root of a clone, with Libxc's sources in `gen/libxc-upstream`
at the commit `src/generated/manifest.toml` names. The first run builds
Libxc from that pinned tree twice, once with the default
maximum derivative order and once with fourth order, which takes a few
minutes; later runs reuse both builds. A C compiler and CMake are needed,
Python is not.

Neither script is part of the test suite, and neither is run in CI.

## `test_pinned.jl`

Third and fourth derivatives against a build of the pinned sources made
with `MAXORDER=4`, slot by slot, for a named sample rather than for the
whole corpus: nine testsets, thirty-six assertions. It also checks the
shape of the comparison itself, that a potential-only family is refused
rather than compared, and that an order the build does not have is skipped
rather than asked for.

## `test_corrections.jl`

The other direction, over most of the corpus: it asks both libraries the
same question at three densities and sorts the names where they differ.
Five testsets, thirty-four assertions, and it reports how many identifiers
it reached, which is asserted to be over six hundred so that silence means
something.

What it is for is `test/corrected_after_7_0_0.jl`, the list of functionals
upstream changed after the release `Libxc.jl` vendors. For those the
vendored library is the one out of date, so the suite does not compare
against it. This script is what keeps that list honest in both directions:
every name on it is one the libraries disagree on, and every name they
disagree on is either on it, a mix holding one of its components, or
covered by `LibXcDerivative.LIBXC_PLATFORM_FLOOR`.

## What these scripts read, and what that costs

They are not self-contained. Each of these lives elsewhere in the
repository, and a change to one can leave a script here failing with
nothing to notice it, because nothing runs them on a schedule:

- `LibXcDerivative.LIBXC_PLATFORM_FLOOR` and
  `LibXcDerivative.LIBXC_LOOSE_AGREEMENT`, through
  `LibXcDerivative.agrees_with_libxc`, which is what decides whether two
  numbers count as disagreeing. Widening either one can turn a
  disagreement this file expects into agreement.
- `test/corrected_after_7_0_0.jl`, read directly, in four places.
- `LibXcDerivative.available_identifiers`, which sets how much of the
  corpus the sweep reaches and so whether the count above still clears six
  hundred.
- `<name>_components` on the generated mixes, which is how a mix inherits
  an exclusion from a component.
- the pinned tree's commit, which is what every pinned figure is a figure
  about.

So the figures and the greens here belong to a state of the repository, not
to the repository. Running them is the only way to find out whether that
state still holds.
