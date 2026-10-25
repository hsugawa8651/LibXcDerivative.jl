# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

"""
    my_piecewise3(c, t, e)

Return `t` if `c`, else `e`, with the branch frozen under differentiation.

Mirrors Libxc's `scripts/sympy2c/sympy2c.py::my_piecewise3` (a custom
`sympy.Function` with a frozen-branch derivative rule: differentiation
recurses into the surviving branch only, the condition itself is never
differentiated).

Implemented via `ifelse` on `promote`d branch values so that mismatched
branch types (e.g. a bare integer literal `0` alongside a `Float64`
expression, or a `Float64` literal alongside a `ForwardDiff.Dual`) do not
produce a type-unstable `Union` return.
"""
my_piecewise3(c::Bool, t, e) = ifelse(c, promote(t, e)...)

"""
    my_piecewise5(c1, t1, c2, t2, e)

Return the first of `t1`, `t2`, `e` whose condition holds, branch frozen.

That is `c1 ? t1 : (c2 ? t2 : e)`. Mirrors Libxc's `my_piecewise5` (nested
if/elif/else, same frozen-branch derivative rule as
[`my_piecewise3`](@ref)).
"""
my_piecewise5(c1::Bool, t1, c2::Bool, t2, e) =
    ifelse(c1, promote(t1, ifelse(c2, promote(t2, e)...))...)
