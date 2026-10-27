# Measuring what a call costs

The documentation reports what calls here cost, in the table of nanoseconds
per point on the Derivatives page, in the first-call figures on the
Limitations page, and in the docstrings of `xc_exc_vxc` and `xc_kxc`.
Each of those says the figures belong to the machine they were taken on.
These two scripts are how to take them on another one.

```
julia --project=bench -e 'using Pkg; Pkg.develop(path="."); Pkg.instantiate()'
julia --project=bench bench/allocation.jl
julia --project=bench bench/time.jl
```

Run from the root of a clone. Neither script is part of the test suite, and
neither is run in CI.

## `allocation.jl`

Bytes allocated per point, for nineteen call shapes. This figure does not
belong to the machine: the same shape under the same version of Julia gives
the same number anywhere, which is why it is the one the test suite asserts
on. It is not the same on every version, and two rows show that.

The rows come in three kinds, and the `expected` column says which. Five
should allocate nothing: four are shapes the test suite pins at zero, and the
fifth is the one `params_from`'s docstring says costs nothing. Two should
allocate, and they are the reason the script is worth running, since a row
that reads zero says nothing unless the rows that should not read zero do
not. The script exits non-zero if either kind comes out otherwise.

The remaining twelve are reported rather than expected. They are the slots
above the first derivative, polarized and not, which nothing pins at any
figure. Finding out what they are is what the script is for, and
docs/src/limits.md says what it found.

Most of what the script spends goes on compiling the high-order slots, not on
the measurement.

## `time.jl`

Nanoseconds per point, per functional and order, as the best of several runs,
and the cost of the first call at each of them separately. Compiling a
functional at an order is paid once; above second order it is the larger of
the two costs.

`BENCH_N` sets the number of points, `BENCH_REPS` the number of runs. The
defaults keep the whole script under a minute, most of which is compiling.

What this does not give you is the comparison the Derivatives page makes. The
C column there is against a build of the pinned Libxc sources, built to third
order, and nothing here can call it: this package evaluates its own
expressions and links no library. So the ratio is not reproducible from a
clone, while the column beside it is.
