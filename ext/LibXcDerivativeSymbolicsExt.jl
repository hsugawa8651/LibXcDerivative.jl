# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

"""
`my_piecewise3` and `my_piecewise5` as functions Symbolics can differentiate.

Tracing through those two is the only thing in this package that Symbolics is
needed for.

It lives in an extension because nothing in the arithmetic needs it: the two
functions are `ifelse` on promoted branch values, so a derivative taken over
numbers goes through that body and never consults a registration. ForwardDiff
does so for the slot layer, Zygote for a caller differentiating an entry
point.

`@register_derivative` is what carries the frozen branch across the
registration. A registration on its own says nothing about how the function
varies, so without those rules a derivative of the registered call comes back
zero rather than as an error. The testset "my_piecewise3/5 traced and
differentiated symbolically" in test/symbolic.jl is what holds it.
"""
module LibXcDerivativeSymbolicsExt

# import, not using: a method cannot be added to a function another module
# owns unless the name is imported. With `using` the registration below
# defines my_piecewise3(::Num, ::Num, ::Num) in this module instead, where
# nothing dispatches to it, and a symbolic call fails with a MethodError
# naming the Bool method.
import LibXcDerivative: my_piecewise3, my_piecewise5
using Symbolics

# The rule Libxc's own sympy2c.py uses: differentiation recurses into the
# surviving branch only, and the condition is never differentiated. The
# positions are the branch values, counted from one over the whole argument
# list: 2 and 3 for the three-argument form, 2, 4 and 5 for the five.
@register_symbolic my_piecewise3(c::Bool, t::Real, e::Real)::Real
@register_derivative my_piecewise3(c, t, e) 2 my_piecewise3(c, 1, 0)
@register_derivative my_piecewise3(c, t, e) 3 my_piecewise3(c, 0, 1)

@register_symbolic my_piecewise5(c1::Bool, t1::Real, c2::Bool, t2::Real, e::Real)::Real
@register_derivative my_piecewise5(c1, t1, c2, t2, e) 2 my_piecewise5(c1, 1, c2, 0, 0)
@register_derivative my_piecewise5(c1, t1, c2, t2, e) 4 my_piecewise5(c1, 0, c2, 1, 0)
@register_derivative my_piecewise5(c1, t1, c2, t2, e) 5 my_piecewise5(c1, 0, c2, 0, 1)

end # module
