# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

# The parameters as a vector, for a caller who is fitting rather than
# evaluating.
#
# A functional's parameters reach its kernel as ordinary arguments, so a dual
# number enters through them exactly as it does through the density, and a
# parameter derivative needs nothing from this file. What it needs is the
# *shape* of the call: `params` is a NamedTuple, whose names are part of its
# type, and a caller holding a vector has to put the names back. Doing that
# where the compiler cannot see them -- `NamedTuple{own}(Tuple(q))` for an
# `own` that is a runtime value -- costs seven to thirteen times the call
# itself, and up to four times the gradient. Writing the names out costs
# nothing at all.
#
# So the names are read off the type: `<entry>_defaults` is a `const`
# NamedTuple, which means they are already in the type system, and
# `params_from` is generated from them. Nothing here is a new capability; it
# is the one spelling of an existing one that the compiler can see through.

"""
    THRESHOLD_PARAMS

The names in a kernel's parameter list that are not parameters of the
functional: the density and polarization thresholds, and the two machine
constants some kernels guard a logarithm with.

Nobody fits `dens_threshold`, so [`param_names`](@ref) leaves these out and
[`params_from`](@ref) fills them from the defaults.
"""
const THRESHOLD_PARAMS = (:dens_threshold, :zeta_threshold, :XC_EPSILON, :XC_MIN)

# The entry point names itself: a caller that reaches this called one of the
# four public functions below, and a message about the argument alone leaves
# it to guess which of them refused.
@noinline function _reject_not_an_entry_point(entry, f)
    throw(ArgumentError("$entry($(typeof(f))): $f is not a generated entry " *
                        "point, so it has no parameter defaults to read " *
                        "names from"))
end

@noinline function _reject_param_length(f, got, want)
    throw(ArgumentError("$f takes $want parameter(s), got a vector of $got"))
end

@noinline function _reject_no_parameters(f)
    throw(ArgumentError("$f has no parameters of its own, so there is " *
                        "nothing to differentiate with respect to"))
end

@noinline function _reject_no_value(f, absent)
    throw(ArgumentError("$f has no default for $(absent), so a point to " *
                        "differentiate at has to be given in `params`"))
end

"""
    _parameter_layout(f) -> (module, defaults name, own parameter names)

Everything the generated functions below need, read off an entry point at
generation time.

`f` here is the function itself, not its type: the callers are `@generated`,
where `typeof(f).instance` is the function. A parameter with no default is
still a parameter -- `lda_c_epc18` demands three -- so the names come from
`<entry>_defaults` and `<entry>_required` together, in that order.
"""
function _parameter_layout(f)
    name = nameof(f)
    mod = parentmodule(f)
    dk, rk = Symbol(name, :_defaults), Symbol(name, :_required)
    (isdefined(mod, dk) && isdefined(mod, rk)) || return nothing
    defaults = getfield(mod, dk)::NamedTuple
    required = getfield(mod, rk)::Tuple
    own = Symbol[k for k in keys(defaults) if !(k in THRESHOLD_PARAMS)]
    for k in required
        (k in THRESHOLD_PARAMS || haskey(defaults, k)) && continue
        push!(own, k)
    end
    return (mod, dk, Tuple(own))
end

_layout_or_reject(F::Type) =
    isdefined(F, :instance) ? _parameter_layout(F.instance) : nothing

"""
    param_defaults(f) -> NamedTuple

Return the `<entry>_defaults` NamedTuple `f` was generated with.

The binding is `const`, so this is a constant: the generated method returns it
by reference and nothing is looked up when it is called. [`param_point`](@ref)
and `param_gradient` read it through here rather than rebuilding the name from
`nameof(f)`, which allocates a string and is decided at run time -- the first
version of `param_gradient` did that and came out slower than the hand-written
gradient it exists to replace.
"""
@generated function param_defaults(f)
    layout = _layout_or_reject(f)
    layout === nothing && return :(_reject_not_an_entry_point(:param_defaults, f))
    mod, dk, _ = layout
    return GlobalRef(mod, dk)
end

"""
    param_names(f) -> Tuple{Vararg{Symbol}}

Return the names of `f`'s own parameters, in the order [`params_from`](@ref)
and `param_gradient` take them.

Thresholds and machine constants are not among them ([`THRESHOLD_PARAMS`](@ref)).
The order is the defaults' own, which is the generator's, followed by any
parameter that has no default at all.

`()` for a functional with nothing to tune, which happens for two different
reasons: a mix's entry point takes no `params` at all, because its weights are
literals in the expression, and 118 of the rest have their numbers as literals
too.

```jldoctest
julia> param_names(gga_x_pbe)
(:params_a_kappa, :params_a_mu)

julia> param_names(hyb_gga_xc_b3lyp)
()
```
"""
@generated function param_names(f)
    layout = _layout_or_reject(f)
    layout === nothing && return :(_reject_not_an_entry_point(:param_names, f))
    return QuoteNode(layout[3])
end

"""
    params_from(f, q) -> NamedTuple

Return the `params` NamedTuple that hands `f` the parameter values in `q`.

`q` is in [`param_names`](@ref) order and holds the functional's own
parameters only; the thresholds come from `f`'s defaults. The result is what
`f(args...; params = ...)` wants, and is identical to the NamedTuple written
out by hand -- including its type, which is why it costs nothing:

```jldoctest
julia> params_from(gga_x_pbe, [0.8040, 0.2195149727645171]) === gga_x_pbe_defaults
true
```

A `q` of the wrong length is refused. Reading past the end would be a crash
and dropping the tail would be worse: a plausible number from parameters that
are not the ones asked for.

Any number type goes through, duals included, which is what makes a gradient
over the parameters a gradient over `q`.
"""
@generated function params_from(f, q)
    layout = _layout_or_reject(f)
    layout === nothing && return :(_reject_not_an_entry_point(:params_from, f))
    mod, dk, own = layout
    defaults = getfield(mod, dk)
    # The defaults' names first, in their order, then the parameters that have
    # no default: `resolve_params` accepts the result either way, and this
    # keeps the common case identical to the defaults themselves.
    names = (keys(defaults)..., (k for k in own if !haskey(defaults, k))...)
    ref = GlobalRef(mod, dk)
    values = map(names) do k
        i = findfirst(==(k), own)
        i === nothing ? :(getfield($ref, $(QuoteNode(k)))) : :(q[$i])
    end
    n = length(own)
    return quote
        length(q) == $n || _reject_param_length(f, length(q), $n)
        NamedTuple{$names}(tuple($(values...)))
    end
end

"""
    param_point(f, params = NamedTuple()) -> Vector

Return the parameter values to differentiate `f` at, in [`param_names`](@ref)
order: `params` where it says, `f`'s defaults elsewhere.

With no `params` this is where a fit starts from, and it is the vector
[`params_from`](@ref) takes back.

Every name in `params` has to be one of `f`'s own parameters. A threshold
would otherwise be accepted here and then dropped by [`params_from`](@ref),
which fills the thresholds from the defaults -- a caller's value discarded
without a word, the failure mode `resolve_params` exists to prevent.
"""
param_point(f) = param_point(f, NamedTuple())

@generated function param_point(f, params::NamedTuple)
    layout = _layout_or_reject(f)
    layout === nothing && return :(_reject_not_an_entry_point(:param_point, f))
    mod, dk, own = layout
    defaults = getfield(mod, dk)
    given = fieldnames(params)
    # Both checks are on tuples of symbols, as in `resolve_params`, so they
    # are decided here rather than on every call: a bad `params` makes a
    # method that throws, and a good one makes a method that does not check.
    unknown = Base.diff_names(given, own)
    isempty(unknown) || return :(_reject_unknown($unknown, $own))
    absent = Base.diff_names(own, (given..., keys(defaults)...))
    isempty(absent) || return :(_reject_no_value(f, $absent))
    ref = GlobalRef(mod, dk)
    values = map(own) do k
        k in given ? :(getfield(params, $(QuoteNode(k)))) :
                     :(getfield($ref, $(QuoteNode(k))))
    end
    # A Tuple first, then one array: the element type comes out concrete,
    # where a comprehension over the names leaves a Vector{Any} and makes
    # every dual in the gradient over it a boxed one.
    return :(collect(tuple($(values...))))
end

"""
    _named(f, values) -> NamedTuple

Put `f`'s parameter names back on a vector of one value each.

Generated for the same reason [`params_from`](@ref) is: `NamedTuple{names}`
needs the names as a type parameter, so a `names` that is an ordinary value
sends the construction to run time, which is exactly the cost this file is
about.
"""
@generated function _named(f, values)
    layout = _layout_or_reject(f)
    # Named param_gradient rather than _named: this is only reached from
    # there, and _named is not part of the interface a caller called.
    layout === nothing && return :(_reject_not_an_entry_point(:param_gradient, f))
    own = layout[3]
    entries = [:(values[$i]) for i in eachindex(own)]
    return :(NamedTuple{$own}(tuple($(entries...))))
end

"""
    param_gradient(f, args...; params = NamedTuple()) -> NamedTuple

Return the derivative of `f` with respect to each of its own parameters, by
name, at the density `args` and the parameter values `params`.

This is the derivative Libxc cannot be asked for: its generated code holds the
parameters as constants read out of a struct, and the derivative tensor its
generator builds runs over the density variables only. Here they are ordinary
arguments, so this is the same automatic differentiation the density
derivatives use.

`params` moves the point the derivative is taken at, not which parameters are
differentiated: that is always all of [`param_names`](@ref), and a functional
with none of its own is refused rather than answered with an empty tuple. A
parameter with no default has to be given a value here, since there is no
point to differentiate at otherwise.

Available once `ForwardDiff` is loaded; the implementation is an extension, so
it is not a dependency of this package.

```jldoctest
julia> param_gradient(gga_x_pbe, 0.5, 0.1)
(params_a_kappa = -1.1912752580356732e-5, params_a_mu = -0.00963510812734225)
```
"""
function param_gradient end

# Its method is in the ForwardDiff extension, so until that extension loads
# this is the only one there is, and a call reports what is missing rather
# than only that nothing matched. The extension's method takes real
# arguments, so this one keeps everything else and names the entry point
# instead of the kernel the gradient would have called.
@noinline param_gradient(f, args...; params = NamedTuple()) = throw(ArgumentError(
    "param_gradient($(join(map(typeof, (f, args...)), ", "))): no method " *
    "matches these argument types. It takes a generated entry point and " *
    "the density arguments its family takes, as real numbers, and its " *
    "method comes from the ForwardDiff extension: `using ForwardDiff` " *
    "makes it available."))
