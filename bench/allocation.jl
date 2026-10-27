# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

# Bytes allocated per point, for the call shapes the docstrings describe.
#
# Unlike a time, this figure belongs to the program rather than to the
# machine: the same shape under the same version of Julia gives the same
# number anywhere. It is the figure the test suite asserts on, and the one
# worth printing here.
#
# Two of the rows are expected to be non-zero, and they are the point of the
# script: a zero means nothing unless the rows that should not be zero are
# not. The rest are reported rather than expected, because nothing pins a
# figure for the slots above the first derivative and this is where to find
# out what they are.

using LibXcDerivative
# The slot functions come from the ForwardDiff extension, so the package on
# its own does not have them.
using ForwardDiff
using Printf

const N = 100
const rho = collect(range(0.05, 5.0, length = N))
const sigma = 0.1 .* rho
const lapl = 0.05 .* rho
const tau = 0.3 .* rho

# Each sweep is a top-level function reading its inputs from arrays: a
# closure over a local scope can box what it captures, and a call on a
# literal is constant-folded, either of which would leave the figure
# measuring something other than the call.
#
# The measurement itself takes the sweep through a type parameter, for a
# third reason of the same kind. Called through a variable whose type is not
# known, a sweep returning a `Float64` has that number boxed, and the figure
# comes out 16 bytes higher than the call deserves.
function measure(call::F) where {F}
    call()                     # the first call compiles, and a compile allocates
    return @allocated call()
end

# The shape a caller should write: the functional reaches the loop as an
# argument with a type parameter, so a method is compiled for it alone.
function typed_gga(f::F, r, s) where {F}
    acc = 0.0
    for i in eachindex(r)
        v = xc_exc_vxc(f, r[i], s[i])
        acc += v.zk + v.vrho + v.vsigma
    end
    return acc
end

function typed_mgga(f::F, r, s, l, t; enforce_fhc::Bool = true) where {F}
    acc = 0.0
    for i in eachindex(r)
        v = xc_exc_vxc(f, r[i], s[i], l[i], t[i]; enforce_fhc)
        acc += v.zk + v.vrho + v.vsigma + v.vlapl + v.vtau
    end
    return acc
end

# The same loop with the functional read from a global whose type is not
# known where the loop is compiled. In a module of its own, so that the
# global belongs to the script rather than to whatever loaded it.
module Untyped
using LibXcDerivative, ForwardDiff
# Deliberately not `const`: the type is what the compiler is being denied.
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

# The input clamp on its own, as a caller of a bare kernel applies it.
function clamp_typed(f::F, r, s, l, t) where {F}
    acc = 0.0
    for i in eachindex(r)
        cr, cs, cl, ct = libxc_clamp(f, r[i], s[i], l[i], t[i])
        acc += cr + cs + cl + ct
    end
    return acc
end

# The higher slots, which nothing pins a figure for. One consumer for every
# family and both spin shapes: `map` over a NamedTuple's values is unrolled,
# so a field set holding tuples of different lengths costs nothing here. A
# plain loop over those values would not be, and would put its own
# allocation into every row.
total(v) = sum(map(sum, values(v)))

function slots_gga(slot::S, f::F, r, s) where {S,F}
    acc = 0.0
    for i in eachindex(r)
        acc += total(slot(f, r[i], s[i]))
    end
    return acc
end

function slots_gga_spin(slot::S, f::F, r, s) where {S,F}
    acc = 0.0
    for i in eachindex(r)
        acc += total(slot(f, (0.6 * r[i], 0.4 * r[i]),
                          (s[i], 0.5 * s[i], 0.25 * s[i])))
    end
    return acc
end

function slots_mgga(slot::S, f::F, r, s, l, t) where {S,F}
    acc = 0.0
    for i in eachindex(r)
        acc += total(slot(f, r[i], s[i], l[i], t[i]))
    end
    return acc
end

function slots_mgga_spin(slot::S, f::F, r, s, l, t) where {S,F}
    acc = 0.0
    for i in eachindex(r)
        acc += total(slot(f, (0.6 * r[i], 0.4 * r[i]),
                          (s[i], 0.5 * s[i], 0.25 * s[i]),
                          (0.6 * l[i], 0.4 * l[i]), (0.6 * t[i], 0.4 * t[i])))
    end
    return acc
end

# Putting parameter names back on a vector, the two ways: through
# `params_from`, where the names are part of a type, and by building the
# NamedTuple from names that are a value at run time.
function params_typed(f::F, q, r, s) where {F}
    acc = 0.0
    for i in eachindex(r)
        acc += f(r[i], s[i]; params = params_from(f, q))
    end
    return acc
end

module RuntimeNames
using LibXcDerivative, ForwardDiff
# Not `const`, for the same reason the module above has one: the names have
# to be a value the compiler does not know when the loop is compiled.
parameter_names = keys(gga_x_pbe_defaults)
function sweep(q, r, s)
    acc = 0.0
    for i in eachindex(r)
        acc += gga_x_pbe(r[i], s[i];
                         params = NamedTuple{parameter_names}(Tuple(q)))
    end
    return acc
end
end

# `q` for the run-time row holds the thresholds too, in the defaults' order,
# since that is the tuple it rebuilds; `params_from` takes the functional's
# own parameters only.
const q_all = collect(values(gga_x_pbe_defaults))
const q_own = [gga_x_pbe_defaults[k] for k in param_names(gga_x_pbe)]

const ROWS = [
    ("xc_exc_vxc, gga_x_pbe, functional as a type parameter",
     () -> typed_gga(gga_x_pbe, rho, sigma), 0),
    ("xc_exc_vxc, gga_x_pbe, functional from an untyped global",
     () -> Untyped.sweep(rho, sigma), :nonzero),
    ("xc_exc_vxc, mgga_x_scan, clamp on, type parameter",
     () -> typed_mgga(mgga_x_scan, rho, sigma, lapl, tau), 0),
    ("xc_exc_vxc, mgga_x_scan, clamp off, type parameter",
     () -> typed_mgga(mgga_x_scan, rho, sigma, lapl, tau; enforce_fhc = false), 0),
    ("libxc_clamp, mgga_x_scan, type parameter",
     () -> clamp_typed(mgga_x_scan, rho, sigma, lapl, tau), 0),
    ("gga_x_pbe, params through params_from",
     () -> params_typed(gga_x_pbe, q_own, rho, sigma), 0),
    ("gga_x_pbe, params from names that are a run-time value",
     () -> RuntimeNames.sweep(q_all, rho, sigma), :nonzero),
    ("xc_fxc, gga_x_pbe",
     () -> slots_gga(xc_fxc, gga_x_pbe, rho, sigma), :report),
    ("xc_kxc, gga_x_pbe",
     () -> slots_gga(xc_kxc, gga_x_pbe, rho, sigma), :report),
    ("xc_lxc, gga_x_pbe",
     () -> slots_gga(xc_lxc, gga_x_pbe, rho, sigma), :report),
    ("xc_fxc, gga_x_pbe, spin-polarized",
     () -> slots_gga_spin(xc_fxc, gga_x_pbe, rho, sigma), :report),
    ("xc_kxc, gga_x_pbe, spin-polarized",
     () -> slots_gga_spin(xc_kxc, gga_x_pbe, rho, sigma), :report),
    ("xc_fxc, mgga_x_scan",
     () -> slots_mgga(xc_fxc, mgga_x_scan, rho, sigma, lapl, tau), :report),
    ("xc_kxc, mgga_x_scan",
     () -> slots_mgga(xc_kxc, mgga_x_scan, rho, sigma, lapl, tau), :report),
    # Three more at the same order, because the figure above is a property of
    # the path and not of the functional, and one row cannot show that.
    ("xc_kxc, mgga_x_tpss",
     () -> slots_mgga(xc_kxc, mgga_x_tpss, rho, sigma, lapl, tau), :report),
    ("xc_kxc, mgga_c_tpss",
     () -> slots_mgga(xc_kxc, mgga_c_tpss, rho, sigma, lapl, tau), :report),
    ("xc_kxc, mgga_c_m06_l",
     () -> slots_mgga(xc_kxc, mgga_c_m06_l, rho, sigma, lapl, tau), :report),
    ("xc_lxc, mgga_x_scan",
     () -> slots_mgga(xc_lxc, mgga_x_scan, rho, sigma, lapl, tau), :report),
    ("xc_fxc, mgga_x_scan, spin-polarized",
     () -> slots_mgga_spin(xc_fxc, mgga_x_scan, rho, sigma, lapl, tau), :report),
]

holds(expected, bytes) = expected === :report ? true :
                         expected === :nonzero ? bytes > 0 : bytes == expected
label_of(expected) = expected === :report ? "reported" :
                     expected === :nonzero ? "non-zero" : "0"

function main(rows)
    @printf("Julia %s\n\n", VERSION)
    @printf("%-56s %12s %10s\n", "shape", "bytes/point", "expected")
    println("-"^81)
    unexpected = 0
    for (label, call, expected) in rows
        bytes = measure(call)
        ok = holds(expected, bytes)
        ok || (unexpected += 1)
        @printf("%-56s %12.1f %10s%s\n", label, bytes / N, label_of(expected),
                ok ? "" : "   <- unexpected")
    end
    println()
    if unexpected == 0
        println("As expected throughout: the zeros are zero, and the two shapes that ",
                "should\nallocate do. The reported rows carry no expectation; they ",
                "are what this\nscript is for finding out.")
    else
        println(unexpected, " row(s) came out otherwise. A zero means nothing on its ",
                "own: read it\ntogether with the rows that should not be zero.")
    end
    return unexpected
end

exit(main(ROWS) == 0 ? 0 : 1)
