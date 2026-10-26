# Auto-generated from the Libxc sources
# -- do not edit by hand.
#
# Libxc evaluates these by mixing others rather than from a kernel of
# their own, and the recipe -- which functionals, with which
# coefficients -- is read from the pinned library at generation time
# and written out here. Only the ones whose every component this
# package already has, and which reproduce the library's own energy
# density at three densities, are written; manifest.toml records which.
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

const gga_x_kgg99_components = (
    (-0.05050908122584938, :lda_x, NamedTuple()),
    (1.0, :gga_x_gg99, NamedTuple()),
)
const gga_x_kgg99_defaults = NamedTuple()
const gga_x_kgg99_required = ()

function gga_x_kgg99(rho, sigma)
    return -0.05050908122584938 * lda_x(rho) +
           1.0 * gga_x_gg99(rho, sigma)
end

function gga_x_kgg99(na, nb, gaa, gab, gbb)
    return -0.05050908122584938 * lda_x(na, nb) +
           1.0 * gga_x_gg99(na, nb, gaa, gab, gbb)
end

export gga_x_kgg99, gga_x_kgg99_components, gga_x_kgg99_defaults, gga_x_kgg99_required

const gga_x_optpbe_vdw_components = (
    (0.945268, :gga_x_pbe, (; params_a_kappa = 1.04804, params_a_mu = 0.175519)),
    (0.054732, :gga_x_rpbe, (; params_a_rpbe_kappa = 1.04804, params_a_rpbe_mu = 0.175519)),
)
const gga_x_optpbe_vdw_defaults = NamedTuple()
const gga_x_optpbe_vdw_required = ()

function gga_x_optpbe_vdw(rho, sigma)
    return 0.945268 * gga_x_pbe(rho, sigma; params = (; params_a_kappa = 1.04804, params_a_mu = 0.175519)) +
           0.054732 * gga_x_rpbe(rho, sigma; params = (; params_a_rpbe_kappa = 1.04804, params_a_rpbe_mu = 0.175519))
end

function gga_x_optpbe_vdw(na, nb, gaa, gab, gbb)
    return 0.945268 * gga_x_pbe(na, nb, gaa, gab, gbb; params = (; params_a_kappa = 1.04804, params_a_mu = 0.175519)) +
           0.054732 * gga_x_rpbe(na, nb, gaa, gab, gbb; params = (; params_a_rpbe_kappa = 1.04804, params_a_rpbe_mu = 0.175519))
end

export gga_x_optpbe_vdw, gga_x_optpbe_vdw_components, gga_x_optpbe_vdw_defaults, gga_x_optpbe_vdw_required

const gga_x_revssb_d_components = (
    (-1.0, :lda_x, NamedTuple()),
    (1.0, :gga_x_ssb_sw, (; params_a_A = 1.082138, params_a_B = 0.177998, params_a_C = 0.246582, params_a_D = 0.288030667664, params_a_E = 6.284673)),
    (1.0, :gga_x_kt1, (; params_a_gamma = -0.0016848298296575988)),
)
const gga_x_revssb_d_defaults = NamedTuple()
const gga_x_revssb_d_required = ()

function gga_x_revssb_d(rho, sigma)
    return -1.0 * lda_x(rho) +
           1.0 * gga_x_ssb_sw(rho, sigma; params = (; params_a_A = 1.082138, params_a_B = 0.177998, params_a_C = 0.246582, params_a_D = 0.288030667664, params_a_E = 6.284673)) +
           1.0 * gga_x_kt1(rho, sigma; params = (; params_a_gamma = -0.0016848298296575988))
end

function gga_x_revssb_d(na, nb, gaa, gab, gbb)
    return -1.0 * lda_x(na, nb) +
           1.0 * gga_x_ssb_sw(na, nb, gaa, gab, gbb; params = (; params_a_A = 1.082138, params_a_B = 0.177998, params_a_C = 0.246582, params_a_D = 0.288030667664, params_a_E = 6.284673)) +
           1.0 * gga_x_kt1(na, nb, gaa, gab, gbb; params = (; params_a_gamma = -0.0016848298296575988))
end

export gga_x_revssb_d, gga_x_revssb_d_components, gga_x_revssb_d_defaults, gga_x_revssb_d_required

const gga_x_sogga_components = (
    (0.5, :gga_x_pbe, (; params_a_kappa = 0.552, params_a_mu = 0.12345679012345678)),
    (0.5, :gga_x_rpbe, (; params_a_rpbe_kappa = 0.552, params_a_rpbe_mu = 0.12345679012345678)),
)
const gga_x_sogga_defaults = NamedTuple()
const gga_x_sogga_required = ()

function gga_x_sogga(rho, sigma)
    return 0.5 * gga_x_pbe(rho, sigma; params = (; params_a_kappa = 0.552, params_a_mu = 0.12345679012345678)) +
           0.5 * gga_x_rpbe(rho, sigma; params = (; params_a_rpbe_kappa = 0.552, params_a_rpbe_mu = 0.12345679012345678))
end

function gga_x_sogga(na, nb, gaa, gab, gbb)
    return 0.5 * gga_x_pbe(na, nb, gaa, gab, gbb; params = (; params_a_kappa = 0.552, params_a_mu = 0.12345679012345678)) +
           0.5 * gga_x_rpbe(na, nb, gaa, gab, gbb; params = (; params_a_rpbe_kappa = 0.552, params_a_rpbe_mu = 0.12345679012345678))
end

export gga_x_sogga, gga_x_sogga_components, gga_x_sogga_defaults, gga_x_sogga_required

const gga_x_ssb_components = (
    (-1.0, :lda_x, NamedTuple()),
    (1.0, :gga_x_ssb_sw, (; params_a_A = 1.071769, params_a_B = 0.137574, params_a_C = 0.187883, params_a_D = 0.303439130082, params_a_E = 6.635315)),
    (1.0, :gga_x_kt1, (; params_a_gamma = -0.0025270680672958333)),
)
const gga_x_ssb_defaults = NamedTuple()
const gga_x_ssb_required = ()

function gga_x_ssb(rho, sigma)
    return -1.0 * lda_x(rho) +
           1.0 * gga_x_ssb_sw(rho, sigma; params = (; params_a_A = 1.071769, params_a_B = 0.137574, params_a_C = 0.187883, params_a_D = 0.303439130082, params_a_E = 6.635315)) +
           1.0 * gga_x_kt1(rho, sigma; params = (; params_a_gamma = -0.0025270680672958333))
end

function gga_x_ssb(na, nb, gaa, gab, gbb)
    return -1.0 * lda_x(na, nb) +
           1.0 * gga_x_ssb_sw(na, nb, gaa, gab, gbb; params = (; params_a_A = 1.071769, params_a_B = 0.137574, params_a_C = 0.187883, params_a_D = 0.303439130082, params_a_E = 6.635315)) +
           1.0 * gga_x_kt1(na, nb, gaa, gab, gbb; params = (; params_a_gamma = -0.0025270680672958333))
end

export gga_x_ssb, gga_x_ssb_components, gga_x_ssb_defaults, gga_x_ssb_required

const gga_x_ssb_d_components = (
    (-1.0, :lda_x, NamedTuple()),
    (1.0, :gga_x_ssb_sw, (; params_a_A = 1.079966, params_a_B = 0.197465, params_a_C = 0.272729, params_a_D = 0.34555190210000003, params_a_E = 5.873645)),
    (1.0, :gga_x_kt1, (; params_a_gamma = -0.0021529826454022107)),
)
const gga_x_ssb_d_defaults = NamedTuple()
const gga_x_ssb_d_required = ()

function gga_x_ssb_d(rho, sigma)
    return -1.0 * lda_x(rho) +
           1.0 * gga_x_ssb_sw(rho, sigma; params = (; params_a_A = 1.079966, params_a_B = 0.197465, params_a_C = 0.272729, params_a_D = 0.34555190210000003, params_a_E = 5.873645)) +
           1.0 * gga_x_kt1(rho, sigma; params = (; params_a_gamma = -0.0021529826454022107))
end

function gga_x_ssb_d(na, nb, gaa, gab, gbb)
    return -1.0 * lda_x(na, nb) +
           1.0 * gga_x_ssb_sw(na, nb, gaa, gab, gbb; params = (; params_a_A = 1.079966, params_a_B = 0.197465, params_a_C = 0.272729, params_a_D = 0.34555190210000003, params_a_E = 5.873645)) +
           1.0 * gga_x_kt1(na, nb, gaa, gab, gbb; params = (; params_a_gamma = -0.0021529826454022107))
end

export gga_x_ssb_d, gga_x_ssb_d_components, gga_x_ssb_d_defaults, gga_x_ssb_d_required

const gga_xc_beefvdw_components = (
    (1.0, :gga_x_beefvdw, NamedTuple()),
    (0.6001664769, :lda_c_pw_mod, NamedTuple()),
    (0.3998335231, :gga_c_pbe, NamedTuple()),
)
const gga_xc_beefvdw_defaults = NamedTuple()
const gga_xc_beefvdw_required = ()

function gga_xc_beefvdw(rho, sigma)
    return 1.0 * gga_x_beefvdw(rho, sigma) +
           0.6001664769 * lda_c_pw_mod(rho) +
           0.3998335231 * gga_c_pbe(rho, sigma)
end

function gga_xc_beefvdw(na, nb, gaa, gab, gbb)
    return 1.0 * gga_x_beefvdw(na, nb, gaa, gab, gbb) +
           0.6001664769 * lda_c_pw_mod(na, nb) +
           0.3998335231 * gga_c_pbe(na, nb, gaa, gab, gbb)
end

export gga_xc_beefvdw, gga_xc_beefvdw_components, gga_xc_beefvdw_defaults, gga_xc_beefvdw_required

const gga_xc_edf1_components = (
    (-0.9228179999999995, :lda_x, NamedTuple()),
    (10.4017, :gga_x_b88, (; params_a_beta = 0.0035)),
    (-8.44793, :gga_x_b88, NamedTuple()),
    (1.0, :gga_c_lyp, (; params_a_a = 0.055, params_a_b = 0.158, params_a_c = 0.25, params_a_d = 0.3505)),
)
const gga_xc_edf1_defaults = NamedTuple()
const gga_xc_edf1_required = ()

function gga_xc_edf1(rho, sigma)
    return -0.9228179999999995 * lda_x(rho) +
           10.4017 * gga_x_b88(rho, sigma; params = (; params_a_beta = 0.0035)) +
           -8.44793 * gga_x_b88(rho, sigma) +
           1.0 * gga_c_lyp(rho, sigma; params = (; params_a_a = 0.055, params_a_b = 0.158, params_a_c = 0.25, params_a_d = 0.3505))
end

function gga_xc_edf1(na, nb, gaa, gab, gbb)
    return -0.9228179999999995 * lda_x(na, nb) +
           10.4017 * gga_x_b88(na, nb, gaa, gab, gbb; params = (; params_a_beta = 0.0035)) +
           -8.44793 * gga_x_b88(na, nb, gaa, gab, gbb) +
           1.0 * gga_c_lyp(na, nb, gaa, gab, gbb; params = (; params_a_a = 0.055, params_a_b = 0.158, params_a_c = 0.25, params_a_d = 0.3505))
end

export gga_xc_edf1, gga_xc_edf1_components, gga_xc_edf1_defaults, gga_xc_edf1_required

const gga_xc_kt1_components = (
    (1.0, :gga_x_kt1, NamedTuple()),
    (1.0, :lda_c_vwn, NamedTuple()),
)
const gga_xc_kt1_defaults = NamedTuple()
const gga_xc_kt1_required = ()

function gga_xc_kt1(rho, sigma)
    return 1.0 * gga_x_kt1(rho, sigma) +
           1.0 * lda_c_vwn(rho)
end

function gga_xc_kt1(na, nb, gaa, gab, gbb)
    return 1.0 * gga_x_kt1(na, nb, gaa, gab, gbb) +
           1.0 * lda_c_vwn(na, nb)
end

export gga_xc_kt1, gga_xc_kt1_components, gga_xc_kt1_defaults, gga_xc_kt1_required

const gga_xc_kt2_components = (
    (0.07173000000000007, :lda_x, NamedTuple()),
    (1.0, :gga_x_kt1, NamedTuple()),
    (0.576727, :lda_c_vwn, NamedTuple()),
)
const gga_xc_kt2_defaults = NamedTuple()
const gga_xc_kt2_required = ()

function gga_xc_kt2(rho, sigma)
    return 0.07173000000000007 * lda_x(rho) +
           1.0 * gga_x_kt1(rho, sigma) +
           0.576727 * lda_c_vwn(rho)
end

function gga_xc_kt2(na, nb, gaa, gab, gbb)
    return 0.07173000000000007 * lda_x(na, nb) +
           1.0 * gga_x_kt1(na, nb, gaa, gab, gbb) +
           0.576727 * lda_c_vwn(na, nb)
end

export gga_xc_kt2, gga_xc_kt2_components, gga_xc_kt2_defaults, gga_xc_kt2_required

const gga_xc_kt3_components = (
    (-0.5877016340967667, :lda_x, NamedTuple()),
    (0.864409, :gga_c_lyp, NamedTuple()),
    (1.0, :gga_x_kt1, (; params_a_gamma = -0.004)),
    (0.6464052972361336, :gga_x_optx, NamedTuple()),
)
const gga_xc_kt3_defaults = NamedTuple()
const gga_xc_kt3_required = ()

function gga_xc_kt3(rho, sigma)
    return -0.5877016340967667 * lda_x(rho) +
           0.864409 * gga_c_lyp(rho, sigma) +
           1.0 * gga_x_kt1(rho, sigma; params = (; params_a_gamma = -0.004)) +
           0.6464052972361336 * gga_x_optx(rho, sigma)
end

function gga_xc_kt3(na, nb, gaa, gab, gbb)
    return -0.5877016340967667 * lda_x(na, nb) +
           0.864409 * gga_c_lyp(na, nb, gaa, gab, gbb) +
           1.0 * gga_x_kt1(na, nb, gaa, gab, gbb; params = (; params_a_gamma = -0.004)) +
           0.6464052972361336 * gga_x_optx(na, nb, gaa, gab, gbb)
end

export gga_xc_kt3, gga_xc_kt3_components, gga_xc_kt3_defaults, gga_xc_kt3_required

const gga_xc_mohlyp_components = (
    (1.0, :gga_x_optx, (; params_a_a = 1.0, params_a_b = 1.3884624030595192)),
    (0.5, :lda_c_vwn, NamedTuple()),
    (0.5, :gga_c_lyp, NamedTuple()),
)
const gga_xc_mohlyp_defaults = NamedTuple()
const gga_xc_mohlyp_required = ()

function gga_xc_mohlyp(rho, sigma)
    return 1.0 * gga_x_optx(rho, sigma; params = (; params_a_a = 1.0, params_a_b = 1.3884624030595192)) +
           0.5 * lda_c_vwn(rho) +
           0.5 * gga_c_lyp(rho, sigma)
end

function gga_xc_mohlyp(na, nb, gaa, gab, gbb)
    return 1.0 * gga_x_optx(na, nb, gaa, gab, gbb; params = (; params_a_a = 1.0, params_a_b = 1.3884624030595192)) +
           0.5 * lda_c_vwn(na, nb) +
           0.5 * gga_c_lyp(na, nb, gaa, gab, gbb)
end

export gga_xc_mohlyp, gga_xc_mohlyp_components, gga_xc_mohlyp_defaults, gga_xc_mohlyp_required

const gga_xc_mohlyp2_components = (
    (1.0, :gga_x_optx, (; params_a_b = 1.9878616224603134)),
    (0.5, :gga_c_lyp, NamedTuple()),
)
const gga_xc_mohlyp2_defaults = NamedTuple()
const gga_xc_mohlyp2_required = ()

function gga_xc_mohlyp2(rho, sigma)
    return 1.0 * gga_x_optx(rho, sigma; params = (; params_a_b = 1.9878616224603134)) +
           0.5 * gga_c_lyp(rho, sigma)
end

function gga_xc_mohlyp2(na, nb, gaa, gab, gbb)
    return 1.0 * gga_x_optx(na, nb, gaa, gab, gbb; params = (; params_a_b = 1.9878616224603134)) +
           0.5 * gga_c_lyp(na, nb, gaa, gab, gbb)
end

export gga_xc_mohlyp2, gga_xc_mohlyp2_components, gga_xc_mohlyp2_defaults, gga_xc_mohlyp2_required

const gga_xc_mpwlyp1w_components = (
    (0.12, :lda_c_vwn, NamedTuple()),
    (1.0, :gga_x_mpw91, NamedTuple()),
    (0.88, :gga_c_lyp, NamedTuple()),
)
const gga_xc_mpwlyp1w_defaults = NamedTuple()
const gga_xc_mpwlyp1w_required = ()

function gga_xc_mpwlyp1w(rho, sigma)
    return 0.12 * lda_c_vwn(rho) +
           1.0 * gga_x_mpw91(rho, sigma) +
           0.88 * gga_c_lyp(rho, sigma)
end

function gga_xc_mpwlyp1w(na, nb, gaa, gab, gbb)
    return 0.12 * lda_c_vwn(na, nb) +
           1.0 * gga_x_mpw91(na, nb, gaa, gab, gbb) +
           0.88 * gga_c_lyp(na, nb, gaa, gab, gbb)
end

export gga_xc_mpwlyp1w, gga_xc_mpwlyp1w_components, gga_xc_mpwlyp1w_defaults, gga_xc_mpwlyp1w_required

const gga_xc_ncap_components = (
    (1.0, :gga_x_ncap, NamedTuple()),
    (1.0, :gga_c_p86, NamedTuple()),
)
const gga_xc_ncap_defaults = NamedTuple()
const gga_xc_ncap_required = ()

function gga_xc_ncap(rho, sigma)
    return 1.0 * gga_x_ncap(rho, sigma) +
           1.0 * gga_c_p86(rho, sigma)
end

function gga_xc_ncap(na, nb, gaa, gab, gbb)
    return 1.0 * gga_x_ncap(na, nb, gaa, gab, gbb) +
           1.0 * gga_c_p86(na, nb, gaa, gab, gbb)
end

export gga_xc_ncap, gga_xc_ncap_components, gga_xc_ncap_defaults, gga_xc_ncap_required

const gga_xc_oblyp_d_components = (
    (1.0, :gga_x_b88, (; params_a_beta = 0.00401)),
    (1.0, :gga_c_lyp, (; params_a_a = 0.05047, params_a_b = 0.14, params_a_c = 0.2196, params_a_d = 0.363)),
)
const gga_xc_oblyp_d_defaults = NamedTuple()
const gga_xc_oblyp_d_required = ()

function gga_xc_oblyp_d(rho, sigma)
    return 1.0 * gga_x_b88(rho, sigma; params = (; params_a_beta = 0.00401)) +
           1.0 * gga_c_lyp(rho, sigma; params = (; params_a_a = 0.05047, params_a_b = 0.14, params_a_c = 0.2196, params_a_d = 0.363))
end

function gga_xc_oblyp_d(na, nb, gaa, gab, gbb)
    return 1.0 * gga_x_b88(na, nb, gaa, gab, gbb; params = (; params_a_beta = 0.00401)) +
           1.0 * gga_c_lyp(na, nb, gaa, gab, gbb; params = (; params_a_a = 0.05047, params_a_b = 0.14, params_a_c = 0.2196, params_a_d = 0.363))
end

export gga_xc_oblyp_d, gga_xc_oblyp_d_components, gga_xc_oblyp_d_defaults, gga_xc_oblyp_d_required

const gga_xc_opbe_d_components = (
    (1.0, :gga_x_pbe, (; params_a_kappa = 1.201, params_a_mu = 0.21198)),
    (1.0, :gga_c_pbe, (; params_a_beta = 0.04636)),
)
const gga_xc_opbe_d_defaults = NamedTuple()
const gga_xc_opbe_d_required = ()

function gga_xc_opbe_d(rho, sigma)
    return 1.0 * gga_x_pbe(rho, sigma; params = (; params_a_kappa = 1.201, params_a_mu = 0.21198)) +
           1.0 * gga_c_pbe(rho, sigma; params = (; params_a_beta = 0.04636))
end

function gga_xc_opbe_d(na, nb, gaa, gab, gbb)
    return 1.0 * gga_x_pbe(na, nb, gaa, gab, gbb; params = (; params_a_kappa = 1.201, params_a_mu = 0.21198)) +
           1.0 * gga_c_pbe(na, nb, gaa, gab, gbb; params = (; params_a_beta = 0.04636))
end

export gga_xc_opbe_d, gga_xc_opbe_d_components, gga_xc_opbe_d_defaults, gga_xc_opbe_d_required

const gga_xc_opwlyp_d_components = (
    (1.0, :gga_x_mpw91, (; params_a_a = 0.18802876680812916, params_a_alpha = 54.049429419522305, params_a_c = 0.2625376855413186, params_a_d = -0.1390808954178619, params_a_expo = 0.79, params_a_f = 5.44290477351557e-6)),
    (1.0, :gga_c_lyp, (; params_a_a = 0.0496, params_a_b = 0.144, params_a_c = 0.2262, params_a_d = 0.346)),
)
const gga_xc_opwlyp_d_defaults = NamedTuple()
const gga_xc_opwlyp_d_required = ()

function gga_xc_opwlyp_d(rho, sigma)
    return 1.0 * gga_x_mpw91(rho, sigma; params = (; params_a_a = 0.18802876680812916, params_a_alpha = 54.049429419522305, params_a_c = 0.2625376855413186, params_a_d = -0.1390808954178619, params_a_expo = 0.79, params_a_f = 5.44290477351557e-6)) +
           1.0 * gga_c_lyp(rho, sigma; params = (; params_a_a = 0.0496, params_a_b = 0.144, params_a_c = 0.2262, params_a_d = 0.346))
end

function gga_xc_opwlyp_d(na, nb, gaa, gab, gbb)
    return 1.0 * gga_x_mpw91(na, nb, gaa, gab, gbb; params = (; params_a_a = 0.18802876680812916, params_a_alpha = 54.049429419522305, params_a_c = 0.2625376855413186, params_a_d = -0.1390808954178619, params_a_expo = 0.79, params_a_f = 5.44290477351557e-6)) +
           1.0 * gga_c_lyp(na, nb, gaa, gab, gbb; params = (; params_a_a = 0.0496, params_a_b = 0.144, params_a_c = 0.2262, params_a_d = 0.346))
end

export gga_xc_opwlyp_d, gga_xc_opwlyp_d_components, gga_xc_opwlyp_d_defaults, gga_xc_opwlyp_d_required

const gga_xc_pbe1w_components = (
    (0.26, :lda_c_vwn, NamedTuple()),
    (1.0, :gga_x_pbe, NamedTuple()),
    (0.74, :gga_c_pbe, NamedTuple()),
)
const gga_xc_pbe1w_defaults = NamedTuple()
const gga_xc_pbe1w_required = ()

function gga_xc_pbe1w(rho, sigma)
    return 0.26 * lda_c_vwn(rho) +
           1.0 * gga_x_pbe(rho, sigma) +
           0.74 * gga_c_pbe(rho, sigma)
end

function gga_xc_pbe1w(na, nb, gaa, gab, gbb)
    return 0.26 * lda_c_vwn(na, nb) +
           1.0 * gga_x_pbe(na, nb, gaa, gab, gbb) +
           0.74 * gga_c_pbe(na, nb, gaa, gab, gbb)
end

export gga_xc_pbe1w, gga_xc_pbe1w_components, gga_xc_pbe1w_defaults, gga_xc_pbe1w_required

const gga_xc_pbelyp1w_components = (
    (0.26, :lda_c_vwn, NamedTuple()),
    (1.0, :gga_x_pbe, NamedTuple()),
    (0.74, :gga_c_lyp, NamedTuple()),
)
const gga_xc_pbelyp1w_defaults = NamedTuple()
const gga_xc_pbelyp1w_required = ()

function gga_xc_pbelyp1w(rho, sigma)
    return 0.26 * lda_c_vwn(rho) +
           1.0 * gga_x_pbe(rho, sigma) +
           0.74 * gga_c_lyp(rho, sigma)
end

function gga_xc_pbelyp1w(na, nb, gaa, gab, gbb)
    return 0.26 * lda_c_vwn(na, nb) +
           1.0 * gga_x_pbe(na, nb, gaa, gab, gbb) +
           0.74 * gga_c_lyp(na, nb, gaa, gab, gbb)
end

export gga_xc_pbelyp1w, gga_xc_pbelyp1w_components, gga_xc_pbelyp1w_defaults, gga_xc_pbelyp1w_required

const gga_xc_vv10_components = (
    (1.0, :gga_x_rpw86, NamedTuple()),
    (1.0, :gga_c_pbe, NamedTuple()),
)
const gga_xc_vv10_defaults = NamedTuple()
const gga_xc_vv10_required = ()

function gga_xc_vv10(rho, sigma)
    return 1.0 * gga_x_rpw86(rho, sigma) +
           1.0 * gga_c_pbe(rho, sigma)
end

function gga_xc_vv10(na, nb, gaa, gab, gbb)
    return 1.0 * gga_x_rpw86(na, nb, gaa, gab, gbb) +
           1.0 * gga_c_pbe(na, nb, gaa, gab, gbb)
end

export gga_xc_vv10, gga_xc_vv10_components, gga_xc_vv10_defaults, gga_xc_vv10_required

const gga_xc_xlyp_components = (
    (-0.06899999999999995, :lda_x, NamedTuple()),
    (0.722, :gga_x_b88, NamedTuple()),
    (0.347, :gga_x_pw91, NamedTuple()),
    (1.0, :gga_c_lyp, NamedTuple()),
)
const gga_xc_xlyp_defaults = NamedTuple()
const gga_xc_xlyp_required = ()

function gga_xc_xlyp(rho, sigma)
    return -0.06899999999999995 * lda_x(rho) +
           0.722 * gga_x_b88(rho, sigma) +
           0.347 * gga_x_pw91(rho, sigma) +
           1.0 * gga_c_lyp(rho, sigma)
end

function gga_xc_xlyp(na, nb, gaa, gab, gbb)
    return -0.06899999999999995 * lda_x(na, nb) +
           0.722 * gga_x_b88(na, nb, gaa, gab, gbb) +
           0.347 * gga_x_pw91(na, nb, gaa, gab, gbb) +
           1.0 * gga_c_lyp(na, nb, gaa, gab, gbb)
end

export gga_xc_xlyp, gga_xc_xlyp_components, gga_xc_xlyp_defaults, gga_xc_xlyp_required

const hyb_gga_xc_apbe0_components = (
    (0.75, :gga_x_apbe, NamedTuple()),
    (1.0, :gga_c_apbe, NamedTuple()),
)
const hyb_gga_xc_apbe0_defaults = NamedTuple()
const hyb_gga_xc_apbe0_required = ()

function hyb_gga_xc_apbe0(rho, sigma)
    return 0.75 * gga_x_apbe(rho, sigma) +
           1.0 * gga_c_apbe(rho, sigma)
end

function hyb_gga_xc_apbe0(na, nb, gaa, gab, gbb)
    return 0.75 * gga_x_apbe(na, nb, gaa, gab, gbb) +
           1.0 * gga_c_apbe(na, nb, gaa, gab, gbb)
end

export hyb_gga_xc_apbe0, hyb_gga_xc_apbe0_components, hyb_gga_xc_apbe0_defaults, hyb_gga_xc_apbe0_required

const hyb_gga_xc_apf_components = (
    (0.03288000000000003, :lda_x, NamedTuple()),
    (0.29591999999999996, :gga_x_b88, NamedTuple()),
    (0.07808999999999998, :lda_c_pw, NamedTuple()),
    (0.33291, :gga_c_pw91, NamedTuple()),
    (0.44175, :gga_x_pbe, NamedTuple()),
    (0.589, :gga_c_pbe, NamedTuple()),
)
const hyb_gga_xc_apf_defaults = NamedTuple()
const hyb_gga_xc_apf_required = ()

function hyb_gga_xc_apf(rho, sigma)
    return 0.03288000000000003 * lda_x(rho) +
           0.29591999999999996 * gga_x_b88(rho, sigma) +
           0.07808999999999998 * lda_c_pw(rho) +
           0.33291 * gga_c_pw91(rho, sigma) +
           0.44175 * gga_x_pbe(rho, sigma) +
           0.589 * gga_c_pbe(rho, sigma)
end

function hyb_gga_xc_apf(na, nb, gaa, gab, gbb)
    return 0.03288000000000003 * lda_x(na, nb) +
           0.29591999999999996 * gga_x_b88(na, nb, gaa, gab, gbb) +
           0.07808999999999998 * lda_c_pw(na, nb) +
           0.33291 * gga_c_pw91(na, nb, gaa, gab, gbb) +
           0.44175 * gga_x_pbe(na, nb, gaa, gab, gbb) +
           0.589 * gga_c_pbe(na, nb, gaa, gab, gbb)
end

export hyb_gga_xc_apf, hyb_gga_xc_apf_components, hyb_gga_xc_apf_defaults, hyb_gga_xc_apf_required

const hyb_gga_xc_b1lyp_components = (
    (0.75, :gga_x_b88, NamedTuple()),
    (1.0, :gga_c_lyp, NamedTuple()),
)
const hyb_gga_xc_b1lyp_defaults = NamedTuple()
const hyb_gga_xc_b1lyp_required = ()

function hyb_gga_xc_b1lyp(rho, sigma)
    return 0.75 * gga_x_b88(rho, sigma) +
           1.0 * gga_c_lyp(rho, sigma)
end

function hyb_gga_xc_b1lyp(na, nb, gaa, gab, gbb)
    return 0.75 * gga_x_b88(na, nb, gaa, gab, gbb) +
           1.0 * gga_c_lyp(na, nb, gaa, gab, gbb)
end

export hyb_gga_xc_b1lyp, hyb_gga_xc_b1lyp_components, hyb_gga_xc_b1lyp_defaults, hyb_gga_xc_b1lyp_required

const hyb_gga_xc_b1pw91_components = (
    (0.75, :gga_x_b88, NamedTuple()),
    (1.0, :gga_c_pw91, NamedTuple()),
)
const hyb_gga_xc_b1pw91_defaults = NamedTuple()
const hyb_gga_xc_b1pw91_required = ()

function hyb_gga_xc_b1pw91(rho, sigma)
    return 0.75 * gga_x_b88(rho, sigma) +
           1.0 * gga_c_pw91(rho, sigma)
end

function hyb_gga_xc_b1pw91(na, nb, gaa, gab, gbb)
    return 0.75 * gga_x_b88(na, nb, gaa, gab, gbb) +
           1.0 * gga_c_pw91(na, nb, gaa, gab, gbb)
end

export hyb_gga_xc_b1pw91, hyb_gga_xc_b1pw91_components, hyb_gga_xc_b1pw91_defaults, hyb_gga_xc_b1pw91_required

const hyb_gga_xc_b1wc_components = (
    (0.84, :gga_x_wc, NamedTuple()),
    (1.0, :gga_c_pbe, NamedTuple()),
)
const hyb_gga_xc_b1wc_defaults = NamedTuple()
const hyb_gga_xc_b1wc_required = ()

function hyb_gga_xc_b1wc(rho, sigma)
    return 0.84 * gga_x_wc(rho, sigma) +
           1.0 * gga_c_pbe(rho, sigma)
end

function hyb_gga_xc_b1wc(na, nb, gaa, gab, gbb)
    return 0.84 * gga_x_wc(na, nb, gaa, gab, gbb) +
           1.0 * gga_c_pbe(na, nb, gaa, gab, gbb)
end

export hyb_gga_xc_b1wc, hyb_gga_xc_b1wc_components, hyb_gga_xc_b1wc_defaults, hyb_gga_xc_b1wc_required

const hyb_gga_xc_b3lyp_components = (
    (0.08000000000000007, :lda_x, NamedTuple()),
    (0.72, :gga_x_b88, NamedTuple()),
    (0.18999999999999995, :lda_c_vwn_rpa, NamedTuple()),
    (0.81, :gga_c_lyp, NamedTuple()),
)
const hyb_gga_xc_b3lyp_defaults = NamedTuple()
const hyb_gga_xc_b3lyp_required = ()

function hyb_gga_xc_b3lyp(rho, sigma)
    return 0.08000000000000007 * lda_x(rho) +
           0.72 * gga_x_b88(rho, sigma) +
           0.18999999999999995 * lda_c_vwn_rpa(rho) +
           0.81 * gga_c_lyp(rho, sigma)
end

function hyb_gga_xc_b3lyp(na, nb, gaa, gab, gbb)
    return 0.08000000000000007 * lda_x(na, nb) +
           0.72 * gga_x_b88(na, nb, gaa, gab, gbb) +
           0.18999999999999995 * lda_c_vwn_rpa(na, nb) +
           0.81 * gga_c_lyp(na, nb, gaa, gab, gbb)
end

export hyb_gga_xc_b3lyp, hyb_gga_xc_b3lyp_components, hyb_gga_xc_b3lyp_defaults, hyb_gga_xc_b3lyp_required

const hyb_gga_xc_b3lyp3_components = (
    (0.08000000000000007, :lda_x, NamedTuple()),
    (0.72, :gga_x_b88, NamedTuple()),
    (0.18999999999999995, :lda_c_vwn_3, NamedTuple()),
    (0.81, :gga_c_lyp, NamedTuple()),
)
const hyb_gga_xc_b3lyp3_defaults = NamedTuple()
const hyb_gga_xc_b3lyp3_required = ()

function hyb_gga_xc_b3lyp3(rho, sigma)
    return 0.08000000000000007 * lda_x(rho) +
           0.72 * gga_x_b88(rho, sigma) +
           0.18999999999999995 * lda_c_vwn_3(rho) +
           0.81 * gga_c_lyp(rho, sigma)
end

function hyb_gga_xc_b3lyp3(na, nb, gaa, gab, gbb)
    return 0.08000000000000007 * lda_x(na, nb) +
           0.72 * gga_x_b88(na, nb, gaa, gab, gbb) +
           0.18999999999999995 * lda_c_vwn_3(na, nb) +
           0.81 * gga_c_lyp(na, nb, gaa, gab, gbb)
end

export hyb_gga_xc_b3lyp3, hyb_gga_xc_b3lyp3_components, hyb_gga_xc_b3lyp3_defaults, hyb_gga_xc_b3lyp3_required

const hyb_gga_xc_b3lyp5_components = (
    (0.08000000000000007, :lda_x, NamedTuple()),
    (0.72, :gga_x_b88, NamedTuple()),
    (0.18999999999999995, :lda_c_vwn, NamedTuple()),
    (0.81, :gga_c_lyp, NamedTuple()),
)
const hyb_gga_xc_b3lyp5_defaults = NamedTuple()
const hyb_gga_xc_b3lyp5_required = ()

function hyb_gga_xc_b3lyp5(rho, sigma)
    return 0.08000000000000007 * lda_x(rho) +
           0.72 * gga_x_b88(rho, sigma) +
           0.18999999999999995 * lda_c_vwn(rho) +
           0.81 * gga_c_lyp(rho, sigma)
end

function hyb_gga_xc_b3lyp5(na, nb, gaa, gab, gbb)
    return 0.08000000000000007 * lda_x(na, nb) +
           0.72 * gga_x_b88(na, nb, gaa, gab, gbb) +
           0.18999999999999995 * lda_c_vwn(na, nb) +
           0.81 * gga_c_lyp(na, nb, gaa, gab, gbb)
end

export hyb_gga_xc_b3lyp5, hyb_gga_xc_b3lyp5_components, hyb_gga_xc_b3lyp5_defaults, hyb_gga_xc_b3lyp5_required

const hyb_gga_xc_b3lyp_mcm1_components = (
    (0.1319999999999999, :lda_x, NamedTuple()),
    (0.6709, :gga_x_b88, NamedTuple()),
    (-0.17790000000000006, :lda_c_vwn_rpa, NamedTuple()),
    (1.1383, :gga_c_lyp, NamedTuple()),
)
const hyb_gga_xc_b3lyp_mcm1_defaults = NamedTuple()
const hyb_gga_xc_b3lyp_mcm1_required = ()

function hyb_gga_xc_b3lyp_mcm1(rho, sigma)
    return 0.1319999999999999 * lda_x(rho) +
           0.6709 * gga_x_b88(rho, sigma) +
           -0.17790000000000006 * lda_c_vwn_rpa(rho) +
           1.1383 * gga_c_lyp(rho, sigma)
end

function hyb_gga_xc_b3lyp_mcm1(na, nb, gaa, gab, gbb)
    return 0.1319999999999999 * lda_x(na, nb) +
           0.6709 * gga_x_b88(na, nb, gaa, gab, gbb) +
           -0.17790000000000006 * lda_c_vwn_rpa(na, nb) +
           1.1383 * gga_c_lyp(na, nb, gaa, gab, gbb)
end

export hyb_gga_xc_b3lyp_mcm1, hyb_gga_xc_b3lyp_mcm1_components, hyb_gga_xc_b3lyp_mcm1_defaults, hyb_gga_xc_b3lyp_mcm1_required

const hyb_gga_xc_b3lyp_mcm2_components = (
    (0.07900000000000007, :lda_x, NamedTuple()),
    (0.729, :gga_x_b88, NamedTuple()),
    (0.016799999999999926, :lda_c_vwn_rpa, NamedTuple()),
    (0.9421, :gga_c_lyp, NamedTuple()),
)
const hyb_gga_xc_b3lyp_mcm2_defaults = NamedTuple()
const hyb_gga_xc_b3lyp_mcm2_required = ()

function hyb_gga_xc_b3lyp_mcm2(rho, sigma)
    return 0.07900000000000007 * lda_x(rho) +
           0.729 * gga_x_b88(rho, sigma) +
           0.016799999999999926 * lda_c_vwn_rpa(rho) +
           0.9421 * gga_c_lyp(rho, sigma)
end

function hyb_gga_xc_b3lyp_mcm2(na, nb, gaa, gab, gbb)
    return 0.07900000000000007 * lda_x(na, nb) +
           0.729 * gga_x_b88(na, nb, gaa, gab, gbb) +
           0.016799999999999926 * lda_c_vwn_rpa(na, nb) +
           0.9421 * gga_c_lyp(na, nb, gaa, gab, gbb)
end

export hyb_gga_xc_b3lyp_mcm2, hyb_gga_xc_b3lyp_mcm2_components, hyb_gga_xc_b3lyp_mcm2_defaults, hyb_gga_xc_b3lyp_mcm2_required

const hyb_gga_xc_b3lyps_components = (
    (0.13, :lda_x, NamedTuple()),
    (0.72, :gga_x_b88, NamedTuple()),
    (0.18999999999999995, :lda_c_vwn_rpa, NamedTuple()),
    (0.81, :gga_c_lyp, NamedTuple()),
)
const hyb_gga_xc_b3lyps_defaults = NamedTuple()
const hyb_gga_xc_b3lyps_required = ()

function hyb_gga_xc_b3lyps(rho, sigma)
    return 0.13 * lda_x(rho) +
           0.72 * gga_x_b88(rho, sigma) +
           0.18999999999999995 * lda_c_vwn_rpa(rho) +
           0.81 * gga_c_lyp(rho, sigma)
end

function hyb_gga_xc_b3lyps(na, nb, gaa, gab, gbb)
    return 0.13 * lda_x(na, nb) +
           0.72 * gga_x_b88(na, nb, gaa, gab, gbb) +
           0.18999999999999995 * lda_c_vwn_rpa(na, nb) +
           0.81 * gga_c_lyp(na, nb, gaa, gab, gbb)
end

export hyb_gga_xc_b3lyps, hyb_gga_xc_b3lyps_components, hyb_gga_xc_b3lyps_defaults, hyb_gga_xc_b3lyps_required

const hyb_gga_xc_b3p86_components = (
    (0.08000000000000007, :lda_x, NamedTuple()),
    (0.72, :gga_x_b88, NamedTuple()),
    (0.18999999999999995, :lda_c_vwn_rpa, NamedTuple()),
    (0.81, :gga_c_p86, NamedTuple()),
)
const hyb_gga_xc_b3p86_defaults = NamedTuple()
const hyb_gga_xc_b3p86_required = ()

function hyb_gga_xc_b3p86(rho, sigma)
    return 0.08000000000000007 * lda_x(rho) +
           0.72 * gga_x_b88(rho, sigma) +
           0.18999999999999995 * lda_c_vwn_rpa(rho) +
           0.81 * gga_c_p86(rho, sigma)
end

function hyb_gga_xc_b3p86(na, nb, gaa, gab, gbb)
    return 0.08000000000000007 * lda_x(na, nb) +
           0.72 * gga_x_b88(na, nb, gaa, gab, gbb) +
           0.18999999999999995 * lda_c_vwn_rpa(na, nb) +
           0.81 * gga_c_p86(na, nb, gaa, gab, gbb)
end

export hyb_gga_xc_b3p86, hyb_gga_xc_b3p86_components, hyb_gga_xc_b3p86_defaults, hyb_gga_xc_b3p86_required

const hyb_gga_xc_b3p86_nwchem_components = (
    (0.08, :lda_x, NamedTuple()),
    (0.72, :gga_x_b88, NamedTuple()),
    (1.0, :lda_c_vwn_rpa, NamedTuple()),
    (0.81, :gga_c_p86, NamedTuple()),
    (-0.81, :lda_c_pz, NamedTuple()),
)
const hyb_gga_xc_b3p86_nwchem_defaults = NamedTuple()
const hyb_gga_xc_b3p86_nwchem_required = ()

function hyb_gga_xc_b3p86_nwchem(rho, sigma)
    return 0.08 * lda_x(rho) +
           0.72 * gga_x_b88(rho, sigma) +
           1.0 * lda_c_vwn_rpa(rho) +
           0.81 * gga_c_p86(rho, sigma) +
           -0.81 * lda_c_pz(rho)
end

function hyb_gga_xc_b3p86_nwchem(na, nb, gaa, gab, gbb)
    return 0.08 * lda_x(na, nb) +
           0.72 * gga_x_b88(na, nb, gaa, gab, gbb) +
           1.0 * lda_c_vwn_rpa(na, nb) +
           0.81 * gga_c_p86(na, nb, gaa, gab, gbb) +
           -0.81 * lda_c_pz(na, nb)
end

export hyb_gga_xc_b3p86_nwchem, hyb_gga_xc_b3p86_nwchem_components, hyb_gga_xc_b3p86_nwchem_defaults, hyb_gga_xc_b3p86_nwchem_required

const hyb_gga_xc_b3pw91_components = (
    (0.08000000000000007, :lda_x, NamedTuple()),
    (0.72, :gga_x_b88, NamedTuple()),
    (0.18999999999999995, :lda_c_pw, NamedTuple()),
    (0.81, :gga_c_pw91, NamedTuple()),
)
const hyb_gga_xc_b3pw91_defaults = NamedTuple()
const hyb_gga_xc_b3pw91_required = ()

function hyb_gga_xc_b3pw91(rho, sigma)
    return 0.08000000000000007 * lda_x(rho) +
           0.72 * gga_x_b88(rho, sigma) +
           0.18999999999999995 * lda_c_pw(rho) +
           0.81 * gga_c_pw91(rho, sigma)
end

function hyb_gga_xc_b3pw91(na, nb, gaa, gab, gbb)
    return 0.08000000000000007 * lda_x(na, nb) +
           0.72 * gga_x_b88(na, nb, gaa, gab, gbb) +
           0.18999999999999995 * lda_c_pw(na, nb) +
           0.81 * gga_c_pw91(na, nb, gaa, gab, gbb)
end

export hyb_gga_xc_b3pw91, hyb_gga_xc_b3pw91_components, hyb_gga_xc_b3pw91_defaults, hyb_gga_xc_b3pw91_required

const hyb_gga_xc_b5050lyp_components = (
    (0.08000000000000002, :lda_x, NamedTuple()),
    (0.42, :gga_x_b88, NamedTuple()),
    (0.18999999999999995, :lda_c_vwn, NamedTuple()),
    (0.81, :gga_c_lyp, NamedTuple()),
)
const hyb_gga_xc_b5050lyp_defaults = NamedTuple()
const hyb_gga_xc_b5050lyp_required = ()

function hyb_gga_xc_b5050lyp(rho, sigma)
    return 0.08000000000000002 * lda_x(rho) +
           0.42 * gga_x_b88(rho, sigma) +
           0.18999999999999995 * lda_c_vwn(rho) +
           0.81 * gga_c_lyp(rho, sigma)
end

function hyb_gga_xc_b5050lyp(na, nb, gaa, gab, gbb)
    return 0.08000000000000002 * lda_x(na, nb) +
           0.42 * gga_x_b88(na, nb, gaa, gab, gbb) +
           0.18999999999999995 * lda_c_vwn(na, nb) +
           0.81 * gga_c_lyp(na, nb, gaa, gab, gbb)
end

export hyb_gga_xc_b5050lyp, hyb_gga_xc_b5050lyp_components, hyb_gga_xc_b5050lyp_defaults, hyb_gga_xc_b5050lyp_required

const hyb_gga_xc_bhandh_components = (
    (0.5, :lda_x, NamedTuple()),
    (1.0, :gga_c_lyp, NamedTuple()),
)
const hyb_gga_xc_bhandh_defaults = NamedTuple()
const hyb_gga_xc_bhandh_required = ()

function hyb_gga_xc_bhandh(rho, sigma)
    return 0.5 * lda_x(rho) +
           1.0 * gga_c_lyp(rho, sigma)
end

function hyb_gga_xc_bhandh(na, nb, gaa, gab, gbb)
    return 0.5 * lda_x(na, nb) +
           1.0 * gga_c_lyp(na, nb, gaa, gab, gbb)
end

export hyb_gga_xc_bhandh, hyb_gga_xc_bhandh_components, hyb_gga_xc_bhandh_defaults, hyb_gga_xc_bhandh_required

const hyb_gga_xc_bhandhlyp_components = (
    (0.5, :gga_x_b88, NamedTuple()),
    (1.0, :gga_c_lyp, NamedTuple()),
)
const hyb_gga_xc_bhandhlyp_defaults = NamedTuple()
const hyb_gga_xc_bhandhlyp_required = ()

function hyb_gga_xc_bhandhlyp(rho, sigma)
    return 0.5 * gga_x_b88(rho, sigma) +
           1.0 * gga_c_lyp(rho, sigma)
end

function hyb_gga_xc_bhandhlyp(na, nb, gaa, gab, gbb)
    return 0.5 * gga_x_b88(na, nb, gaa, gab, gbb) +
           1.0 * gga_c_lyp(na, nb, gaa, gab, gbb)
end

export hyb_gga_xc_bhandhlyp, hyb_gga_xc_bhandhlyp_components, hyb_gga_xc_bhandhlyp_defaults, hyb_gga_xc_bhandhlyp_required

const hyb_gga_xc_blyp35_components = (
    (0.65, :gga_x_b88, NamedTuple()),
    (1.0, :gga_c_lyp, NamedTuple()),
)
const hyb_gga_xc_blyp35_defaults = NamedTuple()
const hyb_gga_xc_blyp35_required = ()

function hyb_gga_xc_blyp35(rho, sigma)
    return 0.65 * gga_x_b88(rho, sigma) +
           1.0 * gga_c_lyp(rho, sigma)
end

function hyb_gga_xc_blyp35(na, nb, gaa, gab, gbb)
    return 0.65 * gga_x_b88(na, nb, gaa, gab, gbb) +
           1.0 * gga_c_lyp(na, nb, gaa, gab, gbb)
end

export hyb_gga_xc_blyp35, hyb_gga_xc_blyp35_components, hyb_gga_xc_blyp35_defaults, hyb_gga_xc_blyp35_required

const hyb_gga_xc_cam_b3lyp_components = (
    (0.35, :gga_x_b88, NamedTuple()),
    (0.46, :gga_x_ityh, (; cam_omega = 0.33)),
    (0.18999999999999995, :lda_c_vwn, NamedTuple()),
    (0.81, :gga_c_lyp, NamedTuple()),
)
const hyb_gga_xc_cam_b3lyp_defaults = NamedTuple()
const hyb_gga_xc_cam_b3lyp_required = ()

function hyb_gga_xc_cam_b3lyp(rho, sigma)
    return 0.35 * gga_x_b88(rho, sigma) +
           0.46 * gga_x_ityh(rho, sigma; params = (; cam_omega = 0.33)) +
           0.18999999999999995 * lda_c_vwn(rho) +
           0.81 * gga_c_lyp(rho, sigma)
end

function hyb_gga_xc_cam_b3lyp(na, nb, gaa, gab, gbb)
    return 0.35 * gga_x_b88(na, nb, gaa, gab, gbb) +
           0.46 * gga_x_ityh(na, nb, gaa, gab, gbb; params = (; cam_omega = 0.33)) +
           0.18999999999999995 * lda_c_vwn(na, nb) +
           0.81 * gga_c_lyp(na, nb, gaa, gab, gbb)
end

export hyb_gga_xc_cam_b3lyp, hyb_gga_xc_cam_b3lyp_components, hyb_gga_xc_cam_b3lyp_defaults, hyb_gga_xc_cam_b3lyp_required

const hyb_gga_xc_cam_o3lyp_components = (
    (0.07100691700000006, :lda_x_erf, (; cam_omega = 0.33)),
    (0.8133, :gga_x_ityh_optx, (; cam_omega = 0.33)),
    (0.18999999999999995, :lda_c_vwn, NamedTuple()),
    (0.81, :gga_c_lyp, NamedTuple()),
)
const hyb_gga_xc_cam_o3lyp_defaults = NamedTuple()
const hyb_gga_xc_cam_o3lyp_required = ()

function hyb_gga_xc_cam_o3lyp(rho, sigma)
    return 0.07100691700000006 * lda_x_erf(rho; params = (; cam_omega = 0.33)) +
           0.8133 * gga_x_ityh_optx(rho, sigma; params = (; cam_omega = 0.33)) +
           0.18999999999999995 * lda_c_vwn(rho) +
           0.81 * gga_c_lyp(rho, sigma)
end

function hyb_gga_xc_cam_o3lyp(na, nb, gaa, gab, gbb)
    return 0.07100691700000006 * lda_x_erf(na, nb; params = (; cam_omega = 0.33)) +
           0.8133 * gga_x_ityh_optx(na, nb, gaa, gab, gbb; params = (; cam_omega = 0.33)) +
           0.18999999999999995 * lda_c_vwn(na, nb) +
           0.81 * gga_c_lyp(na, nb, gaa, gab, gbb)
end

export hyb_gga_xc_cam_o3lyp, hyb_gga_xc_cam_o3lyp_components, hyb_gga_xc_cam_o3lyp_defaults, hyb_gga_xc_cam_o3lyp_required

const hyb_gga_xc_cam_pbeh_components = (
    (0.8, :gga_x_pbe, NamedTuple()),
    (-0.8, :gga_x_hjs_pbe, (; cam_omega = 0.7)),
    (1.0, :gga_c_pbe, NamedTuple()),
)
const hyb_gga_xc_cam_pbeh_defaults = NamedTuple()
const hyb_gga_xc_cam_pbeh_required = ()

function hyb_gga_xc_cam_pbeh(rho, sigma)
    return 0.8 * gga_x_pbe(rho, sigma) +
           -0.8 * gga_x_hjs_pbe(rho, sigma; params = (; cam_omega = 0.7)) +
           1.0 * gga_c_pbe(rho, sigma)
end

function hyb_gga_xc_cam_pbeh(na, nb, gaa, gab, gbb)
    return 0.8 * gga_x_pbe(na, nb, gaa, gab, gbb) +
           -0.8 * gga_x_hjs_pbe(na, nb, gaa, gab, gbb; params = (; cam_omega = 0.7)) +
           1.0 * gga_c_pbe(na, nb, gaa, gab, gbb)
end

export hyb_gga_xc_cam_pbeh, hyb_gga_xc_cam_pbeh_components, hyb_gga_xc_cam_pbeh_defaults, hyb_gga_xc_cam_pbeh_required

const hyb_gga_xc_cam_qtp_00_components = (
    (0.08999999999999997, :gga_x_b88, NamedTuple()),
    (0.37, :gga_x_ityh, (; cam_omega = 0.29)),
    (0.19999999999999996, :lda_c_vwn, NamedTuple()),
    (0.8, :gga_c_lyp, NamedTuple()),
)
const hyb_gga_xc_cam_qtp_00_defaults = NamedTuple()
const hyb_gga_xc_cam_qtp_00_required = ()

function hyb_gga_xc_cam_qtp_00(rho, sigma)
    return 0.08999999999999997 * gga_x_b88(rho, sigma) +
           0.37 * gga_x_ityh(rho, sigma; params = (; cam_omega = 0.29)) +
           0.19999999999999996 * lda_c_vwn(rho) +
           0.8 * gga_c_lyp(rho, sigma)
end

function hyb_gga_xc_cam_qtp_00(na, nb, gaa, gab, gbb)
    return 0.08999999999999997 * gga_x_b88(na, nb, gaa, gab, gbb) +
           0.37 * gga_x_ityh(na, nb, gaa, gab, gbb; params = (; cam_omega = 0.29)) +
           0.19999999999999996 * lda_c_vwn(na, nb) +
           0.8 * gga_c_lyp(na, nb, gaa, gab, gbb)
end

export hyb_gga_xc_cam_qtp_00, hyb_gga_xc_cam_qtp_00_components, hyb_gga_xc_cam_qtp_00_defaults, hyb_gga_xc_cam_qtp_00_required

const hyb_gga_xc_cam_qtp_01_components = (
    (0.0, :gga_x_b88, NamedTuple()),
    (0.77, :gga_x_ityh, (; cam_omega = 0.31)),
    (0.19999999999999996, :lda_c_vwn, NamedTuple()),
    (0.8, :gga_c_lyp, NamedTuple()),
)
const hyb_gga_xc_cam_qtp_01_defaults = NamedTuple()
const hyb_gga_xc_cam_qtp_01_required = ()

function hyb_gga_xc_cam_qtp_01(rho, sigma)
    return 0.0 * gga_x_b88(rho, sigma) +
           0.77 * gga_x_ityh(rho, sigma; params = (; cam_omega = 0.31)) +
           0.19999999999999996 * lda_c_vwn(rho) +
           0.8 * gga_c_lyp(rho, sigma)
end

function hyb_gga_xc_cam_qtp_01(na, nb, gaa, gab, gbb)
    return 0.0 * gga_x_b88(na, nb, gaa, gab, gbb) +
           0.77 * gga_x_ityh(na, nb, gaa, gab, gbb; params = (; cam_omega = 0.31)) +
           0.19999999999999996 * lda_c_vwn(na, nb) +
           0.8 * gga_c_lyp(na, nb, gaa, gab, gbb)
end

export hyb_gga_xc_cam_qtp_01, hyb_gga_xc_cam_qtp_01_components, hyb_gga_xc_cam_qtp_01_defaults, hyb_gga_xc_cam_qtp_01_required

const hyb_gga_xc_cam_qtp_02_components = (
    (0.0, :gga_x_b88, NamedTuple()),
    (0.72, :gga_x_ityh, (; cam_omega = 0.335)),
    (0.0, :lda_c_vwn, NamedTuple()),
    (1.0, :gga_c_lyp, NamedTuple()),
)
const hyb_gga_xc_cam_qtp_02_defaults = NamedTuple()
const hyb_gga_xc_cam_qtp_02_required = ()

function hyb_gga_xc_cam_qtp_02(rho, sigma)
    return 0.0 * gga_x_b88(rho, sigma) +
           0.72 * gga_x_ityh(rho, sigma; params = (; cam_omega = 0.335)) +
           0.0 * lda_c_vwn(rho) +
           1.0 * gga_c_lyp(rho, sigma)
end

function hyb_gga_xc_cam_qtp_02(na, nb, gaa, gab, gbb)
    return 0.0 * gga_x_b88(na, nb, gaa, gab, gbb) +
           0.72 * gga_x_ityh(na, nb, gaa, gab, gbb; params = (; cam_omega = 0.335)) +
           0.0 * lda_c_vwn(na, nb) +
           1.0 * gga_c_lyp(na, nb, gaa, gab, gbb)
end

export hyb_gga_xc_cam_qtp_02, hyb_gga_xc_cam_qtp_02_components, hyb_gga_xc_cam_qtp_02_defaults, hyb_gga_xc_cam_qtp_02_required

const hyb_gga_xc_camh_b3lyp_components = (
    (0.5, :gga_x_b88, NamedTuple()),
    (0.31, :gga_x_ityh, (; cam_omega = 0.33)),
    (0.18999999999999995, :lda_c_vwn, NamedTuple()),
    (0.81, :gga_c_lyp, NamedTuple()),
)
const hyb_gga_xc_camh_b3lyp_defaults = NamedTuple()
const hyb_gga_xc_camh_b3lyp_required = ()

function hyb_gga_xc_camh_b3lyp(rho, sigma)
    return 0.5 * gga_x_b88(rho, sigma) +
           0.31 * gga_x_ityh(rho, sigma; params = (; cam_omega = 0.33)) +
           0.18999999999999995 * lda_c_vwn(rho) +
           0.81 * gga_c_lyp(rho, sigma)
end

function hyb_gga_xc_camh_b3lyp(na, nb, gaa, gab, gbb)
    return 0.5 * gga_x_b88(na, nb, gaa, gab, gbb) +
           0.31 * gga_x_ityh(na, nb, gaa, gab, gbb; params = (; cam_omega = 0.33)) +
           0.18999999999999995 * lda_c_vwn(na, nb) +
           0.81 * gga_c_lyp(na, nb, gaa, gab, gbb)
end

export hyb_gga_xc_camh_b3lyp, hyb_gga_xc_camh_b3lyp_components, hyb_gga_xc_camh_b3lyp_defaults, hyb_gga_xc_camh_b3lyp_required

const hyb_gga_xc_camy_b3lyp_components = (
    (0.35, :gga_x_b88, NamedTuple()),
    (0.46, :gga_x_sfat, (; cam_omega = 0.34)),
    (0.18999999999999995, :lda_c_vwn, NamedTuple()),
    (0.81, :gga_c_lyp, NamedTuple()),
)
const hyb_gga_xc_camy_b3lyp_defaults = NamedTuple()
const hyb_gga_xc_camy_b3lyp_required = ()

function hyb_gga_xc_camy_b3lyp(rho, sigma)
    return 0.35 * gga_x_b88(rho, sigma) +
           0.46 * gga_x_sfat(rho, sigma; params = (; cam_omega = 0.34)) +
           0.18999999999999995 * lda_c_vwn(rho) +
           0.81 * gga_c_lyp(rho, sigma)
end

function hyb_gga_xc_camy_b3lyp(na, nb, gaa, gab, gbb)
    return 0.35 * gga_x_b88(na, nb, gaa, gab, gbb) +
           0.46 * gga_x_sfat(na, nb, gaa, gab, gbb; params = (; cam_omega = 0.34)) +
           0.18999999999999995 * lda_c_vwn(na, nb) +
           0.81 * gga_c_lyp(na, nb, gaa, gab, gbb)
end

export hyb_gga_xc_camy_b3lyp, hyb_gga_xc_camy_b3lyp_components, hyb_gga_xc_camy_b3lyp_defaults, hyb_gga_xc_camy_b3lyp_required

const hyb_gga_xc_camy_blyp_components = (
    (0.0, :gga_x_b88, NamedTuple()),
    (0.8, :gga_x_sfat, NamedTuple()),
    (1.0, :gga_c_lyp, NamedTuple()),
)
const hyb_gga_xc_camy_blyp_defaults = NamedTuple()
const hyb_gga_xc_camy_blyp_required = ()

function hyb_gga_xc_camy_blyp(rho, sigma)
    return 0.0 * gga_x_b88(rho, sigma) +
           0.8 * gga_x_sfat(rho, sigma) +
           1.0 * gga_c_lyp(rho, sigma)
end

function hyb_gga_xc_camy_blyp(na, nb, gaa, gab, gbb)
    return 0.0 * gga_x_b88(na, nb, gaa, gab, gbb) +
           0.8 * gga_x_sfat(na, nb, gaa, gab, gbb) +
           1.0 * gga_c_lyp(na, nb, gaa, gab, gbb)
end

export hyb_gga_xc_camy_blyp, hyb_gga_xc_camy_blyp_components, hyb_gga_xc_camy_blyp_defaults, hyb_gga_xc_camy_blyp_required

const hyb_gga_xc_camy_pbeh_components = (
    (0.8, :gga_x_pbe, NamedTuple()),
    (-0.8, :gga_x_sfat, (; cam_omega = 0.7)),
    (1.0, :gga_c_pbe, NamedTuple()),
)
const hyb_gga_xc_camy_pbeh_defaults = NamedTuple()
const hyb_gga_xc_camy_pbeh_required = ()

function hyb_gga_xc_camy_pbeh(rho, sigma)
    return 0.8 * gga_x_pbe(rho, sigma) +
           -0.8 * gga_x_sfat(rho, sigma; params = (; cam_omega = 0.7)) +
           1.0 * gga_c_pbe(rho, sigma)
end

function hyb_gga_xc_camy_pbeh(na, nb, gaa, gab, gbb)
    return 0.8 * gga_x_pbe(na, nb, gaa, gab, gbb) +
           -0.8 * gga_x_sfat(na, nb, gaa, gab, gbb; params = (; cam_omega = 0.7)) +
           1.0 * gga_c_pbe(na, nb, gaa, gab, gbb)
end

export hyb_gga_xc_camy_pbeh, hyb_gga_xc_camy_pbeh_components, hyb_gga_xc_camy_pbeh_defaults, hyb_gga_xc_camy_pbeh_required

const hyb_gga_xc_cap0_components = (
    (0.75, :gga_x_cap, NamedTuple()),
    (1.0, :gga_c_pbe, (; params_a_beta = 0.050043412952361914)),
)
const hyb_gga_xc_cap0_defaults = NamedTuple()
const hyb_gga_xc_cap0_required = ()

function hyb_gga_xc_cap0(rho, sigma)
    return 0.75 * gga_x_cap(rho, sigma) +
           1.0 * gga_c_pbe(rho, sigma; params = (; params_a_beta = 0.050043412952361914))
end

function hyb_gga_xc_cap0(na, nb, gaa, gab, gbb)
    return 0.75 * gga_x_cap(na, nb, gaa, gab, gbb) +
           1.0 * gga_c_pbe(na, nb, gaa, gab, gbb; params = (; params_a_beta = 0.050043412952361914))
end

export hyb_gga_xc_cap0, hyb_gga_xc_cap0_components, hyb_gga_xc_cap0_defaults, hyb_gga_xc_cap0_required

const hyb_gga_xc_cqtp25_components = (
    (0.0, :gga_x_b88, NamedTuple()),
    (0.4948, :gga_x_ityh, (; cam_omega = 0.4153)),
    (0.4102, :lda_c_vwn, NamedTuple()),
    (0.5898, :gga_c_lyp, NamedTuple()),
)
const hyb_gga_xc_cqtp25_defaults = NamedTuple()
const hyb_gga_xc_cqtp25_required = ()

function hyb_gga_xc_cqtp25(rho, sigma)
    return 0.0 * gga_x_b88(rho, sigma) +
           0.4948 * gga_x_ityh(rho, sigma; params = (; cam_omega = 0.4153)) +
           0.4102 * lda_c_vwn(rho) +
           0.5898 * gga_c_lyp(rho, sigma)
end

function hyb_gga_xc_cqtp25(na, nb, gaa, gab, gbb)
    return 0.0 * gga_x_b88(na, nb, gaa, gab, gbb) +
           0.4948 * gga_x_ityh(na, nb, gaa, gab, gbb; params = (; cam_omega = 0.4153)) +
           0.4102 * lda_c_vwn(na, nb) +
           0.5898 * gga_c_lyp(na, nb, gaa, gab, gbb)
end

export hyb_gga_xc_cqtp25, hyb_gga_xc_cqtp25_components, hyb_gga_xc_cqtp25_defaults, hyb_gga_xc_cqtp25_required

const hyb_gga_xc_edf2_components = (
    (0.2811, :lda_x, NamedTuple()),
    (0.6227, :gga_x_b88, NamedTuple()),
    (-0.0551, :gga_x_b88, (; params_a_beta = 0.0035)),
    (0.3029, :lda_c_vwn, NamedTuple()),
    (0.5998, :gga_c_lyp, NamedTuple()),
    (-0.0053, :gga_c_lyp, (; params_a_a = 0.055, params_a_b = 0.158, params_a_c = 0.25, params_a_d = 0.3505)),
)
const hyb_gga_xc_edf2_defaults = NamedTuple()
const hyb_gga_xc_edf2_required = ()

function hyb_gga_xc_edf2(rho, sigma)
    return 0.2811 * lda_x(rho) +
           0.6227 * gga_x_b88(rho, sigma) +
           -0.0551 * gga_x_b88(rho, sigma; params = (; params_a_beta = 0.0035)) +
           0.3029 * lda_c_vwn(rho) +
           0.5998 * gga_c_lyp(rho, sigma) +
           -0.0053 * gga_c_lyp(rho, sigma; params = (; params_a_a = 0.055, params_a_b = 0.158, params_a_c = 0.25, params_a_d = 0.3505))
end

function hyb_gga_xc_edf2(na, nb, gaa, gab, gbb)
    return 0.2811 * lda_x(na, nb) +
           0.6227 * gga_x_b88(na, nb, gaa, gab, gbb) +
           -0.0551 * gga_x_b88(na, nb, gaa, gab, gbb; params = (; params_a_beta = 0.0035)) +
           0.3029 * lda_c_vwn(na, nb) +
           0.5998 * gga_c_lyp(na, nb, gaa, gab, gbb) +
           -0.0053 * gga_c_lyp(na, nb, gaa, gab, gbb; params = (; params_a_a = 0.055, params_a_b = 0.158, params_a_c = 0.25, params_a_d = 0.3505))
end

export hyb_gga_xc_edf2, hyb_gga_xc_edf2_components, hyb_gga_xc_edf2_defaults, hyb_gga_xc_edf2_required

const hyb_gga_xc_hapbe_components = (
    (0.8, :gga_x_apbe, NamedTuple()),
    (0.8, :gga_c_apbe, NamedTuple()),
    (0.2, :gga_c_zvpbeloc, NamedTuple()),
)
const hyb_gga_xc_hapbe_defaults = NamedTuple()
const hyb_gga_xc_hapbe_required = ()

function hyb_gga_xc_hapbe(rho, sigma)
    return 0.8 * gga_x_apbe(rho, sigma) +
           0.8 * gga_c_apbe(rho, sigma) +
           0.2 * gga_c_zvpbeloc(rho, sigma)
end

function hyb_gga_xc_hapbe(na, nb, gaa, gab, gbb)
    return 0.8 * gga_x_apbe(na, nb, gaa, gab, gbb) +
           0.8 * gga_c_apbe(na, nb, gaa, gab, gbb) +
           0.2 * gga_c_zvpbeloc(na, nb, gaa, gab, gbb)
end

export hyb_gga_xc_hapbe, hyb_gga_xc_hapbe_components, hyb_gga_xc_hapbe_defaults, hyb_gga_xc_hapbe_required

const hyb_gga_xc_hflyp_components = (
    (1.0, :gga_c_lyp, NamedTuple()),
)
const hyb_gga_xc_hflyp_defaults = NamedTuple()
const hyb_gga_xc_hflyp_required = ()

function hyb_gga_xc_hflyp(rho, sigma)
    return 1.0 * gga_c_lyp(rho, sigma)
end

function hyb_gga_xc_hflyp(na, nb, gaa, gab, gbb)
    return 1.0 * gga_c_lyp(na, nb, gaa, gab, gbb)
end

export hyb_gga_xc_hflyp, hyb_gga_xc_hflyp_components, hyb_gga_xc_hflyp_defaults, hyb_gga_xc_hflyp_required

const hyb_gga_xc_hjs_b88_components = (
    (1.0, :gga_x_hjs_b88, (; cam_omega = 0.0)),
    (-0.25, :gga_x_hjs_b88, NamedTuple()),
    (1.0, :gga_c_pbe, NamedTuple()),
)
const hyb_gga_xc_hjs_b88_defaults = NamedTuple()
const hyb_gga_xc_hjs_b88_required = ()

function hyb_gga_xc_hjs_b88(rho, sigma)
    return 1.0 * gga_x_hjs_b88(rho, sigma; params = (; cam_omega = 0.0)) +
           -0.25 * gga_x_hjs_b88(rho, sigma) +
           1.0 * gga_c_pbe(rho, sigma)
end

function hyb_gga_xc_hjs_b88(na, nb, gaa, gab, gbb)
    return 1.0 * gga_x_hjs_b88(na, nb, gaa, gab, gbb; params = (; cam_omega = 0.0)) +
           -0.25 * gga_x_hjs_b88(na, nb, gaa, gab, gbb) +
           1.0 * gga_c_pbe(na, nb, gaa, gab, gbb)
end

export hyb_gga_xc_hjs_b88, hyb_gga_xc_hjs_b88_components, hyb_gga_xc_hjs_b88_defaults, hyb_gga_xc_hjs_b88_required

const hyb_gga_xc_hjs_b97x_components = (
    (1.0, :gga_x_hjs_b97x, (; cam_omega = 0.0)),
    (-0.25, :gga_x_hjs_b97x, NamedTuple()),
    (1.0, :gga_c_pbe, NamedTuple()),
)
const hyb_gga_xc_hjs_b97x_defaults = NamedTuple()
const hyb_gga_xc_hjs_b97x_required = ()

function hyb_gga_xc_hjs_b97x(rho, sigma)
    return 1.0 * gga_x_hjs_b97x(rho, sigma; params = (; cam_omega = 0.0)) +
           -0.25 * gga_x_hjs_b97x(rho, sigma) +
           1.0 * gga_c_pbe(rho, sigma)
end

function hyb_gga_xc_hjs_b97x(na, nb, gaa, gab, gbb)
    return 1.0 * gga_x_hjs_b97x(na, nb, gaa, gab, gbb; params = (; cam_omega = 0.0)) +
           -0.25 * gga_x_hjs_b97x(na, nb, gaa, gab, gbb) +
           1.0 * gga_c_pbe(na, nb, gaa, gab, gbb)
end

export hyb_gga_xc_hjs_b97x, hyb_gga_xc_hjs_b97x_components, hyb_gga_xc_hjs_b97x_defaults, hyb_gga_xc_hjs_b97x_required

const hyb_gga_xc_hjs_pbe_components = (
    (1.0, :gga_x_hjs_pbe, (; cam_omega = 0.0)),
    (-0.25, :gga_x_hjs_pbe, NamedTuple()),
    (1.0, :gga_c_pbe, NamedTuple()),
)
const hyb_gga_xc_hjs_pbe_defaults = NamedTuple()
const hyb_gga_xc_hjs_pbe_required = ()

function hyb_gga_xc_hjs_pbe(rho, sigma)
    return 1.0 * gga_x_hjs_pbe(rho, sigma; params = (; cam_omega = 0.0)) +
           -0.25 * gga_x_hjs_pbe(rho, sigma) +
           1.0 * gga_c_pbe(rho, sigma)
end

function hyb_gga_xc_hjs_pbe(na, nb, gaa, gab, gbb)
    return 1.0 * gga_x_hjs_pbe(na, nb, gaa, gab, gbb; params = (; cam_omega = 0.0)) +
           -0.25 * gga_x_hjs_pbe(na, nb, gaa, gab, gbb) +
           1.0 * gga_c_pbe(na, nb, gaa, gab, gbb)
end

export hyb_gga_xc_hjs_pbe, hyb_gga_xc_hjs_pbe_components, hyb_gga_xc_hjs_pbe_defaults, hyb_gga_xc_hjs_pbe_required

const hyb_gga_xc_hjs_pbe_sol_components = (
    (1.0, :gga_x_hjs_pbe_sol, (; cam_omega = 0.0)),
    (-0.25, :gga_x_hjs_pbe_sol, NamedTuple()),
    (1.0, :gga_c_pbe, NamedTuple()),
)
const hyb_gga_xc_hjs_pbe_sol_defaults = NamedTuple()
const hyb_gga_xc_hjs_pbe_sol_required = ()

function hyb_gga_xc_hjs_pbe_sol(rho, sigma)
    return 1.0 * gga_x_hjs_pbe_sol(rho, sigma; params = (; cam_omega = 0.0)) +
           -0.25 * gga_x_hjs_pbe_sol(rho, sigma) +
           1.0 * gga_c_pbe(rho, sigma)
end

function hyb_gga_xc_hjs_pbe_sol(na, nb, gaa, gab, gbb)
    return 1.0 * gga_x_hjs_pbe_sol(na, nb, gaa, gab, gbb; params = (; cam_omega = 0.0)) +
           -0.25 * gga_x_hjs_pbe_sol(na, nb, gaa, gab, gbb) +
           1.0 * gga_c_pbe(na, nb, gaa, gab, gbb)
end

export hyb_gga_xc_hjs_pbe_sol, hyb_gga_xc_hjs_pbe_sol_components, hyb_gga_xc_hjs_pbe_sol_defaults, hyb_gga_xc_hjs_pbe_sol_required

const hyb_gga_xc_hpbeint_components = (
    (0.8333333333333334, :gga_x_pbeint, NamedTuple()),
    (1.0, :gga_c_pbeint, NamedTuple()),
)
const hyb_gga_xc_hpbeint_defaults = NamedTuple()
const hyb_gga_xc_hpbeint_required = ()

function hyb_gga_xc_hpbeint(rho, sigma)
    return 0.8333333333333334 * gga_x_pbeint(rho, sigma) +
           1.0 * gga_c_pbeint(rho, sigma)
end

function hyb_gga_xc_hpbeint(na, nb, gaa, gab, gbb)
    return 0.8333333333333334 * gga_x_pbeint(na, nb, gaa, gab, gbb) +
           1.0 * gga_c_pbeint(na, nb, gaa, gab, gbb)
end

export hyb_gga_xc_hpbeint, hyb_gga_xc_hpbeint_components, hyb_gga_xc_hpbeint_defaults, hyb_gga_xc_hpbeint_required

const hyb_gga_xc_hse03_components = (
    (1.0, :gga_x_wpbeh, NamedTuple()),
    (-0.25, :gga_x_wpbeh, (; cam_omega = 0.18898815748423098)),
    (1.0, :gga_c_pbe, NamedTuple()),
)
const hyb_gga_xc_hse03_defaults = NamedTuple()
const hyb_gga_xc_hse03_required = ()

function hyb_gga_xc_hse03(rho, sigma)
    return 1.0 * gga_x_wpbeh(rho, sigma) +
           -0.25 * gga_x_wpbeh(rho, sigma; params = (; cam_omega = 0.18898815748423098)) +
           1.0 * gga_c_pbe(rho, sigma)
end

function hyb_gga_xc_hse03(na, nb, gaa, gab, gbb)
    return 1.0 * gga_x_wpbeh(na, nb, gaa, gab, gbb) +
           -0.25 * gga_x_wpbeh(na, nb, gaa, gab, gbb; params = (; cam_omega = 0.18898815748423098)) +
           1.0 * gga_c_pbe(na, nb, gaa, gab, gbb)
end

export hyb_gga_xc_hse03, hyb_gga_xc_hse03_components, hyb_gga_xc_hse03_defaults, hyb_gga_xc_hse03_required

const hyb_gga_xc_hse06_components = (
    (1.0, :gga_x_wpbeh, NamedTuple()),
    (-0.25, :gga_x_wpbeh, (; cam_omega = 0.11)),
    (1.0, :gga_c_pbe, NamedTuple()),
)
const hyb_gga_xc_hse06_defaults = NamedTuple()
const hyb_gga_xc_hse06_required = ()

function hyb_gga_xc_hse06(rho, sigma)
    return 1.0 * gga_x_wpbeh(rho, sigma) +
           -0.25 * gga_x_wpbeh(rho, sigma; params = (; cam_omega = 0.11)) +
           1.0 * gga_c_pbe(rho, sigma)
end

function hyb_gga_xc_hse06(na, nb, gaa, gab, gbb)
    return 1.0 * gga_x_wpbeh(na, nb, gaa, gab, gbb) +
           -0.25 * gga_x_wpbeh(na, nb, gaa, gab, gbb; params = (; cam_omega = 0.11)) +
           1.0 * gga_c_pbe(na, nb, gaa, gab, gbb)
end

export hyb_gga_xc_hse06, hyb_gga_xc_hse06_components, hyb_gga_xc_hse06_defaults, hyb_gga_xc_hse06_required

const hyb_gga_xc_hse12_components = (
    (1.0, :gga_x_wpbeh, NamedTuple()),
    (-0.313, :gga_x_wpbeh, (; cam_omega = 0.0978977840165)),
    (1.0, :gga_c_pbe, NamedTuple()),
)
const hyb_gga_xc_hse12_defaults = NamedTuple()
const hyb_gga_xc_hse12_required = ()

function hyb_gga_xc_hse12(rho, sigma)
    return 1.0 * gga_x_wpbeh(rho, sigma) +
           -0.313 * gga_x_wpbeh(rho, sigma; params = (; cam_omega = 0.0978977840165)) +
           1.0 * gga_c_pbe(rho, sigma)
end

function hyb_gga_xc_hse12(na, nb, gaa, gab, gbb)
    return 1.0 * gga_x_wpbeh(na, nb, gaa, gab, gbb) +
           -0.313 * gga_x_wpbeh(na, nb, gaa, gab, gbb; params = (; cam_omega = 0.0978977840165)) +
           1.0 * gga_c_pbe(na, nb, gaa, gab, gbb)
end

export hyb_gga_xc_hse12, hyb_gga_xc_hse12_components, hyb_gga_xc_hse12_defaults, hyb_gga_xc_hse12_required

const hyb_gga_xc_hse12s_components = (
    (1.0, :gga_x_wpbeh, NamedTuple()),
    (-0.425, :gga_x_wpbeh, (; cam_omega = 0.2159043020472)),
    (1.0, :gga_c_pbe, NamedTuple()),
)
const hyb_gga_xc_hse12s_defaults = NamedTuple()
const hyb_gga_xc_hse12s_required = ()

function hyb_gga_xc_hse12s(rho, sigma)
    return 1.0 * gga_x_wpbeh(rho, sigma) +
           -0.425 * gga_x_wpbeh(rho, sigma; params = (; cam_omega = 0.2159043020472)) +
           1.0 * gga_c_pbe(rho, sigma)
end

function hyb_gga_xc_hse12s(na, nb, gaa, gab, gbb)
    return 1.0 * gga_x_wpbeh(na, nb, gaa, gab, gbb) +
           -0.425 * gga_x_wpbeh(na, nb, gaa, gab, gbb; params = (; cam_omega = 0.2159043020472)) +
           1.0 * gga_c_pbe(na, nb, gaa, gab, gbb)
end

export hyb_gga_xc_hse12s, hyb_gga_xc_hse12s_components, hyb_gga_xc_hse12s_defaults, hyb_gga_xc_hse12s_required

const hyb_gga_xc_hse_sol_components = (
    (1.0, :gga_x_hjs_pbe_sol, (; cam_omega = 0.0)),
    (-0.25, :gga_x_hjs_pbe_sol, NamedTuple()),
    (1.0, :gga_c_pbe, NamedTuple()),
)
const hyb_gga_xc_hse_sol_defaults = NamedTuple()
const hyb_gga_xc_hse_sol_required = ()

function hyb_gga_xc_hse_sol(rho, sigma)
    return 1.0 * gga_x_hjs_pbe_sol(rho, sigma; params = (; cam_omega = 0.0)) +
           -0.25 * gga_x_hjs_pbe_sol(rho, sigma) +
           1.0 * gga_c_pbe(rho, sigma)
end

function hyb_gga_xc_hse_sol(na, nb, gaa, gab, gbb)
    return 1.0 * gga_x_hjs_pbe_sol(na, nb, gaa, gab, gbb; params = (; cam_omega = 0.0)) +
           -0.25 * gga_x_hjs_pbe_sol(na, nb, gaa, gab, gbb) +
           1.0 * gga_c_pbe(na, nb, gaa, gab, gbb)
end

export hyb_gga_xc_hse_sol, hyb_gga_xc_hse_sol_components, hyb_gga_xc_hse_sol_defaults, hyb_gga_xc_hse_sol_required

const hyb_gga_xc_kmlyp_components = (
    (0.44299999999999995, :lda_x, NamedTuple()),
    (0.552, :lda_c_vwn_rpa, NamedTuple()),
    (0.448, :gga_c_lyp, NamedTuple()),
)
const hyb_gga_xc_kmlyp_defaults = NamedTuple()
const hyb_gga_xc_kmlyp_required = ()

function hyb_gga_xc_kmlyp(rho, sigma)
    return 0.44299999999999995 * lda_x(rho) +
           0.552 * lda_c_vwn_rpa(rho) +
           0.448 * gga_c_lyp(rho, sigma)
end

function hyb_gga_xc_kmlyp(na, nb, gaa, gab, gbb)
    return 0.44299999999999995 * lda_x(na, nb) +
           0.552 * lda_c_vwn_rpa(na, nb) +
           0.448 * gga_c_lyp(na, nb, gaa, gab, gbb)
end

export hyb_gga_xc_kmlyp, hyb_gga_xc_kmlyp_components, hyb_gga_xc_kmlyp_defaults, hyb_gga_xc_kmlyp_required

const hyb_gga_xc_lb07_components = (
    (0.9, :lda_x_erf, (; cam_omega = 0.5)),
    (1.0, :gga_c_lyp, NamedTuple()),
)
const hyb_gga_xc_lb07_defaults = NamedTuple()
const hyb_gga_xc_lb07_required = ()

function hyb_gga_xc_lb07(rho, sigma)
    return 0.9 * lda_x_erf(rho; params = (; cam_omega = 0.5)) +
           1.0 * gga_c_lyp(rho, sigma)
end

function hyb_gga_xc_lb07(na, nb, gaa, gab, gbb)
    return 0.9 * lda_x_erf(na, nb; params = (; cam_omega = 0.5)) +
           1.0 * gga_c_lyp(na, nb, gaa, gab, gbb)
end

export hyb_gga_xc_lb07, hyb_gga_xc_lb07_components, hyb_gga_xc_lb07_defaults, hyb_gga_xc_lb07_required

const hyb_gga_xc_lc_blyp_components = (
    (1.0, :gga_x_ityh, (; cam_omega = 0.33)),
    (1.0, :gga_c_lyp, NamedTuple()),
)
const hyb_gga_xc_lc_blyp_defaults = NamedTuple()
const hyb_gga_xc_lc_blyp_required = ()

function hyb_gga_xc_lc_blyp(rho, sigma)
    return 1.0 * gga_x_ityh(rho, sigma; params = (; cam_omega = 0.33)) +
           1.0 * gga_c_lyp(rho, sigma)
end

function hyb_gga_xc_lc_blyp(na, nb, gaa, gab, gbb)
    return 1.0 * gga_x_ityh(na, nb, gaa, gab, gbb; params = (; cam_omega = 0.33)) +
           1.0 * gga_c_lyp(na, nb, gaa, gab, gbb)
end

export hyb_gga_xc_lc_blyp, hyb_gga_xc_lc_blyp_components, hyb_gga_xc_lc_blyp_defaults, hyb_gga_xc_lc_blyp_required

const hyb_gga_xc_lc_blyp_ea_components = (
    (1.0, :gga_x_ityh, (; cam_omega = 0.3)),
    (1.0, :gga_c_lyp, NamedTuple()),
)
const hyb_gga_xc_lc_blyp_ea_defaults = NamedTuple()
const hyb_gga_xc_lc_blyp_ea_required = ()

function hyb_gga_xc_lc_blyp_ea(rho, sigma)
    return 1.0 * gga_x_ityh(rho, sigma; params = (; cam_omega = 0.3)) +
           1.0 * gga_c_lyp(rho, sigma)
end

function hyb_gga_xc_lc_blyp_ea(na, nb, gaa, gab, gbb)
    return 1.0 * gga_x_ityh(na, nb, gaa, gab, gbb; params = (; cam_omega = 0.3)) +
           1.0 * gga_c_lyp(na, nb, gaa, gab, gbb)
end

export hyb_gga_xc_lc_blyp_ea, hyb_gga_xc_lc_blyp_ea_components, hyb_gga_xc_lc_blyp_ea_defaults, hyb_gga_xc_lc_blyp_ea_required

const hyb_gga_xc_lc_blypr_components = (
    (1.0, :gga_x_ityh, (; cam_omega = 0.33)),
    (1.0, :gga_c_lypr, NamedTuple()),
)
const hyb_gga_xc_lc_blypr_defaults = NamedTuple()
const hyb_gga_xc_lc_blypr_required = ()

function hyb_gga_xc_lc_blypr(rho, sigma)
    return 1.0 * gga_x_ityh(rho, sigma; params = (; cam_omega = 0.33)) +
           1.0 * gga_c_lypr(rho, sigma)
end

function hyb_gga_xc_lc_blypr(na, nb, gaa, gab, gbb)
    return 1.0 * gga_x_ityh(na, nb, gaa, gab, gbb; params = (; cam_omega = 0.33)) +
           1.0 * gga_c_lypr(na, nb, gaa, gab, gbb)
end

export hyb_gga_xc_lc_blypr, hyb_gga_xc_lc_blypr_components, hyb_gga_xc_lc_blypr_defaults, hyb_gga_xc_lc_blypr_required

const hyb_gga_xc_lc_bop_components = (
    (1.0, :gga_x_ityh, (; cam_omega = 0.47)),
    (1.0, :gga_c_op_b88, NamedTuple()),
)
const hyb_gga_xc_lc_bop_defaults = NamedTuple()
const hyb_gga_xc_lc_bop_required = ()

function hyb_gga_xc_lc_bop(rho, sigma)
    return 1.0 * gga_x_ityh(rho, sigma; params = (; cam_omega = 0.47)) +
           1.0 * gga_c_op_b88(rho, sigma)
end

function hyb_gga_xc_lc_bop(na, nb, gaa, gab, gbb)
    return 1.0 * gga_x_ityh(na, nb, gaa, gab, gbb; params = (; cam_omega = 0.47)) +
           1.0 * gga_c_op_b88(na, nb, gaa, gab, gbb)
end

export hyb_gga_xc_lc_bop, hyb_gga_xc_lc_bop_components, hyb_gga_xc_lc_bop_defaults, hyb_gga_xc_lc_bop_required

const hyb_gga_xc_lc_pbeop_components = (
    (1.0, :gga_x_ityh_pbe, NamedTuple()),
    (1.0, :gga_c_op_pbe, NamedTuple()),
)
const hyb_gga_xc_lc_pbeop_defaults = NamedTuple()
const hyb_gga_xc_lc_pbeop_required = ()

function hyb_gga_xc_lc_pbeop(rho, sigma)
    return 1.0 * gga_x_ityh_pbe(rho, sigma) +
           1.0 * gga_c_op_pbe(rho, sigma)
end

function hyb_gga_xc_lc_pbeop(na, nb, gaa, gab, gbb)
    return 1.0 * gga_x_ityh_pbe(na, nb, gaa, gab, gbb) +
           1.0 * gga_c_op_pbe(na, nb, gaa, gab, gbb)
end

export hyb_gga_xc_lc_pbeop, hyb_gga_xc_lc_pbeop_components, hyb_gga_xc_lc_pbeop_defaults, hyb_gga_xc_lc_pbeop_required

const hyb_gga_xc_lc_qtp_components = (
    (0.0, :gga_x_b88, NamedTuple()),
    (1.0, :gga_x_ityh, (; cam_omega = 0.475)),
    (0.0, :lda_c_vwn, NamedTuple()),
    (1.0, :gga_c_lyp, NamedTuple()),
)
const hyb_gga_xc_lc_qtp_defaults = NamedTuple()
const hyb_gga_xc_lc_qtp_required = ()

function hyb_gga_xc_lc_qtp(rho, sigma)
    return 0.0 * gga_x_b88(rho, sigma) +
           1.0 * gga_x_ityh(rho, sigma; params = (; cam_omega = 0.475)) +
           0.0 * lda_c_vwn(rho) +
           1.0 * gga_c_lyp(rho, sigma)
end

function hyb_gga_xc_lc_qtp(na, nb, gaa, gab, gbb)
    return 0.0 * gga_x_b88(na, nb, gaa, gab, gbb) +
           1.0 * gga_x_ityh(na, nb, gaa, gab, gbb; params = (; cam_omega = 0.475)) +
           0.0 * lda_c_vwn(na, nb) +
           1.0 * gga_c_lyp(na, nb, gaa, gab, gbb)
end

export hyb_gga_xc_lc_qtp, hyb_gga_xc_lc_qtp_components, hyb_gga_xc_lc_qtp_defaults, hyb_gga_xc_lc_qtp_required

const hyb_gga_xc_lc_vv10_components = (
    (1.0, :gga_x_hjs_pbe, (; cam_omega = 0.45)),
    (1.0, :gga_c_pbe, NamedTuple()),
)
const hyb_gga_xc_lc_vv10_defaults = NamedTuple()
const hyb_gga_xc_lc_vv10_required = ()

function hyb_gga_xc_lc_vv10(rho, sigma)
    return 1.0 * gga_x_hjs_pbe(rho, sigma; params = (; cam_omega = 0.45)) +
           1.0 * gga_c_pbe(rho, sigma)
end

function hyb_gga_xc_lc_vv10(na, nb, gaa, gab, gbb)
    return 1.0 * gga_x_hjs_pbe(na, nb, gaa, gab, gbb; params = (; cam_omega = 0.45)) +
           1.0 * gga_c_pbe(na, nb, gaa, gab, gbb)
end

export hyb_gga_xc_lc_vv10, hyb_gga_xc_lc_vv10_components, hyb_gga_xc_lc_vv10_defaults, hyb_gga_xc_lc_vv10_required

const hyb_gga_xc_lc_wpbe_components = (
    (1.0, :gga_x_wpbeh, (; cam_omega = 0.4)),
    (1.0, :gga_c_pbe, NamedTuple()),
)
const hyb_gga_xc_lc_wpbe_defaults = NamedTuple()
const hyb_gga_xc_lc_wpbe_required = ()

function hyb_gga_xc_lc_wpbe(rho, sigma)
    return 1.0 * gga_x_wpbeh(rho, sigma; params = (; cam_omega = 0.4)) +
           1.0 * gga_c_pbe(rho, sigma)
end

function hyb_gga_xc_lc_wpbe(na, nb, gaa, gab, gbb)
    return 1.0 * gga_x_wpbeh(na, nb, gaa, gab, gbb; params = (; cam_omega = 0.4)) +
           1.0 * gga_c_pbe(na, nb, gaa, gab, gbb)
end

export hyb_gga_xc_lc_wpbe, hyb_gga_xc_lc_wpbe_components, hyb_gga_xc_lc_wpbe_defaults, hyb_gga_xc_lc_wpbe_required

const hyb_gga_xc_lc_wpbe08_whs_components = (
    (1.0, :gga_x_hjs_pbe, (; cam_omega = 0.45)),
    (1.0, :gga_c_pbe, NamedTuple()),
)
const hyb_gga_xc_lc_wpbe08_whs_defaults = NamedTuple()
const hyb_gga_xc_lc_wpbe08_whs_required = ()

function hyb_gga_xc_lc_wpbe08_whs(rho, sigma)
    return 1.0 * gga_x_hjs_pbe(rho, sigma; params = (; cam_omega = 0.45)) +
           1.0 * gga_c_pbe(rho, sigma)
end

function hyb_gga_xc_lc_wpbe08_whs(na, nb, gaa, gab, gbb)
    return 1.0 * gga_x_hjs_pbe(na, nb, gaa, gab, gbb; params = (; cam_omega = 0.45)) +
           1.0 * gga_c_pbe(na, nb, gaa, gab, gbb)
end

export hyb_gga_xc_lc_wpbe08_whs, hyb_gga_xc_lc_wpbe08_whs_components, hyb_gga_xc_lc_wpbe08_whs_defaults, hyb_gga_xc_lc_wpbe08_whs_required

const hyb_gga_xc_lc_wpbe_whs_components = (
    (1.0, :gga_x_hjs_pbe, (; cam_omega = 0.4)),
    (1.0, :gga_c_pbe, NamedTuple()),
)
const hyb_gga_xc_lc_wpbe_whs_defaults = NamedTuple()
const hyb_gga_xc_lc_wpbe_whs_required = ()

function hyb_gga_xc_lc_wpbe_whs(rho, sigma)
    return 1.0 * gga_x_hjs_pbe(rho, sigma; params = (; cam_omega = 0.4)) +
           1.0 * gga_c_pbe(rho, sigma)
end

function hyb_gga_xc_lc_wpbe_whs(na, nb, gaa, gab, gbb)
    return 1.0 * gga_x_hjs_pbe(na, nb, gaa, gab, gbb; params = (; cam_omega = 0.4)) +
           1.0 * gga_c_pbe(na, nb, gaa, gab, gbb)
end

export hyb_gga_xc_lc_wpbe_whs, hyb_gga_xc_lc_wpbe_whs_components, hyb_gga_xc_lc_wpbe_whs_defaults, hyb_gga_xc_lc_wpbe_whs_required

const hyb_gga_xc_lc_wpbeh_whs_components = (
    (0.75, :gga_x_hjs_pbe, (; cam_omega = 0.4)),
    (1.0, :gga_c_pbe, NamedTuple()),
)
const hyb_gga_xc_lc_wpbeh_whs_defaults = NamedTuple()
const hyb_gga_xc_lc_wpbeh_whs_required = ()

function hyb_gga_xc_lc_wpbeh_whs(rho, sigma)
    return 0.75 * gga_x_hjs_pbe(rho, sigma; params = (; cam_omega = 0.4)) +
           1.0 * gga_c_pbe(rho, sigma)
end

function hyb_gga_xc_lc_wpbeh_whs(na, nb, gaa, gab, gbb)
    return 0.75 * gga_x_hjs_pbe(na, nb, gaa, gab, gbb; params = (; cam_omega = 0.4)) +
           1.0 * gga_c_pbe(na, nb, gaa, gab, gbb)
end

export hyb_gga_xc_lc_wpbeh_whs, hyb_gga_xc_lc_wpbeh_whs_components, hyb_gga_xc_lc_wpbeh_whs_defaults, hyb_gga_xc_lc_wpbeh_whs_required

const hyb_gga_xc_lc_wpbesol_whs_components = (
    (1.0, :gga_x_hjs_pbe_sol, (; cam_omega = 0.6)),
    (1.0, :gga_c_pbe_sol, NamedTuple()),
)
const hyb_gga_xc_lc_wpbesol_whs_defaults = NamedTuple()
const hyb_gga_xc_lc_wpbesol_whs_required = ()

function hyb_gga_xc_lc_wpbesol_whs(rho, sigma)
    return 1.0 * gga_x_hjs_pbe_sol(rho, sigma; params = (; cam_omega = 0.6)) +
           1.0 * gga_c_pbe_sol(rho, sigma)
end

function hyb_gga_xc_lc_wpbesol_whs(na, nb, gaa, gab, gbb)
    return 1.0 * gga_x_hjs_pbe_sol(na, nb, gaa, gab, gbb; params = (; cam_omega = 0.6)) +
           1.0 * gga_c_pbe_sol(na, nb, gaa, gab, gbb)
end

export hyb_gga_xc_lc_wpbesol_whs, hyb_gga_xc_lc_wpbesol_whs_components, hyb_gga_xc_lc_wpbesol_whs_defaults, hyb_gga_xc_lc_wpbesol_whs_required

const hyb_gga_xc_lcy_blyp_components = (
    (1.0, :gga_x_sfat, (; cam_omega = 0.75)),
    (1.0, :gga_c_lyp, NamedTuple()),
)
const hyb_gga_xc_lcy_blyp_defaults = NamedTuple()
const hyb_gga_xc_lcy_blyp_required = ()

function hyb_gga_xc_lcy_blyp(rho, sigma)
    return 1.0 * gga_x_sfat(rho, sigma; params = (; cam_omega = 0.75)) +
           1.0 * gga_c_lyp(rho, sigma)
end

function hyb_gga_xc_lcy_blyp(na, nb, gaa, gab, gbb)
    return 1.0 * gga_x_sfat(na, nb, gaa, gab, gbb; params = (; cam_omega = 0.75)) +
           1.0 * gga_c_lyp(na, nb, gaa, gab, gbb)
end

export hyb_gga_xc_lcy_blyp, hyb_gga_xc_lcy_blyp_components, hyb_gga_xc_lcy_blyp_defaults, hyb_gga_xc_lcy_blyp_required

const hyb_gga_xc_lcy_pbe_components = (
    (1.0, :gga_x_sfat_pbe, (; cam_omega = 0.75)),
    (1.0, :gga_c_pbe, NamedTuple()),
)
const hyb_gga_xc_lcy_pbe_defaults = NamedTuple()
const hyb_gga_xc_lcy_pbe_required = ()

function hyb_gga_xc_lcy_pbe(rho, sigma)
    return 1.0 * gga_x_sfat_pbe(rho, sigma; params = (; cam_omega = 0.75)) +
           1.0 * gga_c_pbe(rho, sigma)
end

function hyb_gga_xc_lcy_pbe(na, nb, gaa, gab, gbb)
    return 1.0 * gga_x_sfat_pbe(na, nb, gaa, gab, gbb; params = (; cam_omega = 0.75)) +
           1.0 * gga_c_pbe(na, nb, gaa, gab, gbb)
end

export hyb_gga_xc_lcy_pbe, hyb_gga_xc_lcy_pbe_components, hyb_gga_xc_lcy_pbe_defaults, hyb_gga_xc_lcy_pbe_required

const hyb_gga_xc_lrc_wpbe_components = (
    (1.0, :gga_x_hjs_pbe, (; cam_omega = 0.3)),
    (1.0, :gga_c_pbe, NamedTuple()),
)
const hyb_gga_xc_lrc_wpbe_defaults = NamedTuple()
const hyb_gga_xc_lrc_wpbe_required = ()

function hyb_gga_xc_lrc_wpbe(rho, sigma)
    return 1.0 * gga_x_hjs_pbe(rho, sigma; params = (; cam_omega = 0.3)) +
           1.0 * gga_c_pbe(rho, sigma)
end

function hyb_gga_xc_lrc_wpbe(na, nb, gaa, gab, gbb)
    return 1.0 * gga_x_hjs_pbe(na, nb, gaa, gab, gbb; params = (; cam_omega = 0.3)) +
           1.0 * gga_c_pbe(na, nb, gaa, gab, gbb)
end

export hyb_gga_xc_lrc_wpbe, hyb_gga_xc_lrc_wpbe_components, hyb_gga_xc_lrc_wpbe_defaults, hyb_gga_xc_lrc_wpbe_required

const hyb_gga_xc_lrc_wpbeh_components = (
    (0.8, :gga_x_hjs_pbe, (; cam_omega = 0.2)),
    (1.0, :gga_c_pbe, NamedTuple()),
)
const hyb_gga_xc_lrc_wpbeh_defaults = NamedTuple()
const hyb_gga_xc_lrc_wpbeh_required = ()

function hyb_gga_xc_lrc_wpbeh(rho, sigma)
    return 0.8 * gga_x_hjs_pbe(rho, sigma; params = (; cam_omega = 0.2)) +
           1.0 * gga_c_pbe(rho, sigma)
end

function hyb_gga_xc_lrc_wpbeh(na, nb, gaa, gab, gbb)
    return 0.8 * gga_x_hjs_pbe(na, nb, gaa, gab, gbb; params = (; cam_omega = 0.2)) +
           1.0 * gga_c_pbe(na, nb, gaa, gab, gbb)
end

export hyb_gga_xc_lrc_wpbeh, hyb_gga_xc_lrc_wpbeh_components, hyb_gga_xc_lrc_wpbeh_defaults, hyb_gga_xc_lrc_wpbeh_required

const hyb_gga_xc_mb3lyp_rc04_components = (
    (0.08000000000000007, :lda_x, NamedTuple()),
    (0.72, :gga_x_b88, NamedTuple()),
    (0.5383, :lda_c_rc04, NamedTuple()),
    (0.81, :gga_c_lyp, NamedTuple()),
)
const hyb_gga_xc_mb3lyp_rc04_defaults = NamedTuple()
const hyb_gga_xc_mb3lyp_rc04_required = ()

function hyb_gga_xc_mb3lyp_rc04(rho, sigma)
    return 0.08000000000000007 * lda_x(rho) +
           0.72 * gga_x_b88(rho, sigma) +
           0.5383 * lda_c_rc04(rho) +
           0.81 * gga_c_lyp(rho, sigma)
end

function hyb_gga_xc_mb3lyp_rc04(na, nb, gaa, gab, gbb)
    return 0.08000000000000007 * lda_x(na, nb) +
           0.72 * gga_x_b88(na, nb, gaa, gab, gbb) +
           0.5383 * lda_c_rc04(na, nb) +
           0.81 * gga_c_lyp(na, nb, gaa, gab, gbb)
end

export hyb_gga_xc_mb3lyp_rc04, hyb_gga_xc_mb3lyp_rc04_components, hyb_gga_xc_mb3lyp_rc04_defaults, hyb_gga_xc_mb3lyp_rc04_required

const hyb_gga_xc_mcam_b3lyp_components = (
    (0.62, :gga_x_b88, NamedTuple()),
    (0.19, :gga_x_ityh, (; cam_omega = 0.33)),
    (0.18999999999999995, :lda_c_vwn, NamedTuple()),
    (0.81, :gga_c_lyp, NamedTuple()),
)
const hyb_gga_xc_mcam_b3lyp_defaults = NamedTuple()
const hyb_gga_xc_mcam_b3lyp_required = ()

function hyb_gga_xc_mcam_b3lyp(rho, sigma)
    return 0.62 * gga_x_b88(rho, sigma) +
           0.19 * gga_x_ityh(rho, sigma; params = (; cam_omega = 0.33)) +
           0.18999999999999995 * lda_c_vwn(rho) +
           0.81 * gga_c_lyp(rho, sigma)
end

function hyb_gga_xc_mcam_b3lyp(na, nb, gaa, gab, gbb)
    return 0.62 * gga_x_b88(na, nb, gaa, gab, gbb) +
           0.19 * gga_x_ityh(na, nb, gaa, gab, gbb; params = (; cam_omega = 0.33)) +
           0.18999999999999995 * lda_c_vwn(na, nb) +
           0.81 * gga_c_lyp(na, nb, gaa, gab, gbb)
end

export hyb_gga_xc_mcam_b3lyp, hyb_gga_xc_mcam_b3lyp_components, hyb_gga_xc_mcam_b3lyp_defaults, hyb_gga_xc_mcam_b3lyp_required

const hyb_gga_xc_mpw1k_components = (
    (0.5720000000000001, :gga_x_mpw91, NamedTuple()),
    (1.0, :gga_c_pw91, NamedTuple()),
)
const hyb_gga_xc_mpw1k_defaults = NamedTuple()
const hyb_gga_xc_mpw1k_required = ()

function hyb_gga_xc_mpw1k(rho, sigma)
    return 0.5720000000000001 * gga_x_mpw91(rho, sigma) +
           1.0 * gga_c_pw91(rho, sigma)
end

function hyb_gga_xc_mpw1k(na, nb, gaa, gab, gbb)
    return 0.5720000000000001 * gga_x_mpw91(na, nb, gaa, gab, gbb) +
           1.0 * gga_c_pw91(na, nb, gaa, gab, gbb)
end

export hyb_gga_xc_mpw1k, hyb_gga_xc_mpw1k_components, hyb_gga_xc_mpw1k_defaults, hyb_gga_xc_mpw1k_required

const hyb_gga_xc_mpw1lyp_components = (
    (0.75, :gga_x_mpw91, NamedTuple()),
    (1.0, :gga_c_lyp, NamedTuple()),
)
const hyb_gga_xc_mpw1lyp_defaults = NamedTuple()
const hyb_gga_xc_mpw1lyp_required = ()

function hyb_gga_xc_mpw1lyp(rho, sigma)
    return 0.75 * gga_x_mpw91(rho, sigma) +
           1.0 * gga_c_lyp(rho, sigma)
end

function hyb_gga_xc_mpw1lyp(na, nb, gaa, gab, gbb)
    return 0.75 * gga_x_mpw91(na, nb, gaa, gab, gbb) +
           1.0 * gga_c_lyp(na, nb, gaa, gab, gbb)
end

export hyb_gga_xc_mpw1lyp, hyb_gga_xc_mpw1lyp_components, hyb_gga_xc_mpw1lyp_defaults, hyb_gga_xc_mpw1lyp_required

const hyb_gga_xc_mpw1pbe_components = (
    (0.75, :gga_x_mpw91, NamedTuple()),
    (1.0, :gga_c_pbe, NamedTuple()),
)
const hyb_gga_xc_mpw1pbe_defaults = NamedTuple()
const hyb_gga_xc_mpw1pbe_required = ()

function hyb_gga_xc_mpw1pbe(rho, sigma)
    return 0.75 * gga_x_mpw91(rho, sigma) +
           1.0 * gga_c_pbe(rho, sigma)
end

function hyb_gga_xc_mpw1pbe(na, nb, gaa, gab, gbb)
    return 0.75 * gga_x_mpw91(na, nb, gaa, gab, gbb) +
           1.0 * gga_c_pbe(na, nb, gaa, gab, gbb)
end

export hyb_gga_xc_mpw1pbe, hyb_gga_xc_mpw1pbe_components, hyb_gga_xc_mpw1pbe_defaults, hyb_gga_xc_mpw1pbe_required

const hyb_gga_xc_mpw1pw_components = (
    (0.75, :gga_x_mpw91, NamedTuple()),
    (1.0, :gga_c_pw91, NamedTuple()),
)
const hyb_gga_xc_mpw1pw_defaults = NamedTuple()
const hyb_gga_xc_mpw1pw_required = ()

function hyb_gga_xc_mpw1pw(rho, sigma)
    return 0.75 * gga_x_mpw91(rho, sigma) +
           1.0 * gga_c_pw91(rho, sigma)
end

function hyb_gga_xc_mpw1pw(na, nb, gaa, gab, gbb)
    return 0.75 * gga_x_mpw91(na, nb, gaa, gab, gbb) +
           1.0 * gga_c_pw91(na, nb, gaa, gab, gbb)
end

export hyb_gga_xc_mpw1pw, hyb_gga_xc_mpw1pw_components, hyb_gga_xc_mpw1pw_defaults, hyb_gga_xc_mpw1pw_required

const hyb_gga_xc_mpw3lyp_components = (
    (0.07300000000000006, :lda_x, NamedTuple()),
    (0.709, :gga_x_mpw91, NamedTuple()),
    (0.129, :lda_c_vwn_rpa, NamedTuple()),
    (0.871, :gga_c_lyp, NamedTuple()),
)
const hyb_gga_xc_mpw3lyp_defaults = NamedTuple()
const hyb_gga_xc_mpw3lyp_required = ()

function hyb_gga_xc_mpw3lyp(rho, sigma)
    return 0.07300000000000006 * lda_x(rho) +
           0.709 * gga_x_mpw91(rho, sigma) +
           0.129 * lda_c_vwn_rpa(rho) +
           0.871 * gga_c_lyp(rho, sigma)
end

function hyb_gga_xc_mpw3lyp(na, nb, gaa, gab, gbb)
    return 0.07300000000000006 * lda_x(na, nb) +
           0.709 * gga_x_mpw91(na, nb, gaa, gab, gbb) +
           0.129 * lda_c_vwn_rpa(na, nb) +
           0.871 * gga_c_lyp(na, nb, gaa, gab, gbb)
end

export hyb_gga_xc_mpw3lyp, hyb_gga_xc_mpw3lyp_components, hyb_gga_xc_mpw3lyp_defaults, hyb_gga_xc_mpw3lyp_required

const hyb_gga_xc_mpw3pw_components = (
    (0.08000000000000007, :lda_x, NamedTuple()),
    (0.72, :gga_x_mpw91, NamedTuple()),
    (0.18999999999999995, :lda_c_vwn_rpa, NamedTuple()),
    (0.81, :gga_c_pw91, NamedTuple()),
)
const hyb_gga_xc_mpw3pw_defaults = NamedTuple()
const hyb_gga_xc_mpw3pw_required = ()

function hyb_gga_xc_mpw3pw(rho, sigma)
    return 0.08000000000000007 * lda_x(rho) +
           0.72 * gga_x_mpw91(rho, sigma) +
           0.18999999999999995 * lda_c_vwn_rpa(rho) +
           0.81 * gga_c_pw91(rho, sigma)
end

function hyb_gga_xc_mpw3pw(na, nb, gaa, gab, gbb)
    return 0.08000000000000007 * lda_x(na, nb) +
           0.72 * gga_x_mpw91(na, nb, gaa, gab, gbb) +
           0.18999999999999995 * lda_c_vwn_rpa(na, nb) +
           0.81 * gga_c_pw91(na, nb, gaa, gab, gbb)
end

export hyb_gga_xc_mpw3pw, hyb_gga_xc_mpw3pw_components, hyb_gga_xc_mpw3pw_defaults, hyb_gga_xc_mpw3pw_required

const hyb_gga_xc_mpwlyp1m_components = (
    (0.95, :gga_x_mpw91, NamedTuple()),
    (1.0, :gga_c_lyp, NamedTuple()),
)
const hyb_gga_xc_mpwlyp1m_defaults = NamedTuple()
const hyb_gga_xc_mpwlyp1m_required = ()

function hyb_gga_xc_mpwlyp1m(rho, sigma)
    return 0.95 * gga_x_mpw91(rho, sigma) +
           1.0 * gga_c_lyp(rho, sigma)
end

function hyb_gga_xc_mpwlyp1m(na, nb, gaa, gab, gbb)
    return 0.95 * gga_x_mpw91(na, nb, gaa, gab, gbb) +
           1.0 * gga_c_lyp(na, nb, gaa, gab, gbb)
end

export hyb_gga_xc_mpwlyp1m, hyb_gga_xc_mpwlyp1m_components, hyb_gga_xc_mpwlyp1m_defaults, hyb_gga_xc_mpwlyp1m_required

const hyb_gga_xc_o3lyp_components = (
    (0.07100691700000006, :lda_x, NamedTuple()),
    (0.8133, :gga_x_optx, NamedTuple()),
    (0.18999999999999995, :lda_c_vwn, NamedTuple()),
    (0.81, :gga_c_lyp, NamedTuple()),
)
const hyb_gga_xc_o3lyp_defaults = NamedTuple()
const hyb_gga_xc_o3lyp_required = ()

function hyb_gga_xc_o3lyp(rho, sigma)
    return 0.07100691700000006 * lda_x(rho) +
           0.8133 * gga_x_optx(rho, sigma) +
           0.18999999999999995 * lda_c_vwn(rho) +
           0.81 * gga_c_lyp(rho, sigma)
end

function hyb_gga_xc_o3lyp(na, nb, gaa, gab, gbb)
    return 0.07100691700000006 * lda_x(na, nb) +
           0.8133 * gga_x_optx(na, nb, gaa, gab, gbb) +
           0.18999999999999995 * lda_c_vwn(na, nb) +
           0.81 * gga_c_lyp(na, nb, gaa, gab, gbb)
end

export hyb_gga_xc_o3lyp, hyb_gga_xc_o3lyp_components, hyb_gga_xc_o3lyp_defaults, hyb_gga_xc_o3lyp_required

const hyb_gga_xc_pbe0_13_components = (
    (0.6666666666666667, :gga_x_pbe, NamedTuple()),
    (1.0, :gga_c_pbe, NamedTuple()),
)
const hyb_gga_xc_pbe0_13_defaults = NamedTuple()
const hyb_gga_xc_pbe0_13_required = ()

function hyb_gga_xc_pbe0_13(rho, sigma)
    return 0.6666666666666667 * gga_x_pbe(rho, sigma) +
           1.0 * gga_c_pbe(rho, sigma)
end

function hyb_gga_xc_pbe0_13(na, nb, gaa, gab, gbb)
    return 0.6666666666666667 * gga_x_pbe(na, nb, gaa, gab, gbb) +
           1.0 * gga_c_pbe(na, nb, gaa, gab, gbb)
end

export hyb_gga_xc_pbe0_13, hyb_gga_xc_pbe0_13_components, hyb_gga_xc_pbe0_13_defaults, hyb_gga_xc_pbe0_13_required

const hyb_gga_xc_pbe38_components = (
    (0.625, :gga_x_pbe, NamedTuple()),
    (1.0, :gga_c_pbe, NamedTuple()),
)
const hyb_gga_xc_pbe38_defaults = NamedTuple()
const hyb_gga_xc_pbe38_required = ()

function hyb_gga_xc_pbe38(rho, sigma)
    return 0.625 * gga_x_pbe(rho, sigma) +
           1.0 * gga_c_pbe(rho, sigma)
end

function hyb_gga_xc_pbe38(na, nb, gaa, gab, gbb)
    return 0.625 * gga_x_pbe(na, nb, gaa, gab, gbb) +
           1.0 * gga_c_pbe(na, nb, gaa, gab, gbb)
end

export hyb_gga_xc_pbe38, hyb_gga_xc_pbe38_components, hyb_gga_xc_pbe38_defaults, hyb_gga_xc_pbe38_required

const hyb_gga_xc_pbe50_components = (
    (0.5, :gga_x_pbe, NamedTuple()),
    (1.0, :gga_c_pbe, NamedTuple()),
)
const hyb_gga_xc_pbe50_defaults = NamedTuple()
const hyb_gga_xc_pbe50_required = ()

function hyb_gga_xc_pbe50(rho, sigma)
    return 0.5 * gga_x_pbe(rho, sigma) +
           1.0 * gga_c_pbe(rho, sigma)
end

function hyb_gga_xc_pbe50(na, nb, gaa, gab, gbb)
    return 0.5 * gga_x_pbe(na, nb, gaa, gab, gbb) +
           1.0 * gga_c_pbe(na, nb, gaa, gab, gbb)
end

export hyb_gga_xc_pbe50, hyb_gga_xc_pbe50_components, hyb_gga_xc_pbe50_defaults, hyb_gga_xc_pbe50_required

const hyb_gga_xc_pbe_2x_components = (
    (0.43999999999999995, :gga_x_pbe, NamedTuple()),
    (1.0, :gga_c_pbe, NamedTuple()),
)
const hyb_gga_xc_pbe_2x_defaults = NamedTuple()
const hyb_gga_xc_pbe_2x_required = ()

function hyb_gga_xc_pbe_2x(rho, sigma)
    return 0.43999999999999995 * gga_x_pbe(rho, sigma) +
           1.0 * gga_c_pbe(rho, sigma)
end

function hyb_gga_xc_pbe_2x(na, nb, gaa, gab, gbb)
    return 0.43999999999999995 * gga_x_pbe(na, nb, gaa, gab, gbb) +
           1.0 * gga_c_pbe(na, nb, gaa, gab, gbb)
end

export hyb_gga_xc_pbe_2x, hyb_gga_xc_pbe_2x_components, hyb_gga_xc_pbe_2x_defaults, hyb_gga_xc_pbe_2x_required

const hyb_gga_xc_pbe_mol0_components = (
    (0.75, :gga_x_pbe_mol, NamedTuple()),
    (1.0, :gga_c_pbe_mol, NamedTuple()),
)
const hyb_gga_xc_pbe_mol0_defaults = NamedTuple()
const hyb_gga_xc_pbe_mol0_required = ()

function hyb_gga_xc_pbe_mol0(rho, sigma)
    return 0.75 * gga_x_pbe_mol(rho, sigma) +
           1.0 * gga_c_pbe_mol(rho, sigma)
end

function hyb_gga_xc_pbe_mol0(na, nb, gaa, gab, gbb)
    return 0.75 * gga_x_pbe_mol(na, nb, gaa, gab, gbb) +
           1.0 * gga_c_pbe_mol(na, nb, gaa, gab, gbb)
end

export hyb_gga_xc_pbe_mol0, hyb_gga_xc_pbe_mol0_components, hyb_gga_xc_pbe_mol0_defaults, hyb_gga_xc_pbe_mol0_required

const hyb_gga_xc_pbe_molb0_components = (
    (0.75, :gga_x_pbe_mol, NamedTuple()),
    (1.0, :gga_c_pbe, (; params_a_beta = 0.06288)),
)
const hyb_gga_xc_pbe_molb0_defaults = NamedTuple()
const hyb_gga_xc_pbe_molb0_required = ()

function hyb_gga_xc_pbe_molb0(rho, sigma)
    return 0.75 * gga_x_pbe_mol(rho, sigma) +
           1.0 * gga_c_pbe(rho, sigma; params = (; params_a_beta = 0.06288))
end

function hyb_gga_xc_pbe_molb0(na, nb, gaa, gab, gbb)
    return 0.75 * gga_x_pbe_mol(na, nb, gaa, gab, gbb) +
           1.0 * gga_c_pbe(na, nb, gaa, gab, gbb; params = (; params_a_beta = 0.06288))
end

export hyb_gga_xc_pbe_molb0, hyb_gga_xc_pbe_molb0_components, hyb_gga_xc_pbe_molb0_defaults, hyb_gga_xc_pbe_molb0_required

const hyb_gga_xc_pbe_sol0_components = (
    (0.75, :gga_x_pbe_sol, NamedTuple()),
    (1.0, :gga_c_pbe_sol, NamedTuple()),
)
const hyb_gga_xc_pbe_sol0_defaults = NamedTuple()
const hyb_gga_xc_pbe_sol0_required = ()

function hyb_gga_xc_pbe_sol0(rho, sigma)
    return 0.75 * gga_x_pbe_sol(rho, sigma) +
           1.0 * gga_c_pbe_sol(rho, sigma)
end

function hyb_gga_xc_pbe_sol0(na, nb, gaa, gab, gbb)
    return 0.75 * gga_x_pbe_sol(na, nb, gaa, gab, gbb) +
           1.0 * gga_c_pbe_sol(na, nb, gaa, gab, gbb)
end

export hyb_gga_xc_pbe_sol0, hyb_gga_xc_pbe_sol0_components, hyb_gga_xc_pbe_sol0_defaults, hyb_gga_xc_pbe_sol0_required

const hyb_gga_xc_pbeb0_components = (
    (0.75, :gga_x_pbe, NamedTuple()),
    (1.0, :gga_c_pbe, (; params_a_beta = 0.050044)),
)
const hyb_gga_xc_pbeb0_defaults = NamedTuple()
const hyb_gga_xc_pbeb0_required = ()

function hyb_gga_xc_pbeb0(rho, sigma)
    return 0.75 * gga_x_pbe(rho, sigma) +
           1.0 * gga_c_pbe(rho, sigma; params = (; params_a_beta = 0.050044))
end

function hyb_gga_xc_pbeb0(na, nb, gaa, gab, gbb)
    return 0.75 * gga_x_pbe(na, nb, gaa, gab, gbb) +
           1.0 * gga_c_pbe(na, nb, gaa, gab, gbb; params = (; params_a_beta = 0.050044))
end

export hyb_gga_xc_pbeb0, hyb_gga_xc_pbeb0_components, hyb_gga_xc_pbeb0_defaults, hyb_gga_xc_pbeb0_required

const hyb_gga_xc_pbeh_components = (
    (0.75, :gga_x_pbe, NamedTuple()),
    (1.0, :gga_c_pbe, NamedTuple()),
)
const hyb_gga_xc_pbeh_defaults = NamedTuple()
const hyb_gga_xc_pbeh_required = ()

function hyb_gga_xc_pbeh(rho, sigma)
    return 0.75 * gga_x_pbe(rho, sigma) +
           1.0 * gga_c_pbe(rho, sigma)
end

function hyb_gga_xc_pbeh(na, nb, gaa, gab, gbb)
    return 0.75 * gga_x_pbe(na, nb, gaa, gab, gbb) +
           1.0 * gga_c_pbe(na, nb, gaa, gab, gbb)
end

export hyb_gga_xc_pbeh, hyb_gga_xc_pbeh_components, hyb_gga_xc_pbeh_defaults, hyb_gga_xc_pbeh_required

const hyb_gga_xc_qtp17_components = (
    (0.38, :lda_x, NamedTuple()),
    (0.19999999999999996, :lda_c_vwn_rpa, NamedTuple()),
    (0.8, :gga_c_lyp, NamedTuple()),
)
const hyb_gga_xc_qtp17_defaults = NamedTuple()
const hyb_gga_xc_qtp17_required = ()

function hyb_gga_xc_qtp17(rho, sigma)
    return 0.38 * lda_x(rho) +
           0.19999999999999996 * lda_c_vwn_rpa(rho) +
           0.8 * gga_c_lyp(rho, sigma)
end

function hyb_gga_xc_qtp17(na, nb, gaa, gab, gbb)
    return 0.38 * lda_x(na, nb) +
           0.19999999999999996 * lda_c_vwn_rpa(na, nb) +
           0.8 * gga_c_lyp(na, nb, gaa, gab, gbb)
end

export hyb_gga_xc_qtp17, hyb_gga_xc_qtp17_components, hyb_gga_xc_qtp17_defaults, hyb_gga_xc_qtp17_required

const hyb_gga_xc_rcam_b3lyp_components = (
    (-0.13590000000000002, :lda_x, NamedTuple()),
    (0.002589999999999981, :gga_x_b88, NamedTuple()),
    (0.94979, :gga_x_ityh, (; cam_omega = 0.33)),
    (1.0, :gga_c_lyp, NamedTuple()),
)
const hyb_gga_xc_rcam_b3lyp_defaults = NamedTuple()
const hyb_gga_xc_rcam_b3lyp_required = ()

function hyb_gga_xc_rcam_b3lyp(rho, sigma)
    return -0.13590000000000002 * lda_x(rho) +
           0.002589999999999981 * gga_x_b88(rho, sigma) +
           0.94979 * gga_x_ityh(rho, sigma; params = (; cam_omega = 0.33)) +
           1.0 * gga_c_lyp(rho, sigma)
end

function hyb_gga_xc_rcam_b3lyp(na, nb, gaa, gab, gbb)
    return -0.13590000000000002 * lda_x(na, nb) +
           0.002589999999999981 * gga_x_b88(na, nb, gaa, gab, gbb) +
           0.94979 * gga_x_ityh(na, nb, gaa, gab, gbb; params = (; cam_omega = 0.33)) +
           1.0 * gga_c_lyp(na, nb, gaa, gab, gbb)
end

export hyb_gga_xc_rcam_b3lyp, hyb_gga_xc_rcam_b3lyp_components, hyb_gga_xc_rcam_b3lyp_defaults, hyb_gga_xc_rcam_b3lyp_required

const hyb_gga_xc_relpbe0_components = (
    (0.768813450922013, :gga_x_pbe, (; params_a_kappa = 1.009008835630956, params_a_mu = 0.04102242166916949)),
    (0.39051822098129085, :gga_c_pbe, (; params_a_beta = 0.06791249476107648)),
    (0.2189635580374183, :lda_c_pw_mod, NamedTuple()),
)
const hyb_gga_xc_relpbe0_defaults = NamedTuple()
const hyb_gga_xc_relpbe0_required = ()

function hyb_gga_xc_relpbe0(rho, sigma)
    return 0.768813450922013 * gga_x_pbe(rho, sigma; params = (; params_a_kappa = 1.009008835630956, params_a_mu = 0.04102242166916949)) +
           0.39051822098129085 * gga_c_pbe(rho, sigma; params = (; params_a_beta = 0.06791249476107648)) +
           0.2189635580374183 * lda_c_pw_mod(rho)
end

function hyb_gga_xc_relpbe0(na, nb, gaa, gab, gbb)
    return 0.768813450922013 * gga_x_pbe(na, nb, gaa, gab, gbb; params = (; params_a_kappa = 1.009008835630956, params_a_mu = 0.04102242166916949)) +
           0.39051822098129085 * gga_c_pbe(na, nb, gaa, gab, gbb; params = (; params_a_beta = 0.06791249476107648)) +
           0.2189635580374183 * lda_c_pw_mod(na, nb)
end

export hyb_gga_xc_relpbe0, hyb_gga_xc_relpbe0_components, hyb_gga_xc_relpbe0_defaults, hyb_gga_xc_relpbe0_required

const hyb_gga_xc_revb3lyp_components = (
    (0.13, :lda_x, NamedTuple()),
    (0.67, :gga_x_b88, NamedTuple()),
    (0.16000000000000003, :lda_c_vwn_rpa, NamedTuple()),
    (0.84, :gga_c_lyp, NamedTuple()),
)
const hyb_gga_xc_revb3lyp_defaults = NamedTuple()
const hyb_gga_xc_revb3lyp_required = ()

function hyb_gga_xc_revb3lyp(rho, sigma)
    return 0.13 * lda_x(rho) +
           0.67 * gga_x_b88(rho, sigma) +
           0.16000000000000003 * lda_c_vwn_rpa(rho) +
           0.84 * gga_c_lyp(rho, sigma)
end

function hyb_gga_xc_revb3lyp(na, nb, gaa, gab, gbb)
    return 0.13 * lda_x(na, nb) +
           0.67 * gga_x_b88(na, nb, gaa, gab, gbb) +
           0.16000000000000003 * lda_c_vwn_rpa(na, nb) +
           0.84 * gga_c_lyp(na, nb, gaa, gab, gbb)
end

export hyb_gga_xc_revb3lyp, hyb_gga_xc_revb3lyp_components, hyb_gga_xc_revb3lyp_defaults, hyb_gga_xc_revb3lyp_required

const hyb_gga_xc_tuned_cam_b3lyp_components = (
    (0.0, :gga_x_b88, NamedTuple()),
    (0.9201, :gga_x_ityh, (; cam_omega = 0.15)),
    (0.18999999999999995, :lda_c_vwn, NamedTuple()),
    (0.81, :gga_c_lyp, NamedTuple()),
)
const hyb_gga_xc_tuned_cam_b3lyp_defaults = NamedTuple()
const hyb_gga_xc_tuned_cam_b3lyp_required = ()

function hyb_gga_xc_tuned_cam_b3lyp(rho, sigma)
    return 0.0 * gga_x_b88(rho, sigma) +
           0.9201 * gga_x_ityh(rho, sigma; params = (; cam_omega = 0.15)) +
           0.18999999999999995 * lda_c_vwn(rho) +
           0.81 * gga_c_lyp(rho, sigma)
end

function hyb_gga_xc_tuned_cam_b3lyp(na, nb, gaa, gab, gbb)
    return 0.0 * gga_x_b88(na, nb, gaa, gab, gbb) +
           0.9201 * gga_x_ityh(na, nb, gaa, gab, gbb; params = (; cam_omega = 0.15)) +
           0.18999999999999995 * lda_c_vwn(na, nb) +
           0.81 * gga_c_lyp(na, nb, gaa, gab, gbb)
end

export hyb_gga_xc_tuned_cam_b3lyp, hyb_gga_xc_tuned_cam_b3lyp_components, hyb_gga_xc_tuned_cam_b3lyp_defaults, hyb_gga_xc_tuned_cam_b3lyp_required

const hyb_gga_xc_wc04_components = (
    (-0.9998, :lda_x, NamedTuple()),
    (0.9999, :gga_x_b88, NamedTuple()),
    (0.9998, :lda_c_vwn_rpa, NamedTuple()),
    (0.0001, :gga_c_lyp, NamedTuple()),
)
const hyb_gga_xc_wc04_defaults = NamedTuple()
const hyb_gga_xc_wc04_required = ()

function hyb_gga_xc_wc04(rho, sigma)
    return -0.9998 * lda_x(rho) +
           0.9999 * gga_x_b88(rho, sigma) +
           0.9998 * lda_c_vwn_rpa(rho) +
           0.0001 * gga_c_lyp(rho, sigma)
end

function hyb_gga_xc_wc04(na, nb, gaa, gab, gbb)
    return -0.9998 * lda_x(na, nb) +
           0.9999 * gga_x_b88(na, nb, gaa, gab, gbb) +
           0.9998 * lda_c_vwn_rpa(na, nb) +
           0.0001 * gga_c_lyp(na, nb, gaa, gab, gbb)
end

export hyb_gga_xc_wc04, hyb_gga_xc_wc04_components, hyb_gga_xc_wc04_defaults, hyb_gga_xc_wc04_required

const hyb_gga_xc_whpbe0_components = (
    (0.25, :gga_x_hjs_pbe, (; cam_omega = 0.2)),
    (1.0, :gga_c_pbe, NamedTuple()),
)
const hyb_gga_xc_whpbe0_defaults = NamedTuple()
const hyb_gga_xc_whpbe0_required = ()

function hyb_gga_xc_whpbe0(rho, sigma)
    return 0.25 * gga_x_hjs_pbe(rho, sigma; params = (; cam_omega = 0.2)) +
           1.0 * gga_c_pbe(rho, sigma)
end

function hyb_gga_xc_whpbe0(na, nb, gaa, gab, gbb)
    return 0.25 * gga_x_hjs_pbe(na, nb, gaa, gab, gbb; params = (; cam_omega = 0.2)) +
           1.0 * gga_c_pbe(na, nb, gaa, gab, gbb)
end

export hyb_gga_xc_whpbe0, hyb_gga_xc_whpbe0_components, hyb_gga_xc_whpbe0_defaults, hyb_gga_xc_whpbe0_required

const hyb_gga_xc_wp04_components = (
    (0.03849999999999998, :lda_x, NamedTuple()),
    (0.9614, :gga_x_b88, NamedTuple()),
    (0.9998, :lda_c_vwn_rpa, NamedTuple()),
    (0.0001, :gga_c_lyp, NamedTuple()),
)
const hyb_gga_xc_wp04_defaults = NamedTuple()
const hyb_gga_xc_wp04_required = ()

function hyb_gga_xc_wp04(rho, sigma)
    return 0.03849999999999998 * lda_x(rho) +
           0.9614 * gga_x_b88(rho, sigma) +
           0.9998 * lda_c_vwn_rpa(rho) +
           0.0001 * gga_c_lyp(rho, sigma)
end

function hyb_gga_xc_wp04(na, nb, gaa, gab, gbb)
    return 0.03849999999999998 * lda_x(na, nb) +
           0.9614 * gga_x_b88(na, nb, gaa, gab, gbb) +
           0.9998 * lda_c_vwn_rpa(na, nb) +
           0.0001 * gga_c_lyp(na, nb, gaa, gab, gbb)
end

export hyb_gga_xc_wp04, hyb_gga_xc_wp04_components, hyb_gga_xc_wp04_defaults, hyb_gga_xc_wp04_required

const hyb_gga_xc_x3lyp_components = (
    (0.07300000000000006, :lda_x, NamedTuple()),
    (0.542385, :gga_x_b88, NamedTuple()),
    (0.16661499999999999, :gga_x_pw91, NamedTuple()),
    (0.129, :lda_c_vwn_rpa, NamedTuple()),
    (0.871, :gga_c_lyp, NamedTuple()),
)
const hyb_gga_xc_x3lyp_defaults = NamedTuple()
const hyb_gga_xc_x3lyp_required = ()

function hyb_gga_xc_x3lyp(rho, sigma)
    return 0.07300000000000006 * lda_x(rho) +
           0.542385 * gga_x_b88(rho, sigma) +
           0.16661499999999999 * gga_x_pw91(rho, sigma) +
           0.129 * lda_c_vwn_rpa(rho) +
           0.871 * gga_c_lyp(rho, sigma)
end

function hyb_gga_xc_x3lyp(na, nb, gaa, gab, gbb)
    return 0.07300000000000006 * lda_x(na, nb) +
           0.542385 * gga_x_b88(na, nb, gaa, gab, gbb) +
           0.16661499999999999 * gga_x_pw91(na, nb, gaa, gab, gbb) +
           0.129 * lda_c_vwn_rpa(na, nb) +
           0.871 * gga_c_lyp(na, nb, gaa, gab, gbb)
end

export hyb_gga_xc_x3lyp, hyb_gga_xc_x3lyp_components, hyb_gga_xc_x3lyp_defaults, hyb_gga_xc_x3lyp_required

const hyb_lda_xc_b93_components = (
    (0.5, :lda_x, NamedTuple()),
    (0.5, :lda_c_pw_mod, NamedTuple()),
)
const hyb_lda_xc_b93_defaults = NamedTuple()
const hyb_lda_xc_b93_required = ()

function hyb_lda_xc_b93(rho)
    return 0.5 * lda_x(rho) +
           0.5 * lda_c_pw_mod(rho)
end

function hyb_lda_xc_b93(na, nb)
    return 0.5 * lda_x(na, nb) +
           0.5 * lda_c_pw_mod(na, nb)
end

export hyb_lda_xc_b93, hyb_lda_xc_b93_components, hyb_lda_xc_b93_defaults, hyb_lda_xc_b93_required

const hyb_lda_xc_cam_lda0_components = (
    (0.5, :lda_x, NamedTuple()),
    (0.25, :lda_x_erf, (; cam_omega = 0.3333333333333333)),
    (1.0, :lda_c_pw_mod, NamedTuple()),
)
const hyb_lda_xc_cam_lda0_defaults = NamedTuple()
const hyb_lda_xc_cam_lda0_required = ()

function hyb_lda_xc_cam_lda0(rho)
    return 0.5 * lda_x(rho) +
           0.25 * lda_x_erf(rho; params = (; cam_omega = 0.3333333333333333)) +
           1.0 * lda_c_pw_mod(rho)
end

function hyb_lda_xc_cam_lda0(na, nb)
    return 0.5 * lda_x(na, nb) +
           0.25 * lda_x_erf(na, nb; params = (; cam_omega = 0.3333333333333333)) +
           1.0 * lda_c_pw_mod(na, nb)
end

export hyb_lda_xc_cam_lda0, hyb_lda_xc_cam_lda0_components, hyb_lda_xc_cam_lda0_defaults, hyb_lda_xc_cam_lda0_required

const hyb_lda_xc_lda0_components = (
    (0.75, :lda_x, NamedTuple()),
    (0.75, :lda_c_pw_mod, NamedTuple()),
)
const hyb_lda_xc_lda0_defaults = NamedTuple()
const hyb_lda_xc_lda0_required = ()

function hyb_lda_xc_lda0(rho)
    return 0.75 * lda_x(rho) +
           0.75 * lda_c_pw_mod(rho)
end

function hyb_lda_xc_lda0(na, nb)
    return 0.75 * lda_x(na, nb) +
           0.75 * lda_c_pw_mod(na, nb)
end

export hyb_lda_xc_lda0, hyb_lda_xc_lda0_components, hyb_lda_xc_lda0_defaults, hyb_lda_xc_lda0_required

const hyb_mgga_x_ms2h_components = (
    (0.91, :mgga_x_ms2, NamedTuple()),
)
const hyb_mgga_x_ms2h_defaults = NamedTuple()
const hyb_mgga_x_ms2h_required = ()

function hyb_mgga_x_ms2h(rho, sigma, lapl, tau)
    return 0.91 * mgga_x_ms2(rho, sigma, lapl, tau)
end

function hyb_mgga_x_ms2h(na, nb, gaa, gab, gbb, la, lb, ta, tb)
    return 0.91 * mgga_x_ms2(na, nb, gaa, gab, gbb, la, lb, ta, tb)
end

export hyb_mgga_x_ms2h, hyb_mgga_x_ms2h_components, hyb_mgga_x_ms2h_defaults, hyb_mgga_x_ms2h_required

const hyb_mgga_x_mvsh_components = (
    (0.75, :mgga_x_mvs, NamedTuple()),
)
const hyb_mgga_x_mvsh_defaults = NamedTuple()
const hyb_mgga_x_mvsh_required = ()

function hyb_mgga_x_mvsh(rho, sigma, lapl, tau)
    return 0.75 * mgga_x_mvs(rho, sigma, lapl, tau)
end

function hyb_mgga_x_mvsh(na, nb, gaa, gab, gbb, la, lb, ta, tb)
    return 0.75 * mgga_x_mvs(na, nb, gaa, gab, gbb, la, lb, ta, tb)
end

export hyb_mgga_x_mvsh, hyb_mgga_x_mvsh_components, hyb_mgga_x_mvsh_defaults, hyb_mgga_x_mvsh_required

const hyb_mgga_x_revscan0_components = (
    (0.75, :mgga_x_revscan, NamedTuple()),
)
const hyb_mgga_x_revscan0_defaults = NamedTuple()
const hyb_mgga_x_revscan0_required = ()

function hyb_mgga_x_revscan0(rho, sigma, lapl, tau)
    return 0.75 * mgga_x_revscan(rho, sigma, lapl, tau)
end

function hyb_mgga_x_revscan0(na, nb, gaa, gab, gbb, la, lb, ta, tb)
    return 0.75 * mgga_x_revscan(na, nb, gaa, gab, gbb, la, lb, ta, tb)
end

export hyb_mgga_x_revscan0, hyb_mgga_x_revscan0_components, hyb_mgga_x_revscan0_defaults, hyb_mgga_x_revscan0_required

const hyb_mgga_x_scan0_components = (
    (0.75, :mgga_x_scan, NamedTuple()),
)
const hyb_mgga_x_scan0_defaults = NamedTuple()
const hyb_mgga_x_scan0_required = ()

function hyb_mgga_x_scan0(rho, sigma, lapl, tau)
    return 0.75 * mgga_x_scan(rho, sigma, lapl, tau)
end

function hyb_mgga_x_scan0(na, nb, gaa, gab, gbb, la, lb, ta, tb)
    return 0.75 * mgga_x_scan(na, nb, gaa, gab, gbb, la, lb, ta, tb)
end

export hyb_mgga_x_scan0, hyb_mgga_x_scan0_components, hyb_mgga_x_scan0_defaults, hyb_mgga_x_scan0_required

const hyb_mgga_xc_b0kcis_components = (
    (0.75, :gga_x_b88, NamedTuple()),
    (1.0, :mgga_c_kcis, NamedTuple()),
)
const hyb_mgga_xc_b0kcis_defaults = NamedTuple()
const hyb_mgga_xc_b0kcis_required = ()

function hyb_mgga_xc_b0kcis(rho, sigma, lapl, tau)
    return 0.75 * gga_x_b88(rho, sigma) +
           1.0 * mgga_c_kcis(rho, sigma, lapl, tau)
end

function hyb_mgga_xc_b0kcis(na, nb, gaa, gab, gbb, la, lb, ta, tb)
    return 0.75 * gga_x_b88(na, nb, gaa, gab, gbb) +
           1.0 * mgga_c_kcis(na, nb, gaa, gab, gbb, la, lb, ta, tb)
end

export hyb_mgga_xc_b0kcis, hyb_mgga_xc_b0kcis_components, hyb_mgga_xc_b0kcis_defaults, hyb_mgga_xc_b0kcis_required

const hyb_mgga_xc_b86b95_components = (
    (0.72, :gga_x_b86, NamedTuple()),
    (1.0, :mgga_c_bc95, NamedTuple()),
)
const hyb_mgga_xc_b86b95_defaults = NamedTuple()
const hyb_mgga_xc_b86b95_required = ()

function hyb_mgga_xc_b86b95(rho, sigma, lapl, tau)
    return 0.72 * gga_x_b86(rho, sigma) +
           1.0 * mgga_c_bc95(rho, sigma, lapl, tau)
end

function hyb_mgga_xc_b86b95(na, nb, gaa, gab, gbb, la, lb, ta, tb)
    return 0.72 * gga_x_b86(na, nb, gaa, gab, gbb) +
           1.0 * mgga_c_bc95(na, nb, gaa, gab, gbb, la, lb, ta, tb)
end

export hyb_mgga_xc_b86b95, hyb_mgga_xc_b86b95_components, hyb_mgga_xc_b86b95_defaults, hyb_mgga_xc_b86b95_required

const hyb_mgga_xc_b88b95_components = (
    (0.72, :gga_x_b88, NamedTuple()),
    (1.0, :mgga_c_bc95, NamedTuple()),
)
const hyb_mgga_xc_b88b95_defaults = NamedTuple()
const hyb_mgga_xc_b88b95_required = ()

function hyb_mgga_xc_b88b95(rho, sigma, lapl, tau)
    return 0.72 * gga_x_b88(rho, sigma) +
           1.0 * mgga_c_bc95(rho, sigma, lapl, tau)
end

function hyb_mgga_xc_b88b95(na, nb, gaa, gab, gbb, la, lb, ta, tb)
    return 0.72 * gga_x_b88(na, nb, gaa, gab, gbb) +
           1.0 * mgga_c_bc95(na, nb, gaa, gab, gbb, la, lb, ta, tb)
end

export hyb_mgga_xc_b88b95, hyb_mgga_xc_b88b95_components, hyb_mgga_xc_b88b95_defaults, hyb_mgga_xc_b88b95_required

const hyb_mgga_xc_b94_hyb_components = (
    (0.846, :mgga_x_br89, (; params_a_gamma = 1.0)),
    (1.0, :mgga_c_b94, (; params_a_cab = 0.66)),
)
const hyb_mgga_xc_b94_hyb_defaults = NamedTuple()
const hyb_mgga_xc_b94_hyb_required = ()

function hyb_mgga_xc_b94_hyb(rho, sigma, lapl, tau)
    return 0.846 * mgga_x_br89(rho, sigma, lapl, tau; params = (; params_a_gamma = 1.0)) +
           1.0 * mgga_c_b94(rho, sigma, lapl, tau; params = (; params_a_cab = 0.66))
end

function hyb_mgga_xc_b94_hyb(na, nb, gaa, gab, gbb, la, lb, ta, tb)
    return 0.846 * mgga_x_br89(na, nb, gaa, gab, gbb, la, lb, ta, tb; params = (; params_a_gamma = 1.0)) +
           1.0 * mgga_c_b94(na, nb, gaa, gab, gbb, la, lb, ta, tb; params = (; params_a_cab = 0.66))
end

export hyb_mgga_xc_b94_hyb, hyb_mgga_xc_b94_hyb_components, hyb_mgga_xc_b94_hyb_defaults, hyb_mgga_xc_b94_hyb_required

const hyb_mgga_xc_bb1k_components = (
    (0.5800000000000001, :gga_x_b88, NamedTuple()),
    (1.0, :mgga_c_bc95, NamedTuple()),
)
const hyb_mgga_xc_bb1k_defaults = NamedTuple()
const hyb_mgga_xc_bb1k_required = ()

function hyb_mgga_xc_bb1k(rho, sigma, lapl, tau)
    return 0.5800000000000001 * gga_x_b88(rho, sigma) +
           1.0 * mgga_c_bc95(rho, sigma, lapl, tau)
end

function hyb_mgga_xc_bb1k(na, nb, gaa, gab, gbb, la, lb, ta, tb)
    return 0.5800000000000001 * gga_x_b88(na, nb, gaa, gab, gbb) +
           1.0 * mgga_c_bc95(na, nb, gaa, gab, gbb, la, lb, ta, tb)
end

export hyb_mgga_xc_bb1k, hyb_mgga_xc_bb1k_components, hyb_mgga_xc_bb1k_defaults, hyb_mgga_xc_bb1k_required

const hyb_mgga_xc_br3p86_components = (
    (0.10999999999999999, :lda_x, NamedTuple()),
    (0.67, :mgga_x_br89_1, NamedTuple()),
    (0.15000000000000002, :lda_c_vwn, NamedTuple()),
    (0.85, :gga_c_p86vwn, NamedTuple()),
)
const hyb_mgga_xc_br3p86_defaults = NamedTuple()
const hyb_mgga_xc_br3p86_required = ()

function hyb_mgga_xc_br3p86(rho, sigma, lapl, tau)
    return 0.10999999999999999 * lda_x(rho) +
           0.67 * mgga_x_br89_1(rho, sigma, lapl, tau) +
           0.15000000000000002 * lda_c_vwn(rho) +
           0.85 * gga_c_p86vwn(rho, sigma)
end

function hyb_mgga_xc_br3p86(na, nb, gaa, gab, gbb, la, lb, ta, tb)
    return 0.10999999999999999 * lda_x(na, nb) +
           0.67 * mgga_x_br89_1(na, nb, gaa, gab, gbb, la, lb, ta, tb) +
           0.15000000000000002 * lda_c_vwn(na, nb) +
           0.85 * gga_c_p86vwn(na, nb, gaa, gab, gbb)
end

export hyb_mgga_xc_br3p86, hyb_mgga_xc_br3p86_components, hyb_mgga_xc_br3p86_defaults, hyb_mgga_xc_br3p86_required

const hyb_mgga_xc_edmggah_components = (
    (0.78, :mgga_x_edmgga, NamedTuple()),
    (1.0, :mgga_c_cs, NamedTuple()),
)
const hyb_mgga_xc_edmggah_defaults = NamedTuple()
const hyb_mgga_xc_edmggah_required = ()

function hyb_mgga_xc_edmggah(rho, sigma, lapl, tau)
    return 0.78 * mgga_x_edmgga(rho, sigma, lapl, tau) +
           1.0 * mgga_c_cs(rho, sigma, lapl, tau)
end

function hyb_mgga_xc_edmggah(na, nb, gaa, gab, gbb, la, lb, ta, tb)
    return 0.78 * mgga_x_edmgga(na, nb, gaa, gab, gbb, la, lb, ta, tb) +
           1.0 * mgga_c_cs(na, nb, gaa, gab, gbb, la, lb, ta, tb)
end

export hyb_mgga_xc_edmggah, hyb_mgga_xc_edmggah_components, hyb_mgga_xc_edmggah_defaults, hyb_mgga_xc_edmggah_required

const hyb_mgga_xc_lc_tmlyp_components = (
    (1.0, :hyb_mgga_x_pjs18, (; cam_omega = 0.28)),
    (1.0, :gga_c_lyp, NamedTuple()),
)
const hyb_mgga_xc_lc_tmlyp_defaults = NamedTuple()
const hyb_mgga_xc_lc_tmlyp_required = ()

function hyb_mgga_xc_lc_tmlyp(rho, sigma, lapl, tau)
    return 1.0 * hyb_mgga_x_pjs18(rho, sigma, lapl, tau; params = (; cam_omega = 0.28)) +
           1.0 * gga_c_lyp(rho, sigma)
end

function hyb_mgga_xc_lc_tmlyp(na, nb, gaa, gab, gbb, la, lb, ta, tb)
    return 1.0 * hyb_mgga_x_pjs18(na, nb, gaa, gab, gbb, la, lb, ta, tb; params = (; cam_omega = 0.28)) +
           1.0 * gga_c_lyp(na, nb, gaa, gab, gbb)
end

export hyb_mgga_xc_lc_tmlyp, hyb_mgga_xc_lc_tmlyp_components, hyb_mgga_xc_lc_tmlyp_defaults, hyb_mgga_xc_lc_tmlyp_required

const hyb_mgga_xc_mpw1b95_components = (
    (0.69, :gga_x_mpw91, NamedTuple()),
    (1.0, :mgga_c_bc95, NamedTuple()),
)
const hyb_mgga_xc_mpw1b95_defaults = NamedTuple()
const hyb_mgga_xc_mpw1b95_required = ()

function hyb_mgga_xc_mpw1b95(rho, sigma, lapl, tau)
    return 0.69 * gga_x_mpw91(rho, sigma) +
           1.0 * mgga_c_bc95(rho, sigma, lapl, tau)
end

function hyb_mgga_xc_mpw1b95(na, nb, gaa, gab, gbb, la, lb, ta, tb)
    return 0.69 * gga_x_mpw91(na, nb, gaa, gab, gbb) +
           1.0 * mgga_c_bc95(na, nb, gaa, gab, gbb, la, lb, ta, tb)
end

export hyb_mgga_xc_mpw1b95, hyb_mgga_xc_mpw1b95_components, hyb_mgga_xc_mpw1b95_defaults, hyb_mgga_xc_mpw1b95_required

const hyb_mgga_xc_mpw1kcis_components = (
    (0.85, :gga_x_mpw91, NamedTuple()),
    (1.0, :mgga_c_kcis, NamedTuple()),
)
const hyb_mgga_xc_mpw1kcis_defaults = NamedTuple()
const hyb_mgga_xc_mpw1kcis_required = ()

function hyb_mgga_xc_mpw1kcis(rho, sigma, lapl, tau)
    return 0.85 * gga_x_mpw91(rho, sigma) +
           1.0 * mgga_c_kcis(rho, sigma, lapl, tau)
end

function hyb_mgga_xc_mpw1kcis(na, nb, gaa, gab, gbb, la, lb, ta, tb)
    return 0.85 * gga_x_mpw91(na, nb, gaa, gab, gbb) +
           1.0 * mgga_c_kcis(na, nb, gaa, gab, gbb, la, lb, ta, tb)
end

export hyb_mgga_xc_mpw1kcis, hyb_mgga_xc_mpw1kcis_components, hyb_mgga_xc_mpw1kcis_defaults, hyb_mgga_xc_mpw1kcis_required

const hyb_mgga_xc_mpwb1k_components = (
    (0.56, :gga_x_mpw91, NamedTuple()),
    (1.0, :mgga_c_bc95, NamedTuple()),
)
const hyb_mgga_xc_mpwb1k_defaults = NamedTuple()
const hyb_mgga_xc_mpwb1k_required = ()

function hyb_mgga_xc_mpwb1k(rho, sigma, lapl, tau)
    return 0.56 * gga_x_mpw91(rho, sigma) +
           1.0 * mgga_c_bc95(rho, sigma, lapl, tau)
end

function hyb_mgga_xc_mpwb1k(na, nb, gaa, gab, gbb, la, lb, ta, tb)
    return 0.56 * gga_x_mpw91(na, nb, gaa, gab, gbb) +
           1.0 * mgga_c_bc95(na, nb, gaa, gab, gbb, la, lb, ta, tb)
end

export hyb_mgga_xc_mpwb1k, hyb_mgga_xc_mpwb1k_components, hyb_mgga_xc_mpwb1k_defaults, hyb_mgga_xc_mpwb1k_required

const hyb_mgga_xc_mpwkcis1k_components = (
    (0.5900000000000001, :gga_x_mpw91, NamedTuple()),
    (1.0, :mgga_c_kcis, NamedTuple()),
)
const hyb_mgga_xc_mpwkcis1k_defaults = NamedTuple()
const hyb_mgga_xc_mpwkcis1k_required = ()

function hyb_mgga_xc_mpwkcis1k(rho, sigma, lapl, tau)
    return 0.5900000000000001 * gga_x_mpw91(rho, sigma) +
           1.0 * mgga_c_kcis(rho, sigma, lapl, tau)
end

function hyb_mgga_xc_mpwkcis1k(na, nb, gaa, gab, gbb, la, lb, ta, tb)
    return 0.5900000000000001 * gga_x_mpw91(na, nb, gaa, gab, gbb) +
           1.0 * mgga_c_kcis(na, nb, gaa, gab, gbb, la, lb, ta, tb)
end

export hyb_mgga_xc_mpwkcis1k, hyb_mgga_xc_mpwkcis1k_components, hyb_mgga_xc_mpwkcis1k_defaults, hyb_mgga_xc_mpwkcis1k_required

const hyb_mgga_xc_pbe1kcis_components = (
    (0.78, :gga_x_pbe, NamedTuple()),
    (1.0, :mgga_c_kcis, NamedTuple()),
)
const hyb_mgga_xc_pbe1kcis_defaults = NamedTuple()
const hyb_mgga_xc_pbe1kcis_required = ()

function hyb_mgga_xc_pbe1kcis(rho, sigma, lapl, tau)
    return 0.78 * gga_x_pbe(rho, sigma) +
           1.0 * mgga_c_kcis(rho, sigma, lapl, tau)
end

function hyb_mgga_xc_pbe1kcis(na, nb, gaa, gab, gbb, la, lb, ta, tb)
    return 0.78 * gga_x_pbe(na, nb, gaa, gab, gbb) +
           1.0 * mgga_c_kcis(na, nb, gaa, gab, gbb, la, lb, ta, tb)
end

export hyb_mgga_xc_pbe1kcis, hyb_mgga_xc_pbe1kcis_components, hyb_mgga_xc_pbe1kcis_defaults, hyb_mgga_xc_pbe1kcis_required

const hyb_mgga_xc_pw6b95_components = (
    (0.72, :gga_x_mpw91, (; params_a_a = 0.2516404889123719, params_a_alpha = 105.63156984148154, params_a_c = 0.35135640502793386, params_a_d = -0.22789961490447713, params_a_expo = 3.8901, params_a_f = 0.0031669820587625764)),
    (1.0, :mgga_c_bc95, (; params_a_copp = 0.00262, params_a_css = 0.03668)),
)
const hyb_mgga_xc_pw6b95_defaults = NamedTuple()
const hyb_mgga_xc_pw6b95_required = ()

function hyb_mgga_xc_pw6b95(rho, sigma, lapl, tau)
    return 0.72 * gga_x_mpw91(rho, sigma; params = (; params_a_a = 0.2516404889123719, params_a_alpha = 105.63156984148154, params_a_c = 0.35135640502793386, params_a_d = -0.22789961490447713, params_a_expo = 3.8901, params_a_f = 0.0031669820587625764)) +
           1.0 * mgga_c_bc95(rho, sigma, lapl, tau; params = (; params_a_copp = 0.00262, params_a_css = 0.03668))
end

function hyb_mgga_xc_pw6b95(na, nb, gaa, gab, gbb, la, lb, ta, tb)
    return 0.72 * gga_x_mpw91(na, nb, gaa, gab, gbb; params = (; params_a_a = 0.2516404889123719, params_a_alpha = 105.63156984148154, params_a_c = 0.35135640502793386, params_a_d = -0.22789961490447713, params_a_expo = 3.8901, params_a_f = 0.0031669820587625764)) +
           1.0 * mgga_c_bc95(na, nb, gaa, gab, gbb, la, lb, ta, tb; params = (; params_a_copp = 0.00262, params_a_css = 0.03668))
end

export hyb_mgga_xc_pw6b95, hyb_mgga_xc_pw6b95_components, hyb_mgga_xc_pw6b95_defaults, hyb_mgga_xc_pw6b95_required

const hyb_mgga_xc_pw86b95_components = (
    (0.71, :gga_x_pw86, NamedTuple()),
    (1.0, :mgga_c_bc95, NamedTuple()),
)
const hyb_mgga_xc_pw86b95_defaults = NamedTuple()
const hyb_mgga_xc_pw86b95_required = ()

function hyb_mgga_xc_pw86b95(rho, sigma, lapl, tau)
    return 0.71 * gga_x_pw86(rho, sigma) +
           1.0 * mgga_c_bc95(rho, sigma, lapl, tau)
end

function hyb_mgga_xc_pw86b95(na, nb, gaa, gab, gbb, la, lb, ta, tb)
    return 0.71 * gga_x_pw86(na, nb, gaa, gab, gbb) +
           1.0 * mgga_c_bc95(na, nb, gaa, gab, gbb, la, lb, ta, tb)
end

export hyb_mgga_xc_pw86b95, hyb_mgga_xc_pw86b95_components, hyb_mgga_xc_pw86b95_defaults, hyb_mgga_xc_pw86b95_required

const hyb_mgga_xc_pwb6k_components = (
    (0.54, :gga_x_mpw91, (; params_a_a = 0.25210822216313833, params_a_alpha = 103.778064560061, params_a_c = 0.3520094838476884, params_a_d = -0.22855269372423162, params_a_expo = 4.0876, params_a_f = 0.004751003872698516)),
    (1.0, :mgga_c_bc95, (; params_a_copp = 0.00353, params_a_css = 0.0412)),
)
const hyb_mgga_xc_pwb6k_defaults = NamedTuple()
const hyb_mgga_xc_pwb6k_required = ()

function hyb_mgga_xc_pwb6k(rho, sigma, lapl, tau)
    return 0.54 * gga_x_mpw91(rho, sigma; params = (; params_a_a = 0.25210822216313833, params_a_alpha = 103.778064560061, params_a_c = 0.3520094838476884, params_a_d = -0.22855269372423162, params_a_expo = 4.0876, params_a_f = 0.004751003872698516)) +
           1.0 * mgga_c_bc95(rho, sigma, lapl, tau; params = (; params_a_copp = 0.00353, params_a_css = 0.0412))
end

function hyb_mgga_xc_pwb6k(na, nb, gaa, gab, gbb, la, lb, ta, tb)
    return 0.54 * gga_x_mpw91(na, nb, gaa, gab, gbb; params = (; params_a_a = 0.25210822216313833, params_a_alpha = 103.778064560061, params_a_c = 0.3520094838476884, params_a_d = -0.22855269372423162, params_a_expo = 4.0876, params_a_f = 0.004751003872698516)) +
           1.0 * mgga_c_bc95(na, nb, gaa, gab, gbb, la, lb, ta, tb; params = (; params_a_copp = 0.00353, params_a_css = 0.0412))
end

export hyb_mgga_xc_pwb6k, hyb_mgga_xc_pwb6k_components, hyb_mgga_xc_pwb6k_defaults, hyb_mgga_xc_pwb6k_required

const hyb_mgga_xc_r2scan0_components = (
    (0.75, :mgga_x_r2scan, NamedTuple()),
    (1.0, :mgga_c_r2scan, NamedTuple()),
)
const hyb_mgga_xc_r2scan0_defaults = NamedTuple()
const hyb_mgga_xc_r2scan0_required = ()

function hyb_mgga_xc_r2scan0(rho, sigma, lapl, tau)
    return 0.75 * mgga_x_r2scan(rho, sigma, lapl, tau) +
           1.0 * mgga_c_r2scan(rho, sigma, lapl, tau)
end

function hyb_mgga_xc_r2scan0(na, nb, gaa, gab, gbb, la, lb, ta, tb)
    return 0.75 * mgga_x_r2scan(na, nb, gaa, gab, gbb, la, lb, ta, tb) +
           1.0 * mgga_c_r2scan(na, nb, gaa, gab, gbb, la, lb, ta, tb)
end

export hyb_mgga_xc_r2scan0, hyb_mgga_xc_r2scan0_components, hyb_mgga_xc_r2scan0_defaults, hyb_mgga_xc_r2scan0_required

const hyb_mgga_xc_r2scan50_components = (
    (0.5, :mgga_x_r2scan, NamedTuple()),
    (1.0, :mgga_c_r2scan, NamedTuple()),
)
const hyb_mgga_xc_r2scan50_defaults = NamedTuple()
const hyb_mgga_xc_r2scan50_required = ()

function hyb_mgga_xc_r2scan50(rho, sigma, lapl, tau)
    return 0.5 * mgga_x_r2scan(rho, sigma, lapl, tau) +
           1.0 * mgga_c_r2scan(rho, sigma, lapl, tau)
end

function hyb_mgga_xc_r2scan50(na, nb, gaa, gab, gbb, la, lb, ta, tb)
    return 0.5 * mgga_x_r2scan(na, nb, gaa, gab, gbb, la, lb, ta, tb) +
           1.0 * mgga_c_r2scan(na, nb, gaa, gab, gbb, la, lb, ta, tb)
end

export hyb_mgga_xc_r2scan50, hyb_mgga_xc_r2scan50_components, hyb_mgga_xc_r2scan50_defaults, hyb_mgga_xc_r2scan50_required

const hyb_mgga_xc_r2scanh_components = (
    (0.9, :mgga_x_r2scan, NamedTuple()),
    (1.0, :mgga_c_r2scan, NamedTuple()),
)
const hyb_mgga_xc_r2scanh_defaults = NamedTuple()
const hyb_mgga_xc_r2scanh_required = ()

function hyb_mgga_xc_r2scanh(rho, sigma, lapl, tau)
    return 0.9 * mgga_x_r2scan(rho, sigma, lapl, tau) +
           1.0 * mgga_c_r2scan(rho, sigma, lapl, tau)
end

function hyb_mgga_xc_r2scanh(na, nb, gaa, gab, gbb, la, lb, ta, tb)
    return 0.9 * mgga_x_r2scan(na, nb, gaa, gab, gbb, la, lb, ta, tb) +
           1.0 * mgga_c_r2scan(na, nb, gaa, gab, gbb, la, lb, ta, tb)
end

export hyb_mgga_xc_r2scanh, hyb_mgga_xc_r2scanh_components, hyb_mgga_xc_r2scanh_defaults, hyb_mgga_xc_r2scanh_required

const hyb_mgga_xc_revtpssh_components = (
    (0.9, :mgga_x_revtpss, NamedTuple()),
    (1.0, :mgga_c_revtpss, NamedTuple()),
)
const hyb_mgga_xc_revtpssh_defaults = NamedTuple()
const hyb_mgga_xc_revtpssh_required = ()

function hyb_mgga_xc_revtpssh(rho, sigma, lapl, tau)
    return 0.9 * mgga_x_revtpss(rho, sigma, lapl, tau) +
           1.0 * mgga_c_revtpss(rho, sigma, lapl, tau)
end

function hyb_mgga_xc_revtpssh(na, nb, gaa, gab, gbb, la, lb, ta, tb)
    return 0.9 * mgga_x_revtpss(na, nb, gaa, gab, gbb, la, lb, ta, tb) +
           1.0 * mgga_c_revtpss(na, nb, gaa, gab, gbb, la, lb, ta, tb)
end

export hyb_mgga_xc_revtpssh, hyb_mgga_xc_revtpssh_components, hyb_mgga_xc_revtpssh_defaults, hyb_mgga_xc_revtpssh_required

const hyb_mgga_xc_tpss0_components = (
    (0.75, :mgga_x_tpss, NamedTuple()),
    (1.0, :mgga_c_tpss, NamedTuple()),
)
const hyb_mgga_xc_tpss0_defaults = NamedTuple()
const hyb_mgga_xc_tpss0_required = ()

function hyb_mgga_xc_tpss0(rho, sigma, lapl, tau)
    return 0.75 * mgga_x_tpss(rho, sigma, lapl, tau) +
           1.0 * mgga_c_tpss(rho, sigma, lapl, tau)
end

function hyb_mgga_xc_tpss0(na, nb, gaa, gab, gbb, la, lb, ta, tb)
    return 0.75 * mgga_x_tpss(na, nb, gaa, gab, gbb, la, lb, ta, tb) +
           1.0 * mgga_c_tpss(na, nb, gaa, gab, gbb, la, lb, ta, tb)
end

export hyb_mgga_xc_tpss0, hyb_mgga_xc_tpss0_components, hyb_mgga_xc_tpss0_defaults, hyb_mgga_xc_tpss0_required

const hyb_mgga_xc_tpss1kcis_components = (
    (0.87, :mgga_x_tpss, NamedTuple()),
    (1.0, :mgga_c_kcis, NamedTuple()),
)
const hyb_mgga_xc_tpss1kcis_defaults = NamedTuple()
const hyb_mgga_xc_tpss1kcis_required = ()

function hyb_mgga_xc_tpss1kcis(rho, sigma, lapl, tau)
    return 0.87 * mgga_x_tpss(rho, sigma, lapl, tau) +
           1.0 * mgga_c_kcis(rho, sigma, lapl, tau)
end

function hyb_mgga_xc_tpss1kcis(na, nb, gaa, gab, gbb, la, lb, ta, tb)
    return 0.87 * mgga_x_tpss(na, nb, gaa, gab, gbb, la, lb, ta, tb) +
           1.0 * mgga_c_kcis(na, nb, gaa, gab, gbb, la, lb, ta, tb)
end

export hyb_mgga_xc_tpss1kcis, hyb_mgga_xc_tpss1kcis_components, hyb_mgga_xc_tpss1kcis_defaults, hyb_mgga_xc_tpss1kcis_required

const hyb_mgga_xc_tpssh_components = (
    (0.9, :mgga_x_tpss, NamedTuple()),
    (1.0, :mgga_c_tpss, NamedTuple()),
)
const hyb_mgga_xc_tpssh_defaults = NamedTuple()
const hyb_mgga_xc_tpssh_required = ()

function hyb_mgga_xc_tpssh(rho, sigma, lapl, tau)
    return 0.9 * mgga_x_tpss(rho, sigma, lapl, tau) +
           1.0 * mgga_c_tpss(rho, sigma, lapl, tau)
end

function hyb_mgga_xc_tpssh(na, nb, gaa, gab, gbb, la, lb, ta, tb)
    return 0.9 * mgga_x_tpss(na, nb, gaa, gab, gbb, la, lb, ta, tb) +
           1.0 * mgga_c_tpss(na, nb, gaa, gab, gbb, la, lb, ta, tb)
end

export hyb_mgga_xc_tpssh, hyb_mgga_xc_tpssh_components, hyb_mgga_xc_tpssh_defaults, hyb_mgga_xc_tpssh_required

const hyb_mgga_xc_x1b95_components = (
    (0.5355, :gga_x_b88, NamedTuple()),
    (0.16449999999999998, :gga_x_pw91, NamedTuple()),
    (1.0, :mgga_c_bc95, NamedTuple()),
)
const hyb_mgga_xc_x1b95_defaults = NamedTuple()
const hyb_mgga_xc_x1b95_required = ()

function hyb_mgga_xc_x1b95(rho, sigma, lapl, tau)
    return 0.5355 * gga_x_b88(rho, sigma) +
           0.16449999999999998 * gga_x_pw91(rho, sigma) +
           1.0 * mgga_c_bc95(rho, sigma, lapl, tau)
end

function hyb_mgga_xc_x1b95(na, nb, gaa, gab, gbb, la, lb, ta, tb)
    return 0.5355 * gga_x_b88(na, nb, gaa, gab, gbb) +
           0.16449999999999998 * gga_x_pw91(na, nb, gaa, gab, gbb) +
           1.0 * mgga_c_bc95(na, nb, gaa, gab, gbb, la, lb, ta, tb)
end

export hyb_mgga_xc_x1b95, hyb_mgga_xc_x1b95_components, hyb_mgga_xc_x1b95_defaults, hyb_mgga_xc_x1b95_required

const hyb_mgga_xc_xb1k_components = (
    (0.43605000000000005, :gga_x_b88, NamedTuple()),
    (0.13395, :gga_x_pw91, NamedTuple()),
    (1.0, :mgga_c_bc95, NamedTuple()),
)
const hyb_mgga_xc_xb1k_defaults = NamedTuple()
const hyb_mgga_xc_xb1k_required = ()

function hyb_mgga_xc_xb1k(rho, sigma, lapl, tau)
    return 0.43605000000000005 * gga_x_b88(rho, sigma) +
           0.13395 * gga_x_pw91(rho, sigma) +
           1.0 * mgga_c_bc95(rho, sigma, lapl, tau)
end

function hyb_mgga_xc_xb1k(na, nb, gaa, gab, gbb, la, lb, ta, tb)
    return 0.43605000000000005 * gga_x_b88(na, nb, gaa, gab, gbb) +
           0.13395 * gga_x_pw91(na, nb, gaa, gab, gbb) +
           1.0 * mgga_c_bc95(na, nb, gaa, gab, gbb, la, lb, ta, tb)
end

export hyb_mgga_xc_xb1k, hyb_mgga_xc_xb1k_components, hyb_mgga_xc_xb1k_defaults, hyb_mgga_xc_xb1k_required

const mgga_c_revscan_vv10_components = (
    (1.0, :mgga_c_revscan, NamedTuple()),
)
const mgga_c_revscan_vv10_defaults = NamedTuple()
const mgga_c_revscan_vv10_required = ()

function mgga_c_revscan_vv10(rho, sigma, lapl, tau)
    return 1.0 * mgga_c_revscan(rho, sigma, lapl, tau)
end

function mgga_c_revscan_vv10(na, nb, gaa, gab, gbb, la, lb, ta, tb)
    return 1.0 * mgga_c_revscan(na, nb, gaa, gab, gbb, la, lb, ta, tb)
end

export mgga_c_revscan_vv10, mgga_c_revscan_vv10_components, mgga_c_revscan_vv10_defaults, mgga_c_revscan_vv10_required

const mgga_c_scan_rvv10_components = (
    (1.0, :mgga_c_scan, NamedTuple()),
)
const mgga_c_scan_rvv10_defaults = NamedTuple()
const mgga_c_scan_rvv10_required = ()

function mgga_c_scan_rvv10(rho, sigma, lapl, tau)
    return 1.0 * mgga_c_scan(rho, sigma, lapl, tau)
end

function mgga_c_scan_rvv10(na, nb, gaa, gab, gbb, la, lb, ta, tb)
    return 1.0 * mgga_c_scan(na, nb, gaa, gab, gbb, la, lb, ta, tb)
end

export mgga_c_scan_rvv10, mgga_c_scan_rvv10_components, mgga_c_scan_rvv10_defaults, mgga_c_scan_rvv10_required

const mgga_c_scan_vv10_components = (
    (1.0, :mgga_c_scan, NamedTuple()),
)
const mgga_c_scan_vv10_defaults = NamedTuple()
const mgga_c_scan_vv10_required = ()

function mgga_c_scan_vv10(rho, sigma, lapl, tau)
    return 1.0 * mgga_c_scan(rho, sigma, lapl, tau)
end

function mgga_c_scan_vv10(na, nb, gaa, gab, gbb, la, lb, ta, tb)
    return 1.0 * mgga_c_scan(na, nb, gaa, gab, gbb, la, lb, ta, tb)
end

export mgga_c_scan_vv10, mgga_c_scan_vv10_components, mgga_c_scan_vv10_defaults, mgga_c_scan_vv10_required

const mgga_c_scanl_rvv10_components = (
    (1.0, :mgga_c_scanl, NamedTuple()),
)
const mgga_c_scanl_rvv10_defaults = NamedTuple()
const mgga_c_scanl_rvv10_required = ()

function mgga_c_scanl_rvv10(rho, sigma, lapl, tau)
    return 1.0 * mgga_c_scanl(rho, sigma, lapl, tau)
end

function mgga_c_scanl_rvv10(na, nb, gaa, gab, gbb, la, lb, ta, tb)
    return 1.0 * mgga_c_scanl(na, nb, gaa, gab, gbb, la, lb, ta, tb)
end

export mgga_c_scanl_rvv10, mgga_c_scanl_rvv10_components, mgga_c_scanl_rvv10_defaults, mgga_c_scanl_rvv10_required

const mgga_c_scanl_vv10_components = (
    (1.0, :mgga_c_scanl, NamedTuple()),
)
const mgga_c_scanl_vv10_defaults = NamedTuple()
const mgga_c_scanl_vv10_required = ()

function mgga_c_scanl_vv10(rho, sigma, lapl, tau)
    return 1.0 * mgga_c_scanl(rho, sigma, lapl, tau)
end

function mgga_c_scanl_vv10(na, nb, gaa, gab, gbb, la, lb, ta, tb)
    return 1.0 * mgga_c_scanl(na, nb, gaa, gab, gbb, la, lb, ta, tb)
end

export mgga_c_scanl_vv10, mgga_c_scanl_vv10_components, mgga_c_scanl_vv10_defaults, mgga_c_scanl_vv10_required

const mgga_x_mk00b_components = (
    (-1.0, :lda_x, NamedTuple()),
    (1.0, :gga_x_b88, (; params_a_beta = 0.0016)),
    (1.0, :mgga_x_gp86, NamedTuple()),
)
const mgga_x_mk00b_defaults = NamedTuple()
const mgga_x_mk00b_required = ()

function mgga_x_mk00b(rho, sigma, lapl, tau)
    return -1.0 * lda_x(rho) +
           1.0 * gga_x_b88(rho, sigma; params = (; params_a_beta = 0.0016)) +
           1.0 * mgga_x_gp86(rho, sigma, lapl, tau)
end

function mgga_x_mk00b(na, nb, gaa, gab, gbb, la, lb, ta, tb)
    return -1.0 * lda_x(na, nb) +
           1.0 * gga_x_b88(na, nb, gaa, gab, gbb; params = (; params_a_beta = 0.0016)) +
           1.0 * mgga_x_gp86(na, nb, gaa, gab, gbb, la, lb, ta, tb)
end

export mgga_x_mk00b, mgga_x_mk00b_components, mgga_x_mk00b_defaults, mgga_x_mk00b_required

const mgga_xc_hle17_components = (
    (1.25, :mgga_x_tpss, NamedTuple()),
    (0.5, :mgga_c_tpss, NamedTuple()),
)
const mgga_xc_hle17_defaults = NamedTuple()
const mgga_xc_hle17_required = ()

function mgga_xc_hle17(rho, sigma, lapl, tau)
    return 1.25 * mgga_x_tpss(rho, sigma, lapl, tau) +
           0.5 * mgga_c_tpss(rho, sigma, lapl, tau)
end

function mgga_xc_hle17(na, nb, gaa, gab, gbb, la, lb, ta, tb)
    return 1.25 * mgga_x_tpss(na, nb, gaa, gab, gbb, la, lb, ta, tb) +
           0.5 * mgga_c_tpss(na, nb, gaa, gab, gbb, la, lb, ta, tb)
end

export mgga_xc_hle17, mgga_xc_hle17_components, mgga_xc_hle17_defaults, mgga_xc_hle17_required

const mgga_xc_otpss_d_components = (
    (1.0, :mgga_x_tpss, (; params_a_b = 3.43, params_a_c = 0.75896, params_a_e = 0.165, params_a_kappa = 0.778, params_a_mu = 0.41567)),
    (1.0, :mgga_c_tpss, (; params_a_beta = 0.08861, params_a_d = 0.7)),
)
const mgga_xc_otpss_d_defaults = NamedTuple()
const mgga_xc_otpss_d_required = ()

function mgga_xc_otpss_d(rho, sigma, lapl, tau)
    return 1.0 * mgga_x_tpss(rho, sigma, lapl, tau; params = (; params_a_b = 3.43, params_a_c = 0.75896, params_a_e = 0.165, params_a_kappa = 0.778, params_a_mu = 0.41567)) +
           1.0 * mgga_c_tpss(rho, sigma, lapl, tau; params = (; params_a_beta = 0.08861, params_a_d = 0.7))
end

function mgga_xc_otpss_d(na, nb, gaa, gab, gbb, la, lb, ta, tb)
    return 1.0 * mgga_x_tpss(na, nb, gaa, gab, gbb, la, lb, ta, tb; params = (; params_a_b = 3.43, params_a_c = 0.75896, params_a_e = 0.165, params_a_kappa = 0.778, params_a_mu = 0.41567)) +
           1.0 * mgga_c_tpss(na, nb, gaa, gab, gbb, la, lb, ta, tb; params = (; params_a_beta = 0.08861, params_a_d = 0.7))
end

export mgga_xc_otpss_d, mgga_xc_otpss_d_components, mgga_xc_otpss_d_defaults, mgga_xc_otpss_d_required

const mgga_xc_t_hle17_components = (
    (1.35, :mgga_x_tpss, NamedTuple()),
    (1.0, :mgga_c_tpss, NamedTuple()),
)
const mgga_xc_t_hle17_defaults = NamedTuple()
const mgga_xc_t_hle17_required = ()

function mgga_xc_t_hle17(rho, sigma, lapl, tau)
    return 1.35 * mgga_x_tpss(rho, sigma, lapl, tau) +
           1.0 * mgga_c_tpss(rho, sigma, lapl, tau)
end

function mgga_xc_t_hle17(na, nb, gaa, gab, gbb, la, lb, ta, tb)
    return 1.35 * mgga_x_tpss(na, nb, gaa, gab, gbb, la, lb, ta, tb) +
           1.0 * mgga_c_tpss(na, nb, gaa, gab, gbb, la, lb, ta, tb)
end

export mgga_xc_t_hle17, mgga_xc_t_hle17_components, mgga_xc_t_hle17_defaults, mgga_xc_t_hle17_required

const mgga_xc_tpsslyp1w_components = (
    (0.26, :lda_c_vwn, NamedTuple()),
    (1.0, :mgga_x_tpss, NamedTuple()),
    (0.74, :gga_c_lyp, NamedTuple()),
)
const mgga_xc_tpsslyp1w_defaults = NamedTuple()
const mgga_xc_tpsslyp1w_required = ()

function mgga_xc_tpsslyp1w(rho, sigma, lapl, tau)
    return 0.26 * lda_c_vwn(rho) +
           1.0 * mgga_x_tpss(rho, sigma, lapl, tau) +
           0.74 * gga_c_lyp(rho, sigma)
end

function mgga_xc_tpsslyp1w(na, nb, gaa, gab, gbb, la, lb, ta, tb)
    return 0.26 * lda_c_vwn(na, nb) +
           1.0 * mgga_x_tpss(na, nb, gaa, gab, gbb, la, lb, ta, tb) +
           0.74 * gga_c_lyp(na, nb, gaa, gab, gbb)
end

export mgga_xc_tpsslyp1w, mgga_xc_tpsslyp1w_components, mgga_xc_tpsslyp1w_defaults, mgga_xc_tpsslyp1w_required

const mgga_xc_vcml_rvv10_components = (
    (1.0, :mgga_x_vcml, NamedTuple()),
    (1.0, :gga_c_regtpss, NamedTuple()),
)
const mgga_xc_vcml_rvv10_defaults = NamedTuple()
const mgga_xc_vcml_rvv10_required = ()

function mgga_xc_vcml_rvv10(rho, sigma, lapl, tau)
    return 1.0 * mgga_x_vcml(rho, sigma, lapl, tau) +
           1.0 * gga_c_regtpss(rho, sigma)
end

function mgga_xc_vcml_rvv10(na, nb, gaa, gab, gbb, la, lb, ta, tb)
    return 1.0 * mgga_x_vcml(na, nb, gaa, gab, gbb, la, lb, ta, tb) +
           1.0 * gga_c_regtpss(na, nb, gaa, gab, gbb)
end

export mgga_xc_vcml_rvv10, mgga_xc_vcml_rvv10_components, mgga_xc_vcml_rvv10_defaults, mgga_xc_vcml_rvv10_required
