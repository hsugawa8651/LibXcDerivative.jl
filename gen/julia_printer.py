# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

"""Print a SymPy expression as Julia source for the generated kernels.

This replaces the SymPy -> Symbolics.jl -> ``build_function`` round trip the
generator used to go through.  Three things that round trip provided have to
be provided here instead, and they are what the class below is about:

* **NaNMath lowering.**  The kernels must return NaN outside a function's
  domain, the way the C library they are translated from does, rather than
  throwing the ``DomainError`` Julia's own ``sqrt``/``log``/``^`` throw.
  ``_print_Pow`` and the ``log``/``sqrt`` entries in ``JULIA_NAMES`` are
  what keep that contract.
* **Libxc's own spelling.**  The expressions arrive already carrying the
  names Libxc uses (the Maple translation under ``libxc-upstream/python``
  emits ``xc_log1p``, ``my_piecewise3`` and friends as SymPy ``Function``
  subclasses), so the map below is keyed on the class names that actually
  appear in an expression -- read off ``atoms(Function)`` by
  ``printer_for`` -- and an unlisted name is refused rather than printed
  into a kernel that would fail at its first call.
* **Exact rationals.**  ``julia_code`` prints ``29393 //
  113267782428181659648`` digit for digit and Julia parses it as a
  ``Rational{Int128}``, so wide series coefficients need no placeholder
  step of their own.

The one thing inherited from ``JuliaCodePrinter`` that has to go is the
broadcasting dot: it comes from that printer's MATLAB ancestry, and these
kernels are scalar.
"""

import math

import sympy as sp
from sympy.printing.julia import JuliaCodePrinter
from sympy.printing.codeprinter import PrintMethodNotImplementedError
from sympy.printing.precedence import precedence

# SymPy function-class name -> the Julia name to print for it.  Everything
# here is either a Base/SpecialFunctions name or one defined in
# ``src/libxc_names.jl``; the test suite's static audit over
# ``src/generated`` is what keeps the two in step.
JULIA_NAMES = {
    # Lowered to NaNMath so that a negative argument gives NaN, not a throw.
    'log': 'NaNMath.log',
    # sin/cos are total; they are lowered only so that every call in the
    # generated corpus reaches the same place, which is what the round trip
    # did as well.
    'sin': 'NaNMath.sin',
    'cos': 'NaNMath.cos',
    'exp': 'exp',
    'tanh': 'tanh',
    'sech': 'sech',
    'acsch': 'acsch',
    'atan': 'atan',
    'erf': 'erf',
    'erfc': 'erfc',
    # exp(x^2)*erfc(x) under Libxc's name, defined in src/libxc_names.jl as a
    # pass-through to SpecialFunctions.erfcx. Not printed as the product it
    # stands for: that overflows and underflows long before the product does.
    'xc_erfcx': 'xc_erfcx',
    # Abs is defined in src/libxc_names.jl rather than printed as Julia's
    # `abs`, so that the generated corpus keeps one spelling per Libxc name.
    'Abs': 'Abs',
    # Libxc's renamings of four standard functions. The expressions reach
    # us carrying SymPy's own spelling for these: libxc_codegen's
    # _rewrite_libm_stable_forms substitutes sympy.codegen.cfunctions'
    # `log1p`/`expm1` nodes for the near-cancellation forms they replace,
    # and `asinh`/`atanh` come straight from sympy.functions.
    # For log1p and atanh the rename is a difference in behaviour and not
    # only in spelling: Libxc's are the C library functions, which return
    # NaN outside their domain, while Julia's Base throws a DomainError
    # there, and a kernel that throws where Libxc returns a number is a
    # different function. expm1 and asinh are total, and are renamed only
    # so that generated code reaches every Libxc name the same way.
    'log1p': 'xc_log1p',
    'expm1': 'xc_expm1',
    'asinh': 'xc_asinh',
    'atanh': 'xc_atanh',
    # The same stability pass emits hypot, whose Julia name is its own.
    'hypot': 'hypot',
    # Libxc's own names, defined in src/libxc_names.jl.
    'atan2': 'atan2',
    'BesselI': 'BesselI',
    'LambertW': 'LambertW',
    'br89_x': 'br89_x',
    'mbrxc_x': 'mbrxc_x',
    'my_piecewise3': 'my_piecewise3',
    'my_piecewise5': 'my_piecewise5',
    'xc_E1_scaled': 'xc_E1_scaled',
    # Upstream writes e1_scaled_G as a plain Python function, so the
    # expression reaches the printer with its sixteen-term series already
    # inlined as factorial(k)/y^k. generate.jl replaces it with a SymPy
    # Function of the same name so that the call survives to here and the
    # series is evaluated by src/libxc_names.jl, in a grouping that does
    # not overflow when the expression is differentiated at run time.
    'e1_scaled_G': 'xc_e1_scaled_G',
    'xc_asinh': 'xc_asinh',
    'xc_atanh': 'xc_atanh',
    'xc_dilogarithm': 'xc_dilogarithm',
    'xc_expm1': 'xc_expm1',
    'xc_log1p': 'xc_log1p',
    'xc_x_minus_log1p': 'xc_x_minus_log1p',
}


class ScalarJuliaPrinter(JuliaCodePrinter):
    """``JuliaCodePrinter`` for scalar kernels, with NaNMath powers."""

    # Julia parses an integer literal wider than Int128 as a BigInt, which
    # would make the kernel neither fast nor type-stable, so a constant that
    # wide is rounded to a Float64 -- once, from the exact value. That is
    # what the C output does with it too: no integer in Libxc's generated C
    # is wider than a double can hold (gga_c_lm, whose 24-term series in
    # lda_c_hl reaches 47 digits, comes out as plain decimals there).
    # Everything up to Int128 stays exact: `29393 //
    # 113267782428181659648` parses as a `Rational{Int128}`, which Julia
    # multiplies into a Float64 expression as a Float64.
    _INT128_MAX = 2 ** 127 - 1

    def _too_wide(self, *integers):
        return any(abs(int(i)) > self._INT128_MAX for i in integers)

    def _print_float_of(self, expr):
        value = float(expr)
        if not math.isfinite(value):
            raise PrintMethodNotImplementedError(
                'the constant %s is too wide for an Int128 and does not fit '
                'a Float64 either' % expr)
        return repr(value)

    def _print_Integer(self, expr):
        if self._too_wide(expr.p):
            return self._print_float_of(expr)
        return super()._print_Integer(expr)

    def _print_Rational(self, expr):
        if self._too_wide(expr.p, expr.q):
            return self._print_float_of(expr)
        return super()._print_Rational(expr)

    def _print_Mul(self, expr):
        return super()._print_Mul(expr).replace('.*', '*').replace('./', '/')

    def _print_Pow(self, expr):
        base, exp = expr.base, expr.exp
        # A power of numbers that SymPy left unevaluated because its value
        # is irrational (6**(1/3), pi**(1/3)) is folded to the Float64 it
        # rounds to, once, here -- rather than left as a `pow` call the
        # kernel would make on every evaluation. An exact rational is not
        # folded: SymPy evaluates those itself, and `3 // 8` is both exact
        # and free.
        if expr.is_number and not expr.is_rational:
            # `is_number` (no free symbols), not `is_Number` (an instance of
            # SymPy's Number): 6**(1/3) is a Pow, not a Number, which is
            # exactly the case this is for. A complex value cannot be folded
            # into a Float64 and is left to the printing below.
            try:
                folded = float(expr)
            except TypeError:
                folded = None
            # repr() of an infinity or a NaN is not Julia syntax, so a
            # power that overflows a Float64 is left as a call rather than
            # written into the kernel as `inf`.
            if folded is not None and math.isfinite(folded):
                return repr(folded)
        # An integer exponent goes to Julia's `^`: it is defined for a
        # negative base, and a literal integer power is the faster path.
        if exp.is_Integer:
            b = self.parenthesize(base, precedence(expr))
            e = int(exp)
            return '%s ^ %s' % (b, e if e >= 0 else '(%d)' % e)
        # A half-integer power is the square root the expression was built
        # from; Pow(x, 1/2) is how SymPy stores `sqrt(x)`.
        if exp == sp.Rational(1, 2):
            return 'NaNMath.sqrt(%s)' % self._print(base)
        if exp == sp.Rational(-1, 2):
            return '1 / NaNMath.sqrt(%s)' % self._print(base)
        # Everything else: NaNMath.pow, which returns NaN where Julia's `^`
        # would throw for a negative base.  A numeric exponent is printed as
        # the Float64 it is evaluated at anyway, which is also what the
        # round trip produced.
        if exp.is_Number:
            e = repr(float(exp))
        else:
            e = self._print(exp)
        return 'NaNMath.pow(%s, %s)' % (self._print(base), e)


def printer_for(expr):
    """A printer that knows exactly the function names ``expr`` contains.

    The keys have to come from the expression rather than from a guess at
    what it holds: an expression carries ``xc_log1p``, not ``log1p``, so a
    map keyed on the Julia/Base spelling silently covers nothing.  An
    unlisted name raises here, at generation time, instead of reaching a
    kernel that would fail with ``UndefVarError`` when first called.
    """
    names = sorted({a.func.__name__ for a in expr.atoms(sp.Function)})
    unknown = [n for n in names if n not in JULIA_NAMES]
    if unknown:
        raise PrintMethodNotImplementedError(
            'no Julia name for %s; add it to JULIA_NAMES in '
            'gen/julia_printer.py and define it in src/libxc_names.jl'
            % ', '.join(unknown))
    user_functions = {n: JULIA_NAMES[n] for n in names}
    return ScalarJuliaPrinter({'user_functions': user_functions})


def print_julia(expr):
    """``expr`` as one Julia expression."""
    return printer_for(expr).doprint(expr)
