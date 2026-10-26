# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

# The functionals upstream changed after the 7.0.0 that Libxc.jl vendors.
#
# For these the vendored library is the one out of date, so the suite does
# not compare against it: they are checked against the pinned build in
# testsets of their own, and a mix that holds one of them inherits the
# difference exactly as it inherits a component's tolerance tier, which is
# why the mix sweep derives its exclusions from this list rather than
# carrying a second one.
#
# What puts a name here is a measurement, not a reading of the ChangeLog.
# Asking the two libraries the same question at rho in (0.05, 0.5, 5.0)
# separates the two things that look alike from inside the suite:
#
#   * the pinned 7.1.2 and the vendored 7.0.0 disagree, and this package
#     agrees with the pinned one -- upstream changed the functional; or
#   * the two libraries agree and this package does not -- the translation
#     is the odd one out, and the name does not belong here at all.
#
# Measured on 2026-10-15, the first column being the pinned library against
# the vendored one and the second this package against the pinned one:
#
#   gga_c_wi              18.2       1.4e-16
#   gga_c_sg4             3.1e-3     4.4e-16
#   mgga_c_rregtm         0.355      5.4e-16
#   mgga_xc_lp90          4.7e-2     0.0
#   gga_x_hjs_b97x        1.1e-6     2.8e-15
#   mgga_xc_otpss_d       2.4e-3     2.5e-15
#   gga_x_wpbeh           5.6e-9     2.7e-15
#   lda_c_1d_loos         0.889      7.5e-15
#   hyb_mgga_xc_x1b95     1.38       2.5e-15
#   hyb_mgga_xc_xb1k      0.419      2.4e-15
#   hyb_mgga_xc_b0kcis    0.109      2.4e-15
#
# All eleven come out the same way, and none of them the other way, so every
# exclusion in this list is one the measurement earns.
#
# The ChangeLog entry, where there is one, is named beside the functional
# below. Two of these have none: `mgga_c_rregtm` and `gga_x_hjs_b97x` were
# carried here as "7.1.0 Fixed", and the 7.1.0 "Fixed" section does not name
# either of them -- the measurement above is their whole justification, and
# it is the stronger half of what the other entries have anyway.
#
# The list is re-derived from the two libraries where both can be called, so
# an update to the pinned sources that corrects another functional, or that
# releases one of these, fails there rather than being noticed by hand.
const CORRECTED_AFTER_7_0_0 = (
    "gga_c_wi",         # typos in parameter values (#549, !677)
    "gga_c_sg4",        # mu^MGE2 became 0.26 (#584)
    "mgga_c_rregtm",    # measured only; the ChangeLog does not name it
    "mgga_xc_lp90",     # measured only; its 7.1.0 entry is "comment fix"
    "gga_x_hjs_b97x",   # measured only; the ChangeLog does not name it
    "mgga_xc_otpss_d",  # correlation parameters corrected to match the erratum (#587, !721)
    # The low-gradient interpolation switch now uses exact
    # Ernzerhof-Gustavsson constants, fixing inconsistent HSE06 molecular
    # gradients (#627, !806). One line above GGA_C_WI in the same section.
    "gga_x_wpbeh",
    # Corrected coefficients (#577, !751). The vendored library computes a
    # different function here -- by a factor of four, outside the range the
    # kernel takes at all -- so the only oracle it can be held against is
    # the upstream source.
    "lda_c_1d_loos",
    # Corrected the a1 coefficient and the DFT exchange prefactor
    # (#618, !785). Named in the ChangeLog as "XB1K and X1B95", without the
    # family prefix, so a search for the full identifiers does not find
    # them.
    "hyb_mgga_xc_x1b95",
    "hyb_mgga_xc_xb1k",
    # No longer double-counts correlation: the mix functional was also
    # invoking the meta-GGA kernel (#622, !796). Named in the ChangeLog
    # without the family prefix as well.
    "hyb_mgga_xc_b0kcis",
)
