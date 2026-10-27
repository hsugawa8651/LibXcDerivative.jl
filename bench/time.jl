# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

# Nanoseconds per point, per functional and order.
#
# The documentation reports figures of this kind and says they belong to the
# machine they were taken on. This is how to take them on another one. The
# numbers printed here are not comparable with the ones in the
# documentation: that table is against a build of the pinned Libxc sources,
# which this script has no way to call, and it uses a larger N. What carries
# over is the shape, which is what the table is read for.
#
# First calls are excluded. Compiling a functional at an order is paid once
# and is reported separately, because for the higher orders it is the larger
# of the two costs by far.

using LibXcDerivative
# The slot functions come from the ForwardDiff extension, so the package on
# its own does not have them.
using ForwardDiff
using Printf

# Raise it for a steadier figure; the default keeps the whole script to a
# minute or so, most of which is compilation.
const N = parse(Int, get(ENV, "BENCH_N", "10000"))
const REPS = parse(Int, get(ENV, "BENCH_REPS", "5"))

const rho = collect(range(0.05, 5.0, length = N))
const sigma = 0.1 .* rho
const lapl = 0.05 .* rho
const tau = 0.3 .* rho

# The sweeps are top-level functions reading their inputs from arrays for the
# reasons bench/allocation.jl gives, and the measurement takes the sweep
# through a type parameter for the third of them.
function value_lda(f::F, r) where {F}
    acc = 0.0
    for i in eachindex(r)
        acc += f(r[i])
    end
    return acc
end

function value_gga(f::F, r, s) where {F}
    acc = 0.0
    for i in eachindex(r)
        acc += f(r[i], s[i])
    end
    return acc
end

function value_mgga(f::F, r, s, l, t) where {F}
    acc = 0.0
    for i in eachindex(r)
        acc += f(r[i], s[i], l[i], t[i])
    end
    return acc
end

function slots_lda(slot::S, f::F, r) where {S,F}
    acc = 0.0
    for i in eachindex(r)
        acc += sum(values(slot(f, r[i])))
    end
    return acc
end

function slots_gga(slot::S, f::F, r, s) where {S,F}
    acc = 0.0
    for i in eachindex(r)
        acc += sum(values(slot(f, r[i], s[i])))
    end
    return acc
end

function slots_mgga(slot::S, f::F, r, s, l, t) where {S,F}
    acc = 0.0
    for i in eachindex(r)
        acc += sum(values(slot(f, r[i], s[i], l[i], t[i])))
    end
    return acc
end

# What the first call costs, and then the per-point figure with that call
# already paid: the smallest of several runs, since a slow run is the machine
# doing something else and a fast one is not.
#
# `@nospecialize` and `invokelatest` together are what make the first column
# a measurement. Given the sweep through a type parameter instead, Julia
# compiles the call into this function, which happens before the first line
# of it runs: the timer then starts with the compiling already done and the
# column reads zero for every row, including the ones that take seconds.
function timings(@nospecialize(call))
    first = time_ns()
    invokelatest(call)
    compile = (time_ns() - first) / 1e9
    best = typemax(UInt64)
    for _ in 1:REPS
        t = time_ns()
        invokelatest(call)
        best = min(best, time_ns() - t)
    end
    # One dispatch per sweep rather than per point, so it is below the digit
    # printed as long as N is not tiny.
    return compile, best / N
end

# The same loop with the functional read from a global whose type is not
# known where the loop is compiled, which is the comparison the docstring of
# `xc_exc_vxc` reports. bench/allocation.jl shows what it costs in bytes.
module Untyped
using LibXcDerivative, ForwardDiff
functional = gga_x_pbe
function sweep(r, s)
    acc = 0.0
    for i in eachindex(r)
        v = xc_exc_vxc(functional, r[i], s[i])
        acc += v.zk + v.vrho + v.vsigma
    end
    return acc
end
end

const ROWS = [
    ("lda_x", "value", () -> value_lda(lda_x, rho)),
    ("lda_x", "exc_vxc", () -> slots_lda(xc_exc_vxc, lda_x, rho)),
    ("lda_x", "fxc", () -> slots_lda(xc_fxc, lda_x, rho)),
    ("lda_x", "kxc", () -> slots_lda(xc_kxc, lda_x, rho)),
    ("gga_x_pbe", "value", () -> value_gga(gga_x_pbe, rho, sigma)),
    ("gga_x_pbe", "exc_vxc", () -> slots_gga(xc_exc_vxc, gga_x_pbe, rho, sigma)),
    ("gga_x_pbe", "fxc", () -> slots_gga(xc_fxc, gga_x_pbe, rho, sigma)),
    ("gga_x_pbe", "kxc", () -> slots_gga(xc_kxc, gga_x_pbe, rho, sigma)),
    ("mgga_x_scan", "value", () -> value_mgga(mgga_x_scan, rho, sigma, lapl, tau)),
    ("mgga_x_scan", "exc_vxc",
     () -> slots_mgga(xc_exc_vxc, mgga_x_scan, rho, sigma, lapl, tau)),
    ("mgga_x_scan", "fxc",
     () -> slots_mgga(xc_fxc, mgga_x_scan, rho, sigma, lapl, tau)),
    ("mgga_x_scan", "kxc",
     () -> slots_mgga(xc_kxc, mgga_x_scan, rho, sigma, lapl, tau)),
    ("gga_x_pbe, untyped global", "exc_vxc", () -> Untyped.sweep(rho, sigma)),
]

function main(rows)
    @printf("N = %d points, the best of %d runs, on %s, Julia %s\n\n",
            N, REPS, Sys.CPU_NAME, VERSION)
    @printf("%-26s %-9s %12s %14s\n", "functional", "order", "ns/point",
            "first call, s")
    println("-"^64)
    for (name, order, call) in rows
        compile, per = timings(call)
        @printf("%-26s %-9s %12.1f %14.1f\n", name, order, per, compile)
    end
    println()
    println("The first-call column is compilation, paid once per functional and ",
            "order,\nand only if the call is made.")
end

main(ROWS)
