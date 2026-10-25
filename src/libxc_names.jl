# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

using SpecialFunctions: erf, erfc, erfcx, besseli

"""
    xc_log1p(x)

Return `log(1 + x)` without losing precision at small `x`.

Libxc's own name for `log1p` (see `python/libxc_codegen.py`), under which its
kernels call it. Goes through `NaNMath.log1p` rather than Base's, so a
negative argument below -1 gives `NaN` instead of throwing.
[`xc_expm1`](@ref) is the same arrangement for `expm1`.

Unlike `my_piecewise3/5`
these need no `@register_symbolic`/`@register_derivative`: they are plain
pass-throughs, so ForwardDiff and Zygote differentiate them exactly as they
would `log1p`/`expm1` directly, with no custom rule to get wrong. The tests
check both; other AD systems are not tested.

`xc_log1p` passes through to `NaNMath.log1p` rather than Base's. Libxc
defines it as the C library's `log1p` (`src/util.h:347`), which returns NaN
below -1; Base's throws a `DomainError` there. Generated kernels select
branches with `ifelse`, which evaluates the discarded branch too, so a throw
there would stop an evaluation that Libxc completes. `expm1` is defined on
all reals and needs no such care.
"""
xc_log1p(x) = NaNMath.log1p(x)

"""
    xc_expm1(x)

Return `exp(x) - 1` without losing precision at small `x`.

Libxc's own name for `expm1` (see `python/libxc_codegen.py`), under which its
kernels call it, and a plain pass-through to Base's. See [`xc_log1p`](@ref)
for why these two carry Libxc's spellings at all.
"""
xc_expm1(x) = expm1(x)

"""
    xc_asinh(x)

Return `asinh(x)`, under the name Libxc's kernels call it by.

Libxc renames it only so its code
generator emits a direct `asinh()` call (`src/util.h:348` is literally
`#define xc_asinh(x) asinh((double)(x))`), so this is a pass-through like
`xc_log1p`/`xc_expm1`, and `python/libxc_codegen.py`'s `fdiff` for it
(`1/sqrt(1 + y^2)`) is exactly `asinh`'s own derivative, so no custom rule is
needed. Used by `lda_x_rel`.
"""
xc_asinh(x) = asinh(x)

"""
    BesselI(nu, x)

Return the modified Bessel function of the first kind, order `nu`.

This is the name Libxc's kernels call it by.

Its SymPy sources write `BesselI(0, .)` and `BesselI(1, .)`, which the C path
rewrites to `xc_bessel_I0`/`xc_bessel_I1`
(`python/mgga_exc/mgga_x_2d_prhg07.py` header). Those are the only two orders
Libxc reaches, and `SpecialFunctions.besseli` reproduces both to rounding
against the pinned build, so this is a renaming rather than a port. The
derivative needs no rule of its own: `besseli` carries one, and `I0' = I1` is
what the kernel differentiates through.
"""
BesselI(nu, x) = besseli(nu, x)

"""
    _solve_bracketed(f, df, lo, hi)

Return the root of `f` in `[lo, hi]`, differentiably.

Bisection for the value, then a few Newton steps so that the result carries a
derivative.

Bisection alone cannot be differentiated through: it decides with
comparisons, which carry none. Newton alone walks out of the bracket on these
equations and sticks to whichever end it was clamped at. Together they give
both: one Newton step from a converged value returns the exact implicit
derivative, because the term carrying the incoming derivative is multiplied
by the residual and the residual is zero.
"""
function _solve_bracketed(f, df, lo, hi)
    flo = f(lo)
    for _ in 1:60
        mid = (lo + hi) / 2
        fmid = f(mid)
        if (fmid > 0) == (flo > 0)
            lo, flo = mid, fmid
        else
            hi = mid
        end
    end
    x = (lo + hi) / 2
    for _ in 1:3
        d = df(x)
        d == 0 && break
        x = x - f(x) / d
    end
    return x
end

"""
    br89_x(Q)

Solve Becke and Roussel's equation for `x`, given `Q`.

That is the `x` solving

    x * exp(-2x/3) = rhs * (x - 2),    rhs = (2/3) * pi^(2/3) / Q

which Libxc obtains with Brent's method over a bracket chosen from the sign
of `rhs` (`xc_mgga_x_br89_get_x`, `src/mgga_x_br89.c:49`). `Q` below the
tolerance C tests against returns 2 exactly, the value the equation
degenerates to.

Solved by Newton rather than by bisection, for the reason `LambertW` is: a
bracketing method decides with comparisons, which carry no derivative, and
this is differentiated through. The bracket is kept as a clamp, which stops
acting once the iterates are interior, so what the derivative comes from is
the Newton step. Libxc declares the derivative analytically instead (the
`fdiff` of class `br89_x` in `python/mgga_exc/mgga_x_br89.py`), and the test
suite holds the iteration to it.

Used by `mgga_x_br89`, `mgga_c_b94`, `mgga_x_mbr` and `mgga_x_mbrxh_bg`.
"""
function br89_x(Q)
    T = float(typeof(one(Q)))
    # The tolerance C solves to, and the value it returns below it.
    abs(Q) < 2 * eps(T(1)) && return T(2)

    rhs = (2 / T(3)) * cbrt(T(π))^2 / Q
    # Libxc's brackets: above 2 when rhs > 0, below it otherwise.
    lo, hi = rhs > 0 ? (T(2), 1 / rhs + 2) : (zero(T), T(2))
    f(x) = x * exp(-2x / 3) - rhs * (x - 2)
    df(x) = exp(-2x / 3) * (1 - 2x / 3) - rhs
    return _solve_bracketed(f, df, lo, hi)
end

"""
    mbrxc_x(Q)

Solve the modified Becke-Roussel equation for `x`, given `Q`.

That is the `x` solving

    (1 + x)^(5/3) * exp(-2x/3) = rhs * (x - 3),   rhs = (32*pi)^(2/3) / (6Q)

for the modified Becke-Roussel exchange (`xc_mgga_x_mbrxc_get_x`,
`src/mgga_x_mbrxc_bg.c:24`), by Newton for the reason `br89_x` is.

The lower bracket is -1 rather than 0, which is where `(1 + x)^(5/3)`
vanishes; the power is written through `cbrt` so that it stays real for every
`x` the clamp allows. `Q` below the tolerance C tests against returns 3.

Used by `mgga_x_mbrxc_bg` and `mgga_x_mggac`.
"""
function mbrxc_x(Q)
    T = float(typeof(one(Q)))
    abs(Q) < 2 * eps(T(1)) && return T(3)

    rhs = cbrt(32 * T(π))^2 / (6 * Q)
    lo, hi = rhs > 0 ? (T(3), 2 / rhs + 3) : (-one(T), T(3))
    f(x) = (1 + x) * cbrt(1 + x)^2 * exp(-2x / 3) - rhs * (x - 3)
    # d/dx (1+x)^(5/3) e^(-2x/3) = e*(1+x)^(2/3)*(5/3 - 2(1+x)/3)
    df(x) = exp(-2x / 3) * cbrt(1 + x)^2 * (5 - 2 * (1 + x)) / 3 - rhs
    return _solve_bracketed(f, df, lo, hi)
end

"""
    xc_atanh(x)

Return `atanh(x)`, under the name Libxc's kernels call it by.

Used by `lda_c_pk09`'s Q_3ud. A pass-through like [`xc_asinh`](@ref):
`python/libxc_codegen.py`'s `fdiff` for it, `1/((1+y)*(1-y))`, is exactly
`atanh`'s own derivative.

To `NaNMath.atanh`, for the reason given for `xc_log1p`: Libxc's is the C
library's `atanh` (`src/util.h:349`), NaN for `|x| > 1`, where Base's throws.
"""
xc_atanh(x) = NaNMath.atanh(x)

# Coefficients of x - log(1 + x) = sum_{k>=2} (-1)^k x^k / k, for k = 2..24,
# i.e. the series divided by x^2. Carried to k = 24 so that at the |x| = 0.25
# cutoff below the truncation error is < 0.25^25/25 ~ 3.6e-17, under
# eps(Float64), the same order Libxc's C implementation chose.
const _X_MINUS_LOG1P_COEFFS = ntuple(i -> ifelse(iseven(i + 1), 1.0, -1.0) / (i + 1), 23)

"""
    xc_x_minus_log1p(x)

Return `x - log(1 + x)` without the cancellation the direct form suffers.

Written directly, `x - log1p(x)` subtracts two nearly equal quantities at
small `x` to produce a result of order `x^2/2`.

This is **not** a pass-through: Libxc implements it as a real function
(`src/util.c:39`), switching to the Taylor series for `|x| < 0.25` and
falling back to the direct evaluation outside that regime. That branch
structure is ported here rather than simplified away, because writing
`x - log1p(x)` directly would silently lose the precision this function
exists to preserve.

Written branchlessly with `ifelse` for the same reason `my_piecewise3` is: a
branch taken on a value does not survive being traced into straight-line
code. Both branches are therefore evaluated eagerly;
`NaNMath.log1p` rather than `Base.log1p` keeps the discarded branch from
throwing a `DomainError` at `x <= -1`, matching the NaN-instead-of-throw
behaviour `Symbolics.build_function` gives generated code. Used by
`lda_k_zlp`, `lda_xc_zlp`, and much of the GGA/MGGA `*_zlp`/`chachiyo`
family.
"""
function xc_x_minus_log1p(x)
    taylor = evalpoly(x, _X_MINUS_LOG1P_COEFFS) * x * x
    direct = x - NaNMath.log1p(x)
    return ifelse(abs(x) < 0.25, taylor, direct)
end

"""
    atan2(y, x)

Return the two-argument arctangent, under the name SymPy and C spell it by.

Julia's own `atan(y, x)`, same argument order and branch convention. Reaches
generated code because `python/libxc_codegen.py`
passes SymPy's `atan2` through by name. Used by `lda_x_yukawa` and
`hyb_lda_xc_bn05`.
"""
atan2(y, x) = atan(y, x)

# `erf` and `erfc` are SymPy's own names, passed through by libxc_codegen and
# supplied here by SpecialFunctions.jl (imported above) rather than defined
# here. They are not exported: a generated file resolves them inside this
# module, and a caller who wants them writes `using SpecialFunctions`. Used
# by `lda_x_erf` and `gga_c_lypr`.

"""
    xc_erfcx(x)

Return the scaled complementary error function `exp(x^2) * erfc(x)`.

This is the name Libxc's kernels call it by.

Libxc gives it a name of its own because the two factors leave the range of a
double long before their product does: at `x = 30` the naive form is
`exp(900) * 0`, which is `Inf * 0` and so `NaN`, while the function it stands
for is perfectly ordinary there and decays like `1/(x*sqrt(pi))`. Libxc
carries Steven G. Johnson's Faddeeva routine for it (`src/faddeeva.c`); here
it is a pass-through to `SpecialFunctions.erfcx`, which agrees with a
higher-precision reference to rounding.

`gga_x_wpbeh` is what needs it: the omega-PBE exchange hole is built out of
it, and that kernel is the one Libxc functional whose generation stops for a
missing name rather than for anything about the mathematics.

No derivative rule of its own. Libxc declares four
(`xc_erfcx_jet`, `xc_erfcx_d1` .. `_d4`, `src/util.h:393-398`) because its C
path has to emit each order as a function it can call; `libxc_codegen`'s
`fdiff` for the first is `2*y*xc_erfcx(y) - 2/sqrt(pi)`, which is what
`SpecialFunctions` differentiates by as well, so ForwardDiff and Zygote both
reproduce it and the second order with it.
"""
xc_erfcx(x) = erfcx(x)

"""
    LambertW(z)

Return the principal branch of the Lambert W function.

The `w` with `w exp(w) = z`, for `z >= -1/e`. Used by `gga_x_am05`.

Ported from Libxc's `src/special_functions.c:20`, which adapts Rickard
Armiento's Fortran, following Corless, Gonnet, Hare, Jeffrey and Knuth,
*Adv. in Comp. Math.* **5**(4):329-359 (1996): a series for small `z`, one of
three initial guesses, then Halley's iteration, which converges cubically.

Outside the domain Libxc prints and calls `abort()`. Here the answer is `NaN`,
for the reason given for `xc_log1p`: generated kernels select branches with
`ifelse`, which evaluates the branch it discards. The few floating-point steps
below `-1/e` where Libxc returns `-1` are kept, so the two agree wherever
Libxc answers at all.
"""
function LambertW(z)
    z + inv(oftype(float(z), MathConstants.e)) < -10 * eps(float(real(one(z)))) &&
        return oftype(float(z), NaN)
    z < -inv(oftype(float(z), MathConstants.e)) && return -one(float(z))
    # Below the cube root of eps, z^4 is already negligible.
    abs(z) < cbrt(eps(float(real(one(z))))) && return z - z * z + 3 * z * z * z / 2

    w = if z <= -0.3140862435046707        # where the sqrt and Taylor forms meet
        sqrt(2 * MathConstants.e * z + 2) - 1
    elseif z <= 1.149876485041417          # where the Taylor and log forms meet
        z - z * z + 3 * z * z * z / 2
    else
        lnz = log(z)
        lnz - log(lnz)
    end

    for _ in 1:20
        r = w - z * exp(-w)
        dw = w == -1 ? zero(w) : -r / (w + 1 - (w + 2) / (2w + 2) * r)
        w += dw
        # Near the branch point the last bits are not reachable from z at
        # all, since z no longer pins down 1 + e*z; Libxc returns the best
        # iterate there, and so does the loop by running out.
        abs(dw) < 2 * eps(float(real(one(z)))) * (1 + abs(w)) && break
    end
    return w
end

"""
Chebyshev coefficients for Spence's function.

Transcribed from Libxc's
`src/special_functions.c:136` (`spencs`), which takes them from the SLATEC
routine by W. Fullerton.
"""
const _SPENCE_COEFFS = (
    0.1527365598892405872946684910028e+0, 0.8169658058051014403501838185271e-1,
    0.5814157140778730872977350641182e-2, 0.5371619814541527542247889005319e-3,
    0.5724704675185826233210603054782e-4, 0.6674546121649336343607835438589e-5,
    0.8276467339715676981584391689011e-6, 0.1073315673030678951270005873354e-6,
    0.1440077294303239402334590331513e-7, 0.1984442029965906367898877139608e-8,
    0.2794005822163638720201994821615e-9, 0.4003991310883311823072580445908e-10,
    0.5823462892044638471368135835757e-11, 0.8576708692638689278097914771224e-12,
    0.1276862586280193045989483033433e-12, 0.1918826209042517081162380416062e-13,
    0.2907319206977138177795799719673e-14, 0.4437112685276780462557473641745e-15,
    0.6815727787414599527867359135607e-16, 0.1053017386015574429547019416644e-16,
    0.1635389806752377100051821734570e-17, 0.2551852874940463932310901642581e-18,
    0.3999020621999360112770470379519e-19, 0.6291501645216811876514149171199e-20,
    0.9933827435675677643803887752533e-21, 0.1573679570749964816721763805866e-21,
    0.2500595316849476129369270954666e-22, 0.3984740918383811139210663253333e-23,
    0.6366473210082843892691326293333e-24, 0.1019674287239678367077061973333e-24,
    0.1636881058913518841111074133333e-25, 0.2633310439417650117345279999999e-26,
    0.4244811560123976817224362666666e-27, 0.6855411983680052916824746666666e-28,
    0.1109122433438056434018986666666e-28, 0.1797431304999891457365333333333e-29,
    0.2917505845976095173290666666666e-30, 0.4742646808928671061333333333333e-31,
)

# Clenshaw's recurrence, as Libxc evaluates these series (util.h:359).
function _cheb_eval(x, cs)
    b0 = b1 = b2 = zero(float(x))
    twox = 2 * x
    for i in length(cs):-1:1
        b2 = b1
        b1 = b0
        b0 = twox * b1 - b2 + cs[i]
    end
    return (b0 - b2) / 2
end

"""
    xc_dilogarithm(x)

Return the dilogarithm `Li_2(x) = -\\int_0^x log(1 - t)/t dt`, real argument.

Ported from Libxc's `src/special_functions.c:181`, which follows the SLATEC
routine by W. Fullerton: six ranges, each reduced to the same Chebyshev
series by a functional equation. Used by `gga_x_gg99`.

Its derivative, `-log(1 - x)/x`, is what `libxc_codegen` emits for it, and
differentiating this port gives the same thing; Libxc carries no derivative
series for `Li_2` either.
"""
function xc_dilogarithm(x)
    pi26 = 1.644934066848226436472415166646025189219   # pi^2/6
    # Where the tail terms below stop contributing: FLT_RADIX/DBL_EPSILON.
    big = 2 / eps(float(real(one(x))))
    if x > 2
        aux = log(x)
        y = 2 * pi26 - aux * aux / 2
        x < big && (y -= (1 + _cheb_eval(4 / x - 1, _SPENCE_COEFFS)) / x)
        return y
    elseif x > 1
        aux = x - 1
        return pi26 - log(x) * log(aux * aux / x) / 2 +
               aux * (1 + _cheb_eval(4 * aux / x - 1, _SPENCE_COEFFS)) / x
    elseif x > 0.5
        # Li_2(1) = pi^2/6. The branch below tends to it, but log(1 - x)
        # reaches -Inf first, so Libxc guards the point and so does this.
        x == 1 && return oftype(float(x), pi26)
        return pi26 - log(x) * log(1 - x) -
               (1 - x) * (1 + _cheb_eval(4 * (1 - x) - 1, _SPENCE_COEFFS))
    elseif x >= 0
        return x * (1 + _cheb_eval(4 * x - 1, _SPENCE_COEFFS))
    elseif x > -1
        aux = log(1 - x)
        return -aux * aux / 2 -
               x * (1 + _cheb_eval(4 * x / (x - 1) - 1, _SPENCE_COEFFS)) / (x - 1)
    else
        aux = log(1 - x)
        y = -pi26 - aux * (2 * log(-x) - aux) / 2
        x > -big && (y += (1 + _cheb_eval(4 / (1 - x) - 1, _SPENCE_COEFFS)) / (1 - x))
        return y
    end
end

"""
Chebyshev coefficients for the exponential integral `E1`, one table per range.

Transcribed from Libxc's `src/expint_e1.c:28` (`AE11_data` through
`AE14_data`), which takes them from the SLATEC routine by W. Fullerton via
the GSL.
"""
const _AE11 = (
    0.121503239716065790, -0.065088778513550150, 0.004897651357459670,
    -0.000649237843027216, 0.000093840434587471, 0.000000420236380882,
    -0.000008113374735904, 0.000002804247688663, 0.000000056487164441,
    -0.000000344809174450, 0.000000058209273578, 0.000000038711426349,
    -0.000000012453235014, -0.000000005118504888, 0.000000002148771527,
    0.000000000868459898, -0.000000000343650105, -0.000000000179796603,
    0.000000000047442060, 0.000000000040423282, -0.000000000003543928,
    -0.000000000008853444, -0.000000000000960151, 0.000000000001692921,
    0.000000000000607990, -0.000000000000224338, -0.000000000000200327,
    -0.000000000000006246, 0.000000000000045571, 0.000000000000016383,
    -0.000000000000005561, -0.000000000000006074, -0.000000000000000862,
    0.000000000000001223, 0.000000000000000716, -0.000000000000000024,
    -0.000000000000000201, -0.000000000000000082, 0.000000000000000017,
)

const _AE12 = (
    0.582417495134726740, -0.158348850905782750, -0.006764275590323141,
    0.005125843950185725, 0.000435232492169391, -0.000143613366305483,
    -0.000041801320556301, -0.000002713395758640, 0.000001151381913647,
    0.000000420650022012, 0.000000066581901391, 0.000000000662143777,
    -0.000000002844104870, -0.000000000940724197, -0.000000000177476602,
    -0.000000000015830222, 0.000000000002905732, 0.000000000001769356,
    0.000000000000492735, 0.000000000000093709, 0.000000000000010707,
    -0.000000000000000537, -0.000000000000000716, -0.000000000000000244,
    -0.000000000000000058,
)

const _E11 = (
    -16.11346165557149402600, 7.79407277874268027690, -1.95540581886314195070,
    0.37337293866277945612, -0.05692503191092901938, 0.00721107776966009185,
    -0.00078104901449841593, 0.00007388093356262168, -0.00000620286187580820,
    0.00000046816002303176, -0.00000003209288853329, 0.00000000201519974874,
    -0.00000000011673686816, 0.00000000000627627066, -0.00000000000031481541,
    0.00000000000001479904, -0.00000000000000065457, 0.00000000000000002733,
    -0.00000000000000000108,
)

const _E12 = (
    -0.03739021479220279500, 0.04272398606220957700, -0.13031820798497005440,
    0.01441912402469889073, -0.00134617078051068022, 0.00010731029253063780,
    -0.00000742999951611943, 0.00000045377325690753, -0.00000002476417211390,
    0.00000000122076581374, -0.00000000005485141480, 0.00000000000226362142,
    -0.00000000000008635897, 0.00000000000000306291, -0.00000000000000010148,
    0.00000000000000000315,
)

const _AE13 = (
    -0.605773246640603460, -0.112535243483660900, 0.013432266247902779,
    -0.001926845187381145, 0.000309118337720603, -0.000053564132129618,
    0.000009827812880247, -0.000001885368984916, 0.000000374943193568,
    -0.000000076823455870, 0.000000016143270567, -0.000000003466802211,
    0.000000000758754209, -0.000000000168864333, 0.000000000038145706,
    -0.000000000008733026, 0.000000000002023672, -0.000000000000474132,
    0.000000000000112211, -0.000000000000026804, 0.000000000000006457,
    -0.000000000000001568, 0.000000000000000383, -0.000000000000000094,
    0.000000000000000023,
)

const _AE14 = (
    -0.18929180007530170, -0.08648117855259871, 0.00722410154374659,
    -0.00080975594575573, 0.00010999134432661, -0.00001717332998937,
    0.00000298562751447, -0.00000056596491457, 0.00000011526808397,
    -0.00000002495030440, 0.00000000569232420, -0.00000000135995766,
    0.00000000033846628, -0.00000000008737853, 0.00000000002331588,
    -0.00000000000641148, 0.00000000000181224, -0.00000000000052538,
    0.00000000000015592, -0.00000000000004729, 0.00000000000001463,
    -0.00000000000000461, 0.00000000000000148, -0.00000000000000048,
    0.00000000000000016, -0.00000000000000005,
)

"""
    xc_E1_scaled(x)

Return `exp(x) E1(x)`, the exponential integral scaled so it stays finite.

Libxc's `xc_E1_scaled`, which is `xc_expint_e1_impl(x, 1)`
(`src/util.h:334`).
Forming `exp(x)` and `E1(x)` separately would overflow and underflow long
before their product, which only decays like `1/x`, becomes small. For
negative `x` the value is the Cauchy principal value. Used by `gga_c_ft97`.

Ported from `src/expint_e1.c:85`, keeping its six Chebyshev ranges. At the
origin `E1` diverges; Libxc prints there and returns zero, while this returns
the limit, `Inf`.

Its derivative is `exp(x) E1(x) - 1/x`, which is what `libxc_codegen` emits
for it (`python/libxc_codegen.py:801`), and differentiating this port gives
the same thing.
"""
function xc_E1_scaled(x)
    if x <= -10
        return (1 + _cheb_eval(20 / x + 1, _AE11)) / x
    elseif x <= -4
        return (1 + _cheb_eval((40 / x + 7) / 3, _AE12)) / x
    elseif x <= -1
        return exp(x) * (-log(abs(x)) + _cheb_eval((2 * x + 5) / 3, _E11))
    elseif x == 0
        return oftype(float(x), Inf)
    elseif x <= 1
        return exp(x) * (-log(abs(x)) - 0.6875 + x + _cheb_eval(x, _E12))
    elseif x <= 4
        return (1 + _cheb_eval((8 / x - 5) / 3, _AE13)) / x
    else
        return (1 + _cheb_eval(8 / x - 1, _AE14)) / x
    end
end

# 1! through 16!, the coefficients of upstream's asymptotic series. All exact
# as Float64: 16! is 2.09e13, well inside 2^53.
const _E1_SCALED_G_FACTORIALS = ntuple(k -> float(factorial(k)), 16)

"""
    xc_e1_scaled_G(y)

Return `1 - y xc_E1_scaled(y)`, the complement of the scaled exponential
integral.

Libxc's `e1_scaled_G` (`maple/util.mpl:41`, hand-ported to
`python/libxc_codegen.py:943`). It is positive everywhere and goes like `1/y`
far out, where the direct form is a difference of two quantities that both
tend to one: a consumer on the tail needs this rather than
[`xc_E1_scaled`](@ref) itself, and that is what `gga_c_ft97` reaches for.

Above `y = 100` the value is upstream's sixteen-term asymptotic series,
grouped by Horner over `1/y` rather than written as `factorial(k)/y^k`. The
arithmetic is the same and the grouping is not cosmetic. Upstream
differentiates the series symbolically and emits the result, so its C never
forms `y^k`; here the expression itself is differentiated, and the quotient
rule forms the square of whatever is in the denominator. `gga_c_ft97` reaches
`y = 1.7e17` at `rho = 0.05`, where `y^9` is `1.1e155` and its square is
`1.2e310`: past that overflow every third- and fourth-order slot came back
NaN while Libxc returned a number. In Horner form no power of `y` is formed at
all, and the same slots agree with a `BigFloat` evaluation to 3e-17.

The branch is a plain `if`, which freezes under differentiation exactly as
upstream's `my_piecewise3` does. Upstream additionally clamps the series
argument with `m_max(y, 100)`, because its `my_piecewise3` evaluates the
branch it discards; an `if` evaluates only the branch it takes, so there is
nothing to clamp.
"""
function xc_e1_scaled_G(y)
    y < 100 && return 1 - y * xc_E1_scaled(y)
    t = inv(y)
    s = oftype(t, _E1_SCALED_G_FACTORIALS[16])
    for k in 15:-1:1
        s = _E1_SCALED_G_FACTORIALS[k] - t * s
    end
    return t * s
end

"""
    Abs(x)

Return `abs(x)`, under the name SymPy spells it by.

Passed through by `libxc_codegen` and so reaching the generated code as
written.

A pass-through: `abs` differentiates the way `Abs` does, and Libxc reaches for
it in the same places: `gga_c_p86` takes the absolute value of a gradient
component.
"""
Abs(x) = abs(x)
