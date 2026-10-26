# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

"""
The named-derivative layer: Libxc's output slots from one expression.

They live in an extension because the package depends on no AD package, and
differentiating on the caller's behalf needs one. Loading ForwardDiff is what
brings them; a caller who uses Zygote keeps the scalar entry points and
differentiates those.

The documentation, and the reason the slots are named at all, are on the
declarations in `src/slots.jl`.
"""
module LibXcDerivativeForwardDiffExt

using LibXcDerivative
using LibXcDerivative: _refuse_potential
using ForwardDiff

# One forward pass for the whole first-derivative tuple.
#
# Every slot Libxc fills at first order is a first derivative of the same
# expression at the same point, so one pass carrying a partial per argument
# produces all of them. Written as one chain per slot before this, which
# walked the expression twice for an LDA, three times for a GGA, five times
# for a meta-GGA and ten times for a polarized meta-GGA. The test suite
# pins the walk count rather than a time, since the count is what the
# shape decides and does not belong to a machine.
#
# What the pass is worth through these entry points, re-measured 2026-10-24
# against the chains at 50000 points with every slot consumed: 2.8x for
# gga_x_pbe, 3.5x for the polarized GGA, 1.6x for gga_x_wpbeh, 2.9x for
# mgga_x_scan, 2.4x for mgga_c_m06_l and 8.5x for the polarized meta-GGA,
# with the first call no dearer (0.26 s against 0.25 s for gga_x_pbe, 2.7 s
# against 2.7 s for hyb_gga_xc_hse06). Measured on the entry points
# themselves: a hand-written pass inlined into a timing loop overstates the
# gain for the small expressions, and can report a gain where the entry
# points are slower than the chains.
#
# The tag is built the way ForwardDiff.derivative builds its own, from the
# function and the value type. Nothing, or a tag of our own, cannot be
# ordered against the tag of a caller who differentiates through these
# entry points, which the suite does, and fails with "Cannot determine
# ordering of Dual tags".
#
# The arguments are promoted together because the seeds must share one
# type, and a caller may hand a dual for one argument and plain floats for
# the rest, which is what differentiating through here looks like.
# The tag is handed to the worker as a type parameter rather than kept in a
# local. ForwardDiff builds it from a call to a generated function, and a
# type held in a local does not reach the closure ntuple runs below as a
# constant: the seeds then carry a tag inference does not know, every slot
# comes back Any, and the field set loses its type, the same way it does
# when a captured argument is assigned inside a branch. As a type parameter
# it is static.
@inline function _one_pass(f::F, xs::NTuple{N,R}) where {F,N,R<:Real}
    return _seeded_pass(typeof(ForwardDiff.Tag(f, R)), f, xs)
end
@inline function _seeded_pass(::Type{T}, f::F, xs::NTuple{N,R}) where {T,F,N,R<:Real}
    seeds = ntuple(i -> ForwardDiff.Dual{T}(xs[i],
        ntuple(j -> ifelse(i == j, one(R), zero(R)), Val(N))), Val(N))
    d = f(seeds...)
    return ForwardDiff.value(d), ForwardDiff.partials(d)
end

# Every method below that assembles the first-derivative slots is marked
# `@inline`, and the marks are load-bearing rather than decorative: adding
# the fallback branch to them took them over the inliner's cost threshold,
# and an entry point the compiler will not inline into the caller's loop
# stops keeping its seeds and duals in registers. Measured 2026-10-24 on
# gga_x_pbe, 50000 points, every slot consumed: 193 ns and nothing
# allocated before the one pass, 755 ns and 384 bytes a point with the one
# pass and no marks, 70 ns and nothing allocated with them. Marking only
# the public methods, or only the workers, changes nothing at all (743 and
# 850 ns): the whole chain down to the pass has to inline or none of it
# does. The suite asserts the allocation rather than the time, in
# test/derivatives.jl, because a time belongs to the machine it was taken
# on.
#
# Whether the pass can be trusted at this point.
#
# Seeding every argument at once couples them where the expression is
# singular in one of them. At sigma = 0 a shared subexpression goes to Inf
# in the sigma lane, and the partials of the other lanes come back as
# 0/0 = NaN: vrho came out NaN for gga_x_pbe where a chain gives
# -0.781592641797, and the same happened at tau = 0 for mgga_x_scan and at
# sigma = 0 for gga_x_b88, gga_c_pbe, mgga_x_scan and mgga_c_m06_l. A chain
# seeds one argument, so the singular derivative of the others never
# exists, which is why the chains are kept below and taken at those points.
# Those zeros are not corner cases for a caller: they are what a grid holds
# wherever the density is flat or absent.
#
# The test is the result itself. isfinite on a dual reads its value, so a
# caller differentiating through here is checked on the primal, which is
# where the singularity is. An LDA seeds one argument and cannot couple
# anything; the check is kept there for one shape rather than two.
@inline _usable(zk, p) = isfinite(zk) && all(isfinite, p)

# Libxc's vrho is the derivative of rho*zk, which the product rule writes as
# zk + rho dzk/drho, and its vsigma, vlapl and vtau are rho times a
# derivative of zk. One pass gives dzk/dx for every x, so the slots are
# arithmetic on what it returns. Spin-polarized, the factor is the total
# density and both vrho components carry the zk term.
@inline function LibXcDerivative.xc_exc_vxc(f, rho::Real; enforce_fhc::Bool=true)
    _refuse_potential(f)
    return _exc_vxc(f, rho)
end
@inline function _exc_vxc(f, rho)
    zk, p = _one_pass(f, promote(rho))
    _usable(zk, p) || return _chains(f, rho)
    return (; zk, vrho = zk + rho * p[1])
end
function _chains(f, rho)
    return (; zk = f(rho),
              vrho = ForwardDiff.derivative(x -> x * f(x), rho))
end
@inline function LibXcDerivative.xc_exc_vxc(f, rho::Real, sigma::Real; enforce_fhc::Bool=true)
    _refuse_potential(f)
    return _exc_vxc(f, rho, sigma)
end
@inline function _exc_vxc(f, rho, sigma)
    zk, p = _one_pass(f, promote(rho, sigma))
    _usable(zk, p) || return _chains(f, rho, sigma)
    return (; zk, vrho = zk + rho * p[1], vsigma = rho * p[2])
end
function _chains(f, rho, sigma)
    return (; zk = f(rho, sigma),
              vrho = ForwardDiff.derivative(x -> x * f(x, sigma), rho),
              vsigma = rho * ForwardDiff.derivative(y -> f(rho, y), sigma))
end
# The clamp is applied by handing the clamped point to a worker, rather
# than by assigning it back onto the arguments, and that is what keeps the
# method's type: a variable assigned inside a branch and captured by a
# closure is boxed, which would make rho, sigma, lapl and tau Any inside
# the closures below, infer the field set as
# NamedTuple{..., <:NTuple{5, Any}}, and send every derivative through
# dynamic dispatch. Only the two meta-GGA methods call libxc_clamp, since
# Libxc clamps only where tau is read, so they are the ones this shape
# matters for. The third and fourth derivatives pass the clamped point to
# a worker in the same way.
#
# The worker takes no keyword argument, for the reason given further down:
# a keyword splits a method in two and doubles what has to be compiled.
@inline function LibXcDerivative.xc_exc_vxc(f, rho::Real, sigma::Real, lapl::Real, tau::Real;
                                   enforce_fhc::Bool=true)
    _refuse_potential(f)
    enforce_fhc || return _exc_vxc(f, rho, sigma, lapl, tau)
    return _exc_vxc(f, LibXcDerivative.libxc_clamp(f, rho, sigma, lapl, tau)...)
end
@inline function _exc_vxc(f, rho, sigma, lapl, tau)
    zk, p = _one_pass(f, promote(rho, sigma, lapl, tau))
    _usable(zk, p) || return _chains(f, rho, sigma, lapl, tau)
    return (; zk, vrho = zk + rho * p[1], vsigma = rho * p[2],
              vlapl = rho * p[3], vtau = rho * p[4])
end
function _chains(f, rho, sigma, lapl, tau)
    return (; zk = f(rho, sigma, lapl, tau),
              vrho = ForwardDiff.derivative(x -> x * f(x, sigma, lapl, tau), rho),
              vsigma = rho * ForwardDiff.derivative(y -> f(rho, y, lapl, tau), sigma),
              vlapl = rho * ForwardDiff.derivative(l -> f(rho, sigma, l, tau), lapl),
              vtau = rho * ForwardDiff.derivative(t -> f(rho, sigma, lapl, t), tau))
end

#
# Spin-polarized first derivatives. The entry points have taken spin-resolved
# arguments all along; this is the slot layer catching up.
#
# The spin components arrive as tuples, one per quantity, rather than
# flattened into the argument list. That is not decoration: with scalars,
# `xc_exc_vxc(f, 0.5, 0.3)` is ambiguous: two numbers are a GGA's
# (rho, sigma), and also an LDA's (na, nb), and the number of arguments cannot
# say which, because the family is a property of `f` that the call site does
# not carry. A flat argument list collides with the shipped unpolarized
# GGA method for the same reason. Tuples also
# mirror Libxc's own layout, which gives each quantity a spin axis, and keep
# the return type inferable.
#
# Libxc's widths: vrho one component per spin, vsigma three for the
# (aa, ab, bb) pseudo-spin components, vlapl and vtau one per spin. Its
# convention, read off the library rather than assumed: vrho[s] is the
# derivative of (rho_total * zk) with respect to rho_s, and the others are
# rho_total times a derivative of zk: the same two rules the unpolarized
# methods follow, with rho_total standing where rho did.
#
@inline function LibXcDerivative.xc_exc_vxc(f, rho::Tuple{Any,Any}; enforce_fhc::Bool=true)
    _refuse_potential(f)
    return _exc_vxc_spin(f, rho...)
end
@inline function _exc_vxc_spin(f, na, nb)
    zk, p = _one_pass(f, promote(na, nb))
    _usable(zk, p) || return _chains_spin(f, na, nb)
    total = na + nb
    return (; zk, vrho = (zk + total * p[1], zk + total * p[2]))
end
function _chains_spin(f, na, nb)
    e = (a, b) -> (a + b) * f(a, b)
    return (; zk = f(na, nb),
              vrho = (ForwardDiff.derivative(a -> e(a, nb), na),
                      ForwardDiff.derivative(b -> e(na, b), nb)))
end
@inline function LibXcDerivative.xc_exc_vxc(f, rho::Tuple{Any,Any}, sigma::Tuple{Any,Any,Any};
                                   enforce_fhc::Bool=true)
    _refuse_potential(f)
    return _exc_vxc_spin(f, rho..., sigma...)
end
@inline function _exc_vxc_spin(f, na, nb, gaa, gab, gbb)
    zk, p = _one_pass(f, promote(na, nb, gaa, gab, gbb))
    _usable(zk, p) || return _chains_spin(f, na, nb, gaa, gab, gbb)
    total = na + nb
    return (; zk, vrho = (zk + total * p[1], zk + total * p[2]),
              vsigma = (total * p[3], total * p[4], total * p[5]))
end
function _chains_spin(f, na, nb, gaa, gab, gbb)
    total = na + nb
    e = (a, b) -> (a + b) * f(a, b, gaa, gab, gbb)
    return (; zk = f(na, nb, gaa, gab, gbb),
              vrho = (ForwardDiff.derivative(a -> e(a, nb), na),
                      ForwardDiff.derivative(b -> e(na, b), nb)),
              vsigma = (total * ForwardDiff.derivative(x -> f(na, nb, x, gab, gbb), gaa),
                        total * ForwardDiff.derivative(x -> f(na, nb, gaa, x, gbb), gab),
                        total * ForwardDiff.derivative(x -> f(na, nb, gaa, gab, x), gbb)))
end
@inline function LibXcDerivative.xc_exc_vxc(f, rho::Tuple{Any,Any}, sigma::Tuple{Any,Any,Any},
                                   lapl::Tuple{Any,Any}, tau::Tuple{Any,Any};
                                   enforce_fhc::Bool=true)
    _refuse_potential(f)
    enforce_fhc || return _exc_vxc_spin(f, rho..., sigma..., lapl..., tau...)
    cr, cs, cl, ct = LibXcDerivative.libxc_clamp(f, rho, sigma, lapl, tau)
    return _exc_vxc_spin(f, cr..., cs..., cl..., ct...)
end
@inline function _exc_vxc_spin(f, na, nb, gaa, gab, gbb, la, lb, ta, tb)
    zk, p = _one_pass(f, promote(na, nb, gaa, gab, gbb, la, lb, ta, tb))
    _usable(zk, p) ||
        return _chains_spin(f, na, nb, gaa, gab, gbb, la, lb, ta, tb)
    total = na + nb
    return (; zk, vrho = (zk + total * p[1], zk + total * p[2]),
              vsigma = (total * p[3], total * p[4], total * p[5]),
              vlapl = (total * p[6], total * p[7]),
              vtau = (total * p[8], total * p[9]))
end
function _chains_spin(f, na, nb, gaa, gab, gbb, la, lb, ta, tb)
    total = na + nb
    e = (a, b) -> (a + b) * f(a, b, gaa, gab, gbb, la, lb, ta, tb)
    return (; zk = f(na, nb, gaa, gab, gbb, la, lb, ta, tb),
              vrho = (ForwardDiff.derivative(a -> e(a, nb), na),
                      ForwardDiff.derivative(b -> e(na, b), nb)),
              vsigma = (total * ForwardDiff.derivative(
                            x -> f(na, nb, x, gab, gbb, la, lb, ta, tb), gaa),
                        total * ForwardDiff.derivative(
                            x -> f(na, nb, gaa, x, gbb, la, lb, ta, tb), gab),
                        total * ForwardDiff.derivative(
                            x -> f(na, nb, gaa, gab, x, la, lb, ta, tb), gbb)),
              vlapl = (total * ForwardDiff.derivative(
                           x -> f(na, nb, gaa, gab, gbb, x, lb, ta, tb), la),
                       total * ForwardDiff.derivative(
                           x -> f(na, nb, gaa, gab, gbb, la, x, ta, tb), lb)),
              vtau = (total * ForwardDiff.derivative(
                          x -> f(na, nb, gaa, gab, gbb, la, lb, x, tb), ta),
                      total * ForwardDiff.derivative(
                          x -> f(na, nb, gaa, gab, gbb, la, lb, ta, x), tb)))
end

function LibXcDerivative.xc_fxc(f, rho::Real; enforce_fhc::Bool=true)
    _refuse_potential(f)
    g = x -> x * f(x)
    return (; v2rho2 = ForwardDiff.derivative(
        x -> ForwardDiff.derivative(g, x), rho))
end
function LibXcDerivative.xc_fxc(f, rho::Real, sigma::Real; enforce_fhc::Bool=true)
    _refuse_potential(f)
    g = (x, y) -> x * f(x, y)
    return (; v2rho2 = ForwardDiff.derivative(
                  x -> ForwardDiff.derivative(u -> g(u, sigma), x), rho),
              v2rhosigma = ForwardDiff.derivative(
                  y -> ForwardDiff.derivative(u -> g(u, y), rho), sigma),
              v2sigma2 = ForwardDiff.derivative(
                  y -> ForwardDiff.derivative(v -> g(rho, v), y), sigma))
end
# Same shape as the first derivatives above, and for the same reason.
function LibXcDerivative.xc_fxc(f, rho::Real, sigma::Real, lapl::Real, tau::Real; enforce_fhc::Bool=true)
    _refuse_potential(f)
    enforce_fhc || return _fxc(f, rho, sigma, lapl, tau)
    return _fxc(f, LibXcDerivative.libxc_clamp(f, rho, sigma, lapl, tau)...)
end
function _fxc(f, rho, sigma, lapl, tau)
    g = (x, y, l, t) -> x * f(x, y, l, t)
    # One nested pair per slot rather than a Hessian of a four-argument
    # closure: the ten slots are the independent entries of that Hessian, and
    # naming each pair keeps the field set and Libxc's names side by side.
    # The diagonal entries differentiate the same variable twice; the cross
    # terms are written with the second variable outermost, and the suite
    # checks two of them the other way round, since mixed partials commute
    # and a transposed pair would otherwise pass unseen.
    return (; v2rho2 = ForwardDiff.derivative(
                  x -> ForwardDiff.derivative(u -> g(u, sigma, lapl, tau), x), rho),
              v2rhosigma = ForwardDiff.derivative(
                  y -> ForwardDiff.derivative(u -> g(u, y, lapl, tau), rho), sigma),
              v2rholapl = ForwardDiff.derivative(
                  l -> ForwardDiff.derivative(u -> g(u, sigma, l, tau), rho), lapl),
              v2rhotau = ForwardDiff.derivative(
                  t -> ForwardDiff.derivative(u -> g(u, sigma, lapl, t), rho), tau),
              v2sigma2 = ForwardDiff.derivative(
                  y -> ForwardDiff.derivative(v -> g(rho, v, lapl, tau), y), sigma),
              v2sigmalapl = ForwardDiff.derivative(
                  l -> ForwardDiff.derivative(v -> g(rho, v, l, tau), sigma), lapl),
              v2sigmatau = ForwardDiff.derivative(
                  t -> ForwardDiff.derivative(v -> g(rho, v, lapl, t), sigma), tau),
              v2lapl2 = ForwardDiff.derivative(
                  l -> ForwardDiff.derivative(m -> g(rho, sigma, m, tau), l), lapl),
              v2lapltau = ForwardDiff.derivative(
                  t -> ForwardDiff.derivative(m -> g(rho, sigma, m, t), lapl), tau),
              v2tau2 = ForwardDiff.derivative(
                  t -> ForwardDiff.derivative(u -> g(rho, sigma, lapl, u), t), tau))
end


#
# Third and fourth derivatives, by Libxc's name for each slot.
#
# The names are generated from Libxc's rule rather than transcribed: for order
# n, the multisets of the family's variables in lexicographic order, each
# variable followed by its multiplicity where that is above one. That
# reproduces all 66 v3/v4 names xc.h declares, and the suite checks it against
# the header. Transcribing 66 names by hand would have been 66 chances to
# misplace one, and a misplaced name is a wrong number under a right label.
#
# The methods themselves are written by @eval over the same multisets, so the
# name and the nesting come from one place and cannot disagree.
#
const _SLOT_VARS = (:rho, :sigma, :lapl, :tau)

# The chains live in these, which take no keyword arguments. A keyword
# argument costs a second compiled method (Julia splits a kwarg method into
# a sorter and a body), and doubling that over bodies that hold 495
# derivative chains doubled the cost of the fourth derivative, 51.3 s to
# 108.1 s, measured. The clamp is argument preparation, so it belongs in the
# thin public method and the chains stay in a worker that is compiled once.
function _slot end

# The multisets of 1:nvars of length order, lexicographic.
function _multisets(nvars::Int, order::Int)
    order == 0 && return [Int[]]
    out = Vector{Int}[]
    for v in 1:nvars, rest in _multisets(nvars, order - 1)
        (isempty(rest) || rest[1] >= v) && push!(out, vcat(v, rest))
    end
    return out
end

# Libxc's name for one multiset: v<order> then each variable with its count.
function _slot_name(multiset::Vector{Int}, order::Int)
    io = IOBuffer()
    print(io, "v", order)
    i = 1
    while i <= length(multiset)
        v = multiset[i]
        k = 1
        while i + k <= length(multiset) && multiset[i + k] == v
            k += 1
        end
        print(io, _SLOT_VARS[v], k == 1 ? "" : string(k))
        i += k
    end
    return Symbol(String(take!(io)))
end

# The field set each method returns, as data. Knowing what comes back should
# not cost an evaluation: a fourth derivative of a large kernel takes minutes,
# and `propertynames` of the result is the only other way to ask.
# The n-th mixed partial of `g`, as nested single-variable derivatives.
#
# Grouped by variable, because the two cases differ. A variable appearing k
# times needs k nested derivatives in that one position, each inner evaluated
# at the dual one level out: the idiom the second-derivative methods above
# use for a diagonal entry. Different variables nest independently, each
# inner evaluated at its own fixed argument. The innermost call substitutes,
# for every position, the innermost dual belonging to that position.
#
# Each dual has to be substituted in its own call. One chain that
# substitutes only the innermost dual and leaves the outer ones out of the
# call gives the wrong mixed slot: v3rho2sigma comes back as the third
# derivative in sigma alone. Checked against the exact mixed partials of
# rho^4 sigma^3: all four third-order slots agree to 1.7e-16.
function _nest(argnames, multiset::Vector{Int})
    groups = Tuple{Int,Int}[]
    i = 1
    while i <= length(multiset)
        v = multiset[i]
        k = 1
        while i + k <= length(multiset) && multiset[i + k] == v
            k += 1
        end
        push!(groups, (v, k))
        i += k
    end
    subs = Dict{Int,Symbol}()
    counter = Ref(0)
    function nest(gi)
        if gi > length(groups)
            args = Any[get(subs, p, argnames[p]) for p in 1:length(argnames)]
            return :(g($(args...)))
        end
        v, k = groups[gi]
        names = [Symbol(:_d, (counter[] += 1)) for _ in 1:k]
        subs[v] = names[end]
        body = nest(gi + 1)
        for level in k:-1:1
            at = level == 1 ? argnames[v] : names[level - 1]
            body = :(ForwardDiff.derivative($(names[level]) -> $body, $at))
        end
        return body
    end
    return nest(1)
end

function LibXcDerivative.slot_names(family::Symbol, order::Integer)
    nvars = family === :lda ? 1 : family === :gga ? 2 :
            family in (:mgga, :mggal) ? 4 :
            throw(ArgumentError("unknown family $family; expected :lda, :gga, " *
                                ":mgga or :mggal"))
    1 <= order <= 4 || throw(ArgumentError(
        "order $order is outside the slots Libxc names (1 to 4)"))
    order == 1 && return Tuple(Symbol(n) for n in
        ("zk", ("v" * String(v) for v in _SLOT_VARS[1:nvars])...))
    return Tuple(_slot_name(m, order) for m in _multisets(nvars, order))
end

# The family a slot belongs to, for the message an unknown name gets.
_family_word(nvars::Int) = nvars == 1 ? "LDA" : nvars == 2 ? "GGA" : "meta-GGA"

# One method per slot, and the whole tuple assembled from them.
#
# A caller who wants one slot should not compile the rest. What costs is the
# number of distinct position tuples, not the size of the kernel and not the
# size of the function: at depth four on one meta-GGA, ten tuples cost 14.1 s
# and ninety cost 110.8 s, and splitting those ninety over ninety functions
# instead of one came to 139.5 s: the same order, so splitting is close to
# free and asking for one of thirty-five slots costs a thirty-fifth of the
# tuples rather than all of them. The whole tuple then calls the slots, which
# keeps the chains written once.
for (nvars, argnames) in ((1, (:rho,)), (2, (:rho, :sigma)),
                          (4, (:rho, :sigma, :lapl, :tau))),
    (order, fname) in ((3, :xc_kxc), (4, :xc_lxc))

    sets = _multisets(nvars, order)
    names = [_slot_name(m, order) for m in sets]
    # The public methods take real arguments, so a call with anything else
    # reaches the entry point's own method in the package and is answered
    # under the slot's name rather than from inside the pass. The workers
    # below stay untyped: what reaches them has already been checked.
    typedargs = [:($a::Real) for a in argnames]
    # Libxc clamps its inputs before the kernel sees them, and a slot method
    # is where the point to differentiate at is chosen, so the clamp belongs
    # on the arguments here: no primal value has to be dug out of a dual.
    # libxc_clamp returns its arguments unchanged unless the functional needs
    # tau, so only the meta-GGA methods carry the call.
    clamp = nvars == 4 ? [:(enforce_fhc && (($(argnames...),) =
        LibXcDerivative.libxc_clamp(f, $(argnames...))))] : []
    for (multiset, name) in zip(sets, names)
        @eval function _slot(::Val{$(QuoteNode(fname))},
                             ::Val{$(QuoteNode(name))}, f, $(argnames...))
            g = ($(argnames...),) -> $(argnames[1]) * f($(argnames...))
            return $(_nest(argnames, multiset))
        end
        @eval function LibXcDerivative.$fname(f, ::Val{$(QuoteNode(name))},
                                             $(typedargs...);
                                             enforce_fhc::Bool=true)
            _refuse_potential(f)
            $(clamp...)
            return _slot(Val($(QuoteNode(fname))), Val($(QuoteNode(name))),
                         f, $(argnames...))
        end
    end
    # The whole tuple clamps once and then calls the workers, rather than
    # going back through the public slot methods and repeating both.
    calls = [:($name = _slot(Val($(QuoteNode(fname))), Val($(QuoteNode(name))),
                             f, $(argnames...))) for name in names]
    @eval function LibXcDerivative.$fname(f, $(typedargs...);
                                         enforce_fhc::Bool=true)
        _refuse_potential(f)
        $(clamp...)
        return (; $(calls...))
    end
    # A Symbol is the form a caller writes; it costs one dynamic dispatch,
    # since the slot decides the return type. Val is there for a call site
    # that wants the type inferred.
    @eval LibXcDerivative.$fname(f, slot::Symbol, $(typedargs...);
                                enforce_fhc::Bool=true) =
        LibXcDerivative.$fname(f, Val(slot), $(argnames...);
                              enforce_fhc = enforce_fhc)
    # And a name that is no slot of this family and order says what is,
    # rather than coming back as a MethodError about Val.
    let msg = "is not a slot of an unpolarized $(_family_word(nvars)) " *
              "derivative of order $order; the slots are " *
              join(string.(names), ", ")
        @eval LibXcDerivative.$fname(f, ::Val{S}, $(typedargs...);
                                    enforce_fhc::Bool=true) where {S} =
            throw(ArgumentError(string(S, " ", $msg)))
    end
end


#
# Spin-polarized derivatives of order 3 and up, generated from one rule.
#
# The widths and the ordering are Libxc's, confirmed against a MAXORDER=4
# build: all 35 components of a polarized GGA third
# derivative, on a correlation functional with no vanishing component, to
# 1.0e-14. The rule: for a slot whose multiset gives variable v a multiplicity
# k, take the multisets of v's spin channels of size k, lexicographic, and
# the first variable's axis varies slowest.
#
# The spin widths: rho and the two meta-GGA quantities have one channel per
# spin, sigma has the three (aa, ab, bb) pseudo-spin components.
#
# The second order is generated here too, by this rule rather than by
# hand-written methods over a helper that substitutes duals into a
# Vector{Any}. That form gives the right numbers, component by component
# against Libxc.jl, but makes the closure's type opaque, so differentiating
# through xc_fxc from outside fails with "Cannot determine ordering of Dual
# tags". One rule for all four orders also means the layouts cannot drift
# apart between them.
#
const _SPIN_WIDTH = (rho = 2, sigma = 3, lapl = 2, tau = 2)

# The positions in the flattened argument vector belonging to each variable.
_spin_positions(nvars) = nvars == 1 ? (1:2,) :
                         nvars == 2 ? (1:2, 3:5) : (1:2, 3:5, 6:7, 8:9)

# (variable, multiplicity) pairs of a multiset, in order.
function _groups(multiset::Vector{Int})
    out = Tuple{Int,Int}[]
    i = 1
    while i <= length(multiset)
        v = multiset[i]
        k = 1
        while i + k <= length(multiset) && multiset[i + k] == v
            k += 1
        end
        push!(out, (v, k))
        i += k
    end
    return out
end

# Every component of one slot: the product over the variable groups of that
# group's spin multisets, first group slowest.
function _slot_components(multiset::Vector{Int}, nvars::Int)
    spans = _spin_positions(nvars)
    per_group = [[collect(c) for c in _multisets(length(spans[v]), k)]
                 for (v, k) in _groups(multiset)]
    out = Vector{Int}[]
    function rec(gi, acc)
        if gi > length(per_group)
            push!(out, acc)
            return
        end
        (v, _) = _groups(multiset)[gi]
        for choice in per_group[gi]
            rec(gi + 1, vcat(acc, [spans[v][c] for c in choice]))
        end
    end
    rec(1, Int[])
    return out
end

"""
    slot_widths(family, order) -> Tuple{Vararg{Int}}

Return how many components each slot of a spin-polarized derivative holds.

The order is the one [`slot_names`](@ref) gives the slots in.

So that a caller can size an array without evaluating the derivative, which
at third order on a large kernel is minutes.
"""
function LibXcDerivative.slot_widths(family::Symbol, order::Integer)
    nvars = family === :lda ? 1 : family === :gga ? 2 :
            family in (:mgga, :mggal) ? 4 :
            throw(ArgumentError("unknown family $family"))
    2 <= order <= 4 || throw(ArgumentError(
        "order $order has no polarized slot layout here (2 to 4)"))
    return Tuple(length(_slot_components(m, nvars))
                 for m in _multisets(nvars, order))
end

for (nvars, argpack) in ((1, (:rho,)), (2, (:rho, :sigma)),
                         (4, (:rho, :sigma, :lapl, :tau))),
    (order, fname) in ((2, :xc_fxc), (3, :xc_kxc), (4, :xc_lxc))

    spans = _spin_positions(nvars)
    flat = [Symbol(:_a, i) for i in 1:last(spans[end])]
    tupletypes = [nvars == 1 ? :(Tuple{Any,Any}) :
                  i == 2 ? :(Tuple{Any,Any,Any}) : :(Tuple{Any,Any})
                  for i in 1:length(spans)]
    sigargs = [:($(Symbol(:_t, i))::$(tupletypes[i])) for i in 1:length(spans)]
    argrefs = [Symbol(:_t, i) for i in 1:length(spans)]
    unpack = [:(($(flat[spans[i]]...),) = $(Symbol(:_t, i))) for i in 1:length(spans)]
    sets = _multisets(nvars, order)
    names = [_slot_name(m, order) for m in sets]
    # One method per slot, each entry a nested chain over the flattened
    # arguments: the same _nest the unpolarized orders use, so the two
    # cannot drift apart. Here the saving is what it is for: the thirty-five
    # slots of a polarized meta-GGA fourth derivative hold 495 components
    # between them, and the widest single slot holds 24.
    # The clamp, per spin channel, before the tuples are unpacked: Libxc
    # holds sigma_aa against 8 na ta and sigma_bb against 8 nb tb and leaves
    # sigma_ab alone. libxc_clamp is the one place that rule is written.
    clamp = nvars == 4 ? [:(enforce_fhc && (($(argrefs...),) =
        LibXcDerivative.libxc_clamp(f, $(argrefs...))))] : []
    for (multiset, name) in zip(sets, names)
        comps = _slot_components(multiset, nvars)
        entries = [_nest(Tuple(flat), c) for c in comps]
        @eval function _slot(::Val{$(QuoteNode(fname))},
                             ::Val{$(QuoteNode(name))}, f, $(sigargs...))
            $(unpack...)
            g = ($(flat...),) -> ($(flat[1]) + $(flat[2])) * f($(flat...))
            return ($(entries...),)
        end
        @eval function LibXcDerivative.$fname(f, ::Val{$(QuoteNode(name))},
                                             $(sigargs...);
                                             enforce_fhc::Bool=true)
            _refuse_potential(f)
            $(clamp...)
            return _slot(Val($(QuoteNode(fname))), Val($(QuoteNode(name))),
                         f, $(argrefs...))
        end
    end
    calls = [:($name = _slot(Val($(QuoteNode(fname))), Val($(QuoteNode(name))),
                             f, $(argrefs...))) for name in names]
    @eval function LibXcDerivative.$fname(f, $(sigargs...);
                                         enforce_fhc::Bool=true)
        _refuse_potential(f)
        $(clamp...)
        return (; $(calls...))
    end
    @eval LibXcDerivative.$fname(f, slot::Symbol, $(sigargs...);
                                enforce_fhc::Bool=true) =
        LibXcDerivative.$fname(f, Val(slot), $(argrefs...);
                              enforce_fhc = enforce_fhc)
    let msg = "is not a slot of a spin-polarized $(_family_word(nvars)) " *
              "derivative of order $order; the slots are " *
              join(string.(names), ", ")
        @eval LibXcDerivative.$fname(f, ::Val{S}, $(sigargs...);
                                    enforce_fhc::Bool=true) where {S} =
            throw(ArgumentError(string(S, " ", $msg)))
    end
end

# The derivative with respect to the parameters, which is the same automatic
# differentiation as the slots above: the parameters are arguments of the
# kernel, so the gradient is over the vector `params_from` turns into the
# `params` the entry point takes. The documentation is on the declaration in
# `src/parameters.jl`.
# Real arguments, so that a call with anything else reaches the method in
# the package: an untyped signature here is the same signature that one has,
# and it would replace it.
function LibXcDerivative.param_gradient(f, args::Real...; params = NamedTuple())
    names = LibXcDerivative.param_names(f)
    isempty(names) && LibXcDerivative._reject_no_parameters(f)
    q = LibXcDerivative.param_point(f, params)
    g = ForwardDiff.gradient(
        v -> f(args...; params = LibXcDerivative.params_from(f, v)), q)
    return LibXcDerivative._named(f, g)
end

end
