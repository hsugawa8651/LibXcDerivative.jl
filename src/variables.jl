# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

# Libxc's kernels do not take a density. They take Libxc's own reduced
# variables, and this is the layer that produces them: the equivalent of
# what work_lda.c and work_gga.c do before calling a functional's kernel.
#
# The definitions are transcribed from python/libxc_codegen.py:79-83 and
# 4350-4389, which is where Libxc itself writes them down:
#
#   rs  = RS_FACTOR / n_tot^(1/dim)
#   z   = (na - nb) / n_tot
#   xt  = sqrt(gaa + 2*gab + gbb) / n_tot^(1 + 1/dim)
#   xs0 = sqrt(gaa) / na^(1 + 1/dim),  xs1 = sqrt(gbb) / nb^(1 + 1/dim)
#
# with the unpolarized case carrying half the density and a quarter of sigma
# in each channel.
#
# The dimension is not decoration. RS_FACTOR and the gradient exponent both
# depend on it, and six of the functionals shipped here are not
# three-dimensional. Getting it wrong does not fail loudly: it returns a
# plausible number that answers a different question, which is how it was
# caught: lda_c_2d_amgb disagreed with Libxc in the third digit.

"""
    lda_variables(rho, dim) -> (; rs, z)
    lda_variables(na, nb, dim) -> (; rs, z)

Reduce a density to the variables an LDA kernel takes.

The Wigner-Seitz radius `rs` and the spin polarization `z`, under Libxc's own
names for them.

The one-density method takes the total density and is the equal-spin case of
the spin-resolved one. `dim` is the functional's dimensionality, as a `Val`
so that the right factor is chosen at compile time. It has no default: three
dimensions is the common case, not a safe assumption, and leaving it out
once cost a functional its third digit (see the comment above).

# Valid arguments

`rho > 0`, and `na, nb >= 0` for the spin-resolved method.

At or below zero the generated functionals take their density-threshold
branch and return `0.0`, which is what Libxc returns there too, for a
negative density as much as for zero, measured on `lda_x` at
`rho = -1.0` (2026-10-08). So a negative density is not reported, here or
by Libxc: it is answered with zero.
"""
lda_variables(rho, dim::Val) = (rs = _rs(rho, dim), z = zero(rho))

function lda_variables(na, nb, dim::Val)
    n_tot = na + nb
    return (rs = _rs(n_tot, dim), z = (na - nb) / n_tot)
end

"""
    gga_variables(rho, sigma, dim) -> (; rs, z, xt, xs0, xs1)
    gga_variables(na, nb, gaa, gab, gbb, dim) -> (; rs, z, xt, xs0, xs1)

Reduce a density and its gradient to the variables a GGA kernel takes.

`rs` and `z` as for an LDA, plus the reduced gradient of the total density
`xt` and of each spin channel (`xs0`, `xs1`), under Libxc's own names.

The two-density method takes the total density and `sigma = |grad n|^2`, and
is the equal-spin case of the spin-resolved one, which is what fixes how
sigma splits across channels: equal spins carry `gaa = gab = gbb = sigma/4`.

# Valid arguments

`rho > 0` as for LDA, and `sigma >= 0`, it being a squared gradient.

Spin-resolved, `gaa, gbb >= 0` and the cross term is bounded by
Cauchy-Schwarz, `gab^2 <= gaa * gbb`, since `gab = grad n_a . grad n_b`.
That bound is not decoration: `gga_c_pbe` moves from -0.0696 to -0.0317
when `gab` is pushed from 0.1 to 10 at `gaa = gbb = 0.1`, and `gga_c_lyp`
from -0.0470 to -0.0423 (2026-10-08). An exchange functional ignores `gab`
and will not notice.

A negative `sigma` is not a value the quantity takes: it is a squared
gradient. `sqrt(sigma)` here is Base's, so it throws a `DomainError` and
says so. Libxc instead clamps it to zero and returns the `sigma = 0`
answer, measured at `sigma = -0.1` and `-1.0` on `gga_x_pbe` (2026-10-08),
which is the defensive choice for a library handed arrays off a grid where
rounding can make a squared quantity slightly negative.

That difference is not the one `NaNMath` is about, and the kernels' use of
it is not in question here. `NaNMath` is for an argument that is valid and
an *intermediate* that leaves some function's domain (the `sqrt` of a
branch `my_piecewise3` will discard) where throwing would abandon an
evaluation Libxc completes. A caller passing a negative squared gradient is
a different thing: there is no evaluation to complete, because the input
does not describe a density. The same holds for `rho < 0` above, which is
answered with zero only because the threshold branch happens to catch it.
"""
function gga_variables(rho, sigma, dim::Val)
    # Written as the equal-spin case rather than in its own algebraically
    # simplified form, so the two methods cannot drift apart.
    na = rho / 2
    return (rs = _rs(rho, dim), z = zero(rho),
            xt = sqrt(sigma) / _pow_grad(rho, dim),
            xs0 = sqrt(sigma / 4) / _pow_grad(na, dim),
            xs1 = sqrt(sigma / 4) / _pow_grad(na, dim))
end

function gga_variables(na, nb, gaa, gab, gbb, dim::Val)
    n_tot = na + nb
    return (rs = _rs(n_tot, dim), z = (na - nb) / n_tot,
            xt = sqrt(gaa + 2 * gab + gbb) / _pow_grad(n_tot, dim),
            xs0 = sqrt(gaa) / _pow_grad(na, dim),
            xs1 = sqrt(gbb) / _pow_grad(nb, dim))
end

"""
    mgga_variables(rho, sigma, lapl, tau, dim) -> (; rs, z, xt, xs0, xs1, u0, u1, t0, t1)
    mgga_variables(na, nb, gaa, gab, gbb, la, lb, ta, tb, dim) -> (; rs, z, xt, xs0, xs1, u0, u1, t0, t1)

Reduce a density, its gradient, Laplacian and `tau` to a meta-GGA's variables.

The five a GGA takes, plus the reduced Laplacian (`u0`, `u1`) and reduced
kinetic energy density (`t0`, `t1`) of each spin channel, under Libxc's own
names.

Both of the new pairs reduce by `n^(1 + 2/dim)`, against `n^(1 + 1/dim)` for
the gradient, as `python/libxc_codegen.py:4395-4413` forms them.

The four-density method takes the total density, `sigma = |grad n|^2`, the
total Laplacian and the total kinetic energy density, and is the equal-spin
case of the spin-resolved one. That is what fixes how the Laplacian and tau
split: equal spins carry half of each, the same way sigma splits into
quarters.

# What tau and sigma may be

`tau` and `sigma` are not independent. Any real density satisfies

    tau >= sigma / (8 * rho)

where the right-hand side is the von Weizsäcker kinetic energy density, which a
single orbital attains and nothing falls below. Several meta-GGAs are built
on SCAN's `alpha = (tau - tau_W) / tau_unif`, which is therefore
non-negative for every density that exists.

Handing this function a smaller `tau` is not an error and it is not checked
for: the reduced variables come out, and a functional built on them returns
a number. But that number is not Libxc's. Libxc clamps `alpha` at zero, so
its value stops responding to `sigma` past the bound; this package carries
the negative `alpha` through. Measured on `mgga_c_rregtm` at `rho = 0.01`,
`tau = 0.3 rho` (2026-10-08): the two agree exactly while
`tau - tau_W = +3.6e-5` and part company at `-1.4e-4`, where Libxc freezes
at -0.0157741004 and this package goes on to -0.0033.

So a disagreement with Libxc found below that bound is a statement about an
input no density produces, not about either implementation. For the inputs
a test or a benchmark uses, `sigma = c_s * rho` with `tau = c_t * rho` is
physical only for `rho >= c_s / (8 * c_t)`: the common choice
`sigma = 0.1 rho`, `tau = 0.3 rho` needs `rho >= 0.0417`.

Below it nothing is reported: `mgga_x_scan` returns -0.8674 at `tau = 0`
and -0.8702 at `tau = -0.1`, both finite (2026-10-08).

This bound is of a different kind from `sigma >= 0`. There, one argument is
outside the range its own quantity has. Here every argument is a value its
quantity can take, and it is the *combination* that no density produces,
so nothing in the arguments is checkable one at a time, and the caller is
the only place that knows whether its `tau` and `sigma` came from the same
density. Hence the inequality, written out, rather than a check.

The reduced Laplacian has no bound of this kind: `lapl` may take either
sign, and does.
"""
function mgga_variables(rho, sigma, lapl, tau, dim::Val)
    # Written as the equal-spin case rather than in its own algebraically
    # simplified form, so the two methods cannot drift apart.
    na = rho / 2
    pk = _pow_kin(na, dim)
    u = (lapl / 2) / pk
    t = (tau / 2) / pk
    return (rs = _rs(rho, dim), z = zero(rho),
            xt = sqrt(sigma) / _pow_grad(rho, dim),
            xs0 = sqrt(sigma / 4) / _pow_grad(na, dim),
            xs1 = sqrt(sigma / 4) / _pow_grad(na, dim),
            u0 = u, u1 = u, t0 = t, t1 = t)
end

function mgga_variables(na, nb, gaa, gab, gbb, la, lb, ta, tb, dim::Val)
    n_tot = na + nb
    return (rs = _rs(n_tot, dim), z = (na - nb) / n_tot,
            xt = sqrt(gaa + 2 * gab + gbb) / _pow_grad(n_tot, dim),
            xs0 = sqrt(gaa) / _pow_grad(na, dim),
            xs1 = sqrt(gbb) / _pow_grad(nb, dim),
            u0 = la / _pow_kin(na, dim), u1 = lb / _pow_kin(nb, dim),
            t0 = ta / _pow_kin(na, dim), t1 = tb / _pow_kin(nb, dim))
end

# rs = RS_FACTOR / n^(1/dim), with the factors of python/libxc_codegen.py:79-83.
# Written as literals so the values are visible; each is the correctly rounded
# Float64 of the expression named beside it, which the test suite pins.
const RS_FACTOR_1D = 0.5                   # 1/2
const RS_FACTOR_2D = 0.5641895835477563    # 1/sqrt(pi)
const RS_FACTOR_3D = 0.6203504908994       # (3/(4*pi))^(1/3)

_rs(n, ::Val{1}) = RS_FACTOR_1D / n
_rs(n, ::Val{2}) = RS_FACTOR_2D / sqrt(n)
_rs(n, ::Val{3}) = RS_FACTOR_3D / cbrt(n)

# n^(1 + 1/dim), spelled out per dimension rather than as a generic power:
# cbrt and sqrt are both more direct than `^` and defined where it is awkward.
_pow_grad(n, ::Val{1}) = n * n
_pow_grad(n, ::Val{2}) = n * sqrt(n)
_pow_grad(n, ::Val{3}) = n * cbrt(n)

# n^(1 + 2/dim), the reduction the Laplacian and tau carry. Spelled out per
# dimension for the same reason as _pow_grad; in three dimensions the two
# cube roots are what n^(5/3) costs anyway, and they keep the result exact
# for a power of two.
_pow_kin(n, ::Val{1}) = n * n * n
_pow_kin(n, ::Val{2}) = n * n
_pow_kin(n, ::Val{3}) = n * cbrt(n) * cbrt(n)
