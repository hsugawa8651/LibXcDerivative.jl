# Auto-generated from the Libxc sources
# -- do not edit by hand.
#
# What Libxc carries about a functional besides its arithmetic: the
# sentence naming it, its flags, the derivative orders the library
# provides, and the papers it asks to be cited. Read from the pinned
# build -- the SymPy sources this package generates from carry the
# mathematics and not the bibliography, so there is no second source
# for the citations. See src/identifiers.jl for what reads it.
#
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

const IDENTIFIER_TEXT = Dict{Symbol,IdentifierText}(
    :gga_c_acgga => IdentifierText(
        "acGGA, asymptotically corrected GGA correlation",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("A. Cancio, G. P. Chen, B. T. Krull, and K. Burke,  J. Chem. Phys. 149, 084116 (2018)", "10.1063/1.5021597", "@article{Cancio2018_084116,\n  author = {Cancio, Antonio and Chen, Guo P. and Krull, Brandon T. and Burke, Kieron},\n  title = {Fitting a round peg into a round hole: Asymptotically correcting the generalized gradient approximation for correlation},\n  journal = {J. Chem. Phys.},\n  volume = {149},\n  number = {8},\n  pages = {084116},\n  year = {2018},\n  doi = {10.1063/1.5021597},\n  url = {https://doi.org/10.1063/1.5021597}\n}\n", "Cancio2018_084116"),
            LibxcReference("K. Burke, A. Cancio, T. Gould, and S. Pittalis,  ArXiv e-prints  (2014)", "10.48550/arXiv.1409.4834", "@article{Burke2014_4834,\n  author = {Burke, K. and Cancio, A. and Gould, T. and Pittalis, S.},\n  title = {{Atomic correlation energies and the generalized gradient approximation}},\n  journal = {ArXiv e-prints},\n  archivePrefix = {arXiv},\n  eprint = {1409.4834},\n  primaryClass = {cond-mat.mtrl-sci},\n  year = {2014},\n  month = {September},\n  doi = {10.48550/arXiv.1409.4834}\n}\n", "Burke2014_4834"),
        ]),
    :gga_c_acggap => IdentifierText(
        "acGGA+, asymptotically corrected GGA correlation+",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("A. Cancio, G. P. Chen, B. T. Krull, and K. Burke,  J. Chem. Phys. 149, 084116 (2018)", "10.1063/1.5021597", "@article{Cancio2018_084116,\n  author = {Cancio, Antonio and Chen, Guo P. and Krull, Brandon T. and Burke, Kieron},\n  title = {Fitting a round peg into a round hole: Asymptotically correcting the generalized gradient approximation for correlation},\n  journal = {J. Chem. Phys.},\n  volume = {149},\n  number = {8},\n  pages = {084116},\n  year = {2018},\n  doi = {10.1063/1.5021597},\n  url = {https://doi.org/10.1063/1.5021597}\n}\n", "Cancio2018_084116"),
            LibxcReference("K. Burke, A. Cancio, T. Gould, and S. Pittalis,  ArXiv e-prints  (2014)", "10.48550/arXiv.1409.4834", "@article{Burke2014_4834,\n  author = {Burke, K. and Cancio, A. and Gould, T. and Pittalis, S.},\n  title = {{Atomic correlation energies and the generalized gradient approximation}},\n  journal = {ArXiv e-prints},\n  archivePrefix = {arXiv},\n  eprint = {1409.4834},\n  primaryClass = {cond-mat.mtrl-sci},\n  year = {2014},\n  month = {September},\n  doi = {10.48550/arXiv.1409.4834}\n}\n", "Burke2014_4834"),
        ]),
    :gga_c_am05 => IdentifierText(
        "Armiento & Mattsson 05",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("R. Armiento and A. E. Mattsson,  Phys. Rev. B 72, 085108 (2005)", "10.1103/PhysRevB.72.085108", "@article{Armiento2005_085108,\n  author = {Armiento, R. and Mattsson, A. E.},\n  title = {Functional designed to include surface effects in self-consistent density functional theory},\n  journal = {Phys. Rev. B},\n  volume = {72},\n  issue = {8},\n  pages = {085108},\n  year = {2005},\n  month = {Aug},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevB.72.085108},\n  url = {http://link.aps.org/doi/10.1103/PhysRevB.72.085108}\n}\n", "Armiento2005_085108"),
            LibxcReference("A. E. Mattsson, R. Armiento, J. Paier, G. Kresse, J. M. Wills, and T. R. Mattsson,  J. Chem. Phys. 128, 084714 (2008)", "10.1063/1.2835596", "@article{Mattsson2008_084714,\n  author = {Mattsson, A. E. and Armiento, R. and Paier, J. and Kresse, G. and Wills, J. M. and Mattsson, T. R.},\n  title = {The {AM05} density functional applied to solids},\n  journal = {J. Chem. Phys.},\n  year = {2008},\n  volume = {128},\n  number = {8},\n  pages = {084714},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/128/8/10.1063/1.2835596},\n  doi = {10.1063/1.2835596}\n}\n", "Mattsson2008_084714"),
        ]),
    :gga_c_apbe => IdentifierText(
        "mu fixed from the semiclassical neutral atom",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("L. A. Constantin, E. Fabiano, S. Laricchia, and F. Della Sala,  Phys. Rev. Lett. 106, 186406 (2011)", "10.1103/PhysRevLett.106.186406", "@article{Constantin2011_186406,\n  author = {Constantin, L. A. and Fabiano, E. and Laricchia, S. and Della Sala, F.},\n  title = {Semiclassical Neutral Atom as a Reference System in Density Functional Theory},\n  journal = {Phys. Rev. Lett.},\n  volume = {106},\n  issue = {18},\n  pages = {186406},\n  year = {2011},\n  month = {May},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevLett.106.186406},\n  url = {http://link.aps.org/doi/10.1103/PhysRevLett.106.186406}\n}\n", "Constantin2011_186406"),
        ]),
    :gga_c_bkl1 => IdentifierText(
        "Correlation part of type-I band gap functional by Bhattacharjee, Koshi and Lee",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("S. Bhattacharjee, N. A. Koshi, and S.-C. Lee,  Phys. Chem. Chem. Phys. 26, 26443–26452 (2024)", "10.1039/D4CP03260H", "@article{Bhattacharjee2024_PCCP_26443,\n  author = {Bhattacharjee, Satadeep and Koshi, Namitha Anna and Lee, Seung-Cheol},\n  title = {Customizing {PBE} exchange-correlation functionals: a comprehensive approach for band gap prediction in diverse semiconductors},\n  journal = {Phys. Chem. Chem. Phys.},\n  year = {2024},\n  volume = {26},\n  issue = {41},\n  pages = {26443--26452},\n  publisher = {The Royal Society of Chemistry},\n  doi = {10.1039/D4CP03260H},\n  url = {http://dx.doi.org/10.1039/D4CP03260H}\n}\n", "Bhattacharjee2024_PCCP_26443"),
        ]),
    :gga_c_bkl2 => IdentifierText(
        "Correlation part of type-II band gap functional by Bhattacharjee, Koshi and Lee",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("S. Bhattacharjee, N. A. Koshi, and S.-C. Lee,  Phys. Chem. Chem. Phys. 26, 26443–26452 (2024)", "10.1039/D4CP03260H", "@article{Bhattacharjee2024_PCCP_26443,\n  author = {Bhattacharjee, Satadeep and Koshi, Namitha Anna and Lee, Seung-Cheol},\n  title = {Customizing {PBE} exchange-correlation functionals: a comprehensive approach for band gap prediction in diverse semiconductors},\n  journal = {Phys. Chem. Chem. Phys.},\n  year = {2024},\n  volume = {26},\n  issue = {41},\n  pages = {26443--26452},\n  publisher = {The Royal Society of Chemistry},\n  doi = {10.1039/D4CP03260H},\n  url = {http://dx.doi.org/10.1039/D4CP03260H}\n}\n", "Bhattacharjee2024_PCCP_26443"),
        ]),
    :gga_c_bmk => IdentifierText(
        "Boese-Martin correlation for kinetics",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("A. D. Boese and J. M. L. Martin,  J. Chem. Phys. 121, 3405 (2004)", "10.1063/1.1774975", "@article{Boese2004_3405,\n  author = {Boese, A. D. and Martin, J. M. L.},\n  title = {Development of density functionals for thermochemical kinetics},\n  journal = {J. Chem. Phys.},\n  year = {2004},\n  volume = {121},\n  number = {8},\n  pages = {3405},\n  doi = {10.1063/1.1774975},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/121/8/10.1063/1.1774975}\n}\n", "Boese2004_3405"),
        ]),
    :gga_c_ccdf => IdentifierText(
        "ccDF: coupled-cluster motivated density functional",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("J. T. Margraf, C. Kunkel, and K. Reuter,  J. Chem. Phys. 150, 244116 (2019)", "10.1063/1.5094788", "@article{Margraf2019_244116,\n  author = {Margraf, Johannes T. and Kunkel, Christian and Reuter, Karsten},\n  title = {Towards density functional approximations from coupled cluster correlation energy densities},\n  journal = {J. Chem. Phys.},\n  volume = {150},\n  number = {24},\n  pages = {244116},\n  year = {2019},\n  doi = {10.1063/1.5094788},\n  url = {https://doi.org/10.1063/1.5094788}\n}\n", "Margraf2019_244116"),
        ]),
    :gga_c_chachiyo => IdentifierText(
        "Chachiyo simple GGA correlation",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("T. Chachiyo and H. Chachiyo,  Comput. Theor. Chem. 1172, 112669 (2020)", "10.1016/j.comptc.2019.112669", "@article{Chachiyo2020_112669,\n  author = {Chachiyo, Teepanis and Chachiyo, Hathaithip},\n  title = {Understanding electron correlation energy through density functional theory},\n  journal = {Comput. Theor. Chem.},\n  volume = {1172},\n  pages = {112669},\n  year = {2020},\n  issn = {2210-271X},\n  doi = {10.1016/j.comptc.2019.112669},\n  url = {http://www.sciencedirect.com/science/article/pii/S2210271X19303652}\n}\n", "Chachiyo2020_112669"),
        ]),
    :gga_c_cs1 => IdentifierText(
        "A dynamical correlation functional",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("N. C. Handy and A. J. Cohen,  J. Chem. Phys. 116, 5411–5418 (2002)", "10.1063/1.1457432", "@article{Handy2002_5411,\n  author = {Handy, Nicholas C. and Cohen, Aron J.},\n  title = {A dynamical correlation functional},\n  journal = {J. Chem. Phys.},\n  volume = {116},\n  number = {13},\n  pages = {5411--5418},\n  year = {2002},\n  doi = {10.1063/1.1457432},\n  url = {https://doi.org/10.1063/1.1457432}\n}\n", "Handy2002_5411"),
            LibxcReference("E. I. Proynov and A. J. Thakkar,  Int. J. Quantum Chem. 106, 436–446 (2006)", "10.1002/qua.20758", "@article{Proynov2006_436,\n  author = {Proynov, Emil I. and Thakkar, Ajit J.},\n  title = {Is combining meta-{GGA} correlation functionals with the {OPTX} exchange functional useful?},\n  journal = {Int. J. Quantum Chem.},\n  volume = {106},\n  number = {2},\n  publisher = {Wiley Subscription Services, Inc., A Wiley Company},\n  issn = {1097-461X},\n  url = {https://doi.org/10.1002/qua.20758},\n  doi = {10.1002/qua.20758},\n  pages = {436--446},\n  year = {2006}\n}\n", "Proynov2006_436"),
        ]),
    :gga_c_ft97 => IdentifierText(
        "Filatov & Thiel correlation",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("M. Filatov and W. Thiel,  Int. J. Quantum Chem. 62, 603 (1997)", "10.1002/(SICI)1097-461X(1997)62%3A6<603%3A%3AAID-QUA4>3.0.CO%3B2-%23", "@article{Filatov1997_603,\n  author = {Filatov, M. and Thiel, W.},\n  title = {A nonlocal correlation energy density functional from a {Coulomb} hole model},\n  journal = {Int. J. Quantum Chem.},\n  volume = {62},\n  number = {6},\n  pages = {603},\n  year = {1997},\n  publisher = {John Wiley \\& Sons, Inc.},\n  issn = {1097-461X},\n  doi = {10.1002/(SICI)1097-461X(1997)62\\\\%3A6<603\\\\%3A\\\\%3AAID-QUA4>3.0.CO\\\\%3B2-\\\\%23},\n  url = {http://onlinelibrary.wiley.com/doi/10.1002/(SICI)1097-461X(1997)62:6<603::AID-QUA4>3.0.CO;2-\\\\%23}\n}\n", "Filatov1997_603"),
            LibxcReference("M. Filatov and W. Thiel,  Mol. Phys. 91, 847 (1997)", "10.1080/002689797170950", "@article{Filatov1997_847,\n  author = {Filatov, M. and Thiel, W.},\n  title = {A new gradient-corrected exchange-correlation density functional},\n  journal = {Mol. Phys.},\n  volume = {91},\n  number = {5},\n  pages = {847},\n  year = {1997},\n  doi = {10.1080/002689797170950},\n  url = {http://www.tandfonline.com/doi/abs/10.1080/002689797170950}\n}\n", "Filatov1997_847"),
        ]),
    :gga_c_gam => IdentifierText(
        "Minnesota GAM correlation functional",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :development, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("H. S. Yu, W. Zhang, P. Verma, X. He, and D. G. Truhlar,  Phys. Chem. Chem. Phys. 17, 12146–12160 (2015)", "10.1039/C5CP01425E", "@article{Yu2015_12146,\n  author = {Yu, Haoyu S. and Zhang, Wenjing and Verma, Pragya and He, Xiao and Truhlar, Donald G.},\n  title = {Nonseparable exchange-correlation functional for molecules, including homogeneous catalysis involving transition metals},\n  journal = {Phys. Chem. Chem. Phys.},\n  year = {2015},\n  volume = {17},\n  issue = {18},\n  pages = {12146--12160},\n  publisher = {The Royal Society of Chemistry},\n  doi = {10.1039/C5CP01425E},\n  url = {https://doi.org/10.1039/C5CP01425E}\n}\n", "Yu2015_12146"),
        ]),
    :gga_c_gapc => IdentifierText(
        "GapC",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3),
        LibxcReference[
            LibxcReference("E. Fabiano, P. E. Trevisanutto, A. Terentjevs, and L. A. Constantin,  J. Chem. Theory Comput. 10, 2016–2026 (2014)", "10.1021/ct500073b", "@article{Fabiano2014_2016,\n  author = {Fabiano, Eduardo and Trevisanutto, Paolo E. and Terentjevs, Aleksandrs and Constantin, Lucian A.},\n  title = {Generalized Gradient Approximation Correlation Energy Functionals Based on the Uniform Electron Gas with Gap Model},\n  journal = {J. Chem. Theory Comput.},\n  volume = {10},\n  number = {5},\n  pages = {2016--2026},\n  year = {2014},\n  doi = {10.1021/ct500073b},\n  url = {https://doi.org/10.1021/ct500073b}\n}\n", "Fabiano2014_2016"),
        ]),
    :gga_c_gaploc => IdentifierText(
        "Gaploc",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("E. Fabiano, P. E. Trevisanutto, A. Terentjevs, and L. A. Constantin,  J. Chem. Theory Comput. 10, 2016–2026 (2014)", "10.1021/ct500073b", "@article{Fabiano2014_2016,\n  author = {Fabiano, Eduardo and Trevisanutto, Paolo E. and Terentjevs, Aleksandrs and Constantin, Lucian A.},\n  title = {Generalized Gradient Approximation Correlation Energy Functionals Based on the Uniform Electron Gas with Gap Model},\n  journal = {J. Chem. Theory Comput.},\n  volume = {10},\n  number = {5},\n  pages = {2016--2026},\n  year = {2014},\n  doi = {10.1021/ct500073b},\n  url = {https://doi.org/10.1021/ct500073b}\n}\n", "Fabiano2014_2016"),
        ]),
    :gga_c_hcth_a => IdentifierText(
        "HCTH-A",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("F. A. Hamprecht, A. J. Cohen, D. J. Tozer, and N. C. Handy,  J. Chem. Phys. 109, 6264 (1998)", "10.1063/1.477267", "@article{Hamprecht1998_6264,\n  author = {Hamprecht, F. A. and Cohen, A. J. and Tozer, D. J. and Handy, N. C.},\n  title = {Development and assessment of new exchange-correlation functionals},\n  journal = {J. Chem. Phys.},\n  year = {1998},\n  volume = {109},\n  number = {15},\n  pages = {6264},\n  doi = {10.1063/1.477267},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/109/15/10.1063/1.477267}\n}\n", "Hamprecht1998_6264"),
        ]),
    :gga_c_hyb_tau_hcth => IdentifierText(
        "correlation part of hyb-tau-hcth",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("A. D. Boese and N. C. Handy,  J. Chem. Phys. 116, 9559 (2002)", "10.1063/1.1476309", "@article{Boese2002_9559,\n  author = {Boese, A. D. and Handy, N. C.},\n  title = {New exchange-correlation density functionals: The role of the kinetic-energy density},\n  journal = {J. Chem. Phys.},\n  year = {2002},\n  volume = {116},\n  number = {22},\n  pages = {9559},\n  doi = {10.1063/1.1476309},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/116/22/10.1063/1.1476309}\n}\n", "Boese2002_9559"),
        ]),
    :gga_c_lm => IdentifierText(
        "Langreth & Mehl",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("D. C. Langreth and M. J. Mehl,  Phys. Rev. Lett. 47, 446 (1981)", "10.1103/PhysRevLett.47.446", "@article{Langreth1981_446,\n  author = {Langreth, D. C. and Mehl, M. J.},\n  title = {Easily Implementable Nonlocal Exchange-Correlation Energy Functional},\n  journal = {Phys. Rev. Lett.},\n  volume = {47},\n  issue = {6},\n  pages = {446},\n  year = {1981},\n  month = {Aug},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevLett.47.446},\n  url = {http://link.aps.org/doi/10.1103/PhysRevLett.47.446}\n}\n", "Langreth1981_446"),
            LibxcReference("C. D. Hu and D. C. Langreth,  Phys. Scr. 32, 391 (1985)", "10.1088/0031-8949/32/4/024", "@article{Hu1985_391,\n  author = {Hu, C. D. and Langreth, D. C.},\n  title = {A Spin Dependent Version of the {Langreth}--{Mehl} Exchange-Correlation Functional},\n  journal = {Phys. Scr.},\n  volume = {32},\n  number = {4},\n  pages = {391},\n  year = {1985},\n  doi = {10.1088/0031-8949/32/4/024},\n  url = {http://stacks.iop.org/1402-4896/32/i = 4/a = 024}\n}\n", "Hu1985_391"),
        ]),
    :gga_c_lyp => IdentifierText(
        "Lee, Yang & Parr",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("C. Lee, W. Yang, and R. G. Parr,  Phys. Rev. B 37, 785 (1988)", "10.1103/PhysRevB.37.785", "@article{Lee1988_785,\n  author = {Lee, C. and Yang, W. and Parr, R. G.},\n  title = {Development of the {Colle}--{Salvetti} correlation-energy formula into a functional of the electron density},\n  journal = {Phys. Rev. B},\n  volume = {37},\n  issue = {2},\n  pages = {785},\n  year = {1988},\n  month = {Jan},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevB.37.785},\n  url = {http://link.aps.org/doi/10.1103/PhysRevB.37.785}\n}\n", "Lee1988_785"),
            LibxcReference("B. Miehlich, A. Savin, H. Stoll, and H. Preuss,  Chem. Phys. Lett. 157, 200 (1989)", "10.1016/0009-2614(89)87234-3", "@article{Miehlich1989_200,\n  author = {Miehlich, B. and Savin, A. and Stoll, H. and Preuss, H.},\n  title = {Results obtained with the correlation energy density functionals of becke and {Lee}, {Yang} and {Parr}},\n  journal = {Chem. Phys. Lett.},\n  volume = {157},\n  number = {3},\n  pages = {200},\n  year = {1989},\n  issn = {0009-2614},\n  doi = {10.1016/0009-2614(89)87234-3},\n  url = {http://www.sciencedirect.com/science/article/pii/0009261489872343}\n}\n", "Miehlich1989_200"),
        ]),
    :gga_c_lypr => IdentifierText(
        "Short-range LYP by Ai, Fang, and Su",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("W. Ai, W.-H. Fang, and N. Q. Su,  J. Phys. Chem. Lett. 12, 1207–1213 (2021)", "10.1021/acs.jpclett.0c03621", "@article{Ai2021_1207,\n  author = {Ai, Wenna and Fang, Wei-Hai and Su, Neil Qiang},\n  title = {The Role of Range-Separated Correlation in Long-Range Corrected Hybrid Functionals},\n  journal = {J. Phys. Chem. Lett.},\n  volume = {12},\n  pages = {1207--1213},\n  year = {2021},\n  doi = {10.1021/acs.jpclett.0c03621},\n  url = {https://doi.org/10.1021/acs.jpclett.0c03621}\n}\n", "Ai2021_1207"),
        ]),
    :gga_c_mggac => IdentifierText(
        "beta fitted to LC20 to be used with MGGAC",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("B. Patra, S. Jana, L. A. Constantin, and P. Samal,  Phys. Rev. B 100, 155140 (2019)", "10.1103/PhysRevB.100.155140", "@article{Patra2019_155140,\n  author = {Patra, Bikash and Jana, Subrata and Constantin, Lucian A. and Samal, Prasanjit},\n  title = {Relevance of the {Pauli} kinetic energy density for semilocal functionals},\n  journal = {Phys. Rev. B},\n  volume = {100},\n  issue = {15},\n  pages = {155140},\n  year = {2019},\n  month = {Oct},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevB.100.155140},\n  url = {https://link.aps.org/doi/10.1103/PhysRevB.100.155140}\n}\n", "Patra2019_155140"),
        ]),
    :gga_c_n12 => IdentifierText(
        "Minnesota N12 correlation functional",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("R. Peverati and D. G. Truhlar,  J. Chem. Theory Comput. 8, 2310 (2012)", "10.1021/ct3002656", "@article{Peverati2012_2310,\n  author = {Peverati, R. and Truhlar, D. G.},\n  title = {Exchange-Correlation Functional with Good Accuracy for Both Structural and Energetic Properties while Depending Only on the Density and Its Gradient},\n  journal = {J. Chem. Theory Comput.},\n  volume = {8},\n  number = {7},\n  pages = {2310},\n  year = {2012},\n  doi = {10.1021/ct3002656},\n  url = {http://pubs.acs.org/doi/abs/10.1021/ct3002656}\n}\n", "Peverati2012_2310"),
        ]),
    :gga_c_n12_sx => IdentifierText(
        "Minnesota N12-SX correlation functional",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("R. Peverati and D. G. Truhlar,  Phys. Chem. Chem. Phys. 14, 16187 (2012)", "10.1039/C2CP42576A", "@article{Peverati2012_16187,\n  author = {Peverati, R. and Truhlar, D. G.},\n  title = {Screened-exchange density functionals with broad accuracy for chemistry and solid-state physics},\n  journal = {Phys. Chem. Chem. Phys.},\n  year = {2012},\n  volume = {14},\n  issue = {47},\n  pages = {16187},\n  publisher = {The Royal Society of Chemistry},\n  doi = {10.1039/C2CP42576A},\n  url = {http://pubs.rsc.org/en/Content/ArticleLanding/2012/CP/c2cp42576a}\n}\n", "Peverati2012_16187"),
        ]),
    :gga_c_op_b88 => IdentifierText(
        "one-parameter progressive functional (B88 version)",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("T. Tsuneda, T. Suzumura, and K. Hirao,  J. Chem. Phys. 110, 10664 (1999)", "10.1063/1.479012", "@article{Tsuneda1999_10664,\n  author = {Tsuneda, T. and Suzumura, T. and Hirao, K.},\n  title = {A new one-parameter progressive {Colle}--{Salvetti}-type correlation functional},\n  journal = {J. Chem. Phys.},\n  year = {1999},\n  volume = {110},\n  number = {22},\n  pages = {10664},\n  doi = {10.1063/1.479012},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/110/22/10.1063/1.479012}\n}\n", "Tsuneda1999_10664"),
        ]),
    :gga_c_op_g96 => IdentifierText(
        "one-parameter progressive functional (G96 version)",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("T. Tsuneda, T. Suzumura, and K. Hirao,  J. Chem. Phys. 110, 10664 (1999)", "10.1063/1.479012", "@article{Tsuneda1999_10664,\n  author = {Tsuneda, T. and Suzumura, T. and Hirao, K.},\n  title = {A new one-parameter progressive {Colle}--{Salvetti}-type correlation functional},\n  journal = {J. Chem. Phys.},\n  year = {1999},\n  volume = {110},\n  number = {22},\n  pages = {10664},\n  doi = {10.1063/1.479012},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/110/22/10.1063/1.479012}\n}\n", "Tsuneda1999_10664"),
            LibxcReference("T. Tsuneda, T. Suzumura, and K. Hirao,  J. Chem. Phys. 111, 5656–5667 (1999)", "10.1063/1.479954", "@article{Tsuneda1999_5656,\n  author = {Tsuneda, Takao and Suzumura, Toshihisa and Hirao, Kimihiko},\n  title = {A reexamination of exchange energy functionals},\n  journal = {J. Chem. Phys.},\n  year = {1999},\n  volume = {111},\n  number = {13},\n  pages = {5656--5667},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/111/13/10.1063/1.479954},\n  doi = {10.1063/1.479954}\n}\n", "Tsuneda1999_5656"),
        ]),
    :gga_c_op_pbe => IdentifierText(
        "one-parameter progressive functional (PBE version)",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("T. Tsuneda, T. Suzumura, and K. Hirao,  J. Chem. Phys. 110, 10664 (1999)", "10.1063/1.479012", "@article{Tsuneda1999_10664,\n  author = {Tsuneda, T. and Suzumura, T. and Hirao, K.},\n  title = {A new one-parameter progressive {Colle}--{Salvetti}-type correlation functional},\n  journal = {J. Chem. Phys.},\n  year = {1999},\n  volume = {110},\n  number = {22},\n  pages = {10664},\n  doi = {10.1063/1.479012},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/110/22/10.1063/1.479012}\n}\n", "Tsuneda1999_10664"),
            LibxcReference("T. Tsuneda, T. Suzumura, and K. Hirao,  J. Chem. Phys. 111, 5656–5667 (1999)", "10.1063/1.479954", "@article{Tsuneda1999_5656,\n  author = {Tsuneda, Takao and Suzumura, Toshihisa and Hirao, Kimihiko},\n  title = {A reexamination of exchange energy functionals},\n  journal = {J. Chem. Phys.},\n  year = {1999},\n  volume = {111},\n  number = {13},\n  pages = {5656--5667},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/111/13/10.1063/1.479954},\n  doi = {10.1063/1.479954}\n}\n", "Tsuneda1999_5656"),
        ]),
    :gga_c_op_pw91 => IdentifierText(
        "one-parameter progressive functional (PW91 version)",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("T. Tsuneda, T. Suzumura, and K. Hirao,  J. Chem. Phys. 110, 10664 (1999)", "10.1063/1.479012", "@article{Tsuneda1999_10664,\n  author = {Tsuneda, T. and Suzumura, T. and Hirao, K.},\n  title = {A new one-parameter progressive {Colle}--{Salvetti}-type correlation functional},\n  journal = {J. Chem. Phys.},\n  year = {1999},\n  volume = {110},\n  number = {22},\n  pages = {10664},\n  doi = {10.1063/1.479012},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/110/22/10.1063/1.479012}\n}\n", "Tsuneda1999_10664"),
            LibxcReference("T. Tsuneda, T. Suzumura, and K. Hirao,  J. Chem. Phys. 111, 5656–5667 (1999)", "10.1063/1.479954", "@article{Tsuneda1999_5656,\n  author = {Tsuneda, Takao and Suzumura, Toshihisa and Hirao, Kimihiko},\n  title = {A reexamination of exchange energy functionals},\n  journal = {J. Chem. Phys.},\n  year = {1999},\n  volume = {111},\n  number = {13},\n  pages = {5656--5667},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/111/13/10.1063/1.479954},\n  doi = {10.1063/1.479954}\n}\n", "Tsuneda1999_5656"),
        ]),
    :gga_c_op_xalpha => IdentifierText(
        "one-parameter progressive functional (Xalpha version)",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("T. Tsuneda, T. Suzumura, and K. Hirao,  J. Chem. Phys. 110, 10664 (1999)", "10.1063/1.479012", "@article{Tsuneda1999_10664,\n  author = {Tsuneda, T. and Suzumura, T. and Hirao, K.},\n  title = {A new one-parameter progressive {Colle}--{Salvetti}-type correlation functional},\n  journal = {J. Chem. Phys.},\n  year = {1999},\n  volume = {110},\n  number = {22},\n  pages = {10664},\n  doi = {10.1063/1.479012},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/110/22/10.1063/1.479012}\n}\n", "Tsuneda1999_10664"),
            LibxcReference("T. Tsuneda, T. Suzumura, and K. Hirao,  J. Chem. Phys. 111, 5656–5667 (1999)", "10.1063/1.479954", "@article{Tsuneda1999_5656,\n  author = {Tsuneda, Takao and Suzumura, Toshihisa and Hirao, Kimihiko},\n  title = {A reexamination of exchange energy functionals},\n  journal = {J. Chem. Phys.},\n  year = {1999},\n  volume = {111},\n  number = {13},\n  pages = {5656--5667},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/111/13/10.1063/1.479954},\n  doi = {10.1063/1.479954}\n}\n", "Tsuneda1999_5656"),
        ]),
    :gga_c_optc => IdentifierText(
        "Optimized correlation functional of Cohen and Handy",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("A. J. Cohen and N. C. Handy,  Mol. Phys. 99, 607 (2001)", "10.1080/00268970010023435", "@article{Cohen2001_607,\n  author = {Cohen, A. J. and Handy, N. C.},\n  title = {Dynamic correlation},\n  journal = {Mol. Phys.},\n  volume = {99},\n  number = {7},\n  pages = {607},\n  year = {2001},\n  doi = {10.1080/00268970010023435},\n  url = {http://www.tandfonline.com/doi/abs/10.1080/00268970010023435}\n}\n", "Cohen2001_607"),
        ]),
    :gga_c_p86 => IdentifierText(
        "Perdew 86",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("J. P. Perdew,  Phys. Rev. B 33, 8822 (1986)", "10.1103/PhysRevB.33.8822", "@article{Perdew1986_8822,\n  author = {Perdew, J. P.},\n  title = {Density-functional approximation for the correlation energy of the inhomogeneous electron gas},\n  journal = {Phys. Rev. B},\n  volume = {33},\n  issue = {12},\n  pages = {8822},\n  year = {1986},\n  month = {Jun},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevB.33.8822},\n  url = {http://link.aps.org/doi/10.1103/PhysRevB.33.8822}\n}\n", "Perdew1986_8822"),
            LibxcReference("J. P. Perdew,  Phys. Rev. B 34, 7406–7406 (1986)", "10.1103/PhysRevB.34.7406", "@article{Perdew1986_7406,\n  author = {Perdew, John P.},\n  title = {Erratum: {Density}-functional approximation for the correlation energy of the inhomogeneous electron gas},\n  journal = {Phys. Rev. B},\n  volume = {34},\n  issue = {10},\n  pages = {7406--7406},\n  year = {1986},\n  month = {Nov},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevB.34.7406},\n  url = {https://link.aps.org/doi/10.1103/PhysRevB.34.7406}\n}\n", "Perdew1986_7406"),
        ]),
    :gga_c_p86_ft => IdentifierText(
        "Perdew 86 with more accurate value for ftilde",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("J. P. Perdew,  Phys. Rev. B 33, 8822 (1986)", "10.1103/PhysRevB.33.8822", "@article{Perdew1986_8822,\n  author = {Perdew, J. P.},\n  title = {Density-functional approximation for the correlation energy of the inhomogeneous electron gas},\n  journal = {Phys. Rev. B},\n  volume = {33},\n  issue = {12},\n  pages = {8822},\n  year = {1986},\n  month = {Jun},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevB.33.8822},\n  url = {http://link.aps.org/doi/10.1103/PhysRevB.33.8822}\n}\n", "Perdew1986_8822"),
            LibxcReference("J. P. Perdew,  Phys. Rev. B 34, 7406–7406 (1986)", "10.1103/PhysRevB.34.7406", "@article{Perdew1986_7406,\n  author = {Perdew, John P.},\n  title = {Erratum: {Density}-functional approximation for the correlation energy of the inhomogeneous electron gas},\n  journal = {Phys. Rev. B},\n  volume = {34},\n  issue = {10},\n  pages = {7406--7406},\n  year = {1986},\n  month = {Nov},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevB.34.7406},\n  url = {https://link.aps.org/doi/10.1103/PhysRevB.34.7406}\n}\n", "Perdew1986_7406"),
        ]),
    :gga_c_p86vwn => IdentifierText(
        "Perdew 86 based on VWN5 correlation",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("J. P. Perdew,  Phys. Rev. B 33, 8822 (1986)", "10.1103/PhysRevB.33.8822", "@article{Perdew1986_8822,\n  author = {Perdew, J. P.},\n  title = {Density-functional approximation for the correlation energy of the inhomogeneous electron gas},\n  journal = {Phys. Rev. B},\n  volume = {33},\n  issue = {12},\n  pages = {8822},\n  year = {1986},\n  month = {Jun},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevB.33.8822},\n  url = {http://link.aps.org/doi/10.1103/PhysRevB.33.8822}\n}\n", "Perdew1986_8822"),
        ]),
    :gga_c_p86vwn_ft => IdentifierText(
        "Perdew 86 based on VWN5 correlation, with more accurate value for ftilde",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("J. P. Perdew,  Phys. Rev. B 33, 8822 (1986)", "10.1103/PhysRevB.33.8822", "@article{Perdew1986_8822,\n  author = {Perdew, J. P.},\n  title = {Density-functional approximation for the correlation energy of the inhomogeneous electron gas},\n  journal = {Phys. Rev. B},\n  volume = {33},\n  issue = {12},\n  pages = {8822},\n  year = {1986},\n  month = {Jun},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevB.33.8822},\n  url = {http://link.aps.org/doi/10.1103/PhysRevB.33.8822}\n}\n", "Perdew1986_8822"),
        ]),
    :gga_c_pbe => IdentifierText(
        "Perdew, Burke & Ernzerhof",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("J. P. Perdew, K. Burke, and M. Ernzerhof,  Phys. Rev. Lett. 77, 3865 (1996)", "10.1103/PhysRevLett.77.3865", "@article{Perdew1996_3865,\n  author = {Perdew, J. P. and Burke, K. and Ernzerhof, M.},\n  title = {Generalized Gradient Approximation Made Simple},\n  journal = {Phys. Rev. Lett.},\n  volume = {77},\n  issue = {18},\n  pages = {3865},\n  year = {1996},\n  month = {Oct},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevLett.77.3865},\n  url = {http://link.aps.org/doi/10.1103/PhysRevLett.77.3865}\n}\n", "Perdew1996_3865"),
            LibxcReference("J. P. Perdew, K. Burke, and M. Ernzerhof,  Phys. Rev. Lett. 78, 1396 (1997)", "10.1103/PhysRevLett.78.1396", "@article{Perdew1997_1396,\n  author = {Perdew, J. P. and Burke, K. and Ernzerhof, M.},\n  title = {Errata: {Generalized} Gradient Approximation Made Simple [{Phys.} {Rev.} {Lett.} 77, 3865 (1996)]},\n  journal = {Phys. Rev. Lett.},\n  volume = {78},\n  issue = {7},\n  pages = {1396},\n  year = {1997},\n  month = {Feb},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevLett.78.1396},\n  url = {http://link.aps.org/doi/10.1103/PhysRevLett.78.1396}\n}\n", "Perdew1997_1396"),
        ]),
    :gga_c_pbe_erf_gws => IdentifierText(
        "Short ranged PBE correlation (erfc)",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("E. Goll, H.-J. Werner, and H. Stoll,  Phys. Chem. Chem. Phys. 7, 3917–3923 (2005)", "10.1039/B509242F", "@article{Goll2005_3917,\n  author = {Goll, Erich and Werner, Hans-Joachim and Stoll, Hermann},\n  title = {A short-range gradient-corrected density functional in long-range coupled-cluster calculations for rare gas dimers},\n  journal = {Phys. Chem. Chem. Phys.},\n  year = {2005},\n  volume = {7},\n  issue = {23},\n  pages = {3917--3923},\n  publisher = {The Royal Society of Chemistry},\n  doi = {10.1039/B509242F},\n  url = {https://doi.org/10.1039/B509242F}\n}\n", "Goll2005_3917"),
            LibxcReference("E. Goll, H.-J. Werner, H. Stoll, T. Leininger, P. Gori-Giorgi, and A. Savin,  Chem. Phys. 329, 276–282 (2006)", "10.1016/j.chemphys.2006.05.020", "@article{Goll2006_276,\n  author = {Goll, Erich and Werner, Hans-Joachim and Stoll, Hermann and Leininger, Thierry and Gori-Giorgi, Paola and Savin, Andreas},\n  title = {A short-range gradient-corrected spin density functional in combination with long-range coupled-cluster methods: Application to alkali-metal rare-gas dimers},\n  journal = {Chem. Phys.},\n  volume = {329},\n  number = {1},\n  pages = {276--282},\n  year = {2006},\n  issn = {0301-0104},\n  doi = {10.1016/j.chemphys.2006.05.020},\n  url = {https://doi.org/10.1016/j.chemphys.2006.05.020}\n}\n", "Goll2006_276"),
        ]),
    :gga_c_pbe_gaussian => IdentifierText(
        "Perdew, Burke & Ernzerhof with parameters from Gaussian",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("J. P. Perdew, K. Burke, and M. Ernzerhof,  Phys. Rev. Lett. 77, 3865 (1996)", "10.1103/PhysRevLett.77.3865", "@article{Perdew1996_3865,\n  author = {Perdew, J. P. and Burke, K. and Ernzerhof, M.},\n  title = {Generalized Gradient Approximation Made Simple},\n  journal = {Phys. Rev. Lett.},\n  volume = {77},\n  issue = {18},\n  pages = {3865},\n  year = {1996},\n  month = {Oct},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevLett.77.3865},\n  url = {http://link.aps.org/doi/10.1103/PhysRevLett.77.3865}\n}\n", "Perdew1996_3865"),
            LibxcReference("J. P. Perdew, K. Burke, and M. Ernzerhof,  Phys. Rev. Lett. 78, 1396 (1997)", "10.1103/PhysRevLett.78.1396", "@article{Perdew1997_1396,\n  author = {Perdew, J. P. and Burke, K. and Ernzerhof, M.},\n  title = {Errata: {Generalized} Gradient Approximation Made Simple [{Phys.} {Rev.} {Lett.} 77, 3865 (1996)]},\n  journal = {Phys. Rev. Lett.},\n  volume = {78},\n  issue = {7},\n  pages = {1396},\n  year = {1997},\n  month = {Feb},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevLett.78.1396},\n  url = {http://link.aps.org/doi/10.1103/PhysRevLett.78.1396}\n}\n", "Perdew1997_1396"),
            LibxcReference("Defined through Gaussian implementation.", "", "@misc{gaussianimplementation,\n  note = {Defined through {Gaussian} implementation}\n}\n", "gaussianimplementation"),
        ]),
    :gga_c_pbe_jrgx => IdentifierText(
        "Reparametrized PBE by Pedroza, Silva & Capelle",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("L. S. Pedroza, A. J. R. da Silva, and K. Capelle,  Phys. Rev. B 79, 201106 (2009)", "10.1103/PhysRevB.79.201106", "@article{Pedroza2009_201106,\n  author = {Pedroza, L. S. and da Silva, A. J. R. and Capelle, K.},\n  title = {Gradient-dependent density functionals of the {Perdew}--{Burke}--{Ernzerhof} type for atoms, molecules, and solids},\n  journal = {Phys. Rev. B},\n  volume = {79},\n  issue = {20},\n  pages = {201106},\n  year = {2009},\n  month = {May},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevB.79.201106},\n  url = {http://link.aps.org/doi/10.1103/PhysRevB.79.201106}\n}\n", "Pedroza2009_201106"),
        ]),
    :gga_c_pbe_mol => IdentifierText(
        "Reparametrized PBE by del Campo, Gazquez, Trickey & Vela",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("J. M. del Campo, J. L. Gázquez, S. B. Trickey, and A. Vela,  J. Chem. Phys. 136, 104108 (2012)", "10.1063/1.3691197", "@article{delCampo2012_104108,\n  author = {del Campo, J. M. and G\\'{a}zquez, J. L. and Trickey, S. B. and Vela, A.},\n  title = {Non-empirical improvement of {PBE} and its hybrid {PBE0} for general description of molecular properties},\n  journal = {J. Chem. Phys.},\n  year = {2012},\n  volume = {136},\n  number = {10},\n  pages = {104108},\n  doi = {10.1063/1.3691197},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/136/10/10.1063/1.3691197}\n}\n", "delCampo2012_104108"),
        ]),
    :gga_c_pbe_sol => IdentifierText(
        "Perdew, Burke & Ernzerhof SOL",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("J. P. Perdew, A. Ruzsinszky, G. I. Csonka, O. A. Vydrov, G. E. Scuseria, L. A. Constantin, X. Zhou, and K. Burke,  Phys. Rev. Lett. 100, 136406 (2008)", "10.1103/PhysRevLett.100.136406", "@article{Perdew2008_136406,\n  author = {Perdew, J. P. and Ruzsinszky, A. and Csonka, G. I. and Vydrov, O. A. and Scuseria, G. E. and Constantin, L. A. and Zhou, X. and Burke, K.},\n  title = {Restoring the Density-Gradient Expansion for Exchange in Solids and Surfaces},\n  journal = {Phys. Rev. Lett.},\n  volume = {100},\n  issue = {13},\n  pages = {136406},\n  year = {2008},\n  month = {Apr},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevLett.100.136406},\n  url = {http://link.aps.org/doi/10.1103/PhysRevLett.100.136406}\n}\n", "Perdew2008_136406"),
        ]),
    :gga_c_pbe_vwn => IdentifierText(
        "Perdew, Burke & Ernzerhof based on VWN correlation",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3),
        LibxcReference[
            LibxcReference("E. Kraisler, G. Makov, and I. Kelson,  Phys. Rev. A 82, 042516 (2010)", "10.1103/PhysRevA.82.042516", "@article{Kraisler2010_042516,\n  author = {Kraisler, Eli and Makov, Guy and Kelson, Itzhak},\n  title = {Ensemble \$v\$-representable ab initio density-functional calculation of energy and spin in atoms: A test of exchange-correlation approximations},\n  journal = {Phys. Rev. A},\n  volume = {82},\n  issue = {4},\n  pages = {042516},\n  year = {2010},\n  month = {Oct},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevA.82.042516},\n  url = {https://link.aps.org/doi/10.1103/PhysRevA.82.042516}\n}\n", "Kraisler2010_042516"),
            LibxcReference("J. P. Perdew, K. Burke, and M. Ernzerhof,  Phys. Rev. Lett. 77, 3865 (1996)", "10.1103/PhysRevLett.77.3865", "@article{Perdew1996_3865,\n  author = {Perdew, J. P. and Burke, K. and Ernzerhof, M.},\n  title = {Generalized Gradient Approximation Made Simple},\n  journal = {Phys. Rev. Lett.},\n  volume = {77},\n  issue = {18},\n  pages = {3865},\n  year = {1996},\n  month = {Oct},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevLett.77.3865},\n  url = {http://link.aps.org/doi/10.1103/PhysRevLett.77.3865}\n}\n", "Perdew1996_3865"),
            LibxcReference("J. P. Perdew, K. Burke, and M. Ernzerhof,  Phys. Rev. Lett. 78, 1396 (1997)", "10.1103/PhysRevLett.78.1396", "@article{Perdew1997_1396,\n  author = {Perdew, J. P. and Burke, K. and Ernzerhof, M.},\n  title = {Errata: {Generalized} Gradient Approximation Made Simple [{Phys.} {Rev.} {Lett.} 77, 3865 (1996)]},\n  journal = {Phys. Rev. Lett.},\n  volume = {78},\n  issue = {7},\n  pages = {1396},\n  year = {1997},\n  month = {Feb},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevLett.78.1396},\n  url = {http://link.aps.org/doi/10.1103/PhysRevLett.78.1396}\n}\n", "Perdew1997_1396"),
        ]),
    :gga_c_pbefe => IdentifierText(
        "PBE for formation energies",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("R. Sarmiento-Pérez, S. Botti, and M. A. L. Marques,  J. Chem. Theory Comput. 11, 3844–3850 (2015)", "10.1021/acs.jctc.5b00529", "@article{Perez2015_3844,\n  author = {Sarmiento-P\\'{e}rez, Rafael and Botti, Silvana and Marques, Miguel A. L.},\n  title = {Optimized Exchange and Correlation Semilocal Functional for the Calculation of Energies of Formation},\n  journal = {J. Chem. Theory Comput.},\n  volume = {11},\n  number = {8},\n  pages = {3844--3850},\n  year = {2015},\n  doi = {10.1021/acs.jctc.5b00529},\n  url = {https://doi.org/10.1021/acs.jctc.5b00529}\n}\n", "Perez2015_3844"),
        ]),
    :gga_c_pbeint => IdentifierText(
        "PBE for hybrid interfaces",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("E. Fabiano, L. A. Constantin, and F. Della Sala,  Phys. Rev. B 82, 113104 (2010)", "10.1103/PhysRevB.82.113104", "@article{Fabiano2010_113104,\n  author = {Fabiano, E. and Constantin, L. A. and Della Sala, F.},\n  title = {Generalized gradient approximation bridging the rapidly and slowly varying density regimes: A {PBE}-like functional for hybrid interfaces},\n  journal = {Phys. Rev. B},\n  volume = {82},\n  issue = {11},\n  pages = {113104},\n  year = {2010},\n  month = {Sep},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevB.82.113104},\n  url = {http://link.aps.org/doi/10.1103/PhysRevB.82.113104}\n}\n", "Fabiano2010_113104"),
        ]),
    :gga_c_pbeloc => IdentifierText(
        "Semilocal dynamical correlation",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("L. A. Constantin, E. Fabiano, and F. Della Sala,  Phys. Rev. B 86, 035130 (2012)", "10.1103/PhysRevB.86.035130", "@article{Constantin2012_035130,\n  author = {Constantin, Lucian A. and Fabiano, Eduardo and Della Sala, Fabio},\n  title = {Semilocal dynamical correlation with increased localization},\n  journal = {Phys. Rev. B},\n  volume = {86},\n  issue = {3},\n  pages = {035130},\n  year = {2012},\n  month = {Jul},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevB.86.035130},\n  url = {http://link.aps.org/doi/10.1103/PhysRevB.86.035130}\n}\n", "Constantin2012_035130"),
        ]),
    :gga_c_pw91 => IdentifierText(
        "Perdew & Wang 91",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("J. P. Perdew. In P. Ziesche and H. Eschrig, editors, Proceedings of the 75. WE-Heraeus-Seminar and 21st Annual International Symposium on Electronic Structure of Solids, 11. Berlin, 1991. Akademie Verlag.", "", "@inproceedings{Perdew1991,\n  author = {Perdew, J. P.},\n  editor = {Ziesche, P. and Eschrig, H.},\n  title = {},\n  booktitle = {Proceedings of the 75. WE-Heraeus-Seminar and 21st Annual International Symposium on Electronic Structure of Solids},\n  pages = {11},\n  year = {1991},\n  address = {Berlin},\n  publisher = {Akademie Verlag}\n}\n", "Perdew1991"),
            LibxcReference("J. P. Perdew, J. A. Chevary, S. H. Vosko, K. A. Jackson, M. R. Pederson, D. J. Singh, and C. Fiolhais,  Phys. Rev. B 46, 6671 (1992)", "10.1103/PhysRevB.46.6671", "@article{Perdew1992_6671,\n  author = {Perdew, J. P. and Chevary, J. A. and Vosko, S. H. and Jackson, K. A. and Pederson, M. R. and Singh, D. J. and Fiolhais, C.},\n  title = {Atoms, molecules, solids, and surfaces: Applications of the generalized gradient approximation for exchange and correlation},\n  journal = {Phys. Rev. B},\n  volume = {46},\n  issue = {11},\n  pages = {6671},\n  year = {1992},\n  month = {Sep},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevB.46.6671},\n  url = {http://link.aps.org/doi/10.1103/PhysRevB.46.6671}\n}\n", "Perdew1992_6671"),
            LibxcReference("J. P. Perdew, J. A. Chevary, S. H. Vosko, K. A. Jackson, M. R. Pederson, D. J. Singh, and C. Fiolhais,  Phys. Rev. B 48, 4978 (1993)", "10.1103/PhysRevB.48.4978.2", "@article{Perdew1993_4978,\n  author = {Perdew, J. P. and Chevary, J. A. and Vosko, S. H. and Jackson, K. A. and Pederson, M. R. and Singh, D. J. and Fiolhais, C.},\n  title = {Erratum: {Atoms}, molecules, solids, and surfaces: Applications of the generalized gradient approximation for exchange and correlation},\n  journal = {Phys. Rev. B},\n  volume = {48},\n  issue = {7},\n  pages = {4978},\n  year = {1993},\n  month = {Aug},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevB.48.4978.2},\n  url = {http://link.aps.org/doi/10.1103/PhysRevB.48.4978.2}\n}\n", "Perdew1993_4978"),
        ]),
    :gga_c_q2d => IdentifierText(
        "Chiodo et al",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("L. Chiodo, L. A. Constantin, E. Fabiano, and F. Della Sala,  Phys. Rev. Lett. 108, 126402 (2012)", "10.1103/PhysRevLett.108.126402", "@article{Chiodo2012_126402,\n  author = {Chiodo, L. and Constantin, L. A. and Fabiano, E. and Della Sala, F.},\n  title = {Nonuniform Scaling Applied to Surface Energies of Transition Metals},\n  journal = {Phys. Rev. Lett.},\n  volume = {108},\n  issue = {12},\n  pages = {126402},\n  year = {2012},\n  month = {Mar},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevLett.108.126402},\n  url = {http://link.aps.org/doi/10.1103/PhysRevLett.108.126402}\n}\n", "Chiodo2012_126402"),
        ]),
    :gga_c_regtpss => IdentifierText(
        "regularized TPSS correlation",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("J. P. Perdew, A. Ruzsinszky, G. I. Csonka, L. A. Constantin, and J. Sun,  Phys. Rev. Lett. 103, 026403 (2009)", "10.1103/PhysRevLett.103.026403", "@article{Perdew2009_026403,\n  author = {Perdew, J. P. and Ruzsinszky, A. and Csonka, G. I. and Constantin, L. A. and Sun, J.},\n  title = {Workhorse Semilocal Density Functional for Condensed Matter Physics and Quantum Chemistry},\n  journal = {Phys. Rev. Lett.},\n  volume = {103},\n  issue = {2},\n  pages = {026403},\n  year = {2009},\n  month = {Jul},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevLett.103.026403},\n  url = {http://link.aps.org/doi/10.1103/PhysRevLett.103.026403}\n}\n", "Perdew2009_026403"),
        ]),
    :gga_c_revtca => IdentifierText(
        "Tognetti, Cortona, Adamo (revised)",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("V. Tognetti, P. Cortona, and C. Adamo,  Chem. Phys. Lett. 460, 536 (2008)", "10.1016/j.cplett.2008.06.032", "@article{Tognetti2008_536,\n  author = {Tognetti, V. and Cortona, P. and Adamo, C.},\n  title = {Increasing physical constraints and improving performances in a parameter-free {GGA} functional},\n  journal = {Chem. Phys. Lett.},\n  volume = {460},\n  number = {4--6},\n  pages = {536},\n  year = {2008},\n  issn = {0009-2614},\n  doi = {10.1016/j.cplett.2008.06.032},\n  url = {http://www.sciencedirect.com/science/article/pii/S0009261408008464}\n}\n", "Tognetti2008_536"),
        ]),
    :gga_c_rge2 => IdentifierText(
        "Regularized PBE",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("A. Ruzsinszky, G. I. Csonka, and G. E. Scuseria,  J. Chem. Theory Comput. 5, 763 (2009)", "10.1021/ct8005369", "@article{Ruzsinszky2009_763,\n  author = {Ruzsinszky, A. and Csonka, G. I. and Scuseria, G. E.},\n  title = {Regularized Gradient Expansion for Atoms, Molecules, and Solids},\n  journal = {J. Chem. Theory Comput.},\n  volume = {5},\n  number = {4},\n  pages = {763},\n  year = {2009},\n  doi = {10.1021/ct8005369},\n  url = {http://pubs.acs.org/doi/abs/10.1021/ct8005369}\n}\n", "Ruzsinszky2009_763"),
        ]),
    :gga_c_scan_e0 => IdentifierText(
        "GGA component of SCAN",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("J. Sun, A. Ruzsinszky, and J. P. Perdew,  Phys. Rev. Lett. 115, 036402 (2015)", "10.1103/PhysRevLett.115.036402", "@article{Sun2015_036402,\n  author = {Sun, Jianwei and Ruzsinszky, Adrienn and Perdew, John P.},\n  title = {Strongly Constrained and Appropriately Normed Semilocal Density Functional},\n  journal = {Phys. Rev. Lett.},\n  volume = {115},\n  issue = {3},\n  pages = {036402},\n  year = {2015},\n  month = {Jul},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevLett.115.036402},\n  url = {http://link.aps.org/doi/10.1103/PhysRevLett.115.036402}\n}\n", "Sun2015_036402"),
        ]),
    :gga_c_sg4 => IdentifierText(
        "Semiclassical GGA at fourth order",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("L. A. Constantin, A. Terentjevs, F. Della Sala, P. Cortona, and E. Fabiano,  Phys. Rev. B 93, 045126 (2016)", "10.1103/PhysRevB.93.045126", "@article{Constantin2016_045126,\n  author = {Constantin, Lucian A. and Terentjevs, Aleksandrs and Della Sala, Fabio and Cortona, Pietro and Fabiano, Eduardo},\n  title = {Semiclassical atom theory applied to solid-state physics},\n  journal = {Phys. Rev. B},\n  volume = {93},\n  issue = {4},\n  pages = {045126},\n  year = {2016},\n  month = {Jan},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevB.93.045126},\n  url = {http://link.aps.org/doi/10.1103/PhysRevB.93.045126}\n}\n", "Constantin2016_045126"),
        ]),
    :gga_c_sogga11 => IdentifierText(
        "Second-order generalized gradient approximation 2011",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("R. Peverati, Y. Zhao, and D. G. Truhlar,  J. Phys. Chem. Lett. 2, 1991 (2011)", "10.1021/jz200616w", "@article{Peverati2011_1991,\n  author = {Peverati, R. and Zhao, Y. and Truhlar, D. G.},\n  title = {Generalized Gradient Approximation That Recovers the Second-Order Density-Gradient Expansion with Optimized Across-the-Board Performance},\n  journal = {J. Phys. Chem. Lett.},\n  volume = {2},\n  number = {16},\n  pages = {1991},\n  year = {2011},\n  doi = {10.1021/jz200616w},\n  url = {http://pubs.acs.org/doi/abs/10.1021/jz200616w}\n}\n", "Peverati2011_1991"),
        ]),
    :gga_c_sogga11_x => IdentifierText(
        "To be used with HYB_GGA_X_SOGGA11_X",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("R. Peverati and D. G. Truhlar,  J. Chem. Phys. 135, 191102 (2011)", "10.1063/1.3663871", "@article{Peverati2011_191102,\n  author = {Peverati, R. and Truhlar, D. G.},\n  title = {Communication: A global hybrid generalized gradient approximation to the exchange-correlation functional that satisfies the second-order density-gradient constraint and has broad applicability in chemistry},\n  journal = {J. Chem. Phys.},\n  year = {2011},\n  volume = {135},\n  number = {19},\n  pages = {191102},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/135/19/10.1063/1.3663871},\n  doi = {10.1063/1.3663871}\n}\n", "Peverati2011_191102"),
        ]),
    :gga_c_spbe => IdentifierText(
        "PBE correlation to be used with the SSB exchange",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("M. Swart, M. Solá, and F. M. Bickelhaupt,  J. Chem. Phys. 131, 094103 (2009)", "10.1063/1.3213193", "@article{Swart2009_094103,\n  author = {Swart, M. and Sol\\'{a}, M. and Bickelhaupt, F. M.},\n  title = {A new all-round density functional based on spin states and \${\\rm S}\\_{\\rm N} 2\$ barriers},\n  journal = {J. Chem. Phys.},\n  year = {2009},\n  volume = {131},\n  number = {9},\n  pages = {094103},\n  doi = {10.1063/1.3213193},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/131/9/10.1063/1.3213193}\n}\n", "Swart2009_094103"),
        ]),
    :gga_c_tau_hcth => IdentifierText(
        "correlation part of tau-hcth",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("A. D. Boese and N. C. Handy,  J. Chem. Phys. 116, 9559 (2002)", "10.1063/1.1476309", "@article{Boese2002_9559,\n  author = {Boese, A. D. and Handy, N. C.},\n  title = {New exchange-correlation density functionals: The role of the kinetic-energy density},\n  journal = {J. Chem. Phys.},\n  year = {2002},\n  volume = {116},\n  number = {22},\n  pages = {9559},\n  doi = {10.1063/1.1476309},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/116/22/10.1063/1.1476309}\n}\n", "Boese2002_9559"),
        ]),
    :gga_c_tca => IdentifierText(
        "Tognetti, Cortona, Adamo",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("V. Tognetti, P. Cortona, and C. Adamo,  J. Chem. Phys. 128, 034101 (2008)", "10.1063/1.2816137", "@article{Tognetti2008_034101,\n  author = {Tognetti, V. and Cortona, P. and Adamo, C.},\n  title = {A new parameter-free correlation functional based on an average atomic reduced density gradient analysis},\n  journal = {J. Chem. Phys.},\n  year = {2008},\n  volume = {128},\n  number = {3},\n  pages = {034101},\n  doi = {10.1063/1.2816137},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/128/3/10.1063/1.2816137}\n}\n", "Tognetti2008_034101"),
        ]),
    :gga_c_tm_lyp => IdentifierText(
        "Thakkar and McCarthy reparametrization, also known as reLYP",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("A. J. Thakkar and S. P. McCarthy,  J. Chem. Phys. 131, 134109 (2009)", "10.1063/1.3243845", "@article{Thakkar2009_134109,\n  author = {Thakkar, Ajit J. and McCarthy, Shane P.},\n  title = {Toward improved density functionals for the correlation energy},\n  journal = {J. Chem. Phys.},\n  volume = {131},\n  number = {13},\n  pages = {134109},\n  year = {2009},\n  doi = {10.1063/1.3243845},\n  url = {https://doi.org/10.1063/1.3243845}\n}\n", "Thakkar2009_134109"),
        ]),
    :gga_c_tm_pbe => IdentifierText(
        "Thakkar and McCarthy reparametrization",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("A. J. Thakkar and S. P. McCarthy,  J. Chem. Phys. 131, 134109 (2009)", "10.1063/1.3243845", "@article{Thakkar2009_134109,\n  author = {Thakkar, Ajit J. and McCarthy, Shane P.},\n  title = {Toward improved density functionals for the correlation energy},\n  journal = {J. Chem. Phys.},\n  volume = {131},\n  number = {13},\n  pages = {134109},\n  year = {2009},\n  doi = {10.1063/1.3243845},\n  url = {https://doi.org/10.1063/1.3243845}\n}\n", "Thakkar2009_134109"),
        ]),
    :gga_c_w94 => IdentifierText(
        "Wilson 94 (Eq. 25)",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("L. C. Wilson,  Chem. Phys. 181, 337–353 (1994)", "10.1016/0301-0104(93)E0444-Z", "@article{Wilson1994_337,\n  author = {Wilson, Leslie C.},\n  title = {Development of non-local {Wigner}-like correlation-energy density functionals through coordinate scaling requirements and evaluation of contraint obedience in the construction of density functionals},\n  journal = {Chem. Phys.},\n  volume = {181},\n  number = {3},\n  pages = {337--353},\n  year = {1994},\n  issn = {0301-0104},\n  doi = {10.1016/0301-0104(93)E0444-Z},\n  url = {http://www.sciencedirect.com/science/article/pii/0301010493E0444Z}\n}\n", "Wilson1994_337"),
        ]),
    :gga_c_wi => IdentifierText(
        "Wilson & Ivanov",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("L. C. Wilson and S. Ivanov,  Int. J. Quantum Chem. 69, 523 (1998)", "10.1002/(SICI)1097-461X(1998)69:4<523::AID-QUA9>3.0.CO;2-X", "@article{Wilson1998_523,\n  author = {Wilson, L. C. and Ivanov, S.},\n  title = {A new {Wigner}-like correlation-energy functional from coordinate scaling requirements},\n  journal = {Int. J. Quantum Chem.},\n  volume = {69},\n  number = {4},\n  pages = {523},\n  year = {1998},\n  publisher = {John Wiley \\& Sons, Inc.},\n  issn = {1097-461X},\n  doi = {10.1002/(SICI)1097-461X(1998)69:4<523::AID-QUA9>3.0.CO;2-X},\n  url = {http://onlinelibrary.wiley.com/doi/10.1002/(SICI)1097-461X(1998)69:4<523::AID-QUA9>3.0.CO;2-X/abstract}\n}\n", "Wilson1998_523"),
        ]),
    :gga_c_wi0 => IdentifierText(
        "Wilson & Ivanov initial version",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("L. C. Wilson and S. Ivanov,  Int. J. Quantum Chem. 69, 523 (1998)", "10.1002/(SICI)1097-461X(1998)69:4<523::AID-QUA9>3.0.CO;2-X", "@article{Wilson1998_523,\n  author = {Wilson, L. C. and Ivanov, S.},\n  title = {A new {Wigner}-like correlation-energy functional from coordinate scaling requirements},\n  journal = {Int. J. Quantum Chem.},\n  volume = {69},\n  number = {4},\n  pages = {523},\n  year = {1998},\n  publisher = {John Wiley \\& Sons, Inc.},\n  issn = {1097-461X},\n  doi = {10.1002/(SICI)1097-461X(1998)69:4<523::AID-QUA9>3.0.CO;2-X},\n  url = {http://onlinelibrary.wiley.com/doi/10.1002/(SICI)1097-461X(1998)69:4<523::AID-QUA9>3.0.CO;2-X/abstract}\n}\n", "Wilson1998_523"),
        ]),
    :gga_c_wl => IdentifierText(
        "Wilson & Levy",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("L. C. Wilson and M. Levy,  Phys. Rev. B 41, 12930 (1990)", "10.1103/PhysRevB.41.12930", "@article{Wilson1990_12930,\n  author = {Wilson, L. C. and Levy, M.},\n  title = {Nonlocal {Wigner}-like correlation-energy density functional through coordinate scaling},\n  journal = {Phys. Rev. B},\n  volume = {41},\n  issue = {18},\n  pages = {12930},\n  year = {1990},\n  month = {Jun},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevB.41.12930},\n  url = {http://link.aps.org/doi/10.1103/PhysRevB.41.12930}\n}\n", "Wilson1990_12930"),
        ]),
    :gga_c_xpbe => IdentifierText(
        "Extended PBE by Xu & Goddard III",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("X. Xu and W. A. Goddard,  J. Chem. Phys. 121, 4068 (2004)", "10.1063/1.1771632", "@article{Xu2004_4068,\n  author = {Xu, X. and Goddard, W. A.},\n  title = {The extended {Perdew}--{Burke}--{Ernzerhof} functional with improved accuracy for thermodynamic and electronic properties of molecular systems},\n  journal = {J. Chem. Phys.},\n  year = {2004},\n  volume = {121},\n  number = {9},\n  pages = {4068},\n  doi = {10.1063/1.1771632},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/121/9/10.1063/1.1771632}\n}\n", "Xu2004_4068"),
        ]),
    :gga_c_zpbeint => IdentifierText(
        "spin-dependent gradient correction to PBEint",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("L. A. Constantin, E. Fabiano, and F. Della Sala,  Phys. Rev. B 84, 233103 (2011)", "10.1103/PhysRevB.84.233103", "@article{Constantin2011_233103,\n  author = {Constantin, L. A. and Fabiano, E. and Della Sala, F.},\n  title = {Improving atomization energies of molecules and solids with a spin-dependent gradient correction from one-electron density analysis},\n  journal = {Phys. Rev. B},\n  volume = {84},\n  issue = {23},\n  pages = {233103},\n  year = {2011},\n  month = {Dec},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevB.84.233103},\n  url = {http://link.aps.org/doi/10.1103/PhysRevB.84.233103}\n}\n", "Constantin2011_233103"),
        ]),
    :gga_c_zpbesol => IdentifierText(
        "spin-dependent gradient correction to PBEsol",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("L. A. Constantin, E. Fabiano, and F. Della Sala,  Phys. Rev. B 84, 233103 (2011)", "10.1103/PhysRevB.84.233103", "@article{Constantin2011_233103,\n  author = {Constantin, L. A. and Fabiano, E. and Della Sala, F.},\n  title = {Improving atomization energies of molecules and solids with a spin-dependent gradient correction from one-electron density analysis},\n  journal = {Phys. Rev. B},\n  volume = {84},\n  issue = {23},\n  pages = {233103},\n  year = {2011},\n  month = {Dec},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevB.84.233103},\n  url = {http://link.aps.org/doi/10.1103/PhysRevB.84.233103}\n}\n", "Constantin2011_233103"),
        ]),
    :gga_c_zvpbeint => IdentifierText(
        "another spin-dependent correction to PBEint",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("L. A. Constantin, E. Fabiano, and F. Della Sala,  J. Chem. Phys. 137, 194105 (2012)", "10.1063/1.4766324", "@article{Constantin2012_194105,\n  author = {Constantin, Lucian A. and Fabiano, Eduardo and Della Sala, Fabio},\n  title = {Spin-dependent gradient correction for more accurate atomization energies of molecules},\n  journal = {J. Chem. Phys.},\n  volume = {137},\n  number = {19},\n  pages = {194105},\n  year = {2012},\n  doi = {10.1063/1.4766324},\n  url = {https://doi.org/10.1063/1.4766324}\n}\n", "Constantin2012_194105"),
        ]),
    :gga_c_zvpbeloc => IdentifierText(
        "PBEloc variation with enhanced compatibility with exact exchange",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("E. Fabiano, L. A. Constantin, P. Cortona, and F. Della Sala,  J. Chem. Theory Comput. 11, 122–131 (2015)", "10.1021/ct500902p", "@article{Fabiano2015_122,\n  author = {Fabiano, Eduardo and Constantin, Lucian A. and Cortona, Pietro and Della Sala, Fabio},\n  title = {Global Hybrids from the Semiclassical Atom Theory Satisfying the Local Density Linear Response},\n  journal = {J. Chem. Theory Comput.},\n  volume = {11},\n  number = {1},\n  pages = {122--131},\n  year = {2015},\n  doi = {10.1021/ct500902p},\n  url = {https://doi.org/10.1021/ct500902p}\n}\n", "Fabiano2015_122"),
        ]),
    :gga_c_zvpbesol => IdentifierText(
        "another spin-dependent correction to PBEsol",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("L. A. Constantin, E. Fabiano, and F. Della Sala,  J. Chem. Phys. 137, 194105 (2012)", "10.1063/1.4766324", "@article{Constantin2012_194105,\n  author = {Constantin, Lucian A. and Fabiano, Eduardo and Della Sala, Fabio},\n  title = {Spin-dependent gradient correction for more accurate atomization energies of molecules},\n  journal = {J. Chem. Phys.},\n  volume = {137},\n  number = {19},\n  pages = {194105},\n  year = {2012},\n  doi = {10.1063/1.4766324},\n  url = {https://doi.org/10.1063/1.4766324}\n}\n", "Constantin2012_194105"),
        ]),
    :gga_k_absp1 => IdentifierText(
        "gamma-TFvW form by Acharya et al [\$g = 1 - 1.412/N^{1/3}\$]",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("P. K. Acharya, L. J. Bartolotti, S. B. Sears, and R. G. Parr,  Proc. Natl. Acad. Sci. U. S. A. 77, 6978 (1980)", "10.1073/pnas.77.12.6978", "@article{Acharya1980_6978,\n  author = {Acharya, P. K. and Bartolotti, L. J. and Sears, S. B. and Parr, R. G.},\n  title = {An atomic kinetic energy functional with full {Weizsacker} correction},\n  journal = {Proc. Natl. Acad. Sci. U. S. A.},\n  volume = {77},\n  number = {12},\n  pages = {6978},\n  year = {1980},\n  doi = {10.1073/pnas.77.12.6978},\n  url = {http://www.pnas.org/content/77/12/6978.abstract}\n}\n", "Acharya1980_6978"),
        ]),
    :gga_k_absp2 => IdentifierText(
        "gamma-TFvW form by Acharya et al [\$g = 1 - 1.332/N^{1/3}\$]",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("P. K. Acharya, L. J. Bartolotti, S. B. Sears, and R. G. Parr,  Proc. Natl. Acad. Sci. U. S. A. 77, 6978 (1980)", "10.1073/pnas.77.12.6978", "@article{Acharya1980_6978,\n  author = {Acharya, P. K. and Bartolotti, L. J. and Sears, S. B. and Parr, R. G.},\n  title = {An atomic kinetic energy functional with full {Weizsacker} correction},\n  journal = {Proc. Natl. Acad. Sci. U. S. A.},\n  volume = {77},\n  number = {12},\n  pages = {6978},\n  year = {1980},\n  doi = {10.1073/pnas.77.12.6978},\n  url = {http://www.pnas.org/content/77/12/6978.abstract}\n}\n", "Acharya1980_6978"),
        ]),
    :gga_k_absp3 => IdentifierText(
        "gamma-TFvW form by Acharya et al [\$g = 1 - 1.513/N^{0.35}]\$",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("P. K. Acharya, L. J. Bartolotti, S. B. Sears, and R. G. Parr,  Proc. Natl. Acad. Sci. U. S. A. 77, 6978 (1980)", "10.1073/pnas.77.12.6978", "@article{Acharya1980_6978,\n  author = {Acharya, P. K. and Bartolotti, L. J. and Sears, S. B. and Parr, R. G.},\n  title = {An atomic kinetic energy functional with full {Weizsacker} correction},\n  journal = {Proc. Natl. Acad. Sci. U. S. A.},\n  volume = {77},\n  number = {12},\n  pages = {6978},\n  year = {1980},\n  doi = {10.1073/pnas.77.12.6978},\n  url = {http://www.pnas.org/content/77/12/6978.abstract}\n}\n", "Acharya1980_6978"),
        ]),
    :gga_k_absp4 => IdentifierText(
        "gamma-TFvW form by Acharya et al [\$g = l = 1/(1 + 1.332/N^{1/3})\$]",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("P. K. Acharya, L. J. Bartolotti, S. B. Sears, and R. G. Parr,  Proc. Natl. Acad. Sci. U. S. A. 77, 6978 (1980)", "10.1073/pnas.77.12.6978", "@article{Acharya1980_6978,\n  author = {Acharya, P. K. and Bartolotti, L. J. and Sears, S. B. and Parr, R. G.},\n  title = {An atomic kinetic energy functional with full {Weizsacker} correction},\n  journal = {Proc. Natl. Acad. Sci. U. S. A.},\n  volume = {77},\n  number = {12},\n  pages = {6978},\n  year = {1980},\n  doi = {10.1073/pnas.77.12.6978},\n  url = {http://www.pnas.org/content/77/12/6978.abstract}\n}\n", "Acharya1980_6978"),
        ]),
    :gga_k_apbe => IdentifierText(
        "mu fixed from the semiclassical neutral atom",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("L. A. Constantin, E. Fabiano, S. Laricchia, and F. Della Sala,  Phys. Rev. Lett. 106, 186406 (2011)", "10.1103/PhysRevLett.106.186406", "@article{Constantin2011_186406,\n  author = {Constantin, L. A. and Fabiano, E. and Laricchia, S. and Della Sala, F.},\n  title = {Semiclassical Neutral Atom as a Reference System in Density Functional Theory},\n  journal = {Phys. Rev. Lett.},\n  volume = {106},\n  issue = {18},\n  pages = {186406},\n  year = {2011},\n  month = {May},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevLett.106.186406},\n  url = {http://link.aps.org/doi/10.1103/PhysRevLett.106.186406}\n}\n", "Constantin2011_186406"),
        ]),
    :gga_k_apbeint => IdentifierText(
        "interpolated version of APBE",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("S. Laricchia, E. Fabiano, L. A. Constantin, and F. Della Sala,  J. Chem. Theory Comput. 7, 2439 (2011)", "10.1021/ct200382w", "@article{Laricchia2011_2439,\n  author = {Laricchia, S. and Fabiano, E. and Constantin, L. A. and Della Sala, F.},\n  title = {Generalized Gradient Approximations of the Noninteracting Kinetic Energy from the Semiclassical Atom Theory: Rationalization of the Accuracy of the Frozen Density Embedding Theory for Nonbonded Interactions},\n  journal = {J. Chem. Theory Comput.},\n  volume = {7},\n  number = {8},\n  pages = {2439},\n  year = {2011},\n  doi = {10.1021/ct200382w},\n  url = {http://pubs.acs.org/doi/abs/10.1021/ct200382w}\n}\n", "Laricchia2011_2439"),
        ]),
    :gga_k_baltin => IdentifierText(
        "TF-lambda-vW form by Baltin (l = 5/9)",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("R. Baltin,  Z. Naturforsch. A 27, 1176–1186 (1972)", "10.1515/zna-1972-8-903", "@article{Baltin1972_1176,\n  author = {Baltin, R.},\n  title = {The Energy-Density Functional of an Electron Gas in Locally Linear Approximation of the One-Body Potential},\n  journal = {Z. Naturforsch. A},\n  year = {1972},\n  publisher = {De Gruyter},\n  address = {Berlin, Boston},\n  volume = {27},\n  number = {8-9},\n  doi = {10.1515/zna-1972-8-903},\n  pages = {1176--1186},\n  url = {https://www.degruyter.com/view/journals/zna/27/8-9/article-p1176.xml}\n}\n", "Baltin1972_1176"),
        ]),
    :gga_k_dk => IdentifierText(
        "DePristo and Kress",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("A. E. DePristo and J. D. Kress,  Phys. Rev. A 35, 438 (1987)", "10.1103/PhysRevA.35.438", "@article{DePristo1987_438,\n  author = {DePristo, A. E. and Kress, J. D.},\n  title = {Kinetic-energy functionals via {Pad\\'{e}} approximations},\n  journal = {Phys. Rev. A},\n  volume = {35},\n  issue = {1},\n  pages = {438},\n  year = {1987},\n  month = {Jan},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevA.35.438},\n  url = {http://link.aps.org/doi/10.1103/PhysRevA.35.438}\n}\n", "DePristo1987_438"),
        ]),
    :gga_k_ernzerhof => IdentifierText(
        "Ernzerhof",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("M. Ernzerhof,  J. Mol. Struct.: THEOCHEM 501–502, 59 (2000)", "10.1016/S0166-1280(99)00414-5", "@article{Ernzerhof2000_59,\n  author = {Ernzerhof, M.},\n  title = {The role of the kinetic energy density in approximations to the exchange energy},\n  journal = {J. Mol. Struct.: THEOCHEM},\n  volume = {501--502},\n  number = {0},\n  pages = {59},\n  year = {2000},\n  issn = {0166-1280},\n  doi = {10.1016/S0166-1280(99)00414-5},\n  url = {http://www.sciencedirect.com/science/article/pii/S0166128099004145}\n}\n", "Ernzerhof2000_59"),
        ]),
    :gga_k_exp4 => IdentifierText(
        "Intermediate form between PBE3 and PBE4",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("V. V. Karasiev, S. B. Trickey, and F. E. Harris,  J. Comput.-Aided Mater. Des. 13, 111–129 (2006)", "10.1007/s10820-006-9019-8", "@article{Karasiev2006_111,\n  author = {Karasiev, V. V. and Trickey, S. B. and Harris, Frank E.},\n  title = {{Born}--{Oppenheimer} Interatomic Forces from Simple, Local Kinetic Energy Density Functionals},\n  journal = {J. Comput.-Aided Mater. Des.},\n  year = {2006},\n  month = {Oct},\n  day = {01},\n  volume = {13},\n  number = {1},\n  pages = {111--129},\n  issn = {1573-4900},\n  doi = {10.1007/s10820-006-9019-8},\n  url = {https://doi.org/10.1007/s10820-006-9019-8}\n}\n", "Karasiev2006_111"),
        ]),
    :gga_k_fr_b88 => IdentifierText(
        "Fuentealba & Reyes (B88 version)",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("P. Fuentealba and O. Reyes,  Chem. Phys. Lett. 232, 31 (1995)", "10.1016/0009-2614(94)01321-L", "@article{Fuentealba1995_31,\n  author = {Fuentealba, P. and Reyes, O.},\n  title = {Further evidence of the conjoint correction to the local kinetic and exchange energy density functionals},\n  journal = {Chem. Phys. Lett.},\n  volume = {232},\n  number = {1--2},\n  pages = {31},\n  year = {1995},\n  issn = {0009-2614},\n  doi = {10.1016/0009-2614(94)01321-L},\n  url = {http://www.sciencedirect.com/science/article/pii/000926149401321L}\n}\n", "Fuentealba1995_31"),
        ]),
    :gga_k_fr_pw86 => IdentifierText(
        "Fuentealba & Reyes (PW86 version)",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("P. Fuentealba and O. Reyes,  Chem. Phys. Lett. 232, 31 (1995)", "10.1016/0009-2614(94)01321-L", "@article{Fuentealba1995_31,\n  author = {Fuentealba, P. and Reyes, O.},\n  title = {Further evidence of the conjoint correction to the local kinetic and exchange energy density functionals},\n  journal = {Chem. Phys. Lett.},\n  volume = {232},\n  number = {1--2},\n  pages = {31},\n  year = {1995},\n  issn = {0009-2614},\n  doi = {10.1016/0009-2614(94)01321-L},\n  url = {http://www.sciencedirect.com/science/article/pii/000926149401321L}\n}\n", "Fuentealba1995_31"),
        ]),
    :gga_k_gds08 => IdentifierText(
        "Combined analytical theory with Monte Carlo sampling",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("L. M. Ghiringhelli and L. Delle Site,  Phys. Rev. B 77, 073104 (2008)", "10.1103/PhysRevB.77.073104", "@article{Ghiringhelli2008_073104,\n  author = {Ghiringhelli, Luca M. and Delle Site, Luigi},\n  title = {Design of kinetic functionals for many-body electron systems: Combining analytical theory with {Monte} {Carlo} sampling of electronic configurations},\n  journal = {Phys. Rev. B},\n  volume = {77},\n  issue = {7},\n  pages = {073104},\n  year = {2008},\n  month = {Feb},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevB.77.073104},\n  url = {https://link.aps.org/doi/10.1103/PhysRevB.77.073104}\n}\n", "Ghiringhelli2008_073104"),
        ]),
    :gga_k_ge2 => IdentifierText(
        "Second-order gradient expansion of the kinetic energy density",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("A. S. Kompaneets and E. S. Pavlovskii,  Zh. Eksp. Teor. Fiz. 31, 427 (1956)", "", "@article{Kompaneets1956_427,\n  author = {Kompaneets, A. S. and Pavlovskii, E. S.},\n  title = {The Self-consistent Field Equations in an Atom},\n  journal = {Zh. Eksp. Teor. Fiz.},\n  year = {1956},\n  volume = {31},\n  pages = {427},\n  note = {[J. Exp. Theor. Phys. 4, 328 (1957)]}\n}\n", "Kompaneets1956_427"),
            LibxcReference("D. A. Kirznits,  Zh. Eksp. Teor. Fiz. 32, 115 (1957)", "", "@article{Kirznits1957_115,\n  author = {Kirznits, D. A.},\n  title = {Quantum Corrections to the {Thomas}--{Fermi} Equation},\n  journal = {Zh. Eksp. Teor. Fiz.},\n  year = {1957},\n  volume = {32},\n  pages = {115},\n  note = {[J. Exp. Theor. Phys. 5, 64 (1957)]}\n}\n", "Kirznits1957_115"),
        ]),
    :gga_k_ghds10 => IdentifierText(
        "As GDS08 but for an electron gas with spin",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("L. M. Ghiringhelli, I. P. Hamilton, and L. Delle Site,  J. Chem. Phys. 132, 014106 (2010)", "10.1063/1.3280953", "@article{Ghiringhelli2010_014106,\n  author = {Ghiringhelli, L. M. and Hamilton, I. P. and Delle Site, L.},\n  title = {Interacting electrons, spin statistics, and information theory},\n  journal = {J. Chem. Phys.},\n  volume = {132},\n  number = {1},\n  pages = {014106},\n  year = {2010},\n  doi = {10.1063/1.3280953},\n  url = {https://doi.org/10.1063/1.3280953}\n}\n", "Ghiringhelli2010_014106"),
        ]),
    :gga_k_ghds10r => IdentifierText(
        "Reparametrized GHDS10",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("S. B. Trickey, V. V. Karasiev, and A. Vela,  Phys. Rev. B 84, 075146 (2011)", "10.1103/PhysRevB.84.075146", "@article{Trickey2011_075146,\n  author = {Trickey, S. B. and Karasiev, V. V. and Vela, A.},\n  title = {Positivity constraints and information-theoretical kinetic energy functionals},\n  journal = {Phys. Rev. B},\n  volume = {84},\n  issue = {7},\n  pages = {075146},\n  year = {2011},\n  month = {Aug},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevB.84.075146},\n  url = {https://link.aps.org/doi/10.1103/PhysRevB.84.075146}\n}\n", "Trickey2011_075146"),
            LibxcReference("L. M. Ghiringhelli, I. P. Hamilton, and L. Delle Site,  J. Chem. Phys. 132, 014106 (2010)", "10.1063/1.3280953", "@article{Ghiringhelli2010_014106,\n  author = {Ghiringhelli, L. M. and Hamilton, I. P. and Delle Site, L.},\n  title = {Interacting electrons, spin statistics, and information theory},\n  journal = {J. Chem. Phys.},\n  volume = {132},\n  number = {1},\n  pages = {014106},\n  year = {2010},\n  doi = {10.1063/1.3280953},\n  url = {https://doi.org/10.1063/1.3280953}\n}\n", "Ghiringhelli2010_014106"),
        ]),
    :gga_k_golden => IdentifierText(
        "TF-lambda-vW form by Golden (l = 13/45)",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("S. Golden,  Phys. Rev. 105, 604 (1957)", "10.1103/PhysRev.105.604", "@article{Golden1957_604,\n  author = {Golden, S.},\n  title = {Statistical Theory of Many-Electron Systems. General Considerations Pertaining to the {Thomas}--{Fermi} Theory},\n  journal = {Phys. Rev.},\n  volume = {105},\n  issue = {2},\n  pages = {604},\n  year = {1957},\n  month = {Jan},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRev.105.604},\n  url = {http://link.aps.org/doi/10.1103/PhysRev.105.604}\n}\n", "Golden1957_604"),
        ]),
    :gga_k_gp85 => IdentifierText(
        "gamma-TFvW form by Ghosh and Parr",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("S. K. Ghosh and R. G. Parr,  J. Chem. Phys. 82, 3307 (1985)", "10.1063/1.448229", "@article{Ghosh1985_3307,\n  author = {Ghosh, S. K. and Parr, R. G.},\n  title = {Density-determined orthonormal orbital approach to atomic energy functionals},\n  journal = {J. Chem. Phys.},\n  year = {1985},\n  volume = {82},\n  number = {7},\n  pages = {3307},\n  doi = {10.1063/1.448229},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/82/7/10.1063/1.448229}\n}\n", "Ghosh1985_3307"),
        ]),
    :gga_k_gr => IdentifierText(
        "gamma-TFvW form by Gazquez and Robles",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("J. L. Gázquez and J. Robles,  J. Chem. Phys. 76, 1467 (1982)", "10.1063/1.443107", "@article{Gazquez1982_1467,\n  author = {G\\'{a}zquez, J. L. and Robles, J.},\n  title = {On the atomic kinetic energy functionals with full {Weizsacker} correction},\n  journal = {J. Chem. Phys.},\n  year = {1982},\n  volume = {76},\n  number = {3},\n  pages = {1467},\n  doi = {10.1063/1.443107},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/76/3/10.1063/1.443107}\n}\n", "Gazquez1982_1467"),
        ]),
    :gga_k_lc94 => IdentifierText(
        "Lembarki & Chermette",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("A. Lembarki and H. Chermette,  Phys. Rev. A 50, 5328 (1994)", "10.1103/PhysRevA.50.5328", "@article{Lembarki1994_5328,\n  author = {Lembarki, A. and Chermette, H.},\n  title = {Obtaining a gradient-corrected kinetic-energy functional from the {Perdew}--{Wang} exchange functional},\n  journal = {Phys. Rev. A},\n  volume = {50},\n  issue = {6},\n  pages = {5328},\n  year = {1994},\n  month = {Dec},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevA.50.5328},\n  url = {http://link.aps.org/doi/10.1103/PhysRevA.50.5328}\n}\n", "Lembarki1994_5328"),
        ]),
    :gga_k_lgap => IdentifierText(
        "LGAP by Constantin et al",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("L. A. Constantin, E. Fabiano, S. Śmiga, and F. Della Sala,  Phys. Rev. B 95, 115153 (2017)", "10.1103/PhysRevB.95.115153", "@article{Constantin2017_115153,\n  author = {Constantin, Lucian A. and Fabiano, Eduardo and \\'{S}miga, Szymon and Della Sala, Fabio},\n  title = {Jellium-with-gap model applied to semilocal kinetic functionals},\n  journal = {Phys. Rev. B},\n  volume = {95},\n  issue = {11},\n  pages = {115153},\n  year = {2017},\n  month = {Mar},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevB.95.115153},\n  url = {https://link.aps.org/doi/10.1103/PhysRevB.95.115153}\n}\n", "Constantin2017_115153"),
        ]),
    :gga_k_lgap_ge => IdentifierText(
        "LGAP-GE by Constantin et al",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("L. A. Constantin, E. Fabiano, S. Śmiga, and F. Della Sala,  Phys. Rev. B 95, 115153 (2017)", "10.1103/PhysRevB.95.115153", "@article{Constantin2017_115153,\n  author = {Constantin, Lucian A. and Fabiano, Eduardo and \\'{S}miga, Szymon and Della Sala, Fabio},\n  title = {Jellium-with-gap model applied to semilocal kinetic functionals},\n  journal = {Phys. Rev. B},\n  volume = {95},\n  issue = {11},\n  pages = {115153},\n  year = {2017},\n  month = {Mar},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevB.95.115153},\n  url = {https://link.aps.org/doi/10.1103/PhysRevB.95.115153}\n}\n", "Constantin2017_115153"),
        ]),
    :gga_k_lieb => IdentifierText(
        "TF-lambda-vW form by Lieb (l = 0.185909191)",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("E. H. Lieb,  Rev. Mod. Phys. 53, 603 (1981)", "10.1103/RevModPhys.53.603", "@article{Lieb1981_603,\n  author = {Lieb, E. H.},\n  title = {{Thomas}--{Fermi} and related theories of atoms and molecules},\n  journal = {Rev. Mod. Phys.},\n  volume = {53},\n  issue = {4},\n  pages = {603},\n  year = {1981},\n  month = {Oct},\n  publisher = {American Physical Society},\n  doi = {10.1103/RevModPhys.53.603},\n  url = {http://link.aps.org/doi/10.1103/RevModPhys.53.603}\n}\n", "Lieb1981_603"),
        ]),
    :gga_k_lkt => IdentifierText(
        "Luo-Karasiev-Trickey GGA kinetic",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("K. Luo, V. V. Karasiev, and S. B. Trickey,  Phys. Rev. B 98, 041111 (2018)", "10.1103/PhysRevB.98.041111", "@article{Luo2018_041111,\n  author = {Luo, Kai and Karasiev, Valentin V. and Trickey, S. B.},\n  title = {A simple generalized gradient approximation for the noninteracting kinetic energy density functional},\n  journal = {Phys. Rev. B},\n  volume = {98},\n  issue = {4},\n  pages = {041111},\n  year = {2018},\n  month = {Jul},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevB.98.041111},\n  url = {https://link.aps.org/doi/10.1103/PhysRevB.98.041111}\n}\n", "Luo2018_041111"),
        ]),
    :gga_k_llp => IdentifierText(
        "Lee, Lee & Parr",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("H. Lee, C. Lee, and R. G. Parr,  Phys. Rev. A 44, 768 (1991)", "10.1103/PhysRevA.44.768", "@article{Lee1991_768,\n  author = {Lee, H. and Lee, C. and Parr, R. G.},\n  title = {Conjoint gradient correction to the {Hartree}--{Fock} kinetic- and exchange-energy density functionals},\n  journal = {Phys. Rev. A},\n  volume = {44},\n  issue = {1},\n  pages = {768},\n  year = {1991},\n  month = {Jul},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevA.44.768},\n  url = {http://link.aps.org/doi/10.1103/PhysRevA.44.768}\n}\n", "Lee1991_768"),
        ]),
    :gga_k_ludena => IdentifierText(
        "gamma-TFvW form by Ludena",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("E. V. Ludeña. In F. B. Malik, editor, Cond. Matt. Theor, volume 1, 183. New York, 1986. Plenum.", "", "@inproceedings{Ludena1986,\n  author = {{Lude\\\\textasciitilde {n}a}, E. V.},\n  editor = {Malik, F. B.},\n  title = {},\n  booktitle = {Cond. Matt. Theor.},\n  pages = {183},\n  year = {1986},\n  volume = {1},\n  address = {New York},\n  publisher = {Plenum}\n}\n", "Ludena1986"),
        ]),
    :gga_k_meyer => IdentifierText(
        "Meyer,  Wang, and Young",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("A. Meyer, G. C. Wang, and W. H. Young,  Z. Naturforsch. A 31, 898 (1976)", "10.1515/zna-1976-0804", "@article{Meyer1976_898,\n  author = {Meyer, A. and Wang, G. C. and Young, W. H.},\n  title = {The von {Weizs\\\"{a}cker} Coefficient in Density Functional Theory},\n  journal = {Z. Naturforsch. A},\n  year = {1976},\n  volume = {31},\n  pages = {898},\n  url = {https://doi.org/10.1515/zna-1976-0804},\n  doi = {10.1515/zna-1976-0804}\n}\n", "Meyer1976_898"),
        ]),
    :gga_k_ol1 => IdentifierText(
        "Ou-Yang and Levy v.1",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("H. Ou-Yang and M. Levy,  Int. J. Quantum Chem. 40, 379 (1991)", "10.1002/qua.560400309", "@article{OuYang1991_379,\n  author = {Ou-Yang, H. and Levy, M.},\n  title = {Approximate noninteracting kinetic energy functionals from a nonuniform scaling requirement},\n  journal = {Int. J. Quantum Chem.},\n  volume = {40},\n  number = {3},\n  pages = {379},\n  year = {1991},\n  publisher = {John Wiley \\& Sons, Inc.},\n  issn = {1097-461X},\n  doi = {10.1002/qua.560400309},\n  url = {http://onlinelibrary.wiley.com/doi/10.1002/qua.560400309/abstract}\n}\n", "OuYang1991_379"),
        ]),
    :gga_k_ol2 => IdentifierText(
        "Ou-Yang and Levy v.2",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("H. Ou-Yang and M. Levy,  Int. J. Quantum Chem. 40, 379 (1991)", "10.1002/qua.560400309", "@article{OuYang1991_379,\n  author = {Ou-Yang, H. and Levy, M.},\n  title = {Approximate noninteracting kinetic energy functionals from a nonuniform scaling requirement},\n  journal = {Int. J. Quantum Chem.},\n  volume = {40},\n  number = {3},\n  pages = {379},\n  year = {1991},\n  publisher = {John Wiley \\& Sons, Inc.},\n  issn = {1097-461X},\n  doi = {10.1002/qua.560400309},\n  url = {http://onlinelibrary.wiley.com/doi/10.1002/qua.560400309/abstract}\n}\n", "OuYang1991_379"),
        ]),
    :gga_k_pbe2 => IdentifierText(
        "Three parameter PBE-like expansion",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("V. V. Karasiev, S. B. Trickey, and F. E. Harris,  J. Comput.-Aided Mater. Des. 13, 111–129 (2006)", "10.1007/s10820-006-9019-8", "@article{Karasiev2006_111,\n  author = {Karasiev, V. V. and Trickey, S. B. and Harris, Frank E.},\n  title = {{Born}--{Oppenheimer} Interatomic Forces from Simple, Local Kinetic Energy Density Functionals},\n  journal = {J. Comput.-Aided Mater. Des.},\n  year = {2006},\n  month = {Oct},\n  day = {01},\n  volume = {13},\n  number = {1},\n  pages = {111--129},\n  issn = {1573-4900},\n  doi = {10.1007/s10820-006-9019-8},\n  url = {https://doi.org/10.1007/s10820-006-9019-8}\n}\n", "Karasiev2006_111"),
        ]),
    :gga_k_pbe3 => IdentifierText(
        "Three parameter PBE-like expansion",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("V. V. Karasiev, S. B. Trickey, and F. E. Harris,  J. Comput.-Aided Mater. Des. 13, 111–129 (2006)", "10.1007/s10820-006-9019-8", "@article{Karasiev2006_111,\n  author = {Karasiev, V. V. and Trickey, S. B. and Harris, Frank E.},\n  title = {{Born}--{Oppenheimer} Interatomic Forces from Simple, Local Kinetic Energy Density Functionals},\n  journal = {J. Comput.-Aided Mater. Des.},\n  year = {2006},\n  month = {Oct},\n  day = {01},\n  volume = {13},\n  number = {1},\n  pages = {111--129},\n  issn = {1573-4900},\n  doi = {10.1007/s10820-006-9019-8},\n  url = {https://doi.org/10.1007/s10820-006-9019-8}\n}\n", "Karasiev2006_111"),
        ]),
    :gga_k_pbe4 => IdentifierText(
        "Four parameter PBE-like expansion",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("V. V. Karasiev, S. B. Trickey, and F. E. Harris,  J. Comput.-Aided Mater. Des. 13, 111–129 (2006)", "10.1007/s10820-006-9019-8", "@article{Karasiev2006_111,\n  author = {Karasiev, V. V. and Trickey, S. B. and Harris, Frank E.},\n  title = {{Born}--{Oppenheimer} Interatomic Forces from Simple, Local Kinetic Energy Density Functionals},\n  journal = {J. Comput.-Aided Mater. Des.},\n  year = {2006},\n  month = {Oct},\n  day = {01},\n  volume = {13},\n  number = {1},\n  pages = {111--129},\n  issn = {1573-4900},\n  doi = {10.1007/s10820-006-9019-8},\n  url = {https://doi.org/10.1007/s10820-006-9019-8}\n}\n", "Karasiev2006_111"),
        ]),
    :gga_k_pearson => IdentifierText(
        "Pearson 1992",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("D. J. Lacks and R. G. Gordon,  J. Chem. Phys. 100, 4446 (1994)", "10.1063/1.466274", "@article{Lacks1994_4446,\n  author = {Lacks, D. J. and Gordon, R. G.},\n  title = {Tests of nonlocal kinetic energy functionals},\n  journal = {J. Chem. Phys.},\n  year = {1994},\n  volume = {100},\n  number = {6},\n  pages = {4446},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/100/6/10.1063/1.466274},\n  doi = {10.1063/1.466274}\n}\n", "Lacks1994_4446"),
            LibxcReference("E. W. Pearson and R. G. Gordon,  J. Chem. Phys. 82, 881 (1985)", "10.1063/1.448516", "@article{Pearson1985_881,\n  author = {Pearson, E. W. and Gordon, R. G.},\n  title = {Local asymptotic gradient corrections to the energy functional of an electron gas},\n  journal = {J. Chem. Phys.},\n  year = {1985},\n  volume = {82},\n  number = {2},\n  pages = {881},\n  doi = {10.1063/1.448516},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/82/2/10.1063/1.448516}\n}\n", "Pearson1985_881"),
            LibxcReference("E. W. Pearson. Theory and application of the electron gas model. PhD thesis, Harvard University, 1983. URL: http://discovery.lib.harvard.edu/?itemid=|library/m/aleph|001176470.", "", "@phdthesis{Pearson1983,\n  author = {Pearson, E. W.},\n  title = {Theory and application of the electron gas model},\n  school = {Harvard University},\n  year = {1983},\n  url = {http://discovery.lib.harvard.edu/?itemid=|library/m/aleph|001176470}\n}\n", "Pearson1983"),
        ]),
    :gga_k_perdew => IdentifierText(
        "Perdew",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("J. P. Perdew,  Phys. Lett. A 165, 79 (1992)", "10.1016/0375-9601(92)91058-Y", "@article{Perdew1992_79,\n  author = {Perdew, J. P.},\n  title = {Generalized gradient approximation for the fermion kinetic energy as a functional of the density},\n  journal = {Phys. Lett. A},\n  volume = {165},\n  number = {1},\n  pages = {79},\n  year = {1992},\n  issn = {0375-9601},\n  doi = {10.1016/0375-9601(92)91058-Y},\n  url = {http://www.sciencedirect.com/science/article/pii/037596019291058Y}\n}\n", "Perdew1992_79"),
        ]),
    :gga_k_pg1 => IdentifierText(
        "PG1 (Pauli-Gaussian) functional by Constantin, Fabiano, and Della Sala",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("L. A. Constantin, E. Fabiano, and F. Della Sala,  J. Phys. Chem. Lett. 9, 4385–4390 (2018)", "10.1021/acs.jpclett.8b01926", "@article{Constantin2018_4385,\n  author = {Constantin, Lucian A. and Fabiano, Eduardo and Della Sala, Fabio},\n  title = {Semilocal {Pauli}--{Gaussian} Kinetic Functionals for Orbital-Free Density Functional Theory Calculations of Solids},\n  journal = {J. Phys. Chem. Lett.},\n  volume = {9},\n  number = {15},\n  pages = {4385--4390},\n  year = {2018},\n  doi = {10.1021/acs.jpclett.8b01926},\n  url = {https://doi.org/10.1021/acs.jpclett.8b01926}\n}\n", "Constantin2018_4385"),
        ]),
    :gga_k_rational_p => IdentifierText(
        "RATIONAL\$^{p}\$ by Lehtomaki and Lopez-Acevedo (by default \$p=3/2\$, \$C_{2}=0.7687\$)",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("J. Lehtomäki and O. Lopez-Acevedo,  Phys. Rev. B 100, 165111 (2019)", "10.1103/PhysRevB.100.165111", "@article{Lehtomaki2019_165111,\n  author = {Lehtom\\\"{a}ki, Jouko and Lopez-Acevedo, Olga},\n  title = {Semilocal kinetic energy functionals with parameters from neutral atoms},\n  journal = {Phys. Rev. B},\n  volume = {100},\n  issue = {16},\n  pages = {165111},\n  year = {2019},\n  month = {Oct},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevB.100.165111},\n  url = {https://link.aps.org/doi/10.1103/PhysRevB.100.165111}\n}\n", "Lehtomaki2019_165111"),
        ]),
    :gga_k_revapbe => IdentifierText(
        "revised APBE",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("L. A. Constantin, E. Fabiano, S. Laricchia, and F. Della Sala,  Phys. Rev. Lett. 106, 186406 (2011)", "10.1103/PhysRevLett.106.186406", "@article{Constantin2011_186406,\n  author = {Constantin, L. A. and Fabiano, E. and Laricchia, S. and Della Sala, F.},\n  title = {Semiclassical Neutral Atom as a Reference System in Density Functional Theory},\n  journal = {Phys. Rev. Lett.},\n  volume = {106},\n  issue = {18},\n  pages = {186406},\n  year = {2011},\n  month = {May},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevLett.106.186406},\n  url = {http://link.aps.org/doi/10.1103/PhysRevLett.106.186406}\n}\n", "Constantin2011_186406"),
        ]),
    :gga_k_revapbeint => IdentifierText(
        "interpolated version of revAPBE",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("S. Laricchia, E. Fabiano, L. A. Constantin, and F. Della Sala,  J. Chem. Theory Comput. 7, 2439 (2011)", "10.1021/ct200382w", "@article{Laricchia2011_2439,\n  author = {Laricchia, S. and Fabiano, E. and Constantin, L. A. and Della Sala, F.},\n  title = {Generalized Gradient Approximations of the Noninteracting Kinetic Energy from the Semiclassical Atom Theory: Rationalization of the Accuracy of the Frozen Density Embedding Theory for Nonbonded Interactions},\n  journal = {J. Chem. Theory Comput.},\n  volume = {7},\n  number = {8},\n  pages = {2439},\n  year = {2011},\n  doi = {10.1021/ct200382w},\n  url = {http://pubs.acs.org/doi/abs/10.1021/ct200382w}\n}\n", "Laricchia2011_2439"),
        ]),
    :gga_k_tfvw => IdentifierText(
        "Thomas-Fermi plus von Weiszaecker correction",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("C. F. von Weizsäcker,  Z. Phys. 96, 431 (1935)", "10.1007/BF01337700", "@article{Weizsacker1935_431,\n  author = {von Weizs\\\"acker, C. F.},\n  title = {Zur {Theorie} der {Kernmassen}},\n  journal = {Z. Phys.},\n  volume = {96},\n  number = {7-8},\n  pages = {431},\n  year = {1935},\n  issn = {0044-3328},\n  publisher = {Springer-Verlag},\n  doi = {10.1007/BF01337700},\n  url = {http://link.springer.com/article/10.1007\\\\%2FBF01337700}\n}\n", "Weizsacker1935_431"),
        ]),
    :gga_k_tfvw_opt => IdentifierText(
        "empirically optimized gamma-TFvW form",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("L. A. Espinosa Leal, A. Karpenko, M. A. Caro, and O. Lopez-Acevedo,  Phys. Chem. Chem. Phys. 17, 31463–31471 (2015)", "10.1039/C5CP01211B", "@article{EspinosaLeal2015_31463,\n  author = {Espinosa Leal, L. A. and Karpenko, A. and Caro, M. A. and Lopez-Acevedo, O.},\n  title = {Optimizing a parametrized {Thomas}--{Fermi}--{Dirac}--{Weizs\\\"{a}cker} density functional for atoms},\n  journal = {Phys. Chem. Chem. Phys.},\n  year = {2015},\n  volume = {17},\n  issue = {47},\n  pages = {31463--31471},\n  publisher = {The Royal Society of Chemistry},\n  doi = {10.1039/C5CP01211B},\n  url = {https://doi.org/10.1039/C5CP01211B}\n}\n", "EspinosaLeal2015_31463"),
        ]),
    :gga_k_thakkar => IdentifierText(
        "Thakkar 1992",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("A. J. Thakkar,  Phys. Rev. A 46, 6920 (1992)", "10.1103/PhysRevA.46.6920", "@article{Thakkar1992_6920,\n  author = {Thakkar, A. J.},\n  title = {Comparison of kinetic-energy density functionals},\n  journal = {Phys. Rev. A},\n  volume = {46},\n  issue = {11},\n  pages = {6920},\n  year = {1992},\n  month = {Dec},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevA.46.6920},\n  url = {http://link.aps.org/doi/10.1103/PhysRevA.46.6920}\n}\n", "Thakkar1992_6920"),
        ]),
    :gga_k_tkvln => IdentifierText(
        "Trickey, Karasiev, and Vela",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("S. B. Trickey, V. V. Karasiev, and A. Vela,  Phys. Rev. B 84, 075146 (2011)", "10.1103/PhysRevB.84.075146", "@article{Trickey2011_075146,\n  author = {Trickey, S. B. and Karasiev, V. V. and Vela, A.},\n  title = {Positivity constraints and information-theoretical kinetic energy functionals},\n  journal = {Phys. Rev. B},\n  volume = {84},\n  issue = {7},\n  pages = {075146},\n  year = {2011},\n  month = {Aug},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevB.84.075146},\n  url = {https://link.aps.org/doi/10.1103/PhysRevB.84.075146}\n}\n", "Trickey2011_075146"),
            LibxcReference("L. M. Ghiringhelli, I. P. Hamilton, and L. Delle Site,  J. Chem. Phys. 132, 014106 (2010)", "10.1063/1.3280953", "@article{Ghiringhelli2010_014106,\n  author = {Ghiringhelli, L. M. and Hamilton, I. P. and Delle Site, L.},\n  title = {Interacting electrons, spin statistics, and information theory},\n  journal = {J. Chem. Phys.},\n  volume = {132},\n  number = {1},\n  pages = {014106},\n  year = {2010},\n  doi = {10.1063/1.3280953},\n  url = {https://doi.org/10.1063/1.3280953}\n}\n", "Ghiringhelli2010_014106"),
        ]),
    :gga_k_tw1 => IdentifierText(
        "Tran and Wesolowski set 1 (Table II)",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("F. Tran and T. A. Wesołowski,  Int. J. Quantum Chem. 89, 441 (2002)", "10.1002/qua.10306", "@article{Tran2002_441,\n  author = {Tran, F. and Weso\\l{}owski, T. A.},\n  title = {Link between the kinetic- and exchange-energy functionals in the generalized gradient approximation},\n  journal = {Int. J. Quantum Chem.},\n  volume = {89},\n  number = {5},\n  pages = {441},\n  year = {2002},\n  publisher = {Wiley Subscription Services, Inc., A Wiley Company},\n  issn = {1097-461X},\n  doi = {10.1002/qua.10306},\n  url = {http://onlinelibrary.wiley.com/doi/10.1002/qua.10306/abstract}\n}\n", "Tran2002_441"),
        ]),
    :gga_k_tw2 => IdentifierText(
        "Tran and Wesolowski set 2 (Table II)",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("F. Tran and T. A. Wesołowski,  Int. J. Quantum Chem. 89, 441 (2002)", "10.1002/qua.10306", "@article{Tran2002_441,\n  author = {Tran, F. and Weso\\l{}owski, T. A.},\n  title = {Link between the kinetic- and exchange-energy functionals in the generalized gradient approximation},\n  journal = {Int. J. Quantum Chem.},\n  volume = {89},\n  number = {5},\n  pages = {441},\n  year = {2002},\n  publisher = {Wiley Subscription Services, Inc., A Wiley Company},\n  issn = {1097-461X},\n  doi = {10.1002/qua.10306},\n  url = {http://onlinelibrary.wiley.com/doi/10.1002/qua.10306/abstract}\n}\n", "Tran2002_441"),
        ]),
    :gga_k_tw3 => IdentifierText(
        "Tran and Wesolowski set 3 (Table II)",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("F. Tran and T. A. Wesołowski,  Int. J. Quantum Chem. 89, 441 (2002)", "10.1002/qua.10306", "@article{Tran2002_441,\n  author = {Tran, F. and Weso\\l{}owski, T. A.},\n  title = {Link between the kinetic- and exchange-energy functionals in the generalized gradient approximation},\n  journal = {Int. J. Quantum Chem.},\n  volume = {89},\n  number = {5},\n  pages = {441},\n  year = {2002},\n  publisher = {Wiley Subscription Services, Inc., A Wiley Company},\n  issn = {1097-461X},\n  doi = {10.1002/qua.10306},\n  url = {http://onlinelibrary.wiley.com/doi/10.1002/qua.10306/abstract}\n}\n", "Tran2002_441"),
        ]),
    :gga_k_tw4 => IdentifierText(
        "Tran and Wesolowski set 4 (Table II)",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("F. Tran and T. A. Wesołowski,  Int. J. Quantum Chem. 89, 441 (2002)", "10.1002/qua.10306", "@article{Tran2002_441,\n  author = {Tran, F. and Weso\\l{}owski, T. A.},\n  title = {Link between the kinetic- and exchange-energy functionals in the generalized gradient approximation},\n  journal = {Int. J. Quantum Chem.},\n  volume = {89},\n  number = {5},\n  pages = {441},\n  year = {2002},\n  publisher = {Wiley Subscription Services, Inc., A Wiley Company},\n  issn = {1097-461X},\n  doi = {10.1002/qua.10306},\n  url = {http://onlinelibrary.wiley.com/doi/10.1002/qua.10306/abstract}\n}\n", "Tran2002_441"),
        ]),
    :gga_k_vjks => IdentifierText(
        "Vitos, Johansson, Kollar, and Skriver",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("L. Vitos, B. Johansson, J. Kollár, and H. L. Skriver,  Phys. Rev. A 61, 052511 (2000)", "10.1103/PhysRevA.61.052511", "@article{Vitos2000_052511,\n  author = {Vitos, L. and Johansson, B. and Koll\\'{a}r, J. and Skriver, H. L.},\n  title = {Local kinetic-energy density of the {Airy} gas},\n  journal = {Phys. Rev. A},\n  volume = {61},\n  issue = {5},\n  pages = {052511},\n  year = {2000},\n  month = {Apr},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevA.61.052511},\n  url = {http://link.aps.org/doi/10.1103/PhysRevA.61.052511}\n}\n", "Vitos2000_052511"),
        ]),
    :gga_k_vsk => IdentifierText(
        "Vitos, Skriver, and Kollar",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("L. Vitos, H. L. Skriver, and J. Kollár,  Phys. Rev. B 57, 12611 (1998)", "10.1103/PhysRevB.57.12611", "@article{Vitos1998_12611,\n  author = {Vitos, L. and Skriver, H. L. and Koll\\'{a}r, J.},\n  title = {Kinetic-energy functionals studied by surface calculations},\n  journal = {Phys. Rev. B},\n  volume = {57},\n  issue = {19},\n  pages = {12611},\n  year = {1998},\n  month = {May},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevB.57.12611},\n  url = {http://link.aps.org/doi/10.1103/PhysRevB.57.12611}\n}\n", "Vitos1998_12611"),
        ]),
    :gga_k_vt84f => IdentifierText(
        "VT84F by Karasiev et al",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("V. V. Karasiev, D. Chakraborty, O. A. Shukruto, and S. B. Trickey,  Phys. Rev. B 88, 161108 (2013)", "10.1103/PhysRevB.88.161108", "@article{Karasiev2013_161108,\n  author = {Karasiev, Valentin V. and Chakraborty, Debajit and Shukruto, Olga A. and Trickey, S. B.},\n  title = {Nonempirical generalized gradient approximation free-energy functional for orbital-free simulations},\n  journal = {Phys. Rev. B},\n  volume = {88},\n  issue = {16},\n  pages = {161108},\n  year = {2013},\n  month = {Oct},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevB.88.161108},\n  url = {https://link.aps.org/doi/10.1103/PhysRevB.88.161108}\n}\n", "Karasiev2013_161108"),
        ]),
    :gga_k_vw => IdentifierText(
        "von Weiszaecker correction to Thomas-Fermi",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("C. F. von Weizsäcker,  Z. Phys. 96, 431 (1935)", "10.1007/BF01337700", "@article{Weizsacker1935_431,\n  author = {von Weizs\\\"acker, C. F.},\n  title = {Zur {Theorie} der {Kernmassen}},\n  journal = {Z. Phys.},\n  volume = {96},\n  number = {7-8},\n  pages = {431},\n  year = {1935},\n  issn = {0044-3328},\n  publisher = {Springer-Verlag},\n  doi = {10.1007/BF01337700},\n  url = {http://link.springer.com/article/10.1007\\\\%2FBF01337700}\n}\n", "Weizsacker1935_431"),
        ]),
    :gga_k_yt65 => IdentifierText(
        "TF-lambda-vW form by Yonei and Tomishima (l = 1/5)",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("K. Yonei and Y. Tomishima,  J. Phys. Soc. Jpn. 20, 1051 (1965)", "10.1143/JPSJ.20.1051", "@article{Yonei1965_1051,\n  author = {Yonei, K. and Tomishima, Y.},\n  title = {On the {Weizs\\\"{a}cker} Correction to the {Thomas}--{Fermi} Theory of the Atom},\n  journal = {J. Phys. Soc. Jpn.},\n  volume = {20},\n  number = {6},\n  pages = {1051},\n  year = {1965},\n  doi = {10.1143/JPSJ.20.1051},\n  url = {http://journals.jps.jp/doi/abs/10.1143/JPSJ.20.1051}\n}\n", "Yonei1965_1051"),
        ]),
    :gga_x_2d_b86 => IdentifierText(
        "Becke 86 in 2D",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim2, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("J. G. Vilhena, E. Räsänen, M. A. L. Marques, and S. Pittalis,  J. Chem. Theory Comput. 10, 1837–1842 (2014)", "10.1021/ct4010728", "@article{Vilhena2014_1837,\n  author = {Vilhena, J. G. and R\\\"as\\\"anen, E. and Marques, M. A. L. and Pittalis, S.},\n  title = {Construction of the {B88} Exchange-Energy Functional in Two Dimensions},\n  journal = {J. Chem. Theory Comput.},\n  volume = {10},\n  number = {5},\n  pages = {1837--1842},\n  year = {2014},\n  doi = {10.1021/ct4010728},\n  url = {https://doi.org/10.1021/ct4010728}\n}\n", "Vilhena2014_1837"),
        ]),
    :gga_x_2d_b86_mgc => IdentifierText(
        "Becke 86 with modified gradient correction for 2D",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim2, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("S. Pittalis, E. Räsänen, J. G. Vilhena, and M. A. L. Marques,  Phys. Rev. A 79, 012503 (2009)", "10.1103/PhysRevA.79.012503", "@article{Pittalis2009_012503,\n  author = {Pittalis, S. and R\\\"as\\\"anen, E. and Vilhena, J. G. and Marques, M. A. L.},\n  title = {Density gradients for the exchange energy of electrons in two dimensions},\n  journal = {Phys. Rev. A},\n  volume = {79},\n  issue = {1},\n  pages = {012503},\n  year = {2009},\n  month = {Jan},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevA.79.012503},\n  url = {http://link.aps.org/doi/10.1103/PhysRevA.79.012503}\n}\n", "Pittalis2009_012503"),
        ]),
    :gga_x_2d_b88 => IdentifierText(
        "Becke 88 in 2D",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim2, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("J. G. Vilhena, E. Räsänen, M. A. L. Marques, and S. Pittalis,  J. Chem. Theory Comput. 10, 1837–1842 (2014)", "10.1021/ct4010728", "@article{Vilhena2014_1837,\n  author = {Vilhena, J. G. and R\\\"as\\\"anen, E. and Marques, M. A. L. and Pittalis, S.},\n  title = {Construction of the {B88} Exchange-Energy Functional in Two Dimensions},\n  journal = {J. Chem. Theory Comput.},\n  volume = {10},\n  number = {5},\n  pages = {1837--1842},\n  year = {2014},\n  doi = {10.1021/ct4010728},\n  url = {https://doi.org/10.1021/ct4010728}\n}\n", "Vilhena2014_1837"),
        ]),
    :gga_x_2d_pbe => IdentifierText(
        "Perdew, Burke & Ernzerhof in 2D",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim2, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("J. G. Vilhena, E. Räsänen, M. A. L. Marques, and S. Pittalis,  J. Chem. Theory Comput. 10, 1837–1842 (2014)", "10.1021/ct4010728", "@article{Vilhena2014_1837,\n  author = {Vilhena, J. G. and R\\\"as\\\"anen, E. and Marques, M. A. L. and Pittalis, S.},\n  title = {Construction of the {B88} Exchange-Energy Functional in Two Dimensions},\n  journal = {J. Chem. Theory Comput.},\n  volume = {10},\n  number = {5},\n  pages = {1837--1842},\n  year = {2014},\n  doi = {10.1021/ct4010728},\n  url = {https://doi.org/10.1021/ct4010728}\n}\n", "Vilhena2014_1837"),
        ]),
    :gga_x_airy => IdentifierText(
        "Constantin et al based on the Airy gas",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("L. A. Constantin, A. Ruzsinszky, and J. P. Perdew,  Phys. Rev. B 80, 035125 (2009)", "10.1103/PhysRevB.80.035125", "@article{Constantin2009_035125,\n  author = {Constantin, L. A. and Ruzsinszky, A. and Perdew, J. P.},\n  title = {Exchange-correlation energy functional based on the {Airy}-gas reference system},\n  journal = {Phys. Rev. B},\n  volume = {80},\n  issue = {3},\n  pages = {035125},\n  year = {2009},\n  month = {Jul},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevB.80.035125},\n  url = {http://link.aps.org/doi/10.1103/PhysRevB.80.035125}\n}\n", "Constantin2009_035125"),
        ]),
    :gga_x_ak13 => IdentifierText(
        "Armiento & Kuemmel 2013",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("R. Armiento and S. Kümmel,  Phys. Rev. Lett. 111, 036402 (2013)", "10.1103/PhysRevLett.111.036402", "@article{Armiento2013_036402,\n  author = {Armiento, R. and K\\\"{u}mmel, S.},\n  title = {Orbital Localization, Charge Transfer, and Band Gaps in Semilocal Density-Functional Theory},\n  journal = {Phys. Rev. Lett.},\n  volume = {111},\n  issue = {3},\n  pages = {036402},\n  year = {2013},\n  month = {Jul},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevLett.111.036402},\n  url = {http://link.aps.org/doi/10.1103/PhysRevLett.111.036402}\n}\n", "Armiento2013_036402"),
        ]),
    :gga_x_am05 => IdentifierText(
        "Armiento & Mattsson 05",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("R. Armiento and A. E. Mattsson,  Phys. Rev. B 72, 085108 (2005)", "10.1103/PhysRevB.72.085108", "@article{Armiento2005_085108,\n  author = {Armiento, R. and Mattsson, A. E.},\n  title = {Functional designed to include surface effects in self-consistent density functional theory},\n  journal = {Phys. Rev. B},\n  volume = {72},\n  issue = {8},\n  pages = {085108},\n  year = {2005},\n  month = {Aug},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevB.72.085108},\n  url = {http://link.aps.org/doi/10.1103/PhysRevB.72.085108}\n}\n", "Armiento2005_085108"),
            LibxcReference("A. E. Mattsson, R. Armiento, J. Paier, G. Kresse, J. M. Wills, and T. R. Mattsson,  J. Chem. Phys. 128, 084714 (2008)", "10.1063/1.2835596", "@article{Mattsson2008_084714,\n  author = {Mattsson, A. E. and Armiento, R. and Paier, J. and Kresse, G. and Wills, J. M. and Mattsson, T. R.},\n  title = {The {AM05} density functional applied to solids},\n  journal = {J. Chem. Phys.},\n  year = {2008},\n  volume = {128},\n  number = {8},\n  pages = {084714},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/128/8/10.1063/1.2835596},\n  doi = {10.1063/1.2835596}\n}\n", "Mattsson2008_084714"),
        ]),
    :gga_x_apbe => IdentifierText(
        "mu fixed from the semiclassical neutral atom",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("L. A. Constantin, E. Fabiano, S. Laricchia, and F. Della Sala,  Phys. Rev. Lett. 106, 186406 (2011)", "10.1103/PhysRevLett.106.186406", "@article{Constantin2011_186406,\n  author = {Constantin, L. A. and Fabiano, E. and Laricchia, S. and Della Sala, F.},\n  title = {Semiclassical Neutral Atom as a Reference System in Density Functional Theory},\n  journal = {Phys. Rev. Lett.},\n  volume = {106},\n  issue = {18},\n  pages = {186406},\n  year = {2011},\n  month = {May},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevLett.106.186406},\n  url = {http://link.aps.org/doi/10.1103/PhysRevLett.106.186406}\n}\n", "Constantin2011_186406"),
        ]),
    :gga_x_b86 => IdentifierText(
        "Becke 86",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("A. D. Becke,  J. Chem. Phys. 84, 4524 (1986)", "10.1063/1.450025", "@article{Becke1986_4524,\n  author = {Becke, A. D.},\n  title = {Density functional calculations of molecular bond energies},\n  journal = {J. Chem. Phys.},\n  year = {1986},\n  volume = {84},\n  number = {8},\n  pages = {4524},\n  doi = {10.1063/1.450025},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/84/8/10.1063/1.450025}\n}\n", "Becke1986_4524"),
        ]),
    :gga_x_b86_mgc => IdentifierText(
        "Becke 86 with modified gradient correction",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("A. D. Becke,  J. Chem. Phys. 84, 4524 (1986)", "10.1063/1.450025", "@article{Becke1986_4524,\n  author = {Becke, A. D.},\n  title = {Density functional calculations of molecular bond energies},\n  journal = {J. Chem. Phys.},\n  year = {1986},\n  volume = {84},\n  number = {8},\n  pages = {4524},\n  doi = {10.1063/1.450025},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/84/8/10.1063/1.450025}\n}\n", "Becke1986_4524"),
            LibxcReference("A. D. Becke,  J. Chem. Phys. 85, 7184 (1986)", "10.1063/1.451353", "@article{Becke1986_7184,\n  author = {Becke, A. D.},\n  title = {On the large-gradient behavior of the density functional exchange energy},\n  journal = {J. Chem. Phys.},\n  year = {1986},\n  volume = {85},\n  number = {12},\n  pages = {7184},\n  doi = {10.1063/1.451353},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/85/12/10.1063/1.451353}\n}\n", "Becke1986_7184"),
        ]),
    :gga_x_b86_r => IdentifierText(
        "Revised Becke 86 with modified gradient correction",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("I. Hamada,  Phys. Rev. B 89, 121103 (2014)", "10.1103/PhysRevB.89.121103", "@article{Hamada2014_121103,\n  author = {Hamada, Ikaturo},\n  title = {van der {Waals} density functional made accurate},\n  journal = {Phys. Rev. B},\n  volume = {89},\n  issue = {12},\n  pages = {121103},\n  year = {2014},\n  month = {Mar},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevB.89.121103},\n  url = {http://link.aps.org/doi/10.1103/PhysRevB.89.121103}\n}\n", "Hamada2014_121103"),
            LibxcReference("A. D. Becke,  J. Chem. Phys. 84, 4524 (1986)", "10.1063/1.450025", "@article{Becke1986_4524,\n  author = {Becke, A. D.},\n  title = {Density functional calculations of molecular bond energies},\n  journal = {J. Chem. Phys.},\n  year = {1986},\n  volume = {84},\n  number = {8},\n  pages = {4524},\n  doi = {10.1063/1.450025},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/84/8/10.1063/1.450025}\n}\n", "Becke1986_4524"),
            LibxcReference("A. D. Becke,  J. Chem. Phys. 85, 7184 (1986)", "10.1063/1.451353", "@article{Becke1986_7184,\n  author = {Becke, A. D.},\n  title = {On the large-gradient behavior of the density functional exchange energy},\n  journal = {J. Chem. Phys.},\n  year = {1986},\n  volume = {85},\n  number = {12},\n  pages = {7184},\n  doi = {10.1063/1.451353},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/85/12/10.1063/1.451353}\n}\n", "Becke1986_7184"),
        ]),
    :gga_x_b88 => IdentifierText(
        "Becke 88",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("A. D. Becke,  Phys. Rev. A 38, 3098 (1988)", "10.1103/PhysRevA.38.3098", "@article{Becke1988_3098,\n  author = {Becke, A. D.},\n  title = {Density-functional exchange-energy approximation with correct asymptotic behavior},\n  journal = {Phys. Rev. A},\n  volume = {38},\n  issue = {6},\n  pages = {3098},\n  year = {1988},\n  month = {Sep},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevA.38.3098},\n  url = {http://link.aps.org/doi/10.1103/PhysRevA.38.3098}\n}\n", "Becke1988_3098"),
        ]),
    :gga_x_b88_6311g => IdentifierText(
        "Becke 88 reoptimized with the 6-311G** basis set",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("J. M. Ugalde, C. Sarasola, and M. Aguado,  J. Phys. B: At, Mol. Opt. Phys. 27, 423–427 (1994)", "10.1088/0953-4075/27/3/009", "@article{Ugalde1994_423,\n  author = {Ugalde, J. M. and Sarasola, C. and Aguado, M.},\n  title = {Exchange energy from {Gaussian}-type basis sets},\n  journal = {J. Phys. B: At., Mol. Opt. Phys.},\n  volume = {27},\n  number = {3},\n  pages = {423--427},\n  year = {1994},\n  month = {feb},\n  publisher = {{IOP} Publishing},\n  doi = {10.1088/0953-4075/27/3/009},\n  url = {https://doi.org/10.1088/0953-4075/27/3/009}\n}\n", "Ugalde1994_423"),
        ]),
    :gga_x_b88m => IdentifierText(
        "Becke 88 reoptimized to be used with tau1",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("E. Proynov, H. Chermette, and D. R. Salahub,  J. Chem. Phys. 113, 10013–10027 (2000)", "10.1063/1.1321309", "@article{Proynov2000_10013,\n  author = {Proynov, E. and Chermette, H. and Salahub, D. R.},\n  title = {New \$\\tau\$-dependent correlation functional combined with a modified {Becke} exchange},\n  journal = {J. Chem. Phys.},\n  volume = {113},\n  number = {22},\n  pages = {10013--10027},\n  year = {2000},\n  doi = {10.1063/1.1321309},\n  url = {https://doi.org/10.1063/1.1321309}\n}\n", "Proynov2000_10013"),
        ]),
    :gga_x_bayesian => IdentifierText(
        "Bayesian best fit for the enhancement factor",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("J. J. Mortensen, K. Kaasbjerg, S. L. Frederiksen, J. K. Nørskov, J. P. Sethna, and K. W. Jacobsen,  Phys. Rev. Lett. 95, 216401 (2005)", "10.1103/PhysRevLett.95.216401", "@article{Mortensen2005_216401,\n  author = {Mortensen, J. J. and Kaasbjerg, K. and Frederiksen, S. L. and N\\o{}rskov, J. K. and Sethna, J. P. and Jacobsen, K. W.},\n  title = {{Bayesian} Error Estimation in Density-Functional Theory},\n  journal = {Phys. Rev. Lett.},\n  volume = {95},\n  issue = {21},\n  pages = {216401},\n  year = {2005},\n  month = {Nov},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevLett.95.216401},\n  url = {http://link.aps.org/doi/10.1103/PhysRevLett.95.216401}\n}\n", "Mortensen2005_216401"),
        ]),
    :gga_x_bcgp => IdentifierText(
        "Burke, Cancio, Gould, and Pittalis",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("K. Burke, A. Cancio, T. Gould, and S. Pittalis,  ArXiv e-prints  (2014)", "10.48550/arXiv.1409.4834", "@article{Burke2014_4834,\n  author = {Burke, K. and Cancio, A. and Gould, T. and Pittalis, S.},\n  title = {{Atomic correlation energies and the generalized gradient approximation}},\n  journal = {ArXiv e-prints},\n  archivePrefix = {arXiv},\n  eprint = {1409.4834},\n  primaryClass = {cond-mat.mtrl-sci},\n  year = {2014},\n  month = {September},\n  doi = {10.48550/arXiv.1409.4834}\n}\n", "Burke2014_4834"),
        ]),
    :gga_x_beefvdw => IdentifierText(
        "BEEF-vdW exchange",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("J. Wellendorff, K. T. Lundgaard, A. Møgelhøj, V. Petzold, D. D. Landis, J. K. Nørskov, T. Bligaard, and K. W. Jacobsen,  Phys. Rev. B 85, 235149 (2012)", "10.1103/PhysRevB.85.235149", "@article{Wellendorff2012_235149,\n  author = {Wellendorff, Jess and Lundgaard, Keld T. and M\\o{}gelh\\o{}j, Andreas and Petzold, Vivien and Landis, David D. and N\\o{}rskov, Jens K. and Bligaard, Thomas and Jacobsen, Karsten W.},\n  title = {Density functionals for surface science: Exchange-correlation model development with {Bayesian} error estimation},\n  journal = {Phys. Rev. B},\n  volume = {85},\n  issue = {23},\n  pages = {235149},\n  year = {2012},\n  month = {Jun},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevB.85.235149},\n  url = {http://link.aps.org/doi/10.1103/PhysRevB.85.235149}\n}\n", "Wellendorff2012_235149"),
        ]),
    :gga_x_bkl1 => IdentifierText(
        "Exchange part of type-I band gap functional by Bhattacharjee, Koshi and Lee",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("S. Bhattacharjee, N. A. Koshi, and S.-C. Lee,  Phys. Chem. Chem. Phys. 26, 26443–26452 (2024)", "10.1039/D4CP03260H", "@article{Bhattacharjee2024_PCCP_26443,\n  author = {Bhattacharjee, Satadeep and Koshi, Namitha Anna and Lee, Seung-Cheol},\n  title = {Customizing {PBE} exchange-correlation functionals: a comprehensive approach for band gap prediction in diverse semiconductors},\n  journal = {Phys. Chem. Chem. Phys.},\n  year = {2024},\n  volume = {26},\n  issue = {41},\n  pages = {26443--26452},\n  publisher = {The Royal Society of Chemistry},\n  doi = {10.1039/D4CP03260H},\n  url = {http://dx.doi.org/10.1039/D4CP03260H}\n}\n", "Bhattacharjee2024_PCCP_26443"),
        ]),
    :gga_x_bkl2 => IdentifierText(
        "Exchange part of type-II band gap functional by Bhattacharjee, Koshi and Lee",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("S. Bhattacharjee, N. A. Koshi, and S.-C. Lee,  Phys. Chem. Chem. Phys. 26, 26443–26452 (2024)", "10.1039/D4CP03260H", "@article{Bhattacharjee2024_PCCP_26443,\n  author = {Bhattacharjee, Satadeep and Koshi, Namitha Anna and Lee, Seung-Cheol},\n  title = {Customizing {PBE} exchange-correlation functionals: a comprehensive approach for band gap prediction in diverse semiconductors},\n  journal = {Phys. Chem. Chem. Phys.},\n  year = {2024},\n  volume = {26},\n  issue = {41},\n  pages = {26443--26452},\n  publisher = {The Royal Society of Chemistry},\n  doi = {10.1039/D4CP03260H},\n  url = {http://dx.doi.org/10.1039/D4CP03260H}\n}\n", "Bhattacharjee2024_PCCP_26443"),
        ]),
    :gga_x_bpccac => IdentifierText(
        "BPCCAC (GRAC for the energy)",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("É. Brémond, D. Pilard, I. Ciofini, H. Chermette, C. Adamo, and P. Cortona,  Theor. Chem. Acc. 131, 1184 (2012)", "10.1007/s00214-012-1184-0", "@article{Bremond2012_1184,\n  author = {Br\\'{e}mond, {\\'E}. and Pilard, D. and Ciofini, I. and Chermette, H. and Adamo, C. and Cortona, P.},\n  title = {Generalized gradient exchange functionals based on the gradient-regulated connection: a new member of the {TCA} family},\n  journal = {Theor. Chem. Acc.},\n  volume = {131},\n  number = {3},\n  pages = {1184},\n  year = {2012},\n  issn = {1432-881X},\n  doi = {10.1007/s00214-012-1184-0},\n  url = {http://link.springer.com/article/10.1007\\\\%2Fs00214-012-1184-0},\n  publisher = {Springer-Verlag}\n}\n", "Bremond2012_1184"),
        ]),
    :gga_x_c09x => IdentifierText(
        "C09x to be used with the VdW of Rutgers-Chalmers",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("V. R. Cooper,  Phys. Rev. B 81, 161104 (2010)", "10.1103/PhysRevB.81.161104", "@article{Cooper2010_161104,\n  author = {Cooper, V. R.},\n  title = {Van der {Waals} density functional: An appropriate exchange functional},\n  journal = {Phys. Rev. B},\n  volume = {81},\n  issue = {16},\n  pages = {161104},\n  year = {2010},\n  month = {Apr},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevB.81.161104},\n  url = {http://link.aps.org/doi/10.1103/PhysRevB.81.161104}\n}\n", "Cooper2010_161104"),
        ]),
    :gga_x_cap => IdentifierText(
        "Correct Asymptotic Potential",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("J. Carmona-Espíndola, J. L. Gázquez, A. Vela, and S. B. Trickey,  J. Chem. Phys. 142, 054105 (2015)", "10.1063/1.4906606", "@article{Carmona2015_054105,\n  author = {Carmona-Esp\\'{i}ndola, Javier and G\\'{a}zquez, Jos\\'{e} L. and Vela, Alberto and Trickey, S. B.},\n  title = {Generalized gradient approximation exchange energy functional with correct asymptotic behavior of the corresponding potential},\n  journal = {J. Chem. Phys.},\n  volume = {142},\n  number = {5},\n  pages = {054105},\n  year = {2015},\n  doi = {10.1063/1.4906606},\n  url = {https://doi.org/10.1063/1.4906606}\n}\n", "Carmona2015_054105"),
        ]),
    :gga_x_chachiyo => IdentifierText(
        "Chachiyo exchange",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("T. Chachiyo and H. Chachiyo,  Molecules 25, 3485 (2020)", "10.3390/molecules25153485", "@article{Chachiyo2020_3485,\n  author = {Chachiyo, Teepanis and Chachiyo, Hathaithip},\n  title = {Simple and Accurate Exchange Energy for Density Functional Theory},\n  journal = {Molecules},\n  volume = {25},\n  pages = {3485},\n  year = {2020},\n  issn = {1420-3049},\n  doi = {10.3390/molecules25153485},\n  url = {https://www.mdpi.com/1420-3049/25/15/3485}\n}\n", "Chachiyo2020_3485"),
        ]),
    :gga_x_df3_opt1 => IdentifierText(
        "Becke 88 reoptimized by Chakraborty et al for use with vdW functional",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("D. Chakraborty, K. Berland, and T. Thonhauser,  J. Chem. Theory Comput. 16, 5893-5911 (2020)", "10.1021/acs.jctc.0c00471", "@article{Chakraborty2020_5893,\n  author = {Chakraborty, D. and Berland, K. and Thonhauser, T.},\n  title = {Next-Generation Nonlocal van der {Waals} Density Functional},\n  journal = {J. Chem. Theory Comput.},\n  volume = {16},\n  number = {9},\n  pages = {5893-5911},\n  year = {2020},\n  doi = {10.1021/acs.jctc.0c00471},\n  url = {https://doi.org/10.1021/acs.jctc.0c00471}\n}\n", "Chakraborty2020_5893"),
        ]),
    :gga_x_df3_opt2 => IdentifierText(
        "Becke 86 reoptimized by Chakraborty et al for use with vdW functional",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("D. Chakraborty, K. Berland, and T. Thonhauser,  J. Chem. Theory Comput. 16, 5893-5911 (2020)", "10.1021/acs.jctc.0c00471", "@article{Chakraborty2020_5893,\n  author = {Chakraborty, D. and Berland, K. and Thonhauser, T.},\n  title = {Next-Generation Nonlocal van der {Waals} Density Functional},\n  journal = {J. Chem. Theory Comput.},\n  volume = {16},\n  number = {9},\n  pages = {5893-5911},\n  year = {2020},\n  doi = {10.1021/acs.jctc.0c00471},\n  url = {https://doi.org/10.1021/acs.jctc.0c00471}\n}\n", "Chakraborty2020_5893"),
        ]),
    :gga_x_dk87_r1 => IdentifierText(
        "dePristo & Kress 87 version R1",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("A. E. DePristo and J. D. Kress,  J. Chem. Phys. 86, 1425 (1987)", "10.1063/1.452230", "@article{DePristo1987_1425,\n  author = {DePristo, A. E. and Kress, J. D.},\n  title = {Rational function representation for accurate exchange energy functionals},\n  journal = {J. Chem. Phys.},\n  year = {1987},\n  volume = {86},\n  number = {3},\n  pages = {1425},\n  doi = {10.1063/1.452230},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/86/3/10.1063/1.452230}\n}\n", "DePristo1987_1425"),
        ]),
    :gga_x_dk87_r2 => IdentifierText(
        "dePristo & Kress 87 version R2",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("A. E. DePristo and J. D. Kress,  J. Chem. Phys. 86, 1425 (1987)", "10.1063/1.452230", "@article{DePristo1987_1425,\n  author = {DePristo, A. E. and Kress, J. D.},\n  title = {Rational function representation for accurate exchange energy functionals},\n  journal = {J. Chem. Phys.},\n  year = {1987},\n  volume = {86},\n  number = {3},\n  pages = {1425},\n  doi = {10.1063/1.452230},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/86/3/10.1063/1.452230}\n}\n", "DePristo1987_1425"),
        ]),
    :gga_x_eb88 => IdentifierText(
        "Non-empirical (excogitated) B88 functional of Becke and Elliott",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("P. Elliott and K. Burke,  Can. J. Chem. 87, 1485–1491 (2009)", "10.1139/V09-095", "@article{Elliott2009_1485,\n  author = {Elliott, P. and Burke, K.},\n  title = {Non-empirical derivation of the parameter in the {B88} exchange functional},\n  journal = {Can. J. Chem.},\n  volume = {87},\n  number = {10},\n  pages = {1485--1491},\n  year = {2009},\n  doi = {10.1139/V09-095},\n  url = {http://www.nrcresearchpress.com/doi/abs/10.1139/V09-095}\n}\n", "Elliott2009_1485"),
        ]),
    :gga_x_ecmv92 => IdentifierText(
        "Engel, Chevary, Macdonald and Vosko",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("E. Engel, J. A. Chevary, L. D. Macdonald, and S. H. Vosko,  Z. Phys. D: At, Mol. Clusters 23, 7–14 (1992)", "10.1007/BF01436696", "@article{Engel1992_7,\n  author = {Engel, E. and Chevary, J. A. and Macdonald, L. D. and Vosko, S. H.},\n  title = {Asymptotic properties of the exchange energy density and the exchange potential of finite systems: relevance for generalized gradient approximations},\n  journal = {Z. Phys. D: At., Mol. Clusters},\n  year = {1992},\n  month = {Mar},\n  day = {01},\n  volume = {23},\n  number = {1},\n  pages = {7--14},\n  issn = {1431-5866},\n  doi = {10.1007/BF01436696},\n  url = {https://doi.org/10.1007/BF01436696}\n}\n", "Engel1992_7"),
        ]),
    :gga_x_ev93 => IdentifierText(
        "Engel and Vosko",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("E. Engel and S. H. Vosko,  Phys. Rev. B 47, 13164–13174 (1993)", "10.1103/PhysRevB.47.13164", "@article{Engel1993_13164,\n  author = {Engel, E. and Vosko, S. H.},\n  title = {Exact exchange-only potentials and the virial relation as microscopic criteria for generalized gradient approximations},\n  journal = {Phys. Rev. B},\n  volume = {47},\n  issue = {20},\n  pages = {13164--13174},\n  year = {1993},\n  month = {May},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevB.47.13164},\n  url = {http://link.aps.org/doi/10.1103/PhysRevB.47.13164}\n}\n", "Engel1993_13164"),
        ]),
    :gga_x_ft97_a => IdentifierText(
        "Filatov & Thiel 97 (version A)",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("M. Filatov and W. Thiel,  Mol. Phys. 91, 847 (1997)", "10.1080/002689797170950", "@article{Filatov1997_847,\n  author = {Filatov, M. and Thiel, W.},\n  title = {A new gradient-corrected exchange-correlation density functional},\n  journal = {Mol. Phys.},\n  volume = {91},\n  number = {5},\n  pages = {847},\n  year = {1997},\n  doi = {10.1080/002689797170950},\n  url = {http://www.tandfonline.com/doi/abs/10.1080/002689797170950}\n}\n", "Filatov1997_847"),
        ]),
    :gga_x_ft97_b => IdentifierText(
        "Filatov & Thiel 97 (version B)",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("M. Filatov and W. Thiel,  Mol. Phys. 91, 847 (1997)", "10.1080/002689797170950", "@article{Filatov1997_847,\n  author = {Filatov, M. and Thiel, W.},\n  title = {A new gradient-corrected exchange-correlation density functional},\n  journal = {Mol. Phys.},\n  volume = {91},\n  number = {5},\n  pages = {847},\n  year = {1997},\n  doi = {10.1080/002689797170950},\n  url = {http://www.tandfonline.com/doi/abs/10.1080/002689797170950}\n}\n", "Filatov1997_847"),
        ]),
    :gga_x_g96 => IdentifierText(
        "Gill 96",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("P. M. W. Gill,  Mol. Phys. 89, 433 (1996)", "10.1080/002689796173813", "@article{Gill1996_433,\n  author = {Gill, P. M. W.},\n  title = {A new gradient-corrected exchange functional},\n  journal = {Mol. Phys.},\n  volume = {89},\n  number = {2},\n  pages = {433},\n  year = {1996},\n  doi = {10.1080/002689796173813},\n  url = {http://www.tandfonline.com/doi/abs/10.1080/002689796173813}\n}\n", "Gill1996_433"),
        ]),
    :gga_x_gam => IdentifierText(
        "Minnesota GAM exhange functional",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("H. S. Yu, W. Zhang, P. Verma, X. He, and D. G. Truhlar,  Phys. Chem. Chem. Phys. 17, 12146–12160 (2015)", "10.1039/C5CP01425E", "@article{Yu2015_12146,\n  author = {Yu, Haoyu S. and Zhang, Wenjing and Verma, Pragya and He, Xiao and Truhlar, Donald G.},\n  title = {Nonseparable exchange-correlation functional for molecules, including homogeneous catalysis involving transition metals},\n  journal = {Phys. Chem. Chem. Phys.},\n  year = {2015},\n  volume = {17},\n  issue = {18},\n  pages = {12146--12160},\n  publisher = {The Royal Society of Chemistry},\n  doi = {10.1039/C5CP01425E},\n  url = {https://doi.org/10.1039/C5CP01425E}\n}\n", "Yu2015_12146"),
        ]),
    :gga_x_gg99 => IdentifierText(
        "Gilbert and Gill 1999",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("A. T.B. Gilbert and P. M.W. Gill,  Chem. Phys. Lett. 312, 511–521 (1999)", "10.1016/S0009-2614(99)00836-2", "@article{Gilbert1999_511,\n  author = {Gilbert, Andrew T.B. and Gill, Peter M.W.},\n  title = {Decomposition of exchange-correlation energies},\n  journal = {Chem. Phys. Lett.},\n  volume = {312},\n  number = {5-6},\n  pages = {511--521},\n  year = {1999},\n  issn = {0009-2614},\n  doi = {10.1016/S0009-2614(99)00836-2},\n  url = {http://www.sciencedirect.com/science/article/pii/S0009261499008362}\n}\n", "Gilbert1999_511"),
        ]),
    :gga_x_hcth_a => IdentifierText(
        "HCTH-A",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("F. A. Hamprecht, A. J. Cohen, D. J. Tozer, and N. C. Handy,  J. Chem. Phys. 109, 6264 (1998)", "10.1063/1.477267", "@article{Hamprecht1998_6264,\n  author = {Hamprecht, F. A. and Cohen, A. J. and Tozer, D. J. and Handy, N. C.},\n  title = {Development and assessment of new exchange-correlation functionals},\n  journal = {J. Chem. Phys.},\n  year = {1998},\n  volume = {109},\n  number = {15},\n  pages = {6264},\n  doi = {10.1063/1.477267},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/109/15/10.1063/1.477267}\n}\n", "Hamprecht1998_6264"),
        ]),
    :gga_x_hjs_b88 => IdentifierText(
        "HJS screened exchange B88 version",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("T. M. Henderson, B. G. Janesko, and G. E. Scuseria,  J. Chem. Phys. 128, 194105 (2008)", "10.1063/1.2921797", "@article{Henderson2008_194105,\n  author = {Henderson, T. M. and Janesko, B. G. and Scuseria, G. E.},\n  title = {Generalized gradient approximation model exchange holes for range-separated hybrids},\n  journal = {J. Chem. Phys.},\n  year = {2008},\n  volume = {128},\n  number = {19},\n  pages = {194105},\n  doi = {10.1063/1.2921797},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/128/19/10.1063/1.2921797}\n}\n", "Henderson2008_194105"),
        ]),
    :gga_x_hjs_b88_v2 => IdentifierText(
        "HJS screened exchange B88 corrected version",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("E. Weintraub, T. M. Henderson, and G. E. Scuseria,  J. Chem. Theory Comput. 5, 754–762 (2009)", "10.1021/ct800530u", "@article{Weintraub2009_754,\n  author = {Weintraub, E. and Henderson, T. M. and Scuseria, G. E.},\n  title = {Long-Range-Corrected Hybrids Based on a New Model Exchange Hole},\n  journal = {J. Chem. Theory Comput.},\n  volume = {5},\n  number = {4},\n  pages = {754--762},\n  year = {2009},\n  doi = {10.1021/ct800530u},\n  url = {http://pubs.acs.org/doi/abs/10.1021/ct800530u}\n}\n", "Weintraub2009_754"),
        ]),
    :gga_x_hjs_b97x => IdentifierText(
        "HJS screened exchange B97x version",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("T. M. Henderson, B. G. Janesko, and G. E. Scuseria,  J. Chem. Phys. 128, 194105 (2008)", "10.1063/1.2921797", "@article{Henderson2008_194105,\n  author = {Henderson, T. M. and Janesko, B. G. and Scuseria, G. E.},\n  title = {Generalized gradient approximation model exchange holes for range-separated hybrids},\n  journal = {J. Chem. Phys.},\n  year = {2008},\n  volume = {128},\n  number = {19},\n  pages = {194105},\n  doi = {10.1063/1.2921797},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/128/19/10.1063/1.2921797}\n}\n", "Henderson2008_194105"),
        ]),
    :gga_x_hjs_pbe => IdentifierText(
        "HJS screened exchange PBE version",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("T. M. Henderson, B. G. Janesko, and G. E. Scuseria,  J. Chem. Phys. 128, 194105 (2008)", "10.1063/1.2921797", "@article{Henderson2008_194105,\n  author = {Henderson, T. M. and Janesko, B. G. and Scuseria, G. E.},\n  title = {Generalized gradient approximation model exchange holes for range-separated hybrids},\n  journal = {J. Chem. Phys.},\n  year = {2008},\n  volume = {128},\n  number = {19},\n  pages = {194105},\n  doi = {10.1063/1.2921797},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/128/19/10.1063/1.2921797}\n}\n", "Henderson2008_194105"),
        ]),
    :gga_x_hjs_pbe_sol => IdentifierText(
        "HJS screened exchange PBE_SOL version",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("T. M. Henderson, B. G. Janesko, and G. E. Scuseria,  J. Chem. Phys. 128, 194105 (2008)", "10.1063/1.2921797", "@article{Henderson2008_194105,\n  author = {Henderson, T. M. and Janesko, B. G. and Scuseria, G. E.},\n  title = {Generalized gradient approximation model exchange holes for range-separated hybrids},\n  journal = {J. Chem. Phys.},\n  year = {2008},\n  volume = {128},\n  number = {19},\n  pages = {194105},\n  doi = {10.1063/1.2921797},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/128/19/10.1063/1.2921797}\n}\n", "Henderson2008_194105"),
        ]),
    :gga_x_htbs => IdentifierText(
        "Haas, Tran, Blaha, and Schwarz",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("P. Haas, F. Tran, P. Blaha, and K. Schwarz,  Phys. Rev. B 83, 205117 (2011)", "10.1103/PhysRevB.83.205117", "@article{Haas2011_205117,\n  author = {Haas, P. and Tran, F. and Blaha, P. and Schwarz, K.},\n  title = {Construction of an optimal {GGA} functional for molecules and solids},\n  journal = {Phys. Rev. B},\n  volume = {83},\n  issue = {20},\n  pages = {205117},\n  year = {2011},\n  month = {May},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevB.83.205117},\n  url = {http://link.aps.org/doi/10.1103/PhysRevB.83.205117}\n}\n", "Haas2011_205117"),
        ]),
    :gga_x_ityh => IdentifierText(
        "Short-range recipe for B88 functional - erf",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("H. Iikura, T. Tsuneda, T. Yanai, and K. Hirao,  J. Chem. Phys. 115, 3540 (2001)", "10.1063/1.1383587", "@article{Iikura2001_3540,\n  author = {Iikura, H. and Tsuneda, T. and Yanai, T. and Hirao, K.},\n  title = {A long-range correction scheme for generalized-gradient-approximation exchange functionals},\n  journal = {J. Chem. Phys.},\n  year = {2001},\n  volume = {115},\n  number = {8},\n  pages = {3540},\n  doi = {10.1063/1.1383587},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/115/8/10.1063/1.1383587}\n}\n", "Iikura2001_3540"),
        ]),
    :gga_x_ityh_optx => IdentifierText(
        "Short-range recipe for OPTX functional",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("N. C. Handy and A. J. Cohen,  Mol. Phys. 99, 403 (2001)", "10.1080/00268970010018431", "@article{Handy2001_403,\n  author = {Handy, N. C. and Cohen, A. J.},\n  title = {Left-right correlation energy},\n  journal = {Mol. Phys.},\n  volume = {99},\n  number = {5},\n  pages = {403},\n  year = {2001},\n  doi = {10.1080/00268970010018431},\n  url = {http://www.tandfonline.com/doi/abs/10.1080/00268970010018431}\n}\n", "Handy2001_403"),
            LibxcReference("H. Iikura, T. Tsuneda, T. Yanai, and K. Hirao,  J. Chem. Phys. 115, 3540 (2001)", "10.1063/1.1383587", "@article{Iikura2001_3540,\n  author = {Iikura, H. and Tsuneda, T. and Yanai, T. and Hirao, K.},\n  title = {A long-range correction scheme for generalized-gradient-approximation exchange functionals},\n  journal = {J. Chem. Phys.},\n  year = {2001},\n  volume = {115},\n  number = {8},\n  pages = {3540},\n  doi = {10.1063/1.1383587},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/115/8/10.1063/1.1383587}\n}\n", "Iikura2001_3540"),
        ]),
    :gga_x_ityh_pbe => IdentifierText(
        "Short-range recipe for PBE functional",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("J. P. Perdew, K. Burke, and M. Ernzerhof,  Phys. Rev. Lett. 77, 3865 (1996)", "10.1103/PhysRevLett.77.3865", "@article{Perdew1996_3865,\n  author = {Perdew, J. P. and Burke, K. and Ernzerhof, M.},\n  title = {Generalized Gradient Approximation Made Simple},\n  journal = {Phys. Rev. Lett.},\n  volume = {77},\n  issue = {18},\n  pages = {3865},\n  year = {1996},\n  month = {Oct},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevLett.77.3865},\n  url = {http://link.aps.org/doi/10.1103/PhysRevLett.77.3865}\n}\n", "Perdew1996_3865"),
            LibxcReference("J. P. Perdew, K. Burke, and M. Ernzerhof,  Phys. Rev. Lett. 78, 1396 (1997)", "10.1103/PhysRevLett.78.1396", "@article{Perdew1997_1396,\n  author = {Perdew, J. P. and Burke, K. and Ernzerhof, M.},\n  title = {Errata: {Generalized} Gradient Approximation Made Simple [{Phys.} {Rev.} {Lett.} 77, 3865 (1996)]},\n  journal = {Phys. Rev. Lett.},\n  volume = {78},\n  issue = {7},\n  pages = {1396},\n  year = {1997},\n  month = {Feb},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevLett.78.1396},\n  url = {http://link.aps.org/doi/10.1103/PhysRevLett.78.1396}\n}\n", "Perdew1997_1396"),
            LibxcReference("H. Iikura, T. Tsuneda, T. Yanai, and K. Hirao,  J. Chem. Phys. 115, 3540 (2001)", "10.1063/1.1383587", "@article{Iikura2001_3540,\n  author = {Iikura, H. and Tsuneda, T. and Yanai, T. and Hirao, K.},\n  title = {A long-range correction scheme for generalized-gradient-approximation exchange functionals},\n  journal = {J. Chem. Phys.},\n  year = {2001},\n  volume = {115},\n  number = {8},\n  pages = {3540},\n  doi = {10.1063/1.1383587},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/115/8/10.1063/1.1383587}\n}\n", "Iikura2001_3540"),
        ]),
    :gga_x_kgg99 => IdentifierText(
        "Gilbert and Gill 1999 (mixed)",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("A. T.B. Gilbert and P. M.W. Gill,  Chem. Phys. Lett. 312, 511–521 (1999)", "10.1016/S0009-2614(99)00836-2", "@article{Gilbert1999_511,\n  author = {Gilbert, Andrew T.B. and Gill, Peter M.W.},\n  title = {Decomposition of exchange-correlation energies},\n  journal = {Chem. Phys. Lett.},\n  volume = {312},\n  number = {5-6},\n  pages = {511--521},\n  year = {1999},\n  issn = {0009-2614},\n  doi = {10.1016/S0009-2614(99)00836-2},\n  url = {http://www.sciencedirect.com/science/article/pii/S0009261499008362}\n}\n", "Gilbert1999_511"),
        ]),
    :gga_x_kt1 => IdentifierText(
        "Exchange part of Keal and Tozer version 1",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("T. W. Keal and D. J. Tozer,  J. Chem. Phys. 119, 3015 (2003)", "10.1063/1.1590634", "@article{Keal2003_3015,\n  author = {Keal, T. W. and Tozer, D. J.},\n  title = {The exchange-correlation potential in {Kohn}--{Sham} nuclear magnetic resonance shielding calculations},\n  journal = {J. Chem. Phys.},\n  year = {2003},\n  volume = {119},\n  number = {6},\n  pages = {3015},\n  doi = {10.1063/1.1590634},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/119/6/10.1063/1.1590634}\n}\n", "Keal2003_3015"),
        ]),
    :gga_x_lag => IdentifierText(
        "Local Airy Gas",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("L. Vitos, B. Johansson, J. Kollár, and H. L. Skriver,  Phys. Rev. B 62, 10046 (2000)", "10.1103/PhysRevB.62.10046", "@article{Vitos2000_10046,\n  author = {Vitos, L. and Johansson, B. and Koll\\'{a}r, J. and Skriver, H. L.},\n  title = {Exchange energy in the local {Airy} gas approximation},\n  journal = {Phys. Rev. B},\n  volume = {62},\n  issue = {15},\n  pages = {10046},\n  year = {2000},\n  month = {Oct},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevB.62.10046},\n  url = {http://link.aps.org/doi/10.1103/PhysRevB.62.10046}\n}\n", "Vitos2000_10046"),
        ]),
    :gga_x_lambda_ch_n => IdentifierText(
        "lambda_CH(N) version of PBE",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("M. M. Odashima, K. Capelle, and S. B. Trickey,  J. Chem. Theory Comput. 5, 798–807 (2009)", "10.1021/ct8005634", "@article{Odashima2009_798,\n  author = {Odashima, Mariana M. and Capelle, K. and Trickey, S. B.},\n  title = {Tightened {Lieb}--{Oxford} Bound for Systems of Fixed Particle Number},\n  journal = {J. Chem. Theory Comput.},\n  volume = {5},\n  number = {4},\n  pages = {798--807},\n  year = {2009},\n  doi = {10.1021/ct8005634},\n  url = {https://doi.org/10.1021/ct8005634}\n}\n", "Odashima2009_798"),
        ]),
    :gga_x_lambda_lo_n => IdentifierText(
        "lambda_LO(N) version of PBE",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("M. M. Odashima, K. Capelle, and S. B. Trickey,  J. Chem. Theory Comput. 5, 798–807 (2009)", "10.1021/ct8005634", "@article{Odashima2009_798,\n  author = {Odashima, Mariana M. and Capelle, K. and Trickey, S. B.},\n  title = {Tightened {Lieb}--{Oxford} Bound for Systems of Fixed Particle Number},\n  journal = {J. Chem. Theory Comput.},\n  volume = {5},\n  number = {4},\n  pages = {798--807},\n  year = {2009},\n  doi = {10.1021/ct8005634},\n  url = {https://doi.org/10.1021/ct8005634}\n}\n", "Odashima2009_798"),
        ]),
    :gga_x_lambda_oc2_n => IdentifierText(
        "lambda_OC2(N) version of PBE",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("M. M. Odashima, K. Capelle, and S. B. Trickey,  J. Chem. Theory Comput. 5, 798–807 (2009)", "10.1021/ct8005634", "@article{Odashima2009_798,\n  author = {Odashima, Mariana M. and Capelle, K. and Trickey, S. B.},\n  title = {Tightened {Lieb}--{Oxford} Bound for Systems of Fixed Particle Number},\n  journal = {J. Chem. Theory Comput.},\n  volume = {5},\n  number = {4},\n  pages = {798--807},\n  year = {2009},\n  doi = {10.1021/ct8005634},\n  url = {https://doi.org/10.1021/ct8005634}\n}\n", "Odashima2009_798"),
        ]),
    :gga_x_lb => IdentifierText(
        "van Leeuwen & Baerends",
        (:have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (1, 2, 3, 4),
        LibxcReference[
            LibxcReference("R. van Leeuwen and E. J. Baerends,  Phys. Rev. A 49, 2421 (1994)", "10.1103/PhysRevA.49.2421", "@article{vanLeeuwen1994_2421,\n  author = {van Leeuwen, R. and Baerends, E. J.},\n  title = {Exchange-correlation potential with correct asymptotic behavior},\n  journal = {Phys. Rev. A},\n  volume = {49},\n  issue = {4},\n  pages = {2421},\n  year = {1994},\n  month = {Apr},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevA.49.2421},\n  url = {http://link.aps.org/doi/10.1103/PhysRevA.49.2421}\n}\n", "vanLeeuwen1994_2421"),
        ]),
    :gga_x_lbm => IdentifierText(
        "van Leeuwen & Baerends modified",
        (:have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (1, 2, 3, 4),
        LibxcReference[
            LibxcReference("P. R. T. Schipper, O. V. Gritsenko, S. J. A. van Gisbergen, and E. J. Baerends,  J. Chem. Phys. 112, 1344 (2000)", "10.1063/1.480688", "@article{Schipper2000_1344,\n  author = {Schipper, P. R. T. and Gritsenko, O. V. and van Gisbergen, S. J. A. and Baerends, E. J.},\n  title = {Molecular calculations of excitation energies and (hyper)polarizabilities with a statistical average of orbital model exchange-correlation potentials},\n  journal = {J. Chem. Phys.},\n  year = {2000},\n  volume = {112},\n  number = {3},\n  pages = {1344},\n  doi = {10.1063/1.480688},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/112/3/10.1063/1.480688}\n}\n", "Schipper2000_1344"),
        ]),
    :gga_x_lg93 => IdentifierText(
        "Lacks & Gordon 93",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("D. J. Lacks and R. G. Gordon,  Phys. Rev. A 47, 4681 (1993)", "10.1103/PhysRevA.47.4681", "@article{Lacks1993_4681,\n  author = {Lacks, D. J. and Gordon, R. G.},\n  title = {Pair interactions of rare-gas atoms as a test of exchange-energy-density functionals in regions of large density gradients},\n  journal = {Phys. Rev. A},\n  volume = {47},\n  issue = {6},\n  pages = {4681},\n  year = {1993},\n  month = {Jun},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevA.47.4681},\n  url = {http://link.aps.org/doi/10.1103/PhysRevA.47.4681}\n}\n", "Lacks1993_4681"),
        ]),
    :gga_x_llp => IdentifierText(
        "Lee, Lee & Parr reparametrization of B88",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("H. Lee, C. Lee, and R. G. Parr,  Phys. Rev. A 44, 768 (1991)", "10.1103/PhysRevA.44.768", "@article{Lee1991_768,\n  author = {Lee, H. and Lee, C. and Parr, R. G.},\n  title = {Conjoint gradient correction to the {Hartree}--{Fock} kinetic- and exchange-energy density functionals},\n  journal = {Phys. Rev. A},\n  volume = {44},\n  issue = {1},\n  pages = {768},\n  year = {1991},\n  month = {Jul},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevA.44.768},\n  url = {http://link.aps.org/doi/10.1103/PhysRevA.44.768}\n}\n", "Lee1991_768"),
        ]),
    :gga_x_lspbe => IdentifierText(
        "lsPBE, a PW91-like modification of PBE exchange",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("J. C. Pacheco-Kato, J. M. del Campo, J. L. Gázquez, S. B. Trickey, and A. Vela,  Chem. Phys. Lett. 651, 268–273 (2016)", "10.1016/j.cplett.2016.03.028", "@article{PachecoKato2016_268,\n  author = {Pacheco-Kato, Juan C. and del Campo, Jorge M. and G\\'{a}zquez, Jos\\'{e} L. and Trickey, S. B. and Vela, Alberto},\n  title = {A {PW91}-like exchange with a simple analytical form},\n  journal = {Chem. Phys. Lett.},\n  volume = {651},\n  pages = {268--273},\n  year = {2016},\n  issn = {0009-2614},\n  doi = {10.1016/j.cplett.2016.03.028},\n  url = {http://www.sciencedirect.com/science/article/pii/S0009261416301373}\n}\n", "PachecoKato2016_268"),
        ]),
    :gga_x_lsrpbe => IdentifierText(
        "lsRPBE, a PW91-like modification of RPBE",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("J. C. Pacheco-Kato, J. M. del Campo, J. L. Gázquez, S. B. Trickey, and A. Vela,  Chem. Phys. Lett. 651, 268–273 (2016)", "10.1016/j.cplett.2016.03.028", "@article{PachecoKato2016_268,\n  author = {Pacheco-Kato, Juan C. and del Campo, Jorge M. and G\\'{a}zquez, Jos\\'{e} L. and Trickey, S. B. and Vela, Alberto},\n  title = {A {PW91}-like exchange with a simple analytical form},\n  journal = {Chem. Phys. Lett.},\n  volume = {651},\n  pages = {268--273},\n  year = {2016},\n  issn = {0009-2614},\n  doi = {10.1016/j.cplett.2016.03.028},\n  url = {http://www.sciencedirect.com/science/article/pii/S0009261416301373}\n}\n", "PachecoKato2016_268"),
        ]),
    :gga_x_lv_rpw86 => IdentifierText(
        "Berland and Hyldgaard",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("K. Berland and P. Hyldgaard,  Phys. Rev. B 89, 035412 (2014)", "10.1103/PhysRevB.89.035412", "@article{Berland2014_035412,\n  author = {Berland, K. and Hyldgaard, P.},\n  title = {Exchange functional that tests the robustness of the plasmon description of the van der {Waals} density functional},\n  journal = {Phys. Rev. B},\n  volume = {89},\n  issue = {3},\n  pages = {035412},\n  year = {2014},\n  month = {Jan},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevB.89.035412},\n  url = {http://link.aps.org/doi/10.1103/PhysRevB.89.035412}\n}\n", "Berland2014_035412"),
        ]),
    :gga_x_mb88 => IdentifierText(
        "Modified Becke 88 for proton transfer",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("V. Tognetti and C. Adamo,  J. Phys. Chem. A 113, 14415 (2009)", "10.1021/jp903672e", "@article{Tognetti2009_14415,\n  author = {Tognetti, V. and Adamo, C.},\n  title = {Optimized {GGA} Functional for Proton Transfer Reactions},\n  journal = {J. Phys. Chem. A},\n  volume = {113},\n  number = {52},\n  pages = {14415},\n  year = {2009},\n  doi = {10.1021/jp903672e},\n  url = {http://pubs.acs.org/doi/abs/10.1021/jp903672e}\n}\n", "Tognetti2009_14415"),
        ]),
    :gga_x_mpbe => IdentifierText(
        "Adamo & Barone modification to PBE",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("C. Adamo and V. Barone,  J. Chem. Phys. 116, 5933 (2002)", "10.1063/1.1458927", "@article{Adamo2002_5933,\n  author = {Adamo, C. and Barone, V.},\n  title = {Physically motivated density functionals with improved performances: The modified {Perdew}--{Burke}--{Ernzerhof} model},\n  journal = {J. Chem. Phys.},\n  year = {2002},\n  volume = {116},\n  number = {14},\n  pages = {5933},\n  doi = {10.1063/1.1458927},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/116/14/10.1063/1.1458927}\n}\n", "Adamo2002_5933"),
        ]),
    :gga_x_mpw91 => IdentifierText(
        "mPW91 of Adamo & Barone",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("C. Adamo and V. Barone,  J. Chem. Phys. 108, 664 (1998)", "10.1063/1.475428", "@article{Adamo1998_664,\n  author = {Adamo, C. and Barone, V.},\n  title = {Exchange functionals with improved long-range behavior and adiabatic connection methods without adjustable parameters: The {mPW} and {mPW1PW} models},\n  journal = {J. Chem. Phys.},\n  year = {1998},\n  volume = {108},\n  number = {2},\n  pages = {664},\n  doi = {10.1063/1.475428},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/108/2/10.1063/1.475428}\n}\n", "Adamo1998_664"),
        ]),
    :gga_x_n12 => IdentifierText(
        "Minnesota N12 exchange functional",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("R. Peverati and D. G. Truhlar,  J. Chem. Theory Comput. 8, 2310 (2012)", "10.1021/ct3002656", "@article{Peverati2012_2310,\n  author = {Peverati, R. and Truhlar, D. G.},\n  title = {Exchange-Correlation Functional with Good Accuracy for Both Structural and Energetic Properties while Depending Only on the Density and Its Gradient},\n  journal = {J. Chem. Theory Comput.},\n  volume = {8},\n  number = {7},\n  pages = {2310},\n  year = {2012},\n  doi = {10.1021/ct3002656},\n  url = {http://pubs.acs.org/doi/abs/10.1021/ct3002656}\n}\n", "Peverati2012_2310"),
        ]),
    :gga_x_ncap => IdentifierText(
        "Nearly correct asymptotic potential",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("J. Carmona-Espíndola, J. L. Gázquez, A. Vela, and S. B. Trickey,  J. Chem. Theory Comput. 15, 303–310 (2019)", "10.1021/acs.jctc.8b00998", "@article{Carmona2019_303,\n  author = {Carmona-Esp\\'{i}ndola, Javier and G\\'{a}zquez, Jos\\'{e} L. and Vela, Alberto and Trickey, S. B.},\n  title = {Generalized Gradient Approximation Exchange Energy Functional with Near-Best Semilocal Performance},\n  journal = {J. Chem. Theory Comput.},\n  volume = {15},\n  number = {1},\n  pages = {303--310},\n  year = {2019},\n  doi = {10.1021/acs.jctc.8b00998},\n  url = {https://doi.org/10.1021/acs.jctc.8b00998}\n}\n", "Carmona2019_303"),
        ]),
    :gga_x_ncapr => IdentifierText(
        "Nearly correct asymptotic potential revised",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("J. Carmona-Espíndola, A. Flores, J. L. Gázquez, A. Vela, and S. B. Trickey,  J. Chem. Phys. 157, 114109 (2022)", "10.1063/5.0096678", "@article{Carmona2022_114109,\n  author = {Carmona-Esp\\'{i}ndola, Javier and Flores, Anaid and G\\'{a}zquez, Jos\\'{e} L. and Vela, Alberto and Trickey, S. B.},\n  title = {Hardness of molecules and bandgap of solids from a generalized gradient approximation exchange energy functional},\n  journal = {J. Chem. Phys.},\n  volume = {157},\n  number = {11},\n  pages = {114109},\n  year = {2022},\n  doi = {10.1063/5.0096678},\n  URL = {https://doi.org/10.1063/5.0096678}\n}\n", "Carmona2022_114109"),
        ]),
    :gga_x_ol2 => IdentifierText(
        "Exchange form based on Ou-Yang and Levy v.2",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("P. Fuentealba and O. Reyes,  Chem. Phys. Lett. 232, 31 (1995)", "10.1016/0009-2614(94)01321-L", "@article{Fuentealba1995_31,\n  author = {Fuentealba, P. and Reyes, O.},\n  title = {Further evidence of the conjoint correction to the local kinetic and exchange energy density functionals},\n  journal = {Chem. Phys. Lett.},\n  volume = {232},\n  number = {1--2},\n  pages = {31},\n  year = {1995},\n  issn = {0009-2614},\n  doi = {10.1016/0009-2614(94)01321-L},\n  url = {http://www.sciencedirect.com/science/article/pii/000926149401321L}\n}\n", "Fuentealba1995_31"),
            LibxcReference("H. Ou-Yang and M. Levy,  Int. J. Quantum Chem. 40, 379 (1991)", "10.1002/qua.560400309", "@article{OuYang1991_379,\n  author = {Ou-Yang, H. and Levy, M.},\n  title = {Approximate noninteracting kinetic energy functionals from a nonuniform scaling requirement},\n  journal = {Int. J. Quantum Chem.},\n  volume = {40},\n  number = {3},\n  pages = {379},\n  year = {1991},\n  publisher = {John Wiley \\& Sons, Inc.},\n  issn = {1097-461X},\n  doi = {10.1002/qua.560400309},\n  url = {http://onlinelibrary.wiley.com/doi/10.1002/qua.560400309/abstract}\n}\n", "OuYang1991_379"),
        ]),
    :gga_x_optb86b_vdw => IdentifierText(
        "Becke 86 reoptimized for use with vdW functional of Dion et al",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("J. Klimeš, D. R. Bowler, and A. Michaelides,  Phys. Rev. B 83, 195131 (2011)", "10.1103/PhysRevB.83.195131", "@article{Klimes2011_195131,\n  author = {Klime\\v{s}, Ji\\v{r}\\'{i} and Bowler, David R. and Michaelides, Angelos},\n  title = {Van der {Waals} density functionals applied to solids},\n  journal = {Phys. Rev. B},\n  volume = {83},\n  issue = {19},\n  pages = {195131},\n  year = {2011},\n  month = {May},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevB.83.195131},\n  url = {https://link.aps.org/doi/10.1103/PhysRevB.83.195131}\n}\n", "Klimes2011_195131"),
        ]),
    :gga_x_optb88_vdw => IdentifierText(
        "opt-Becke 88 for vdW",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("J. Klimeš, D. R. Bowler, and A. Michaelides,  J. Phys.: Condens. Matter 22, 022201 (2010)", "10.1088/0953-8984/22/2/022201", "@article{Klimes2010_022201,\n  author = {Klime\\v{s}, J. and Bowler, D. R. and Michaelides, A.},\n  title = {Chemical accuracy for the van der {Waals} density functional},\n  journal = {J. Phys.: Condens. Matter},\n  volume = {22},\n  number = {2},\n  pages = {022201},\n  year = {2010},\n  doi = {10.1088/0953-8984/22/2/022201},\n  url = {http://stacks.iop.org/0953-8984/22/i=2/a=022201}\n}\n", "Klimes2010_022201"),
        ]),
    :gga_x_optpbe_vdw => IdentifierText(
        "Reparametrized PBE for vdW",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("J. Klimeš, D. R. Bowler, and A. Michaelides,  J. Phys.: Condens. Matter 22, 022201 (2010)", "10.1088/0953-8984/22/2/022201", "@article{Klimes2010_022201,\n  author = {Klime\\v{s}, J. and Bowler, D. R. and Michaelides, A.},\n  title = {Chemical accuracy for the van der {Waals} density functional},\n  journal = {J. Phys.: Condens. Matter},\n  volume = {22},\n  number = {2},\n  pages = {022201},\n  year = {2010},\n  doi = {10.1088/0953-8984/22/2/022201},\n  url = {http://stacks.iop.org/0953-8984/22/i=2/a=022201}\n}\n", "Klimes2010_022201"),
        ]),
    :gga_x_optx => IdentifierText(
        "Handy & Cohen OPTX 01",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("N. C. Handy and A. J. Cohen,  Mol. Phys. 99, 403 (2001)", "10.1080/00268970010018431", "@article{Handy2001_403,\n  author = {Handy, N. C. and Cohen, A. J.},\n  title = {Left-right correlation energy},\n  journal = {Mol. Phys.},\n  volume = {99},\n  number = {5},\n  pages = {403},\n  year = {2001},\n  doi = {10.1080/00268970010018431},\n  url = {http://www.tandfonline.com/doi/abs/10.1080/00268970010018431}\n}\n", "Handy2001_403"),
        ]),
    :gga_x_pbe => IdentifierText(
        "Perdew, Burke & Ernzerhof",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("J. P. Perdew, K. Burke, and M. Ernzerhof,  Phys. Rev. Lett. 77, 3865 (1996)", "10.1103/PhysRevLett.77.3865", "@article{Perdew1996_3865,\n  author = {Perdew, J. P. and Burke, K. and Ernzerhof, M.},\n  title = {Generalized Gradient Approximation Made Simple},\n  journal = {Phys. Rev. Lett.},\n  volume = {77},\n  issue = {18},\n  pages = {3865},\n  year = {1996},\n  month = {Oct},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevLett.77.3865},\n  url = {http://link.aps.org/doi/10.1103/PhysRevLett.77.3865}\n}\n", "Perdew1996_3865"),
            LibxcReference("J. P. Perdew, K. Burke, and M. Ernzerhof,  Phys. Rev. Lett. 78, 1396 (1997)", "10.1103/PhysRevLett.78.1396", "@article{Perdew1997_1396,\n  author = {Perdew, J. P. and Burke, K. and Ernzerhof, M.},\n  title = {Errata: {Generalized} Gradient Approximation Made Simple [{Phys.} {Rev.} {Lett.} 77, 3865 (1996)]},\n  journal = {Phys. Rev. Lett.},\n  volume = {78},\n  issue = {7},\n  pages = {1396},\n  year = {1997},\n  month = {Feb},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevLett.78.1396},\n  url = {http://link.aps.org/doi/10.1103/PhysRevLett.78.1396}\n}\n", "Perdew1997_1396"),
        ]),
    :gga_x_pbe_erf_gws => IdentifierText(
        "Short ranged PBE exchange (erfc)",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("E. Goll, H.-J. Werner, and H. Stoll,  Phys. Chem. Chem. Phys. 7, 3917–3923 (2005)", "10.1039/B509242F", "@article{Goll2005_3917,\n  author = {Goll, Erich and Werner, Hans-Joachim and Stoll, Hermann},\n  title = {A short-range gradient-corrected density functional in long-range coupled-cluster calculations for rare gas dimers},\n  journal = {Phys. Chem. Chem. Phys.},\n  year = {2005},\n  volume = {7},\n  issue = {23},\n  pages = {3917--3923},\n  publisher = {The Royal Society of Chemistry},\n  doi = {10.1039/B509242F},\n  url = {https://doi.org/10.1039/B509242F}\n}\n", "Goll2005_3917"),
            LibxcReference("E. Goll, H.-J. Werner, H. Stoll, T. Leininger, P. Gori-Giorgi, and A. Savin,  Chem. Phys. 329, 276–282 (2006)", "10.1016/j.chemphys.2006.05.020", "@article{Goll2006_276,\n  author = {Goll, Erich and Werner, Hans-Joachim and Stoll, Hermann and Leininger, Thierry and Gori-Giorgi, Paola and Savin, Andreas},\n  title = {A short-range gradient-corrected spin density functional in combination with long-range coupled-cluster methods: Application to alkali-metal rare-gas dimers},\n  journal = {Chem. Phys.},\n  volume = {329},\n  number = {1},\n  pages = {276--282},\n  year = {2006},\n  issn = {0301-0104},\n  doi = {10.1016/j.chemphys.2006.05.020},\n  url = {https://doi.org/10.1016/j.chemphys.2006.05.020}\n}\n", "Goll2006_276"),
        ]),
    :gga_x_pbe_gaussian => IdentifierText(
        "Perdew, Burke & Ernzerhof with parameter values used in Gaussian",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("J. P. Perdew, K. Burke, and M. Ernzerhof,  Phys. Rev. Lett. 77, 3865 (1996)", "10.1103/PhysRevLett.77.3865", "@article{Perdew1996_3865,\n  author = {Perdew, J. P. and Burke, K. and Ernzerhof, M.},\n  title = {Generalized Gradient Approximation Made Simple},\n  journal = {Phys. Rev. Lett.},\n  volume = {77},\n  issue = {18},\n  pages = {3865},\n  year = {1996},\n  month = {Oct},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevLett.77.3865},\n  url = {http://link.aps.org/doi/10.1103/PhysRevLett.77.3865}\n}\n", "Perdew1996_3865"),
            LibxcReference("J. P. Perdew, K. Burke, and M. Ernzerhof,  Phys. Rev. Lett. 78, 1396 (1997)", "10.1103/PhysRevLett.78.1396", "@article{Perdew1997_1396,\n  author = {Perdew, J. P. and Burke, K. and Ernzerhof, M.},\n  title = {Errata: {Generalized} Gradient Approximation Made Simple [{Phys.} {Rev.} {Lett.} 77, 3865 (1996)]},\n  journal = {Phys. Rev. Lett.},\n  volume = {78},\n  issue = {7},\n  pages = {1396},\n  year = {1997},\n  month = {Feb},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevLett.78.1396},\n  url = {http://link.aps.org/doi/10.1103/PhysRevLett.78.1396}\n}\n", "Perdew1997_1396"),
            LibxcReference("Defined through Gaussian implementation.", "", "@misc{gaussianimplementation,\n  note = {Defined through {Gaussian} implementation}\n}\n", "gaussianimplementation"),
        ]),
    :gga_x_pbe_jsjr => IdentifierText(
        "Reparametrized PBE by Pedroza, Silva & Capelle",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("L. S. Pedroza, A. J. R. da Silva, and K. Capelle,  Phys. Rev. B 79, 201106 (2009)", "10.1103/PhysRevB.79.201106", "@article{Pedroza2009_201106,\n  author = {Pedroza, L. S. and da Silva, A. J. R. and Capelle, K.},\n  title = {Gradient-dependent density functionals of the {Perdew}--{Burke}--{Ernzerhof} type for atoms, molecules, and solids},\n  journal = {Phys. Rev. B},\n  volume = {79},\n  issue = {20},\n  pages = {201106},\n  year = {2009},\n  month = {May},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevB.79.201106},\n  url = {http://link.aps.org/doi/10.1103/PhysRevB.79.201106}\n}\n", "Pedroza2009_201106"),
        ]),
    :gga_x_pbe_mod => IdentifierText(
        "Perdew, Burke & Ernzerhof with less precise value for beta",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("J. P. Perdew, K. Burke, and M. Ernzerhof,  Phys. Rev. Lett. 77, 3865 (1996)", "10.1103/PhysRevLett.77.3865", "@article{Perdew1996_3865,\n  author = {Perdew, J. P. and Burke, K. and Ernzerhof, M.},\n  title = {Generalized Gradient Approximation Made Simple},\n  journal = {Phys. Rev. Lett.},\n  volume = {77},\n  issue = {18},\n  pages = {3865},\n  year = {1996},\n  month = {Oct},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevLett.77.3865},\n  url = {http://link.aps.org/doi/10.1103/PhysRevLett.77.3865}\n}\n", "Perdew1996_3865"),
            LibxcReference("J. P. Perdew, K. Burke, and M. Ernzerhof,  Phys. Rev. Lett. 78, 1396 (1997)", "10.1103/PhysRevLett.78.1396", "@article{Perdew1997_1396,\n  author = {Perdew, J. P. and Burke, K. and Ernzerhof, M.},\n  title = {Errata: {Generalized} Gradient Approximation Made Simple [{Phys.} {Rev.} {Lett.} 77, 3865 (1996)]},\n  journal = {Phys. Rev. Lett.},\n  volume = {78},\n  issue = {7},\n  pages = {1396},\n  year = {1997},\n  month = {Feb},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevLett.78.1396},\n  url = {http://link.aps.org/doi/10.1103/PhysRevLett.78.1396}\n}\n", "Perdew1997_1396"),
        ]),
    :gga_x_pbe_mol => IdentifierText(
        "Reparametrized PBE by del Campo, Gazquez, Trickey & Vela",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("J. M. del Campo, J. L. Gázquez, S. B. Trickey, and A. Vela,  J. Chem. Phys. 136, 104108 (2012)", "10.1063/1.3691197", "@article{delCampo2012_104108,\n  author = {del Campo, J. M. and G\\'{a}zquez, J. L. and Trickey, S. B. and Vela, A.},\n  title = {Non-empirical improvement of {PBE} and its hybrid {PBE0} for general description of molecular properties},\n  journal = {J. Chem. Phys.},\n  year = {2012},\n  volume = {136},\n  number = {10},\n  pages = {104108},\n  doi = {10.1063/1.3691197},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/136/10/10.1063/1.3691197}\n}\n", "delCampo2012_104108"),
        ]),
    :gga_x_pbe_r => IdentifierText(
        "Revised PBE from Zhang & Yang",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("Y. Zhang and W. Yang,  Phys. Rev. Lett. 80, 890 (1998)", "10.1103/PhysRevLett.80.890", "@article{Zhang1998_890,\n  author = {Zhang, Y. and Yang, W.},\n  title = {Comment on ``{Generalized} Gradient Approximation Made Simple''},\n  journal = {Phys. Rev. Lett.},\n  volume = {80},\n  issue = {4},\n  pages = {890},\n  year = {1998},\n  month = {Jan},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevLett.80.890},\n  url = {http://link.aps.org/doi/10.1103/PhysRevLett.80.890}\n}\n", "Zhang1998_890"),
        ]),
    :gga_x_pbe_sol => IdentifierText(
        "Perdew, Burke & Ernzerhof SOL",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("J. P. Perdew, A. Ruzsinszky, G. I. Csonka, O. A. Vydrov, G. E. Scuseria, L. A. Constantin, X. Zhou, and K. Burke,  Phys. Rev. Lett. 100, 136406 (2008)", "10.1103/PhysRevLett.100.136406", "@article{Perdew2008_136406,\n  author = {Perdew, J. P. and Ruzsinszky, A. and Csonka, G. I. and Vydrov, O. A. and Scuseria, G. E. and Constantin, L. A. and Zhou, X. and Burke, K.},\n  title = {Restoring the Density-Gradient Expansion for Exchange in Solids and Surfaces},\n  journal = {Phys. Rev. Lett.},\n  volume = {100},\n  issue = {13},\n  pages = {136406},\n  year = {2008},\n  month = {Apr},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevLett.100.136406},\n  url = {http://link.aps.org/doi/10.1103/PhysRevLett.100.136406}\n}\n", "Perdew2008_136406"),
        ]),
    :gga_x_pbe_tca => IdentifierText(
        "PBE revised by Tognetti et al",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("V. Tognetti, P. Cortona, and C. Adamo,  Chem. Phys. Lett. 460, 536 (2008)", "10.1016/j.cplett.2008.06.032", "@article{Tognetti2008_536,\n  author = {Tognetti, V. and Cortona, P. and Adamo, C.},\n  title = {Increasing physical constraints and improving performances in a parameter-free {GGA} functional},\n  journal = {Chem. Phys. Lett.},\n  volume = {460},\n  number = {4--6},\n  pages = {536},\n  year = {2008},\n  issn = {0009-2614},\n  doi = {10.1016/j.cplett.2008.06.032},\n  url = {http://www.sciencedirect.com/science/article/pii/S0009261408008464}\n}\n", "Tognetti2008_536"),
        ]),
    :gga_x_pbea => IdentifierText(
        "Madsen 07",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("G. K. H. Madsen,  Phys. Rev. B 75, 195108 (2007)", "10.1103/PhysRevB.75.195108", "@article{Madsen2007_195108,\n  author = {Madsen, G. K. H.},\n  title = {Functional form of the generalized gradient approximation for exchange: The {PBE}\$\\alpha\$ functional},\n  journal = {Phys. Rev. B},\n  volume = {75},\n  issue = {19},\n  pages = {195108},\n  year = {2007},\n  month = {May},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevB.75.195108},\n  url = {http://link.aps.org/doi/10.1103/PhysRevB.75.195108}\n}\n", "Madsen2007_195108"),
        ]),
    :gga_x_pbefe => IdentifierText(
        "PBE for formation energies",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("R. Sarmiento-Pérez, S. Botti, and M. A. L. Marques,  J. Chem. Theory Comput. 11, 3844–3850 (2015)", "10.1021/acs.jctc.5b00529", "@article{Perez2015_3844,\n  author = {Sarmiento-P\\'{e}rez, Rafael and Botti, Silvana and Marques, Miguel A. L.},\n  title = {Optimized Exchange and Correlation Semilocal Functional for the Calculation of Energies of Formation},\n  journal = {J. Chem. Theory Comput.},\n  volume = {11},\n  number = {8},\n  pages = {3844--3850},\n  year = {2015},\n  doi = {10.1021/acs.jctc.5b00529},\n  url = {https://doi.org/10.1021/acs.jctc.5b00529}\n}\n", "Perez2015_3844"),
        ]),
    :gga_x_pbeint => IdentifierText(
        "PBE for hybrid interfaces",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("E. Fabiano, L. A. Constantin, and F. Della Sala,  Phys. Rev. B 82, 113104 (2010)", "10.1103/PhysRevB.82.113104", "@article{Fabiano2010_113104,\n  author = {Fabiano, E. and Constantin, L. A. and Della Sala, F.},\n  title = {Generalized gradient approximation bridging the rapidly and slowly varying density regimes: A {PBE}-like functional for hybrid interfaces},\n  journal = {Phys. Rev. B},\n  volume = {82},\n  issue = {11},\n  pages = {113104},\n  year = {2010},\n  month = {Sep},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevB.82.113104},\n  url = {http://link.aps.org/doi/10.1103/PhysRevB.82.113104}\n}\n", "Fabiano2010_113104"),
        ]),
    :gga_x_pbek1_vdw => IdentifierText(
        "Reparametrized PBE for vdW",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("J. Klimeš, D. R. Bowler, and A. Michaelides,  J. Phys.: Condens. Matter 22, 022201 (2010)", "10.1088/0953-8984/22/2/022201", "@article{Klimes2010_022201,\n  author = {Klime\\v{s}, J. and Bowler, D. R. and Michaelides, A.},\n  title = {Chemical accuracy for the van der {Waals} density functional},\n  journal = {J. Phys.: Condens. Matter},\n  volume = {22},\n  number = {2},\n  pages = {022201},\n  year = {2010},\n  doi = {10.1088/0953-8984/22/2/022201},\n  url = {http://stacks.iop.org/0953-8984/22/i=2/a=022201}\n}\n", "Klimes2010_022201"),
        ]),
    :gga_x_pbepow => IdentifierText(
        "PBE power",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("É. Brémond,  J. Chem. Phys. 145, 244102 (2016)", "10.1063/1.4972815", "@article{Bremond2016_244102,\n  author = {Br\\'{e}mond, \\'{E}ric},\n  title = {A power series revisit of the {PBE} exchange density-functional approximation: The {PBEpow} model},\n  journal = {J. Chem. Phys.},\n  volume = {145},\n  number = {24},\n  pages = {244102},\n  year = {2016},\n  doi = {10.1063/1.4972815},\n  url = {https://doi.org/10.1063/1.4972815}\n}\n", "Bremond2016_244102"),
        ]),
    :gga_x_pbetrans => IdentifierText(
        "Gradient-regulated connection-based correction for the PBE exchange",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("É. Brémond, I. Ciofini, and C. Adamo,  Mol. Phys. 114, 1059–1065 (2016)", "10.1080/00268976.2015.1132788", "@article{Bremond2016_1059,\n  author = {Br\\'{e}mond, \\'{E}ric and Ciofini, Ilaria and Adamo, Carlo},\n  title = {Gradient-regulated connection-based correction for the {PBE} exchange: the {PBEtrans} model},\n  journal = {Mol. Phys.},\n  volume = {114},\n  number = {7-8},\n  pages = {1059--1065},\n  year = {2016},\n  doi = {10.1080/00268976.2015.1132788},\n  url = {https://doi.org/10.1080/00268976.2015.1132788}\n}\n", "Bremond2016_1059"),
        ]),
    :gga_x_pw86 => IdentifierText(
        "Perdew & Wang 86",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("J. P. Perdew and W. Yue,  Phys. Rev. B 33, 8800 (1986)", "10.1103/PhysRevB.33.8800", "@article{Perdew1986_8800,\n  author = {Perdew, J. P. and Yue, W.},\n  title = {Accurate and simple density functional for the electronic exchange energy: Generalized gradient approximation},\n  journal = {Phys. Rev. B},\n  volume = {33},\n  issue = {12},\n  pages = {8800},\n  year = {1986},\n  month = {Jun},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevB.33.8800},\n  url = {http://link.aps.org/doi/10.1103/PhysRevB.33.8800}\n}\n", "Perdew1986_8800"),
        ]),
    :gga_x_pw91 => IdentifierText(
        "Perdew & Wang 91",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("J. P. Perdew. In P. Ziesche and H. Eschrig, editors, Proceedings of the 75. WE-Heraeus-Seminar and 21st Annual International Symposium on Electronic Structure of Solids, 11. Berlin, 1991. Akademie Verlag.", "", "@inproceedings{Perdew1991,\n  author = {Perdew, J. P.},\n  editor = {Ziesche, P. and Eschrig, H.},\n  title = {},\n  booktitle = {Proceedings of the 75. WE-Heraeus-Seminar and 21st Annual International Symposium on Electronic Structure of Solids},\n  pages = {11},\n  year = {1991},\n  address = {Berlin},\n  publisher = {Akademie Verlag}\n}\n", "Perdew1991"),
            LibxcReference("J. P. Perdew, J. A. Chevary, S. H. Vosko, K. A. Jackson, M. R. Pederson, D. J. Singh, and C. Fiolhais,  Phys. Rev. B 46, 6671 (1992)", "10.1103/PhysRevB.46.6671", "@article{Perdew1992_6671,\n  author = {Perdew, J. P. and Chevary, J. A. and Vosko, S. H. and Jackson, K. A. and Pederson, M. R. and Singh, D. J. and Fiolhais, C.},\n  title = {Atoms, molecules, solids, and surfaces: Applications of the generalized gradient approximation for exchange and correlation},\n  journal = {Phys. Rev. B},\n  volume = {46},\n  issue = {11},\n  pages = {6671},\n  year = {1992},\n  month = {Sep},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevB.46.6671},\n  url = {http://link.aps.org/doi/10.1103/PhysRevB.46.6671}\n}\n", "Perdew1992_6671"),
            LibxcReference("J. P. Perdew, J. A. Chevary, S. H. Vosko, K. A. Jackson, M. R. Pederson, D. J. Singh, and C. Fiolhais,  Phys. Rev. B 48, 4978 (1993)", "10.1103/PhysRevB.48.4978.2", "@article{Perdew1993_4978,\n  author = {Perdew, J. P. and Chevary, J. A. and Vosko, S. H. and Jackson, K. A. and Pederson, M. R. and Singh, D. J. and Fiolhais, C.},\n  title = {Erratum: {Atoms}, molecules, solids, and surfaces: Applications of the generalized gradient approximation for exchange and correlation},\n  journal = {Phys. Rev. B},\n  volume = {48},\n  issue = {7},\n  pages = {4978},\n  year = {1993},\n  month = {Aug},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevB.48.4978.2},\n  url = {http://link.aps.org/doi/10.1103/PhysRevB.48.4978.2}\n}\n", "Perdew1993_4978"),
        ]),
    :gga_x_pw91_mod => IdentifierText(
        "PW91, alternate version with more digits",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("J. P. Perdew. In P. Ziesche and H. Eschrig, editors, Proceedings of the 75. WE-Heraeus-Seminar and 21st Annual International Symposium on Electronic Structure of Solids, 11. Berlin, 1991. Akademie Verlag.", "", "@inproceedings{Perdew1991,\n  author = {Perdew, J. P.},\n  editor = {Ziesche, P. and Eschrig, H.},\n  title = {},\n  booktitle = {Proceedings of the 75. WE-Heraeus-Seminar and 21st Annual International Symposium on Electronic Structure of Solids},\n  pages = {11},\n  year = {1991},\n  address = {Berlin},\n  publisher = {Akademie Verlag}\n}\n", "Perdew1991"),
            LibxcReference("J. P. Perdew, J. A. Chevary, S. H. Vosko, K. A. Jackson, M. R. Pederson, D. J. Singh, and C. Fiolhais,  Phys. Rev. B 46, 6671 (1992)", "10.1103/PhysRevB.46.6671", "@article{Perdew1992_6671,\n  author = {Perdew, J. P. and Chevary, J. A. and Vosko, S. H. and Jackson, K. A. and Pederson, M. R. and Singh, D. J. and Fiolhais, C.},\n  title = {Atoms, molecules, solids, and surfaces: Applications of the generalized gradient approximation for exchange and correlation},\n  journal = {Phys. Rev. B},\n  volume = {46},\n  issue = {11},\n  pages = {6671},\n  year = {1992},\n  month = {Sep},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevB.46.6671},\n  url = {http://link.aps.org/doi/10.1103/PhysRevB.46.6671}\n}\n", "Perdew1992_6671"),
            LibxcReference("J. P. Perdew, J. A. Chevary, S. H. Vosko, K. A. Jackson, M. R. Pederson, D. J. Singh, and C. Fiolhais,  Phys. Rev. B 48, 4978 (1993)", "10.1103/PhysRevB.48.4978.2", "@article{Perdew1993_4978,\n  author = {Perdew, J. P. and Chevary, J. A. and Vosko, S. H. and Jackson, K. A. and Pederson, M. R. and Singh, D. J. and Fiolhais, C.},\n  title = {Erratum: {Atoms}, molecules, solids, and surfaces: Applications of the generalized gradient approximation for exchange and correlation},\n  journal = {Phys. Rev. B},\n  volume = {48},\n  issue = {7},\n  pages = {4978},\n  year = {1993},\n  month = {Aug},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevB.48.4978.2},\n  url = {http://link.aps.org/doi/10.1103/PhysRevB.48.4978.2}\n}\n", "Perdew1993_4978"),
        ]),
    :gga_x_q1d => IdentifierText(
        "Functional for quasi-1D systems",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("V. Urso and L. A. Constantin,  Eur. Phys. J. B 94, 147 (2021)", "10.1140/epjb/s10051-021-00159-y", "@article{Urso2021_147,\n  author = {Urso, Vittoria and Constantin, Lucian A.},\n  title = {RETRACTED ARTICLE: Quasi-dimensional models applied to kinetic and exchange energy density functionals},\n  volume = {94},\n  pages = {147},\n  ISSN = {1434-6036},\n  url = {http://dx.doi.org/10.1140/epjb/s10051-021-00159-y},\n  DOI = {10.1140/epjb/s10051-021-00159-y},\n  number = {7},\n  journal = {Eur. Phys. J. B},\n  publisher = {Springer Science and Business Media LLC},\n  year = {2021}\n}\n", "Urso2021_147"),
        ]),
    :gga_x_q2d => IdentifierText(
        "Chiodo et al",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("L. Chiodo, L. A. Constantin, E. Fabiano, and F. Della Sala,  Phys. Rev. Lett. 108, 126402 (2012)", "10.1103/PhysRevLett.108.126402", "@article{Chiodo2012_126402,\n  author = {Chiodo, L. and Constantin, L. A. and Fabiano, E. and Della Sala, F.},\n  title = {Nonuniform Scaling Applied to Surface Energies of Transition Metals},\n  journal = {Phys. Rev. Lett.},\n  volume = {108},\n  issue = {12},\n  pages = {126402},\n  year = {2012},\n  month = {Mar},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevLett.108.126402},\n  url = {http://link.aps.org/doi/10.1103/PhysRevLett.108.126402}\n}\n", "Chiodo2012_126402"),
        ]),
    :gga_x_revssb_d => IdentifierText(
        "Revised Swart, Sola and Bickelhaupt dispersion",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("M. Swart, M. Solá, and F. M. Bickelhaupt,  J. Comput. Chem. 32, 1117–1127 (2011)", "10.1002/jcc.21693", "@article{Swart2011_1117,\n  author = {Swart, Marcel and Sol\\'{a}, Miquel and Bickelhaupt, F. Matthias},\n  title = {Inter- and intramolecular dispersion interactions},\n  journal = {J. Comput. Chem.},\n  volume = {32},\n  number = {6},\n  pages = {1117--1127},\n  doi = {10.1002/jcc.21693},\n  url = {https://onlinelibrary.wiley.com/doi/abs/10.1002/jcc.21693},\n  year = {2011}\n}\n", "Swart2011_1117"),
        ]),
    :gga_x_rge2 => IdentifierText(
        "Regularized PBE",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("A. Ruzsinszky, G. I. Csonka, and G. E. Scuseria,  J. Chem. Theory Comput. 5, 763 (2009)", "10.1021/ct8005369", "@article{Ruzsinszky2009_763,\n  author = {Ruzsinszky, A. and Csonka, G. I. and Scuseria, G. E.},\n  title = {Regularized Gradient Expansion for Atoms, Molecules, and Solids},\n  journal = {J. Chem. Theory Comput.},\n  volume = {5},\n  number = {4},\n  pages = {763},\n  year = {2009},\n  doi = {10.1021/ct8005369},\n  url = {http://pubs.acs.org/doi/abs/10.1021/ct8005369}\n}\n", "Ruzsinszky2009_763"),
        ]),
    :gga_x_rpbe => IdentifierText(
        "Hammer, Hansen, and Norskov",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("B. Hammer, L. B. Hansen, and J. K. Nørskov,  Phys. Rev. B 59, 7413 (1999)", "10.1103/PhysRevB.59.7413", "@article{Hammer1999_7413,\n  author = {Hammer, B. and Hansen, L. B. and N\\o{}rskov, J. K.},\n  title = {Improved adsorption energetics within density-functional theory using revised {Perdew}--{Burke}--{Ernzerhof} functionals},\n  journal = {Phys. Rev. B},\n  volume = {59},\n  issue = {11},\n  pages = {7413},\n  year = {1999},\n  month = {Mar},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevB.59.7413},\n  url = {http://link.aps.org/doi/10.1103/PhysRevB.59.7413}\n}\n", "Hammer1999_7413"),
        ]),
    :gga_x_rpw86 => IdentifierText(
        "Refitted Perdew & Wang 86",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("É. D. Murray, K. Lee, and D. C. Langreth,  J. Chem. Theory Comput. 5, 2754 (2009)", "10.1021/ct900365q", "@article{Murray2009_2754,\n  author = {Murray, \\'{E}. D. and Lee, K. and Langreth, D. C.},\n  title = {Investigation of Exchange Energy Density Functional Accuracy for Interacting Molecules},\n  journal = {J. Chem. Theory Comput.},\n  volume = {5},\n  number = {10},\n  pages = {2754},\n  year = {2009},\n  doi = {10.1021/ct900365q},\n  url = {http://pubs.acs.org/doi/abs/10.1021/ct900365q}\n}\n", "Murray2009_2754"),
        ]),
    :gga_x_s12g => IdentifierText(
        "Swart 2012 GGA exchange",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("M. Swart,  Chem. Phys. Lett. 580, 166–171 (2013)", "10.1016/j.cplett.2013.06.045", "@article{Swart2013_166,\n  author = {Swart, Marcel},\n  title = {A new family of hybrid density functionals},\n  journal = {Chem. Phys. Lett.},\n  volume = {580},\n  pages = {166--171},\n  year = {2013},\n  issn = {0009-2614},\n  doi = {10.1016/j.cplett.2013.06.045},\n  url = {http://www.sciencedirect.com/science/article/pii/S0009261413008221}\n}\n", "Swart2013_166"),
        ]),
    :gga_x_sfat => IdentifierText(
        "Short-range recipe for B88 functional - Yukawa",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("A. Savin and H.-J. Flad,  Int. J. Quantum Chem. 56, 327 (1995)", "10.1002/qua.560560417", "@article{Savin1995_327,\n  author = {Savin, A. and Flad, H.-J.},\n  title = {Density functionals for the {Yukawa} electron-electron interaction},\n  journal = {Int. J. Quantum Chem.},\n  volume = {56},\n  number = {4},\n  pages = {327},\n  year = {1995},\n  publisher = {John Wiley \\& Sons, Inc.},\n  issn = {1097-461X},\n  doi = {10.1002/qua.560560417},\n  url = {http://onlinelibrary.wiley.com/doi/10.1002/qua.560560417/abstract}\n}\n", "Savin1995_327"),
            LibxcReference("Y. Akinaga and S. Ten-no,  Chem. Phys. Lett. 462, 348 (2008)", "10.1016/j.cplett.2008.07.103", "@article{Akinaga2008_348,\n  author = {Akinaga, Y. and Ten-no, S.},\n  title = {Range-separation by the {Yukawa} potential in long-range corrected density functional theory with {Gaussian}-type basis functions},\n  journal = {Chem. Phys. Lett.},\n  volume = {462},\n  number = {4--6},\n  pages = {348},\n  year = {2008},\n  issn = {0009-2614},\n  doi = {10.1016/j.cplett.2008.07.103},\n  url = {http://www.sciencedirect.com/science/article/pii/S0009261408010609}\n}\n", "Akinaga2008_348"),
        ]),
    :gga_x_sfat_pbe => IdentifierText(
        "Short-range recipe for PBE functional - Yukawa",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("A. Savin and H.-J. Flad,  Int. J. Quantum Chem. 56, 327 (1995)", "10.1002/qua.560560417", "@article{Savin1995_327,\n  author = {Savin, A. and Flad, H.-J.},\n  title = {Density functionals for the {Yukawa} electron-electron interaction},\n  journal = {Int. J. Quantum Chem.},\n  volume = {56},\n  number = {4},\n  pages = {327},\n  year = {1995},\n  publisher = {John Wiley \\& Sons, Inc.},\n  issn = {1097-461X},\n  doi = {10.1002/qua.560560417},\n  url = {http://onlinelibrary.wiley.com/doi/10.1002/qua.560560417/abstract}\n}\n", "Savin1995_327"),
            LibxcReference("Y. Akinaga and S. Ten-no,  Chem. Phys. Lett. 462, 348 (2008)", "10.1016/j.cplett.2008.07.103", "@article{Akinaga2008_348,\n  author = {Akinaga, Y. and Ten-no, S.},\n  title = {Range-separation by the {Yukawa} potential in long-range corrected density functional theory with {Gaussian}-type basis functions},\n  journal = {Chem. Phys. Lett.},\n  volume = {462},\n  number = {4--6},\n  pages = {348},\n  year = {2008},\n  issn = {0009-2614},\n  doi = {10.1016/j.cplett.2008.07.103},\n  url = {http://www.sciencedirect.com/science/article/pii/S0009261408010609}\n}\n", "Akinaga2008_348"),
        ]),
    :gga_x_sg4 => IdentifierText(
        "Semiclassical GGA at fourth order",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("L. A. Constantin, A. Terentjevs, F. Della Sala, P. Cortona, and E. Fabiano,  Phys. Rev. B 93, 045126 (2016)", "10.1103/PhysRevB.93.045126", "@article{Constantin2016_045126,\n  author = {Constantin, Lucian A. and Terentjevs, Aleksandrs and Della Sala, Fabio and Cortona, Pietro and Fabiano, Eduardo},\n  title = {Semiclassical atom theory applied to solid-state physics},\n  journal = {Phys. Rev. B},\n  volume = {93},\n  issue = {4},\n  pages = {045126},\n  year = {2016},\n  month = {Jan},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevB.93.045126},\n  url = {http://link.aps.org/doi/10.1103/PhysRevB.93.045126}\n}\n", "Constantin2016_045126"),
        ]),
    :gga_x_sogga => IdentifierText(
        "Second-order generalized gradient approximation",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("Y. Zhao and D. G. Truhlar,  J. Chem. Phys. 128, 184109 (2008)", "10.1063/1.2912068", "@article{Zhao2008_184109,\n  author = {Zhao, Y. and Truhlar, D. G.},\n  title = {Construction of a generalized gradient approximation by restoring the density-gradient expansion and enforcing a tight {Lieb}--{Oxford} bound},\n  journal = {J. Chem. Phys.},\n  year = {2008},\n  volume = {128},\n  number = {18},\n  pages = {184109},\n  doi = {10.1063/1.2912068},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/128/18/10.1063/1.2912068}\n}\n", "Zhao2008_184109"),
        ]),
    :gga_x_sogga11 => IdentifierText(
        "Second-order generalized gradient approximation 2011",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("R. Peverati, Y. Zhao, and D. G. Truhlar,  J. Phys. Chem. Lett. 2, 1991 (2011)", "10.1021/jz200616w", "@article{Peverati2011_1991,\n  author = {Peverati, R. and Zhao, Y. and Truhlar, D. G.},\n  title = {Generalized Gradient Approximation That Recovers the Second-Order Density-Gradient Expansion with Optimized Across-the-Board Performance},\n  journal = {J. Phys. Chem. Lett.},\n  volume = {2},\n  number = {16},\n  pages = {1991},\n  year = {2011},\n  doi = {10.1021/jz200616w},\n  url = {http://pubs.acs.org/doi/abs/10.1021/jz200616w}\n}\n", "Peverati2011_1991"),
        ]),
    :gga_x_ssb => IdentifierText(
        "Swart, Sola and Bickelhaupt",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("M. Swart, M. Solá, and F. M. Bickelhaupt,  J. Chem. Phys. 131, 094103 (2009)", "10.1063/1.3213193", "@article{Swart2009_094103,\n  author = {Swart, M. and Sol\\'{a}, M. and Bickelhaupt, F. M.},\n  title = {A new all-round density functional based on spin states and \${\\rm S}\\_{\\rm N} 2\$ barriers},\n  journal = {J. Chem. Phys.},\n  year = {2009},\n  volume = {131},\n  number = {9},\n  pages = {094103},\n  doi = {10.1063/1.3213193},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/131/9/10.1063/1.3213193}\n}\n", "Swart2009_094103"),
        ]),
    :gga_x_ssb_d => IdentifierText(
        "Swart, Sola and Bickelhaupt dispersion",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("M. Swart, M. Solá, and F. M. Bickelhaupt,  J. Chem. Phys. 131, 094103 (2009)", "10.1063/1.3213193", "@article{Swart2009_094103,\n  author = {Swart, M. and Sol\\'{a}, M. and Bickelhaupt, F. M.},\n  title = {A new all-round density functional based on spin states and \${\\rm S}\\_{\\rm N} 2\$ barriers},\n  journal = {J. Chem. Phys.},\n  year = {2009},\n  volume = {131},\n  number = {9},\n  pages = {094103},\n  doi = {10.1063/1.3213193},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/131/9/10.1063/1.3213193}\n}\n", "Swart2009_094103"),
        ]),
    :gga_x_ssb_sw => IdentifierText(
        "Swart, Sola and Bickelhaupt correction to PBE",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("M. Swart, M. Solá, and F. M. Bickelhaupt,  J. Comput. Methods Sci. Eng. 9, 69 (2009)", "10.3233/JCM-2009-0230", "@article{Swart2009_69,\n  author = {Swart, M. and Sol\\'{a}, M. and Bickelhaupt, F. M.},\n  title = {Switching between {OPTX} and {PBE} exchange functionals},\n  journal = {J. Comput. Methods Sci. Eng.},\n  volume = {9},\n  issue = {1},\n  pages = {69},\n  year = {2009},\n  doi = {10.3233/JCM-2009-0230},\n  url = {http://iospress.metapress.com/content/0736k00r11272hm7}\n}\n", "Swart2009_69"),
        ]),
    :gga_x_t_pbe1 => IdentifierText(
        "PBE reparametrization (version 1) for band gaps",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("P. Borlido, J. Schmidt, A. W. Huran, F. Tran, M. A. L. Marques, and S. Botti,  npj Comput. Mater. 6, 96 (2020)", "10.1038/s41524-020-00360-0", "@article{Borlido2020_96,\n  author = {Borlido, Pedro and Schmidt, Jonathan and Huran, Ahmad W. and Tran, Fabien and Marques, Miguel A. L. and Botti, Silvana},\n  journal = {npj Comput. Mater.},\n  title = {{Exchange-correlation functionals for band gaps of solids: benchmark, reparametrization and machine learning}},\n  year = {2020},\n  issn = {2057-3960},\n  pages = {96},\n  volume = {6},\n  doi = {10.1038/s41524-020-00360-0},\n  url = {https://doi.org/10.1038/s41524-020-00360-0},\n  publisher = {Springer US}\n}\n", "Borlido2020_96"),
        ]),
    :gga_x_t_pbe2 => IdentifierText(
        "PBE reparametrization (version 2) for band gaps",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("P. Borlido, J. Schmidt, A. W. Huran, F. Tran, M. A. L. Marques, and S. Botti,  npj Comput. Mater. 6, 96 (2020)", "10.1038/s41524-020-00360-0", "@article{Borlido2020_96,\n  author = {Borlido, Pedro and Schmidt, Jonathan and Huran, Ahmad W. and Tran, Fabien and Marques, Miguel A. L. and Botti, Silvana},\n  journal = {npj Comput. Mater.},\n  title = {{Exchange-correlation functionals for band gaps of solids: benchmark, reparametrization and machine learning}},\n  year = {2020},\n  issn = {2057-3960},\n  pages = {96},\n  volume = {6},\n  doi = {10.1038/s41524-020-00360-0},\n  url = {https://doi.org/10.1038/s41524-020-00360-0},\n  publisher = {Springer US}\n}\n", "Borlido2020_96"),
        ]),
    :gga_x_vmt84_ge => IdentifierText(
        "VMT{8,4} with constraint satisfaction with mu = mu_GE",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("A. Vela, J. C. Pacheco-Kato, J. L. Gázquez, J. M. del Campo, and S. B. Trickey,  J. Chem. Phys. 136, 144115 (2012)", "10.1063/1.3701132", "@article{Vela2012_144115,\n  author = {Vela, A. and Pacheco-Kato, J. C. and G\\'{a}zquez, J. L. and del Campo, J. M. and Trickey, S. B.},\n  title = {Improved constraint satisfaction in a simple generalized gradient approximation exchange functional},\n  journal = {J. Chem. Phys.},\n  year = {2012},\n  volume = {136},\n  number = {14},\n  pages = {144115},\n  doi = {10.1063/1.3701132},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/136/14/10.1063/1.3701132}\n}\n", "Vela2012_144115"),
        ]),
    :gga_x_vmt84_pbe => IdentifierText(
        "VMT{8,4} with constraint satisfaction with mu = mu_PBE",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("A. Vela, J. C. Pacheco-Kato, J. L. Gázquez, J. M. del Campo, and S. B. Trickey,  J. Chem. Phys. 136, 144115 (2012)", "10.1063/1.3701132", "@article{Vela2012_144115,\n  author = {Vela, A. and Pacheco-Kato, J. C. and G\\'{a}zquez, J. L. and del Campo, J. M. and Trickey, S. B.},\n  title = {Improved constraint satisfaction in a simple generalized gradient approximation exchange functional},\n  journal = {J. Chem. Phys.},\n  year = {2012},\n  volume = {136},\n  number = {14},\n  pages = {144115},\n  doi = {10.1063/1.3701132},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/136/14/10.1063/1.3701132}\n}\n", "Vela2012_144115"),
        ]),
    :gga_x_vmt_ge => IdentifierText(
        "Vela, Medel, and Trickey with mu = mu_GE",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("A. Vela, V. Medel, and S. B. Trickey,  J. Chem. Phys. 130, 244103 (2009)", "10.1063/1.3152713", "@article{Vela2009_244103,\n  author = {Vela, A. and Medel, V. and Trickey, S. B.},\n  title = {Variable {Lieb}--{Oxford} bound satisfaction in a generalized gradient exchange-correlation functional},\n  journal = {J. Chem. Phys.},\n  year = {2009},\n  volume = {130},\n  number = {24},\n  pages = {244103},\n  doi = {10.1063/1.3152713},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/130/24/10.1063/1.3152713}\n}\n", "Vela2009_244103"),
        ]),
    :gga_x_vmt_pbe => IdentifierText(
        "Vela, Medel, and Trickey with mu = mu_PBE",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("A. Vela, V. Medel, and S. B. Trickey,  J. Chem. Phys. 130, 244103 (2009)", "10.1063/1.3152713", "@article{Vela2009_244103,\n  author = {Vela, A. and Medel, V. and Trickey, S. B.},\n  title = {Variable {Lieb}--{Oxford} bound satisfaction in a generalized gradient exchange-correlation functional},\n  journal = {J. Chem. Phys.},\n  year = {2009},\n  volume = {130},\n  number = {24},\n  pages = {244103},\n  doi = {10.1063/1.3152713},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/130/24/10.1063/1.3152713}\n}\n", "Vela2009_244103"),
        ]),
    :gga_x_wc => IdentifierText(
        "Wu & Cohen",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("Z. Wu and R. E. Cohen,  Phys. Rev. B 73, 235116 (2006)", "10.1103/PhysRevB.73.235116", "@article{Wu2006_235116,\n  author = {Wu, Z. and Cohen, R. E.},\n  title = {More accurate generalized gradient approximation for solids},\n  journal = {Phys. Rev. B},\n  volume = {73},\n  issue = {23},\n  pages = {235116},\n  year = {2006},\n  month = {Jun},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevB.73.235116},\n  url = {http://link.aps.org/doi/10.1103/PhysRevB.73.235116}\n}\n", "Wu2006_235116"),
        ]),
    :gga_x_wpbeh => IdentifierText(
        "short-range part of the PBE (default w=0 gives PBEh)",
        (:have_exc, :have_vxc, :have_fxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2),
        LibxcReference[
            LibxcReference("J. Heyd, G. E. Scuseria, and M. Ernzerhof,  J. Chem. Phys. 118, 8207 (2003)", "10.1063/1.1564060", "@article{Heyd2003_8207,\n  author = {Heyd, J. and Scuseria, G. E. and Ernzerhof, M.},\n  title = {Hybrid functionals based on a screened {Coulomb} potential},\n  journal = {J. Chem. Phys.},\n  year = {2003},\n  volume = {118},\n  number = {18},\n  pages = {8207},\n  doi = {10.1063/1.1564060},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/118/18/10.1063/1.1564060}\n}\n", "Heyd2003_8207"),
            LibxcReference("J. Heyd, G. E. Scuseria, and M. Ernzerhof,  J. Chem. Phys. 124, 219906 (2006)", "10.1063/1.2204597", "@article{Heyd2006_219906,\n  author = {Heyd, J. and Scuseria, G. E. and Ernzerhof, M.},\n  title = {Erratum: \"{Hybrid} functionals based on a screened {Coulomb} potential\" [{J.} {Chem.} {Phys.} 118, 8207 (2003)]},\n  journal = {J. Chem. Phys.},\n  year = {2006},\n  volume = {124},\n  number = {21},\n  pages = {219906},\n  doi = {10.1063/1.2204597},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/124/21/10.1063/1.2204597}\n}\n", "Heyd2006_219906"),
            LibxcReference("M. Ernzerhof and J. P. Perdew,  J. Chem. Phys. 109, 3313 (1998)", "10.1063/1.476928", "@article{Ernzerhof1998_3313,\n  author = {Ernzerhof, M. and Perdew, J. P.},\n  title = {Generalized gradient approximation to the angle- and system-averaged exchange hole},\n  journal = {J. Chem. Phys.},\n  year = {1998},\n  volume = {109},\n  number = {9},\n  pages = {3313},\n  doi = {10.1063/1.476928},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/109/9/10.1063/1.476928}\n}\n", "Ernzerhof1998_3313"),
            LibxcReference("J. Heyd and G. E. Scuseria,  J. Chem. Phys. 120, 7274 (2004)", "10.1063/1.1668634", "@article{Heyd2004_7274,\n  author = {Heyd, J. and Scuseria, G. E.},\n  title = {Assessment and validation of a screened {Coulomb} hybrid density functional},\n  journal = {J. Chem. Phys.},\n  year = {2004},\n  volume = {120},\n  number = {16},\n  pages = {7274},\n  doi = {10.1063/1.1668634},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/120/16/10.1063/1.1668634}\n}\n", "Heyd2004_7274"),
            LibxcReference("T. M. Henderson, A. F. Izmaylov, G. Scalmani, and G. E. Scuseria,  J. Chem. Phys. 131, 044108 (2009)", "10.1063/1.3185673", "@article{Henderson2009_044108,\n  author = {Henderson, T. M. and Izmaylov, A. F. and Scalmani, G. and Scuseria, G. E.},\n  title = {Can short-range hybrids describe long-range-dependent properties?},\n  journal = {J. Chem. Phys.},\n  year = {2009},\n  volume = {131},\n  number = {4},\n  pages = {044108},\n  doi = {10.1063/1.3185673},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/131/4/10.1063/1.3185673}\n}\n", "Henderson2009_044108"),
        ]),
    :gga_x_xpbe => IdentifierText(
        "Extended PBE by Xu & Goddard III",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("X. Xu and W. A. Goddard,  J. Chem. Phys. 121, 4068 (2004)", "10.1063/1.1771632", "@article{Xu2004_4068,\n  author = {Xu, X. and Goddard, W. A.},\n  title = {The extended {Perdew}--{Burke}--{Ernzerhof} functional with improved accuracy for thermodynamic and electronic properties of molecular systems},\n  journal = {J. Chem. Phys.},\n  year = {2004},\n  volume = {121},\n  number = {9},\n  pages = {4068},\n  doi = {10.1063/1.1771632},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/121/9/10.1063/1.1771632}\n}\n", "Xu2004_4068"),
        ]),
    :gga_xc_b97_3c => IdentifierText(
        "Becke 97-3c by Grimme et. al.",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("J. G. Brandenburg, C. Bannwarth, A. Hansen, and S. Grimme,  J. Chem. Phys. 148, 064104 (2018)", "10.1063/1.5012601", "@article{Brandenburg2018_064104,\n  author = {Brandenburg, J. G. and Bannwarth, C. and Hansen, A. and Grimme, S.},\n  title = {{B97-3c}: A revised low-cost variant of the {B97-D} density functional method},\n  journal = {J. Chem. Phys.},\n  volume = {148},\n  number = {6},\n  pages = {064104},\n  year = {2018},\n  doi = {10.1063/1.5012601},\n  url = {https://doi.org/10.1063/1.5012601}\n}\n", "Brandenburg2018_064104"),
        ]),
    :gga_xc_b97_d => IdentifierText(
        "Becke 97-D",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("S. Grimme,  J. Comput. Chem. 27, 1787 (2006)", "10.1002/jcc.20495", "@article{Grimme2006_1787,\n  author = {Grimme, S.},\n  title = {Semiempirical {GGA}-type density functional constructed with a long-range dispersion correction},\n  journal = {J. Comput. Chem.},\n  volume = {27},\n  number = {15},\n  pages = {1787},\n  year = {2006},\n  publisher = {Wiley Subscription Services, Inc., A Wiley Company},\n  issn = {1096-987X},\n  doi = {10.1002/jcc.20495},\n  url = {http://onlinelibrary.wiley.com/doi/10.1002/jcc.20495/abstract}\n}\n", "Grimme2006_1787"),
        ]),
    :gga_xc_b97_gga1 => IdentifierText(
        "Becke 97 GGA-1",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("A. J. Cohen and N. C. Handy,  Chem. Phys. Lett. 316, 160 (2000)", "10.1016/S0009-2614(99)01273-7", "@article{Cohen2000_160,\n  author = {Cohen, A. J. and Handy, N. C.},\n  title = {Assessment of exchange correlation functionals},\n  journal = {Chem. Phys. Lett.},\n  volume = {316},\n  number = {1--2},\n  pages = {160},\n  year = {2000},\n  issn = {0009-2614},\n  doi = {10.1016/S0009-2614(99)01273-7},\n  url = {http://www.sciencedirect.com/science/article/pii/S0009261499012737}\n}\n", "Cohen2000_160"),
        ]),
    :gga_xc_beefvdw => IdentifierText(
        "BEEF-vdW exchange-correlation",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("J. Wellendorff, K. T. Lundgaard, A. Møgelhøj, V. Petzold, D. D. Landis, J. K. Nørskov, T. Bligaard, and K. W. Jacobsen,  Phys. Rev. B 85, 235149 (2012)", "10.1103/PhysRevB.85.235149", "@article{Wellendorff2012_235149,\n  author = {Wellendorff, Jess and Lundgaard, Keld T. and M\\o{}gelh\\o{}j, Andreas and Petzold, Vivien and Landis, David D. and N\\o{}rskov, Jens K. and Bligaard, Thomas and Jacobsen, Karsten W.},\n  title = {Density functionals for surface science: Exchange-correlation model development with {Bayesian} error estimation},\n  journal = {Phys. Rev. B},\n  volume = {85},\n  issue = {23},\n  pages = {235149},\n  year = {2012},\n  month = {Jun},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevB.85.235149},\n  url = {http://link.aps.org/doi/10.1103/PhysRevB.85.235149}\n}\n", "Wellendorff2012_235149"),
        ]),
    :gga_xc_dlb97 => IdentifierText(
        "dispersionless-optimized B97",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("A. U. Rehman and K. Szalewicz,  J. Chem. Theory Comput. 21, 1098–1118 (2025)", "10.1021/acs.jctc.4c00941", "@article{Rehman2025_1098,\n  author = {Rehman, Atta Ur and Szalewicz, Krzysztof},\n  title = {Dispersionless Nonhybrid Density Functional},\n  journal = {J. Chem. Theory Comput.},\n  volume = {21},\n  number = {3},\n  pages = {1098--1118},\n  year = {2025},\n  doi = {10.1021/acs.jctc.4c00941},\n  URL = {https://doi.org/10.1021/acs.jctc.4c00941}\n}\n", "Rehman2025_1098"),
        ]),
    :gga_xc_edf1 => IdentifierText(
        "EDF1",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("R. D. Adamson, P. M. W. Gill, and J. A. Pople,  Chem. Phys. Lett. 284, 6 (1998)", "10.1016/S0009-2614(97)01282-7", "@article{Adamson1998_6,\n  author = {Adamson, R. D. and Gill, P. M. W. and Pople, J. A.},\n  title = {Empirical density functionals},\n  journal = {Chem. Phys. Lett.},\n  volume = {284},\n  number = {1--2},\n  pages = {6},\n  year = {1998},\n  issn = {0009-2614},\n  doi = {10.1016/S0009-2614(97)01282-7},\n  url = {http://www.sciencedirect.com/science/article/pii/S0009261497012827}\n}\n", "Adamson1998_6"),
        ]),
    :gga_xc_hcth_93 => IdentifierText(
        "HCTH/93",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("F. A. Hamprecht, A. J. Cohen, D. J. Tozer, and N. C. Handy,  J. Chem. Phys. 109, 6264 (1998)", "10.1063/1.477267", "@article{Hamprecht1998_6264,\n  author = {Hamprecht, F. A. and Cohen, A. J. and Tozer, D. J. and Handy, N. C.},\n  title = {Development and assessment of new exchange-correlation functionals},\n  journal = {J. Chem. Phys.},\n  year = {1998},\n  volume = {109},\n  number = {15},\n  pages = {6264},\n  doi = {10.1063/1.477267},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/109/15/10.1063/1.477267}\n}\n", "Hamprecht1998_6264"),
        ]),
    :gga_xc_hcth_120 => IdentifierText(
        "HCTH/120",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("A. D. Boese, N. L. Doltsinis, N. C. Handy, and M. Sprik,  J. Chem. Phys. 112, 1670 (2000)", "10.1063/1.480732", "@article{Boese2000_1670,\n  author = {Boese, A. D. and Doltsinis, N. L. and Handy, N. C. and Sprik, M.},\n  title = {New generalized gradient approximation functionals},\n  journal = {J. Chem. Phys.},\n  year = {2000},\n  volume = {112},\n  number = {4},\n  pages = {1670},\n  doi = {10.1063/1.480732},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/112/4/10.1063/1.480732}\n}\n", "Boese2000_1670"),
        ]),
    :gga_xc_hcth_147 => IdentifierText(
        "HCTH/147",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("A. D. Boese, N. L. Doltsinis, N. C. Handy, and M. Sprik,  J. Chem. Phys. 112, 1670 (2000)", "10.1063/1.480732", "@article{Boese2000_1670,\n  author = {Boese, A. D. and Doltsinis, N. L. and Handy, N. C. and Sprik, M.},\n  title = {New generalized gradient approximation functionals},\n  journal = {J. Chem. Phys.},\n  year = {2000},\n  volume = {112},\n  number = {4},\n  pages = {1670},\n  doi = {10.1063/1.480732},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/112/4/10.1063/1.480732}\n}\n", "Boese2000_1670"),
        ]),
    :gga_xc_hcth_407 => IdentifierText(
        "HCTH/407",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("A. D. Boese and N. C. Handy,  J. Chem. Phys. 114, 5497 (2001)", "10.1063/1.1347371", "@article{Boese2001_5497,\n  author = {Boese, A. D. and Handy, N. C.},\n  title = {A new parametrization of exchange-correlation generalized gradient approximation functionals},\n  journal = {J. Chem. Phys.},\n  year = {2001},\n  volume = {114},\n  number = {13},\n  pages = {5497},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/114/13/10.1063/1.1347371},\n  doi = {10.1063/1.1347371}\n}\n", "Boese2001_5497"),
        ]),
    :gga_xc_hcth_407p => IdentifierText(
        "HCTH/407+",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("A. D. Boese, A. Chandra, J. M. L. Martin, and D. Marx,  J. Chem. Phys. 119, 5965 (2003)", "10.1063/1.1599338", "@article{Boese2003_5965,\n  author = {Boese, A. D. and Chandra, A. and Martin, J. M. L. and Marx, D.},\n  title = {From ab initio quantum chemistry to molecular dynamics: The delicate case of hydrogen bonding in ammonia},\n  journal = {J. Chem. Phys.},\n  year = {2003},\n  volume = {119},\n  number = {12},\n  pages = {5965},\n  doi = {10.1063/1.1599338},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/119/12/10.1063/1.1599338}\n}\n", "Boese2003_5965"),
        ]),
    :gga_xc_hcth_p14 => IdentifierText(
        "HCTH p=1/4",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("G. Menconi, P. J. Wilson, and D. J. Tozer,  J. Chem. Phys. 114, 3958 (2001)", "10.1063/1.1342776", "@article{Menconi2001_3958,\n  author = {Menconi, G. and Wilson, P. J. and Tozer, D. J.},\n  title = {Emphasizing the exchange-correlation potential in functional development},\n  journal = {J. Chem. Phys.},\n  year = {2001},\n  volume = {114},\n  number = {9},\n  pages = {3958},\n  doi = {10.1063/1.1342776},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/114/9/10.1063/1.1342776}\n}\n", "Menconi2001_3958"),
        ]),
    :gga_xc_hcth_p76 => IdentifierText(
        "HCTH p=7/6",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("G. Menconi, P. J. Wilson, and D. J. Tozer,  J. Chem. Phys. 114, 3958 (2001)", "10.1063/1.1342776", "@article{Menconi2001_3958,\n  author = {Menconi, G. and Wilson, P. J. and Tozer, D. J.},\n  title = {Emphasizing the exchange-correlation potential in functional development},\n  journal = {J. Chem. Phys.},\n  year = {2001},\n  volume = {114},\n  number = {9},\n  pages = {3958},\n  doi = {10.1063/1.1342776},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/114/9/10.1063/1.1342776}\n}\n", "Menconi2001_3958"),
        ]),
    :gga_xc_hle16 => IdentifierText(
        "high local exchange 2016",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("P. Verma and D. G. Truhlar,  J. Phys. Chem. Lett. 8, 380–387 (2017)", "10.1021/acs.jpclett.6b02757", "@article{Verma2017_380,\n  author = {Verma, Pragya and Truhlar, Donald G.},\n  title = {{HLE16}: A Local {Kohn}--{Sham} Gradient Approximation with Good Performance for Semiconductor Band Gaps and Molecular Excitation Energies},\n  journal = {J. Phys. Chem. Lett.},\n  volume = {8},\n  number = {2},\n  pages = {380--387},\n  year = {2017},\n  doi = {10.1021/acs.jpclett.6b02757},\n  url = {https://doi.org/10.1021/acs.jpclett.6b02757}\n}\n", "Verma2017_380"),
        ]),
    :gga_xc_kt1 => IdentifierText(
        "Keal and Tozer, version 1",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("T. W. Keal and D. J. Tozer,  J. Chem. Phys. 119, 3015 (2003)", "10.1063/1.1590634", "@article{Keal2003_3015,\n  author = {Keal, T. W. and Tozer, D. J.},\n  title = {The exchange-correlation potential in {Kohn}--{Sham} nuclear magnetic resonance shielding calculations},\n  journal = {J. Chem. Phys.},\n  year = {2003},\n  volume = {119},\n  number = {6},\n  pages = {3015},\n  doi = {10.1063/1.1590634},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/119/6/10.1063/1.1590634}\n}\n", "Keal2003_3015"),
        ]),
    :gga_xc_kt2 => IdentifierText(
        "Keal and Tozer, version 2",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("T. W. Keal and D. J. Tozer,  J. Chem. Phys. 119, 3015 (2003)", "10.1063/1.1590634", "@article{Keal2003_3015,\n  author = {Keal, T. W. and Tozer, D. J.},\n  title = {The exchange-correlation potential in {Kohn}--{Sham} nuclear magnetic resonance shielding calculations},\n  journal = {J. Chem. Phys.},\n  year = {2003},\n  volume = {119},\n  number = {6},\n  pages = {3015},\n  doi = {10.1063/1.1590634},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/119/6/10.1063/1.1590634}\n}\n", "Keal2003_3015"),
        ]),
    :gga_xc_kt3 => IdentifierText(
        "Keal and Tozer, version 3",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("T. W. Keal and D. J. Tozer,  J. Chem. Phys. 121, 5654–5660 (2004)", "10.1063/1.1784777", "@article{Keal2004_5654,\n  author = {Keal, Thomas W. and Tozer, David J.},\n  title = {A semiempirical generalized gradient approximation exchange-correlation functional},\n  journal = {J. Chem. Phys.},\n  volume = {121},\n  number = {12},\n  pages = {5654--5660},\n  year = {2004},\n  doi = {10.1063/1.1784777},\n  url = {https://doi.org/10.1063/1.1784777}\n}\n", "Keal2004_5654"),
        ]),
    :gga_xc_mohlyp => IdentifierText(
        "Functional for organometallic chemistry",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("N. E. Schultz, Y. Zhao, and D. G. Truhlar,  J. Phys. Chem. A 109, 11127 (2005)", "10.1021/jp0539223", "@article{Schultz2005_11127,\n  author = {Schultz, N. E. and Zhao, Y. and Truhlar, D. G.},\n  title = {Density Functionals for Inorganometallic and Organometallic Chemistry},\n  journal = {J. Phys. Chem. A},\n  volume = {109},\n  number = {49},\n  pages = {11127},\n  year = {2005},\n  doi = {10.1021/jp0539223},\n  url = {http://pubs.acs.org/doi/abs/10.1021/jp0539223}\n}\n", "Schultz2005_11127"),
        ]),
    :gga_xc_mohlyp2 => IdentifierText(
        "Functional for barrier heights",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("J. Zheng, Y. Zhao, and D. G. Truhlar,  J. Chem. Theory Comput. 5, 808 (2009)", "10.1021/ct800568m", "@article{Zheng2009_808,\n  author = {Zheng, J. and Zhao, Y. and Truhlar, D. G.},\n  title = {The {DBH24}/08 Database and Its Use to Assess Electronic Structure Model Chemistries for Chemical Reaction Barrier Heights},\n  journal = {J. Chem. Theory Comput.},\n  volume = {5},\n  number = {4},\n  pages = {808},\n  year = {2009},\n  doi = {10.1021/ct800568m},\n  url = {http://pubs.acs.org/doi/abs/10.1021/ct800568m}\n}\n", "Zheng2009_808"),
        ]),
    :gga_xc_mpwlyp1w => IdentifierText(
        "mPWLYP1w",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("E. E. Dahlke and D. G. Truhlar,  J. Phys. Chem. B 109, 15677 (2005)", "10.1021/jp052436c", "@article{Dahlke2005_15677,\n  author = {Dahlke, E. E. and Truhlar, D. G.},\n  title = {Improved Density Functionals for Water},\n  journal = {J. Phys. Chem. B},\n  volume = {109},\n  number = {33},\n  pages = {15677},\n  year = {2005},\n  doi = {10.1021/jp052436c},\n  url = {http://pubs.acs.org/doi/abs/10.1021/jp052436c}\n}\n", "Dahlke2005_15677"),
        ]),
    :gga_xc_ncap => IdentifierText(
        "NCAP exchange + P86 correlation",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("J. Carmona-Espíndola, J. L. Gázquez, A. Vela, and S. B. Trickey,  J. Chem. Theory Comput. 15, 303–310 (2019)", "10.1021/acs.jctc.8b00998", "@article{Carmona2019_303,\n  author = {Carmona-Esp\\'{i}ndola, Javier and G\\'{a}zquez, Jos\\'{e} L. and Vela, Alberto and Trickey, S. B.},\n  title = {Generalized Gradient Approximation Exchange Energy Functional with Near-Best Semilocal Performance},\n  journal = {J. Chem. Theory Comput.},\n  volume = {15},\n  number = {1},\n  pages = {303--310},\n  year = {2019},\n  doi = {10.1021/acs.jctc.8b00998},\n  url = {https://doi.org/10.1021/acs.jctc.8b00998}\n}\n", "Carmona2019_303"),
        ]),
    :gga_xc_oblyp_d => IdentifierText(
        "oBLYP-D functional of Goerigk and Grimme",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("L. Goerigk and S. Grimme,  J. Chem. Theory Comput. 6, 107 (2010)", "10.1021/ct900489g", "@article{Goerigk2010_107,\n  author = {Goerigk, L. and Grimme, S.},\n  title = {A General Database for Main Group Thermochemistry, Kinetics, and Noncovalent Interactions -- Assessment of Common and Reparameterized (meta-){GGA} Density Functionals},\n  journal = {J. Chem. Theory Comput.},\n  volume = {6},\n  number = {1},\n  pages = {107},\n  year = {2010},\n  doi = {10.1021/ct900489g},\n  url = {http://pubs.acs.org/doi/abs/10.1021/ct900489g}\n}\n", "Goerigk2010_107"),
        ]),
    :gga_xc_opbe_d => IdentifierText(
        "oPBE-D functional of Goerigk and Grimme",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("L. Goerigk and S. Grimme,  J. Chem. Theory Comput. 6, 107 (2010)", "10.1021/ct900489g", "@article{Goerigk2010_107,\n  author = {Goerigk, L. and Grimme, S.},\n  title = {A General Database for Main Group Thermochemistry, Kinetics, and Noncovalent Interactions -- Assessment of Common and Reparameterized (meta-){GGA} Density Functionals},\n  journal = {J. Chem. Theory Comput.},\n  volume = {6},\n  number = {1},\n  pages = {107},\n  year = {2010},\n  doi = {10.1021/ct900489g},\n  url = {http://pubs.acs.org/doi/abs/10.1021/ct900489g}\n}\n", "Goerigk2010_107"),
        ]),
    :gga_xc_opwlyp_d => IdentifierText(
        "oPWLYP-D functional of Goerigk and Grimme",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("L. Goerigk and S. Grimme,  J. Chem. Theory Comput. 6, 107 (2010)", "10.1021/ct900489g", "@article{Goerigk2010_107,\n  author = {Goerigk, L. and Grimme, S.},\n  title = {A General Database for Main Group Thermochemistry, Kinetics, and Noncovalent Interactions -- Assessment of Common and Reparameterized (meta-){GGA} Density Functionals},\n  journal = {J. Chem. Theory Comput.},\n  volume = {6},\n  number = {1},\n  pages = {107},\n  year = {2010},\n  doi = {10.1021/ct900489g},\n  url = {http://pubs.acs.org/doi/abs/10.1021/ct900489g}\n}\n", "Goerigk2010_107"),
        ]),
    :gga_xc_pbe1w => IdentifierText(
        "PBE1W",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("E. E. Dahlke and D. G. Truhlar,  J. Phys. Chem. B 109, 15677 (2005)", "10.1021/jp052436c", "@article{Dahlke2005_15677,\n  author = {Dahlke, E. E. and Truhlar, D. G.},\n  title = {Improved Density Functionals for Water},\n  journal = {J. Phys. Chem. B},\n  volume = {109},\n  number = {33},\n  pages = {15677},\n  year = {2005},\n  doi = {10.1021/jp052436c},\n  url = {http://pubs.acs.org/doi/abs/10.1021/jp052436c}\n}\n", "Dahlke2005_15677"),
        ]),
    :gga_xc_pbelyp1w => IdentifierText(
        "PBELYP1W",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("E. E. Dahlke and D. G. Truhlar,  J. Phys. Chem. B 109, 15677 (2005)", "10.1021/jp052436c", "@article{Dahlke2005_15677,\n  author = {Dahlke, E. E. and Truhlar, D. G.},\n  title = {Improved Density Functionals for Water},\n  journal = {J. Phys. Chem. B},\n  volume = {109},\n  number = {33},\n  pages = {15677},\n  year = {2005},\n  doi = {10.1021/jp052436c},\n  url = {http://pubs.acs.org/doi/abs/10.1021/jp052436c}\n}\n", "Dahlke2005_15677"),
        ]),
    :gga_xc_th1 => IdentifierText(
        "Tozer and Handy v. 1",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("D. J. Tozer and N. C. Handy,  J. Chem. Phys. 108, 2545 (1998)", "10.1063/1.475638", "@article{Tozer1998_2545,\n  author = {Tozer, D. J. and Handy, N. C.},\n  title = {The development of new exchange-correlation functionals},\n  journal = {J. Chem. Phys.},\n  year = {1998},\n  volume = {108},\n  number = {6},\n  pages = {2545},\n  doi = {10.1063/1.475638},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/108/6/10.1063/1.475638}\n}\n", "Tozer1998_2545"),
        ]),
    :gga_xc_th2 => IdentifierText(
        "Tozer and Handy v. 2",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("D. J. Tozer and N. C. Handy,  J. Phys. Chem. A 102, 3162 (1998)", "10.1021/jp980259s", "@article{Tozer1998_3162,\n  author = {Tozer, D. J. and Handy, N. C.},\n  title = {Development of New Exchange-Correlation Functionals. 2},\n  journal = {J. Phys. Chem. A},\n  volume = {102},\n  number = {18},\n  pages = {3162},\n  year = {1998},\n  doi = {10.1021/jp980259s},\n  url = {http://pubs.acs.org/doi/abs/10.1021/jp980259s}\n}\n", "Tozer1998_3162"),
        ]),
    :gga_xc_th3 => IdentifierText(
        "Tozer and Handy v. 3",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("N. C. Handy and D. J. Tozer,  Mol. Phys. 94, 707 (1998)", "10.1080/002689798167863", "@article{Handy1998_707,\n  author = {Handy, N. C. and Tozer, D. J.},\n  title = {The development of new exchange-correlation functionals: 3},\n  journal = {Mol. Phys.},\n  volume = {94},\n  number = {4},\n  pages = {707},\n  year = {1998},\n  doi = {10.1080/002689798167863},\n  url = {http://www.tandfonline.com/doi/abs/10.1080/002689798167863}\n}\n", "Handy1998_707"),
        ]),
    :gga_xc_th4 => IdentifierText(
        "Tozer and Handy v. 4",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("N. C. Handy and D. J. Tozer,  Mol. Phys. 94, 707 (1998)", "10.1080/002689798167863", "@article{Handy1998_707,\n  author = {Handy, N. C. and Tozer, D. J.},\n  title = {The development of new exchange-correlation functionals: 3},\n  journal = {Mol. Phys.},\n  volume = {94},\n  number = {4},\n  pages = {707},\n  year = {1998},\n  doi = {10.1080/002689798167863},\n  url = {http://www.tandfonline.com/doi/abs/10.1080/002689798167863}\n}\n", "Handy1998_707"),
        ]),
    :gga_xc_th_fc => IdentifierText(
        "Tozer and Handy v. FC",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("D. J. Tozer, N. C. Handy, and W. H. Green,  Chem. Phys. Lett. 273, 183 (1997)", "10.1016/S0009-2614(97)00586-1", "@article{Tozer1997_183,\n  author = {Tozer, D. J. and Handy, N. C. and Green, W. H.},\n  title = {Exchange-correlation functionals from ab initio electron densities},\n  journal = {Chem. Phys. Lett.},\n  volume = {273},\n  number = {3--4},\n  pages = {183},\n  year = {1997},\n  issn = {0009-2614},\n  doi = {10.1016/S0009-2614(97)00586-1},\n  url = {http://www.sciencedirect.com/science/article/pii/S0009261497005861}\n}\n", "Tozer1997_183"),
        ]),
    :gga_xc_th_fcfo => IdentifierText(
        "Tozer and Handy v. FCFO",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("D. J. Tozer, N. C. Handy, and W. H. Green,  Chem. Phys. Lett. 273, 183 (1997)", "10.1016/S0009-2614(97)00586-1", "@article{Tozer1997_183,\n  author = {Tozer, D. J. and Handy, N. C. and Green, W. H.},\n  title = {Exchange-correlation functionals from ab initio electron densities},\n  journal = {Chem. Phys. Lett.},\n  volume = {273},\n  number = {3--4},\n  pages = {183},\n  year = {1997},\n  issn = {0009-2614},\n  doi = {10.1016/S0009-2614(97)00586-1},\n  url = {http://www.sciencedirect.com/science/article/pii/S0009261497005861}\n}\n", "Tozer1997_183"),
        ]),
    :gga_xc_th_fco => IdentifierText(
        "Tozer and Handy v. FCO",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("D. J. Tozer, N. C. Handy, and W. H. Green,  Chem. Phys. Lett. 273, 183 (1997)", "10.1016/S0009-2614(97)00586-1", "@article{Tozer1997_183,\n  author = {Tozer, D. J. and Handy, N. C. and Green, W. H.},\n  title = {Exchange-correlation functionals from ab initio electron densities},\n  journal = {Chem. Phys. Lett.},\n  volume = {273},\n  number = {3--4},\n  pages = {183},\n  year = {1997},\n  issn = {0009-2614},\n  doi = {10.1016/S0009-2614(97)00586-1},\n  url = {http://www.sciencedirect.com/science/article/pii/S0009261497005861}\n}\n", "Tozer1997_183"),
        ]),
    :gga_xc_vv10 => IdentifierText(
        "Vydrov and Van Voorhis",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :vv10, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("O. A. Vydrov and T. Van Voorhis,  J. Chem. Phys. 133, 244103 (2010)", "10.1063/1.3521275", "@article{Vydrov2010_244103,\n  author = {Vydrov, Oleg A. and Van Voorhis, Troy},\n  title = {Nonlocal van der {Waals} density functional: The simpler the better},\n  journal = {J. Chem. Phys.},\n  volume = {133},\n  number = {24},\n  pages = {244103},\n  year = {2010},\n  doi = {10.1063/1.3521275},\n  url = {https://doi.org/10.1063/1.3521275}\n}\n", "Vydrov2010_244103"),
        ]),
    :gga_xc_xlyp => IdentifierText(
        "XLYP",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("X. Xu and W. A. Goddard,  Proc. Natl. Acad. Sci. U. S. A. 101, 2673 (2004)", "10.1073/pnas.0308730100", "@article{Xu2004_2673,\n  author = {Xu, X. and Goddard, W. A.},\n  title = {The {X3LYP} extended density functional for accurate descriptions of nonbond interactions, spin states, and thermochemical properties},\n  journal = {Proc. Natl. Acad. Sci. U. S. A.},\n  volume = {101},\n  number = {9},\n  pages = {2673},\n  year = {2004},\n  doi = {10.1073/pnas.0308730100},\n  url = {http://www.pnas.org/content/101/9/2673.abstract}\n}\n", "Xu2004_2673"),
        ]),
    :hyb_gga_x_cam_s12g => IdentifierText(
        "Swart 2012 range-separated hybrid GGA exchange",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :hyb_cam, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("M. Swart,  Chem. Phys. Lett. 580, 166–171 (2013)", "10.1016/j.cplett.2013.06.045", "@article{Swart2013_166,\n  author = {Swart, Marcel},\n  title = {A new family of hybrid density functionals},\n  journal = {Chem. Phys. Lett.},\n  volume = {580},\n  pages = {166--171},\n  year = {2013},\n  issn = {0009-2614},\n  doi = {10.1016/j.cplett.2013.06.045},\n  url = {http://www.sciencedirect.com/science/article/pii/S0009261413008221}\n}\n", "Swart2013_166"),
        ]),
    :hyb_gga_x_cam_s12h => IdentifierText(
        "Swart 2012 range-separated hybrid GGA exchange",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :hyb_cam, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("M. Swart,  Chem. Phys. Lett. 580, 166–171 (2013)", "10.1016/j.cplett.2013.06.045", "@article{Swart2013_166,\n  author = {Swart, Marcel},\n  title = {A new family of hybrid density functionals},\n  journal = {Chem. Phys. Lett.},\n  volume = {580},\n  pages = {166--171},\n  year = {2013},\n  issn = {0009-2614},\n  doi = {10.1016/j.cplett.2013.06.045},\n  url = {http://www.sciencedirect.com/science/article/pii/S0009261413008221}\n}\n", "Swart2013_166"),
        ]),
    :hyb_gga_x_n12_sx => IdentifierText(
        "Minnesota N12-SX exchange functional",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :hyb_cam, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("R. Peverati and D. G. Truhlar,  Phys. Chem. Chem. Phys. 14, 16187 (2012)", "10.1039/C2CP42576A", "@article{Peverati2012_16187,\n  author = {Peverati, R. and Truhlar, D. G.},\n  title = {Screened-exchange density functionals with broad accuracy for chemistry and solid-state physics},\n  journal = {Phys. Chem. Chem. Phys.},\n  year = {2012},\n  volume = {14},\n  issue = {47},\n  pages = {16187},\n  publisher = {The Royal Society of Chemistry},\n  doi = {10.1039/C2CP42576A},\n  url = {http://pubs.rsc.org/en/Content/ArticleLanding/2012/CP/c2cp42576a}\n}\n", "Peverati2012_16187"),
        ]),
    :hyb_gga_x_pbe_erf_gws => IdentifierText(
        "Short-range PBE (GWS) exchange (erfc) + long-range exact exchange",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :hyb_cam, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("E. Goll, H.-J. Werner, and H. Stoll,  Phys. Chem. Chem. Phys. 7, 3917–3923 (2005)", "10.1039/B509242F", "@article{Goll2005_3917,\n  author = {Goll, Erich and Werner, Hans-Joachim and Stoll, Hermann},\n  title = {A short-range gradient-corrected density functional in long-range coupled-cluster calculations for rare gas dimers},\n  journal = {Phys. Chem. Chem. Phys.},\n  year = {2005},\n  volume = {7},\n  issue = {23},\n  pages = {3917--3923},\n  publisher = {The Royal Society of Chemistry},\n  doi = {10.1039/B509242F},\n  url = {https://doi.org/10.1039/B509242F}\n}\n", "Goll2005_3917"),
            LibxcReference("E. Goll, H.-J. Werner, H. Stoll, T. Leininger, P. Gori-Giorgi, and A. Savin,  Chem. Phys. 329, 276–282 (2006)", "10.1016/j.chemphys.2006.05.020", "@article{Goll2006_276,\n  author = {Goll, Erich and Werner, Hans-Joachim and Stoll, Hermann and Leininger, Thierry and Gori-Giorgi, Paola and Savin, Andreas},\n  title = {A short-range gradient-corrected spin density functional in combination with long-range coupled-cluster methods: Application to alkali-metal rare-gas dimers},\n  journal = {Chem. Phys.},\n  volume = {329},\n  number = {1},\n  pages = {276--282},\n  year = {2006},\n  issn = {0301-0104},\n  doi = {10.1016/j.chemphys.2006.05.020},\n  url = {https://doi.org/10.1016/j.chemphys.2006.05.020}\n}\n", "Goll2006_276"),
        ]),
    :hyb_gga_x_s12h => IdentifierText(
        "Swart 2012 hybrid GGA exchange",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("M. Swart,  Chem. Phys. Lett. 580, 166–171 (2013)", "10.1016/j.cplett.2013.06.045", "@article{Swart2013_166,\n  author = {Swart, Marcel},\n  title = {A new family of hybrid density functionals},\n  journal = {Chem. Phys. Lett.},\n  volume = {580},\n  pages = {166--171},\n  year = {2013},\n  issn = {0009-2614},\n  doi = {10.1016/j.cplett.2013.06.045},\n  url = {http://www.sciencedirect.com/science/article/pii/S0009261413008221}\n}\n", "Swart2013_166"),
        ]),
    :hyb_gga_x_sogga11_x => IdentifierText(
        "Hybrid based on SOGGA11 form",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("R. Peverati and D. G. Truhlar,  J. Chem. Phys. 135, 191102 (2011)", "10.1063/1.3663871", "@article{Peverati2011_191102,\n  author = {Peverati, R. and Truhlar, D. G.},\n  title = {Communication: A global hybrid generalized gradient approximation to the exchange-correlation functional that satisfies the second-order density-gradient constraint and has broad applicability in chemistry},\n  journal = {J. Chem. Phys.},\n  year = {2011},\n  volume = {135},\n  number = {19},\n  pages = {191102},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/135/19/10.1063/1.3663871},\n  doi = {10.1063/1.3663871}\n}\n", "Peverati2011_191102"),
        ]),
    :hyb_gga_xc_apbe0 => IdentifierText(
        "Hybrid based on APBE",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("E. Fabiano, L. A. Constantin, P. Cortona, and F. Della Sala,  J. Chem. Theory Comput. 11, 122–131 (2015)", "10.1021/ct500902p", "@article{Fabiano2015_122,\n  author = {Fabiano, Eduardo and Constantin, Lucian A. and Cortona, Pietro and Della Sala, Fabio},\n  title = {Global Hybrids from the Semiclassical Atom Theory Satisfying the Local Density Linear Response},\n  journal = {J. Chem. Theory Comput.},\n  volume = {11},\n  number = {1},\n  pages = {122--131},\n  year = {2015},\n  doi = {10.1021/ct500902p},\n  url = {https://doi.org/10.1021/ct500902p}\n}\n", "Fabiano2015_122"),
        ]),
    :hyb_gga_xc_apf => IdentifierText(
        "APF hybrid functional",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("A. Austin, G. A. Petersson, M. J. Frisch, F. J. Dobek, G. Scalmani, and K. Throssell,  J. Chem. Theory Comput. 8, 4989–5007 (2012)", "10.1021/ct300778e", "@article{Austin2012_4989,\n  author = {Austin, Amy and Petersson, George A. and Frisch, Michael J. and Dobek, Frank J. and Scalmani, Giovanni and Throssell, Kyle},\n  title = {A Density Functional with Spherical Atom Dispersion Terms},\n  journal = {J. Chem. Theory Comput.},\n  volume = {8},\n  number = {12},\n  pages = {4989--5007},\n  year = {2012},\n  doi = {10.1021/ct300778e},\n  url = {https://doi.org/10.1021/ct300778e}\n}\n", "Austin2012_4989"),
        ]),
    :hyb_gga_xc_b1lyp => IdentifierText(
        "B1LYP",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("C. Adamo and V. Barone,  Chem. Phys. Lett. 274, 242 (1997)", "10.1016/S0009-2614(97)00651-9", "@article{Adamo1997_242,\n  author = {Adamo, C. and Barone, V.},\n  title = {Toward reliable adiabatic connection models free from adjustable parameters},\n  journal = {Chem. Phys. Lett.},\n  volume = {274},\n  number = {1--3},\n  pages = {242},\n  year = {1997},\n  issn = {0009-2614},\n  doi = {10.1016/S0009-2614(97)00651-9},\n  url = {http://www.sciencedirect.com/science/article/pii/S0009261497006519}\n}\n", "Adamo1997_242"),
        ]),
    :hyb_gga_xc_b1pw91 => IdentifierText(
        "B1PW91",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("C. Adamo and V. Barone,  Chem. Phys. Lett. 274, 242 (1997)", "10.1016/S0009-2614(97)00651-9", "@article{Adamo1997_242,\n  author = {Adamo, C. and Barone, V.},\n  title = {Toward reliable adiabatic connection models free from adjustable parameters},\n  journal = {Chem. Phys. Lett.},\n  volume = {274},\n  number = {1--3},\n  pages = {242},\n  year = {1997},\n  issn = {0009-2614},\n  doi = {10.1016/S0009-2614(97)00651-9},\n  url = {http://www.sciencedirect.com/science/article/pii/S0009261497006519}\n}\n", "Adamo1997_242"),
        ]),
    :hyb_gga_xc_b1wc => IdentifierText(
        "B1WC",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("D. I. Bilc, R. Orlando, R. Shaltaf, G.-M. Rignanese, J. Íñiguez, and Ph. Ghosez,  Phys. Rev. B 77, 165107 (2008)", "10.1103/PhysRevB.77.165107", "@article{Bilc2008_165107,\n  author = {Bilc, D. I. and Orlando, R. and Shaltaf, R. and Rignanese, G.-M. and {\\'{I}\\\\textasciitilde {n}iguez}, J. and Ghosez, Ph.},\n  title = {Hybrid exchange-correlation functional for accurate prediction of the electronic and structural properties of ferroelectric oxides},\n  journal = {Phys. Rev. B},\n  volume = {77},\n  issue = {16},\n  pages = {165107},\n  year = {2008},\n  month = {Apr},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevB.77.165107},\n  url = {http://link.aps.org/doi/10.1103/PhysRevB.77.165107}\n}\n", "Bilc2008_165107"),
        ]),
    :hyb_gga_xc_b3lyp => IdentifierText(
        "B3LYP",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("P. J. Stephens, F. J. Devlin, C. F. Chabalowski, and M. J. Frisch,  J. Phys. Chem. 98, 11623 (1994)", "10.1021/j100096a001", "@article{Stephens1994_11623,\n  author = {Stephens, P. J. and Devlin, F. J. and Chabalowski, C. F. and Frisch, M. J.},\n  title = {Ab Initio Calculation of Vibrational Absorption and Circular Dichroism Spectra Using Density Functional Force Fields},\n  journal = {J. Phys. Chem.},\n  volume = {98},\n  number = {45},\n  pages = {11623},\n  year = {1994},\n  doi = {10.1021/j100096a001},\n  url = {http://pubs.acs.org/doi/abs/10.1021/j100096a001}\n}\n", "Stephens1994_11623"),
        ]),
    :hyb_gga_xc_b3lyp3 => IdentifierText(
        "B3LYP with VWN functional 3 instead of RPA",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("P. J. Stephens, F. J. Devlin, C. F. Chabalowski, and M. J. Frisch,  J. Phys. Chem. 98, 11623 (1994)", "10.1021/j100096a001", "@article{Stephens1994_11623,\n  author = {Stephens, P. J. and Devlin, F. J. and Chabalowski, C. F. and Frisch, M. J.},\n  title = {Ab Initio Calculation of Vibrational Absorption and Circular Dichroism Spectra Using Density Functional Force Fields},\n  journal = {J. Phys. Chem.},\n  volume = {98},\n  number = {45},\n  pages = {11623},\n  year = {1994},\n  doi = {10.1021/j100096a001},\n  url = {http://pubs.acs.org/doi/abs/10.1021/j100096a001}\n}\n", "Stephens1994_11623"),
        ]),
    :hyb_gga_xc_b3lyp5 => IdentifierText(
        "B3LYP with VWN functional 5 instead of RPA",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("P. J. Stephens, F. J. Devlin, C. F. Chabalowski, and M. J. Frisch,  J. Phys. Chem. 98, 11623 (1994)", "10.1021/j100096a001", "@article{Stephens1994_11623,\n  author = {Stephens, P. J. and Devlin, F. J. and Chabalowski, C. F. and Frisch, M. J.},\n  title = {Ab Initio Calculation of Vibrational Absorption and Circular Dichroism Spectra Using Density Functional Force Fields},\n  journal = {J. Phys. Chem.},\n  volume = {98},\n  number = {45},\n  pages = {11623},\n  year = {1994},\n  doi = {10.1021/j100096a001},\n  url = {http://pubs.acs.org/doi/abs/10.1021/j100096a001}\n}\n", "Stephens1994_11623"),
        ]),
    :hyb_gga_xc_b3lyp_mcm1 => IdentifierText(
        "B3LYP-MCM1",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("M. T. Caldeira and R. Custodio,  J. Mol. Model. 25, 62 (2019)", "10.1007/s00894-019-3952-4", "@article{Caldeira2019_62,\n  author = {Caldeira, Mariana Toretti and Custodio, Rog\\'{e}rio},\n  title = {Partial combination of composite strategy and the {B3LYP} functional for the calculation of enthalpies of formation},\n  journal = {J. Mol. Model.},\n  year = {2019},\n  month = {Feb},\n  day = {12},\n  volume = {25},\n  number = {3},\n  pages = {62},\n  issn = {0948-5023},\n  doi = {10.1007/s00894-019-3952-4},\n  url = {https://doi.org/10.1007/s00894-019-3952-4}\n}\n", "Caldeira2019_62"),
        ]),
    :hyb_gga_xc_b3lyp_mcm2 => IdentifierText(
        "B3LYP-MCM2",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("M. T. Caldeira and R. Custodio,  J. Mol. Model. 25, 62 (2019)", "10.1007/s00894-019-3952-4", "@article{Caldeira2019_62,\n  author = {Caldeira, Mariana Toretti and Custodio, Rog\\'{e}rio},\n  title = {Partial combination of composite strategy and the {B3LYP} functional for the calculation of enthalpies of formation},\n  journal = {J. Mol. Model.},\n  year = {2019},\n  month = {Feb},\n  day = {12},\n  volume = {25},\n  number = {3},\n  pages = {62},\n  issn = {0948-5023},\n  doi = {10.1007/s00894-019-3952-4},\n  url = {https://doi.org/10.1007/s00894-019-3952-4}\n}\n", "Caldeira2019_62"),
        ]),
    :hyb_gga_xc_b3lyps => IdentifierText(
        "B3LYP*",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("M. Reiher, O. Salomon, and B. A. Hess,  Theor. Chem. Acc. 107, 48–55 (2001)", "10.1007/s00214-001-0300-3", "@article{Reiher2001_48,\n  author = {Reiher, M. and Salomon, O. and Hess, B. A.},\n  title = {Reparameterization of hybrid functionals based on energy differences of states of different multiplicity},\n  journal = {Theor. Chem. Acc.},\n  volume = {107},\n  number = {1},\n  pages = {48--55},\n  year = {2001},\n  issn = {1432-881X},\n  publisher = {Springer-Verlag},\n  doi = {10.1007/s00214-001-0300-3},\n  url = {https://doi.org/10.1007/s00214-001-0300-3}\n}\n", "Reiher2001_48"),
        ]),
    :hyb_gga_xc_b3p86 => IdentifierText(
        "B3P86",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("Defined through Gaussian implementation.", "", "@misc{gaussianimplementation,\n  note = {Defined through {Gaussian} implementation}\n}\n", "gaussianimplementation"),
        ]),
    :hyb_gga_xc_b3p86_nwchem => IdentifierText(
        "B3P86, NWChem version",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("Defined through NWChem implementation.", "", "@misc{nwchemimplementation,\n  note = {Defined through {NWChem} implementation}\n}\n", "nwchemimplementation"),
        ]),
    :hyb_gga_xc_b3pw91 => IdentifierText(
        "The original (ACM, B3PW91) hybrid of Becke",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("A. D. Becke,  J. Chem. Phys. 98, 5648 (1993)", "10.1063/1.464913", "@article{Becke1993_5648,\n  author = {Becke, A. D.},\n  title = {Density-functional thermochemistry. {III}. {The} role of exact exchange},\n  journal = {J. Chem. Phys.},\n  year = {1993},\n  volume = {98},\n  number = {7},\n  pages = {5648},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/98/7/10.1063/1.464913},\n  doi = {10.1063/1.464913}\n}\n", "Becke1993_5648"),
        ]),
    :hyb_gga_xc_b97 => IdentifierText(
        "Becke 97",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("A. D. Becke,  J. Chem. Phys. 107, 8554 (1997)", "10.1063/1.475007", "@article{Becke1997_8554,\n  author = {Becke, A. D.},\n  title = {Density-functional thermochemistry. {V}. {Systematic} optimization of exchange-correlation functionals},\n  journal = {J. Chem. Phys.},\n  year = {1997},\n  volume = {107},\n  number = {20},\n  pages = {8554},\n  doi = {10.1063/1.475007},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/107/20/10.1063/1.475007}\n}\n", "Becke1997_8554"),
        ]),
    :hyb_gga_xc_b97_1 => IdentifierText(
        "Becke 97-1",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("F. A. Hamprecht, A. J. Cohen, D. J. Tozer, and N. C. Handy,  J. Chem. Phys. 109, 6264 (1998)", "10.1063/1.477267", "@article{Hamprecht1998_6264,\n  author = {Hamprecht, F. A. and Cohen, A. J. and Tozer, D. J. and Handy, N. C.},\n  title = {Development and assessment of new exchange-correlation functionals},\n  journal = {J. Chem. Phys.},\n  year = {1998},\n  volume = {109},\n  number = {15},\n  pages = {6264},\n  doi = {10.1063/1.477267},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/109/15/10.1063/1.477267}\n}\n", "Hamprecht1998_6264"),
        ]),
    :hyb_gga_xc_b97_1p => IdentifierText(
        "version of B97 by Cohen and Handy",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("A. J. Cohen and N. C. Handy,  Chem. Phys. Lett. 316, 160 (2000)", "10.1016/S0009-2614(99)01273-7", "@article{Cohen2000_160,\n  author = {Cohen, A. J. and Handy, N. C.},\n  title = {Assessment of exchange correlation functionals},\n  journal = {Chem. Phys. Lett.},\n  volume = {316},\n  number = {1--2},\n  pages = {160},\n  year = {2000},\n  issn = {0009-2614},\n  doi = {10.1016/S0009-2614(99)01273-7},\n  url = {http://www.sciencedirect.com/science/article/pii/S0009261499012737}\n}\n", "Cohen2000_160"),
        ]),
    :hyb_gga_xc_b97_2 => IdentifierText(
        "Becke 97-2",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("P. J. Wilson, T. J. Bradley, and D. J. Tozer,  J. Chem. Phys. 115, 9233 (2001)", "10.1063/1.1412605", "@article{Wilson2001_9233,\n  author = {Wilson, P. J. and Bradley, T. J. and Tozer, D. J.},\n  title = {Hybrid exchange-correlation functional determined from thermochemical data and ab initio potentials},\n  journal = {J. Chem. Phys.},\n  year = {2001},\n  volume = {115},\n  number = {20},\n  pages = {9233},\n  doi = {10.1063/1.1412605},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/115/20/10.1063/1.1412605}\n}\n", "Wilson2001_9233"),
        ]),
    :hyb_gga_xc_b97_3 => IdentifierText(
        "Becke 97-3",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("T. W. Keal and D. J. Tozer,  J. Chem. Phys. 123, 121103 (2005)", "10.1063/1.2061227", "@article{Keal2005_121103,\n  author = {Keal, T. W. and Tozer, D. J.},\n  title = {Semiempirical hybrid functional with improved performance in an extensive chemical assessment},\n  journal = {J. Chem. Phys.},\n  year = {2005},\n  volume = {123},\n  number = {12},\n  pages = {121103},\n  doi = {10.1063/1.2061227},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/123/12/10.1063/1.2061227}\n}\n", "Keal2005_121103"),
        ]),
    :hyb_gga_xc_b97_k => IdentifierText(
        "Boese-Martin for Kinetics",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("A. D. Boese and J. M. L. Martin,  J. Chem. Phys. 121, 3405 (2004)", "10.1063/1.1774975", "@article{Boese2004_3405,\n  author = {Boese, A. D. and Martin, J. M. L.},\n  title = {Development of density functionals for thermochemical kinetics},\n  journal = {J. Chem. Phys.},\n  year = {2004},\n  volume = {121},\n  number = {8},\n  pages = {3405},\n  doi = {10.1063/1.1774975},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/121/8/10.1063/1.1774975}\n}\n", "Boese2004_3405"),
        ]),
    :hyb_gga_xc_b5050lyp => IdentifierText(
        "B5050LYP",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("Y. Shao, M. Head-Gordon, and A. I. Krylov,  J. Chem. Phys. 118, 4807–4818 (2003)", "10.1063/1.1545679", "@article{Shao2003_4807,\n  author = {Shao, Yihan and Head-Gordon, Martin and Krylov, Anna I.},\n  title = {The spin--flip approach within time-dependent density functional theory: Theory and applications to diradicals},\n  journal = {J. Chem. Phys.},\n  volume = {118},\n  number = {11},\n  pages = {4807--4818},\n  year = {2003},\n  doi = {10.1063/1.1545679},\n  url = {https://doi.org/10.1063/1.1545679}\n}\n", "Shao2003_4807"),
        ]),
    :hyb_gga_xc_bhandh => IdentifierText(
        "BHandH: 50% LDA exchange and 50% HF exchange with 100% LYP correlation",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("A. D. Becke,  J. Chem. Phys. 98, 1372 (1993)", "10.1063/1.464304", "@article{Becke1993_1372,\n  author = {Becke, A. D.},\n  title = {A new mixing of {Hartree}--{Fock} and local density-functional theories},\n  journal = {J. Chem. Phys.},\n  year = {1993},\n  volume = {98},\n  number = {2},\n  pages = {1372},\n  doi = {10.1063/1.464304},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/98/2/10.1063/1.464304}\n}\n", "Becke1993_1372"),
            LibxcReference("Defined through Gaussian implementation.", "", "@misc{gaussianimplementation,\n  note = {Defined through {Gaussian} implementation}\n}\n", "gaussianimplementation"),
        ]),
    :hyb_gga_xc_bhandhlyp => IdentifierText(
        "BHandHLYP a.k.a. BHLYP: 50% B88 exchange and 50% HF exchange with 100% LYP correlation",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("A. D. Becke,  J. Chem. Phys. 98, 1372 (1993)", "10.1063/1.464304", "@article{Becke1993_1372,\n  author = {Becke, A. D.},\n  title = {A new mixing of {Hartree}--{Fock} and local density-functional theories},\n  journal = {J. Chem. Phys.},\n  year = {1993},\n  volume = {98},\n  number = {2},\n  pages = {1372},\n  doi = {10.1063/1.464304},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/98/2/10.1063/1.464304}\n}\n", "Becke1993_1372"),
            LibxcReference("Defined through Gaussian implementation.", "", "@misc{gaussianimplementation,\n  note = {Defined through {Gaussian} implementation}\n}\n", "gaussianimplementation"),
        ]),
    :hyb_gga_xc_blyp35 => IdentifierText(
        "BLYP35",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("M. Renz, K. Theilacker, C. Lambert, and M. Kaupp,  J. Am. Chem. Soc. 131, 16292–16302 (2009)", "10.1021/ja9070859", "@article{Renz2009_16292,\n  author = {Renz, Manuel and Theilacker, Kolja and Lambert, Christoph and Kaupp, Martin},\n  title = {A Reliable Quantum-Chemical Protocol for the Characterization of Organic Mixed-Valence Compounds},\n  journal = {J. Am. Chem. Soc.},\n  volume = {131},\n  number = {44},\n  pages = {16292--16302},\n  year = {2009},\n  doi = {10.1021/ja9070859},\n  url = {https://doi.org/10.1021/ja9070859}\n}\n", "Renz2009_16292"),
            LibxcReference("M. Kaupp, M. Renz, M. Parthey, M. Stolte, F. Würthner, and C. Lambert,  Phys. Chem. Chem. Phys. 13, 16973–16986 (2011)", "10.1039/C1CP21772K", "@article{Kaupp2011_16973,\n  author = {Kaupp, Martin and Renz, Manuel and Parthey, Matthias and Stolte, Matthias and W\\\"{u}rthner, Frank and Lambert, Christoph},\n  title = {Computational and spectroscopic studies of organic mixed-valence compounds: where is the charge?},\n  journal = {Phys. Chem. Chem. Phys.},\n  year = {2011},\n  volume = {13},\n  issue = {38},\n  pages = {16973--16986},\n  publisher = {The Royal Society of Chemistry},\n  doi = {10.1039/C1CP21772K},\n  url = {https://doi.org/10.1039/C1CP21772K}\n}\n", "Kaupp2011_16973"),
        ]),
    :hyb_gga_xc_cam_b3lyp => IdentifierText(
        "CAM version of B3LYP",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :hyb_cam, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("T. Yanai, D. P. Tew, and N. C. Handy,  Chem. Phys. Lett. 393, 51 (2004)", "10.1016/j.cplett.2004.06.011", "@article{Yanai2004_51,\n  author = {Yanai, T. and Tew, D. P. and Handy, N. C.},\n  title = {A new hybrid exchange-correlation functional using the {Coulomb}-attenuating method ({CAM}-{B3LYP})},\n  journal = {Chem. Phys. Lett.},\n  volume = {393},\n  number = {1--3},\n  pages = {51},\n  year = {2004},\n  issn = {0009-2614},\n  doi = {10.1016/j.cplett.2004.06.011},\n  url = {http://www.sciencedirect.com/science/article/pii/S0009261404008620}\n}\n", "Yanai2004_51"),
        ]),
    :hyb_gga_xc_cam_o3lyp => IdentifierText(
        "CAM-O3LYP",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :hyb_cam, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("M. P. Bircher and U. Rothlisberger,  J. Chem. Theory Comput. 14, 3184–3195 (2018)", "10.1021/acs.jctc.8b00069", "@article{Bircher2018_3184,\n  author = {Bircher, Martin P. and Rothlisberger, Ursula},\n  title = {Plane-Wave Implementation and Performance of \\'{a}-la-Carte {C}oulomb-Attenuated Exchange-Correlation Functionals for Predicting Optical Excitation Energies in Some Notorious Cases},\n  journal = {J. Chem. Theory Comput.},\n  volume = {14},\n  number = {6},\n  pages = {3184--3195},\n  year = {2018},\n  doi = {10.1021/acs.jctc.8b00069},\n  url = {https://doi.org/10.1021/acs.jctc.8b00069}\n}\n", "Bircher2018_3184"),
        ]),
    :hyb_gga_xc_cam_pbeh => IdentifierText(
        "CAM hybrid screened exchange PBE version",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :hyb_cam, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("W. Chen, G. Miceli, G.-M. Rignanese, and A. Pasquarello,  Phys. Rev. Mater. 2, 073803 (2018)", "10.1103/PhysRevMaterials.2.073803", "@article{Chen2018_073803,\n  author = {Chen, Wei and Miceli, Giacomo and Rignanese, Gian-Marco and Pasquarello, Alfredo},\n  title = {Nonempirical dielectric-dependent hybrid functional with range separation for semiconductors and insulators},\n  journal = {Phys. Rev. Mater.},\n  volume = {2},\n  issue = {7},\n  pages = {073803},\n  year = {2018},\n  month = {Jul},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevMaterials.2.073803},\n  url = {https://link.aps.org/doi/10.1103/PhysRevMaterials.2.073803}\n}\n", "Chen2018_073803"),
        ]),
    :hyb_gga_xc_cam_qtp_00 => IdentifierText(
        "CAM-B3LYP retuned using ionization potentials of water",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :hyb_cam, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("P. Verma and R. J. Bartlett,  J. Chem. Phys. 140, 18A534 (2014)", "10.1063/1.4871409", "@article{Verma2014_18A534,\n  author = {Verma, Prakash and Bartlett, Rodney J.},\n  title = {Increasing the applicability of density functional theory. {IV}. {Consequences} of ionization-potential improved exchange-correlation potentials},\n  journal = {J. Chem. Phys.},\n  volume = {140},\n  number = {18},\n  pages = {18A534},\n  year = {2014},\n  doi = {10.1063/1.4871409},\n  url = {https://doi.org/10.1063/1.4871409}\n}\n", "Verma2014_18A534"),
        ]),
    :hyb_gga_xc_cam_qtp_01 => IdentifierText(
        "CAM-B3LYP retuned using ionization potentials of water",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :hyb_cam, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("Y. Jin and R. J. Bartlett,  J. Chem. Phys. 145, 034107 (2016)", "10.1063/1.4955497", "@article{Jin2016_034107,\n  author = {Jin, Yifan and Bartlett, Rodney J.},\n  title = {The {QTP} family of consistent functionals and potentials in {Kohn}--{Sham} density functional theory},\n  journal = {J. Chem. Phys.},\n  volume = {145},\n  number = {3},\n  pages = {034107},\n  year = {2016},\n  doi = {10.1063/1.4955497},\n  url = {https://doi.org/10.1063/1.4955497}\n}\n", "Jin2016_034107"),
        ]),
    :hyb_gga_xc_cam_qtp_02 => IdentifierText(
        "CAM-B3LYP retuned using ionization potentials of water",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :hyb_cam, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("R. L. A. Haiduke and R. J. Bartlett,  J. Chem. Phys. 148, 184106 (2018)", "10.1063/1.5025723", "@article{Haiduke2018_184106,\n  author = {Haiduke, Roberto Luiz A. and Bartlett, Rodney J.},\n  title = {Non-empirical exchange-correlation parameterizations based on exact conditions from correlated orbital theory},\n  journal = {J. Chem. Phys.},\n  volume = {148},\n  number = {18},\n  pages = {184106},\n  year = {2018},\n  doi = {10.1063/1.5025723},\n  url = {https://doi.org/10.1063/1.5025723}\n}\n", "Haiduke2018_184106"),
        ]),
    :hyb_gga_xc_camh_b3lyp => IdentifierText(
        "CAM version of B3LYP, tuned for TDDFT",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :hyb_cam, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("Y. Shao, Y. Mei, D. Sundholm, and V. R. I. Kaila,  J. Chem. Theory Comput. 16, 587–600 (2020)", "10.1021/acs.jctc.9b00823", "@article{Shao2020_587,\n  author = {Shao, Yihan and Mei, Ye and Sundholm, Dage and Kaila, Ville R. I.},\n  title = {Benchmarking the Performance of Time-Dependent Density Functional Theory Methods on Biochromophores},\n  journal = {J. Chem. Theory Comput.},\n  volume = {16},\n  number = {1},\n  pages = {587--600},\n  year = {2020},\n  doi = {10.1021/acs.jctc.9b00823},\n  url = {https://doi.org/10.1021/acs.jctc.9b00823}\n}\n", "Shao2020_587"),
        ]),
    :hyb_gga_xc_camy_b3lyp => IdentifierText(
        "CAMY version of B3LYP",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :hyb_camy, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("M. Seth and T. Ziegler,  J. Chem. Theory Comput. 8, 901–907 (2012)", "10.1021/ct300006h", "@article{Seth2012_901,\n  author = {Seth, Michael and Ziegler, Tom},\n  title = {Range-Separated Exchange Functionals with {Slater}-Type Functions},\n  journal = {J. Chem. Theory Comput.},\n  volume = {8},\n  number = {3},\n  pages = {901--907},\n  year = {2012},\n  doi = {10.1021/ct300006h},\n  url = {https://doi.org/10.1021/ct300006h}\n}\n", "Seth2012_901"),
        ]),
    :hyb_gga_xc_camy_blyp => IdentifierText(
        "CAMY version of BLYP",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :hyb_camy, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("Y. Akinaga and S. Ten-no,  Chem. Phys. Lett. 462, 348 (2008)", "10.1016/j.cplett.2008.07.103", "@article{Akinaga2008_348,\n  author = {Akinaga, Y. and Ten-no, S.},\n  title = {Range-separation by the {Yukawa} potential in long-range corrected density functional theory with {Gaussian}-type basis functions},\n  journal = {Chem. Phys. Lett.},\n  volume = {462},\n  number = {4--6},\n  pages = {348},\n  year = {2008},\n  issn = {0009-2614},\n  doi = {10.1016/j.cplett.2008.07.103},\n  url = {http://www.sciencedirect.com/science/article/pii/S0009261408010609}\n}\n", "Akinaga2008_348"),
        ]),
    :hyb_gga_xc_camy_pbeh => IdentifierText(
        "CAMY hybrid screened exchange PBE version",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :hyb_camy, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("W. Chen, G. Miceli, G.-M. Rignanese, and A. Pasquarello,  Phys. Rev. Mater. 2, 073803 (2018)", "10.1103/PhysRevMaterials.2.073803", "@article{Chen2018_073803,\n  author = {Chen, Wei and Miceli, Giacomo and Rignanese, Gian-Marco and Pasquarello, Alfredo},\n  title = {Nonempirical dielectric-dependent hybrid functional with range separation for semiconductors and insulators},\n  journal = {Phys. Rev. Mater.},\n  volume = {2},\n  issue = {7},\n  pages = {073803},\n  year = {2018},\n  month = {Jul},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevMaterials.2.073803},\n  url = {https://link.aps.org/doi/10.1103/PhysRevMaterials.2.073803}\n}\n", "Chen2018_073803"),
        ]),
    :hyb_gga_xc_cap0 => IdentifierText(
        "Correct Asymptotic Potential hybrid",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("J. Carmona-Espíndola, J. L. Gázquez, A. Vela, and S. B. Trickey,  Theor. Chem. Acc. 135, 120 (2016)", "10.1007/s00214-016-1864-2", "@article{Carmona2016_120,\n  author = {Carmona-Esp\\'{i}ndola, Javier and G\\'{a}zquez, Jos\\'{e} L. and Vela, Alberto and Trickey, S. B.},\n  title = {Global hybrid exchange energy functional with correct asymptotic behavior of the corresponding potential},\n  journal = {Theor. Chem. Acc.},\n  year = {2016},\n  volume = {135},\n  number = {5},\n  pages = {120},\n  issn = {1432-2234},\n  doi = {10.1007/s00214-016-1864-2},\n  url = {https://doi.org/10.1007/s00214-016-1864-2}\n}\n", "Carmona2016_120"),
        ]),
    :hyb_gga_xc_cqtp25 => IdentifierText(
        "CAM-B3LYP retuned for core electron ionization energies",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :hyb_cam, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("R. A. Mendes, N. J. King, A. Brown, R. J. Bartlett, and M. Klobukowski,  J. Chem. Phys. 163, 184107 (2025)", "10.1063/5.0294785", "@article{Mendes2025_184107,\n  author = {Mendes, Rodrigo A. and King, Nathanael J. and Brown, Alex and Bartlett, Rodney J. and Klobukowski, Mariusz},\n  title = {{cQTP25}: A new exchange–correlation functional for core-electron ionization energy},\n  journal = {J. Chem. Phys.},\n  volume = {163},\n  number = {18},\n  pages = {184107},\n  year = {2025},\n  month = {11},\n  issn = {0021-9606},\n  doi = {10.1063/5.0294785},\n  url = {https://doi.org/10.1063/5.0294785}\n}\n", "Mendes2025_184107"),
        ]),
    :hyb_gga_xc_edf2 => IdentifierText(
        "EDF2",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("C. Y. Lin, M. W. George, and P. M. W. Gill,  Aust. J. Chem. 57, 365–370 (2004)", "10.1071/CH03263", "@article{Lin2004_365,\n  author = {Lin, Ching Yeh and George, Michael W. and Gill, Peter M. W.},\n  title = {{EDF2}: A Density Functional for Predicting Molecular Vibrational Frequencies},\n  volume = {57},\n  number = {4},\n  pages = {365--370},\n  year = {2004},\n  doi = {10.1071/CH03263},\n  url = {http://www.publish.csiro.au/?paper=CH03263},\n  journal = {Aust. J. Chem.}\n}\n", "Lin2004_365"),
        ]),
    :hyb_gga_xc_hapbe => IdentifierText(
        "Hybrid based in APBE and zvPBEloc",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("E. Fabiano, L. A. Constantin, P. Cortona, and F. Della Sala,  J. Chem. Theory Comput. 11, 122–131 (2015)", "10.1021/ct500902p", "@article{Fabiano2015_122,\n  author = {Fabiano, Eduardo and Constantin, Lucian A. and Cortona, Pietro and Della Sala, Fabio},\n  title = {Global Hybrids from the Semiclassical Atom Theory Satisfying the Local Density Linear Response},\n  journal = {J. Chem. Theory Comput.},\n  volume = {11},\n  number = {1},\n  pages = {122--131},\n  year = {2015},\n  doi = {10.1021/ct500902p},\n  url = {https://doi.org/10.1021/ct500902p}\n}\n", "Fabiano2015_122"),
        ]),
    :hyb_gga_xc_hflyp => IdentifierText(
        "HF + LYP correlation",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("C. Lee, W. Yang, and R. G. Parr,  Phys. Rev. B 37, 785 (1988)", "10.1103/PhysRevB.37.785", "@article{Lee1988_785,\n  author = {Lee, C. and Yang, W. and Parr, R. G.},\n  title = {Development of the {Colle}--{Salvetti} correlation-energy formula into a functional of the electron density},\n  journal = {Phys. Rev. B},\n  volume = {37},\n  issue = {2},\n  pages = {785},\n  year = {1988},\n  month = {Jan},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevB.37.785},\n  url = {http://link.aps.org/doi/10.1103/PhysRevB.37.785}\n}\n", "Lee1988_785"),
            LibxcReference("B. Miehlich, A. Savin, H. Stoll, and H. Preuss,  Chem. Phys. Lett. 157, 200 (1989)", "10.1016/0009-2614(89)87234-3", "@article{Miehlich1989_200,\n  author = {Miehlich, B. and Savin, A. and Stoll, H. and Preuss, H.},\n  title = {Results obtained with the correlation energy density functionals of becke and {Lee}, {Yang} and {Parr}},\n  journal = {Chem. Phys. Lett.},\n  volume = {157},\n  number = {3},\n  pages = {200},\n  year = {1989},\n  issn = {0009-2614},\n  doi = {10.1016/0009-2614(89)87234-3},\n  url = {http://www.sciencedirect.com/science/article/pii/0009261489872343}\n}\n", "Miehlich1989_200"),
        ]),
    :hyb_gga_xc_hjs_b88 => IdentifierText(
        "HJS hybrid screened exchange B88 version",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :hyb_cam, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("T. M. Henderson, B. G. Janesko, and G. E. Scuseria,  J. Chem. Phys. 128, 194105 (2008)", "10.1063/1.2921797", "@article{Henderson2008_194105,\n  author = {Henderson, T. M. and Janesko, B. G. and Scuseria, G. E.},\n  title = {Generalized gradient approximation model exchange holes for range-separated hybrids},\n  journal = {J. Chem. Phys.},\n  year = {2008},\n  volume = {128},\n  number = {19},\n  pages = {194105},\n  doi = {10.1063/1.2921797},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/128/19/10.1063/1.2921797}\n}\n", "Henderson2008_194105"),
        ]),
    :hyb_gga_xc_hjs_b97x => IdentifierText(
        "HJS hybrid screened exchange B97x version",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :hyb_cam, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("T. M. Henderson, B. G. Janesko, and G. E. Scuseria,  J. Chem. Phys. 128, 194105 (2008)", "10.1063/1.2921797", "@article{Henderson2008_194105,\n  author = {Henderson, T. M. and Janesko, B. G. and Scuseria, G. E.},\n  title = {Generalized gradient approximation model exchange holes for range-separated hybrids},\n  journal = {J. Chem. Phys.},\n  year = {2008},\n  volume = {128},\n  number = {19},\n  pages = {194105},\n  doi = {10.1063/1.2921797},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/128/19/10.1063/1.2921797}\n}\n", "Henderson2008_194105"),
        ]),
    :hyb_gga_xc_hjs_pbe => IdentifierText(
        "HJS hybrid screened exchange PBE version",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :hyb_cam, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("T. M. Henderson, B. G. Janesko, and G. E. Scuseria,  J. Chem. Phys. 128, 194105 (2008)", "10.1063/1.2921797", "@article{Henderson2008_194105,\n  author = {Henderson, T. M. and Janesko, B. G. and Scuseria, G. E.},\n  title = {Generalized gradient approximation model exchange holes for range-separated hybrids},\n  journal = {J. Chem. Phys.},\n  year = {2008},\n  volume = {128},\n  number = {19},\n  pages = {194105},\n  doi = {10.1063/1.2921797},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/128/19/10.1063/1.2921797}\n}\n", "Henderson2008_194105"),
        ]),
    :hyb_gga_xc_hjs_pbe_sol => IdentifierText(
        "HJS hybrid screened exchange PBE_SOL version",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :hyb_cam, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("T. M. Henderson, B. G. Janesko, and G. E. Scuseria,  J. Chem. Phys. 128, 194105 (2008)", "10.1063/1.2921797", "@article{Henderson2008_194105,\n  author = {Henderson, T. M. and Janesko, B. G. and Scuseria, G. E.},\n  title = {Generalized gradient approximation model exchange holes for range-separated hybrids},\n  journal = {J. Chem. Phys.},\n  year = {2008},\n  volume = {128},\n  number = {19},\n  pages = {194105},\n  doi = {10.1063/1.2921797},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/128/19/10.1063/1.2921797}\n}\n", "Henderson2008_194105"),
        ]),
    :hyb_gga_xc_hpbeint => IdentifierText(
        "hPBEint",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :development, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("E. Fabiano, L. A. Constantin, and F. Della Sala,  Int. J. Quantum Chem. 113, 673–682 (2013)", "10.1002/qua.24042", "@article{Fabiano2013_673,\n  author = {Fabiano, E. and Constantin, Lucian A. and Della Sala, F.},\n  title = {Testing the broad applicability of the {PBEint} {GGA} functional and its one-parameter hybrid form},\n  journal = {Int. J. Quantum Chem.},\n  volume = {113},\n  number = {5},\n  pages = {673--682},\n  year = {2013},\n  publisher = {Wiley Subscription Services, Inc., A Wiley Company},\n  issn = {1097-461X},\n  doi = {10.1002/qua.24042},\n  url = {https://doi.org/10.1002/qua.24042}\n}\n", "Fabiano2013_673"),
        ]),
    :hyb_gga_xc_hse03 => IdentifierText(
        "HSE03",
        (:have_exc, :have_vxc, :have_fxc, :dim3, :hyb_cam, :enforce_fhc, :on_host),
        (0, 1, 2),
        LibxcReference[
            LibxcReference("J. Heyd, G. E. Scuseria, and M. Ernzerhof,  J. Chem. Phys. 118, 8207 (2003)", "10.1063/1.1564060", "@article{Heyd2003_8207,\n  author = {Heyd, J. and Scuseria, G. E. and Ernzerhof, M.},\n  title = {Hybrid functionals based on a screened {Coulomb} potential},\n  journal = {J. Chem. Phys.},\n  year = {2003},\n  volume = {118},\n  number = {18},\n  pages = {8207},\n  doi = {10.1063/1.1564060},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/118/18/10.1063/1.1564060}\n}\n", "Heyd2003_8207"),
            LibxcReference("J. Heyd, G. E. Scuseria, and M. Ernzerhof,  J. Chem. Phys. 124, 219906 (2006)", "10.1063/1.2204597", "@article{Heyd2006_219906,\n  author = {Heyd, J. and Scuseria, G. E. and Ernzerhof, M.},\n  title = {Erratum: \"{Hybrid} functionals based on a screened {Coulomb} potential\" [{J.} {Chem.} {Phys.} 118, 8207 (2003)]},\n  journal = {J. Chem. Phys.},\n  year = {2006},\n  volume = {124},\n  number = {21},\n  pages = {219906},\n  doi = {10.1063/1.2204597},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/124/21/10.1063/1.2204597}\n}\n", "Heyd2006_219906"),
        ]),
    :hyb_gga_xc_hse06 => IdentifierText(
        "HSE06",
        (:have_exc, :have_vxc, :have_fxc, :dim3, :hyb_cam, :enforce_fhc, :on_host),
        (0, 1, 2),
        LibxcReference[
            LibxcReference("J. Heyd, G. E. Scuseria, and M. Ernzerhof,  J. Chem. Phys. 118, 8207 (2003)", "10.1063/1.1564060", "@article{Heyd2003_8207,\n  author = {Heyd, J. and Scuseria, G. E. and Ernzerhof, M.},\n  title = {Hybrid functionals based on a screened {Coulomb} potential},\n  journal = {J. Chem. Phys.},\n  year = {2003},\n  volume = {118},\n  number = {18},\n  pages = {8207},\n  doi = {10.1063/1.1564060},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/118/18/10.1063/1.1564060}\n}\n", "Heyd2003_8207"),
            LibxcReference("J. Heyd, G. E. Scuseria, and M. Ernzerhof,  J. Chem. Phys. 124, 219906 (2006)", "10.1063/1.2204597", "@article{Heyd2006_219906,\n  author = {Heyd, J. and Scuseria, G. E. and Ernzerhof, M.},\n  title = {Erratum: \"{Hybrid} functionals based on a screened {Coulomb} potential\" [{J.} {Chem.} {Phys.} 118, 8207 (2003)]},\n  journal = {J. Chem. Phys.},\n  year = {2006},\n  volume = {124},\n  number = {21},\n  pages = {219906},\n  doi = {10.1063/1.2204597},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/124/21/10.1063/1.2204597}\n}\n", "Heyd2006_219906"),
            LibxcReference("A. V. Krukau, O. A. Vydrov, A. F. Izmaylov, and G. E. Scuseria,  J. Chem. Phys. 125, 224106 (2006)", "10.1063/1.2404663", "@article{Krukau2006_224106,\n  author = {Krukau, A. V. and Vydrov, O. A. and Izmaylov, A. F. and Scuseria, G. E.},\n  title = {Influence of the exchange screening parameter on the performance of screened hybrid functionals},\n  journal = {J. Chem. Phys.},\n  year = {2006},\n  volume = {125},\n  number = {22},\n  pages = {224106},\n  doi = {10.1063/1.2404663},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/125/22/10.1063/1.2404663}\n}\n", "Krukau2006_224106"),
        ]),
    :hyb_gga_xc_hse12 => IdentifierText(
        "HSE12",
        (:have_exc, :have_vxc, :have_fxc, :dim3, :hyb_cam, :enforce_fhc, :on_host),
        (0, 1, 2),
        LibxcReference[
            LibxcReference("J. E. Moussa, P. A. Schultz, and J. R. Chelikowsky,  J. Chem. Phys. 136, 204117 (2012)", "10.1063/1.4722993", "@article{Moussa2012_204117,\n  author = {Moussa, Jonathan E. and Schultz, Peter A. and Chelikowsky, James R.},\n  title = {Analysis of the {Heyd}--{Scuseria}--{Ernzerhof} density functional parameter space},\n  journal = {J. Chem. Phys.},\n  year = {2012},\n  volume = {136},\n  number = {20},\n  pages = {204117},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/136/20/10.1063/1.4722993},\n  doi = {10.1063/1.4722993}\n}\n", "Moussa2012_204117"),
        ]),
    :hyb_gga_xc_hse12s => IdentifierText(
        "HSE12 (short-range version)",
        (:have_exc, :have_vxc, :have_fxc, :dim3, :hyb_cam, :enforce_fhc, :on_host),
        (0, 1, 2),
        LibxcReference[
            LibxcReference("J. E. Moussa, P. A. Schultz, and J. R. Chelikowsky,  J. Chem. Phys. 136, 204117 (2012)", "10.1063/1.4722993", "@article{Moussa2012_204117,\n  author = {Moussa, Jonathan E. and Schultz, Peter A. and Chelikowsky, James R.},\n  title = {Analysis of the {Heyd}--{Scuseria}--{Ernzerhof} density functional parameter space},\n  journal = {J. Chem. Phys.},\n  year = {2012},\n  volume = {136},\n  number = {20},\n  pages = {204117},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/136/20/10.1063/1.4722993},\n  doi = {10.1063/1.4722993}\n}\n", "Moussa2012_204117"),
        ]),
    :hyb_gga_xc_hse_sol => IdentifierText(
        "HSEsol",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :hyb_cam, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("L. Schimka, J. Harl, and G. Kresse,  J. Chem. Phys. 134, 024116 (2011)", "10.1063/1.3524336", "@article{Schimka2011_024116,\n  author = {Schimka, Laurids and Harl, Judith and Kresse, Georg},\n  title = {Improved hybrid functional for solids: The {HSEsol} functional},\n  journal = {J. Chem. Phys.},\n  year = {2011},\n  volume = {134},\n  number = {2},\n  pages = {024116},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/134/2/10.1063/1.3524336},\n  doi = {10.1063/1.3524336}\n}\n", "Schimka2011_024116"),
        ]),
    :hyb_gga_xc_kmlyp => IdentifierText(
        "Kang-Musgrave hybrid",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("J. K. Kang and C. B. Musgrave,  J. Chem. Phys. 115, 11040–11051 (2001)", "10.1063/1.1415079", "@article{Kang2001_11040,\n  author = {Kang, Jeung Ku and Musgrave, Charles B.},\n  title = {Prediction of transition state barriers and enthalpies of reaction by a new hybrid density-functional approximation},\n  journal = {J. Chem. Phys.},\n  volume = {115},\n  number = {24},\n  pages = {11040--11051},\n  year = {2001},\n  doi = {10.1063/1.1415079},\n  url = {https://doi.org/10.1063/1.1415079}\n}\n", "Kang2001_11040"),
        ]),
    :hyb_gga_xc_lb07 => IdentifierText(
        "Livshits and Baer, empirical functional also used for IP tuning",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :hyb_cam, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("E. Livshits and R. Baer,  Phys. Chem. Chem. Phys. 9, 2932–2941 (2007)", "10.1039/B617919C", "@article{Livshits2007_2932,\n  author = {Livshits, Ester and Baer, Roi},\n  title = {A well-tempered density functional theory of electrons in molecules},\n  journal = {Phys. Chem. Chem. Phys.},\n  year = {2007},\n  volume = {9},\n  issue = {23},\n  pages = {2932--2941},\n  publisher = {The Royal Society of Chemistry},\n  doi = {10.1039/B617919C},\n  url = {https://doi.org/10.1039/B617919C}\n}\n", "Livshits2007_2932"),
        ]),
    :hyb_gga_xc_lc_blyp => IdentifierText(
        "LC version of BLYP",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :hyb_cam, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("Y. Tawada, T. Tsuneda, S. Yanagisawa, T. Yanai, and K. Hirao,  J. Chem. Phys. 120, 8425–8433 (2004)", "10.1063/1.1688752", "@article{Tawada2004_8425,\n  author = {Tawada, Yoshihiro and Tsuneda, Takao and Yanagisawa, Susumu and Yanai, Takeshi and Hirao, Kimihiko},\n  title = {A long-range-corrected time-dependent density functional theory},\n  journal = {J. Chem. Phys.},\n  volume = {120},\n  number = {18},\n  pages = {8425--8433},\n  year = {2004},\n  doi = {10.1063/1.1688752},\n  url = {https://doi.org/10.1063/1.1688752}\n}\n", "Tawada2004_8425"),
        ]),
    :hyb_gga_xc_lc_blyp_ea => IdentifierText(
        "LC version of BLYP for electron affinities",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :hyb_cam, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("L. N. Anderson, M. B. Oviedo, and B. M. Wong,  J. Chem. Theory Comput. 13, 1656–1666 (2017)", "10.1021/acs.jctc.6b01249", "@article{Anderson2017_1656,\n  author = {Anderson, Lindsey N. and Oviedo, M. Bel\\'{e}n and Wong, Bryan M.},\n  title = {Accurate Electron Affinities and Orbital Energies of Anions from a Nonempirically Tuned Range-Separated Density Functional Theory Approach},\n  journal = {J. Chem. Theory Comput.},\n  volume = {13},\n  number = {4},\n  pages = {1656--1666},\n  year = {2017},\n  doi = {10.1021/acs.jctc.6b01249},\n  url = {https://doi.org/10.1021/acs.jctc.6b01249}\n}\n", "Anderson2017_1656"),
            LibxcReference("Y. Tawada, T. Tsuneda, S. Yanagisawa, T. Yanai, and K. Hirao,  J. Chem. Phys. 120, 8425–8433 (2004)", "10.1063/1.1688752", "@article{Tawada2004_8425,\n  author = {Tawada, Yoshihiro and Tsuneda, Takao and Yanagisawa, Susumu and Yanai, Takeshi and Hirao, Kimihiko},\n  title = {A long-range-corrected time-dependent density functional theory},\n  journal = {J. Chem. Phys.},\n  volume = {120},\n  number = {18},\n  pages = {8425--8433},\n  year = {2004},\n  doi = {10.1063/1.1688752},\n  url = {https://doi.org/10.1063/1.1688752}\n}\n", "Tawada2004_8425"),
        ]),
    :hyb_gga_xc_lc_blypr => IdentifierText(
        "LC version of BLYP with correlation only in the short range",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :hyb_cam, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("W. Ai, W.-H. Fang, and N. Q. Su,  J. Phys. Chem. Lett. 12, 1207–1213 (2021)", "10.1021/acs.jpclett.0c03621", "@article{Ai2021_1207,\n  author = {Ai, Wenna and Fang, Wei-Hai and Su, Neil Qiang},\n  title = {The Role of Range-Separated Correlation in Long-Range Corrected Hybrid Functionals},\n  journal = {J. Phys. Chem. Lett.},\n  volume = {12},\n  pages = {1207--1213},\n  year = {2021},\n  doi = {10.1021/acs.jpclett.0c03621},\n  url = {https://doi.org/10.1021/acs.jpclett.0c03621}\n}\n", "Ai2021_1207"),
        ]),
    :hyb_gga_xc_lc_bop => IdentifierText(
        "LC version of B88",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :hyb_cam, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("J.-W. Song, T. Hirosawa, T. Tsuneda, and K. Hirao,  J. Chem. Phys. 126, 154105 (2007)", "10.1063/1.2721532", "@article{Song2007_154105,\n  author = {Song, Jong-Won and Hirosawa, Tsuyoshi and Tsuneda, Takao and Hirao, Kimihiko},\n  title = {Long-range corrected density functional calculations of chemical reactions: Redetermination of parameter},\n  journal = {J. Chem. Phys.},\n  volume = {126},\n  number = {15},\n  pages = {154105},\n  year = {2007},\n  doi = {10.1063/1.2721532}\n}\n", "Song2007_154105"),
        ]),
    :hyb_gga_xc_lc_pbeop => IdentifierText(
        "LC version of PBE",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :hyb_cam, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("Y. Tawada, T. Tsuneda, S. Yanagisawa, T. Yanai, and K. Hirao,  J. Chem. Phys. 120, 8425–8433 (2004)", "10.1063/1.1688752", "@article{Tawada2004_8425,\n  author = {Tawada, Yoshihiro and Tsuneda, Takao and Yanagisawa, Susumu and Yanai, Takeshi and Hirao, Kimihiko},\n  title = {A long-range-corrected time-dependent density functional theory},\n  journal = {J. Chem. Phys.},\n  volume = {120},\n  number = {18},\n  pages = {8425--8433},\n  year = {2004},\n  doi = {10.1063/1.1688752},\n  url = {https://doi.org/10.1063/1.1688752}\n}\n", "Tawada2004_8425"),
        ]),
    :hyb_gga_xc_lc_qtp => IdentifierText(
        "CAM-B3LYP retuned using ionization potentials of water",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :hyb_cam, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("R. L. A. Haiduke and R. J. Bartlett,  J. Chem. Phys. 148, 184106 (2018)", "10.1063/1.5025723", "@article{Haiduke2018_184106,\n  author = {Haiduke, Roberto Luiz A. and Bartlett, Rodney J.},\n  title = {Non-empirical exchange-correlation parameterizations based on exact conditions from correlated orbital theory},\n  journal = {J. Chem. Phys.},\n  volume = {148},\n  number = {18},\n  pages = {184106},\n  year = {2018},\n  doi = {10.1063/1.5025723},\n  url = {https://doi.org/10.1063/1.5025723}\n}\n", "Haiduke2018_184106"),
        ]),
    :hyb_gga_xc_lc_vv10 => IdentifierText(
        "Vydrov and Van Voorhis",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :hyb_cam, :vv10, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("O. A. Vydrov and T. Van Voorhis,  J. Chem. Phys. 133, 244103 (2010)", "10.1063/1.3521275", "@article{Vydrov2010_244103,\n  author = {Vydrov, Oleg A. and Van Voorhis, Troy},\n  title = {Nonlocal van der {Waals} density functional: The simpler the better},\n  journal = {J. Chem. Phys.},\n  volume = {133},\n  number = {24},\n  pages = {244103},\n  year = {2010},\n  doi = {10.1063/1.3521275},\n  url = {https://doi.org/10.1063/1.3521275}\n}\n", "Vydrov2010_244103"),
        ]),
    :hyb_gga_xc_lc_wpbe => IdentifierText(
        "Long-range corrected PBE (LC-wPBE) by Vydrov and Scuseria",
        (:have_exc, :have_vxc, :have_fxc, :dim3, :hyb_cam, :enforce_fhc, :on_host),
        (0, 1, 2),
        LibxcReference[
            LibxcReference("O. A. Vydrov and G. E. Scuseria,  J. Chem. Phys. 125, 234109 (2006)", "10.1063/1.2409292", "@article{Vydrov2006_234109,\n  author = {Vydrov, Oleg A. and Scuseria, Gustavo E.},\n  title = {Assessment of a long-range corrected hybrid functional},\n  journal = {J. Chem. Phys.},\n  volume = {125},\n  number = {23},\n  pages = {234109},\n  year = {2006},\n  doi = {10.1063/1.2409292},\n  url = {https://doi.org/10.1063/1.2409292}\n}\n", "Vydrov2006_234109"),
        ]),
    :hyb_gga_xc_lc_wpbe08_whs => IdentifierText(
        "Long-range corrected PBE (LC-wPBE) by Weintraub, Henderson and Scuseria",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :hyb_cam, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("E. Weintraub, T. M. Henderson, and G. E. Scuseria,  J. Chem. Theory Comput. 5, 754–762 (2009)", "10.1021/ct800530u", "@article{Weintraub2009_754,\n  author = {Weintraub, E. and Henderson, T. M. and Scuseria, G. E.},\n  title = {Long-Range-Corrected Hybrids Based on a New Model Exchange Hole},\n  journal = {J. Chem. Theory Comput.},\n  volume = {5},\n  number = {4},\n  pages = {754--762},\n  year = {2009},\n  doi = {10.1021/ct800530u},\n  url = {http://pubs.acs.org/doi/abs/10.1021/ct800530u}\n}\n", "Weintraub2009_754"),
            LibxcReference("T. M. Henderson, B. G. Janesko, and G. E. Scuseria,  J. Chem. Phys. 128, 194105 (2008)", "10.1063/1.2921797", "@article{Henderson2008_194105,\n  author = {Henderson, T. M. and Janesko, B. G. and Scuseria, G. E.},\n  title = {Generalized gradient approximation model exchange holes for range-separated hybrids},\n  journal = {J. Chem. Phys.},\n  year = {2008},\n  volume = {128},\n  number = {19},\n  pages = {194105},\n  doi = {10.1063/1.2921797},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/128/19/10.1063/1.2921797}\n}\n", "Henderson2008_194105"),
        ]),
    :hyb_gga_xc_lc_wpbe_whs => IdentifierText(
        "Long-range corrected PBE (LC-wPBE) by Weintraub, Henderson and Scuseria",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :hyb_cam, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("E. Weintraub, T. M. Henderson, and G. E. Scuseria,  J. Chem. Theory Comput. 5, 754–762 (2009)", "10.1021/ct800530u", "@article{Weintraub2009_754,\n  author = {Weintraub, E. and Henderson, T. M. and Scuseria, G. E.},\n  title = {Long-Range-Corrected Hybrids Based on a New Model Exchange Hole},\n  journal = {J. Chem. Theory Comput.},\n  volume = {5},\n  number = {4},\n  pages = {754--762},\n  year = {2009},\n  doi = {10.1021/ct800530u},\n  url = {http://pubs.acs.org/doi/abs/10.1021/ct800530u}\n}\n", "Weintraub2009_754"),
            LibxcReference("T. M. Henderson, B. G. Janesko, and G. E. Scuseria,  J. Chem. Phys. 128, 194105 (2008)", "10.1063/1.2921797", "@article{Henderson2008_194105,\n  author = {Henderson, T. M. and Janesko, B. G. and Scuseria, G. E.},\n  title = {Generalized gradient approximation model exchange holes for range-separated hybrids},\n  journal = {J. Chem. Phys.},\n  year = {2008},\n  volume = {128},\n  number = {19},\n  pages = {194105},\n  doi = {10.1063/1.2921797},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/128/19/10.1063/1.2921797}\n}\n", "Henderson2008_194105"),
        ]),
    :hyb_gga_xc_lc_wpbeh_whs => IdentifierText(
        "Long-range corrected short-range hybrid PBE (LC-wPBE) by Weintraub, Henderson and Scuseria",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :hyb_cam, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("E. Weintraub, T. M. Henderson, and G. E. Scuseria,  J. Chem. Theory Comput. 5, 754–762 (2009)", "10.1021/ct800530u", "@article{Weintraub2009_754,\n  author = {Weintraub, E. and Henderson, T. M. and Scuseria, G. E.},\n  title = {Long-Range-Corrected Hybrids Based on a New Model Exchange Hole},\n  journal = {J. Chem. Theory Comput.},\n  volume = {5},\n  number = {4},\n  pages = {754--762},\n  year = {2009},\n  doi = {10.1021/ct800530u},\n  url = {http://pubs.acs.org/doi/abs/10.1021/ct800530u}\n}\n", "Weintraub2009_754"),
            LibxcReference("T. M. Henderson, B. G. Janesko, and G. E. Scuseria,  J. Chem. Phys. 128, 194105 (2008)", "10.1063/1.2921797", "@article{Henderson2008_194105,\n  author = {Henderson, T. M. and Janesko, B. G. and Scuseria, G. E.},\n  title = {Generalized gradient approximation model exchange holes for range-separated hybrids},\n  journal = {J. Chem. Phys.},\n  year = {2008},\n  volume = {128},\n  number = {19},\n  pages = {194105},\n  doi = {10.1063/1.2921797},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/128/19/10.1063/1.2921797}\n}\n", "Henderson2008_194105"),
        ]),
    :hyb_gga_xc_lc_wpbesol_whs => IdentifierText(
        "Long-range corrected PBE (LC-wPBE) by Weintraub, Henderson and Scuseria",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :hyb_cam, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("E. Weintraub, T. M. Henderson, and G. E. Scuseria,  J. Chem. Theory Comput. 5, 754–762 (2009)", "10.1021/ct800530u", "@article{Weintraub2009_754,\n  author = {Weintraub, E. and Henderson, T. M. and Scuseria, G. E.},\n  title = {Long-Range-Corrected Hybrids Based on a New Model Exchange Hole},\n  journal = {J. Chem. Theory Comput.},\n  volume = {5},\n  number = {4},\n  pages = {754--762},\n  year = {2009},\n  doi = {10.1021/ct800530u},\n  url = {http://pubs.acs.org/doi/abs/10.1021/ct800530u}\n}\n", "Weintraub2009_754"),
            LibxcReference("T. M. Henderson, B. G. Janesko, and G. E. Scuseria,  J. Chem. Phys. 128, 194105 (2008)", "10.1063/1.2921797", "@article{Henderson2008_194105,\n  author = {Henderson, T. M. and Janesko, B. G. and Scuseria, G. E.},\n  title = {Generalized gradient approximation model exchange holes for range-separated hybrids},\n  journal = {J. Chem. Phys.},\n  year = {2008},\n  volume = {128},\n  number = {19},\n  pages = {194105},\n  doi = {10.1063/1.2921797},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/128/19/10.1063/1.2921797}\n}\n", "Henderson2008_194105"),
        ]),
    :hyb_gga_xc_lcy_blyp => IdentifierText(
        "LCY version of BLYP",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :hyb_camy, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("Y. Akinaga and S. Ten-no,  Chem. Phys. Lett. 462, 348 (2008)", "10.1016/j.cplett.2008.07.103", "@article{Akinaga2008_348,\n  author = {Akinaga, Y. and Ten-no, S.},\n  title = {Range-separation by the {Yukawa} potential in long-range corrected density functional theory with {Gaussian}-type basis functions},\n  journal = {Chem. Phys. Lett.},\n  volume = {462},\n  number = {4--6},\n  pages = {348},\n  year = {2008},\n  issn = {0009-2614},\n  doi = {10.1016/j.cplett.2008.07.103},\n  url = {http://www.sciencedirect.com/science/article/pii/S0009261408010609}\n}\n", "Akinaga2008_348"),
            LibxcReference("M. Seth, T. Ziegler, M. Steinmetz, and S. Grimme,  J. Chem. Theory Comput. 9, 2286–2299 (2013)", "10.1021/ct301112m", "@article{Seth2013_2286,\n  author = {Seth, Michael and Ziegler, Tom and Steinmetz, Marc and Grimme, Stefan},\n  title = {Modeling Transition Metal Reactions with Range-Separated Functionals},\n  journal = {J. Chem. Theory Comput.},\n  volume = {9},\n  number = {5},\n  pages = {2286--2299},\n  year = {2013},\n  doi = {10.1021/ct301112m},\n  url = {https://doi.org/10.1021/ct301112m}\n}\n", "Seth2013_2286"),
        ]),
    :hyb_gga_xc_lcy_pbe => IdentifierText(
        "LCY version of PBE",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :hyb_camy, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("M. Seth and T. Ziegler,  J. Chem. Theory Comput. 8, 901–907 (2012)", "10.1021/ct300006h", "@article{Seth2012_901,\n  author = {Seth, Michael and Ziegler, Tom},\n  title = {Range-Separated Exchange Functionals with {Slater}-Type Functions},\n  journal = {J. Chem. Theory Comput.},\n  volume = {8},\n  number = {3},\n  pages = {901--907},\n  year = {2012},\n  doi = {10.1021/ct300006h},\n  url = {https://doi.org/10.1021/ct300006h}\n}\n", "Seth2012_901"),
            LibxcReference("M. Seth, T. Ziegler, M. Steinmetz, and S. Grimme,  J. Chem. Theory Comput. 9, 2286–2299 (2013)", "10.1021/ct301112m", "@article{Seth2013_2286,\n  author = {Seth, Michael and Ziegler, Tom and Steinmetz, Marc and Grimme, Stefan},\n  title = {Modeling Transition Metal Reactions with Range-Separated Functionals},\n  journal = {J. Chem. Theory Comput.},\n  volume = {9},\n  number = {5},\n  pages = {2286--2299},\n  year = {2013},\n  doi = {10.1021/ct301112m},\n  url = {https://doi.org/10.1021/ct301112m}\n}\n", "Seth2013_2286"),
        ]),
    :hyb_gga_xc_lrc_wpbe => IdentifierText(
        "Long-range corrected PBE (LRC-wPBE) by Rohrdanz, Martins and Herbert",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :hyb_cam, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("M. A. Rohrdanz, K. M. Martins, and J. M. Herbert,  J. Chem. Phys. 130, 054112 (2009)", "10.1063/1.3073302", "@article{Rohrdanz2009_054112,\n  author = {Rohrdanz, Mary A. and Martins, Katie M. and Herbert, John M.},\n  title = {A long-range-corrected density functional that performs well for both ground-state properties and time-dependent density functional theory excitation energies, including charge-transfer excited states},\n  journal = {J. Chem. Phys.},\n  year = {2009},\n  volume = {130},\n  number = {5},\n  eid = {054112},\n  pages = {054112},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/130/5/10.1063/1.3073302},\n  doi = {10.1063/1.3073302}\n}\n", "Rohrdanz2009_054112"),
        ]),
    :hyb_gga_xc_lrc_wpbeh => IdentifierText(
        "Long-range corrected short-range hybrid PBE (LRC-wPBEh) by Rohrdanz, Martins and Herbert",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :hyb_cam, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("M. A. Rohrdanz, K. M. Martins, and J. M. Herbert,  J. Chem. Phys. 130, 054112 (2009)", "10.1063/1.3073302", "@article{Rohrdanz2009_054112,\n  author = {Rohrdanz, Mary A. and Martins, Katie M. and Herbert, John M.},\n  title = {A long-range-corrected density functional that performs well for both ground-state properties and time-dependent density functional theory excitation energies, including charge-transfer excited states},\n  journal = {J. Chem. Phys.},\n  year = {2009},\n  volume = {130},\n  number = {5},\n  eid = {054112},\n  pages = {054112},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/130/5/10.1063/1.3073302},\n  doi = {10.1063/1.3073302}\n}\n", "Rohrdanz2009_054112"),
        ]),
    :hyb_gga_xc_mb3lyp_rc04 => IdentifierText(
        "B3LYP with RC04 LDA",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("V. Tognetti, P. Cortona, and C. Adamo,  Chem. Phys. Lett. 439, 381 (2007)", "10.1016/j.cplett.2007.03.081", "@article{Tognetti2007_381,\n  author = {Tognetti, V. and Cortona, P. and Adamo, C.},\n  title = {The performances of a parameter-free local correlation functional: The {Ragot}--{Cortona} model},\n  journal = {Chem. Phys. Lett.},\n  volume = {439},\n  number = {4--6},\n  pages = {381},\n  year = {2007},\n  issn = {0009-2614},\n  doi = {10.1016/j.cplett.2007.03.081},\n  url = {http://www.sciencedirect.com/science/article/pii/S0009261407003600}\n}\n", "Tognetti2007_381"),
        ]),
    :hyb_gga_xc_mcam_b3lyp => IdentifierText(
        "Modified CAM-B3LYP by Day, Nguyen and Pachter",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :hyb_cam, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("P. N. Day, K. A. Nguyen, and R. Pachter,  J. Chem. Phys. 125, 094103 (2006)", "10.1063/1.2338031", "@article{Day2006_094103,\n  author = {Day, Paul N. and Nguyen, Kiet A. and Pachter, Ruth},\n  title = {Calculation of two-photon absorption spectra of donor-\$\\pi\$-acceptor compounds in solution using quadratic response time-dependent density functional theory},\n  journal = {J. Chem. Phys.},\n  volume = {125},\n  number = {9},\n  pages = {094103},\n  year = {2006},\n  doi = {10.1063/1.2338031},\n  url = {https://doi.org/10.1063/1.2338031}\n}\n", "Day2006_094103"),
        ]),
    :hyb_gga_xc_mpw1k => IdentifierText(
        "mPW1K",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("B. J. Lynch, P. L. Fast, M. Harris, and D. G. Truhlar,  J. Phys. Chem. A 104, 4811 (2000)", "10.1021/jp000497z", "@article{Lynch2000_4811,\n  author = {Lynch, B. J. and Fast, P. L. and Harris, M. and Truhlar, D. G.},\n  title = {Adiabatic Connection for Kinetics},\n  journal = {J. Phys. Chem. A},\n  volume = {104},\n  number = {21},\n  pages = {4811},\n  year = {2000},\n  doi = {10.1021/jp000497z},\n  url = {http://pubs.acs.org/doi/abs/10.1021/jp000497z}\n}\n", "Lynch2000_4811"),
        ]),
    :hyb_gga_xc_mpw1lyp => IdentifierText(
        "mPW1LYP",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("C. Adamo and V. Barone,  J. Chem. Phys. 108, 664 (1998)", "10.1063/1.475428", "@article{Adamo1998_664,\n  author = {Adamo, C. and Barone, V.},\n  title = {Exchange functionals with improved long-range behavior and adiabatic connection methods without adjustable parameters: The {mPW} and {mPW1PW} models},\n  journal = {J. Chem. Phys.},\n  year = {1998},\n  volume = {108},\n  number = {2},\n  pages = {664},\n  doi = {10.1063/1.475428},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/108/2/10.1063/1.475428}\n}\n", "Adamo1998_664"),
        ]),
    :hyb_gga_xc_mpw1pbe => IdentifierText(
        "mPW1PBE",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("C. Adamo and V. Barone,  J. Chem. Phys. 108, 664 (1998)", "10.1063/1.475428", "@article{Adamo1998_664,\n  author = {Adamo, C. and Barone, V.},\n  title = {Exchange functionals with improved long-range behavior and adiabatic connection methods without adjustable parameters: The {mPW} and {mPW1PW} models},\n  journal = {J. Chem. Phys.},\n  year = {1998},\n  volume = {108},\n  number = {2},\n  pages = {664},\n  doi = {10.1063/1.475428},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/108/2/10.1063/1.475428}\n}\n", "Adamo1998_664"),
        ]),
    :hyb_gga_xc_mpw1pw => IdentifierText(
        "mPW1PW",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("C. Adamo and V. Barone,  J. Chem. Phys. 108, 664 (1998)", "10.1063/1.475428", "@article{Adamo1998_664,\n  author = {Adamo, C. and Barone, V.},\n  title = {Exchange functionals with improved long-range behavior and adiabatic connection methods without adjustable parameters: The {mPW} and {mPW1PW} models},\n  journal = {J. Chem. Phys.},\n  year = {1998},\n  volume = {108},\n  number = {2},\n  pages = {664},\n  doi = {10.1063/1.475428},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/108/2/10.1063/1.475428}\n}\n", "Adamo1998_664"),
        ]),
    :hyb_gga_xc_mpw3lyp => IdentifierText(
        "MPW3LYP",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("Y. Zhao and D. G. Truhlar,  J. Phys. Chem. A 108, 6908 (2004)", "10.1021/jp048147q", "@article{Zhao2004_6908,\n  author = {Zhao, Y. and Truhlar, D. G.},\n  title = {Hybrid Meta Density Functional Theory Methods for Thermochemistry, Thermochemical Kinetics, and Noncovalent Interactions: The {mPW1B95} and {mPWB1K} Models and Comparative Assessments for Hydrogen Bonding and van der Waals Interactions},\n  journal = {J. Phys. Chem. A},\n  volume = {108},\n  number = {33},\n  pages = {6908},\n  year = {2004},\n  doi = {10.1021/jp048147q},\n  url = {http://pubs.acs.org/doi/abs/10.1021/jp048147q}\n}\n", "Zhao2004_6908"),
        ]),
    :hyb_gga_xc_mpw3pw => IdentifierText(
        "MPW3PW of Adamo & Barone",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("C. Adamo and V. Barone,  J. Chem. Phys. 108, 664 (1998)", "10.1063/1.475428", "@article{Adamo1998_664,\n  author = {Adamo, C. and Barone, V.},\n  title = {Exchange functionals with improved long-range behavior and adiabatic connection methods without adjustable parameters: The {mPW} and {mPW1PW} models},\n  journal = {J. Chem. Phys.},\n  year = {1998},\n  volume = {108},\n  number = {2},\n  pages = {664},\n  doi = {10.1063/1.475428},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/108/2/10.1063/1.475428}\n}\n", "Adamo1998_664"),
        ]),
    :hyb_gga_xc_mpwlyp1m => IdentifierText(
        "MPW with 1 par. for metals/LYP",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("N. E. Schultz, Y. Zhao, and D. G. Truhlar,  J. Phys. Chem. A 109, 11127 (2005)", "10.1021/jp0539223", "@article{Schultz2005_11127,\n  author = {Schultz, N. E. and Zhao, Y. and Truhlar, D. G.},\n  title = {Density Functionals for Inorganometallic and Organometallic Chemistry},\n  journal = {J. Phys. Chem. A},\n  volume = {109},\n  number = {49},\n  pages = {11127},\n  year = {2005},\n  doi = {10.1021/jp0539223},\n  url = {http://pubs.acs.org/doi/abs/10.1021/jp0539223}\n}\n", "Schultz2005_11127"),
        ]),
    :hyb_gga_xc_o3lyp => IdentifierText(
        "O3LYP",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("W.-M. Hoe, A. J. Cohen, and N. C. Handy,  Chem. Phys. Lett. 341, 319–328 (2001)", "10.1016/S0009-2614(01)00581-4", "@article{Hoe2001_319,\n  author = {Hoe, Wee-Meng and Cohen, Aron J. and Handy, Nicholas C.},\n  title = {Assessment of a new local exchange functional {OPTX}},\n  journal = {Chem. Phys. Lett.},\n  volume = {341},\n  number = {3},\n  pages = {319--328},\n  year = {2001},\n  issn = {0009-2614},\n  doi = {10.1016/S0009-2614(01)00581-4},\n  url = {https://www.sciencedirect.com/science/article/pii/S0009261401005814}\n}\n", "Hoe2001_319"),
            LibxcReference("A. J. Cohen and N. C. Handy,  Mol. Phys. 99, 607 (2001)", "10.1080/00268970010023435", "@article{Cohen2001_607,\n  author = {Cohen, A. J. and Handy, N. C.},\n  title = {Dynamic correlation},\n  journal = {Mol. Phys.},\n  volume = {99},\n  number = {7},\n  pages = {607},\n  year = {2001},\n  doi = {10.1080/00268970010023435},\n  url = {http://www.tandfonline.com/doi/abs/10.1080/00268970010023435}\n}\n", "Cohen2001_607"),
        ]),
    :hyb_gga_xc_pbe0_13 => IdentifierText(
        "PBE0-1/3",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("P. Cortona,  J. Chem. Phys. 136, 086101 (2012)", "10.1063/1.3690462", "@article{Cortona2012_086101,\n  author = {Cortona, P.},\n  title = {Note: Theoretical mixing coefficients for hybrid functionals},\n  journal = {J. Chem. Phys.},\n  year = {2012},\n  volume = {136},\n  number = {8},\n  pages = {086101},\n  doi = {10.1063/1.3690462},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/136/8/10.1063/1.3690462}\n}\n", "Cortona2012_086101"),
        ]),
    :hyb_gga_xc_pbe38 => IdentifierText(
        "PBE38: PBE0 with 3/8 = 37.5% exact exchange",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("S. Grimme, J. Antony, S. Ehrlich, and H. Krieg,  J. Chem. Phys. 132, 154104 (2010)", "10.1063/1.3382344", "@article{Grimme2010_154104,\n  author = {Grimme, Stefan and Antony, Jens and Ehrlich, Stephan and Krieg, Helge},\n  title = {A consistent and accurate ab initio parametrization of density functional dispersion correction ({DFT}-{D}) for the 94 elements {H}--{Pu}},\n  journal = {J. Chem. Phys.},\n  volume = {132},\n  number = {15},\n  pages = {154104},\n  year = {2010},\n  doi = {10.1063/1.3382344},\n  url = {https://doi.org/10.1063/1.3382344}\n}\n", "Grimme2010_154104"),
        ]),
    :hyb_gga_xc_pbe50 => IdentifierText(
        "PBE50",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("Y. A. Bernard, Y. Shao, and A. I. Krylov,  J. Chem. Phys. 136, 204103 (2012)", "10.1063/1.4714499", "@article{Bernard2012_204103,\n  author = {Bernard, Yves A. and Shao, Yihan and Krylov, Anna I.},\n  title = {General formulation of spin-flip time-dependent density functional theory using non-collinear kernels: Theory, implementation, and benchmarks},\n  journal = {J. Chem. Phys.},\n  volume = {136},\n  number = {20},\n  pages = {204103},\n  year = {2012},\n  doi = {10.1063/1.4714499},\n  url = {https://doi.org/10.1063/1.4714499}\n}\n", "Bernard2012_204103"),
        ]),
    :hyb_gga_xc_pbe_2x => IdentifierText(
        "PBE-2X: PBE0 with 56% exact exchange",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("D. N. Tahchieva, D. Bakowies, R. Ramakrishnan, and O. A. von Lilienfeld,  J. Chem. Theory Comput. 14, 4806–4817 (2018)", "10.1021/acs.jctc.8b00174", "@article{Tahchieva2018_4806,\n  author = {Tahchieva, Diana N. and Bakowies, Dirk and Ramakrishnan, Raghunathan and von Lilienfeld, O. Anatole},\n  title = {Torsional Potentials of Glyoxal, Oxalyl Halides, and Their Thiocarbonyl Derivatives: Challenges for Popular Density Functional Approximations},\n  journal = {J. Chem. Theory Comput.},\n  volume = {14},\n  number = {9},\n  pages = {4806--4817},\n  year = {2018},\n  doi = {10.1021/acs.jctc.8b00174},\n  url = {https://doi.org/10.1021/acs.jctc.8b00174}\n}\n", "Tahchieva2018_4806"),
        ]),
    :hyb_gga_xc_pbe_mol0 => IdentifierText(
        "PBEmol0",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("J. M. del Campo, J. L. Gázquez, S. B. Trickey, and A. Vela,  J. Chem. Phys. 136, 104108 (2012)", "10.1063/1.3691197", "@article{delCampo2012_104108,\n  author = {del Campo, J. M. and G\\'{a}zquez, J. L. and Trickey, S. B. and Vela, A.},\n  title = {Non-empirical improvement of {PBE} and its hybrid {PBE0} for general description of molecular properties},\n  journal = {J. Chem. Phys.},\n  year = {2012},\n  volume = {136},\n  number = {10},\n  pages = {104108},\n  doi = {10.1063/1.3691197},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/136/10/10.1063/1.3691197}\n}\n", "delCampo2012_104108"),
        ]),
    :hyb_gga_xc_pbe_molb0 => IdentifierText(
        "PBEmolbeta0",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("J. M. del Campo, J. L. Gázquez, S. B. Trickey, and A. Vela,  J. Chem. Phys. 136, 104108 (2012)", "10.1063/1.3691197", "@article{delCampo2012_104108,\n  author = {del Campo, J. M. and G\\'{a}zquez, J. L. and Trickey, S. B. and Vela, A.},\n  title = {Non-empirical improvement of {PBE} and its hybrid {PBE0} for general description of molecular properties},\n  journal = {J. Chem. Phys.},\n  year = {2012},\n  volume = {136},\n  number = {10},\n  pages = {104108},\n  doi = {10.1063/1.3691197},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/136/10/10.1063/1.3691197}\n}\n", "delCampo2012_104108"),
        ]),
    :hyb_gga_xc_pbe_sol0 => IdentifierText(
        "PBEsol0",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("J. M. del Campo, J. L. Gázquez, S. B. Trickey, and A. Vela,  J. Chem. Phys. 136, 104108 (2012)", "10.1063/1.3691197", "@article{delCampo2012_104108,\n  author = {del Campo, J. M. and G\\'{a}zquez, J. L. and Trickey, S. B. and Vela, A.},\n  title = {Non-empirical improvement of {PBE} and its hybrid {PBE0} for general description of molecular properties},\n  journal = {J. Chem. Phys.},\n  year = {2012},\n  volume = {136},\n  number = {10},\n  pages = {104108},\n  doi = {10.1063/1.3691197},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/136/10/10.1063/1.3691197}\n}\n", "delCampo2012_104108"),
        ]),
    :hyb_gga_xc_pbeb0 => IdentifierText(
        "PBEbeta0",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("J. M. del Campo, J. L. Gázquez, S. B. Trickey, and A. Vela,  J. Chem. Phys. 136, 104108 (2012)", "10.1063/1.3691197", "@article{delCampo2012_104108,\n  author = {del Campo, J. M. and G\\'{a}zquez, J. L. and Trickey, S. B. and Vela, A.},\n  title = {Non-empirical improvement of {PBE} and its hybrid {PBE0} for general description of molecular properties},\n  journal = {J. Chem. Phys.},\n  year = {2012},\n  volume = {136},\n  number = {10},\n  pages = {104108},\n  doi = {10.1063/1.3691197},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/136/10/10.1063/1.3691197}\n}\n", "delCampo2012_104108"),
        ]),
    :hyb_gga_xc_pbeh => IdentifierText(
        "PBEH (PBE0)",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("C. Adamo and V. Barone,  J. Chem. Phys. 110, 6158 (1999)", "10.1063/1.478522", "@article{Adamo1999_6158,\n  author = {Adamo, C. and Barone, V.},\n  title = {Toward reliable density functional methods without adjustable parameters: The {PBE0} model},\n  journal = {J. Chem. Phys.},\n  year = {1999},\n  volume = {110},\n  number = {13},\n  pages = {6158},\n  doi = {10.1063/1.478522},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/110/13/10.1063/1.478522}\n}\n", "Adamo1999_6158"),
            LibxcReference("M. Ernzerhof and G. E. Scuseria,  J. Chem. Phys. 110, 5029 (1999)", "10.1063/1.478401", "@article{Ernzerhof1999_5029,\n  author = {Ernzerhof, M. and Scuseria, G. E.},\n  title = {Assessment of the {Perdew}--{Burke}--{Ernzerhof} exchange-correlation functional},\n  journal = {J. Chem. Phys.},\n  year = {1999},\n  volume = {110},\n  number = {11},\n  pages = {5029},\n  doi = {10.1063/1.478401},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/110/11/10.1063/1.478401}\n}\n", "Ernzerhof1999_5029"),
        ]),
    :hyb_gga_xc_qtp17 => IdentifierText(
        "Global hybrid for vertical ionization potentials",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("Y. Jin and R. J. Bartlett,  J. Chem. Phys. 149, 064111 (2018)", "10.1063/1.5038434", "@article{Jin2018_064111,\n  author = {Jin, Yifan and Bartlett, Rodney J.},\n  title = {Accurate computation of X-ray absorption spectra with ionization potential optimized global hybrid functional},\n  journal = {J. Chem. Phys.},\n  volume = {149},\n  number = {6},\n  pages = {064111},\n  year = {2018},\n  doi = {10.1063/1.5038434},\n  url = {https://doi.org/10.1063/1.5038434}\n}\n", "Jin2018_064111"),
        ]),
    :hyb_gga_xc_rcam_b3lyp => IdentifierText(
        "Similar to CAM-B3LYP, but trying to reduce the many-electron self-interaction",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :hyb_cam, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("A. J. Cohen, P. Mori-Sánchez, and W. Yang,  J. Chem. Phys. 126, 191109 (2007)", "10.1063/1.2741248", "@article{Cohen2007_191109,\n  author = {Cohen, Aron J. and Mori-S\\'{a}nchez, Paula and Yang, Weitao},\n  title = {Development of exchange-correlation functionals with minimal many-electron self-interaction error},\n  journal = {J. Chem. Phys.},\n  volume = {126},\n  number = {19},\n  pages = {191109},\n  year = {2007},\n  doi = {10.1063/1.2741248},\n  url = {https://doi.org/10.1063/1.2741248}\n}\n", "Cohen2007_191109"),
        ]),
    :hyb_gga_xc_relpbe0 => IdentifierText(
        "relPBE0 a.k.a. relPBE: PBE0 refitted for actinide compounds",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("A. Mitrofanov, N. Andreadi, V. Korolev, and S. Kalmykov,  J. Chem. Phys. 155, 161103 (2021)", "10.1063/5.0067631", "@article{Mitrofanov2021_161103,\n  author = {Mitrofanov, Artem and Andreadi, Nikolai and Korolev, Vadim and Kalmykov, Stepan},\n  title = {A search for a {DFT} functional for actinide compounds},\n  journal = {J. Chem. Phys.},\n  volume = {155},\n  number = {16},\n  pages = {161103},\n  year = {2021},\n  doi = {10.1063/5.0067631},\n  url = {https://doi.org/10.1063/5.0067631}\n}\n", "Mitrofanov2021_161103"),
        ]),
    :hyb_gga_xc_revb3lyp => IdentifierText(
        "Revised B3LYP a.k.a. OpB3LYP; B3LYP reoptimized in 6-311++G(2d,2p) basis set",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("L. Lu, H. Hu, H. Hou, and B. Wang,  Comput. Theor. Chem. 1015, 64 (2013)", "10.1016/j.comptc.2013.04.009", "@article{Lu2013_64,\n  author = {Lu, L. and Hu, H. and Hou, H. and Wang, B.},\n  title = {An improved {B3LYP} method in the calculation of organic thermochemistry and reactivity},\n  journal = {Comput. Theor. Chem.},\n  volume = {1015},\n  pages = {64},\n  year = {2013},\n  issn = {2210-271X},\n  doi = {10.1016/j.comptc.2013.04.009},\n  url = {http://www.sciencedirect.com/science/article/pii/S2210271X13001576}\n}\n", "Lu2013_64"),
            LibxcReference("L. Lu,  Int. J. Quantum Chem. 115, 502–509 (2015)", "10.1002/qua.24876", "@article{Lu2015_502,\n  author = {Lu, Lilin},\n  title = {Can {B3LYP} be improved by optimization of the proportions of exchange and correlation functionals?},\n  journal = {Int. J. Quantum Chem.},\n  volume = {115},\n  number = {8},\n  pages = {502--509},\n  doi = {10.1002/qua.24876},\n  url = {https://onlinelibrary.wiley.com/doi/abs/10.1002/qua.24876},\n  year = {2015}\n}\n", "Lu2015_502"),
        ]),
    :hyb_gga_xc_sb98_1a => IdentifierText(
        "SB98 (1a)",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("H. L. Schmider and A. D. Becke,  J. Chem. Phys. 108, 9624 (1998)", "10.1063/1.476438", "@article{Schmider1998_9624,\n  author = {Schmider, H. L. and Becke, A. D.},\n  title = {Optimized density functionals from the extended {G2} test set},\n  journal = {J. Chem. Phys.},\n  year = {1998},\n  volume = {108},\n  number = {23},\n  pages = {9624},\n  doi = {10.1063/1.476438},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/108/23/10.1063/1.476438}\n}\n", "Schmider1998_9624"),
        ]),
    :hyb_gga_xc_sb98_1b => IdentifierText(
        "SB98 (1b)",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("H. L. Schmider and A. D. Becke,  J. Chem. Phys. 108, 9624 (1998)", "10.1063/1.476438", "@article{Schmider1998_9624,\n  author = {Schmider, H. L. and Becke, A. D.},\n  title = {Optimized density functionals from the extended {G2} test set},\n  journal = {J. Chem. Phys.},\n  year = {1998},\n  volume = {108},\n  number = {23},\n  pages = {9624},\n  doi = {10.1063/1.476438},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/108/23/10.1063/1.476438}\n}\n", "Schmider1998_9624"),
        ]),
    :hyb_gga_xc_sb98_1c => IdentifierText(
        "SB98 (1c)",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("H. L. Schmider and A. D. Becke,  J. Chem. Phys. 108, 9624 (1998)", "10.1063/1.476438", "@article{Schmider1998_9624,\n  author = {Schmider, H. L. and Becke, A. D.},\n  title = {Optimized density functionals from the extended {G2} test set},\n  journal = {J. Chem. Phys.},\n  year = {1998},\n  volume = {108},\n  number = {23},\n  pages = {9624},\n  doi = {10.1063/1.476438},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/108/23/10.1063/1.476438}\n}\n", "Schmider1998_9624"),
        ]),
    :hyb_gga_xc_sb98_2a => IdentifierText(
        "SB98 (2a)",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("H. L. Schmider and A. D. Becke,  J. Chem. Phys. 108, 9624 (1998)", "10.1063/1.476438", "@article{Schmider1998_9624,\n  author = {Schmider, H. L. and Becke, A. D.},\n  title = {Optimized density functionals from the extended {G2} test set},\n  journal = {J. Chem. Phys.},\n  year = {1998},\n  volume = {108},\n  number = {23},\n  pages = {9624},\n  doi = {10.1063/1.476438},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/108/23/10.1063/1.476438}\n}\n", "Schmider1998_9624"),
        ]),
    :hyb_gga_xc_sb98_2b => IdentifierText(
        "SB98 (2b)",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("H. L. Schmider and A. D. Becke,  J. Chem. Phys. 108, 9624 (1998)", "10.1063/1.476438", "@article{Schmider1998_9624,\n  author = {Schmider, H. L. and Becke, A. D.},\n  title = {Optimized density functionals from the extended {G2} test set},\n  journal = {J. Chem. Phys.},\n  year = {1998},\n  volume = {108},\n  number = {23},\n  pages = {9624},\n  doi = {10.1063/1.476438},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/108/23/10.1063/1.476438}\n}\n", "Schmider1998_9624"),
        ]),
    :hyb_gga_xc_sb98_2c => IdentifierText(
        "SB98 (2c)",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("H. L. Schmider and A. D. Becke,  J. Chem. Phys. 108, 9624 (1998)", "10.1063/1.476438", "@article{Schmider1998_9624,\n  author = {Schmider, H. L. and Becke, A. D.},\n  title = {Optimized density functionals from the extended {G2} test set},\n  journal = {J. Chem. Phys.},\n  year = {1998},\n  volume = {108},\n  number = {23},\n  pages = {9624},\n  doi = {10.1063/1.476438},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/108/23/10.1063/1.476438}\n}\n", "Schmider1998_9624"),
        ]),
    :hyb_gga_xc_tuned_cam_b3lyp => IdentifierText(
        "CAM version of B3LYP, tuned for excitations and properties",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :hyb_cam, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("K. Okuno, Y. Shigeta, R. Kishi, H. Miyasaka, and M. Nakano,  J. Photochem. Photobiol, A 235, 29 (2012)", "10.1016/j.jphotochem.2012.03.003", "@article{Okuno2012_29,\n  author = {Okuno, K. and Shigeta, Y. and Kishi, R. and Miyasaka, H. and Nakano, M.},\n  title = {Tuned {CAM}-{B3LYP} functional in the time-dependent density functional theory scheme for excitation energies and properties of diarylethene derivatives},\n  journal = {J. Photochem. Photobiol., A},\n  volume = {235},\n  pages = {29},\n  year = {2012},\n  issn = {1010-6030},\n  doi = {10.1016/j.jphotochem.2012.03.003},\n  url = {http://www.sciencedirect.com/science/article/pii/S101060301200130X}\n}\n", "Okuno2012_29"),
        ]),
    :hyb_gga_xc_wb97 => IdentifierText(
        "wB97 range-separated functional",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :hyb_cam, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("J.-D. Chai and M. Head-Gordon,  J. Chem. Phys. 128, 084106 (2008)", "10.1063/1.2834918", "@article{Chai2008_084106,\n  author = {Chai, Jeng-Da and Head-Gordon, Martin},\n  title = {Systematic optimization of long-range corrected hybrid density functionals},\n  journal = {J. Chem. Phys.},\n  year = {2008},\n  volume = {128},\n  number = {8},\n  eid = {084106},\n  pages = {084106},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/128/8/10.1063/1.2834918},\n  doi = {10.1063/1.2834918}\n}\n", "Chai2008_084106"),
        ]),
    :hyb_gga_xc_wb97x => IdentifierText(
        "wB97X range-separated functional",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :hyb_cam, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("J.-D. Chai and M. Head-Gordon,  J. Chem. Phys. 128, 084106 (2008)", "10.1063/1.2834918", "@article{Chai2008_084106,\n  author = {Chai, Jeng-Da and Head-Gordon, Martin},\n  title = {Systematic optimization of long-range corrected hybrid density functionals},\n  journal = {J. Chem. Phys.},\n  year = {2008},\n  volume = {128},\n  number = {8},\n  eid = {084106},\n  pages = {084106},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/128/8/10.1063/1.2834918},\n  doi = {10.1063/1.2834918}\n}\n", "Chai2008_084106"),
        ]),
    :hyb_gga_xc_wb97x_d => IdentifierText(
        "wB97X-D range-separated functional",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :hyb_cam, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("J.-D. Chai and M. Head-Gordon,  Phys. Chem. Chem. Phys. 10, 6615–6620 (2008)", "10.1039/B810189B", "@article{Chai2008_6615,\n  author = {Chai, Jeng-Da and Head-Gordon, Martin},\n  title = {Long-range corrected hybrid density functionals with damped atom-atom dispersion corrections},\n  journal = {Phys. Chem. Chem. Phys.},\n  publisher = {The Royal Society of Chemistry},\n  year = {2008},\n  volume = {10},\n  issue = {44},\n  pages = {6615--6620},\n  doi = {10.1039/B810189B},\n  url = {https://doi.org/10.1039/B810189B}\n}\n", "Chai2008_6615"),
        ]),
    :hyb_gga_xc_wb97x_d3 => IdentifierText(
        "wB97X-D3 range-separated functional",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :hyb_cam, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("Y.-S. Lin, G.-D. Li, S.-P. Mao, and J.-D. Chai,  J. Chem. Theory Comput. 9, 263–272 (2013)", "10.1021/ct300715s", "@article{Lin2013_263,\n  author = {Lin, You-Sheng and Li, Guan-De and Mao, Shan-Ping and Chai, Jeng-Da},\n  title = {Long-Range Corrected Hybrid Density Functionals with Improved Dispersion Corrections},\n  journal = {J. Chem. Theory Comput.},\n  volume = {9},\n  number = {1},\n  pages = {263--272},\n  year = {2013},\n  doi = {10.1021/ct300715s},\n  url = {https://doi.org/10.1021/ct300715s}\n}\n", "Lin2013_263"),
        ]),
    :hyb_gga_xc_wb97x_v => IdentifierText(
        "wB97X-V range-separated functional",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :hyb_cam, :vv10, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("N. Mardirossian and M. Head-Gordon,  Phys. Chem. Chem. Phys. 16, 9904–9924 (2014)", "10.1039/C3CP54374A", "@article{Mardirossian2014_9904,\n  author = {Mardirossian, Narbe and Head-Gordon, Martin},\n  title = {\$\\omega\${B97X}-{V}: A 10-parameter, range-separated hybrid, generalized gradient approximation density functional with nonlocal correlation, designed by a survival-of-the-fittest strategy},\n  journal = {Phys. Chem. Chem. Phys.},\n  year = {2014},\n  volume = {16},\n  issue = {21},\n  pages = {9904--9924},\n  publisher = {The Royal Society of Chemistry},\n  doi = {10.1039/C3CP54374A},\n  url = {https://doi.org/10.1039/C3CP54374A}\n}\n", "Mardirossian2014_9904"),
        ]),
    :hyb_gga_xc_wc04 => IdentifierText(
        "hybrid fitted to carbon NMR shifts",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("K. W. Wiitala, T. R. Hoye, and C. J. Cramer,  J. Chem. Theory Comput. 2, 1085–1092 (2006)", "10.1021/ct6001016", "@article{Wiitala2006_1085,\n  author = {Wiitala, Keith W. and Hoye, Thomas R. and Cramer, Christopher J.},\n  title = {Hybrid Density Functional Methods Empirically Optimized for the Computation of \$^{13}\${C} and \$^{1}\${H} Chemical Shifts in Chloroform Solution},\n  journal = {J. Chem. Theory Comput.},\n  volume = {2},\n  number = {4},\n  pages = {1085--1092},\n  year = {2006},\n  doi = {10.1021/ct6001016},\n  url = {https://doi.org/10.1021/ct6001016}\n}\n", "Wiitala2006_1085"),
        ]),
    :hyb_gga_xc_whpbe0 => IdentifierText(
        "Long-range corrected short-range hybrid PBE (whPBE0) by Shao et al",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :hyb_cam, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("Y. Shao, Y. Mei, D. Sundholm, and V. R. I. Kaila,  J. Chem. Theory Comput. 16, 587–600 (2020)", "10.1021/acs.jctc.9b00823", "@article{Shao2020_587,\n  author = {Shao, Yihan and Mei, Ye and Sundholm, Dage and Kaila, Ville R. I.},\n  title = {Benchmarking the Performance of Time-Dependent Density Functional Theory Methods on Biochromophores},\n  journal = {J. Chem. Theory Comput.},\n  volume = {16},\n  number = {1},\n  pages = {587--600},\n  year = {2020},\n  doi = {10.1021/acs.jctc.9b00823},\n  url = {https://doi.org/10.1021/acs.jctc.9b00823}\n}\n", "Shao2020_587"),
        ]),
    :hyb_gga_xc_wp04 => IdentifierText(
        "hybrid fitted to proton NMR shifts",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("K. W. Wiitala, T. R. Hoye, and C. J. Cramer,  J. Chem. Theory Comput. 2, 1085–1092 (2006)", "10.1021/ct6001016", "@article{Wiitala2006_1085,\n  author = {Wiitala, Keith W. and Hoye, Thomas R. and Cramer, Christopher J.},\n  title = {Hybrid Density Functional Methods Empirically Optimized for the Computation of \$^{13}\${C} and \$^{1}\${H} Chemical Shifts in Chloroform Solution},\n  journal = {J. Chem. Theory Comput.},\n  volume = {2},\n  number = {4},\n  pages = {1085--1092},\n  year = {2006},\n  doi = {10.1021/ct6001016},\n  url = {https://doi.org/10.1021/ct6001016}\n}\n", "Wiitala2006_1085"),
        ]),
    :hyb_gga_xc_x3lyp => IdentifierText(
        "X3LYP",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("X. Xu and W. A. Goddard,  Proc. Natl. Acad. Sci. U. S. A. 101, 2673 (2004)", "10.1073/pnas.0308730100", "@article{Xu2004_2673,\n  author = {Xu, X. and Goddard, W. A.},\n  title = {The {X3LYP} extended density functional for accurate descriptions of nonbond interactions, spin states, and thermochemical properties},\n  journal = {Proc. Natl. Acad. Sci. U. S. A.},\n  volume = {101},\n  number = {9},\n  pages = {2673},\n  year = {2004},\n  doi = {10.1073/pnas.0308730100},\n  url = {http://www.pnas.org/content/101/9/2673.abstract}\n}\n", "Xu2004_2673"),
        ]),
    :hyb_lda_x_erf => IdentifierText(
        "Long-range corrected functional based on short-range LDA exchange (erfc)",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :hyb_cam, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("P. M. W. Gill, R. D. Adamson, and J. A. Pople,  Mol. Phys. 88, 1005–1009 (1996)", "10.1080/00268979609484488", "@article{Gill1996_1005,\n  author = {Gill, Peter M. W. and Adamson, Ross D. and Pople, John A.},\n  title = {{Coulomb}-attenuated exchange energy density functionals},\n  journal = {Mol. Phys.},\n  volume = {88},\n  number = {4},\n  pages = {1005--1009},\n  year = {1996},\n  publisher = {Taylor \\& Francis},\n  doi = {10.1080/00268979609484488},\n  url = {https://doi.org/10.1080/00268979609484488}\n}\n", "Gill1996_1005"),
            LibxcReference("J. Toulouse, A. Savin, and H.-J. Flad,  Int. J. Quantum Chem. 100, 1047–1056 (2004)", "10.1002/qua.20259", "@article{Toulouse2004_1047,\n  author = {Toulouse, Julien and Savin, Andreas and Flad, Heinz-J\\\"urgen},\n  title = {Short-range exchange-correlation energy of a uniform electron gas with modified electron-electron interaction},\n  journal = {Int. J. Quantum Chem.},\n  volume = {100},\n  number = {6},\n  publisher = {John Wiley \\& Sons, Inc.},\n  issn = {1097-461X},\n  url = {https://doi.org/10.1002/qua.20259},\n  doi = {10.1002/qua.20259},\n  pages = {1047--1056},\n  year = {2004}\n}\n", "Toulouse2004_1047"),
            LibxcReference("Y. Tawada, T. Tsuneda, S. Yanagisawa, T. Yanai, and K. Hirao,  J. Chem. Phys. 120, 8425–8433 (2004)", "10.1063/1.1688752", "@article{Tawada2004_8425,\n  author = {Tawada, Yoshihiro and Tsuneda, Takao and Yanagisawa, Susumu and Yanai, Takeshi and Hirao, Kimihiko},\n  title = {A long-range-corrected time-dependent density functional theory},\n  journal = {J. Chem. Phys.},\n  volume = {120},\n  number = {18},\n  pages = {8425--8433},\n  year = {2004},\n  doi = {10.1063/1.1688752},\n  url = {https://doi.org/10.1063/1.1688752}\n}\n", "Tawada2004_8425"),
        ]),
    :hyb_lda_xc_b93 => IdentifierText(
        "Becke's original half-and-half functional: 50% HF and 50% LDA xc",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("A. D. Becke,  J. Chem. Phys. 98, 1372 (1993)", "10.1063/1.464304", "@article{Becke1993_1372,\n  author = {Becke, A. D.},\n  title = {A new mixing of {Hartree}--{Fock} and local density-functional theories},\n  journal = {J. Chem. Phys.},\n  year = {1993},\n  volume = {98},\n  number = {2},\n  pages = {1372},\n  doi = {10.1063/1.464304},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/98/2/10.1063/1.464304}\n}\n", "Becke1993_1372"),
        ]),
    :hyb_lda_xc_bn05 => IdentifierText(
        "Baer and Neuhauser, gamma=1",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :hyb_camy, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("R. Baer and D. Neuhauser,  Phys. Rev. Lett. 94, 043002 (2005)", "10.1103/PhysRevLett.94.043002", "@article{Baer2005_043002,\n  author = {Baer, Roi and Neuhauser, Daniel},\n  title = {Density Functional Theory with Correct Long-Range Asymptotic Behavior},\n  journal = {Phys. Rev. Lett.},\n  volume = {94},\n  issue = {4},\n  pages = {043002},\n  year = {2005},\n  month = {Feb},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevLett.94.043002},\n  url = {https://link.aps.org/doi/10.1103/PhysRevLett.94.043002}\n}\n", "Baer2005_043002"),
        ]),
    :hyb_lda_xc_cam_lda0 => IdentifierText(
        "CAM version of LDA0",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :hyb_cam, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("M. A. Mosquera, C. H. Borca, M. A. Ratner, and G. C. Schatz,  J. Phys. Chem. A 120, 1605–1612 (2016)", "10.1021/acs.jpca.5b10864", "@article{Mosquera2016_1605,\n  author = {Mosquera, Mart\\'{i}n A. and Borca, Carlos H. and Ratner, Mark A. and Schatz, George C.},\n  title = {Connection between Hybrid Functionals and Importance of the Local Density Approximation},\n  journal = {J. Phys. Chem. A},\n  volume = {120},\n  number = {9},\n  pages = {1605--1612},\n  year = {2016},\n  doi = {10.1021/acs.jpca.5b10864},\n  url = {https://doi.org/10.1021/acs.jpca.5b10864}\n}\n", "Mosquera2016_1605"),
        ]),
    :hyb_lda_xc_lda0 => IdentifierText(
        "LDA hybrid exchange (LDA0)",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("P. Rinke, A. Schleife, E. Kioupakis, A. Janotti, C. Rödl, F. Bechstedt, M. Scheffler, and C. G. Van de Walle,  Phys. Rev. Lett. 108, 126404 (2012)", "10.1103/PhysRevLett.108.126404", "@article{Rinke2012_126404,\n  author = {Rinke, Patrick and Schleife, Andr\\'{e} and Kioupakis, Emmanouil and Janotti, Anderson and R\\\"odl, Claudia and Bechstedt, Friedhelm and Scheffler, Matthias and Van de Walle, Chris G.},\n  title = {First-Principles Optical Spectra for \${F}\$ Centers in {MgO}},\n  journal = {Phys. Rev. Lett.},\n  volume = {108},\n  issue = {12},\n  pages = {126404},\n  year = {2012},\n  month = {Mar},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevLett.108.126404},\n  url = {https://link.aps.org/doi/10.1103/PhysRevLett.108.126404}\n}\n", "Rinke2012_126404"),
        ]),
    :hyb_mgga_x_bmk => IdentifierText(
        "Boese-Martin for kinetics",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("A. D. Boese and J. M. L. Martin,  J. Chem. Phys. 121, 3405 (2004)", "10.1063/1.1774975", "@article{Boese2004_3405,\n  author = {Boese, A. D. and Martin, J. M. L.},\n  title = {Development of density functionals for thermochemical kinetics},\n  journal = {J. Chem. Phys.},\n  year = {2004},\n  volume = {121},\n  number = {8},\n  pages = {3405},\n  doi = {10.1063/1.1774975},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/121/8/10.1063/1.1774975}\n}\n", "Boese2004_3405"),
        ]),
    :hyb_mgga_x_cf22d => IdentifierText(
        "Minnesota CF22D hybrid exchange functional",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("Y. Liu, C. Zhang, Z. Liu, D. G. Truhlar, Y. Wang, and X. He,  Nat. Comput. Sci. 3, 48–58 (2022)", "10.1038/s43588-022-00371-5", "@article{Liu2022_48,\n  author = {Liu, Yiwei and Zhang, Cheng and Liu, Zhonghua and Truhlar, Donald G. and Wang, Ying and He, Xiao},\n  journal = {Nat. Comput. Sci.},\n  title = {Supervised learning of a chemistry functional with damped dispersion},\n  year = {2022},\n  issn = {2662-8457},\n  month = {December},\n  number = {1},\n  pages = {48--58},\n  volume = {3},\n  doi = {10.1038/s43588-022-00371-5},\n  publisher = {Springer Science and Business Media LLC}\n}\n", "Liu2022_48"),
        ]),
    :hyb_mgga_x_dldf => IdentifierText(
        "Dispersionless Density Functional",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("K. Pernal, R. Podeszwa, K. Patkowski, and K. Szalewicz,  Phys. Rev. Lett. 103, 263201 (2009)", "10.1103/PhysRevLett.103.263201", "@article{Pernal2009_263201,\n  author = {Pernal, Katarzyna and Podeszwa, Rafa\\l{} and Patkowski, Konrad and Szalewicz, Krzysztof},\n  title = {Dispersionless Density Functional Theory},\n  journal = {Phys. Rev. Lett.},\n  volume = {103},\n  issue = {26},\n  pages = {263201},\n  year = {2009},\n  month = {Dec},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevLett.103.263201},\n  url = {http://link.aps.org/doi/10.1103/PhysRevLett.103.263201}\n}\n", "Pernal2009_263201"),
        ]),
    :hyb_mgga_x_js18 => IdentifierText(
        "Jana and Samal 2018, screened range-separated TM exchange",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :hyb_cam, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("S. Jana and P. Samal,  Phys. Chem. Chem. Phys. 20, 8999–9005 (2018)", "10.1039/C8CP00333E", "@article{Jana2018_8999,\n  author = {Jana, Subrata and Samal, Prasanjit},\n  title = {A meta-{GGA} level screened range-separated hybrid functional by employing short range {Hartree}--{Fock} with a long range semilocal functional},\n  journal = {Phys. Chem. Chem. Phys.},\n  year = {2018},\n  volume = {20},\n  issue = {13},\n  pages = {8999--9005},\n  publisher = {The Royal Society of Chemistry},\n  doi = {10.1039/C8CP00333E},\n  url = {https://doi.org/10.1039/C8CP00333E}\n}\n", "Jana2018_8999"),
        ]),
    :hyb_mgga_x_m05 => IdentifierText(
        "Minnesota M05 hybrid exchange functional",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("Y. Zhao, N. E. Schultz, and D. G. Truhlar,  J. Chem. Phys. 123, 161103 (2005)", "10.1063/1.2126975", "@article{Zhao2005_161103,\n  author = {Zhao, Y. and Schultz, N. E. and Truhlar, D. G.},\n  title = {Exchange-correlation functional with broad accuracy for metallic and nonmetallic compounds, kinetics, and noncovalent interactions},\n  journal = {J. Chem. Phys.},\n  year = {2005},\n  volume = {123},\n  number = {16},\n  pages = {161103},\n  doi = {10.1063/1.2126975},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/123/16/10.1063/1.2126975}\n}\n", "Zhao2005_161103"),
        ]),
    :hyb_mgga_x_m05_2x => IdentifierText(
        "Minnesota M05-2X hybrid exchange functional",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("Y. Zhao, N. E. Schultz, and D. G. Truhlar,  J. Chem. Theory Comput. 2, 364 (2006)", "10.1021/ct0502763", "@article{Zhao2006_364,\n  author = {Zhao, Y. and Schultz, N. E. and Truhlar, D. G.},\n  title = {Design of Density Functionals by Combining the Method of Constraint Satisfaction with Parametrization for Thermochemistry, Thermochemical Kinetics, and Noncovalent Interactions},\n  journal = {J. Chem. Theory Comput.},\n  volume = {2},\n  number = {2},\n  pages = {364},\n  year = {2006},\n  doi = {10.1021/ct0502763},\n  url = {http://pubs.acs.org/doi/abs/10.1021/ct0502763}\n}\n", "Zhao2006_364"),
        ]),
    :hyb_mgga_x_m06 => IdentifierText(
        "Minnesota M06 hybrid exchange functional",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("Y. Zhao and D. G. Truhlar,  Theor. Chem. Acc. 120, 215 (2008)", "10.1007/s00214-007-0310-x", "@article{Zhao2008_215,\n  author = {Zhao, Y. and Truhlar, D. G.},\n  title = {The {M06} suite of density functionals for main group thermochemistry, thermochemical kinetics, noncovalent interactions, excited states, and transition elements: two new functionals and systematic testing of four {M06}-class functionals and 12 other functionals},\n  journal = {Theor. Chem. Acc.},\n  volume = {120},\n  number = {1-3},\n  pages = {215},\n  year = {2008},\n  issn = {1432-881X},\n  publisher = {Springer-Verlag},\n  doi = {10.1007/s00214-007-0310-x},\n  url = {http://link.springer.com/article/10.1007\\\\%2Fs00214-007-0310-x}\n}\n", "Zhao2008_215"),
        ]),
    :hyb_mgga_x_m06_2x => IdentifierText(
        "Minnesota M06-2X hybrid exchange functional",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("Y. Zhao and D. G. Truhlar,  Theor. Chem. Acc. 120, 215 (2008)", "10.1007/s00214-007-0310-x", "@article{Zhao2008_215,\n  author = {Zhao, Y. and Truhlar, D. G.},\n  title = {The {M06} suite of density functionals for main group thermochemistry, thermochemical kinetics, noncovalent interactions, excited states, and transition elements: two new functionals and systematic testing of four {M06}-class functionals and 12 other functionals},\n  journal = {Theor. Chem. Acc.},\n  volume = {120},\n  number = {1-3},\n  pages = {215},\n  year = {2008},\n  issn = {1432-881X},\n  publisher = {Springer-Verlag},\n  doi = {10.1007/s00214-007-0310-x},\n  url = {http://link.springer.com/article/10.1007\\\\%2Fs00214-007-0310-x}\n}\n", "Zhao2008_215"),
        ]),
    :hyb_mgga_x_m06_hf => IdentifierText(
        "Minnesota M06-HF hybrid exchange functional",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("Y. Zhao and D. G. Truhlar,  J. Phys. Chem. A 110, 13126 (2006)", "10.1021/jp066479k", "@article{Zhao2006_13126,\n  author = {Zhao, Y. and Truhlar, D. G.},\n  title = {Density Functional for Spectroscopy: No Long-Range Self-Interaction Error, Good Performance for {Rydberg} and Charge-Transfer States, and Better Performance on Average than {B3LYP} for Ground States},\n  journal = {J. Phys. Chem. A},\n  volume = {110},\n  number = {49},\n  pages = {13126},\n  year = {2006},\n  doi = {10.1021/jp066479k},\n  url = {http://pubs.acs.org/doi/abs/10.1021/jp066479k}\n}\n", "Zhao2006_13126"),
        ]),
    :hyb_mgga_x_m06_sx => IdentifierText(
        "Minnesota M06-SX short-range hybrid exchange functional",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :hyb_cam, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("Y. Wang, P. Verma, L. Zhang, Y. Li, Z. Liu, D. G. Truhlar, and X. He,  Proc. Natl. Acad. Sci. U. S. A. 117, 2294–2301 (2020)", "10.1073/pnas.1913699117", "@article{Wang2020_2294,\n  author = {Wang, Ying and Verma, Pragya and Zhang, Lujia and Li, Yaqi and Liu, Zhonghua and Truhlar, Donald G. and He, Xiao},\n  title = {{M06}-{SX} screened-exchange density functional for chemistry and solid-state physics},\n  journal = {Proc. Natl. Acad. Sci. U. S. A.},\n  volume = {117},\n  number = {5},\n  pages = {2294--2301},\n  year = {2020},\n  doi = {10.1073/pnas.1913699117},\n  publisher = {National Academy of Sciences},\n  issn = {0027-8424},\n  url = {https://www.pnas.org/content/117/5/2294}\n}\n", "Wang2020_2294"),
        ]),
    :hyb_mgga_x_m08_hx => IdentifierText(
        "Minnesota M08-HX hybrid exchange functional",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("Y. Zhao and D. G. Truhlar,  J. Chem. Theory Comput. 4, 1849 (2008)", "10.1021/ct800246v", "@article{Zhao2008_1849,\n  author = {Zhao, Y. and Truhlar, D. G.},\n  title = {Exploring the Limit of Accuracy of the Global Hybrid Meta Density Functional for Main-Group Thermochemistry, Kinetics, and Noncovalent Interactions},\n  journal = {J. Chem. Theory Comput.},\n  volume = {4},\n  number = {11},\n  pages = {1849},\n  year = {2008},\n  doi = {10.1021/ct800246v},\n  url = {http://pubs.acs.org/doi/abs/10.1021/ct800246v}\n}\n", "Zhao2008_1849"),
        ]),
    :hyb_mgga_x_m08_so => IdentifierText(
        "Minnesota M08-SO hybrid exchange functional",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("Y. Zhao and D. G. Truhlar,  J. Chem. Theory Comput. 4, 1849 (2008)", "10.1021/ct800246v", "@article{Zhao2008_1849,\n  author = {Zhao, Y. and Truhlar, D. G.},\n  title = {Exploring the Limit of Accuracy of the Global Hybrid Meta Density Functional for Main-Group Thermochemistry, Kinetics, and Noncovalent Interactions},\n  journal = {J. Chem. Theory Comput.},\n  volume = {4},\n  number = {11},\n  pages = {1849},\n  year = {2008},\n  doi = {10.1021/ct800246v},\n  url = {http://pubs.acs.org/doi/abs/10.1021/ct800246v}\n}\n", "Zhao2008_1849"),
        ]),
    :hyb_mgga_x_m11 => IdentifierText(
        "Minnesota M11 hybrid exchange functional",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :hyb_cam, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("R. Peverati and D. G. Truhlar,  J. Phys. Chem. Lett. 2, 2810 (2011)", "10.1021/jz201170d", "@article{Peverati2011_2810,\n  author = {Peverati, R. and Truhlar, D. G.},\n  title = {Improving the Accuracy of Hybrid Meta-{GGA} Density Functionals by Range Separation},\n  journal = {J. Phys. Chem. Lett.},\n  volume = {2},\n  number = {21},\n  pages = {2810},\n  year = {2011},\n  doi = {10.1021/jz201170d},\n  url = {http://pubs.acs.org/doi/abs/10.1021/jz201170d}\n}\n", "Peverati2011_2810"),
        ]),
    :hyb_mgga_x_mn12_sx => IdentifierText(
        "Minnesota MN12-SX hybrid exchange functional",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :hyb_cam, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("R. Peverati and D. G. Truhlar,  Phys. Chem. Chem. Phys. 14, 16187 (2012)", "10.1039/C2CP42576A", "@article{Peverati2012_16187,\n  author = {Peverati, R. and Truhlar, D. G.},\n  title = {Screened-exchange density functionals with broad accuracy for chemistry and solid-state physics},\n  journal = {Phys. Chem. Chem. Phys.},\n  year = {2012},\n  volume = {14},\n  issue = {47},\n  pages = {16187},\n  publisher = {The Royal Society of Chemistry},\n  doi = {10.1039/C2CP42576A},\n  url = {http://pubs.rsc.org/en/Content/ArticleLanding/2012/CP/c2cp42576a}\n}\n", "Peverati2012_16187"),
        ]),
    :hyb_mgga_x_mn15 => IdentifierText(
        "Minnesota MN15 hybrid exchange functional",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("H. S. Yu, X. He, S. L. Li, and D. G. Truhlar,  Chem. Sci. 7, 5032–5051 (2016)", "10.1039/C6SC00705H", "@article{Yu2016_5032,\n  author = {Yu, Haoyu S. and He, Xiao and Li, Shaohong L. and Truhlar, Donald G.},\n  title = {{MN15}: A {Kohn}--{Sham} global-hybrid exchange-correlation density functional with broad accuracy for multi-reference and single-reference systems and noncovalent interactions},\n  journal = {Chem. Sci.},\n  year = {2016},\n  volume = {7},\n  issue = {8},\n  pages = {5032--5051},\n  publisher = {The Royal Society of Chemistry},\n  doi = {10.1039/C6SC00705H},\n  url = {https://doi.org/10.1039/C6SC00705H}\n}\n", "Yu2016_5032"),
        ]),
    :hyb_mgga_x_ms2h => IdentifierText(
        "MS2 hybrid exchange of Sun, et al",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("J. Sun, R. Haunschild, B. Xiao, I. W. Bulik, G. E. Scuseria, and J. P. Perdew,  J. Chem. Phys. 138, 044113 (2013)", "10.1063/1.4789414", "@article{Sun2013_044113,\n  author = {Sun, J. and Haunschild, R. and Xiao, B. and Bulik, I. W. and Scuseria, G. E. and Perdew, J. P.},\n  title = {Semilocal and hybrid meta-generalized gradient approximations based on the understanding of the kinetic-energy-density dependence},\n  journal = {J. Chem. Phys.},\n  year = {2013},\n  volume = {138},\n  number = {4},\n  pages = {044113},\n  doi = {10.1063/1.4789414},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/138/4/10.1063/1.4789414}\n}\n", "Sun2013_044113"),
        ]),
    :hyb_mgga_x_mvsh => IdentifierText(
        "MVSh hybrid exchange functional",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("J. Sun, J. P. Perdew, and A. Ruzsinszky,  Proc. Natl. Acad. Sci. U. S. A. 112, 685–689 (2015)", "10.1073/pnas.1423145112", "@article{Sun2015_685,\n  author = {Sun, Jianwei and Perdew, John P. and Ruzsinszky, Adrienn},\n  title = {Semilocal density functional obeying a strongly tightened bound for exchange},\n  journal = {Proc. Natl. Acad. Sci. U. S. A.},\n  volume = {112},\n  number = {3},\n  pages = {685--689},\n  year = {2015},\n  doi = {10.1073/pnas.1423145112},\n  url = {http://www.pnas.org/content/112/3/685.abstract}\n}\n", "Sun2015_685"),
        ]),
    :hyb_mgga_x_pi_m06_2x => IdentifierText(
        "Physically-informed Minnesota M06-2X hybrid exchange functional",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("T. V. Losev, I. D. Ivanov, I. S. Gerasimov, N. V. Krivoshchapov, and M. G. Medvedev,  J. Phys. Chem. A 128, 10921–10928 (2024)", "10.1021/acs.jpca.4c05085", "@article{Losev2024_10921,\n  author = {Losev, Timofey V. and Ivanov, Ilya D. and Gerasimov, Igor S. and Krivoshchapov, Nikolai V. and Medvedev, Michael G.},\n  title = {Informing Empirically Fitted Density Functionals about the Physics of Interelectronic Interactions},\n  journal = {J. Phys. Chem. A},\n  year = {2024},\n  month = {Dec},\n  day = {19},\n  publisher = {American Chemical Society},\n  volume = {128},\n  number = {50},\n  pages = {10921--10928},\n  issn = {1089-5639},\n  doi = {10.1021/acs.jpca.4c05085},\n  url = {https://doi.org/10.1021/acs.jpca.4c05085}\n}\n", "Losev2024_10921"),
        ]),
    :hyb_mgga_x_pi_m06_2x_dl => IdentifierText(
        "Dispersionless physically-informed Minnesota M06-2X hybrid exchange functional",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("T. V. Losev, I. D. Ivanov, I. S. Gerasimov, N. V. Krivoshchapov, and M. G. Medvedev,  J. Phys. Chem. A 128, 10921–10928 (2024)", "10.1021/acs.jpca.4c05085", "@article{Losev2024_10921,\n  author = {Losev, Timofey V. and Ivanov, Ilya D. and Gerasimov, Igor S. and Krivoshchapov, Nikolai V. and Medvedev, Michael G.},\n  title = {Informing Empirically Fitted Density Functionals about the Physics of Interelectronic Interactions},\n  journal = {J. Phys. Chem. A},\n  year = {2024},\n  month = {Dec},\n  day = {19},\n  publisher = {American Chemical Society},\n  volume = {128},\n  number = {50},\n  pages = {10921--10928},\n  issn = {1089-5639},\n  doi = {10.1021/acs.jpca.4c05085},\n  url = {https://doi.org/10.1021/acs.jpca.4c05085}\n}\n", "Losev2024_10921"),
        ]),
    :hyb_mgga_x_pjs18 => IdentifierText(
        "Patra, Jana and Samal 2018, screened range-separated TM exchange",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :hyb_cam, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("B. Patra, S. Jana, and P. Samal,  Phys. Chem. Chem. Phys. 20, 8991–8998 (2018)", "10.1039/C8CP00717A", "@article{Patra2018_8991,\n  author = {Patra, Bikash and Jana, Subrata and Samal, Prasanjit},\n  title = {Long-range corrected density functional through the density matrix expansion based semilocal exchange hole},\n  journal = {Phys. Chem. Chem. Phys.},\n  year = {2018},\n  volume = {20},\n  issue = {13},\n  pages = {8991--8998},\n  publisher = {The Royal Society of Chemistry},\n  doi = {10.1039/C8CP00717A},\n  url = {https://doi.org/10.1039/C8CP00717A}\n}\n", "Patra2018_8991"),
        ]),
    :hyb_mgga_x_revm06 => IdentifierText(
        "Revised Minnesota M06 hybrid exchange functional",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("Y. Wang, P. Verma, X. Jin, D. G. Truhlar, and X. He,  Proc. Natl. Acad. Sci. U. S. A. 115, 10257–10262 (2018)", "10.1073/pnas.1810421115", "@article{Wang2018_10257,\n  author = {Wang, Ying and Verma, Pragya and Jin, Xinsheng and Truhlar, Donald G. and He, Xiao},\n  title = {Revised {M06} density functional for main-group and transition-metal chemistry},\n  journal = {Proc. Natl. Acad. Sci. U. S. A.},\n  volume = {115},\n  number = {41},\n  pages = {10257--10262},\n  year = {2018},\n  doi = {10.1073/pnas.1810421115},\n  publisher = {National Academy of Sciences},\n  issn = {0027-8424},\n  url = {https://www.pnas.org/content/115/41/10257}\n}\n", "Wang2018_10257"),
        ]),
    :hyb_mgga_x_revm11 => IdentifierText(
        "Revised Minnesota M11 hybrid exchange functional",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :hyb_cam, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("P. Verma, Y. Wang, S. Ghosh, X. He, and D. G. Truhlar,  J. Phys. Chem. A 123, 2966–2990 (2019)", "10.1021/acs.jpca.8b11499", "@article{Verma2019_2966,\n  author = {Verma, Pragya and Wang, Ying and Ghosh, Soumen and He, Xiao and Truhlar, Donald G.},\n  title = {Revised {M11} Exchange-Correlation Functional for Electronic Excitation Energies and Ground-State Properties},\n  journal = {J. Phys. Chem. A},\n  volume = {123},\n  number = {13},\n  pages = {2966--2990},\n  year = {2019},\n  doi = {10.1021/acs.jpca.8b11499},\n  url = {https://doi.org/10.1021/acs.jpca.8b11499}\n}\n", "Verma2019_2966"),
        ]),
    :hyb_mgga_x_revscan0 => IdentifierText(
        "revised SCAN hybrid exchange (SCAN0)",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("P. D. Mezei, G. I. Csonka, and M. Kállay,  J. Chem. Theory Comput. 14, 2469–2479 (2018)", "10.1021/acs.jctc.8b00072", "@article{Mezei2018_2469,\n  author = {Mezei, P\\'{a}l D. and Csonka, G\\'{a}bor I. and K\\'{a}llay, Mih\\'{a}ly},\n  title = {Simple Modifications of the {SCAN} Meta-Generalized Gradient Approximation Functional},\n  journal = {J. Chem. Theory Comput.},\n  volume = {14},\n  number = {5},\n  pages = {2469--2479},\n  year = {2018},\n  doi = {10.1021/acs.jctc.8b00072},\n  url = {https://doi.org/10.1021/acs.jctc.8b00072}\n}\n", "Mezei2018_2469"),
        ]),
    :hyb_mgga_x_scan0 => IdentifierText(
        "SCAN hybrid exchange (SCAN0)",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("K. Hui and J.-D. Chai,  J. Chem. Phys. 144, 044114 (2016)", "10.1063/1.4940734", "@article{Hui2016_044114,\n  author = {Hui, Kerwin and Chai, Jeng-Da},\n  title = {{SCAN}-based hybrid and double-hybrid density functionals from models without fitted parameters},\n  journal = {J. Chem. Phys.},\n  volume = {144},\n  number = {4},\n  pages = {044114},\n  year = {2016},\n  doi = {10.1063/1.4940734},\n  url = {https://doi.org/10.1063/1.4940734}\n}\n", "Hui2016_044114"),
        ]),
    :hyb_mgga_x_tau_hcth => IdentifierText(
        "Hybrid version of tau-HCTH",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("A. D. Boese and N. C. Handy,  J. Chem. Phys. 116, 9559 (2002)", "10.1063/1.1476309", "@article{Boese2002_9559,\n  author = {Boese, A. D. and Handy, N. C.},\n  title = {New exchange-correlation density functionals: The role of the kinetic-energy density},\n  journal = {J. Chem. Phys.},\n  year = {2002},\n  volume = {116},\n  number = {22},\n  pages = {9559},\n  doi = {10.1063/1.1476309},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/116/22/10.1063/1.1476309}\n}\n", "Boese2002_9559"),
        ]),
    :hyb_mgga_x_wr2scan => IdentifierText(
        "Range-separated re-regularized SCAN exchange by Wittmann et al",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :hyb_cam, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("L. Wittmann, H. Neugebauer, S. Grimme, and M. Bursch,  J. Chem. Phys. 159, 224103 (2023)", "10.1063/5.0174988", "@article{Wittmann2023_224103,\n  author = {Wittmann, Lukas and Neugebauer, Hagen and Grimme, Stefan and Bursch, Markus},\n  title = {{Dispersion-corrected r\$^2\${SCAN} based double-hybrid functionals}},\n  journal = {J. Chem. Phys.},\n  volume = {159},\n  number = {22},\n  pages = {224103},\n  year = {2023},\n  month = {12},\n  issn = {0021-9606},\n  doi = {10.1063/5.0174988},\n  url = {https://doi.org/10.1063/5.0174988}\n}\n", "Wittmann2023_224103"),
        ]),
    :hyb_mgga_xc_b0kcis => IdentifierText(
        "Hybrid based on KCIS",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("J. Toulouse, A. Savin, and C. Adamo,  J. Chem. Phys. 117, 10465–10473 (2002)", "10.1063/1.1521432", "@article{Toulouse2002_10465,\n  author = {Toulouse, Julien and Savin, Andreas and Adamo, Carlo},\n  title = {Validation and assessment of an accurate approach to the correlation problem in density functional theory: The {Kriger}--{Chen}--{Iafrate}--{Savin} model},\n  journal = {J. Chem. Phys.},\n  volume = {117},\n  number = {23},\n  pages = {10465--10473},\n  year = {2002},\n  doi = {10.1063/1.1521432},\n  url = {https://doi.org/10.1063/1.1521432}\n}\n", "Toulouse2002_10465"),
        ]),
    :hyb_mgga_xc_b86b95 => IdentifierText(
        "Mixture of B86 with BC95",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("A. D. Becke,  J. Chem. Phys. 104, 1040 (1996)", "10.1063/1.470829", "@article{Becke1996_1040,\n  author = {Becke, A. D.},\n  title = {Density-functional thermochemistry. {IV}. {A} new dynamical correlation functional and implications for exact-exchange mixing},\n  journal = {J. Chem. Phys.},\n  year = {1996},\n  volume = {104},\n  number = {3},\n  pages = {1040},\n  doi = {10.1063/1.470829},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/104/3/10.1063/1.470829}\n}\n", "Becke1996_1040"),
        ]),
    :hyb_mgga_xc_b88b95 => IdentifierText(
        "Mixture of B88 with BC95 (B1B95)",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("A. D. Becke,  J. Chem. Phys. 104, 1040 (1996)", "10.1063/1.470829", "@article{Becke1996_1040,\n  author = {Becke, A. D.},\n  title = {Density-functional thermochemistry. {IV}. {A} new dynamical correlation functional and implications for exact-exchange mixing},\n  journal = {J. Chem. Phys.},\n  year = {1996},\n  volume = {104},\n  number = {3},\n  pages = {1040},\n  doi = {10.1063/1.470829},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/104/3/10.1063/1.470829}\n}\n", "Becke1996_1040"),
        ]),
    :hyb_mgga_xc_b94_hyb => IdentifierText(
        "Becke 1994 hybrid meta-GGA",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :dim3, :needs_laplacian, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3),
        LibxcReference[
            LibxcReference("A. D. Becke,  Int. J. Quantum Chem. 52, 625–632 (1994)", "10.1002/qua.560520855", "@article{Becke1994_625,\n  author = {Becke, Axel D.},\n  title = {Thermochemical tests of a kinetic-energy dependent exchange-correlation approximation},\n  journal = {Int. J. Quantum Chem.},\n  volume = {52},\n  number = {S28},\n  pages = {625--632},\n  doi = {10.1002/qua.560520855},\n  url = {https://onlinelibrary.wiley.com/doi/abs/10.1002/qua.560520855},\n  year = {1994}\n}\n", "Becke1994_625"),
        ]),
    :hyb_mgga_xc_b98 => IdentifierText(
        "Becke 98",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_laplacian, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("A. D. Becke,  J. Chem. Phys. 109, 2092–2098 (1998)", "10.1063/1.476722", "@article{Becke1998_2092,\n  author = {Becke, Axel D.},\n  title = {A new inhomogeneity parameter in density-functional theory},\n  journal = {J. Chem. Phys.},\n  volume = {109},\n  number = {6},\n  pages = {2092--2098},\n  year = {1998},\n  doi = {10.1063/1.476722},\n  url = {https://doi.org/10.1063/1.476722}\n}\n", "Becke1998_2092"),
        ]),
    :hyb_mgga_xc_bb1k => IdentifierText(
        "Mixture of B88 with BC95 from Zhao and Truhlar",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("Y. Zhao, B. J. Lynch, and D. G. Truhlar,  J. Phys. Chem. A 108, 2715 (2004)", "10.1021/jp049908s", "@article{Zhao2004_2715,\n  author = {Zhao, Y. and Lynch, B. J. and Truhlar, D. G.},\n  title = {Development and Assessment of a New Hybrid Density Functional Model for Thermochemical Kinetics},\n  journal = {J. Phys. Chem. A},\n  volume = {108},\n  number = {14},\n  pages = {2715},\n  year = {2004},\n  doi = {10.1021/jp049908s},\n  url = {http://pubs.acs.org/doi/abs/10.1021/jp049908s}\n}\n", "Zhao2004_2715"),
        ]),
    :hyb_mgga_xc_br3p86 => IdentifierText(
        "BR3P86 hybrid meta-GGA from Neumann and Handy",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_laplacian, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("R. Neumann and N. C. Handy,  Chem. Phys. Lett. 246, 381–386 (1995)", "10.1016/0009-2614(95)01143-2", "@article{Neumann1995_381,\n  author = {Neumann, Ralf and Handy, Nicholas C.},\n  title = {Investigations using the {Becke}--{Roussel} exchange functional},\n  journal = {Chem. Phys. Lett.},\n  volume = {246},\n  number = {4},\n  pages = {381--386},\n  year = {1995},\n  doi = {10.1016/0009-2614(95)01143-2},\n  url = {https://www.sciencedirect.com/science/article/pii/0009261495011432}\n}\n", "Neumann1995_381"),
        ]),
    :hyb_mgga_xc_coach => IdentifierText(
        "COACH exchange-correlation functional",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :dim3, :hyb_cam, :vv10, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3),
        LibxcReference[
            LibxcReference("J. Liang and M. Head-Gordon. Reaching for the performance limit of hybrid density functional theory for molecular chemistry. 2026. URL: https://arxiv.org/abs/2603.23466, arXiv:2603.23466.", "", "@misc{Liang2026,\n  author = {Liang, Jiashu and Head-Gordon, Martin},\n  title = {Reaching for the performance limit of hybrid density functional theory for molecular chemistry},\n  year = {2026},\n  eprint = {2603.23466},\n  archivePrefix = {arXiv},\n  primaryClass = {physics.chem-ph},\n  url = {https://arxiv.org/abs/2603.23466}\n}\n", "Liang2026"),
        ]),
    :hyb_mgga_xc_edmggah => IdentifierText(
        "EDMGGA hybrid",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :development, :needs_laplacian, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("J. Tao,  J. Chem. Phys. 116, 2335–2337 (2002)", "10.1063/1.1447882", "@article{Tao2002_2335,\n  author = {Tao, Jianmin},\n  title = {An accurate {MGGA}-based hybrid exchange-correlation functional},\n  journal = {J. Chem. Phys.},\n  volume = {116},\n  number = {6},\n  pages = {2335--2337},\n  year = {2002},\n  doi = {10.1063/1.1447882},\n  url = {https://doi.org/10.1063/1.1447882}\n}\n", "Tao2002_2335"),
        ]),
    :hyb_mgga_xc_gas22 => IdentifierText(
        "Google Accelerated Science 22",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :hyb_cam, :vv10, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("H. Ma, A. Narayanaswamy, P. Riley, and L. Li,  Sci. Adv. 8, eabq0279 (2022)", "10.1126/sciadv.abq0279", "@article{Ma2022_eabq0279,\n  author = {Ma, He and Narayanaswamy, Arunachalam and Riley, Patrick and Li, Li},\n  title = {Evolving symbolic density functionals},\n  journal = {Sci. Adv.},\n  volume = {8},\n  number = {36},\n  pages = {eabq0279},\n  year = {2022},\n  doi = {10.1126/sciadv.abq0279},\n  URL = {https://www.science.org/doi/abs/10.1126/sciadv.abq0279}\n}\n", "Ma2022_eabq0279"),
        ]),
    :hyb_mgga_xc_lc_tmlyp => IdentifierText(
        "Long-range corrected TM-LYP by Jana et al",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :hyb_cam, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("S. Jana, B. Patra, H. Myneni, and P. Samal,  Chem. Phys. Lett. 713, 1–9 (2018)", "10.1016/j.cplett.2018.10.007", "@article{Jana2018_1,\n  author = {Jana, Subrata and Patra, Bikash and Myneni, Hemanadhan and Samal, Prasanjit},\n  title = {On the many-electron self-interaction error of the semilocal exchange hole based meta-{GGA} level range-separated hybrid with the {B88} hybrids},\n  journal = {Chem. Phys. Lett.},\n  volume = {713},\n  pages = {1--9},\n  year = {2018},\n  issn = {0009-2614},\n  doi = {10.1016/j.cplett.2018.10.007},\n  url = {http://www.sciencedirect.com/science/article/pii/S0009261418308194}\n}\n", "Jana2018_1"),
        ]),
    :hyb_mgga_xc_mpw1b95 => IdentifierText(
        "Mixture of mPW91 with BC95 from Zhao and Truhlar",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("Y. Zhao and D. G. Truhlar,  J. Phys. Chem. A 108, 6908 (2004)", "10.1021/jp048147q", "@article{Zhao2004_6908,\n  author = {Zhao, Y. and Truhlar, D. G.},\n  title = {Hybrid Meta Density Functional Theory Methods for Thermochemistry, Thermochemical Kinetics, and Noncovalent Interactions: The {mPW1B95} and {mPWB1K} Models and Comparative Assessments for Hydrogen Bonding and van der Waals Interactions},\n  journal = {J. Phys. Chem. A},\n  volume = {108},\n  number = {33},\n  pages = {6908},\n  year = {2004},\n  doi = {10.1021/jp048147q},\n  url = {http://pubs.acs.org/doi/abs/10.1021/jp048147q}\n}\n", "Zhao2004_6908"),
        ]),
    :hyb_mgga_xc_mpw1kcis => IdentifierText(
        "MPW1KCIS for barrier heights",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("Y. Zhao, N. González-García, and D. G. Truhlar,  J. Phys. Chem. A 109, 2012–2018 (2005)", "10.1021/jp045141s", "@article{Zhao2005_2012,\n  author = {Zhao, Yan and Gonz\\'{a}lez-Garc\\'{i}a, N\\'{u}ria and Truhlar, Donald G.},\n  title = {Benchmark Database of Barrier Heights for Heavy Atom Transfer, Nucleophilic Substitution, Association, and Unimolecular Reactions and Its Use to Test Theoretical Methods},\n  journal = {J. Phys. Chem. A},\n  volume = {109},\n  number = {9},\n  pages = {2012--2018},\n  year = {2005},\n  doi = {10.1021/jp045141s},\n  url = {https://doi.org/10.1021/jp045141s}\n}\n", "Zhao2005_2012"),
        ]),
    :hyb_mgga_xc_mpwb1k => IdentifierText(
        "Mixture of mPW91 with BC95 for kinetics",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("Y. Zhao and D. G. Truhlar,  J. Phys. Chem. A 108, 6908 (2004)", "10.1021/jp048147q", "@article{Zhao2004_6908,\n  author = {Zhao, Y. and Truhlar, D. G.},\n  title = {Hybrid Meta Density Functional Theory Methods for Thermochemistry, Thermochemical Kinetics, and Noncovalent Interactions: The {mPW1B95} and {mPWB1K} Models and Comparative Assessments for Hydrogen Bonding and van der Waals Interactions},\n  journal = {J. Phys. Chem. A},\n  volume = {108},\n  number = {33},\n  pages = {6908},\n  year = {2004},\n  doi = {10.1021/jp048147q},\n  url = {http://pubs.acs.org/doi/abs/10.1021/jp048147q}\n}\n", "Zhao2004_6908"),
        ]),
    :hyb_mgga_xc_mpwkcis1k => IdentifierText(
        "MPWKCIS1K for barrier heights",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("Y. Zhao, N. González-García, and D. G. Truhlar,  J. Phys. Chem. A 109, 2012–2018 (2005)", "10.1021/jp045141s", "@article{Zhao2005_2012,\n  author = {Zhao, Yan and Gonz\\'{a}lez-Garc\\'{i}a, N\\'{u}ria and Truhlar, Donald G.},\n  title = {Benchmark Database of Barrier Heights for Heavy Atom Transfer, Nucleophilic Substitution, Association, and Unimolecular Reactions and Its Use to Test Theoretical Methods},\n  journal = {J. Phys. Chem. A},\n  volume = {109},\n  number = {9},\n  pages = {2012--2018},\n  year = {2005},\n  doi = {10.1021/jp045141s},\n  url = {https://doi.org/10.1021/jp045141s}\n}\n", "Zhao2005_2012"),
        ]),
    :hyb_mgga_xc_pbe1kcis => IdentifierText(
        "PBE1KCIS for binding energies",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("Y. Zhao and D. G. Truhlar,  J. Chem. Theory Comput. 1, 415–432 (2005)", "10.1021/ct049851d", "@article{Zhao2005_415,\n  author = {Zhao, Yan and Truhlar, Donald G.},\n  title = {Benchmark Databases for Nonbonded Interactions and Their Use To Test Density Functional Theory},\n  journal = {J. Chem. Theory Comput.},\n  volume = {1},\n  number = {3},\n  pages = {415--432},\n  year = {2005},\n  doi = {10.1021/ct049851d},\n  url = {https://doi.org/10.1021/ct049851d}\n}\n", "Zhao2005_415"),
        ]),
    :hyb_mgga_xc_pw6b95 => IdentifierText(
        "Mixture of PW91 with BC95 from Zhao and Truhlar",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("Y. Zhao and D. G. Truhlar,  J. Phys. Chem. A 109, 5656 (2005)", "10.1021/jp050536c", "@article{Zhao2005_5656,\n  author = {Zhao, Y. and Truhlar, D. G.},\n  title = {Design of Density Functionals That Are Broadly Accurate for Thermochemistry, Thermochemical Kinetics, and Nonbonded Interactions},\n  journal = {J. Phys. Chem. A},\n  volume = {109},\n  number = {25},\n  pages = {5656},\n  year = {2005},\n  doi = {10.1021/jp050536c},\n  url = {http://pubs.acs.org/doi/abs/10.1021/jp050536c}\n}\n", "Zhao2005_5656"),
        ]),
    :hyb_mgga_xc_pw86b95 => IdentifierText(
        "Mixture of PW86 with BC95",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("A. D. Becke,  J. Chem. Phys. 104, 1040 (1996)", "10.1063/1.470829", "@article{Becke1996_1040,\n  author = {Becke, A. D.},\n  title = {Density-functional thermochemistry. {IV}. {A} new dynamical correlation functional and implications for exact-exchange mixing},\n  journal = {J. Chem. Phys.},\n  year = {1996},\n  volume = {104},\n  number = {3},\n  pages = {1040},\n  doi = {10.1063/1.470829},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/104/3/10.1063/1.470829}\n}\n", "Becke1996_1040"),
        ]),
    :hyb_mgga_xc_pwb6k => IdentifierText(
        "Mixture of PW91 with BC95 from Zhao and Truhlar for kinetics",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("Y. Zhao and D. G. Truhlar,  J. Phys. Chem. A 109, 5656 (2005)", "10.1021/jp050536c", "@article{Zhao2005_5656,\n  author = {Zhao, Y. and Truhlar, D. G.},\n  title = {Design of Density Functionals That Are Broadly Accurate for Thermochemistry, Thermochemical Kinetics, and Nonbonded Interactions},\n  journal = {J. Phys. Chem. A},\n  volume = {109},\n  number = {25},\n  pages = {5656},\n  year = {2005},\n  doi = {10.1021/jp050536c},\n  url = {http://pubs.acs.org/doi/abs/10.1021/jp050536c}\n}\n", "Zhao2005_5656"),
        ]),
    :hyb_mgga_xc_r2scan0 => IdentifierText(
        "r2SCAN0: r2SCAN hybrid like PBE0 with 25% exact exchange",
        (:have_exc, :have_vxc, :have_fxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2),
        LibxcReference[
            LibxcReference("M. Bursch, H. Neugebauer, S. Ehlert, and S. Grimme,  J. Chem. Phys. 156, 134105 (2022)", "10.1063/5.0086040", "@article{Bursch2022_134105,\n  author = {Bursch, Markus and Neugebauer, Hagen and Ehlert, Sebastian and Grimme, Stefan},\n  title = {Dispersion corrected r\$^2\${SCAN} based global hybrid functionals: r\$^2\${SCAN}h, r\$^2\${SCAN}0, and r\$^2\${SCAN}50},\n  journal = {J. Chem. Phys.},\n  volume = {156},\n  number = {13},\n  pages = {134105},\n  year = {2022},\n  doi = {10.1063/5.0086040},\n  URL = {https://doi.org/10.1063/5.0086040}\n}\n", "Bursch2022_134105"),
        ]),
    :hyb_mgga_xc_r2scan50 => IdentifierText(
        "r2SCAN50: r2SCAN hybrid like PBE50 with 50% exact exchange",
        (:have_exc, :have_vxc, :have_fxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2),
        LibxcReference[
            LibxcReference("M. Bursch, H. Neugebauer, S. Ehlert, and S. Grimme,  J. Chem. Phys. 156, 134105 (2022)", "10.1063/5.0086040", "@article{Bursch2022_134105,\n  author = {Bursch, Markus and Neugebauer, Hagen and Ehlert, Sebastian and Grimme, Stefan},\n  title = {Dispersion corrected r\$^2\${SCAN} based global hybrid functionals: r\$^2\${SCAN}h, r\$^2\${SCAN}0, and r\$^2\${SCAN}50},\n  journal = {J. Chem. Phys.},\n  volume = {156},\n  number = {13},\n  pages = {134105},\n  year = {2022},\n  doi = {10.1063/5.0086040},\n  URL = {https://doi.org/10.1063/5.0086040}\n}\n", "Bursch2022_134105"),
        ]),
    :hyb_mgga_xc_r2scanh => IdentifierText(
        "r2SCANh: r2SCAN hybrid like TPSSh with 10% exact exchange",
        (:have_exc, :have_vxc, :have_fxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2),
        LibxcReference[
            LibxcReference("M. Bursch, H. Neugebauer, S. Ehlert, and S. Grimme,  J. Chem. Phys. 156, 134105 (2022)", "10.1063/5.0086040", "@article{Bursch2022_134105,\n  author = {Bursch, Markus and Neugebauer, Hagen and Ehlert, Sebastian and Grimme, Stefan},\n  title = {Dispersion corrected r\$^2\${SCAN} based global hybrid functionals: r\$^2\${SCAN}h, r\$^2\${SCAN}0, and r\$^2\${SCAN}50},\n  journal = {J. Chem. Phys.},\n  volume = {156},\n  number = {13},\n  pages = {134105},\n  year = {2022},\n  doi = {10.1063/5.0086040},\n  URL = {https://doi.org/10.1063/5.0086040}\n}\n", "Bursch2022_134105"),
        ]),
    :hyb_mgga_xc_revtpssh => IdentifierText(
        "revTPSSh",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3),
        LibxcReference[
            LibxcReference("G. I. Csonka, J. P. Perdew, and A. Ruzsinszky,  J. Chem. Theory Comput. 6, 3688 (2010)", "10.1021/ct100488v", "@article{Csonka2010_3688,\n  author = {Csonka, G. I. and Perdew, J. P. and Ruzsinszky, A.},\n  title = {Global Hybrid Functionals: A Look at the Engine under the Hood},\n  journal = {J. Chem. Theory Comput.},\n  volume = {6},\n  number = {12},\n  pages = {3688},\n  year = {2010},\n  doi = {10.1021/ct100488v},\n  url = {http://pubs.acs.org/doi/abs/10.1021/ct100488v}\n}\n", "Csonka2010_3688"),
        ]),
    :hyb_mgga_xc_tpss0 => IdentifierText(
        "TPSS0 with 25% exact exchange",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3),
        LibxcReference[
            LibxcReference("S. Grimme,  J. Phys. Chem. A 109, 3067–3077 (2005)", "10.1021/jp050036j", "@article{Grimme2005_3067,\n  author = {Grimme, Stefan},\n  title = {Accurate Calculation of the Heats of Formation for Large Main Group Compounds with Spin-Component Scaled {MP2} Methods},\n  journal = {J. Phys. Chem. A},\n  volume = {109},\n  number = {13},\n  pages = {3067--3077},\n  year = {2005},\n  doi = {10.1021/jp050036j},\n  url = {https://doi.org/10.1021/jp050036j}\n}\n", "Grimme2005_3067"),
        ]),
    :hyb_mgga_xc_tpss1kcis => IdentifierText(
        "TPSS1KCIS for thermochemistry and kinetics",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("Y. Zhao, B. J. Lynch, and D. G. Truhlar,  Phys. Chem. Chem. Phys. 7, 43–52 (2005)", "10.1039/B416937A", "@article{Zhao2005_43,\n  author = {Zhao, Yan and Lynch, Benjamin J. and Truhlar, Donald G.},\n  title = {Multi-coefficient extrapolated density functional theory for thermochemistry and thermochemical kinetics},\n  journal = {Phys. Chem. Chem. Phys.},\n  year = {2005},\n  volume = {7},\n  issue = {1},\n  pages = {43--52},\n  publisher = {The Royal Society of Chemistry},\n  doi = {10.1039/B416937A},\n  url = {https://doi.org/10.1039/B416937A}\n}\n", "Zhao2005_43"),
        ]),
    :hyb_mgga_xc_tpssh => IdentifierText(
        "TPSSh",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3),
        LibxcReference[
            LibxcReference("V. N. Staroverov, G. E. Scuseria, J. Tao, and J. P. Perdew,  J. Chem. Phys. 119, 12129 (2003)", "10.1063/1.1626543", "@article{Staroverov2003_12129,\n  author = {Staroverov, V. N. and Scuseria, G. E. and Tao, J. and Perdew, J. P.},\n  title = {Comparative assessment of a new nonempirical density functional: Molecules and hydrogen-bonded complexes},\n  journal = {J. Chem. Phys.},\n  year = {2003},\n  volume = {119},\n  number = {23},\n  pages = {12129},\n  doi = {10.1063/1.1626543},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/119/23/10.1063/1.1626543}\n}\n", "Staroverov2003_12129"),
        ]),
    :hyb_mgga_xc_wb97m_v => IdentifierText(
        "wB97M-V exchange-correlation functional",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :hyb_cam, :vv10, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("N. Mardirossian and M. Head-Gordon,  J. Chem. Phys. 144, 214110 (2016)", "10.1063/1.4952647", "@article{Mardirossian2016_214110,\n  author = {Mardirossian, Narbe and Head-Gordon, Martin},\n  title = {\$\\omega\${B97M}-{V}: A combinatorially optimized, range-separated hybrid, meta-{GGA} density functional with {VV10} nonlocal correlation},\n  journal = {J. Chem. Phys.},\n  year = {2016},\n  volume = {144},\n  number = {21},\n  pages = {214110},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/144/21/10.1063/1.4952647},\n  doi = {10.1063/1.4952647}\n}\n", "Mardirossian2016_214110"),
        ]),
    :hyb_mgga_xc_x1b95 => IdentifierText(
        "Mixture of X with BC95",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("Y. Zhao and D. G. Truhlar,  J. Phys. Chem. A 108, 6908 (2004)", "10.1021/jp048147q", "@article{Zhao2004_6908,\n  author = {Zhao, Y. and Truhlar, D. G.},\n  title = {Hybrid Meta Density Functional Theory Methods for Thermochemistry, Thermochemical Kinetics, and Noncovalent Interactions: The {mPW1B95} and {mPWB1K} Models and Comparative Assessments for Hydrogen Bonding and van der Waals Interactions},\n  journal = {J. Phys. Chem. A},\n  volume = {108},\n  number = {33},\n  pages = {6908},\n  year = {2004},\n  doi = {10.1021/jp048147q},\n  url = {http://pubs.acs.org/doi/abs/10.1021/jp048147q}\n}\n", "Zhao2004_6908"),
        ]),
    :hyb_mgga_xc_xb1k => IdentifierText(
        "Mixture of X with BC95 for kinetics",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("Y. Zhao and D. G. Truhlar,  J. Phys. Chem. A 108, 6908 (2004)", "10.1021/jp048147q", "@article{Zhao2004_6908,\n  author = {Zhao, Y. and Truhlar, D. G.},\n  title = {Hybrid Meta Density Functional Theory Methods for Thermochemistry, Thermochemical Kinetics, and Noncovalent Interactions: The {mPW1B95} and {mPWB1K} Models and Comparative Assessments for Hydrogen Bonding and van der Waals Interactions},\n  journal = {J. Phys. Chem. A},\n  volume = {108},\n  number = {33},\n  pages = {6908},\n  year = {2004},\n  doi = {10.1021/jp048147q},\n  url = {http://pubs.acs.org/doi/abs/10.1021/jp048147q}\n}\n", "Zhao2004_6908"),
        ]),
    :lda_c_1d_css => IdentifierText(
        "Casula, Sorella & Senatore",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim1, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("M. Casula, S. Sorella, and G. Senatore,  Phys. Rev. B 74, 245427 (2006)", "10.1103/PhysRevB.74.245427", "@article{Casula2006_245427,\n  author = {Casula, M. and Sorella, S. and Senatore, G.},\n  title = {Ground state properties of the one-dimensional {Coulomb} gas using the lattice regularized diffusion {Monte} {Carlo} method},\n  journal = {Phys. Rev. B},\n  volume = {74},\n  issue = {24},\n  pages = {245427},\n  year = {2006},\n  month = {Dec},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevB.74.245427},\n  url = {http://link.aps.org/doi/10.1103/PhysRevB.74.245427}\n}\n", "Casula2006_245427"),
        ]),
    :lda_c_1d_loos => IdentifierText(
        "P-F Loos correlation LDA",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim1, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("P.-F. Loos,  J. Chem. Phys. 138, 064108 (2013)", "10.1063/1.4790613", "@article{Loos2013_064108,\n  author = {Loos, P.-F.},\n  title = {High-density correlation energy expansion of the one-dimensional uniform electron gas},\n  journal = {J. Chem. Phys.},\n  year = {2013},\n  volume = {138},\n  number = {6},\n  pages = {064108},\n  doi = {10.1063/1.4790613},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/138/6/10.1063/1.4790613}\n}\n", "Loos2013_064108"),
        ]),
    :lda_c_2d_amgb => IdentifierText(
        "AMGB (for 2D systems)",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim2, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("C. Attaccalite, S. Moroni, P. Gori-Giorgi, and G. B. Bachelet,  Phys. Rev. Lett. 88, 256601 (2002)", "10.1103/PhysRevLett.88.256601", "@article{Attaccalite2002_256601,\n  author = {Attaccalite, C. and Moroni, S. and Gori-Giorgi, P. and Bachelet, G. B.},\n  title = {Correlation Energy and Spin Polarization in the {2D} Electron Gas},\n  journal = {Phys. Rev. Lett.},\n  volume = {88},\n  issue = {25},\n  pages = {256601},\n  year = {2002},\n  month = {Jun},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevLett.88.256601},\n  url = {http://link.aps.org/doi/10.1103/PhysRevLett.88.256601}\n}\n", "Attaccalite2002_256601"),
        ]),
    :lda_c_2d_prm => IdentifierText(
        "PRM (for 2D systems)",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim2, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("S. Pittalis, E. Räsänen, and M. A. L. Marques,  Phys. Rev. B 78, 195322 (2008)", "10.1103/PhysRevB.78.195322", "@article{Pittalis2008_195322,\n  author = {Pittalis, S. and R\\\"as\\\"anen, E. and Marques, M. A. L.},\n  title = {Local correlation functional for electrons in two dimensions},\n  journal = {Phys. Rev. B},\n  volume = {78},\n  issue = {19},\n  pages = {195322},\n  year = {2008},\n  month = {Nov},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevB.78.195322},\n  url = {http://link.aps.org/doi/10.1103/PhysRevB.78.195322}\n}\n", "Pittalis2008_195322"),
        ]),
    :lda_c_bj89 => IdentifierText(
        "Barbiellini & Jarlborg 89",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("B. Barbiellini and T. Jarlborg,  J. Phys.: Condens. Matter 1, 8865 (1989)", "10.1088/0953-8984/1/45/012", "@article{Barbiellini1989_8865,\n  author = {Barbiellini, B. and Jarlborg, T.},\n  title = {A simple approach towards non-local potentials: theory and applications},\n  journal = {J. Phys.: Condens. Matter},\n  volume = {1},\n  number = {45},\n  pages = {8865},\n  year = {1989},\n  doi = {10.1088/0953-8984/1/45/012},\n  url = {https://doi.org/10.1088/0953-8984/1/45/012}\n}\n", "Barbiellini1989_8865"),
        ]),
    :lda_c_br78 => IdentifierText(
        "Brual & Rothstein 78",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("G. Brual Jr. and S. M. Rothstein,  J. Chem. Phys. 69, 1177–1183 (1978)", "10.1063/1.436705", "@article{Brual1978_1177,\n  author = {Brual Jr., Gregorio and Rothstein, Stuart M.},\n  title = {Rare gas interactions using an improved statistical method},\n  journal = {J. Chem. Phys.},\n  volume = {69},\n  number = {3},\n  pages = {1177--1183},\n  year = {1978},\n  doi = {10.1063/1.436705},\n  url = {http://aip.scitation.org/doi/abs/10.1063/1.436705}\n}\n", "Brual1978_1177"),
        ]),
    :lda_c_chachiyo => IdentifierText(
        "Chachiyo simple 2 parameter correlation",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("T. Chachiyo,  J. Chem. Phys. 145, 021101 (2016)", "10.1063/1.4958669", "@article{Chachiyo2016_021101,\n  author = {Chachiyo, Teepanis},\n  title = {Simple and accurate uniform electron gas correlation energy for the full range of densities},\n  journal = {J. Chem. Phys.},\n  year = {2016},\n  volume = {145},\n  number = {2},\n  pages = {021101},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/145/2/10.1063/1.4958669},\n  doi = {10.1063/1.4958669}\n}\n", "Chachiyo2016_021101"),
        ]),
    :lda_c_chachiyo_mod => IdentifierText(
        "Chachiyo simple 2 parameter correlation with modified spin scaling",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("T. Chachiyo and H. Chachiyo,  Comput. Theor. Chem. 1172, 112669 (2020)", "10.1016/j.comptc.2019.112669", "@article{Chachiyo2020_112669,\n  author = {Chachiyo, Teepanis and Chachiyo, Hathaithip},\n  title = {Understanding electron correlation energy through density functional theory},\n  journal = {Comput. Theor. Chem.},\n  volume = {1172},\n  pages = {112669},\n  year = {2020},\n  issn = {2210-271X},\n  doi = {10.1016/j.comptc.2019.112669},\n  url = {http://www.sciencedirect.com/science/article/pii/S2210271X19303652}\n}\n", "Chachiyo2020_112669"),
            LibxcReference("T. Chachiyo,  J. Chem. Phys. 145, 021101 (2016)", "10.1063/1.4958669", "@article{Chachiyo2016_021101,\n  author = {Chachiyo, Teepanis},\n  title = {Simple and accurate uniform electron gas correlation energy for the full range of densities},\n  journal = {J. Chem. Phys.},\n  year = {2016},\n  volume = {145},\n  number = {2},\n  pages = {021101},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/145/2/10.1063/1.4958669},\n  doi = {10.1063/1.4958669}\n}\n", "Chachiyo2016_021101"),
        ]),
    :lda_c_epc17 => IdentifierText(
        "epc17(-1): electron-proton correlation 2017",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("Y. Yang, K. R. Brorsen, T. Culpitt, M. V. Pak, and S. Hammes-Schiffer,  J. Chem. Phys. 147, 114113 (2017)", "10.1063/1.4996038", "@article{Yang2017_114113,\n  author = {Yang, Yang and Brorsen, Kurt R. and Culpitt, Tanner and Pak, Michael V. and Hammes-Schiffer, Sharon},\n  title = {{Development of a practical multicomponent density functional for electron-proton correlation to produce accurate proton densities}},\n  journal = {J. Chem. Phys.},\n  volume = {147},\n  number = {11},\n  pages = {114113},\n  year = {2017},\n  month = {09},\n  doi = {10.1063/1.4996038},\n  url = {https://doi.org/10.1063/1.4996038}\n}\n", "Yang2017_114113"),
            LibxcReference("This is an electron-proton correlation functional, implemented in Libxc using a trick: feeding in the total electronic density as 'spin-up' and the protonic density as 'spin-down', all the necessary derivatives required for implementing the nuclear-electronic orbital method are generated and are accessible using the standard techniques. This functional should not be used for electrons, only.", "", "@misc{epcnote,\n  note = {This is an electron-proton correlation functional, implemented in Libxc using a trick: feeding in the total electronic density as 'spin-up' and the protonic density as 'spin-down', all the necessary derivatives required for implementing the nuclear-electronic orbital method are generated and are accessible using the standard techniques. This functional should not be used for electrons, only.}\n}\n", "epcnote"),
        ]),
    :lda_c_epc17_2 => IdentifierText(
        "epc17-2: electron-proton correlation 2017 for proton affinities",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("K. R. Brorsen, Y. Yang, and S. Hammes-Schiffer,  J. Phys. Chem. Lett. 8, 3488–3493 (2017)", "10.1021/acs.jpclett.7b01442", "@article{Brorsen2017_3488,\n  author = {Brorsen, Kurt R. and Yang, Yang and Hammes-Schiffer, Sharon},\n  title = {Multicomponent Density Functional Theory: Impact of Nuclear Quantum Effects on Proton Affinities and Geometries},\n  journal = {J. Phys. Chem. Lett.},\n  volume = {8},\n  number = {15},\n  pages = {3488--3493},\n  year = {2017},\n  doi = {10.1021/acs.jpclett.7b01442},\n  URL = {https://doi.org/10.1021/acs.jpclett.7b01442}\n}\n", "Brorsen2017_3488"),
            LibxcReference("This is an electron-proton correlation functional, implemented in Libxc using a trick: feeding in the total electronic density as 'spin-up' and the protonic density as 'spin-down', all the necessary derivatives required for implementing the nuclear-electronic orbital method are generated and are accessible using the standard techniques. This functional should not be used for electrons, only.", "", "@misc{epcnote,\n  note = {This is an electron-proton correlation functional, implemented in Libxc using a trick: feeding in the total electronic density as 'spin-up' and the protonic density as 'spin-down', all the necessary derivatives required for implementing the nuclear-electronic orbital method are generated and are accessible using the standard techniques. This functional should not be used for electrons, only.}\n}\n", "epcnote"),
        ]),
    :lda_c_epc18_1 => IdentifierText(
        "epc18-1: electron-proton correlation 2018",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("K. R. Brorsen, P. E. Schneider, and S. Hammes-Schiffer,  J. Chem. Phys. 149, 044110 (2018)", "10.1063/1.5037945", "@article{Brorsen2018_044110,\n  author = {Brorsen, Kurt R. and Schneider, Patrick E. and Hammes-Schiffer, Sharon},\n  title = {{Alternative forms and transferability of electron-proton correlation functionals in nuclear-electronic orbital density functional theory}},\n  journal = {J. Chem. Phys.},\n  volume = {149},\n  number = {4},\n  pages = {044110},\n  year = {2018},\n  month = {07},\n  issn = {0021-9606},\n  doi = {10.1063/1.5037945},\n  url = {https://doi.org/10.1063/1.5037945}\n}\n", "Brorsen2018_044110"),
            LibxcReference("This is an electron-proton correlation functional, implemented in Libxc using a trick: feeding in the total electronic density as 'spin-up' and the protonic density as 'spin-down', all the necessary derivatives required for implementing the nuclear-electronic orbital method are generated and are accessible using the standard techniques. This functional should not be used for electrons, only.", "", "@misc{epcnote,\n  note = {This is an electron-proton correlation functional, implemented in Libxc using a trick: feeding in the total electronic density as 'spin-up' and the protonic density as 'spin-down', all the necessary derivatives required for implementing the nuclear-electronic orbital method are generated and are accessible using the standard techniques. This functional should not be used for electrons, only.}\n}\n", "epcnote"),
        ]),
    :lda_c_epc18_2 => IdentifierText(
        "epc18-2: electron-proton correlation 2018 for proton affinities",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("K. R. Brorsen, P. E. Schneider, and S. Hammes-Schiffer,  J. Chem. Phys. 149, 044110 (2018)", "10.1063/1.5037945", "@article{Brorsen2018_044110,\n  author = {Brorsen, Kurt R. and Schneider, Patrick E. and Hammes-Schiffer, Sharon},\n  title = {{Alternative forms and transferability of electron-proton correlation functionals in nuclear-electronic orbital density functional theory}},\n  journal = {J. Chem. Phys.},\n  volume = {149},\n  number = {4},\n  pages = {044110},\n  year = {2018},\n  month = {07},\n  issn = {0021-9606},\n  doi = {10.1063/1.5037945},\n  url = {https://doi.org/10.1063/1.5037945}\n}\n", "Brorsen2018_044110"),
            LibxcReference("This is an electron-proton correlation functional, implemented in Libxc using a trick: feeding in the total electronic density as 'spin-up' and the protonic density as 'spin-down', all the necessary derivatives required for implementing the nuclear-electronic orbital method are generated and are accessible using the standard techniques. This functional should not be used for electrons, only.", "", "@misc{epcnote,\n  note = {This is an electron-proton correlation functional, implemented in Libxc using a trick: feeding in the total electronic density as 'spin-up' and the protonic density as 'spin-down', all the necessary derivatives required for implementing the nuclear-electronic orbital method are generated and are accessible using the standard techniques. This functional should not be used for electrons, only.}\n}\n", "epcnote"),
        ]),
    :lda_c_gk72 => IdentifierText(
        "Gordon and Kim 1972",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("R. G. Gordon and Y. S. Kim,  J. Chem. Phys. 56, 3122–3133 (1972)", "10.1063/1.1677649", "@article{Gordon1972_3122,\n  author = {Gordon, Roy G. and Kim, Yung Sik},\n  title = {Theory for the Forces between Closed-Shell Atoms and Molecules},\n  journal = {J. Chem. Phys.},\n  volume = {56},\n  number = {6},\n  pages = {3122--3133},\n  year = {1972},\n  doi = {10.1063/1.1677649},\n  url = {https://doi.org/10.1063/1.1677649}\n}\n", "Gordon1972_3122"),
        ]),
    :lda_c_gl => IdentifierText(
        "Gunnarsson & Lundqvist",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("O. Gunnarsson and B. I. Lundqvist,  Phys. Rev. B 13, 4274 (1976)", "10.1103/PhysRevB.13.4274", "@article{Gunnarsson1976_4274,\n  author = {Gunnarsson, O. and Lundqvist, B. I.},\n  title = {Exchange and correlation in atoms, molecules, and solids by the spin-density-functional formalism},\n  journal = {Phys. Rev. B},\n  volume = {13},\n  issue = {10},\n  pages = {4274},\n  year = {1976},\n  month = {May},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevB.13.4274},\n  url = {http://link.aps.org/doi/10.1103/PhysRevB.13.4274}\n}\n", "Gunnarsson1976_4274"),
        ]),
    :lda_c_gombas => IdentifierText(
        "Gombas",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("P. Gombás,  Fortschr. Phys. 13, 137–156 (1965)", "10.1002/prop.19650130402", "@article{Gombas1965_137,\n  author = {Gomb\\'{a}s, P.},\n  title = {Pseudopotentiale},\n  journal = {Fortschr. Phys.},\n  volume = {13},\n  number = {4},\n  pages = {137--156},\n  doi = {10.1002/prop.19650130402},\n  url = {https://onlinelibrary.wiley.com/doi/abs/10.1002/prop.19650130402},\n  year = {1965}\n}\n", "Gombas1965_137"),
        ]),
    :lda_c_hl => IdentifierText(
        "Hedin & Lundqvist",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("L. Hedin and B. I. Lundqvist,  J. Phys. C: Solid State Phys. 4, 2064 (1971)", "10.1088/0022-3719/4/14/022", "@article{Hedin1971_2064,\n  author = {Hedin, L. and Lundqvist, B. I.},\n  title = {Explicit local exchange-correlation potentials},\n  journal = {J. Phys. C: Solid State Phys.},\n  volume = {4},\n  number = {14},\n  pages = {2064},\n  year = {1971},\n  doi = {10.1088/0022-3719/4/14/022},\n  url = {http://stacks.iop.org/0022-3719/4/i=14/a=022}\n}\n", "Hedin1971_2064"),
        ]),
    :lda_c_karasiev => IdentifierText(
        "Karasiev reparameterization of Chachiyo",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("V. V. Karasiev,  J. Chem. Phys. 145, 157101 (2016)", "10.1063/1.4964758", "@article{Karasiev2016_157101,\n  author = {Karasiev, Valentin V.},\n  title = {Comment on ``{Communication}: {Simple} and accurate uniform electron gas correlation energy for the full range of densities'' [{J.} {Chem.} {Phys.} 145, 021101 (2016)]},\n  journal = {J. Chem. Phys.},\n  volume = {145},\n  number = {15},\n  pages = {157101},\n  year = {2016},\n  doi = {10.1063/1.4964758},\n  url = {https://doi.org/10.1063/1.4964758}\n}\n", "Karasiev2016_157101"),
        ]),
    :lda_c_karasiev_mod => IdentifierText(
        "Karasiev reparameterization of Chachiyo",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("T. Chachiyo and H. Chachiyo,  Comput. Theor. Chem. 1172, 112669 (2020)", "10.1016/j.comptc.2019.112669", "@article{Chachiyo2020_112669,\n  author = {Chachiyo, Teepanis and Chachiyo, Hathaithip},\n  title = {Understanding electron correlation energy through density functional theory},\n  journal = {Comput. Theor. Chem.},\n  volume = {1172},\n  pages = {112669},\n  year = {2020},\n  issn = {2210-271X},\n  doi = {10.1016/j.comptc.2019.112669},\n  url = {http://www.sciencedirect.com/science/article/pii/S2210271X19303652}\n}\n", "Chachiyo2020_112669"),
            LibxcReference("V. V. Karasiev,  J. Chem. Phys. 145, 157101 (2016)", "10.1063/1.4964758", "@article{Karasiev2016_157101,\n  author = {Karasiev, Valentin V.},\n  title = {Comment on ``{Communication}: {Simple} and accurate uniform electron gas correlation energy for the full range of densities'' [{J.} {Chem.} {Phys.} 145, 021101 (2016)]},\n  journal = {J. Chem. Phys.},\n  volume = {145},\n  number = {15},\n  pages = {157101},\n  year = {2016},\n  doi = {10.1063/1.4964758},\n  url = {https://doi.org/10.1063/1.4964758}\n}\n", "Karasiev2016_157101"),
        ]),
    :lda_c_lp96 => IdentifierText(
        "Liu-Parr correlation",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("S. Liu and R. G. Parr,  Phys. Rev. A 53, 2211–2219 (1996)", "10.1103/PhysRevA.53.2211", "@article{Liu1996_2211,\n  author = {Liu, Shubin and Parr, Robert G.},\n  title = {Expansions of the correlation-energy density functional \${E}\\_{c}[\\rho]\$ and its kinetic-energy component \${T}\\_{c}[\\rho]\$ in terms of homogeneous functionals},\n  journal = {Phys. Rev. A},\n  volume = {53},\n  issue = {4},\n  pages = {2211--2219},\n  year = {1996},\n  month = {Apr},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevA.53.2211},\n  url = {http://link.aps.org/doi/10.1103/PhysRevA.53.2211}\n}\n", "Liu1996_2211"),
            LibxcReference("S. Liu and R.G Parr,  J. Mol. Struct.: THEOCHEM 501–502, 29–34 (2000)", "10.1016/S0166-1280(99)00410-8", "@article{Liu2000_29,\n  author = {Liu, S and Parr, R.G},\n  title = {Homogeneities in density of various {LDA} energy functionals},\n  journal = {J. Mol. Struct.: THEOCHEM},\n  volume = {501--502},\n  number = {},\n  pages = {29--34},\n  year = {2000},\n  issn = {0166-1280},\n  doi = {10.1016/S0166-1280(99)00410-8},\n  url = {http://www.sciencedirect.com/science/article/pii/S0166128099004108}\n}\n", "Liu2000_29"),
        ]),
    :lda_c_lp96_b => IdentifierText(
        "Liu-Parr correlation with 4 parameters",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("S. Liu and R. G. Parr,  Phys. Rev. A 53, 2211–2219 (1996)", "10.1103/PhysRevA.53.2211", "@article{Liu1996_2211,\n  author = {Liu, Shubin and Parr, Robert G.},\n  title = {Expansions of the correlation-energy density functional \${E}\\_{c}[\\rho]\$ and its kinetic-energy component \${T}\\_{c}[\\rho]\$ in terms of homogeneous functionals},\n  journal = {Phys. Rev. A},\n  volume = {53},\n  issue = {4},\n  pages = {2211--2219},\n  year = {1996},\n  month = {Apr},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevA.53.2211},\n  url = {http://link.aps.org/doi/10.1103/PhysRevA.53.2211}\n}\n", "Liu1996_2211"),
            LibxcReference("S. Liu and R.G Parr,  J. Mol. Struct.: THEOCHEM 501–502, 29–34 (2000)", "10.1016/S0166-1280(99)00410-8", "@article{Liu2000_29,\n  author = {Liu, S and Parr, R.G},\n  title = {Homogeneities in density of various {LDA} energy functionals},\n  journal = {J. Mol. Struct.: THEOCHEM},\n  volume = {501--502},\n  number = {},\n  pages = {29--34},\n  year = {2000},\n  issn = {0166-1280},\n  doi = {10.1016/S0166-1280(99)00410-8},\n  url = {http://www.sciencedirect.com/science/article/pii/S0166128099004108}\n}\n", "Liu2000_29"),
        ]),
    :lda_c_mcweeny => IdentifierText(
        "McWeeny 76",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("R. McWeeny. Present status of the correlation problem. In B. Pullman and R. Parr, editors, The New World of Quantum Chemistry, 3–31. Boston, 1976. Reidel. doi:10.1007/978-94-010-1523-3_1.", "10.1007/978-94-010-1523-3_1", "@inproceedings{McWeeny1976_3,\n  author = {McWeeny, R.},\n  editor = {Pullman, B. and Parr, R.},\n  title = {Present Status of the Correlation Problem},\n  booktitle = {The New World of Quantum Chemistry},\n  year = {1976},\n  pages = {3--31},\n  address = {Boston},\n  publisher = {Reidel},\n  doi = {10.1007/978-94-010-1523-3\\_1}\n}\n", "McWeeny1976_3"),
            LibxcReference("G. Brual Jr. and S. M. Rothstein,  J. Chem. Phys. 69, 1177–1183 (1978)", "10.1063/1.436705", "@article{Brual1978_1177,\n  author = {Brual Jr., Gregorio and Rothstein, Stuart M.},\n  title = {Rare gas interactions using an improved statistical method},\n  journal = {J. Chem. Phys.},\n  volume = {69},\n  number = {3},\n  pages = {1177--1183},\n  year = {1978},\n  doi = {10.1063/1.436705},\n  url = {http://aip.scitation.org/doi/abs/10.1063/1.436705}\n}\n", "Brual1978_1177"),
        ]),
    :lda_c_ml1 => IdentifierText(
        "Modified LSD (version 1) of Proynov and Salahub",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("E. I. Proynov and D. R. Salahub,  Phys. Rev. B 49, 7874 (1994)", "10.1103/PhysRevB.49.7874", "@article{Proynov1994_7874,\n  author = {Proynov, E. I. and Salahub, D. R.},\n  title = {Simple but efficient correlation functional from a model pair-correlation function},\n  journal = {Phys. Rev. B},\n  volume = {49},\n  issue = {12},\n  pages = {7874},\n  year = {1994},\n  month = {Mar},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevB.49.7874},\n  url = {http://link.aps.org/doi/10.1103/PhysRevB.49.7874}\n}\n", "Proynov1994_7874"),
            LibxcReference("E. I. Proynov and D. R. Salahub,  Phys. Rev. B 57, 12616–12616 (1998)", "10.1103/PhysRevB.57.12616", "@article{Proynov1998_12616,\n  author = {Proynov, Emil I. and Salahub, Dennis R.},\n  title = {Erratum: {Simple} but efficient correlation functional from a model pair-correlation function [{Phys.} {Rev.} {B} 49, 7874 (1994)]},\n  journal = {Phys. Rev. B},\n  volume = {57},\n  issue = {19},\n  pages = {12616--12616},\n  year = {1998},\n  month = {May},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevB.57.12616},\n  url = {https://link.aps.org/doi/10.1103/PhysRevB.57.12616}\n}\n", "Proynov1998_12616"),
        ]),
    :lda_c_ml2 => IdentifierText(
        "Modified LSD (version 2) of Proynov and Salahub",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("E. I. Proynov and D. R. Salahub,  Phys. Rev. B 49, 7874 (1994)", "10.1103/PhysRevB.49.7874", "@article{Proynov1994_7874,\n  author = {Proynov, E. I. and Salahub, D. R.},\n  title = {Simple but efficient correlation functional from a model pair-correlation function},\n  journal = {Phys. Rev. B},\n  volume = {49},\n  issue = {12},\n  pages = {7874},\n  year = {1994},\n  month = {Mar},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevB.49.7874},\n  url = {http://link.aps.org/doi/10.1103/PhysRevB.49.7874}\n}\n", "Proynov1994_7874"),
            LibxcReference("E. I. Proynov and D. R. Salahub,  Phys. Rev. B 57, 12616–12616 (1998)", "10.1103/PhysRevB.57.12616", "@article{Proynov1998_12616,\n  author = {Proynov, Emil I. and Salahub, Dennis R.},\n  title = {Erratum: {Simple} but efficient correlation functional from a model pair-correlation function [{Phys.} {Rev.} {B} 49, 7874 (1994)]},\n  journal = {Phys. Rev. B},\n  volume = {57},\n  issue = {19},\n  pages = {12616--12616},\n  year = {1998},\n  month = {May},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevB.57.12616},\n  url = {https://link.aps.org/doi/10.1103/PhysRevB.57.12616}\n}\n", "Proynov1998_12616"),
        ]),
    :lda_c_ob_pw => IdentifierText(
        "Ortiz & Ballone (PW parametrization)",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("G. Ortiz and P. Ballone,  Phys. Rev. B 50, 1391 (1994)", "10.1103/PhysRevB.50.1391", "@article{Ortiz1994_1391,\n  author = {Ortiz, G. and Ballone, P.},\n  title = {Correlation energy, structure factor, radial distribution function, and momentum distribution of the spin-polarized uniform electron gas},\n  journal = {Phys. Rev. B},\n  volume = {50},\n  issue = {3},\n  pages = {1391},\n  year = {1994},\n  month = {Jul},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevB.50.1391},\n  url = {http://link.aps.org/doi/10.1103/PhysRevB.50.1391}\n}\n", "Ortiz1994_1391"),
            LibxcReference("G. Ortiz and P. Ballone,  Phys. Rev. B 56, 9970 (1997)", "10.1103/PhysRevB.56.9970", "@article{Ortiz1997_9970,\n  author = {Ortiz, G. and Ballone, P.},\n  title = {Erratum: {Correlation} energy, structure factor, radial distribution function, and momentum distribution of the spin-polarized uniform electron gas [{Phys.} {Rev.} {B} 50, 1391 (1994)]},\n  journal = {Phys. Rev. B},\n  volume = {56},\n  issue = {15},\n  pages = {9970},\n  year = {1997},\n  month = {Oct},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevB.56.9970},\n  url = {http://link.aps.org/doi/10.1103/PhysRevB.56.9970}\n}\n", "Ortiz1997_9970"),
            LibxcReference("J. P. Perdew and Y. Wang,  Phys. Rev. B 45, 13244 (1992)", "10.1103/PhysRevB.45.13244", "@article{Perdew1992_13244,\n  author = {Perdew, J. P. and Wang, Y.},\n  title = {Accurate and simple analytic representation of the electron-gas correlation energy},\n  journal = {Phys. Rev. B},\n  volume = {45},\n  issue = {23},\n  pages = {13244},\n  year = {1992},\n  month = {Jun},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevB.45.13244},\n  url = {http://link.aps.org/doi/10.1103/PhysRevB.45.13244}\n}\n", "Perdew1992_13244"),
            LibxcReference("Added extra digits to some constants as in the PBE routine (http://dft.rutgers.edu/pubs/PBE.asc).", "", "@misc{PBEdigits,\n  note = {Added extra digits to some constants as in the {PBE} routine (http://dft.rutgers.edu/pubs/PBE.asc)}\n}\n", "PBEdigits"),
        ]),
    :lda_c_ob_pz => IdentifierText(
        "Ortiz & Ballone (PZ parametrization)",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("G. Ortiz and P. Ballone,  Phys. Rev. B 50, 1391 (1994)", "10.1103/PhysRevB.50.1391", "@article{Ortiz1994_1391,\n  author = {Ortiz, G. and Ballone, P.},\n  title = {Correlation energy, structure factor, radial distribution function, and momentum distribution of the spin-polarized uniform electron gas},\n  journal = {Phys. Rev. B},\n  volume = {50},\n  issue = {3},\n  pages = {1391},\n  year = {1994},\n  month = {Jul},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevB.50.1391},\n  url = {http://link.aps.org/doi/10.1103/PhysRevB.50.1391}\n}\n", "Ortiz1994_1391"),
            LibxcReference("G. Ortiz and P. Ballone,  Phys. Rev. B 56, 9970 (1997)", "10.1103/PhysRevB.56.9970", "@article{Ortiz1997_9970,\n  author = {Ortiz, G. and Ballone, P.},\n  title = {Erratum: {Correlation} energy, structure factor, radial distribution function, and momentum distribution of the spin-polarized uniform electron gas [{Phys.} {Rev.} {B} 50, 1391 (1994)]},\n  journal = {Phys. Rev. B},\n  volume = {56},\n  issue = {15},\n  pages = {9970},\n  year = {1997},\n  month = {Oct},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevB.56.9970},\n  url = {http://link.aps.org/doi/10.1103/PhysRevB.56.9970}\n}\n", "Ortiz1997_9970"),
        ]),
    :lda_c_ow => IdentifierText(
        "Optimized Wigner",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("P. A. Stewart and P. M. W. Gill,  J. Chem. Soc, Faraday Trans. 91, 4337–4341 (1995)", "10.1039/FT9959104337", "@article{Stewart1995_4337,\n  author = {Stewart, Phillip A. and Gill, Peter M. W.},\n  title = {{Becke}--{Wigner}: a simple but powerful density functional},\n  journal = {J. Chem. Soc., Faraday Trans.},\n  year = {1995},\n  volume = {91},\n  issue = {24},\n  pages = {4337--4341},\n  publisher = {The Royal Society of Chemistry},\n  doi = {10.1039/FT9959104337},\n  url = {https://doi.org/10.1039/FT9959104337}\n}\n", "Stewart1995_4337"),
        ]),
    :lda_c_ow_lyp => IdentifierText(
        "Wigner with corresponding LYP parameters",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("P. A. Stewart and P. M. W. Gill,  J. Chem. Soc, Faraday Trans. 91, 4337–4341 (1995)", "10.1039/FT9959104337", "@article{Stewart1995_4337,\n  author = {Stewart, Phillip A. and Gill, Peter M. W.},\n  title = {{Becke}--{Wigner}: a simple but powerful density functional},\n  journal = {J. Chem. Soc., Faraday Trans.},\n  year = {1995},\n  volume = {91},\n  issue = {24},\n  pages = {4337--4341},\n  publisher = {The Royal Society of Chemistry},\n  doi = {10.1039/FT9959104337},\n  url = {https://doi.org/10.1039/FT9959104337}\n}\n", "Stewart1995_4337"),
        ]),
    :lda_c_pk09 => IdentifierText(
        "Proynov and Kong 2009",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3),
        LibxcReference[
            LibxcReference("E. Proynov and J. Kong,  Phys. Rev. A 79, 014103 (2009)", "10.1103/PhysRevA.79.014103", "@article{Proynov2009_014103,\n  author = {Proynov, Emil and Kong, Jing},\n  title = {Analytic form of the correlation energy of the uniform electron gas},\n  journal = {Phys. Rev. A},\n  volume = {79},\n  issue = {1},\n  pages = {014103},\n  year = {2009},\n  month = {Jan},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevA.79.014103},\n  url = {http://link.aps.org/doi/10.1103/PhysRevA.79.014103}\n}\n", "Proynov2009_014103"),
            LibxcReference("E. Proynov and J. Kong,  Phys. Rev. A 95, 059904 (2017)", "10.1103/PhysRevA.95.059904", "@article{Proynov2017_059904,\n  author = {Proynov, Emil and Kong, Jing},\n  title = {Erratum: {Analytic} form of the correlation energy of the uniform electron gas [{Phys.} {Rev.} {A} 79, 014103 (2009)]},\n  journal = {Phys. Rev. A},\n  volume = {95},\n  issue = {5},\n  pages = {059904},\n  year = {2017},\n  month = {May},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevA.95.059904},\n  url = {https://link.aps.org/doi/10.1103/PhysRevA.95.059904}\n}\n", "Proynov2017_059904"),
        ]),
    :lda_c_pmgb06 => IdentifierText(
        "Long-range LDA correlation functional",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :development, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("S. Paziani, S. Moroni, P. Gori-Giorgi, and G. B. Bachelet,  Phys. Rev. B 73, 155111 (2006)", "10.1103/PhysRevB.73.155111", "@article{Paziani2006_155111,\n  author = {Paziani, Simone and Moroni, Saverio and Gori-Giorgi, Paola and Bachelet, Giovanni B.},\n  title = {Local-spin-density functional for multideterminant density functional theory},\n  journal = {Phys. Rev. B},\n  volume = {73},\n  issue = {15},\n  pages = {155111},\n  year = {2006},\n  month = {Apr},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevB.73.155111},\n  url = {https://link.aps.org/doi/10.1103/PhysRevB.73.155111}\n}\n", "Paziani2006_155111"),
        ]),
    :lda_c_pw => IdentifierText(
        "Perdew & Wang",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("J. P. Perdew and Y. Wang,  Phys. Rev. B 45, 13244 (1992)", "10.1103/PhysRevB.45.13244", "@article{Perdew1992_13244,\n  author = {Perdew, J. P. and Wang, Y.},\n  title = {Accurate and simple analytic representation of the electron-gas correlation energy},\n  journal = {Phys. Rev. B},\n  volume = {45},\n  issue = {23},\n  pages = {13244},\n  year = {1992},\n  month = {Jun},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevB.45.13244},\n  url = {http://link.aps.org/doi/10.1103/PhysRevB.45.13244}\n}\n", "Perdew1992_13244"),
        ]),
    :lda_c_pw_erf => IdentifierText(
        "Short ranged correlation LDA (erfc)",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("S. Paziani, S. Moroni, P. Gori-Giorgi, and G. B. Bachelet,  Phys. Rev. B 73, 155111 (2006)", "10.1103/PhysRevB.73.155111", "@article{Paziani2006_155111,\n  author = {Paziani, Simone and Moroni, Saverio and Gori-Giorgi, Paola and Bachelet, Giovanni B.},\n  title = {Local-spin-density functional for multideterminant density functional theory},\n  journal = {Phys. Rev. B},\n  volume = {73},\n  issue = {15},\n  pages = {155111},\n  year = {2006},\n  month = {Apr},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevB.73.155111},\n  url = {https://link.aps.org/doi/10.1103/PhysRevB.73.155111}\n}\n", "Paziani2006_155111"),
        ]),
    :lda_c_pw_mod => IdentifierText(
        "Perdew & Wang (modified)",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("J. P. Perdew and Y. Wang,  Phys. Rev. B 45, 13244 (1992)", "10.1103/PhysRevB.45.13244", "@article{Perdew1992_13244,\n  author = {Perdew, J. P. and Wang, Y.},\n  title = {Accurate and simple analytic representation of the electron-gas correlation energy},\n  journal = {Phys. Rev. B},\n  volume = {45},\n  issue = {23},\n  pages = {13244},\n  year = {1992},\n  month = {Jun},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevB.45.13244},\n  url = {http://link.aps.org/doi/10.1103/PhysRevB.45.13244}\n}\n", "Perdew1992_13244"),
            LibxcReference("Added extra digits to some constants as in the PBE routine (http://dft.rutgers.edu/pubs/PBE.asc).", "", "@misc{PBEdigits,\n  note = {Added extra digits to some constants as in the {PBE} routine (http://dft.rutgers.edu/pubs/PBE.asc)}\n}\n", "PBEdigits"),
        ]),
    :lda_c_pw_rpa => IdentifierText(
        "Perdew & Wang (fit to the RPA energy)",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("J. P. Perdew and Y. Wang,  Phys. Rev. B 45, 13244 (1992)", "10.1103/PhysRevB.45.13244", "@article{Perdew1992_13244,\n  author = {Perdew, J. P. and Wang, Y.},\n  title = {Accurate and simple analytic representation of the electron-gas correlation energy},\n  journal = {Phys. Rev. B},\n  volume = {45},\n  issue = {23},\n  pages = {13244},\n  year = {1992},\n  month = {Jun},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevB.45.13244},\n  url = {http://link.aps.org/doi/10.1103/PhysRevB.45.13244}\n}\n", "Perdew1992_13244"),
        ]),
    :lda_c_pz => IdentifierText(
        "Perdew & Zunger",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("J. P. Perdew and A. Zunger,  Phys. Rev. B 23, 5048 (1981)", "10.1103/PhysRevB.23.5048", "@article{Perdew1981_5048,\n  author = {Perdew, J. P. and Zunger, A.},\n  title = {Self-interaction correction to density-functional approximations for many-electron systems},\n  journal = {Phys. Rev. B},\n  volume = {23},\n  issue = {10},\n  pages = {5048},\n  year = {1981},\n  month = {May},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevB.23.5048},\n  url = {http://link.aps.org/doi/10.1103/PhysRevB.23.5048}\n}\n", "Perdew1981_5048"),
        ]),
    :lda_c_pz_mod => IdentifierText(
        "Perdew & Zunger (Modified)",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("J. P. Perdew and A. Zunger,  Phys. Rev. B 23, 5048 (1981)", "10.1103/PhysRevB.23.5048", "@article{Perdew1981_5048_mod,\n  author = {Perdew, J. P. and Zunger, A.},\n  title = {Self-interaction correction to density-functional approximations for many-electron systems},\n  journal = {Phys. Rev. B},\n  volume = {23},\n  issue = {10},\n  pages = {5048},\n  year = {1981},\n  month = {May},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevB.23.5048},\n  url = {http://link.aps.org/doi/10.1103/PhysRevB.23.5048},\n  note = {Modified to improve the matching between the low- and high-rs parts}\n}\n", "Perdew1981_5048_mod"),
        ]),
    :lda_c_rc04 => IdentifierText(
        "Ragot-Cortona",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("S. Ragot and P. Cortona,  J. Chem. Phys. 121, 7671 (2004)", "10.1063/1.1792153", "@article{Ragot2004_7671,\n  author = {Ragot, S. and Cortona, P.},\n  title = {Correlation energy of many-electron systems: A modified {Colle}--{Salvetti} approach},\n  journal = {J. Chem. Phys.},\n  year = {2004},\n  volume = {121},\n  number = {16},\n  pages = {7671},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/121/16/10.1063/1.1792153},\n  doi = {10.1063/1.1792153}\n}\n", "Ragot2004_7671"),
        ]),
    :lda_c_rpa => IdentifierText(
        "Random Phase Approximation (RPA)",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("M. Gell-Mann and K. A. Brueckner,  Phys. Rev. 106, 364 (1957)", "10.1103/PhysRev.106.364", "@article{GellMann1957_364,\n  author = {Gell-Mann, M. and Brueckner, K. A.},\n  title = {Correlation Energy of an Electron Gas at High Density},\n  journal = {Phys. Rev.},\n  volume = {106},\n  issue = {2},\n  pages = {364},\n  year = {1957},\n  month = {Apr},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRev.106.364},\n  url = {http://link.aps.org/doi/10.1103/PhysRev.106.364}\n}\n", "GellMann1957_364"),
            LibxcReference("W. J. Carr and A. A. Maradudin,  Phys. Rev. 133, A371–A374 (1964)", "10.1103/PhysRev.133.A371", "@article{Carr1964_371,\n  author = {Carr, W. J. and Maradudin, A. A.},\n  title = {Ground-State Energy of a High-Density Electron Gas},\n  journal = {Phys. Rev.},\n  volume = {133},\n  issue = {2A},\n  pages = {A371--A374},\n  year = {1964},\n  month = {Jan},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRev.133.A371},\n  url = {https://link.aps.org/doi/10.1103/PhysRev.133.A371}\n}\n", "Carr1964_371"),
        ]),
    :lda_c_rpaf => IdentifierText(
        "Random Phase Approximation based Functional (RPAF)",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("M. Benites, A. Rosado, and E. Manousakis,  Phys. Rev. B 110, 195151 (2024)", "10.1103/PhysRevB.110.195151", "@article{Benites2024_195151,\n  author = {Benites, Mario and Rosado, Angel and Manousakis, Efstratios},\n  title = {Accurate electron correlation energy functional: Expansion in the interaction renormalized by the random-phase approximation},\n  journal = {Phys. Rev. B},\n  volume = {110},\n  issue = {19},\n  pages = {195151},\n  year = {2024},\n  month = {Nov},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevB.110.195151},\n  url = {https://link.aps.org/doi/10.1103/PhysRevB.110.195151}\n}\n", "Benites2024_195151"),
        ]),
    :lda_c_rpw92 => IdentifierText(
        "Ruggeri, Rios, and Alavi restricted fit",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("M. Ruggeri, P. L. Ríos, and A. Alavi,  Phys. Rev. B 98, 161105 (2018)", "10.1103/PhysRevB.98.161105", "@article{Ruggeri2018_161105,\n  author = {Ruggeri, Michele and R\\'{i}os, Pablo L\\'opez and Alavi, Ali},\n  title = {Correlation energies of the high-density spin-polarized electron gas to {meV} accuracy},\n  journal = {Phys. Rev. B},\n  volume = {98},\n  issue = {16},\n  pages = {161105},\n  year = {2018},\n  month = {Oct},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevB.98.161105},\n  url = {https://link.aps.org/doi/10.1103/PhysRevB.98.161105}\n}\n", "Ruggeri2018_161105"),
        ]),
    :lda_c_upw92 => IdentifierText(
        "Ruggeri, Rios, and Alavi unrestricted fit",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("M. Ruggeri, P. L. Ríos, and A. Alavi,  Phys. Rev. B 98, 161105 (2018)", "10.1103/PhysRevB.98.161105", "@article{Ruggeri2018_161105,\n  author = {Ruggeri, Michele and R\\'{i}os, Pablo L\\'opez and Alavi, Ali},\n  title = {Correlation energies of the high-density spin-polarized electron gas to {meV} accuracy},\n  journal = {Phys. Rev. B},\n  volume = {98},\n  issue = {16},\n  pages = {161105},\n  year = {2018},\n  month = {Oct},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevB.98.161105},\n  url = {https://link.aps.org/doi/10.1103/PhysRevB.98.161105}\n}\n", "Ruggeri2018_161105"),
        ]),
    :lda_c_vbh => IdentifierText(
        "von Barth & Hedin",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("U. von Barth and L. Hedin,  J. Phys. C: Solid State Phys. 5, 1629 (1972)", "10.1088/0022-3719/5/13/012", "@article{vonBarth1972_1629,\n  author = {von Barth, U. and Hedin, L.},\n  title = {A local exchange-correlation potential for the spin polarized case. {I}},\n  journal = {J. Phys. C: Solid State Phys.},\n  volume = {5},\n  number = {13},\n  pages = {1629},\n  year = {1972},\n  doi = {10.1088/0022-3719/5/13/012},\n  url = {http://stacks.iop.org/0022-3719/5/i=13/a=012}\n}\n", "vonBarth1972_1629"),
        ]),
    :lda_c_vwn => IdentifierText(
        "Vosko, Wilk & Nusair (VWN5)",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("S. H. Vosko, L. Wilk, and M. Nusair,  Can. J. Phys. 58, 1200 (1980)", "10.1139/p80-159", "@article{Vosko1980_1200,\n  author = {Vosko, S. H. and Wilk, L. and Nusair, M.},\n  title = {Accurate spin-dependent electron liquid correlation energies for local spin density calculations: a critical analysis},\n  journal = {Can. J. Phys.},\n  volume = {58},\n  number = {8},\n  pages = {1200},\n  year = {1980},\n  doi = {10.1139/p80-159},\n  url = {http://www.nrcresearchpress.com/doi/abs/10.1139/p80-159}\n}\n", "Vosko1980_1200"),
        ]),
    :lda_c_vwn_1 => IdentifierText(
        "Vosko, Wilk & Nusair (VWN1)",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("S. H. Vosko, L. Wilk, and M. Nusair,  Can. J. Phys. 58, 1200 (1980)", "10.1139/p80-159", "@article{Vosko1980_1200,\n  author = {Vosko, S. H. and Wilk, L. and Nusair, M.},\n  title = {Accurate spin-dependent electron liquid correlation energies for local spin density calculations: a critical analysis},\n  journal = {Can. J. Phys.},\n  volume = {58},\n  number = {8},\n  pages = {1200},\n  year = {1980},\n  doi = {10.1139/p80-159},\n  url = {http://www.nrcresearchpress.com/doi/abs/10.1139/p80-159}\n}\n", "Vosko1980_1200"),
        ]),
    :lda_c_vwn_2 => IdentifierText(
        "Vosko, Wilk & Nusair (VWN2)",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("S. H. Vosko, L. Wilk, and M. Nusair,  Can. J. Phys. 58, 1200 (1980)", "10.1139/p80-159", "@article{Vosko1980_1200,\n  author = {Vosko, S. H. and Wilk, L. and Nusair, M.},\n  title = {Accurate spin-dependent electron liquid correlation energies for local spin density calculations: a critical analysis},\n  journal = {Can. J. Phys.},\n  volume = {58},\n  number = {8},\n  pages = {1200},\n  year = {1980},\n  doi = {10.1139/p80-159},\n  url = {http://www.nrcresearchpress.com/doi/abs/10.1139/p80-159}\n}\n", "Vosko1980_1200"),
        ]),
    :lda_c_vwn_3 => IdentifierText(
        "Vosko, Wilk & Nusair (VWN3)",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("S. H. Vosko, L. Wilk, and M. Nusair,  Can. J. Phys. 58, 1200 (1980)", "10.1139/p80-159", "@article{Vosko1980_1200,\n  author = {Vosko, S. H. and Wilk, L. and Nusair, M.},\n  title = {Accurate spin-dependent electron liquid correlation energies for local spin density calculations: a critical analysis},\n  journal = {Can. J. Phys.},\n  volume = {58},\n  number = {8},\n  pages = {1200},\n  year = {1980},\n  doi = {10.1139/p80-159},\n  url = {http://www.nrcresearchpress.com/doi/abs/10.1139/p80-159}\n}\n", "Vosko1980_1200"),
        ]),
    :lda_c_vwn_4 => IdentifierText(
        "Vosko, Wilk & Nusair (VWN4)",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("S. H. Vosko, L. Wilk, and M. Nusair,  Can. J. Phys. 58, 1200 (1980)", "10.1139/p80-159", "@article{Vosko1980_1200,\n  author = {Vosko, S. H. and Wilk, L. and Nusair, M.},\n  title = {Accurate spin-dependent electron liquid correlation energies for local spin density calculations: a critical analysis},\n  journal = {Can. J. Phys.},\n  volume = {58},\n  number = {8},\n  pages = {1200},\n  year = {1980},\n  doi = {10.1139/p80-159},\n  url = {http://www.nrcresearchpress.com/doi/abs/10.1139/p80-159}\n}\n", "Vosko1980_1200"),
        ]),
    :lda_c_vwn_rpa => IdentifierText(
        "Vosko, Wilk & Nusair (VWN5_RPA)",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("S. H. Vosko, L. Wilk, and M. Nusair,  Can. J. Phys. 58, 1200 (1980)", "10.1139/p80-159", "@article{Vosko1980_1200,\n  author = {Vosko, S. H. and Wilk, L. and Nusair, M.},\n  title = {Accurate spin-dependent electron liquid correlation energies for local spin density calculations: a critical analysis},\n  journal = {Can. J. Phys.},\n  volume = {58},\n  number = {8},\n  pages = {1200},\n  year = {1980},\n  doi = {10.1139/p80-159},\n  url = {http://www.nrcresearchpress.com/doi/abs/10.1139/p80-159}\n}\n", "Vosko1980_1200"),
        ]),
    :lda_c_w20 => IdentifierText(
        "Xie, Wu, and Zhao interpolation ansatz without fitting parameters",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("Q.-X. Xie, J. Wu, and Y. Zhao,  Phys. Rev. B 103, 045130 (2021)", "10.1103/PhysRevB.103.045130", "@article{Xie2021_045130,\n  author = {Xie, Qing-Xing and Wu, Jiashun and Zhao, Yan},\n  title = {Accurate correlation energy functional for uniform electron gas from an interpolation ansatz without fitting parameters},\n  journal = {Phys. Rev. B},\n  volume = {103},\n  issue = {4},\n  pages = {045130},\n  year = {2021},\n  month = {Jan},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevB.103.045130},\n  url = {https://link.aps.org/doi/10.1103/PhysRevB.103.045130}\n}\n", "Xie2021_045130"),
        ]),
    :lda_c_wigner => IdentifierText(
        "Wigner",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("E. Wigner,  Trans. Faraday Soc. 34, 678 (1938)", "10.1039/TF9383400678", "@article{Wigner1938_678,\n  author = {Wigner, E.},\n  title = {Effects of the electron interaction on the energy levels of electrons in metals},\n  journal = {Trans. Faraday Soc.},\n  volume = {34},\n  pages = {678},\n  year = {1938},\n  publisher = {The Royal Society of Chemistry},\n  doi = {10.1039/TF9383400678},\n  url = {10.1039/TF9383400678}\n}\n", "Wigner1938_678"),
            LibxcReference("P. A. Stewart and P. M. W. Gill,  J. Chem. Soc, Faraday Trans. 91, 4337–4341 (1995)", "10.1039/FT9959104337", "@article{Stewart1995_4337,\n  author = {Stewart, Phillip A. and Gill, Peter M. W.},\n  title = {{Becke}--{Wigner}: a simple but powerful density functional},\n  journal = {J. Chem. Soc., Faraday Trans.},\n  year = {1995},\n  volume = {91},\n  issue = {24},\n  pages = {4337--4341},\n  publisher = {The Royal Society of Chemistry},\n  doi = {10.1039/FT9959104337},\n  url = {https://doi.org/10.1039/FT9959104337}\n}\n", "Stewart1995_4337"),
        ]),
    :lda_c_xalpha => IdentifierText(
        "Slater's Xalpha",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("J. C. Slater,  Phys. Rev. 81, 385 (1951)", "10.1103/PhysRev.81.385", "@article{Slater1951_385,\n  author = {Slater, J. C.},\n  title = {A Simplification of the {Hartree}--{Fock} Method},\n  journal = {Phys. Rev.},\n  volume = {81},\n  issue = {3},\n  pages = {385},\n  year = {1951},\n  month = {Feb},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRev.81.385},\n  url = {http://link.aps.org/doi/10.1103/PhysRev.81.385}\n}\n", "Slater1951_385"),
        ]),
    :lda_k_lp => IdentifierText(
        "Lee and Parr Gaussian ansatz for the kinetic energy",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("C. Lee and R. G. Parr,  Phys. Rev. A 35, 2377 (1987)", "10.1103/PhysRevA.35.2377", "@article{Lee1987_2377,\n  author = {Lee, C. and Parr, R. G.},\n  title = {{Gaussian} and other approximations to the first-order density matrix of electronic systems, and the derivation of various local-density-functional theories},\n  journal = {Phys. Rev. A},\n  volume = {35},\n  issue = {6},\n  pages = {2377},\n  year = {1987},\n  month = {Mar},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevA.35.2377},\n  url = {http://link.aps.org/doi/10.1103/PhysRevA.35.2377}\n}\n", "Lee1987_2377"),
        ]),
    :lda_k_lp96 => IdentifierText(
        "Liu-Parr kinetic",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("S. Liu and R. G. Parr,  Phys. Rev. A 53, 2211–2219 (1996)", "10.1103/PhysRevA.53.2211", "@article{Liu1996_2211,\n  author = {Liu, Shubin and Parr, Robert G.},\n  title = {Expansions of the correlation-energy density functional \${E}\\_{c}[\\rho]\$ and its kinetic-energy component \${T}\\_{c}[\\rho]\$ in terms of homogeneous functionals},\n  journal = {Phys. Rev. A},\n  volume = {53},\n  issue = {4},\n  pages = {2211--2219},\n  year = {1996},\n  month = {Apr},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevA.53.2211},\n  url = {http://link.aps.org/doi/10.1103/PhysRevA.53.2211}\n}\n", "Liu1996_2211"),
            LibxcReference("S. Liu and R.G Parr,  J. Mol. Struct.: THEOCHEM 501–502, 29–34 (2000)", "10.1016/S0166-1280(99)00410-8", "@article{Liu2000_29,\n  author = {Liu, S and Parr, R.G},\n  title = {Homogeneities in density of various {LDA} energy functionals},\n  journal = {J. Mol. Struct.: THEOCHEM},\n  volume = {501--502},\n  number = {},\n  pages = {29--34},\n  year = {2000},\n  issn = {0166-1280},\n  doi = {10.1016/S0166-1280(99)00410-8},\n  url = {http://www.sciencedirect.com/science/article/pii/S0166128099004108}\n}\n", "Liu2000_29"),
        ]),
    :lda_k_lp96_b => IdentifierText(
        "Liu-Parr kinetic with 4 parameters",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("S. Liu and R. G. Parr,  Phys. Rev. A 53, 2211–2219 (1996)", "10.1103/PhysRevA.53.2211", "@article{Liu1996_2211,\n  author = {Liu, Shubin and Parr, Robert G.},\n  title = {Expansions of the correlation-energy density functional \${E}\\_{c}[\\rho]\$ and its kinetic-energy component \${T}\\_{c}[\\rho]\$ in terms of homogeneous functionals},\n  journal = {Phys. Rev. A},\n  volume = {53},\n  issue = {4},\n  pages = {2211--2219},\n  year = {1996},\n  month = {Apr},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevA.53.2211},\n  url = {http://link.aps.org/doi/10.1103/PhysRevA.53.2211}\n}\n", "Liu1996_2211"),
            LibxcReference("S. Liu and R.G Parr,  J. Mol. Struct.: THEOCHEM 501–502, 29–34 (2000)", "10.1016/S0166-1280(99)00410-8", "@article{Liu2000_29,\n  author = {Liu, S and Parr, R.G},\n  title = {Homogeneities in density of various {LDA} energy functionals},\n  journal = {J. Mol. Struct.: THEOCHEM},\n  volume = {501--502},\n  number = {},\n  pages = {29--34},\n  year = {2000},\n  issn = {0166-1280},\n  doi = {10.1016/S0166-1280(99)00410-8},\n  url = {http://www.sciencedirect.com/science/article/pii/S0166128099004108}\n}\n", "Liu2000_29"),
        ]),
    :lda_k_tf => IdentifierText(
        "Thomas-Fermi kinetic energy",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("L. H. Thomas,  Math. Proc. Cambridge Philos. Soc. 23, 542 (1927)", "10.1017/S0305004100011683", "@article{Thomas1927_542,\n  author = {Thomas, L. H.},\n  title = {The calculation of atomic fields},\n  journal = {Math. Proc. Cambridge Philos. Soc.},\n  volume = {23},\n  issue = {05},\n  month = {1},\n  year = {1927},\n  issn = {1469-8064},\n  pages = {542},\n  doi = {10.1017/S0305004100011683},\n  url = {http://journals.cambridge.org/article\\_S0305004100011683}\n}\n", "Thomas1927_542"),
            LibxcReference("E. Fermi,  Rend. Accad. Naz. Lincei 6, 602 (1927)", "", "@article{Fermi1927_602,\n  author = {Fermi, E.},\n  title = {Un metodo statistico per la determinazione di alcune propriet\\'{a} dell'atomo. ({Italian}) [{A} Statistical Method for the Determination of Some Atomic Properties]},\n  journal = {Rend. Accad. Naz. Lincei},\n  volume = {6},\n  number = {6},\n  pages = {602},\n  year = {1927},\n  CODEN = {AANLAW},\n  ISSN = {0001-4435},\n  bibsource = {http://www.math.utah.edu/pub/bibnet/authors/f/fermi-enrico.bib}\n}\n", "Fermi1927_602"),
        ]),
    :lda_k_zlp => IdentifierText(
        "Wigner including kinetic energy contribution",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("P. Fuentealba and O. Reyes,  Chem. Phys. Lett. 232, 31 (1995)", "10.1016/0009-2614(94)01321-L", "@article{Fuentealba1995_31,\n  author = {Fuentealba, P. and Reyes, O.},\n  title = {Further evidence of the conjoint correction to the local kinetic and exchange energy density functionals},\n  journal = {Chem. Phys. Lett.},\n  volume = {232},\n  number = {1--2},\n  pages = {31},\n  year = {1995},\n  issn = {0009-2614},\n  doi = {10.1016/0009-2614(94)01321-L},\n  url = {http://www.sciencedirect.com/science/article/pii/000926149401321L}\n}\n", "Fuentealba1995_31"),
            LibxcReference("Q. Zhao, M. Levy, and R. G. Parr,  Phys. Rev. A 47, 918–922 (1993)", "10.1103/PhysRevA.47.918", "@article{Zhao1993_918,\n  author = {Zhao, Qingsheng and Levy, Mel and Parr, Robert G.},\n  title = {Applications of coordinate-scaling procedures to the exchange-correlation energy},\n  journal = {Phys. Rev. A},\n  volume = {47},\n  issue = {2},\n  pages = {918--922},\n  year = {1993},\n  month = {Feb},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevA.47.918},\n  url = {http://link.aps.org/doi/10.1103/PhysRevA.47.918}\n}\n", "Zhao1993_918"),
        ]),
    :lda_x => IdentifierText(
        "Slater exchange",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("P. A. M. Dirac,  Math. Proc. Cambridge Philos. Soc. 26, 376 (1930)", "10.1017/S0305004100016108", "@article{Dirac1930_376,\n  author = {Dirac, P. A. M.},\n  title = {Note on Exchange Phenomena in the {Thomas} Atom},\n  journal = {Math. Proc. Cambridge Philos. Soc.},\n  volume = {26},\n  issue = {03},\n  month = {7},\n  pages = {376},\n  year = {1930},\n  issn = {1469-8064},\n  doi = {10.1017/S0305004100016108},\n  url = {http://journals.cambridge.org/article\\_S0305004100016108}\n}\n", "Dirac1930_376"),
            LibxcReference("F. Bloch,  Z. Phys. 57, 545 (1929)", "10.1007/BF01340281", "@article{Bloch1929_545,\n  author = {Bloch, F.},\n  title = {Bemerkung zur {Elektronentheorie} des {Ferromagnetismus} und der elektrischen {Leitf\\\"{a}higkeit}},\n  journal = {Z. Phys.},\n  volume = {57},\n  number = {7-8},\n  pages = {545},\n  year = {1929},\n  issn = {0044-3328},\n  publisher = {{Springer}-{Verlag}},\n  doi = {10.1007/BF01340281},\n  url = {http://link.springer.com/article/10.1007\\\\%2FBF01340281}\n}\n", "Bloch1929_545"),
        ]),
    :lda_x_2d => IdentifierText(
        "Slater exchange",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim2, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("P. A. M. Dirac,  Math. Proc. Cambridge Philos. Soc. 26, 376 (1930)", "10.1017/S0305004100016108", "@article{Dirac1930_376,\n  author = {Dirac, P. A. M.},\n  title = {Note on Exchange Phenomena in the {Thomas} Atom},\n  journal = {Math. Proc. Cambridge Philos. Soc.},\n  volume = {26},\n  issue = {03},\n  month = {7},\n  pages = {376},\n  year = {1930},\n  issn = {1469-8064},\n  doi = {10.1017/S0305004100016108},\n  url = {http://journals.cambridge.org/article\\_S0305004100016108}\n}\n", "Dirac1930_376"),
            LibxcReference("F. Bloch,  Z. Phys. 57, 545 (1929)", "10.1007/BF01340281", "@article{Bloch1929_545,\n  author = {Bloch, F.},\n  title = {Bemerkung zur {Elektronentheorie} des {Ferromagnetismus} und der elektrischen {Leitf\\\"{a}higkeit}},\n  journal = {Z. Phys.},\n  volume = {57},\n  number = {7-8},\n  pages = {545},\n  year = {1929},\n  issn = {0044-3328},\n  publisher = {{Springer}-{Verlag}},\n  doi = {10.1007/BF01340281},\n  url = {http://link.springer.com/article/10.1007\\\\%2FBF01340281}\n}\n", "Bloch1929_545"),
        ]),
    :lda_x_erf => IdentifierText(
        "Short-range LDA exchange with error function kernel (erfc)",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("P. M. W. Gill, R. D. Adamson, and J. A. Pople,  Mol. Phys. 88, 1005–1009 (1996)", "10.1080/00268979609484488", "@article{Gill1996_1005,\n  author = {Gill, Peter M. W. and Adamson, Ross D. and Pople, John A.},\n  title = {{Coulomb}-attenuated exchange energy density functionals},\n  journal = {Mol. Phys.},\n  volume = {88},\n  number = {4},\n  pages = {1005--1009},\n  year = {1996},\n  publisher = {Taylor \\& Francis},\n  doi = {10.1080/00268979609484488},\n  url = {https://doi.org/10.1080/00268979609484488}\n}\n", "Gill1996_1005"),
            LibxcReference("J. Toulouse, A. Savin, and H.-J. Flad,  Int. J. Quantum Chem. 100, 1047–1056 (2004)", "10.1002/qua.20259", "@article{Toulouse2004_1047,\n  author = {Toulouse, Julien and Savin, Andreas and Flad, Heinz-J\\\"urgen},\n  title = {Short-range exchange-correlation energy of a uniform electron gas with modified electron-electron interaction},\n  journal = {Int. J. Quantum Chem.},\n  volume = {100},\n  number = {6},\n  publisher = {John Wiley \\& Sons, Inc.},\n  issn = {1097-461X},\n  url = {https://doi.org/10.1002/qua.20259},\n  doi = {10.1002/qua.20259},\n  pages = {1047--1056},\n  year = {2004}\n}\n", "Toulouse2004_1047"),
            LibxcReference("Y. Tawada, T. Tsuneda, S. Yanagisawa, T. Yanai, and K. Hirao,  J. Chem. Phys. 120, 8425–8433 (2004)", "10.1063/1.1688752", "@article{Tawada2004_8425,\n  author = {Tawada, Yoshihiro and Tsuneda, Takao and Yanagisawa, Susumu and Yanai, Takeshi and Hirao, Kimihiko},\n  title = {A long-range-corrected time-dependent density functional theory},\n  journal = {J. Chem. Phys.},\n  volume = {120},\n  number = {18},\n  pages = {8425--8433},\n  year = {2004},\n  doi = {10.1063/1.1688752},\n  url = {https://doi.org/10.1063/1.1688752}\n}\n", "Tawada2004_8425"),
        ]),
    :lda_x_rae => IdentifierText(
        "Rae self-energy corrected exchange",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("A. I. M. Rae,  Chem. Phys. Lett. 18, 574–577 (1973)", "10.1016/0009-2614(73)80469-5", "@article{Rae1973_574,\n  author = {Rae, A. I. M.},\n  title = {A theory for the interactions between closed shell systems},\n  journal = {Chem. Phys. Lett.},\n  volume = {18},\n  number = {4},\n  pages = {574--577},\n  year = {1973},\n  issn = {0009-2614},\n  doi = {10.1016/0009-2614(73)80469-5},\n  url = {//www.sciencedirect.com/science/article/pii/0009261473804695}\n}\n", "Rae1973_574"),
        ]),
    :lda_x_rel => IdentifierText(
        "Slater exchange with relativistic corrections",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("A. K. Rajagopal,  J. Phys. C: Solid State Phys. 11, L943 (1978)", "10.1088/0022-3719/11/24/002", "@article{Rajagopal1978_L943,\n  author = {Rajagopal, A. K.},\n  title = {Inhomogeneous relativistic electron gas},\n  journal = {J. Phys. C: Solid State Phys.},\n  volume = {11},\n  number = {24},\n  pages = {L943},\n  url = {http://stacks.iop.org/0022-3719/11/i = 24/a = 002},\n  year = {1978},\n  doi = {10.1088/0022-3719/11/24/002}\n}\n", "Rajagopal1978_L943"),
            LibxcReference("A. H. MacDonald and S. H. Vosko,  J. Phys. C: Solid State Phys. 12, 2977 (1979)", "10.1088/0022-3719/12/15/007", "@article{MacDonald1979_2977,\n  author = {MacDonald, A. H. and Vosko, S. H.},\n  title = {A relativistic density functional formalism},\n  journal = {J. Phys. C: Solid State Phys.},\n  volume = {12},\n  number = {15},\n  pages = {2977},\n  url = {http://stacks.iop.org/0022-3719/12/i = 15/a = 007},\n  year = {1979},\n  doi = {10.1088/0022-3719/12/15/007}\n}\n", "MacDonald1979_2977"),
            LibxcReference("E. Engel, S. Keller, A. F. Bonetti, H. Müller, and R. M. Dreizler,  Phys. Rev. A 52, 2750–2764 (1995)", "10.1103/PhysRevA.52.2750", "@article{Engel1995_2750,\n  author = {Engel, E. and Keller, S. and Bonetti, A. Facco and M\\\"{u}ller, H. and Dreizler, R. M.},\n  title = {Local and nonlocal relativistic exchange-correlation energy functionals: Comparison to relativistic optimized-potential-model results},\n  journal = {Phys. Rev. A},\n  volume = {52},\n  issue = {4},\n  pages = {2750--2764},\n  year = {1995},\n  month = {Oct},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevA.52.2750},\n  url = {http://link.aps.org/doi/10.1103/PhysRevA.52.2750}\n}\n", "Engel1995_2750"),
        ]),
    :lda_x_sloc => IdentifierText(
        "simple local model for Slater potential",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("K. Finzel and A. I. Baranov,  Int. J. Quantum Chem. 117, 40–47 (2017)", "10.1002/qua.25312", "@article{Finzel2017_40,\n  author = {Finzel, Kati and Baranov, Alexey I.},\n  title = {A simple model for the {Slater} exchange potential and its performance for solids},\n  journal = {Int. J. Quantum Chem.},\n  volume = {117},\n  number = {1},\n  pages = {40--47},\n  doi = {10.1002/qua.25312},\n  url = {https://onlinelibrary.wiley.com/doi/abs/10.1002/qua.25312},\n  year = {2017}\n}\n", "Finzel2017_40"),
        ]),
    :lda_x_t_sloc => IdentifierText(
        "SLOC reparametrization for band gaps",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("P. Borlido, J. Schmidt, A. W. Huran, F. Tran, M. A. L. Marques, and S. Botti,  npj Comput. Mater. 6, 96 (2020)", "10.1038/s41524-020-00360-0", "@article{Borlido2020_96,\n  author = {Borlido, Pedro and Schmidt, Jonathan and Huran, Ahmad W. and Tran, Fabien and Marques, Miguel A. L. and Botti, Silvana},\n  journal = {npj Comput. Mater.},\n  title = {{Exchange-correlation functionals for band gaps of solids: benchmark, reparametrization and machine learning}},\n  year = {2020},\n  issn = {2057-3960},\n  pages = {96},\n  volume = {6},\n  doi = {10.1038/s41524-020-00360-0},\n  url = {https://doi.org/10.1038/s41524-020-00360-0},\n  publisher = {Springer US}\n}\n", "Borlido2020_96"),
        ]),
    :lda_x_yukawa => IdentifierText(
        "Short-range LDA exchange with Yukawa attenuation",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("A. Savin and H.-J. Flad,  Int. J. Quantum Chem. 56, 327 (1995)", "10.1002/qua.560560417", "@article{Savin1995_327,\n  author = {Savin, A. and Flad, H.-J.},\n  title = {Density functionals for the {Yukawa} electron-electron interaction},\n  journal = {Int. J. Quantum Chem.},\n  volume = {56},\n  number = {4},\n  pages = {327},\n  year = {1995},\n  publisher = {John Wiley \\& Sons, Inc.},\n  issn = {1097-461X},\n  doi = {10.1002/qua.560560417},\n  url = {http://onlinelibrary.wiley.com/doi/10.1002/qua.560560417/abstract}\n}\n", "Savin1995_327"),
        ]),
    :lda_xc_1d_ehwlrg_1 => IdentifierText(
        "LDA constructed from slab-like systems of 1 electron",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim1, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("M. T. Entwistle, M. J. P. Hodgson, J. Wetherell, B. Longstaff, J. D. Ramsden, and R. W. Godby,  Phys. Rev. B 94, 205134 (2016)", "10.1103/PhysRevB.94.205134", "@article{Entwistle2016_205134,\n  author = {Entwistle, M. T. and Hodgson, M. J. P. and Wetherell, J. and Longstaff, B. and Ramsden, J. D. and Godby, R. W.},\n  title = {Local density approximations from finite systems},\n  journal = {Phys. Rev. B},\n  volume = {94},\n  issue = {20},\n  pages = {205134},\n  year = {2016},\n  month = {Nov},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevB.94.205134},\n  url = {http://link.aps.org/doi/10.1103/PhysRevB.94.205134}\n}\n", "Entwistle2016_205134"),
        ]),
    :lda_xc_1d_ehwlrg_2 => IdentifierText(
        "LDA constructed from slab-like systems of 2 electrons",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim1, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("M. T. Entwistle, M. J. P. Hodgson, J. Wetherell, B. Longstaff, J. D. Ramsden, and R. W. Godby,  Phys. Rev. B 94, 205134 (2016)", "10.1103/PhysRevB.94.205134", "@article{Entwistle2016_205134,\n  author = {Entwistle, M. T. and Hodgson, M. J. P. and Wetherell, J. and Longstaff, B. and Ramsden, J. D. and Godby, R. W.},\n  title = {Local density approximations from finite systems},\n  journal = {Phys. Rev. B},\n  volume = {94},\n  issue = {20},\n  pages = {205134},\n  year = {2016},\n  month = {Nov},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevB.94.205134},\n  url = {http://link.aps.org/doi/10.1103/PhysRevB.94.205134}\n}\n", "Entwistle2016_205134"),
        ]),
    :lda_xc_1d_ehwlrg_3 => IdentifierText(
        "LDA constructed from slab-like systems of 3 electrons",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim1, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("M. T. Entwistle, M. J. P. Hodgson, J. Wetherell, B. Longstaff, J. D. Ramsden, and R. W. Godby,  Phys. Rev. B 94, 205134 (2016)", "10.1103/PhysRevB.94.205134", "@article{Entwistle2016_205134,\n  author = {Entwistle, M. T. and Hodgson, M. J. P. and Wetherell, J. and Longstaff, B. and Ramsden, J. D. and Godby, R. W.},\n  title = {Local density approximations from finite systems},\n  journal = {Phys. Rev. B},\n  volume = {94},\n  issue = {20},\n  pages = {205134},\n  year = {2016},\n  month = {Nov},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevB.94.205134},\n  url = {http://link.aps.org/doi/10.1103/PhysRevB.94.205134}\n}\n", "Entwistle2016_205134"),
        ]),
    :lda_xc_corrksdt => IdentifierText(
        "Corrected KSDT by Karasiev, Dufty and Trickey",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("V. V. Karasiev, J. W. Dufty, and S. B. Trickey,  Phys. Rev. Lett. 120, 076401 (2018)", "10.1103/PhysRevLett.120.076401", "@article{Karasiev2018_076401,\n  author = {Karasiev, Valentin V. and Dufty, James W. and Trickey, S. B.},\n  title = {Nonempirical Semilocal Free-Energy Density Functional for Matter under Extreme Conditions},\n  journal = {Phys. Rev. Lett.},\n  volume = {120},\n  issue = {7},\n  pages = {076401},\n  year = {2018},\n  month = {Feb},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevLett.120.076401},\n  url = {https://link.aps.org/doi/10.1103/PhysRevLett.120.076401}\n}\n", "Karasiev2018_076401"),
            LibxcReference("V. V. Karasiev, T. Sjostrom, J. Dufty, and S. B. Trickey,  Phys. Rev. Lett. 112, 076403 (2014)", "10.1103/PhysRevLett.112.076403", "@article{Karasiev2014_076403,\n  author = {Karasiev, Valentin V. and Sjostrom, Travis and Dufty, James and Trickey, S. B.},\n  title = {Accurate Homogeneous Electron Gas Exchange-Correlation Free Energy for Local Spin-Density Calculations},\n  journal = {Phys. Rev. Lett.},\n  volume = {112},\n  issue = {7},\n  pages = {076403},\n  year = {2014},\n  month = {Feb},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevLett.112.076403},\n  url = {http://link.aps.org/doi/10.1103/PhysRevLett.112.076403}\n}\n", "Karasiev2014_076403"),
            LibxcReference("Karasiev has stated that the functional would need reparameterisation for spin-polarized functionals, so it should in principle be only used for spin-unpolarized calculations; see discussion in https://gitlab.com/libxc/libxc/-/merge_requests/465.", "", "@misc{lda_xc_corrksdt_note,\n  note = {{Karasiev} has stated that the functional would need reparameterisation for spin-polarized functionals, so it should in principle be only used for spin-unpolarized calculations; see discussion in https://gitlab.com/libxc/libxc/-/merge\\\\_requests/465.}\n}\n", "lda_xc_corrksdt_note"),
        ]),
    :lda_xc_gdsmfb => IdentifierText(
        "Groth, Dornheim, Sjostrom, Malone, Foulkes, Bonitz",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("S. Groth, T. Dornheim, T. Sjostrom, F. D. Malone, W. M. C. Foulkes, and M. Bonitz,  Phys. Rev. Lett. 119, 135001 (2017)", "10.1103/PhysRevLett.119.135001", "@article{Groth2017_135001,\n  author = {Groth, Simon and Dornheim, Tobias and Sjostrom, Travis and Malone, Fionn D. and Foulkes, W. M. C. and Bonitz, Michael},\n  title = {Ab initio Exchange-Correlation Free Energy of the Uniform Electron Gas at Warm Dense Matter Conditions},\n  journal = {Phys. Rev. Lett.},\n  volume = {119},\n  issue = {13},\n  pages = {135001},\n  year = {2017},\n  month = {Sep},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevLett.119.135001},\n  url = {https://link.aps.org/doi/10.1103/PhysRevLett.119.135001}\n}\n", "Groth2017_135001"),
        ]),
    :lda_xc_ksdt => IdentifierText(
        "Karasiev, Sjostrom, Dufty & Trickey",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("V. V. Karasiev, T. Sjostrom, J. Dufty, and S. B. Trickey,  Phys. Rev. Lett. 112, 076403 (2014)", "10.1103/PhysRevLett.112.076403", "@article{Karasiev2014_076403,\n  author = {Karasiev, Valentin V. and Sjostrom, Travis and Dufty, James and Trickey, S. B.},\n  title = {Accurate Homogeneous Electron Gas Exchange-Correlation Free Energy for Local Spin-Density Calculations},\n  journal = {Phys. Rev. Lett.},\n  volume = {112},\n  issue = {7},\n  pages = {076403},\n  year = {2014},\n  month = {Feb},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevLett.112.076403},\n  url = {http://link.aps.org/doi/10.1103/PhysRevLett.112.076403}\n}\n", "Karasiev2014_076403"),
        ]),
    :lda_xc_lp_a => IdentifierText(
        "Lee-Parr reparametrization A",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("C. Lee and R. G. Parr,  Phys. Rev. A 42, 193–200 (1990)", "10.1103/PhysRevA.42.193", "@article{Lee1990_193,\n  author = {Lee, Chengteh and Parr, Robert G.},\n  title = {Exchange-correlation functional for atoms and molecules},\n  journal = {Phys. Rev. A},\n  volume = {42},\n  issue = {1},\n  pages = {193--200},\n  year = {1990},\n  month = {Jul},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevA.42.193},\n  url = {http://link.aps.org/doi/10.1103/PhysRevA.42.193}\n}\n", "Lee1990_193"),
        ]),
    :lda_xc_lp_b => IdentifierText(
        "Lee-Parr reparametrization B",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("C. Lee and R. G. Parr,  Phys. Rev. A 42, 193–200 (1990)", "10.1103/PhysRevA.42.193", "@article{Lee1990_193,\n  author = {Lee, Chengteh and Parr, Robert G.},\n  title = {Exchange-correlation functional for atoms and molecules},\n  journal = {Phys. Rev. A},\n  volume = {42},\n  issue = {1},\n  pages = {193--200},\n  year = {1990},\n  month = {Jul},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevA.42.193},\n  url = {http://link.aps.org/doi/10.1103/PhysRevA.42.193}\n}\n", "Lee1990_193"),
        ]),
    :lda_xc_teter93 => IdentifierText(
        "Teter 93",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("S. Goedecker, M. Teter, and J. Hutter,  Phys. Rev. B 54, 1703 (1996)", "10.1103/PhysRevB.54.1703", "@article{Goedecker1996_1703,\n  author = {Goedecker, S. and Teter, M. and Hutter, J.},\n  title = {Separable dual-space {Gaussian} pseudopotentials},\n  journal = {Phys. Rev. B},\n  volume = {54},\n  issue = {3},\n  pages = {1703},\n  year = {1996},\n  month = {Jul},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevB.54.1703},\n  url = {http://link.aps.org/doi/10.1103/PhysRevB.54.1703}\n}\n", "Goedecker1996_1703"),
        ]),
    :lda_xc_th_fl => IdentifierText(
        "Tozer and Handy v. FL",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("D. J. Tozer and N. C. Handy,  J. Chem. Phys. 108, 2545 (1998)", "10.1063/1.475638", "@article{Tozer1998_2545,\n  author = {Tozer, D. J. and Handy, N. C.},\n  title = {The development of new exchange-correlation functionals},\n  journal = {J. Chem. Phys.},\n  year = {1998},\n  volume = {108},\n  number = {6},\n  pages = {2545},\n  doi = {10.1063/1.475638},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/108/6/10.1063/1.475638}\n}\n", "Tozer1998_2545"),
        ]),
    :lda_xc_tih => IdentifierText(
        "Neural network LDA from Tozer et al",
        (:have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (1, 2, 3, 4),
        LibxcReference[
            LibxcReference("D. J. Tozer, V. E. Ingamells, and N. C. Handy,  J. Chem. Phys. 105, 9200–9213 (1996)", "10.1063/1.472753", "@article{Tozer1996_9200,\n  author = {Tozer, David J. and Ingamells, Victoria E. and Handy, Nicholas C.},\n  title = {Exchange-correlation potentials},\n  journal = {J. Chem. Phys.},\n  volume = {105},\n  number = {20},\n  pages = {9200--9213},\n  year = {1996},\n  doi = {10.1063/1.472753},\n  url = {https://doi.org/10.1063/1.472753}\n}\n", "Tozer1996_9200"),
        ]),
    :lda_xc_zlp => IdentifierText(
        "Zhao, Levy & Parr, Eq. (20)",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("Q. Zhao, M. Levy, and R. G. Parr,  Phys. Rev. A 47, 918–922 (1993)", "10.1103/PhysRevA.47.918", "@article{Zhao1993_918,\n  author = {Zhao, Qingsheng and Levy, Mel and Parr, Robert G.},\n  title = {Applications of coordinate-scaling procedures to the exchange-correlation energy},\n  journal = {Phys. Rev. A},\n  volume = {47},\n  issue = {2},\n  pages = {918--922},\n  year = {1993},\n  month = {Feb},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevA.47.918},\n  url = {http://link.aps.org/doi/10.1103/PhysRevA.47.918}\n}\n", "Zhao1993_918"),
        ]),
    :mgga_c_b88 => IdentifierText(
        "Meta-GGA correlation by Becke",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("A. D. Becke,  J. Chem. Phys. 88, 1053–1062 (1988)", "10.1063/1.454274", "@article{Becke1988_1053,\n  author = {Becke, A. D.},\n  title = {Correlation energy of an inhomogeneous electron gas: A coordinate-space model},\n  journal = {J. Chem. Phys.},\n  volume = {88},\n  number = {2},\n  pages = {1053--1062},\n  year = {1988},\n  doi = {10.1063/1.454274},\n  url = {https://doi.org/10.1063/1.454274}\n}\n", "Becke1988_1053"),
        ]),
    :mgga_c_b94 => IdentifierText(
        "Becke 1994 meta-GGA correlation",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :dim3, :needs_laplacian, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3),
        LibxcReference[
            LibxcReference("A. D. Becke,  Int. J. Quantum Chem. 52, 625–632 (1994)", "10.1002/qua.560520855", "@article{Becke1994_625,\n  author = {Becke, Axel D.},\n  title = {Thermochemical tests of a kinetic-energy dependent exchange-correlation approximation},\n  journal = {Int. J. Quantum Chem.},\n  volume = {52},\n  number = {S28},\n  pages = {625--632},\n  doi = {10.1002/qua.560520855},\n  url = {https://onlinelibrary.wiley.com/doi/abs/10.1002/qua.560520855},\n  year = {1994}\n}\n", "Becke1994_625"),
        ]),
    :mgga_c_bc95 => IdentifierText(
        "Becke correlation 95",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("A. D. Becke,  J. Chem. Phys. 104, 1040 (1996)", "10.1063/1.470829", "@article{Becke1996_1040,\n  author = {Becke, A. D.},\n  title = {Density-functional thermochemistry. {IV}. {A} new dynamical correlation functional and implications for exact-exchange mixing},\n  journal = {J. Chem. Phys.},\n  year = {1996},\n  volume = {104},\n  number = {3},\n  pages = {1040},\n  doi = {10.1063/1.470829},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/104/3/10.1063/1.470829}\n}\n", "Becke1996_1040"),
        ]),
    :mgga_c_cc => IdentifierText(
        "Self-interaction corrected correlation functional by Schmidt et al",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("T. Schmidt, E. Kraisler, A. Makmal, L. Kronik, and S. Kümmel,  J. Chem. Phys. 140, 18A510 (2014)", "10.1063/1.4865942", "@article{Schmidt2014_18A510,\n  author = {Schmidt, Tobias and Kraisler, Eli and Makmal, Adi and Kronik, Leeor and K\\\"{u}mmel, Stephan},\n  title = {A self-interaction-free local hybrid functional: Accurate binding energies vis-\\'{a}-vis accurate ionization potentials from {Kohn}--{Sham} eigenvalues},\n  journal = {J. Chem. Phys.},\n  volume = {140},\n  number = {18},\n  pages = {18A510},\n  year = {2014},\n  doi = {10.1063/1.4865942},\n  url = {https://doi.org/10.1063/1.4865942}\n}\n", "Schmidt2014_18A510"),
        ]),
    :mgga_c_ccalda => IdentifierText(
        "Iso-orbital corrected LDA correlation by Lebeda et al",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("T. Lebeda, T. Aschebrock, and S. Kümmel,  Phys. Rev. Res. 4, 023061 (2022)", "10.1103/PhysRevResearch.4.023061", "@article{Lebeda2022_023061,\n  author = {Lebeda, Timo and Aschebrock, Thilo and K\\\"ummel, Stephan},\n  title = {First steps towards achieving both ultranonlocality and a reliable description of electronic binding in a meta-generalized gradient approximation},\n  journal = {Phys. Rev. Res.},\n  volume = {4},\n  issue = {2},\n  pages = {023061},\n  year = {2022},\n  month = {Apr},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevResearch.4.023061},\n  url = {https://link.aps.org/doi/10.1103/PhysRevResearch.4.023061}\n}\n", "Lebeda2022_023061"),
        ]),
    :mgga_c_cf22d => IdentifierText(
        "Minnesota CF22D correlation functional",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("Y. Liu, C. Zhang, Z. Liu, D. G. Truhlar, Y. Wang, and X. He,  Nat. Comput. Sci. 3, 48–58 (2022)", "10.1038/s43588-022-00371-5", "@article{Liu2022_48,\n  author = {Liu, Yiwei and Zhang, Cheng and Liu, Zhonghua and Truhlar, Donald G. and Wang, Ying and He, Xiao},\n  journal = {Nat. Comput. Sci.},\n  title = {Supervised learning of a chemistry functional with damped dispersion},\n  year = {2022},\n  issn = {2662-8457},\n  month = {December},\n  number = {1},\n  pages = {48--58},\n  volume = {3},\n  doi = {10.1038/s43588-022-00371-5},\n  publisher = {Springer Science and Business Media LLC}\n}\n", "Liu2022_48"),
        ]),
    :mgga_c_cs => IdentifierText(
        "Colle and Salvetti",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_laplacian, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("R. Colle and O. Salvetti,  Theor. Chim. Acta 37, 329 (1975)", "10.1007/BF01028401", "@article{Colle1975_329,\n  author = {Colle, R. and Salvetti, O.},\n  title = {Approximate calculation of the correlation energy for the closed shells},\n  journal = {Theor. Chim. Acta},\n  volume = {37},\n  number = {4},\n  pages = {329},\n  year = {1975},\n  issn = {0040-5744},\n  publisher = {Springer-Verlag},\n  doi = {10.1007/BF01028401},\n  url = {http://link.springer.com/article/10.1007\\\\%2FBF01028401}\n}\n", "Colle1975_329"),
            LibxcReference("C. Lee, W. Yang, and R. G. Parr,  Phys. Rev. B 37, 785 (1988)", "10.1103/PhysRevB.37.785", "@article{Lee1988_785,\n  author = {Lee, C. and Yang, W. and Parr, R. G.},\n  title = {Development of the {Colle}--{Salvetti} correlation-energy formula into a functional of the electron density},\n  journal = {Phys. Rev. B},\n  volume = {37},\n  issue = {2},\n  pages = {785},\n  year = {1988},\n  month = {Jan},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevB.37.785},\n  url = {http://link.aps.org/doi/10.1103/PhysRevB.37.785}\n}\n", "Lee1988_785"),
        ]),
    :mgga_c_dldf => IdentifierText(
        "Dispersionless Density Functional",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("K. Pernal, R. Podeszwa, K. Patkowski, and K. Szalewicz,  Phys. Rev. Lett. 103, 263201 (2009)", "10.1103/PhysRevLett.103.263201", "@article{Pernal2009_263201,\n  author = {Pernal, Katarzyna and Podeszwa, Rafa\\l{} and Patkowski, Konrad and Szalewicz, Krzysztof},\n  title = {Dispersionless Density Functional Theory},\n  journal = {Phys. Rev. Lett.},\n  volume = {103},\n  issue = {26},\n  pages = {263201},\n  year = {2009},\n  month = {Dec},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevLett.103.263201},\n  url = {http://link.aps.org/doi/10.1103/PhysRevLett.103.263201}\n}\n", "Pernal2009_263201"),
        ]),
    :mgga_c_hltapw => IdentifierText(
        "Half-and-half meta-LDAized PW correlation by Lehtola and Marques",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("S. Lehtola and M. A. L. Marques,  J. Chem. Theory Comput. 17, 943–948 (2021)", "10.1021/acs.jctc.0c01147", "@article{Lehtola2021_943,\n  author = {Lehtola, Susi and Marques, Miguel A. L.},\n  title = {Meta-Local Density Functionals: A New Rung on {Jacob}'s Ladder},\n  journal = {J. Chem. Theory Comput.},\n  volume = {17},\n  number = {2},\n  pages = {943--948},\n  year = {2021},\n  doi = {10.1021/acs.jctc.0c01147},\n  url = {https://doi.org/10.1021/acs.jctc.0c01147}\n}\n", "Lehtola2021_943"),
        ]),
    :mgga_c_kcis => IdentifierText(
        "Krieger, Chen, Iafrate, and Savin",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("J. Rey and A. Savin,  Int. J. Quantum Chem. 69, 581–590 (1998)", "10.1002/(SICI)1097-461X(1998)69:4<581::AID-QUA16>3.0.CO;2-2", "@article{Rey1998_581,\n  author = {Rey, J\\'{e}r\\^{o}me and Savin, Andreas},\n  title = {Virtual space level shifting and correlation energies},\n  journal = {Int. J. Quantum Chem.},\n  volume = {69},\n  number = {4},\n  publisher = {John Wiley \\& Sons, Inc.},\n  issn = {1097-461X},\n  url = {https://doi.org/10.1002/(SICI)1097-461X(1998)69:4<581::AID-QUA16>3.0.CO;2-2},\n  doi = {10.1002/(SICI)1097-461X(1998)69:4<581::AID-QUA16>3.0.CO;2-2},\n  pages = {581--590},\n  year = {1998}\n}\n", "Rey1998_581"),
            LibxcReference("J. B. Krieger, J. Chen, G. J. Iafrate, and A. Savin. Construction of An Accurate Self-interaction-corrected Correlation Energy Functional Based on An Electron Gas with A Gap, pages 463–477. Springer US, Boston, MA, 1999. URL: https://doi.org/10.1007/978-1-4615-4715-0_28, doi:10.1007/978-1-4615-4715-0_28.", "10.1007/978-1-4615-4715-0_28", "@inbook{Krieger1999_463,\n  author = {Krieger, Joseph B. and Chen, Jiqiang and Iafrate, Gerald J. and Savin, Andreas},\n  editor = {Gonis, A. and Kioussis, N. and Ciftan, M.},\n  title = {Construction of An Accurate Self-interaction-corrected Correlation Energy Functional Based on An Electron Gas with A Gap},\n  bookTitle = {Electron Correlations and Materials Properties},\n  year = {1999},\n  publisher = {Springer US},\n  address = {Boston, MA},\n  pages = {463--477},\n  isbn = {978-1-4615-4715-0},\n  doi = {10.1007/978-1-4615-4715-0\\_28},\n  url = {https://doi.org/10.1007/978-1-4615-4715-0\\_28}\n}\n", "Krieger1999_463"),
            LibxcReference("J. B. Krieger, J. Chen, and S. Kurth,  AIP Conf. Proc. 577, 48–69 (2001)", "10.1063/1.1390178", "@article{Krieger2001_48,\n  author = {Krieger, Joseph B. and Chen, Jiqiang and Kurth, Stefan},\n  title = {Construction and application of an accurate self-interaction-corrected correlation energy functional based on an electron gas with a gap},\n  journal = {AIP Conf. Proc.},\n  volume = {577},\n  number = {1},\n  pages = {48--69},\n  year = {2001},\n  doi = {10.1063/1.1390178},\n  url = {http://aip.scitation.org/doi/abs/10.1063/1.1390178}\n}\n", "Krieger2001_48"),
            LibxcReference("S. Kurth, J. P. Perdew, and P. Blaha,  Int. J. Quantum Chem. 75, 889–909 (1999)", "10.1002/(SICI)1097-461X(1999)75:4/5<889::AID-QUA54>3.0.CO;2-8", "@article{Kurth1999_889,\n  author = {Kurth, Stefan and Perdew, John P. and Blaha, Peter},\n  title = {Molecular and solid-state tests of density functional approximations: {LSD}, {GGAs}, and {meta-GGAs}},\n  journal = {Int. J. Quantum Chem.},\n  volume = {75},\n  number = {4-5},\n  pages = {889--909},\n  doi = {10.1002/(SICI)1097-461X(1999)75:4/5<889::AID-QUA54>3.0.CO;2-8},\n  url = {https://onlinelibrary.wiley.com/doi/abs/10.1002/\\%28SICI\\%291097-461X\\%281999\\%2975\\%3A4/5\\%3C889\\%3A\\%3AAID-QUA54\\%3E3.0.CO\\%3B2-8},\n  year = {1999}\n}\n", "Kurth1999_889"),
            LibxcReference("J. Toulouse, A. Savin, and C. Adamo,  J. Chem. Phys. 117, 10465–10473 (2002)", "10.1063/1.1521432", "@article{Toulouse2002_10465,\n  author = {Toulouse, Julien and Savin, Andreas and Adamo, Carlo},\n  title = {Validation and assessment of an accurate approach to the correlation problem in density functional theory: The {Kriger}--{Chen}--{Iafrate}--{Savin} model},\n  journal = {J. Chem. Phys.},\n  volume = {117},\n  number = {23},\n  pages = {10465--10473},\n  year = {2002},\n  doi = {10.1063/1.1521432},\n  url = {https://doi.org/10.1063/1.1521432}\n}\n", "Toulouse2002_10465"),
        ]),
    :mgga_c_kcisk => IdentifierText(
        "Krieger, Chen, and Kurth",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("J. Rey and A. Savin,  Int. J. Quantum Chem. 69, 581–590 (1998)", "10.1002/(SICI)1097-461X(1998)69:4<581::AID-QUA16>3.0.CO;2-2", "@article{Rey1998_581,\n  author = {Rey, J\\'{e}r\\^{o}me and Savin, Andreas},\n  title = {Virtual space level shifting and correlation energies},\n  journal = {Int. J. Quantum Chem.},\n  volume = {69},\n  number = {4},\n  publisher = {John Wiley \\& Sons, Inc.},\n  issn = {1097-461X},\n  url = {https://doi.org/10.1002/(SICI)1097-461X(1998)69:4<581::AID-QUA16>3.0.CO;2-2},\n  doi = {10.1002/(SICI)1097-461X(1998)69:4<581::AID-QUA16>3.0.CO;2-2},\n  pages = {581--590},\n  year = {1998}\n}\n", "Rey1998_581"),
            LibxcReference("J. B. Krieger, J. Chen, G. J. Iafrate, and A. Savin. Construction of An Accurate Self-interaction-corrected Correlation Energy Functional Based on An Electron Gas with A Gap, pages 463–477. Springer US, Boston, MA, 1999. URL: https://doi.org/10.1007/978-1-4615-4715-0_28, doi:10.1007/978-1-4615-4715-0_28.", "10.1007/978-1-4615-4715-0_28", "@inbook{Krieger1999_463,\n  author = {Krieger, Joseph B. and Chen, Jiqiang and Iafrate, Gerald J. and Savin, Andreas},\n  editor = {Gonis, A. and Kioussis, N. and Ciftan, M.},\n  title = {Construction of An Accurate Self-interaction-corrected Correlation Energy Functional Based on An Electron Gas with A Gap},\n  bookTitle = {Electron Correlations and Materials Properties},\n  year = {1999},\n  publisher = {Springer US},\n  address = {Boston, MA},\n  pages = {463--477},\n  isbn = {978-1-4615-4715-0},\n  doi = {10.1007/978-1-4615-4715-0\\_28},\n  url = {https://doi.org/10.1007/978-1-4615-4715-0\\_28}\n}\n", "Krieger1999_463"),
            LibxcReference("J. B. Krieger, J. Chen, and S. Kurth,  AIP Conf. Proc. 577, 48–69 (2001)", "10.1063/1.1390178", "@article{Krieger2001_48,\n  author = {Krieger, Joseph B. and Chen, Jiqiang and Kurth, Stefan},\n  title = {Construction and application of an accurate self-interaction-corrected correlation energy functional based on an electron gas with a gap},\n  journal = {AIP Conf. Proc.},\n  volume = {577},\n  number = {1},\n  pages = {48--69},\n  year = {2001},\n  doi = {10.1063/1.1390178},\n  url = {http://aip.scitation.org/doi/abs/10.1063/1.1390178}\n}\n", "Krieger2001_48"),
            LibxcReference("S. Kurth, J. P. Perdew, and P. Blaha,  Int. J. Quantum Chem. 75, 889–909 (1999)", "10.1002/(SICI)1097-461X(1999)75:4/5<889::AID-QUA54>3.0.CO;2-8", "@article{Kurth1999_889,\n  author = {Kurth, Stefan and Perdew, John P. and Blaha, Peter},\n  title = {Molecular and solid-state tests of density functional approximations: {LSD}, {GGAs}, and {meta-GGAs}},\n  journal = {Int. J. Quantum Chem.},\n  volume = {75},\n  number = {4-5},\n  pages = {889--909},\n  doi = {10.1002/(SICI)1097-461X(1999)75:4/5<889::AID-QUA54>3.0.CO;2-8},\n  url = {https://onlinelibrary.wiley.com/doi/abs/10.1002/\\%28SICI\\%291097-461X\\%281999\\%2975\\%3A4/5\\%3C889\\%3A\\%3AAID-QUA54\\%3E3.0.CO\\%3B2-8},\n  year = {1999}\n}\n", "Kurth1999_889"),
            LibxcReference("J. Toulouse, A. Savin, and C. Adamo,  J. Chem. Phys. 117, 10465–10473 (2002)", "10.1063/1.1521432", "@article{Toulouse2002_10465,\n  author = {Toulouse, Julien and Savin, Andreas and Adamo, Carlo},\n  title = {Validation and assessment of an accurate approach to the correlation problem in density functional theory: The {Kriger}--{Chen}--{Iafrate}--{Savin} model},\n  journal = {J. Chem. Phys.},\n  volume = {117},\n  number = {23},\n  pages = {10465--10473},\n  year = {2002},\n  doi = {10.1063/1.1521432},\n  url = {https://doi.org/10.1063/1.1521432}\n}\n", "Toulouse2002_10465"),
        ]),
    :mgga_c_lak => IdentifierText(
        "Lebeda-Aschebrock-Kummel meta-GGA correlation",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("T. Lebeda, T. Aschebrock, and S. Kümmel,  Phys. Rev. Lett. 133, 136402 (2024)", "10.1103/PhysRevLett.133.136402", "@article{Lebeda2024_136402,\n  author = {Lebeda, Timo and Aschebrock, Thilo and K\\\"ummel, Stephan},\n  title = {Balancing the Contributions to the Gradient Expansion: Accurate Binding and Band Gaps with a Nonempirical Meta-GGA},\n  journal = {Phys. Rev. Lett.},\n  volume = {133},\n  issue = {13},\n  pages = {136402},\n  year = {2024},\n  month = {Sep},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevLett.133.136402},\n  url = {https://link.aps.org/doi/10.1103/PhysRevLett.133.136402}\n}\n", "Lebeda2024_136402"),
        ]),
    :mgga_c_m05 => IdentifierText(
        "Minnesota M05 correlation functional",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("Y. Zhao, N. E. Schultz, and D. G. Truhlar,  J. Chem. Phys. 123, 161103 (2005)", "10.1063/1.2126975", "@article{Zhao2005_161103,\n  author = {Zhao, Y. and Schultz, N. E. and Truhlar, D. G.},\n  title = {Exchange-correlation functional with broad accuracy for metallic and nonmetallic compounds, kinetics, and noncovalent interactions},\n  journal = {J. Chem. Phys.},\n  year = {2005},\n  volume = {123},\n  number = {16},\n  pages = {161103},\n  doi = {10.1063/1.2126975},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/123/16/10.1063/1.2126975}\n}\n", "Zhao2005_161103"),
        ]),
    :mgga_c_m05_2x => IdentifierText(
        "Minnesota M05-2X correlation functional",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("Y. Zhao, N. E. Schultz, and D. G. Truhlar,  J. Chem. Theory Comput. 2, 364 (2006)", "10.1021/ct0502763", "@article{Zhao2006_364,\n  author = {Zhao, Y. and Schultz, N. E. and Truhlar, D. G.},\n  title = {Design of Density Functionals by Combining the Method of Constraint Satisfaction with Parametrization for Thermochemistry, Thermochemical Kinetics, and Noncovalent Interactions},\n  journal = {J. Chem. Theory Comput.},\n  volume = {2},\n  number = {2},\n  pages = {364},\n  year = {2006},\n  doi = {10.1021/ct0502763},\n  url = {http://pubs.acs.org/doi/abs/10.1021/ct0502763}\n}\n", "Zhao2006_364"),
        ]),
    :mgga_c_m06 => IdentifierText(
        "Minnesota M06 correlation functional",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("Y. Zhao and D. G. Truhlar,  Theor. Chem. Acc. 120, 215 (2008)", "10.1007/s00214-007-0310-x", "@article{Zhao2008_215,\n  author = {Zhao, Y. and Truhlar, D. G.},\n  title = {The {M06} suite of density functionals for main group thermochemistry, thermochemical kinetics, noncovalent interactions, excited states, and transition elements: two new functionals and systematic testing of four {M06}-class functionals and 12 other functionals},\n  journal = {Theor. Chem. Acc.},\n  volume = {120},\n  number = {1-3},\n  pages = {215},\n  year = {2008},\n  issn = {1432-881X},\n  publisher = {Springer-Verlag},\n  doi = {10.1007/s00214-007-0310-x},\n  url = {http://link.springer.com/article/10.1007\\\\%2Fs00214-007-0310-x}\n}\n", "Zhao2008_215"),
        ]),
    :mgga_c_m06_2x => IdentifierText(
        "Minnesota M06-2X correlation functional",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("Y. Zhao and D. G. Truhlar,  Theor. Chem. Acc. 120, 215 (2008)", "10.1007/s00214-007-0310-x", "@article{Zhao2008_215,\n  author = {Zhao, Y. and Truhlar, D. G.},\n  title = {The {M06} suite of density functionals for main group thermochemistry, thermochemical kinetics, noncovalent interactions, excited states, and transition elements: two new functionals and systematic testing of four {M06}-class functionals and 12 other functionals},\n  journal = {Theor. Chem. Acc.},\n  volume = {120},\n  number = {1-3},\n  pages = {215},\n  year = {2008},\n  issn = {1432-881X},\n  publisher = {Springer-Verlag},\n  doi = {10.1007/s00214-007-0310-x},\n  url = {http://link.springer.com/article/10.1007\\\\%2Fs00214-007-0310-x}\n}\n", "Zhao2008_215"),
        ]),
    :mgga_c_m06_hf => IdentifierText(
        "Minnesota M06-HF correlation functional",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("Y. Zhao and D. G. Truhlar,  J. Phys. Chem. A 110, 13126 (2006)", "10.1021/jp066479k", "@article{Zhao2006_13126,\n  author = {Zhao, Y. and Truhlar, D. G.},\n  title = {Density Functional for Spectroscopy: No Long-Range Self-Interaction Error, Good Performance for {Rydberg} and Charge-Transfer States, and Better Performance on Average than {B3LYP} for Ground States},\n  journal = {J. Phys. Chem. A},\n  volume = {110},\n  number = {49},\n  pages = {13126},\n  year = {2006},\n  doi = {10.1021/jp066479k},\n  url = {http://pubs.acs.org/doi/abs/10.1021/jp066479k}\n}\n", "Zhao2006_13126"),
        ]),
    :mgga_c_m06_l => IdentifierText(
        "Minnesota M06-L correlation functional",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("Y. Zhao and D. G. Truhlar,  J. Chem. Phys. 125, 194101 (2006)", "10.1063/1.2370993", "@article{Zhao2006_194101,\n  author = {Zhao, Y. and Truhlar, D. G.},\n  title = {A new local density functional for main-group thermochemistry, transition metal bonding, thermochemical kinetics, and noncovalent interactions},\n  journal = {J. Chem. Phys.},\n  year = {2006},\n  volume = {125},\n  number = {19},\n  pages = {194101},\n  doi = {10.1063/1.2370993},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/125/19/10.1063/1.2370993}\n}\n", "Zhao2006_194101"),
            LibxcReference("Y. Zhao and D. G. Truhlar,  Theor. Chem. Acc. 120, 215 (2008)", "10.1007/s00214-007-0310-x", "@article{Zhao2008_215,\n  author = {Zhao, Y. and Truhlar, D. G.},\n  title = {The {M06} suite of density functionals for main group thermochemistry, thermochemical kinetics, noncovalent interactions, excited states, and transition elements: two new functionals and systematic testing of four {M06}-class functionals and 12 other functionals},\n  journal = {Theor. Chem. Acc.},\n  volume = {120},\n  number = {1-3},\n  pages = {215},\n  year = {2008},\n  issn = {1432-881X},\n  publisher = {Springer-Verlag},\n  doi = {10.1007/s00214-007-0310-x},\n  url = {http://link.springer.com/article/10.1007\\\\%2Fs00214-007-0310-x}\n}\n", "Zhao2008_215"),
        ]),
    :mgga_c_m06_sx => IdentifierText(
        "Minnesota M06-SX correlation functional",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("Y. Wang, P. Verma, L. Zhang, Y. Li, Z. Liu, D. G. Truhlar, and X. He,  Proc. Natl. Acad. Sci. U. S. A. 117, 2294–2301 (2020)", "10.1073/pnas.1913699117", "@article{Wang2020_2294,\n  author = {Wang, Ying and Verma, Pragya and Zhang, Lujia and Li, Yaqi and Liu, Zhonghua and Truhlar, Donald G. and He, Xiao},\n  title = {{M06}-{SX} screened-exchange density functional for chemistry and solid-state physics},\n  journal = {Proc. Natl. Acad. Sci. U. S. A.},\n  volume = {117},\n  number = {5},\n  pages = {2294--2301},\n  year = {2020},\n  doi = {10.1073/pnas.1913699117},\n  publisher = {National Academy of Sciences},\n  issn = {0027-8424},\n  url = {https://www.pnas.org/content/117/5/2294}\n}\n", "Wang2020_2294"),
        ]),
    :mgga_c_m08_hx => IdentifierText(
        "Minnesota M08 correlation functional",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("Y. Zhao and D. G. Truhlar,  J. Chem. Theory Comput. 4, 1849 (2008)", "10.1021/ct800246v", "@article{Zhao2008_1849,\n  author = {Zhao, Y. and Truhlar, D. G.},\n  title = {Exploring the Limit of Accuracy of the Global Hybrid Meta Density Functional for Main-Group Thermochemistry, Kinetics, and Noncovalent Interactions},\n  journal = {J. Chem. Theory Comput.},\n  volume = {4},\n  number = {11},\n  pages = {1849},\n  year = {2008},\n  doi = {10.1021/ct800246v},\n  url = {http://pubs.acs.org/doi/abs/10.1021/ct800246v}\n}\n", "Zhao2008_1849"),
        ]),
    :mgga_c_m08_so => IdentifierText(
        "Minnesota M08-SO correlation functional",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("Y. Zhao and D. G. Truhlar,  J. Chem. Theory Comput. 4, 1849 (2008)", "10.1021/ct800246v", "@article{Zhao2008_1849,\n  author = {Zhao, Y. and Truhlar, D. G.},\n  title = {Exploring the Limit of Accuracy of the Global Hybrid Meta Density Functional for Main-Group Thermochemistry, Kinetics, and Noncovalent Interactions},\n  journal = {J. Chem. Theory Comput.},\n  volume = {4},\n  number = {11},\n  pages = {1849},\n  year = {2008},\n  doi = {10.1021/ct800246v},\n  url = {http://pubs.acs.org/doi/abs/10.1021/ct800246v}\n}\n", "Zhao2008_1849"),
        ]),
    :mgga_c_m11 => IdentifierText(
        "Minnesota M11 correlation functional",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("R. Peverati and D. G. Truhlar,  J. Phys. Chem. Lett. 2, 2810 (2011)", "10.1021/jz201170d", "@article{Peverati2011_2810,\n  author = {Peverati, R. and Truhlar, D. G.},\n  title = {Improving the Accuracy of Hybrid Meta-{GGA} Density Functionals by Range Separation},\n  journal = {J. Phys. Chem. Lett.},\n  volume = {2},\n  number = {21},\n  pages = {2810},\n  year = {2011},\n  doi = {10.1021/jz201170d},\n  url = {http://pubs.acs.org/doi/abs/10.1021/jz201170d}\n}\n", "Peverati2011_2810"),
        ]),
    :mgga_c_m11_l => IdentifierText(
        "Minnesota M11-L correlation functional",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("R. Peverati and D. G. Truhlar,  J. Phys. Chem. Lett. 3, 117 (2012)", "10.1021/jz201525m", "@article{Peverati2012_117,\n  author = {Peverati, R. and Truhlar, D. G.},\n  title = {{M11}-{L}: A Local Density Functional That Provides Improved Accuracy for Electronic Structure Calculations in Chemistry and Physics},\n  journal = {J. Phys. Chem. Lett.},\n  volume = {3},\n  number = {1},\n  pages = {117},\n  year = {2012},\n  doi = {10.1021/jz201525m},\n  url = {http://pubs.acs.org/doi/abs/10.1021/jz201525m}\n}\n", "Peverati2012_117"),
        ]),
    :mgga_c_mn12_l => IdentifierText(
        "Minnesota MN12-L correlation functional",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("R. Peverati and D. G. Truhlar,  Phys. Chem. Chem. Phys. 14, 13171 (2012)", "10.1039/C2CP42025B", "@article{Peverati2012_13171,\n  author = {Peverati, R. and Truhlar, D. G.},\n  title = {An improved and broadly accurate local approximation to the exchange-correlation density functional: The {MN12}-{L} functional for electronic structure calculations in chemistry and physics},\n  journal = {Phys. Chem. Chem. Phys.},\n  year = {2012},\n  volume = {14},\n  issue = {38},\n  pages = {13171},\n  publisher = {The Royal Society of Chemistry},\n  doi = {10.1039/C2CP42025B},\n  url = {http://pubs.rsc.org/en/Content/ArticleLanding/2012/CP/c2cp42025b}\n}\n", "Peverati2012_13171"),
        ]),
    :mgga_c_mn12_sx => IdentifierText(
        "Minnesota MN12-SX correlation functional",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("R. Peverati and D. G. Truhlar,  Phys. Chem. Chem. Phys. 14, 16187 (2012)", "10.1039/C2CP42576A", "@article{Peverati2012_16187,\n  author = {Peverati, R. and Truhlar, D. G.},\n  title = {Screened-exchange density functionals with broad accuracy for chemistry and solid-state physics},\n  journal = {Phys. Chem. Chem. Phys.},\n  year = {2012},\n  volume = {14},\n  issue = {47},\n  pages = {16187},\n  publisher = {The Royal Society of Chemistry},\n  doi = {10.1039/C2CP42576A},\n  url = {http://pubs.rsc.org/en/Content/ArticleLanding/2012/CP/c2cp42576a}\n}\n", "Peverati2012_16187"),
        ]),
    :mgga_c_mn15 => IdentifierText(
        "Minnesota MN15 correlation functional",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("H. S. Yu, X. He, S. L. Li, and D. G. Truhlar,  Chem. Sci. 7, 5032–5051 (2016)", "10.1039/C6SC00705H", "@article{Yu2016_5032,\n  author = {Yu, Haoyu S. and He, Xiao and Li, Shaohong L. and Truhlar, Donald G.},\n  title = {{MN15}: A {Kohn}--{Sham} global-hybrid exchange-correlation density functional with broad accuracy for multi-reference and single-reference systems and noncovalent interactions},\n  journal = {Chem. Sci.},\n  year = {2016},\n  volume = {7},\n  issue = {8},\n  pages = {5032--5051},\n  publisher = {The Royal Society of Chemistry},\n  doi = {10.1039/C6SC00705H},\n  url = {https://doi.org/10.1039/C6SC00705H}\n}\n", "Yu2016_5032"),
        ]),
    :mgga_c_mn15_l => IdentifierText(
        "Minnesota MN15-L correlation functional",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("H. S. Yu, X. He, and D. G. Truhlar,  J. Chem. Theory Comput. 12, 1280–1293 (2016)", "10.1021/acs.jctc.5b01082", "@article{Yu2016_1280,\n  author = {Yu, Haoyu S. and He, Xiao and Truhlar, Donald G.},\n  title = {{MN15}-{L}: A New Local Exchange-Correlation Functional for {Kohn}--{Sham} Density Functional Theory with Broad Accuracy for Atoms, Molecules, and Solids},\n  journal = {J. Chem. Theory Comput.},\n  volume = {12},\n  number = {3},\n  pages = {1280--1293},\n  year = {2016},\n  doi = {10.1021/acs.jctc.5b01082},\n  url = {https://doi.org/10.1021/acs.jctc.5b01082}\n}\n", "Yu2016_1280"),
        ]),
    :mgga_c_mscan => IdentifierText(
        "Modified SCAN (mSCAN) correlation of Desmarais, Erba, Vignale, and Pittalis",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("J. K. Desmarais, A. Erba, G. Vignale, and S. Pittalis,  Phys. Rev. Lett. 134, 106402 (2025)", "10.1103/PhysRevLett.134.106402", "@article{Desmarais2025_106402,\n  author = {Desmarais, Jacques K. and Erba, Alessandro and Vignale, Giovanni and Pittalis, Stefano},\n  title = {Meta-Generalized Gradient Approximation Made Magnetic},\n  journal = {Phys. Rev. Lett.},\n  volume = {134},\n  issue = {10},\n  pages = {106402},\n  year = {2025},\n  month = {Mar},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevLett.134.106402},\n  url = {https://link.aps.org/doi/10.1103/PhysRevLett.134.106402}\n}\n", "Desmarais2025_106402"),
        ]),
    :mgga_c_pi_m06_2x => IdentifierText(
        "Physically-informed Minnesota M06-2X correlation functional",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("T. V. Losev, I. D. Ivanov, I. S. Gerasimov, N. V. Krivoshchapov, and M. G. Medvedev,  J. Phys. Chem. A 128, 10921–10928 (2024)", "10.1021/acs.jpca.4c05085", "@article{Losev2024_10921,\n  author = {Losev, Timofey V. and Ivanov, Ilya D. and Gerasimov, Igor S. and Krivoshchapov, Nikolai V. and Medvedev, Michael G.},\n  title = {Informing Empirically Fitted Density Functionals about the Physics of Interelectronic Interactions},\n  journal = {J. Phys. Chem. A},\n  year = {2024},\n  month = {Dec},\n  day = {19},\n  publisher = {American Chemical Society},\n  volume = {128},\n  number = {50},\n  pages = {10921--10928},\n  issn = {1089-5639},\n  doi = {10.1021/acs.jpca.4c05085},\n  url = {https://doi.org/10.1021/acs.jpca.4c05085}\n}\n", "Losev2024_10921"),
        ]),
    :mgga_c_pi_m06_2x_dl => IdentifierText(
        "Dispersionless physically-informed Minnesota M06-2X correlation functional",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("T. V. Losev, I. D. Ivanov, I. S. Gerasimov, N. V. Krivoshchapov, and M. G. Medvedev,  J. Phys. Chem. A 128, 10921–10928 (2024)", "10.1021/acs.jpca.4c05085", "@article{Losev2024_10921,\n  author = {Losev, Timofey V. and Ivanov, Ilya D. and Gerasimov, Igor S. and Krivoshchapov, Nikolai V. and Medvedev, Michael G.},\n  title = {Informing Empirically Fitted Density Functionals about the Physics of Interelectronic Interactions},\n  journal = {J. Phys. Chem. A},\n  year = {2024},\n  month = {Dec},\n  day = {19},\n  publisher = {American Chemical Society},\n  volume = {128},\n  number = {50},\n  pages = {10921--10928},\n  issn = {1089-5639},\n  doi = {10.1021/acs.jpca.4c05085},\n  url = {https://doi.org/10.1021/acs.jpca.4c05085}\n}\n", "Losev2024_10921"),
        ]),
    :mgga_c_pkzb => IdentifierText(
        "Perdew, Kurth, Zupan, and Blaha",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("J. P. Perdew, S. Kurth, A. Zupan, and P. Blaha,  Phys. Rev. Lett. 82, 2544 (1999)", "10.1103/PhysRevLett.82.2544", "@article{Perdew1999_2544,\n  author = {Perdew, J. P. and Kurth, S. and Zupan, A. and Blaha, P.},\n  title = {Accurate Density Functional with Correct Formal Properties: A Step Beyond the Generalized Gradient Approximation},\n  journal = {Phys. Rev. Lett.},\n  volume = {82},\n  issue = {12},\n  pages = {2544},\n  year = {1999},\n  month = {Mar},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevLett.82.2544},\n  url = {http://link.aps.org/doi/10.1103/PhysRevLett.82.2544}\n}\n", "Perdew1999_2544"),
        ]),
    :mgga_c_r2scan => IdentifierText(
        "Re-regularized SCAN correlation by Furness et al",
        (:have_exc, :have_vxc, :have_fxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2),
        LibxcReference[
            LibxcReference("J. W. Furness, A. D. Kaplan, J. Ning, J. P. Perdew, and J. Sun,  J. Phys. Chem. Lett. 11, 8208–8215 (2020)", "10.1021/acs.jpclett.0c02405", "@article{Furness2020_8208,\n  author = {Furness, James W. and Kaplan, Aaron D. and Ning, Jinliang and Perdew, John P. and Sun, Jianwei},\n  title = {Accurate and Numerically Efficient r\$^2\${SCAN} Meta-Generalized Gradient Approximation},\n  journal = {J. Phys. Chem. Lett.},\n  volume = {11},\n  number = {19},\n  pages = {8208--8215},\n  year = {2020},\n  doi = {10.1021/acs.jpclett.0c02405},\n  url = {https://doi.org/10.1021/acs.jpclett.0c02405}\n}\n", "Furness2020_8208"),
            LibxcReference("J. W. Furness, A. D. Kaplan, J. Ning, J. P. Perdew, and J. Sun,  J. Phys. Chem. Lett. 11, 9248–9248 (2020)", "10.1021/acs.jpclett.0c03077", "@article{Furness2020_9248,\n  author = {Furness, James W. and Kaplan, Aaron D. and Ning, Jinliang and Perdew, John P. and Sun, Jianwei},\n  title = {Correction to \"{Accurate} and Numerically Efficient r\$^2\${SCAN} Meta-Generalized Gradient Approximation\"},\n  journal = {J. Phys. Chem. Lett.},\n  volume = {11},\n  number = {21},\n  pages = {9248--9248},\n  year = {2020},\n  doi = {10.1021/acs.jpclett.0c03077},\n  url = {https://doi.org/10.1021/acs.jpclett.0c03077}\n}\n", "Furness2020_9248"),
        ]),
    :mgga_c_r2scan01 => IdentifierText(
        "Re-regularized SCAN correlation with larger value for eta",
        (:have_exc, :have_vxc, :have_fxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2),
        LibxcReference[
            LibxcReference("N. A. W. Holzwarth, M. Torrent, J.-B. Charraud, and M. Côté,  Phys. Rev. B 105, 125144 (2022)", "10.1103/PhysRevB.105.125144", "@article{Holzwarth2022_125114,\n  author = {Holzwarth, N. A. W. and Torrent, Marc and Charraud, Jean-Baptiste and C\\^ot\\'e, Michel},\n  title = {Cubic spline solver for generalized density functional treatments of atoms and generation of atomic datasets for use with exchange-correlation functionals including meta-{GGA}},\n  journal = {Phys. Rev. B},\n  volume = {105},\n  issue = {12},\n  pages = {125144},\n  year = {2022},\n  month = {Mar},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevB.105.125144},\n  url = {https://link.aps.org/doi/10.1103/PhysRevB.105.125144}\n}\n", "Holzwarth2022_125114"),
            LibxcReference("J. W. Furness, A. D. Kaplan, J. Ning, J. P. Perdew, and J. Sun,  J. Phys. Chem. Lett. 11, 8208–8215 (2020)", "10.1021/acs.jpclett.0c02405", "@article{Furness2020_8208,\n  author = {Furness, James W. and Kaplan, Aaron D. and Ning, Jinliang and Perdew, John P. and Sun, Jianwei},\n  title = {Accurate and Numerically Efficient r\$^2\${SCAN} Meta-Generalized Gradient Approximation},\n  journal = {J. Phys. Chem. Lett.},\n  volume = {11},\n  number = {19},\n  pages = {8208--8215},\n  year = {2020},\n  doi = {10.1021/acs.jpclett.0c02405},\n  url = {https://doi.org/10.1021/acs.jpclett.0c02405}\n}\n", "Furness2020_8208"),
            LibxcReference("J. W. Furness, A. D. Kaplan, J. Ning, J. P. Perdew, and J. Sun,  J. Phys. Chem. Lett. 11, 9248–9248 (2020)", "10.1021/acs.jpclett.0c03077", "@article{Furness2020_9248,\n  author = {Furness, James W. and Kaplan, Aaron D. and Ning, Jinliang and Perdew, John P. and Sun, Jianwei},\n  title = {Correction to \"{Accurate} and Numerically Efficient r\$^2\${SCAN} Meta-Generalized Gradient Approximation\"},\n  journal = {J. Phys. Chem. Lett.},\n  volume = {11},\n  number = {21},\n  pages = {9248--9248},\n  year = {2020},\n  doi = {10.1021/acs.jpclett.0c03077},\n  url = {https://doi.org/10.1021/acs.jpclett.0c03077}\n}\n", "Furness2020_9248"),
        ]),
    :mgga_c_r2scanl => IdentifierText(
        "Deorbitalized re-regularized SCAN (r2SCAN-L) correlation",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_laplacian, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("D. Mejía-Rodríguez and S. B. Trickey,  Phys. Rev. B 102, 121109 (2020)", "10.1103/PhysRevB.102.121109", "@article{Mejia2020_121109,\n  author = {Mej\\'{i}a-Rodr\\'{i}guez, Daniel and Trickey, S. B.},\n  title = {Meta-{GGA} performance in solids at almost {GGA} cost},\n  journal = {Phys. Rev. B},\n  volume = {102},\n  issue = {12},\n  pages = {121109},\n  year = {2020},\n  month = {Sep},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevB.102.121109},\n  url = {https://link.aps.org/doi/10.1103/PhysRevB.102.121109}\n}\n", "Mejia2020_121109"),
            LibxcReference("J. W. Furness, A. D. Kaplan, J. Ning, J. P. Perdew, and J. Sun,  J. Phys. Chem. Lett. 11, 8208–8215 (2020)", "10.1021/acs.jpclett.0c02405", "@article{Furness2020_8208,\n  author = {Furness, James W. and Kaplan, Aaron D. and Ning, Jinliang and Perdew, John P. and Sun, Jianwei},\n  title = {Accurate and Numerically Efficient r\$^2\${SCAN} Meta-Generalized Gradient Approximation},\n  journal = {J. Phys. Chem. Lett.},\n  volume = {11},\n  number = {19},\n  pages = {8208--8215},\n  year = {2020},\n  doi = {10.1021/acs.jpclett.0c02405},\n  url = {https://doi.org/10.1021/acs.jpclett.0c02405}\n}\n", "Furness2020_8208"),
            LibxcReference("J. W. Furness, A. D. Kaplan, J. Ning, J. P. Perdew, and J. Sun,  J. Phys. Chem. Lett. 11, 9248–9248 (2020)", "10.1021/acs.jpclett.0c03077", "@article{Furness2020_9248,\n  author = {Furness, James W. and Kaplan, Aaron D. and Ning, Jinliang and Perdew, John P. and Sun, Jianwei},\n  title = {Correction to \"{Accurate} and Numerically Efficient r\$^2\${SCAN} Meta-Generalized Gradient Approximation\"},\n  journal = {J. Phys. Chem. Lett.},\n  volume = {11},\n  number = {21},\n  pages = {9248--9248},\n  year = {2020},\n  doi = {10.1021/acs.jpclett.0c03077},\n  url = {https://doi.org/10.1021/acs.jpclett.0c03077}\n}\n", "Furness2020_9248"),
        ]),
    :mgga_c_revm06 => IdentifierText(
        "Revised Minnesota M06 correlation functional",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("Y. Wang, P. Verma, X. Jin, D. G. Truhlar, and X. He,  Proc. Natl. Acad. Sci. U. S. A. 115, 10257–10262 (2018)", "10.1073/pnas.1810421115", "@article{Wang2018_10257,\n  author = {Wang, Ying and Verma, Pragya and Jin, Xinsheng and Truhlar, Donald G. and He, Xiao},\n  title = {Revised {M06} density functional for main-group and transition-metal chemistry},\n  journal = {Proc. Natl. Acad. Sci. U. S. A.},\n  volume = {115},\n  number = {41},\n  pages = {10257--10262},\n  year = {2018},\n  doi = {10.1073/pnas.1810421115},\n  publisher = {National Academy of Sciences},\n  issn = {0027-8424},\n  url = {https://www.pnas.org/content/115/41/10257}\n}\n", "Wang2018_10257"),
        ]),
    :mgga_c_revm06_l => IdentifierText(
        "Minnesota revM06-L correlation functional",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("Y. Wang, X. Jin, H. S. Yu, D. G. Truhlar, and X. He,  Proc. Natl. Acad. Sci. U. S. A. 114, 8487–8492 (2017)", "10.1073/pnas.1705670114", "@article{Wang2017_8487,\n  author = {Wang, Ying and Jin, Xinsheng and Yu, Haoyu S. and Truhlar, Donald G. and He, Xiao},\n  title = {Revised {M06}-{L} functional for improved accuracy on chemical reaction barrier heights, noncovalent interactions, and solid-state physics},\n  journal = {Proc. Natl. Acad. Sci. U. S. A.},\n  volume = {114},\n  number = {32},\n  pages = {8487--8492},\n  year = {2017},\n  doi = {10.1073/pnas.1705670114},\n  url = {http://www.pnas.org/content/114/32/8487.abstract}\n}\n", "Wang2017_8487"),
        ]),
    :mgga_c_revm11 => IdentifierText(
        "Revised Minnesota M11 correlation functional",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("P. Verma, Y. Wang, S. Ghosh, X. He, and D. G. Truhlar,  J. Phys. Chem. A 123, 2966–2990 (2019)", "10.1021/acs.jpca.8b11499", "@article{Verma2019_2966,\n  author = {Verma, Pragya and Wang, Ying and Ghosh, Soumen and He, Xiao and Truhlar, Donald G.},\n  title = {Revised {M11} Exchange-Correlation Functional for Electronic Excitation Energies and Ground-State Properties},\n  journal = {J. Phys. Chem. A},\n  volume = {123},\n  number = {13},\n  pages = {2966--2990},\n  year = {2019},\n  doi = {10.1021/acs.jpca.8b11499},\n  url = {https://doi.org/10.1021/acs.jpca.8b11499}\n}\n", "Verma2019_2966"),
        ]),
    :mgga_c_revscan => IdentifierText(
        "revised SCAN",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("P. D. Mezei, G. I. Csonka, and M. Kállay,  J. Chem. Theory Comput. 14, 2469–2479 (2018)", "10.1021/acs.jctc.8b00072", "@article{Mezei2018_2469,\n  author = {Mezei, P\\'{a}l D. and Csonka, G\\'{a}bor I. and K\\'{a}llay, Mih\\'{a}ly},\n  title = {Simple Modifications of the {SCAN} Meta-Generalized Gradient Approximation Functional},\n  journal = {J. Chem. Theory Comput.},\n  volume = {14},\n  number = {5},\n  pages = {2469--2479},\n  year = {2018},\n  doi = {10.1021/acs.jctc.8b00072},\n  url = {https://doi.org/10.1021/acs.jctc.8b00072}\n}\n", "Mezei2018_2469"),
        ]),
    :mgga_c_revscan_vv10 => IdentifierText(
        "REVSCAN + VV10 correlation",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :vv10, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("P. D. Mezei, G. I. Csonka, and M. Kállay,  J. Chem. Theory Comput. 14, 2469–2479 (2018)", "10.1021/acs.jctc.8b00072", "@article{Mezei2018_2469,\n  author = {Mezei, P\\'{a}l D. and Csonka, G\\'{a}bor I. and K\\'{a}llay, Mih\\'{a}ly},\n  title = {Simple Modifications of the {SCAN} Meta-Generalized Gradient Approximation Functional},\n  journal = {J. Chem. Theory Comput.},\n  volume = {14},\n  number = {5},\n  pages = {2469--2479},\n  year = {2018},\n  doi = {10.1021/acs.jctc.8b00072},\n  url = {https://doi.org/10.1021/acs.jctc.8b00072}\n}\n", "Mezei2018_2469"),
        ]),
    :mgga_c_revtm => IdentifierText(
        "revised Tao and Mo 2016 exchange",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3),
        LibxcReference[
            LibxcReference("S. Jana, K. Sharma, and P. Samal,  J. Phys. Chem. A 123, 6356–6369 (2019)", "10.1021/acs.jpca.9b02921", "@article{Jana2019_6356,\n  author = {Jana, Subrata and Sharma, Kedar and Samal, Prasanjit},\n  title = {Improving the Performance of {Tao}--{Mo} Non-empirical Density Functional with Broader Applicability in Quantum Chemistry and Materials Science},\n  journal = {J. Phys. Chem. A},\n  volume = {123},\n  number = {29},\n  pages = {6356--6369},\n  year = {2019},\n  doi = {10.1021/acs.jpca.9b02921},\n  url = {https://doi.org/10.1021/acs.jpca.9b02921}\n}\n", "Jana2019_6356"),
        ]),
    :mgga_c_revtpss => IdentifierText(
        "revised TPSS correlation",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3),
        LibxcReference[
            LibxcReference("J. P. Perdew, A. Ruzsinszky, G. I. Csonka, L. A. Constantin, and J. Sun,  Phys. Rev. Lett. 103, 026403 (2009)", "10.1103/PhysRevLett.103.026403", "@article{Perdew2009_026403,\n  author = {Perdew, J. P. and Ruzsinszky, A. and Csonka, G. I. and Constantin, L. A. and Sun, J.},\n  title = {Workhorse Semilocal Density Functional for Condensed Matter Physics and Quantum Chemistry},\n  journal = {Phys. Rev. Lett.},\n  volume = {103},\n  issue = {2},\n  pages = {026403},\n  year = {2009},\n  month = {Jul},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevLett.103.026403},\n  url = {http://link.aps.org/doi/10.1103/PhysRevLett.103.026403}\n}\n", "Perdew2009_026403"),
            LibxcReference("J. P. Perdew, A. Ruzsinszky, G. I. Csonka, L. A. Constantin, and J. Sun,  Phys. Rev. Lett. 106, 179902 (2011)", "10.1103/PhysRevLett.106.179902", "@article{Perdew2011_179902,\n  author = {Perdew, J. P. and Ruzsinszky, A. and Csonka, G. I. and Constantin, L. A. and Sun, J.},\n  title = {Erratum: {Workhorse} Semilocal Density Functional for Condensed Matter Physics and Quantum Chemistry [{Phys.} {Rev.} {Lett.} 103, 026403 (2009)]},\n  journal = {Phys. Rev. Lett.},\n  volume = {106},\n  issue = {17},\n  pages = {179902},\n  year = {2011},\n  month = {Apr},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevLett.106.179902},\n  url = {http://link.aps.org/doi/10.1103/PhysRevLett.106.179902}\n}\n", "Perdew2011_179902"),
        ]),
    :mgga_c_rmggac => IdentifierText(
        "Revised correlation energy for MGGAC exchange functional",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("S. Jana, S. K. Behera, S. Śmiga, L. A. Constantin, and P. Samal,  New J. Phys. 23, 063007 (2021)", "10.1088/1367-2630/abfd4d", "@article{Jana2021_063007,\n  author = {Jana, Subrata and Behera, Sushant Kumar and {\\'{S}}miga, Szymon and Constantin, Lucian A. and Samal, Prasanjit},\n  title = {Improving the applicability of the {Pauli} kinetic energy density based semilocal functional for solids},\n  journal = {New J. Phys.},\n  volume = {23},\n  pages = {063007},\n  year = {2021},\n  month = {apr},\n  publisher = {{IOP} Publishing},\n  doi = {10.1088/1367-2630/abfd4d},\n  url = {https://doi.org/10.1088/1367-2630/abfd4d}\n}\n", "Jana2021_063007"),
        ]),
    :mgga_c_rppscan => IdentifierText(
        "r++SCAN: rSCAN with uniform density limit and coordinate scaling behavior",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("J. W. Furness, A. D. Kaplan, J. Ning, J. P. Perdew, and J. Sun,  J. Chem. Phys. 156, 034109 (2022)", "10.1063/5.0073623", "@article{Furness2022_034109,\n  author = {Furness, James W. and Kaplan, Aaron D. and Ning, Jinliang and Perdew, John P. and Sun, Jianwei},\n  title = {Construction of meta-{GGA} functionals through restoration of exact constraint adherence to regularized {SCAN} functionals},\n  journal = {J. Chem. Phys.},\n  volume = {156},\n  number = {3},\n  pages = {034109},\n  year = {2022},\n  doi = {10.1063/5.0073623},\n  url = {https://doi.org/10.1063/5.0073623}\n}\n", "Furness2022_034109"),
        ]),
    :mgga_c_rregtm => IdentifierText(
        "Revised regTM correlation by Jana et al",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("S. Jana, S. K. Behera, S. Śmiga, L. A. Constantin, and P. Samal,  J. Chem. Phys. 155, 024103 (2021)", "10.1063/5.0051331", "@article{Jana2021_024103,\n  author = {Jana, Subrata and Behera, Sushant Kumar and \\'{S}miga, Szymon and Constantin, Lucian A. and Samal, Prasanjit},\n  title = {Accurate density functional made more versatile},\n  journal = {J. Chem. Phys.},\n  volume = {155},\n  number = {2},\n  pages = {024103},\n  year = {2021},\n  doi = {10.1063/5.0051331},\n  url = {https://doi.org/10.1063/5.0051331}\n}\n", "Jana2021_024103"),
        ]),
    :mgga_c_rscan => IdentifierText(
        "Regularized SCAN correlation by Bartok and Yates",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3),
        LibxcReference[
            LibxcReference("A. P. Bartók and J. R. Yates,  J. Chem. Phys. 150, 161101 (2019)", "10.1063/1.5094646", "@article{Bartok2019_161101,\n  author = {Bart\\'{o}k, Albert P. and Yates, Jonathan R.},\n  title = {Regularized {SCAN} functional},\n  journal = {J. Chem. Phys.},\n  volume = {150},\n  number = {16},\n  pages = {161101},\n  year = {2019},\n  doi = {10.1063/1.5094646},\n  url = {https://doi.org/10.1063/1.5094646}\n}\n", "Bartok2019_161101"),
        ]),
    :mgga_c_scan => IdentifierText(
        "SCAN correlation of Sun, Ruzsinszky, and Perdew",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("J. Sun, A. Ruzsinszky, and J. P. Perdew,  Phys. Rev. Lett. 115, 036402 (2015)", "10.1103/PhysRevLett.115.036402", "@article{Sun2015_036402,\n  author = {Sun, Jianwei and Ruzsinszky, Adrienn and Perdew, John P.},\n  title = {Strongly Constrained and Appropriately Normed Semilocal Density Functional},\n  journal = {Phys. Rev. Lett.},\n  volume = {115},\n  issue = {3},\n  pages = {036402},\n  year = {2015},\n  month = {Jul},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevLett.115.036402},\n  url = {http://link.aps.org/doi/10.1103/PhysRevLett.115.036402}\n}\n", "Sun2015_036402"),
        ]),
    :mgga_c_scan_rvv10 => IdentifierText(
        "SCAN + rVV10 correlation",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :vv10, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("H. Peng, Z.-H. Yang, J. P. Perdew, and J. Sun,  Phys. Rev. X 6, 041005 (2016)", "10.1103/PhysRevX.6.041005", "@article{Peng2016_041005,\n  author = {Peng, Haowei and Yang, Zeng-Hui and Perdew, John P. and Sun, Jianwei},\n  title = {Versatile van der {Waals} Density Functional Based on a Meta-Generalized Gradient Approximation},\n  journal = {Phys. Rev. X},\n  volume = {6},\n  issue = {4},\n  pages = {041005},\n  year = {2016},\n  month = {Oct},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevX.6.041005},\n  url = {https://link.aps.org/doi/10.1103/PhysRevX.6.041005}\n}\n", "Peng2016_041005"),
        ]),
    :mgga_c_scan_vv10 => IdentifierText(
        "SCAN + VV10 correlation",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :vv10, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("J. G. Brandenburg, J. E. Bates, J. Sun, and J. P. Perdew,  Phys. Rev. B 94, 115144 (2016)", "10.1103/PhysRevB.94.115144", "@article{Brandenburg2016_115144,\n  author = {Brandenburg, J. G. and Bates, J. E. and Sun, J. and Perdew, J. P.},\n  title = {Benchmark tests of a strongly constrained semilocal functional with a long-range dispersion correction},\n  journal = {Phys. Rev. B},\n  volume = {94},\n  issue = {11},\n  pages = {115144},\n  year = {2016},\n  month = {Sep},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevB.94.115144},\n  url = {https://link.aps.org/doi/10.1103/PhysRevB.94.115144}\n}\n", "Brandenburg2016_115144"),
        ]),
    :mgga_c_scanl => IdentifierText(
        "Deorbitalized SCAN (SCAN-L) correlation",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_laplacian, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("D. Mejía-Rodríguez and S. B. Trickey,  Phys. Rev. A 96, 052512 (2017)", "10.1103/PhysRevA.96.052512", "@article{Mejia2017_052512,\n  author = {Mej\\'{i}a-Rodr\\'{i}guez, Daniel and Trickey, S. B.},\n  title = {Deorbitalization strategies for meta-generalized-gradient-approximation exchange-correlation functionals},\n  journal = {Phys. Rev. A},\n  volume = {96},\n  issue = {5},\n  pages = {052512},\n  year = {2017},\n  month = {Nov},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevA.96.052512},\n  url = {https://link.aps.org/doi/10.1103/PhysRevA.96.052512}\n}\n", "Mejia2017_052512"),
            LibxcReference("D. Mejía-Rodríguez and S. B. Trickey,  Phys. Rev. B 98, 115161 (2018)", "10.1103/PhysRevB.98.115161", "@article{Mejia2018_115161,\n  author = {Mej\\'{i}a-Rodr\\'{i}guez, Daniel and Trickey, S. B.},\n  title = {Deorbitalized meta-{GGA} exchange-correlation functionals in solids},\n  journal = {Phys. Rev. B},\n  volume = {98},\n  issue = {11},\n  pages = {115161},\n  year = {2018},\n  month = {Sep},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevB.98.115161},\n  url = {https://link.aps.org/doi/10.1103/PhysRevB.98.115161}\n}\n", "Mejia2018_115161"),
            LibxcReference("J. Sun, A. Ruzsinszky, and J. P. Perdew,  Phys. Rev. Lett. 115, 036402 (2015)", "10.1103/PhysRevLett.115.036402", "@article{Sun2015_036402,\n  author = {Sun, Jianwei and Ruzsinszky, Adrienn and Perdew, John P.},\n  title = {Strongly Constrained and Appropriately Normed Semilocal Density Functional},\n  journal = {Phys. Rev. Lett.},\n  volume = {115},\n  issue = {3},\n  pages = {036402},\n  year = {2015},\n  month = {Jul},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevLett.115.036402},\n  url = {http://link.aps.org/doi/10.1103/PhysRevLett.115.036402}\n}\n", "Sun2015_036402"),
        ]),
    :mgga_c_scanl_rvv10 => IdentifierText(
        "SCAN-L + rVV10 correlation",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :vv10, :needs_laplacian, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("D. Mejía-Rodríguez and S. B. Trickey,  Phys. Rev. A 96, 052512 (2017)", "10.1103/PhysRevA.96.052512", "@article{Mejia2017_052512,\n  author = {Mej\\'{i}a-Rodr\\'{i}guez, Daniel and Trickey, S. B.},\n  title = {Deorbitalization strategies for meta-generalized-gradient-approximation exchange-correlation functionals},\n  journal = {Phys. Rev. A},\n  volume = {96},\n  issue = {5},\n  pages = {052512},\n  year = {2017},\n  month = {Nov},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevA.96.052512},\n  url = {https://link.aps.org/doi/10.1103/PhysRevA.96.052512}\n}\n", "Mejia2017_052512"),
            LibxcReference("D. Mejía-Rodríguez and S. B. Trickey,  Phys. Rev. B 98, 115161 (2018)", "10.1103/PhysRevB.98.115161", "@article{Mejia2018_115161,\n  author = {Mej\\'{i}a-Rodr\\'{i}guez, Daniel and Trickey, S. B.},\n  title = {Deorbitalized meta-{GGA} exchange-correlation functionals in solids},\n  journal = {Phys. Rev. B},\n  volume = {98},\n  issue = {11},\n  pages = {115161},\n  year = {2018},\n  month = {Sep},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevB.98.115161},\n  url = {https://link.aps.org/doi/10.1103/PhysRevB.98.115161}\n}\n", "Mejia2018_115161"),
            LibxcReference("H. Peng, Z.-H. Yang, J. P. Perdew, and J. Sun,  Phys. Rev. X 6, 041005 (2016)", "10.1103/PhysRevX.6.041005", "@article{Peng2016_041005,\n  author = {Peng, Haowei and Yang, Zeng-Hui and Perdew, John P. and Sun, Jianwei},\n  title = {Versatile van der {Waals} Density Functional Based on a Meta-Generalized Gradient Approximation},\n  journal = {Phys. Rev. X},\n  volume = {6},\n  issue = {4},\n  pages = {041005},\n  year = {2016},\n  month = {Oct},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevX.6.041005},\n  url = {https://link.aps.org/doi/10.1103/PhysRevX.6.041005}\n}\n", "Peng2016_041005"),
        ]),
    :mgga_c_scanl_vv10 => IdentifierText(
        "SCAN-L + VV10 correlation",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :vv10, :needs_laplacian, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("D. Mejía-Rodríguez and S. B. Trickey,  Phys. Rev. A 96, 052512 (2017)", "10.1103/PhysRevA.96.052512", "@article{Mejia2017_052512,\n  author = {Mej\\'{i}a-Rodr\\'{i}guez, Daniel and Trickey, S. B.},\n  title = {Deorbitalization strategies for meta-generalized-gradient-approximation exchange-correlation functionals},\n  journal = {Phys. Rev. A},\n  volume = {96},\n  issue = {5},\n  pages = {052512},\n  year = {2017},\n  month = {Nov},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevA.96.052512},\n  url = {https://link.aps.org/doi/10.1103/PhysRevA.96.052512}\n}\n", "Mejia2017_052512"),
            LibxcReference("D. Mejía-Rodríguez and S. B. Trickey,  Phys. Rev. B 98, 115161 (2018)", "10.1103/PhysRevB.98.115161", "@article{Mejia2018_115161,\n  author = {Mej\\'{i}a-Rodr\\'{i}guez, Daniel and Trickey, S. B.},\n  title = {Deorbitalized meta-{GGA} exchange-correlation functionals in solids},\n  journal = {Phys. Rev. B},\n  volume = {98},\n  issue = {11},\n  pages = {115161},\n  year = {2018},\n  month = {Sep},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevB.98.115161},\n  url = {https://link.aps.org/doi/10.1103/PhysRevB.98.115161}\n}\n", "Mejia2018_115161"),
            LibxcReference("J. G. Brandenburg, J. E. Bates, J. Sun, and J. P. Perdew,  Phys. Rev. B 94, 115144 (2016)", "10.1103/PhysRevB.94.115144", "@article{Brandenburg2016_115144,\n  author = {Brandenburg, J. G. and Bates, J. E. and Sun, J. and Perdew, J. P.},\n  title = {Benchmark tests of a strongly constrained semilocal functional with a long-range dispersion correction},\n  journal = {Phys. Rev. B},\n  volume = {94},\n  issue = {11},\n  pages = {115144},\n  year = {2016},\n  month = {Sep},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevB.94.115144},\n  url = {https://link.aps.org/doi/10.1103/PhysRevB.94.115144}\n}\n", "Brandenburg2016_115144"),
        ]),
    :mgga_c_tm => IdentifierText(
        "Tao and Mo 2016 correlation",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3),
        LibxcReference[
            LibxcReference("J. Tao and Y. Mo,  Phys. Rev. Lett. 117, 073001 (2016)", "10.1103/PhysRevLett.117.073001", "@article{Tao2016_073001,\n  author = {Tao, Jianmin and Mo, Yuxiang},\n  title = {Accurate Semilocal Density Functional for Condensed-Matter Physics and Quantum Chemistry},\n  journal = {Phys. Rev. Lett.},\n  volume = {117},\n  issue = {7},\n  pages = {073001},\n  year = {2016},\n  month = {Aug},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevLett.117.073001},\n  url = {http://link.aps.org/doi/10.1103/PhysRevLett.117.073001}\n}\n", "Tao2016_073001"),
        ]),
    :mgga_c_tpss => IdentifierText(
        "Tao, Perdew, Staroverov & Scuseria",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3),
        LibxcReference[
            LibxcReference("J. Tao, J. P. Perdew, V. N. Staroverov, and G. E. Scuseria,  Phys. Rev. Lett. 91, 146401 (2003)", "10.1103/PhysRevLett.91.146401", "@article{Tao2003_146401,\n  author = {Tao, J. and Perdew, J. P. and Staroverov, V. N. and Scuseria, G. E.},\n  title = {Climbing the Density Functional Ladder: Nonempirical Meta-Generalized Gradient Approximation Designed for Molecules and Solids},\n  journal = {Phys. Rev. Lett.},\n  volume = {91},\n  issue = {14},\n  pages = {146401},\n  year = {2003},\n  month = {Sep},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevLett.91.146401},\n  url = {http://link.aps.org/doi/10.1103/PhysRevLett.91.146401}\n}\n", "Tao2003_146401"),
            LibxcReference("J. P. Perdew, J. Tao, V. N. Staroverov, and G. E. Scuseria,  J. Chem. Phys. 120, 6898 (2004)", "10.1063/1.1665298", "@article{Perdew2004_6898,\n  author = {Perdew, J. P. and Tao, J. and Staroverov, V. N. and Scuseria, G. E.},\n  title = {Meta-generalized gradient approximation: Explanation of a realistic nonempirical density functional},\n  journal = {J. Chem. Phys.},\n  year = {2004},\n  volume = {120},\n  number = {15},\n  pages = {6898},\n  doi = {10.1063/1.1665298},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/120/15/10.1063/1.1665298}\n}\n", "Perdew2004_6898"),
        ]),
    :mgga_c_tpss_gaussian => IdentifierText(
        "Tao, Perdew, Staroverov & Scuseria with parameters from Gaussian",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3),
        LibxcReference[
            LibxcReference("J. Tao, J. P. Perdew, V. N. Staroverov, and G. E. Scuseria,  Phys. Rev. Lett. 91, 146401 (2003)", "10.1103/PhysRevLett.91.146401", "@article{Tao2003_146401,\n  author = {Tao, J. and Perdew, J. P. and Staroverov, V. N. and Scuseria, G. E.},\n  title = {Climbing the Density Functional Ladder: Nonempirical Meta-Generalized Gradient Approximation Designed for Molecules and Solids},\n  journal = {Phys. Rev. Lett.},\n  volume = {91},\n  issue = {14},\n  pages = {146401},\n  year = {2003},\n  month = {Sep},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevLett.91.146401},\n  url = {http://link.aps.org/doi/10.1103/PhysRevLett.91.146401}\n}\n", "Tao2003_146401"),
            LibxcReference("J. P. Perdew, J. Tao, V. N. Staroverov, and G. E. Scuseria,  J. Chem. Phys. 120, 6898 (2004)", "10.1063/1.1665298", "@article{Perdew2004_6898,\n  author = {Perdew, J. P. and Tao, J. and Staroverov, V. N. and Scuseria, G. E.},\n  title = {Meta-generalized gradient approximation: Explanation of a realistic nonempirical density functional},\n  journal = {J. Chem. Phys.},\n  year = {2004},\n  volume = {120},\n  number = {15},\n  pages = {6898},\n  doi = {10.1063/1.1665298},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/120/15/10.1063/1.1665298}\n}\n", "Perdew2004_6898"),
            LibxcReference("Defined through Gaussian implementation.", "", "@misc{gaussianimplementation,\n  note = {Defined through {Gaussian} implementation}\n}\n", "gaussianimplementation"),
        ]),
    :mgga_c_tpssloc => IdentifierText(
        "Semilocal dynamical correlation",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3),
        LibxcReference[
            LibxcReference("L. A. Constantin, E. Fabiano, and F. Della Sala,  Phys. Rev. B 86, 035130 (2012)", "10.1103/PhysRevB.86.035130", "@article{Constantin2012_035130,\n  author = {Constantin, Lucian A. and Fabiano, Eduardo and Della Sala, Fabio},\n  title = {Semilocal dynamical correlation with increased localization},\n  journal = {Phys. Rev. B},\n  volume = {86},\n  issue = {3},\n  pages = {035130},\n  year = {2012},\n  month = {Jul},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevB.86.035130},\n  url = {http://link.aps.org/doi/10.1103/PhysRevB.86.035130}\n}\n", "Constantin2012_035130"),
        ]),
    :mgga_c_vsxc => IdentifierText(
        "VSXC (correlation part)",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("T. Van Voorhis and G. E. Scuseria,  J. Chem. Phys. 109, 400–410 (1998)", "10.1063/1.476577", "@article{VanVoorhis1998_400,\n  author = {Van Voorhis, Troy and Scuseria, Gustavo E.},\n  title = {A novel form for the exchange-correlation energy functional},\n  journal = {J. Chem. Phys.},\n  volume = {109},\n  number = {2},\n  pages = {400--410},\n  year = {1998},\n  month = {07},\n  issn = {0021-9606},\n  doi = {10.1063/1.476577},\n  url = {https://doi.org/10.1063/1.476577}\n}\n", "VanVoorhis1998_400"),
            LibxcReference("T. Van Voorhis and G. E. Scuseria,  J. Chem. Phys. 129, 219901 (2008)", "10.1063/1.3005348", "@article{VanVoorhis2008_219901,\n  author = {Van Voorhis, Troy and Scuseria, Gustavo E.},\n  title = {Erratum: \"A novel form for the exchange-correlation energy functional\" [{J}. {Chem}. {Phys}. 109, 400 (1998)]},\n  journal = {J. Chem. Phys.},\n  volume = {129},\n  number = {21},\n  pages = {219901},\n  year = {2008},\n  month = {12},\n  issn = {0021-9606},\n  doi = {10.1063/1.3005348},\n  url = {https://doi.org/10.1063/1.3005348}\n}\n", "VanVoorhis2008_219901"),
        ]),
    :mgga_k_csk1 => IdentifierText(
        "mGGA-rev functional by Cancio, Stewart, and Kuna (a=1)",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_laplacian, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("A. C. Cancio, D. Stewart, and A. Kuna,  J. Chem. Phys. 144, 084107 (2016)", "10.1063/1.4942016", "@article{Cancio2016_084107,\n  author = {Cancio, Antonio C. and Stewart, Dane and Kuna, Aeryk},\n  title = {Visualization and analysis of the {Kohn}--{Sham} kinetic energy density and its orbital-free description in molecules},\n  journal = {J. Chem. Phys.},\n  volume = {144},\n  number = {8},\n  pages = {084107},\n  year = {2016},\n  doi = {10.1063/1.4942016},\n  url = {https://doi.org/10.1063/1.4942016}\n}\n", "Cancio2016_084107"),
        ]),
    :mgga_k_csk4 => IdentifierText(
        "mGGA-rev functional by Cancio, Stewart, and Kuna (a=4)",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_laplacian, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("A. C. Cancio, D. Stewart, and A. Kuna,  J. Chem. Phys. 144, 084107 (2016)", "10.1063/1.4942016", "@article{Cancio2016_084107,\n  author = {Cancio, Antonio C. and Stewart, Dane and Kuna, Aeryk},\n  title = {Visualization and analysis of the {Kohn}--{Sham} kinetic energy density and its orbital-free description in molecules},\n  journal = {J. Chem. Phys.},\n  volume = {144},\n  number = {8},\n  pages = {084107},\n  year = {2016},\n  doi = {10.1063/1.4942016},\n  url = {https://doi.org/10.1063/1.4942016}\n}\n", "Cancio2016_084107"),
        ]),
    :mgga_k_csk_loc1 => IdentifierText(
        "mGGAloc-rev functional by Cancio, Stewart, and Kuna (a=1)",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_laplacian, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("A. C. Cancio, D. Stewart, and A. Kuna,  J. Chem. Phys. 144, 084107 (2016)", "10.1063/1.4942016", "@article{Cancio2016_084107,\n  author = {Cancio, Antonio C. and Stewart, Dane and Kuna, Aeryk},\n  title = {Visualization and analysis of the {Kohn}--{Sham} kinetic energy density and its orbital-free description in molecules},\n  journal = {J. Chem. Phys.},\n  volume = {144},\n  number = {8},\n  pages = {084107},\n  year = {2016},\n  doi = {10.1063/1.4942016},\n  url = {https://doi.org/10.1063/1.4942016}\n}\n", "Cancio2016_084107"),
        ]),
    :mgga_k_csk_loc4 => IdentifierText(
        "mGGAloc-rev functional by Cancio, Stewart, and Kuna (a=4)",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_laplacian, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("A. C. Cancio, D. Stewart, and A. Kuna,  J. Chem. Phys. 144, 084107 (2016)", "10.1063/1.4942016", "@article{Cancio2016_084107,\n  author = {Cancio, Antonio C. and Stewart, Dane and Kuna, Aeryk},\n  title = {Visualization and analysis of the {Kohn}--{Sham} kinetic energy density and its orbital-free description in molecules},\n  journal = {J. Chem. Phys.},\n  volume = {144},\n  number = {8},\n  pages = {084107},\n  year = {2016},\n  doi = {10.1063/1.4942016},\n  url = {https://doi.org/10.1063/1.4942016}\n}\n", "Cancio2016_084107"),
        ]),
    :mgga_k_gea2 => IdentifierText(
        "Second-order gradient expansion",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_laplacian, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("A. S. Kompaneets and E. S. Pavlovskii,  Zh. Eksp. Teor. Fiz. 31, 427 (1956)", "", "@article{Kompaneets1956_427,\n  author = {Kompaneets, A. S. and Pavlovskii, E. S.},\n  title = {The Self-consistent Field Equations in an Atom},\n  journal = {Zh. Eksp. Teor. Fiz.},\n  year = {1956},\n  volume = {31},\n  pages = {427},\n  note = {[J. Exp. Theor. Phys. 4, 328 (1957)]}\n}\n", "Kompaneets1956_427"),
            LibxcReference("D. A. Kirznits,  Zh. Eksp. Teor. Fiz. 32, 115 (1957)", "", "@article{Kirznits1957_115,\n  author = {Kirznits, D. A.},\n  title = {Quantum Corrections to the {Thomas}--{Fermi} Equation},\n  journal = {Zh. Eksp. Teor. Fiz.},\n  year = {1957},\n  volume = {32},\n  pages = {115},\n  note = {[J. Exp. Theor. Phys. 5, 64 (1957)]}\n}\n", "Kirznits1957_115"),
        ]),
    :mgga_k_gea4 => IdentifierText(
        "Fourth-order gradient expansion",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_laplacian, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("C. H. Hodges,  Can. J. Phys. 51, 1428–1437 (1973)", "10.1139/p73-189", "@article{Hodges1973_1428,\n  author = {Hodges, C. H.},\n  title = {Quantum Corrections to the {Thomas}--{Fermi} Approximation---The {Kirzhnits} Method},\n  journal = {Can. J. Phys.},\n  volume = {51},\n  number = {13},\n  pages = {1428--1437},\n  year = {1973},\n  doi = {10.1139/p73-189},\n  url = {https://doi.org/10.1139/p73-189}\n}\n", "Hodges1973_1428"),
        ]),
    :mgga_k_l04 => IdentifierText(
        "L0.4 by Laricchia et al",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_laplacian, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("S. Laricchia, L. A. Constantin, E. Fabiano, and F. Della Sala,  J. Chem. Theory Comput. 10, 164–179 (2014)", "10.1021/ct400836s", "@article{Laricchia2014_164,\n  author = {Laricchia, Savio and Constantin, Lucian A. and Fabiano, Eduardo and Della Sala, Fabio},\n  title = {Laplacian-Level Kinetic Energy Approximations Based on the Fourth-Order Gradient Expansion: Global Assessment and Application to the Subsystem Formulation of Density Functional Theory},\n  journal = {J. Chem. Theory Comput.},\n  volume = {10},\n  number = {1},\n  pages = {164--179},\n  year = {2014},\n  doi = {10.1021/ct400836s},\n  url = {https://doi.org/10.1021/ct400836s}\n}\n", "Laricchia2014_164"),
        ]),
    :mgga_k_l06 => IdentifierText(
        "L0.6 by Laricchia et al",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_laplacian, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("S. Laricchia, L. A. Constantin, E. Fabiano, and F. Della Sala,  J. Chem. Theory Comput. 10, 164–179 (2014)", "10.1021/ct400836s", "@article{Laricchia2014_164,\n  author = {Laricchia, Savio and Constantin, Lucian A. and Fabiano, Eduardo and Della Sala, Fabio},\n  title = {Laplacian-Level Kinetic Energy Approximations Based on the Fourth-Order Gradient Expansion: Global Assessment and Application to the Subsystem Formulation of Density Functional Theory},\n  journal = {J. Chem. Theory Comput.},\n  volume = {10},\n  number = {1},\n  pages = {164--179},\n  year = {2014},\n  doi = {10.1021/ct400836s},\n  url = {https://doi.org/10.1021/ct400836s}\n}\n", "Laricchia2014_164"),
        ]),
    :mgga_k_pc07 => IdentifierText(
        "Perdew and Constantin 2007",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_laplacian, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("J. P. Perdew and L. A. Constantin,  Phys. Rev. B 75, 155109 (2007)", "10.1103/PhysRevB.75.155109", "@article{Perdew2007_155109,\n  author = {Perdew, John P. and Constantin, Lucian A.},\n  title = {{Laplacian}-level density functionals for the kinetic energy density and exchange-correlation energy},\n  journal = {Phys. Rev. B},\n  volume = {75},\n  issue = {15},\n  pages = {155109},\n  year = {2007},\n  month = {Apr},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevB.75.155109},\n  url = {http://link.aps.org/doi/10.1103/PhysRevB.75.155109}\n}\n", "Perdew2007_155109"),
        ]),
    :mgga_k_pc07_opt => IdentifierText(
        "Reoptimized PC07 by Mejia-Rodriguez and Trickey",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_laplacian, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("D. Mejía-Rodríguez and S. B. Trickey,  Phys. Rev. A 96, 052512 (2017)", "10.1103/PhysRevA.96.052512", "@article{Mejia2017_052512,\n  author = {Mej\\'{i}a-Rodr\\'{i}guez, Daniel and Trickey, S. B.},\n  title = {Deorbitalization strategies for meta-generalized-gradient-approximation exchange-correlation functionals},\n  journal = {Phys. Rev. A},\n  volume = {96},\n  issue = {5},\n  pages = {052512},\n  year = {2017},\n  month = {Nov},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevA.96.052512},\n  url = {https://link.aps.org/doi/10.1103/PhysRevA.96.052512}\n}\n", "Mejia2017_052512"),
            LibxcReference("J. P. Perdew and L. A. Constantin,  Phys. Rev. B 75, 155109 (2007)", "10.1103/PhysRevB.75.155109", "@article{Perdew2007_155109,\n  author = {Perdew, John P. and Constantin, Lucian A.},\n  title = {{Laplacian}-level density functionals for the kinetic energy density and exchange-correlation energy},\n  journal = {Phys. Rev. B},\n  volume = {75},\n  issue = {15},\n  pages = {155109},\n  year = {2007},\n  month = {Apr},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevB.75.155109},\n  url = {http://link.aps.org/doi/10.1103/PhysRevB.75.155109}\n}\n", "Perdew2007_155109"),
        ]),
    :mgga_k_pgsl025 => IdentifierText(
        "PGSL025 (Pauli-Gaussian) functional by Constantin, Fabiano, and Della Sala",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_laplacian, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("L. A. Constantin, E. Fabiano, and F. Della Sala,  J. Phys. Chem. Lett. 9, 4385–4390 (2018)", "10.1021/acs.jpclett.8b01926", "@article{Constantin2018_4385,\n  author = {Constantin, Lucian A. and Fabiano, Eduardo and Della Sala, Fabio},\n  title = {Semilocal {Pauli}--{Gaussian} Kinetic Functionals for Orbital-Free Density Functional Theory Calculations of Solids},\n  journal = {J. Phys. Chem. Lett.},\n  volume = {9},\n  number = {15},\n  pages = {4385--4390},\n  year = {2018},\n  doi = {10.1021/acs.jpclett.8b01926},\n  url = {https://doi.org/10.1021/acs.jpclett.8b01926}\n}\n", "Constantin2018_4385"),
        ]),
    :mgga_k_rda => IdentifierText(
        "Reduced derivative approximation by Karasiev et al",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_laplacian, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("V. V. Karasiev, R. S. Jones, S. B. Trickey, and F. E. Harris,  Phys. Rev. B 80, 245120 (2009)", "10.1103/PhysRevB.80.245120", "@article{Karasiev2009_245120,\n  author = {Karasiev, V. V. and Jones, R. S. and Trickey, S. B. and Harris, Frank E.},\n  title = {Properties of constraint-based single-point approximate kinetic energy functionals},\n  journal = {Phys. Rev. B},\n  volume = {80},\n  issue = {24},\n  pages = {245120},\n  year = {2009},\n  month = {Dec},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevB.80.245120},\n  url = {https://link.aps.org/doi/10.1103/PhysRevB.80.245120}\n}\n", "Karasiev2009_245120"),
        ]),
    :mgga_x_2d_js17 => IdentifierText(
        "JS17 meta-GGA for 2D",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim2, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("S. Jana and P. Samal,  J. Phys. Chem. A 121, 4804–4811 (2017)", "10.1021/acs.jpca.7b03686", "@article{Jana2017_4804,\n  author = {Jana, Subrata and Samal, Prasanjit},\n  title = {Semilocal Exchange Energy Functional for Two-Dimensional Quantum Systems: A Step Beyond Generalized Gradient Approximations},\n  journal = {J. Phys. Chem. A},\n  volume = {121},\n  number = {25},\n  pages = {4804--4811},\n  year = {2017},\n  doi = {10.1021/acs.jpca.7b03686},\n  url = {https://doi.org/10.1021/acs.jpca.7b03686}\n}\n", "Jana2017_4804"),
        ]),
    :mgga_x_2d_prhg07 => IdentifierText(
        "Pittalis-Rasanen-Helbig-Gross 2007",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim2, :development, :needs_laplacian, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("S. Pittalis, E. Räsänen, N. Helbig, and E. K. U. Gross,  Phys. Rev. B 76, 235314 (2007)", "10.1103/PhysRevB.76.235314", "@article{Pittalis2007_235314,\n  author = {Pittalis, S. and R\\\"as\\\"anen, E. and Helbig, N. and Gross, E. K. U.},\n  title = {Exchange-energy functionals for finite two-dimensional systems},\n  journal = {Phys. Rev. B},\n  volume = {76},\n  issue = {23},\n  pages = {235314},\n  year = {2007},\n  month = {Dec},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevB.76.235314},\n  url = {http://link.aps.org/doi/10.1103/PhysRevB.76.235314}\n}\n", "Pittalis2007_235314"),
        ]),
    :mgga_x_2d_prhg07_prp10 => IdentifierText(
        "PRHG07 with Pittalis-Rasanen-Proetto 2010 correction",
        (:have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim2, :development, :needs_laplacian, :needs_tau, :enforce_fhc, :on_host),
        (1, 2, 3, 4),
        LibxcReference[
            LibxcReference("S. Pittalis, E. Räsänen, N. Helbig, and E. K. U. Gross,  Phys. Rev. B 76, 235314 (2007)", "10.1103/PhysRevB.76.235314", "@article{Pittalis2007_235314,\n  author = {Pittalis, S. and R\\\"as\\\"anen, E. and Helbig, N. and Gross, E. K. U.},\n  title = {Exchange-energy functionals for finite two-dimensional systems},\n  journal = {Phys. Rev. B},\n  volume = {76},\n  issue = {23},\n  pages = {235314},\n  year = {2007},\n  month = {Dec},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevB.76.235314},\n  url = {http://link.aps.org/doi/10.1103/PhysRevB.76.235314}\n}\n", "Pittalis2007_235314"),
            LibxcReference("S. Pittalis, E. Räsänen, and C. R. Proetto,  Phys. Rev. B 81, 115108 (2010)", "10.1103/PhysRevB.81.115108", "@article{Pittalis2010_115108,\n  author = {Pittalis, S. and R\\\"as\\\"anen, E. and Proetto, C. R.},\n  title = {{Becke}--{Johnson}-type exchange potential for two-dimensional systems},\n  journal = {Phys. Rev. B},\n  volume = {81},\n  issue = {11},\n  pages = {115108},\n  year = {2010},\n  month = {Mar},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevB.81.115108},\n  url = {http://link.aps.org/doi/10.1103/PhysRevB.81.115108}\n}\n", "Pittalis2010_115108"),
        ]),
    :mgga_x_b00 => IdentifierText(
        "Becke 2000",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_laplacian, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("A. D. Becke,  J. Chem. Phys. 112, 4020–4026 (2000)", "10.1063/1.480951", "@article{Becke2000_4020,\n  author = {Becke, Axel D.},\n  title = {Simulation of delocalized exchange by local density functionals},\n  journal = {J. Chem. Phys.},\n  year = {2000},\n  volume = {112},\n  number = {9},\n  pages = {4020--4026},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/112/9/10.1063/1.480951},\n  doi = {10.1063/1.480951}\n}\n", "Becke2000_4020"),
        ]),
    :mgga_x_bj06 => IdentifierText(
        "Becke & Johnson 06",
        (:have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_laplacian, :needs_tau, :enforce_fhc, :on_host),
        (1, 2, 3, 4),
        LibxcReference[
            LibxcReference("A. D. Becke and E. R. Johnson,  J. Chem. Phys. 124, 221101 (2006)", "10.1063/1.2213970", "@article{Becke2006_221101,\n  author = {Becke, A. D. and Johnson, E. R.},\n  title = {A simple effective potential for exchange},\n  journal = {J. Chem. Phys.},\n  year = {2006},\n  volume = {124},\n  number = {22},\n  pages = {221101},\n  doi = {10.1063/1.2213970},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/124/22/10.1063/1.2213970}\n}\n", "Becke2006_221101"),
        ]),
    :mgga_x_bloc => IdentifierText(
        "functional with balanced localization",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("L. A. Constantin, E. Fabiano, and F. Della Sala,  J. Chem. Theory Comput. 9, 2256 (2013)", "10.1021/ct400148r", "@article{Constantin2013_2256,\n  author = {Constantin, L. A. and Fabiano, E. and Della Sala, F.},\n  title = {Meta-{GGA} Exchange-Correlation Functional with a Balanced Treatment of Nonlocality},\n  journal = {J. Chem. Theory Comput.},\n  volume = {9},\n  number = {5},\n  pages = {2256},\n  year = {2013},\n  doi = {10.1021/ct400148r},\n  url = {http://pubs.acs.org/doi/abs/10.1021/ct400148r}\n}\n", "Constantin2013_2256"),
        ]),
    :mgga_x_br89 => IdentifierText(
        "Becke-Roussel 89, gamma = 0.8",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_laplacian, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("A. D. Becke and M. R. Roussel,  Phys. Rev. A 39, 3761 (1989)", "10.1103/PhysRevA.39.3761", "@article{Becke1989_3761,\n  author = {Becke, A. D. and Roussel, M. R.},\n  title = {Exchange holes in inhomogeneous systems: A coordinate-space model},\n  journal = {Phys. Rev. A},\n  volume = {39},\n  issue = {8},\n  pages = {3761},\n  year = {1989},\n  month = {Apr},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevA.39.3761},\n  url = {http://link.aps.org/doi/10.1103/PhysRevA.39.3761}\n}\n", "Becke1989_3761"),
        ]),
    :mgga_x_br89_1 => IdentifierText(
        "Becke-Roussel 89, gamma = 1.0",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_laplacian, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("A. D. Becke and M. R. Roussel,  Phys. Rev. A 39, 3761 (1989)", "10.1103/PhysRevA.39.3761", "@article{Becke1989_3761,\n  author = {Becke, A. D. and Roussel, M. R.},\n  title = {Exchange holes in inhomogeneous systems: A coordinate-space model},\n  journal = {Phys. Rev. A},\n  volume = {39},\n  issue = {8},\n  pages = {3761},\n  year = {1989},\n  month = {Apr},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevA.39.3761},\n  url = {http://link.aps.org/doi/10.1103/PhysRevA.39.3761}\n}\n", "Becke1989_3761"),
        ]),
    :mgga_x_br89_explicit => IdentifierText(
        "Becke-Roussel 89 with an explicit inversion of x(y), gamma = 0.8",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_laplacian, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("A. D. Becke and M. R. Roussel,  Phys. Rev. A 39, 3761 (1989)", "10.1103/PhysRevA.39.3761", "@article{Becke1989_3761,\n  author = {Becke, A. D. and Roussel, M. R.},\n  title = {Exchange holes in inhomogeneous systems: A coordinate-space model},\n  journal = {Phys. Rev. A},\n  volume = {39},\n  issue = {8},\n  pages = {3761},\n  year = {1989},\n  month = {Apr},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevA.39.3761},\n  url = {http://link.aps.org/doi/10.1103/PhysRevA.39.3761}\n}\n", "Becke1989_3761"),
            LibxcReference("E. Proynov, Z. Gan, and J. Kong,  Chem. Phys. Lett. 455, 103–109 (2008)", "10.1016/j.cplett.2008.02.039", "@article{Proynov2008_103,\n  author = {Proynov, Emil and Gan, Zhenting and Kong, Jing},\n  title = {Analytical representation of the {Becke}--{Roussel} exchange functional},\n  journal = {Chem. Phys. Lett.},\n  volume = {455},\n  number = {1},\n  pages = {103--109},\n  year = {2008},\n  issn = {0009-2614},\n  doi = {10.1016/j.cplett.2008.02.039},\n  url = {http://www.sciencedirect.com/science/article/pii/S0009261408002285}\n}\n", "Proynov2008_103"),
        ]),
    :mgga_x_br89_explicit_1 => IdentifierText(
        "Becke-Roussel 89 with an explicit inversion of x(y), gamma = 1.0",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_laplacian, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("A. D. Becke and M. R. Roussel,  Phys. Rev. A 39, 3761 (1989)", "10.1103/PhysRevA.39.3761", "@article{Becke1989_3761,\n  author = {Becke, A. D. and Roussel, M. R.},\n  title = {Exchange holes in inhomogeneous systems: A coordinate-space model},\n  journal = {Phys. Rev. A},\n  volume = {39},\n  issue = {8},\n  pages = {3761},\n  year = {1989},\n  month = {Apr},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevA.39.3761},\n  url = {http://link.aps.org/doi/10.1103/PhysRevA.39.3761}\n}\n", "Becke1989_3761"),
            LibxcReference("E. Proynov, Z. Gan, and J. Kong,  Chem. Phys. Lett. 455, 103–109 (2008)", "10.1016/j.cplett.2008.02.039", "@article{Proynov2008_103,\n  author = {Proynov, Emil and Gan, Zhenting and Kong, Jing},\n  title = {Analytical representation of the {Becke}--{Roussel} exchange functional},\n  journal = {Chem. Phys. Lett.},\n  volume = {455},\n  number = {1},\n  pages = {103--109},\n  year = {2008},\n  issn = {0009-2614},\n  doi = {10.1016/j.cplett.2008.02.039},\n  url = {http://www.sciencedirect.com/science/article/pii/S0009261408002285}\n}\n", "Proynov2008_103"),
        ]),
    :mgga_x_edmgga => IdentifierText(
        "Tao 2001",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :development, :needs_laplacian, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("J. Tao,  J. Chem. Phys. 115, 3519–3530 (2001)", "10.1063/1.1388047", "@article{Tao2001_3519,\n  author = {Tao, Jianmin},\n  title = {Exchange energy density of an atom as a functional of the electron density},\n  journal = {J. Chem. Phys.},\n  volume = {115},\n  number = {8},\n  pages = {3519--3530},\n  year = {2001},\n  doi = {10.1063/1.1388047},\n  url = {https://doi.org/10.1063/1.1388047}\n}\n", "Tao2001_3519"),
        ]),
    :mgga_x_eel => IdentifierText(
        "Exact exchange-like exchange of Aschebrock et al",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("T. Aschebrock, T. Lebeda, M. Brütting, R. Richter, I. Schelter, and S. Kümmel,  J. Chem. Phys. 159, 234107 (2023)", "10.1063/5.0173776", "@article{Aschebrock2023_234107,\n  author = {Aschebrock, Thilo and Lebeda, Timo and Br\\\"{u}tting, Moritz and Richter, Rian and Schelter, Ingo and K\\\"{u}mmel, Stephan},\n  title = {{Exact exchange-like electric response from a meta-generalized gradient approximation: A semilocal realization of ultranonlocality}},\n  journal = {J. Chem. Phys.},\n  volume = {159},\n  number = {23},\n  pages = {234107},\n  year = {2023},\n  month = {12},\n  issn = {0021-9606},\n  doi = {10.1063/5.0173776},\n  url = {https://doi.org/10.1063/5.0173776}\n}\n", "Aschebrock2023_234107"),
        ]),
    :mgga_x_ft98 => IdentifierText(
        "Filatov and Thiel 1998 meta-GGA exchange",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_laplacian, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("M. Filatov and W. Thiel,  Phys. Rev. A 57, 189–199 (1998)", "10.1103/PhysRevA.57.189", "@article{Filatov1998_189,\n  author = {Filatov, Michael and Thiel, Walter},\n  title = {Exchange-correlation density functional beyond the gradient approximation},\n  journal = {Phys. Rev. A},\n  volume = {57},\n  issue = {1},\n  pages = {189--199},\n  year = {1998},\n  month = {Jan},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevA.57.189},\n  url = {https://link.aps.org/doi/10.1103/PhysRevA.57.189}\n}\n", "Filatov1998_189"),
        ]),
    :mgga_x_gdme_0 => IdentifierText(
        "Generalized density-matrix with a=0",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_laplacian, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("R. M. Koehl, G. K. Odom, and G. E. Scuseria,  Mol. Phys. 87, 835–843 (1996)", "10.1080/00268979600100561", "@article{Koehl1996_835,\n  author = {Koehl, Richard M. and Odom, Gregory K. and Scuseria, Gustavo E.},\n  title = {The use of density matrix expansions for calculating molecular exchange energies},\n  journal = {Mol. Phys.},\n  volume = {87},\n  number = {4},\n  pages = {835--843},\n  year = {1996},\n  publisher = {Taylor \\& Francis},\n  doi = {10.1080/00268979600100561},\n  url = {https://doi.org/10.1080/00268979600100561}\n}\n", "Koehl1996_835"),
        ]),
    :mgga_x_gdme_kos => IdentifierText(
        "Generalized density-matrix with a=0.00638",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_laplacian, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("R. M. Koehl, G. K. Odom, and G. E. Scuseria,  Mol. Phys. 87, 835–843 (1996)", "10.1080/00268979600100561", "@article{Koehl1996_835,\n  author = {Koehl, Richard M. and Odom, Gregory K. and Scuseria, Gustavo E.},\n  title = {The use of density matrix expansions for calculating molecular exchange energies},\n  journal = {Mol. Phys.},\n  volume = {87},\n  number = {4},\n  pages = {835--843},\n  year = {1996},\n  publisher = {Taylor \\& Francis},\n  doi = {10.1080/00268979600100561},\n  url = {https://doi.org/10.1080/00268979600100561}\n}\n", "Koehl1996_835"),
        ]),
    :mgga_x_gdme_nv => IdentifierText(
        "Generalized density-matrix with a=1/2",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_laplacian, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("J. W. Negele and D. Vautherin,  Phys. Rev. C 5, 1472–1493 (1972)", "10.1103/PhysRevC.5.1472", "@article{Negele1972_1472,\n  author = {Negele, J. W. and Vautherin, D.},\n  title = {Density-Matrix Expansion for an Effective Nuclear {Hamiltonian}},\n  journal = {Phys. Rev. C},\n  volume = {5},\n  issue = {5},\n  pages = {1472--1493},\n  year = {1972},\n  month = {May},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevC.5.1472},\n  url = {https://link.aps.org/doi/10.1103/PhysRevC.5.1472}\n}\n", "Negele1972_1472"),
            LibxcReference("R. M. Koehl, G. K. Odom, and G. E. Scuseria,  Mol. Phys. 87, 835–843 (1996)", "10.1080/00268979600100561", "@article{Koehl1996_835,\n  author = {Koehl, Richard M. and Odom, Gregory K. and Scuseria, Gustavo E.},\n  title = {The use of density matrix expansions for calculating molecular exchange energies},\n  journal = {Mol. Phys.},\n  volume = {87},\n  number = {4},\n  pages = {835--843},\n  year = {1996},\n  publisher = {Taylor \\& Francis},\n  doi = {10.1080/00268979600100561},\n  url = {https://doi.org/10.1080/00268979600100561}\n}\n", "Koehl1996_835"),
        ]),
    :mgga_x_gdme_vt => IdentifierText(
        "Varied-terms (VT) mGGA of Koehl, Odom, and Scuseria",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_laplacian, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("R. M. Koehl, G. K. Odom, and G. E. Scuseria,  Mol. Phys. 87, 835–843 (1996)", "10.1080/00268979600100561", "@article{Koehl1996_835,\n  author = {Koehl, Richard M. and Odom, Gregory K. and Scuseria, Gustavo E.},\n  title = {The use of density matrix expansions for calculating molecular exchange energies},\n  journal = {Mol. Phys.},\n  volume = {87},\n  number = {4},\n  pages = {835--843},\n  year = {1996},\n  publisher = {Taylor \\& Francis},\n  doi = {10.1080/00268979600100561},\n  url = {https://doi.org/10.1080/00268979600100561}\n}\n", "Koehl1996_835"),
        ]),
    :mgga_x_gp86 => IdentifierText(
        "Ghosh-Parr 1986 meta-GGA exchange, later reinvestigated by Manby and Knowles",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :development, :needs_laplacian, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("S. K. Ghosh and R. G. Parr,  Phys. Rev. A 34, 785–791 (1986)", "10.1103/PhysRevA.34.785", "@article{Ghosh1986_785,\n  author = {Ghosh, Swapan K. and Parr, Robert G.},\n  title = {Phase-space approach to the exchange-energy functional of density-functional theory},\n  journal = {Phys. Rev. A},\n  volume = {34},\n  issue = {2},\n  pages = {785--791},\n  year = {1986},\n  month = {Aug},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevA.34.785},\n  url = {https://link.aps.org/doi/10.1103/PhysRevA.34.785}\n}\n", "Ghosh1986_785"),
            LibxcReference("F. R. Manby and P. J. Knowles,  J. Chem. Phys. 112, 7002 (2000)", "10.1063/1.481298", "@article{Manby2000_7002,\n  author = {Manby, F. R. and Knowles, P. J.},\n  title = {An exchange functional for accurate virtual orbital energies},\n  journal = {J. Chem. Phys.},\n  year = {2000},\n  volume = {112},\n  number = {16},\n  pages = {7002},\n  doi = {10.1063/1.481298},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/112/16/10.1063/1.481298}\n}\n", "Manby2000_7002"),
        ]),
    :mgga_x_gvt4 => IdentifierText(
        "GVT4 (X part of VSXC)",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("T. Van Voorhis and G. E. Scuseria,  J. Chem. Phys. 109, 400–410 (1998)", "10.1063/1.476577", "@article{VanVoorhis1998_400,\n  author = {Van Voorhis, Troy and Scuseria, Gustavo E.},\n  title = {A novel form for the exchange-correlation energy functional},\n  journal = {J. Chem. Phys.},\n  volume = {109},\n  number = {2},\n  pages = {400--410},\n  year = {1998},\n  month = {07},\n  issn = {0021-9606},\n  doi = {10.1063/1.476577},\n  url = {https://doi.org/10.1063/1.476577}\n}\n", "VanVoorhis1998_400"),
            LibxcReference("T. Van Voorhis and G. E. Scuseria,  J. Chem. Phys. 129, 219901 (2008)", "10.1063/1.3005348", "@article{VanVoorhis2008_219901,\n  author = {Van Voorhis, Troy and Scuseria, Gustavo E.},\n  title = {Erratum: \"A novel form for the exchange-correlation energy functional\" [{J}. {Chem}. {Phys}. 109, 400 (1998)]},\n  journal = {J. Chem. Phys.},\n  volume = {129},\n  number = {21},\n  pages = {219901},\n  year = {2008},\n  month = {12},\n  issn = {0021-9606},\n  doi = {10.1063/1.3005348},\n  url = {https://doi.org/10.1063/1.3005348}\n}\n", "VanVoorhis2008_219901"),
        ]),
    :mgga_x_gx => IdentifierText(
        "GX functional of Loos",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("P.-F. Loos,  J. Chem. Phys. 146, 114108 (2017)", "10.1063/1.4978409", "@article{Loos2017_114108,\n  author = {Loos, Pierre-Fran\\c{c}ois},\n  title = {Exchange functionals based on finite uniform electron gases},\n  journal = {J. Chem. Phys.},\n  volume = {146},\n  number = {11},\n  pages = {114108},\n  year = {2017},\n  doi = {10.1063/1.4978409},\n  url = {https://doi.org/10.1063/1.4978409}\n}\n", "Loos2017_114108"),
        ]),
    :mgga_x_hlta => IdentifierText(
        "Half-and-half meta-LDAized LDA exchange by Lehtola and Marques",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("S. Lehtola and M. A. L. Marques,  J. Chem. Theory Comput. 17, 943–948 (2021)", "10.1021/acs.jctc.0c01147", "@article{Lehtola2021_943,\n  author = {Lehtola, Susi and Marques, Miguel A. L.},\n  title = {Meta-Local Density Functionals: A New Rung on {Jacob}'s Ladder},\n  journal = {J. Chem. Theory Comput.},\n  volume = {17},\n  number = {2},\n  pages = {943--948},\n  year = {2021},\n  doi = {10.1021/acs.jctc.0c01147},\n  url = {https://doi.org/10.1021/acs.jctc.0c01147}\n}\n", "Lehtola2021_943"),
        ]),
    :mgga_x_jk => IdentifierText(
        "Jemmer-Knowles meta-GGA exchange",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_laplacian, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("P. \"Jemmer and P. J. Knowles,  Phys. Rev. A 51, 3571–3575 (1995)", "10.1103/PhysRevA.51.3571", "@article{Jemmer1995_3571,\n  author = {{\\\"J}emmer, Patrick and Knowles, Peter J.},\n  title = {Exchange energy in {Kohn}--{Sham} density-functional theory},\n  journal = {Phys. Rev. A},\n  volume = {51},\n  issue = {5},\n  pages = {3571--3575},\n  year = {1995},\n  month = {May},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevA.51.3571},\n  url = {https://link.aps.org/doi/10.1103/PhysRevA.51.3571}\n}\n", "Jemmer1995_3571"),
        ]),
    :mgga_x_ktbm_0 => IdentifierText(
        "KTBM learned exchange - 0",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("P. Kovács, F. Tran, P. Blaha, and G. K. H. Madsen,  J. Chem. Phys. 157, 094110 (2022)", "10.1063/5.0098787", "@article{Kovacs2022_094110,\n  author = {Kov\\'{a}cs, P\\'{e}ter and Tran, Fabien and Blaha, Peter and Madsen, Georg K. H.},\n  title = {{What is the optimal mGGA exchange functional for solids?}},\n  journal = {J. Chem. Phys.},\n  volume = {157},\n  number = {9},\n  year = {2022},\n  pages = {094110},\n  month = {09},\n  issn = {0021-9606},\n  doi = {10.1063/5.0098787},\n  url = {https://doi.org/10.1063/5.0098787}\n}\n", "Kovacs2022_094110"),
        ]),
    :mgga_x_ktbm_1 => IdentifierText(
        "KTBM learned exchange - 1",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("P. Kovács, F. Tran, P. Blaha, and G. K. H. Madsen,  J. Chem. Phys. 157, 094110 (2022)", "10.1063/5.0098787", "@article{Kovacs2022_094110,\n  author = {Kov\\'{a}cs, P\\'{e}ter and Tran, Fabien and Blaha, Peter and Madsen, Georg K. H.},\n  title = {{What is the optimal mGGA exchange functional for solids?}},\n  journal = {J. Chem. Phys.},\n  volume = {157},\n  number = {9},\n  year = {2022},\n  pages = {094110},\n  month = {09},\n  issn = {0021-9606},\n  doi = {10.1063/5.0098787},\n  url = {https://doi.org/10.1063/5.0098787}\n}\n", "Kovacs2022_094110"),
        ]),
    :mgga_x_ktbm_2 => IdentifierText(
        "KTBM learned exchange - 2",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("P. Kovács, F. Tran, P. Blaha, and G. K. H. Madsen,  J. Chem. Phys. 157, 094110 (2022)", "10.1063/5.0098787", "@article{Kovacs2022_094110,\n  author = {Kov\\'{a}cs, P\\'{e}ter and Tran, Fabien and Blaha, Peter and Madsen, Georg K. H.},\n  title = {{What is the optimal mGGA exchange functional for solids?}},\n  journal = {J. Chem. Phys.},\n  volume = {157},\n  number = {9},\n  year = {2022},\n  pages = {094110},\n  month = {09},\n  issn = {0021-9606},\n  doi = {10.1063/5.0098787},\n  url = {https://doi.org/10.1063/5.0098787}\n}\n", "Kovacs2022_094110"),
        ]),
    :mgga_x_ktbm_3 => IdentifierText(
        "KTBM learned exchange - 3",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("P. Kovács, F. Tran, P. Blaha, and G. K. H. Madsen,  J. Chem. Phys. 157, 094110 (2022)", "10.1063/5.0098787", "@article{Kovacs2022_094110,\n  author = {Kov\\'{a}cs, P\\'{e}ter and Tran, Fabien and Blaha, Peter and Madsen, Georg K. H.},\n  title = {{What is the optimal mGGA exchange functional for solids?}},\n  journal = {J. Chem. Phys.},\n  volume = {157},\n  number = {9},\n  year = {2022},\n  pages = {094110},\n  month = {09},\n  issn = {0021-9606},\n  doi = {10.1063/5.0098787},\n  url = {https://doi.org/10.1063/5.0098787}\n}\n", "Kovacs2022_094110"),
        ]),
    :mgga_x_ktbm_4 => IdentifierText(
        "KTBM learned exchange - 4",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("P. Kovács, F. Tran, P. Blaha, and G. K. H. Madsen,  J. Chem. Phys. 157, 094110 (2022)", "10.1063/5.0098787", "@article{Kovacs2022_094110,\n  author = {Kov\\'{a}cs, P\\'{e}ter and Tran, Fabien and Blaha, Peter and Madsen, Georg K. H.},\n  title = {{What is the optimal mGGA exchange functional for solids?}},\n  journal = {J. Chem. Phys.},\n  volume = {157},\n  number = {9},\n  year = {2022},\n  pages = {094110},\n  month = {09},\n  issn = {0021-9606},\n  doi = {10.1063/5.0098787},\n  url = {https://doi.org/10.1063/5.0098787}\n}\n", "Kovacs2022_094110"),
        ]),
    :mgga_x_ktbm_5 => IdentifierText(
        "KTBM learned exchange - 5",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("P. Kovács, F. Tran, P. Blaha, and G. K. H. Madsen,  J. Chem. Phys. 157, 094110 (2022)", "10.1063/5.0098787", "@article{Kovacs2022_094110,\n  author = {Kov\\'{a}cs, P\\'{e}ter and Tran, Fabien and Blaha, Peter and Madsen, Georg K. H.},\n  title = {{What is the optimal mGGA exchange functional for solids?}},\n  journal = {J. Chem. Phys.},\n  volume = {157},\n  number = {9},\n  year = {2022},\n  pages = {094110},\n  month = {09},\n  issn = {0021-9606},\n  doi = {10.1063/5.0098787},\n  url = {https://doi.org/10.1063/5.0098787}\n}\n", "Kovacs2022_094110"),
        ]),
    :mgga_x_ktbm_6 => IdentifierText(
        "KTBM learned exchange - 6",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("P. Kovács, F. Tran, P. Blaha, and G. K. H. Madsen,  J. Chem. Phys. 157, 094110 (2022)", "10.1063/5.0098787", "@article{Kovacs2022_094110,\n  author = {Kov\\'{a}cs, P\\'{e}ter and Tran, Fabien and Blaha, Peter and Madsen, Georg K. H.},\n  title = {{What is the optimal mGGA exchange functional for solids?}},\n  journal = {J. Chem. Phys.},\n  volume = {157},\n  number = {9},\n  year = {2022},\n  pages = {094110},\n  month = {09},\n  issn = {0021-9606},\n  doi = {10.1063/5.0098787},\n  url = {https://doi.org/10.1063/5.0098787}\n}\n", "Kovacs2022_094110"),
        ]),
    :mgga_x_ktbm_7 => IdentifierText(
        "KTBM learned exchange - 7",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("P. Kovács, F. Tran, P. Blaha, and G. K. H. Madsen,  J. Chem. Phys. 157, 094110 (2022)", "10.1063/5.0098787", "@article{Kovacs2022_094110,\n  author = {Kov\\'{a}cs, P\\'{e}ter and Tran, Fabien and Blaha, Peter and Madsen, Georg K. H.},\n  title = {{What is the optimal mGGA exchange functional for solids?}},\n  journal = {J. Chem. Phys.},\n  volume = {157},\n  number = {9},\n  year = {2022},\n  pages = {094110},\n  month = {09},\n  issn = {0021-9606},\n  doi = {10.1063/5.0098787},\n  url = {https://doi.org/10.1063/5.0098787}\n}\n", "Kovacs2022_094110"),
        ]),
    :mgga_x_ktbm_8 => IdentifierText(
        "KTBM learned exchange - 8",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("P. Kovács, F. Tran, P. Blaha, and G. K. H. Madsen,  J. Chem. Phys. 157, 094110 (2022)", "10.1063/5.0098787", "@article{Kovacs2022_094110,\n  author = {Kov\\'{a}cs, P\\'{e}ter and Tran, Fabien and Blaha, Peter and Madsen, Georg K. H.},\n  title = {{What is the optimal mGGA exchange functional for solids?}},\n  journal = {J. Chem. Phys.},\n  volume = {157},\n  number = {9},\n  year = {2022},\n  pages = {094110},\n  month = {09},\n  issn = {0021-9606},\n  doi = {10.1063/5.0098787},\n  url = {https://doi.org/10.1063/5.0098787}\n}\n", "Kovacs2022_094110"),
        ]),
    :mgga_x_ktbm_9 => IdentifierText(
        "KTBM learned exchange - 9",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("P. Kovács, F. Tran, P. Blaha, and G. K. H. Madsen,  J. Chem. Phys. 157, 094110 (2022)", "10.1063/5.0098787", "@article{Kovacs2022_094110,\n  author = {Kov\\'{a}cs, P\\'{e}ter and Tran, Fabien and Blaha, Peter and Madsen, Georg K. H.},\n  title = {{What is the optimal mGGA exchange functional for solids?}},\n  journal = {J. Chem. Phys.},\n  volume = {157},\n  number = {9},\n  year = {2022},\n  pages = {094110},\n  month = {09},\n  issn = {0021-9606},\n  doi = {10.1063/5.0098787},\n  url = {https://doi.org/10.1063/5.0098787}\n}\n", "Kovacs2022_094110"),
        ]),
    :mgga_x_ktbm_10 => IdentifierText(
        "KTBM learned exchange - 10",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("P. Kovács, F. Tran, P. Blaha, and G. K. H. Madsen,  J. Chem. Phys. 157, 094110 (2022)", "10.1063/5.0098787", "@article{Kovacs2022_094110,\n  author = {Kov\\'{a}cs, P\\'{e}ter and Tran, Fabien and Blaha, Peter and Madsen, Georg K. H.},\n  title = {{What is the optimal mGGA exchange functional for solids?}},\n  journal = {J. Chem. Phys.},\n  volume = {157},\n  number = {9},\n  year = {2022},\n  pages = {094110},\n  month = {09},\n  issn = {0021-9606},\n  doi = {10.1063/5.0098787},\n  url = {https://doi.org/10.1063/5.0098787}\n}\n", "Kovacs2022_094110"),
        ]),
    :mgga_x_ktbm_11 => IdentifierText(
        "KTBM learned exchange - 11",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("P. Kovács, F. Tran, P. Blaha, and G. K. H. Madsen,  J. Chem. Phys. 157, 094110 (2022)", "10.1063/5.0098787", "@article{Kovacs2022_094110,\n  author = {Kov\\'{a}cs, P\\'{e}ter and Tran, Fabien and Blaha, Peter and Madsen, Georg K. H.},\n  title = {{What is the optimal mGGA exchange functional for solids?}},\n  journal = {J. Chem. Phys.},\n  volume = {157},\n  number = {9},\n  year = {2022},\n  pages = {094110},\n  month = {09},\n  issn = {0021-9606},\n  doi = {10.1063/5.0098787},\n  url = {https://doi.org/10.1063/5.0098787}\n}\n", "Kovacs2022_094110"),
        ]),
    :mgga_x_ktbm_12 => IdentifierText(
        "KTBM learned exchange - 12",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("P. Kovács, F. Tran, P. Blaha, and G. K. H. Madsen,  J. Chem. Phys. 157, 094110 (2022)", "10.1063/5.0098787", "@article{Kovacs2022_094110,\n  author = {Kov\\'{a}cs, P\\'{e}ter and Tran, Fabien and Blaha, Peter and Madsen, Georg K. H.},\n  title = {{What is the optimal mGGA exchange functional for solids?}},\n  journal = {J. Chem. Phys.},\n  volume = {157},\n  number = {9},\n  year = {2022},\n  pages = {094110},\n  month = {09},\n  issn = {0021-9606},\n  doi = {10.1063/5.0098787},\n  url = {https://doi.org/10.1063/5.0098787}\n}\n", "Kovacs2022_094110"),
        ]),
    :mgga_x_ktbm_13 => IdentifierText(
        "KTBM learned exchange - 13",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("P. Kovács, F. Tran, P. Blaha, and G. K. H. Madsen,  J. Chem. Phys. 157, 094110 (2022)", "10.1063/5.0098787", "@article{Kovacs2022_094110,\n  author = {Kov\\'{a}cs, P\\'{e}ter and Tran, Fabien and Blaha, Peter and Madsen, Georg K. H.},\n  title = {{What is the optimal mGGA exchange functional for solids?}},\n  journal = {J. Chem. Phys.},\n  volume = {157},\n  number = {9},\n  year = {2022},\n  pages = {094110},\n  month = {09},\n  issn = {0021-9606},\n  doi = {10.1063/5.0098787},\n  url = {https://doi.org/10.1063/5.0098787}\n}\n", "Kovacs2022_094110"),
        ]),
    :mgga_x_ktbm_14 => IdentifierText(
        "KTBM learned exchange - 14",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("P. Kovács, F. Tran, P. Blaha, and G. K. H. Madsen,  J. Chem. Phys. 157, 094110 (2022)", "10.1063/5.0098787", "@article{Kovacs2022_094110,\n  author = {Kov\\'{a}cs, P\\'{e}ter and Tran, Fabien and Blaha, Peter and Madsen, Georg K. H.},\n  title = {{What is the optimal mGGA exchange functional for solids?}},\n  journal = {J. Chem. Phys.},\n  volume = {157},\n  number = {9},\n  year = {2022},\n  pages = {094110},\n  month = {09},\n  issn = {0021-9606},\n  doi = {10.1063/5.0098787},\n  url = {https://doi.org/10.1063/5.0098787}\n}\n", "Kovacs2022_094110"),
        ]),
    :mgga_x_ktbm_15 => IdentifierText(
        "KTBM learned exchange - 15",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("P. Kovács, F. Tran, P. Blaha, and G. K. H. Madsen,  J. Chem. Phys. 157, 094110 (2022)", "10.1063/5.0098787", "@article{Kovacs2022_094110,\n  author = {Kov\\'{a}cs, P\\'{e}ter and Tran, Fabien and Blaha, Peter and Madsen, Georg K. H.},\n  title = {{What is the optimal mGGA exchange functional for solids?}},\n  journal = {J. Chem. Phys.},\n  volume = {157},\n  number = {9},\n  year = {2022},\n  pages = {094110},\n  month = {09},\n  issn = {0021-9606},\n  doi = {10.1063/5.0098787},\n  url = {https://doi.org/10.1063/5.0098787}\n}\n", "Kovacs2022_094110"),
        ]),
    :mgga_x_ktbm_16 => IdentifierText(
        "KTBM learned exchange - 16",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("P. Kovács, F. Tran, P. Blaha, and G. K. H. Madsen,  J. Chem. Phys. 157, 094110 (2022)", "10.1063/5.0098787", "@article{Kovacs2022_094110,\n  author = {Kov\\'{a}cs, P\\'{e}ter and Tran, Fabien and Blaha, Peter and Madsen, Georg K. H.},\n  title = {{What is the optimal mGGA exchange functional for solids?}},\n  journal = {J. Chem. Phys.},\n  volume = {157},\n  number = {9},\n  year = {2022},\n  pages = {094110},\n  month = {09},\n  issn = {0021-9606},\n  doi = {10.1063/5.0098787},\n  url = {https://doi.org/10.1063/5.0098787}\n}\n", "Kovacs2022_094110"),
        ]),
    :mgga_x_ktbm_17 => IdentifierText(
        "KTBM learned exchange - 17",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("P. Kovács, F. Tran, P. Blaha, and G. K. H. Madsen,  J. Chem. Phys. 157, 094110 (2022)", "10.1063/5.0098787", "@article{Kovacs2022_094110,\n  author = {Kov\\'{a}cs, P\\'{e}ter and Tran, Fabien and Blaha, Peter and Madsen, Georg K. H.},\n  title = {{What is the optimal mGGA exchange functional for solids?}},\n  journal = {J. Chem. Phys.},\n  volume = {157},\n  number = {9},\n  year = {2022},\n  pages = {094110},\n  month = {09},\n  issn = {0021-9606},\n  doi = {10.1063/5.0098787},\n  url = {https://doi.org/10.1063/5.0098787}\n}\n", "Kovacs2022_094110"),
        ]),
    :mgga_x_ktbm_18 => IdentifierText(
        "KTBM learned exchange - 18",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("P. Kovács, F. Tran, P. Blaha, and G. K. H. Madsen,  J. Chem. Phys. 157, 094110 (2022)", "10.1063/5.0098787", "@article{Kovacs2022_094110,\n  author = {Kov\\'{a}cs, P\\'{e}ter and Tran, Fabien and Blaha, Peter and Madsen, Georg K. H.},\n  title = {{What is the optimal mGGA exchange functional for solids?}},\n  journal = {J. Chem. Phys.},\n  volume = {157},\n  number = {9},\n  year = {2022},\n  pages = {094110},\n  month = {09},\n  issn = {0021-9606},\n  doi = {10.1063/5.0098787},\n  url = {https://doi.org/10.1063/5.0098787}\n}\n", "Kovacs2022_094110"),
        ]),
    :mgga_x_ktbm_19 => IdentifierText(
        "KTBM learned exchange - 19",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("P. Kovács, F. Tran, P. Blaha, and G. K. H. Madsen,  J. Chem. Phys. 157, 094110 (2022)", "10.1063/5.0098787", "@article{Kovacs2022_094110,\n  author = {Kov\\'{a}cs, P\\'{e}ter and Tran, Fabien and Blaha, Peter and Madsen, Georg K. H.},\n  title = {{What is the optimal mGGA exchange functional for solids?}},\n  journal = {J. Chem. Phys.},\n  volume = {157},\n  number = {9},\n  year = {2022},\n  pages = {094110},\n  month = {09},\n  issn = {0021-9606},\n  doi = {10.1063/5.0098787},\n  url = {https://doi.org/10.1063/5.0098787}\n}\n", "Kovacs2022_094110"),
        ]),
    :mgga_x_ktbm_20 => IdentifierText(
        "KTBM learned exchange - 20",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("P. Kovács, F. Tran, P. Blaha, and G. K. H. Madsen,  J. Chem. Phys. 157, 094110 (2022)", "10.1063/5.0098787", "@article{Kovacs2022_094110,\n  author = {Kov\\'{a}cs, P\\'{e}ter and Tran, Fabien and Blaha, Peter and Madsen, Georg K. H.},\n  title = {{What is the optimal mGGA exchange functional for solids?}},\n  journal = {J. Chem. Phys.},\n  volume = {157},\n  number = {9},\n  year = {2022},\n  pages = {094110},\n  month = {09},\n  issn = {0021-9606},\n  doi = {10.1063/5.0098787},\n  url = {https://doi.org/10.1063/5.0098787}\n}\n", "Kovacs2022_094110"),
        ]),
    :mgga_x_ktbm_21 => IdentifierText(
        "KTBM learned exchange - 21",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("P. Kovács, F. Tran, P. Blaha, and G. K. H. Madsen,  J. Chem. Phys. 157, 094110 (2022)", "10.1063/5.0098787", "@article{Kovacs2022_094110,\n  author = {Kov\\'{a}cs, P\\'{e}ter and Tran, Fabien and Blaha, Peter and Madsen, Georg K. H.},\n  title = {{What is the optimal mGGA exchange functional for solids?}},\n  journal = {J. Chem. Phys.},\n  volume = {157},\n  number = {9},\n  year = {2022},\n  pages = {094110},\n  month = {09},\n  issn = {0021-9606},\n  doi = {10.1063/5.0098787},\n  url = {https://doi.org/10.1063/5.0098787}\n}\n", "Kovacs2022_094110"),
        ]),
    :mgga_x_ktbm_22 => IdentifierText(
        "KTBM learned exchange - 22",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("P. Kovács, F. Tran, P. Blaha, and G. K. H. Madsen,  J. Chem. Phys. 157, 094110 (2022)", "10.1063/5.0098787", "@article{Kovacs2022_094110,\n  author = {Kov\\'{a}cs, P\\'{e}ter and Tran, Fabien and Blaha, Peter and Madsen, Georg K. H.},\n  title = {{What is the optimal mGGA exchange functional for solids?}},\n  journal = {J. Chem. Phys.},\n  volume = {157},\n  number = {9},\n  year = {2022},\n  pages = {094110},\n  month = {09},\n  issn = {0021-9606},\n  doi = {10.1063/5.0098787},\n  url = {https://doi.org/10.1063/5.0098787}\n}\n", "Kovacs2022_094110"),
        ]),
    :mgga_x_ktbm_23 => IdentifierText(
        "KTBM learned exchange - 23",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("P. Kovács, F. Tran, P. Blaha, and G. K. H. Madsen,  J. Chem. Phys. 157, 094110 (2022)", "10.1063/5.0098787", "@article{Kovacs2022_094110,\n  author = {Kov\\'{a}cs, P\\'{e}ter and Tran, Fabien and Blaha, Peter and Madsen, Georg K. H.},\n  title = {{What is the optimal mGGA exchange functional for solids?}},\n  journal = {J. Chem. Phys.},\n  volume = {157},\n  number = {9},\n  year = {2022},\n  pages = {094110},\n  month = {09},\n  issn = {0021-9606},\n  doi = {10.1063/5.0098787},\n  url = {https://doi.org/10.1063/5.0098787}\n}\n", "Kovacs2022_094110"),
        ]),
    :mgga_x_ktbm_24 => IdentifierText(
        "KTBM learned exchange - 24",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("P. Kovács, F. Tran, P. Blaha, and G. K. H. Madsen,  J. Chem. Phys. 157, 094110 (2022)", "10.1063/5.0098787", "@article{Kovacs2022_094110,\n  author = {Kov\\'{a}cs, P\\'{e}ter and Tran, Fabien and Blaha, Peter and Madsen, Georg K. H.},\n  title = {{What is the optimal mGGA exchange functional for solids?}},\n  journal = {J. Chem. Phys.},\n  volume = {157},\n  number = {9},\n  year = {2022},\n  pages = {094110},\n  month = {09},\n  issn = {0021-9606},\n  doi = {10.1063/5.0098787},\n  url = {https://doi.org/10.1063/5.0098787}\n}\n", "Kovacs2022_094110"),
        ]),
    :mgga_x_ktbm_gap => IdentifierText(
        "KTBM learned exchange - GAP",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("P. Kovács, F. Tran, P. Blaha, and G. K. H. Madsen,  J. Chem. Phys. 157, 094110 (2022)", "10.1063/5.0098787", "@article{Kovacs2022_094110,\n  author = {Kov\\'{a}cs, P\\'{e}ter and Tran, Fabien and Blaha, Peter and Madsen, Georg K. H.},\n  title = {{What is the optimal mGGA exchange functional for solids?}},\n  journal = {J. Chem. Phys.},\n  volume = {157},\n  number = {9},\n  year = {2022},\n  pages = {094110},\n  month = {09},\n  issn = {0021-9606},\n  doi = {10.1063/5.0098787},\n  url = {https://doi.org/10.1063/5.0098787}\n}\n", "Kovacs2022_094110"),
        ]),
    :mgga_x_lak => IdentifierText(
        "Lebeda-Aschebrock-Kummel meta-GGA exchange",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("T. Lebeda, T. Aschebrock, and S. Kümmel,  Phys. Rev. Lett. 133, 136402 (2024)", "10.1103/PhysRevLett.133.136402", "@article{Lebeda2024_136402,\n  author = {Lebeda, Timo and Aschebrock, Thilo and K\\\"ummel, Stephan},\n  title = {Balancing the Contributions to the Gradient Expansion: Accurate Binding and Band Gaps with a Nonempirical Meta-GGA},\n  journal = {Phys. Rev. Lett.},\n  volume = {133},\n  issue = {13},\n  pages = {136402},\n  year = {2024},\n  month = {Sep},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevLett.133.136402},\n  url = {https://link.aps.org/doi/10.1103/PhysRevLett.133.136402}\n}\n", "Lebeda2024_136402"),
        ]),
    :mgga_x_lta => IdentifierText(
        "Local tau approximation",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("M. Ernzerhof and G. E. Scuseria,  J. Chem. Phys. 111, 911 (1999)", "10.1063/1.479374", "@article{Ernzerhof1999_911,\n  author = {Ernzerhof, M. and Scuseria, G. E.},\n  title = {Kinetic energy density dependent approximations to the exchange energy},\n  journal = {J. Chem. Phys.},\n  year = {1999},\n  volume = {111},\n  number = {3},\n  pages = {911},\n  doi = {10.1063/1.479374},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/111/3/10.1063/1.479374}\n}\n", "Ernzerhof1999_911"),
        ]),
    :mgga_x_m06_l => IdentifierText(
        "Minnesota M06-L exchange functional",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("Y. Zhao and D. G. Truhlar,  J. Chem. Phys. 125, 194101 (2006)", "10.1063/1.2370993", "@article{Zhao2006_194101,\n  author = {Zhao, Y. and Truhlar, D. G.},\n  title = {A new local density functional for main-group thermochemistry, transition metal bonding, thermochemical kinetics, and noncovalent interactions},\n  journal = {J. Chem. Phys.},\n  year = {2006},\n  volume = {125},\n  number = {19},\n  pages = {194101},\n  doi = {10.1063/1.2370993},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/125/19/10.1063/1.2370993}\n}\n", "Zhao2006_194101"),
        ]),
    :mgga_x_m11_l => IdentifierText(
        "Minnesota M11-L exchange functional",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("R. Peverati and D. G. Truhlar,  J. Phys. Chem. Lett. 3, 117 (2012)", "10.1021/jz201525m", "@article{Peverati2012_117,\n  author = {Peverati, R. and Truhlar, D. G.},\n  title = {{M11}-{L}: A Local Density Functional That Provides Improved Accuracy for Electronic Structure Calculations in Chemistry and Physics},\n  journal = {J. Phys. Chem. Lett.},\n  volume = {3},\n  number = {1},\n  pages = {117},\n  year = {2012},\n  doi = {10.1021/jz201525m},\n  url = {http://pubs.acs.org/doi/abs/10.1021/jz201525m}\n}\n", "Peverati2012_117"),
        ]),
    :mgga_x_mbeef => IdentifierText(
        "mBEEF exchange",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("J. Wellendorff, K. T. Lundgaard, K. W. Jacobsen, and T. Bligaard,  J. Chem. Phys. 140, 144107 (2014)", "10.1063/1.4870397", "@article{Wellendorff2014_144107,\n  author = {Wellendorff, Jess and Lundgaard, Keld T. and Jacobsen, Karsten W. and Bligaard, Thomas},\n  title = {{mBEEF}: An accurate semi-local {Bayesian} error estimation density functional},\n  journal = {J. Chem. Phys.},\n  year = {2014},\n  volume = {140},\n  number = {14},\n  pages = {144107},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/140/14/10.1063/1.4870397},\n  doi = {10.1063/1.4870397}\n}\n", "Wellendorff2014_144107"),
        ]),
    :mgga_x_mbeefvdw => IdentifierText(
        "mBEEF-vdW exchange",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("K. T. Lundgaard, J. Wellendorff, J. Voss, K. W. Jacobsen, and T. Bligaard,  Phys. Rev. B 93, 235162 (2016)", "10.1103/PhysRevB.93.235162", "@article{Lundgaard2016_235162,\n  author = {Lundgaard, Keld T. and Wellendorff, Jess and Voss, Johannes and Jacobsen, Karsten W. and Bligaard, Thomas},\n  title = {{mBEEF}-{vdW}: Robust fitting of error estimation density functionals},\n  journal = {Phys. Rev. B},\n  volume = {93},\n  issue = {23},\n  pages = {235162},\n  year = {2016},\n  month = {Jun},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevB.93.235162},\n  url = {http://link.aps.org/doi/10.1103/PhysRevB.93.235162}\n}\n", "Lundgaard2016_235162"),
        ]),
    :mgga_x_mbr => IdentifierText(
        "modified Becke-Roussel by Patra et al",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("A. Patra, S. Jana, H. Myneni, and P. Samal,  Phys. Chem. Chem. Phys. 21, 19639–19650 (2019)", "10.1039/C9CP03356D", "@article{Patra2019_19639,\n  author = {Patra, Abhilash and Jana, Subrata and Myneni, Hemanadhan and Samal, Prasanjit},\n  title = {{Laplacian} free and asymptotic corrected semilocal exchange potential applied to the band gap of solids},\n  journal = {Phys. Chem. Chem. Phys.},\n  year = {2019},\n  volume = {21},\n  issue = {35},\n  pages = {19639--19650},\n  publisher = {The Royal Society of Chemistry},\n  doi = {10.1039/C9CP03356D},\n  url = {https://doi.org/10.1039/C9CP03356D}\n}\n", "Patra2019_19639"),
        ]),
    :mgga_x_mbrxc_bg => IdentifierText(
        "Modified Becke-Roussel for band gaps - cuspless hole",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :development, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("B. Patra, S. Jana, L. A. Constantin, and P. Samal,  Phys. Rev. B 100, 045147 (2019)", "10.1103/PhysRevB.100.045147", "@article{Patra2019_045147,\n  author = {Patra, Bikash and Jana, Subrata and Constantin, Lucian A. and Samal, Prasanjit},\n  title = {Efficient band gap prediction of semiconductors and insulators from a semilocal exchange-correlation functional},\n  journal = {Phys. Rev. B},\n  volume = {100},\n  issue = {4},\n  pages = {045147},\n  year = {2019},\n  month = {Jul},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevB.100.045147},\n  url = {https://link.aps.org/doi/10.1103/PhysRevB.100.045147}\n}\n", "Patra2019_045147"),
        ]),
    :mgga_x_mbrxh_bg => IdentifierText(
        "Modified Becke-Roussel for band gaps - hydrogen hole",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :development, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("B. Patra, S. Jana, L. A. Constantin, and P. Samal,  Phys. Rev. B 100, 045147 (2019)", "10.1103/PhysRevB.100.045147", "@article{Patra2019_045147,\n  author = {Patra, Bikash and Jana, Subrata and Constantin, Lucian A. and Samal, Prasanjit},\n  title = {Efficient band gap prediction of semiconductors and insulators from a semilocal exchange-correlation functional},\n  journal = {Phys. Rev. B},\n  volume = {100},\n  issue = {4},\n  pages = {045147},\n  year = {2019},\n  month = {Jul},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevB.100.045147},\n  url = {https://link.aps.org/doi/10.1103/PhysRevB.100.045147}\n}\n", "Patra2019_045147"),
        ]),
    :mgga_x_mcml => IdentifierText(
        "MCML exchange",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("K. Brown, Y. Maimaiti, K. Trepte, T. Bligaard, and J. Voss,  J. Comput. Chem. 42, 2004–2013 (2021)", "10.1002/jcc.26732", "@article{Brown2021_2004,\n  author = {Brown, Kristopher and Maimaiti, Yasheng and Trepte, Kai and Bligaard, Thomas and Voss, Johannes},\n  title = {{MCML}: Combining physical constraints with experimental data for a multi-purpose meta-generalized gradient approximation},\n  journal = {J. Comput. Chem.},\n  volume = {42},\n  number = {28},\n  pages = {2004--2013},\n  year = {2021},\n  doi = {10.1002/jcc.26732},\n  url = {https://onlinelibrary.wiley.com/doi/abs/10.1002/jcc.26732}\n}\n", "Brown2021_2004"),
        ]),
    :mgga_x_mggac => IdentifierText(
        "MGGAC exchange of Patra et al",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("B. Patra, S. Jana, L. A. Constantin, and P. Samal,  Phys. Rev. B 100, 155140 (2019)", "10.1103/PhysRevB.100.155140", "@article{Patra2019_155140,\n  author = {Patra, Bikash and Jana, Subrata and Constantin, Lucian A. and Samal, Prasanjit},\n  title = {Relevance of the {Pauli} kinetic energy density for semilocal functionals},\n  journal = {Phys. Rev. B},\n  volume = {100},\n  issue = {15},\n  pages = {155140},\n  year = {2019},\n  month = {Oct},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevB.100.155140},\n  url = {https://link.aps.org/doi/10.1103/PhysRevB.100.155140}\n}\n", "Patra2019_155140"),
        ]),
    :mgga_x_mk00b => IdentifierText(
        "Exchange for accurate virtual orbital energies (v. B)",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :development, :needs_laplacian, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("F. R. Manby and P. J. Knowles,  J. Chem. Phys. 112, 7002 (2000)", "10.1063/1.481298", "@article{Manby2000_7002,\n  author = {Manby, F. R. and Knowles, P. J.},\n  title = {An exchange functional for accurate virtual orbital energies},\n  journal = {J. Chem. Phys.},\n  year = {2000},\n  volume = {112},\n  number = {16},\n  pages = {7002},\n  doi = {10.1063/1.481298},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/112/16/10.1063/1.481298}\n}\n", "Manby2000_7002"),
        ]),
    :mgga_x_mn12_l => IdentifierText(
        "Minnesota MN12-L exchange functional",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("R. Peverati and D. G. Truhlar,  Phys. Chem. Chem. Phys. 14, 13171 (2012)", "10.1039/C2CP42025B", "@article{Peverati2012_13171,\n  author = {Peverati, R. and Truhlar, D. G.},\n  title = {An improved and broadly accurate local approximation to the exchange-correlation density functional: The {MN12}-{L} functional for electronic structure calculations in chemistry and physics},\n  journal = {Phys. Chem. Chem. Phys.},\n  year = {2012},\n  volume = {14},\n  issue = {38},\n  pages = {13171},\n  publisher = {The Royal Society of Chemistry},\n  doi = {10.1039/C2CP42025B},\n  url = {http://pubs.rsc.org/en/Content/ArticleLanding/2012/CP/c2cp42025b}\n}\n", "Peverati2012_13171"),
        ]),
    :mgga_x_mn15_l => IdentifierText(
        "Minnesota MN15-L exchange functional",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("H. S. Yu, X. He, and D. G. Truhlar,  J. Chem. Theory Comput. 12, 1280–1293 (2016)", "10.1021/acs.jctc.5b01082", "@article{Yu2016_1280,\n  author = {Yu, Haoyu S. and He, Xiao and Truhlar, Donald G.},\n  title = {{MN15}-{L}: A New Local Exchange-Correlation Functional for {Kohn}--{Sham} Density Functional Theory with Broad Accuracy for Atoms, Molecules, and Solids},\n  journal = {J. Chem. Theory Comput.},\n  volume = {12},\n  number = {3},\n  pages = {1280--1293},\n  year = {2016},\n  doi = {10.1021/acs.jctc.5b01082},\n  url = {https://doi.org/10.1021/acs.jctc.5b01082}\n}\n", "Yu2016_1280"),
        ]),
    :mgga_x_modtpss => IdentifierText(
        "Modified Tao, Perdew, Staroverov & Scuseria",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("J. P. Perdew, A. Ruzsinszky, J. Tao, G. I. Csonka, and G. E. Scuseria,  Phys. Rev. A 76, 042506 (2007)", "10.1103/PhysRevA.76.042506", "@article{Perdew2007_042506,\n  author = {Perdew, J. P. and Ruzsinszky, A. and Tao, J. and Csonka, G. I. and Scuseria, G. E.},\n  title = {One-parameter optimization of a nonempirical meta-generalized-gradient-approximation for the exchange-correlation energy},\n  journal = {Phys. Rev. A},\n  volume = {76},\n  issue = {4},\n  pages = {042506},\n  year = {2007},\n  month = {Oct},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevA.76.042506},\n  url = {http://link.aps.org/doi/10.1103/PhysRevA.76.042506}\n}\n", "Perdew2007_042506"),
        ]),
    :mgga_x_ms0 => IdentifierText(
        "MS exchange of Sun, Xiao, and Ruzsinszky",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("J. Sun, B. Xiao, and A. Ruzsinszky,  J. Chem. Phys. 137, 051101 (2012)", "10.1063/1.4742312", "@article{Sun2012_051101,\n  author = {Sun, J. and Xiao, B. and Ruzsinszky, A.},\n  title = {Communication: Effect of the orbital-overlap dependence in the meta generalized gradient approximation},\n  journal = {J. Chem. Phys.},\n  year = {2012},\n  volume = {137},\n  number = {5},\n  pages = {051101},\n  doi = {10.1063/1.4742312},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/137/5/10.1063/1.4742312}\n}\n", "Sun2012_051101"),
        ]),
    :mgga_x_ms1 => IdentifierText(
        "MS1 exchange of Sun, et al",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("J. Sun, R. Haunschild, B. Xiao, I. W. Bulik, G. E. Scuseria, and J. P. Perdew,  J. Chem. Phys. 138, 044113 (2013)", "10.1063/1.4789414", "@article{Sun2013_044113,\n  author = {Sun, J. and Haunschild, R. and Xiao, B. and Bulik, I. W. and Scuseria, G. E. and Perdew, J. P.},\n  title = {Semilocal and hybrid meta-generalized gradient approximations based on the understanding of the kinetic-energy-density dependence},\n  journal = {J. Chem. Phys.},\n  year = {2013},\n  volume = {138},\n  number = {4},\n  pages = {044113},\n  doi = {10.1063/1.4789414},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/138/4/10.1063/1.4789414}\n}\n", "Sun2013_044113"),
        ]),
    :mgga_x_ms2 => IdentifierText(
        "MS2 exchange of Sun, et al",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("J. Sun, R. Haunschild, B. Xiao, I. W. Bulik, G. E. Scuseria, and J. P. Perdew,  J. Chem. Phys. 138, 044113 (2013)", "10.1063/1.4789414", "@article{Sun2013_044113,\n  author = {Sun, J. and Haunschild, R. and Xiao, B. and Bulik, I. W. and Scuseria, G. E. and Perdew, J. P.},\n  title = {Semilocal and hybrid meta-generalized gradient approximations based on the understanding of the kinetic-energy-density dependence},\n  journal = {J. Chem. Phys.},\n  year = {2013},\n  volume = {138},\n  number = {4},\n  pages = {044113},\n  doi = {10.1063/1.4789414},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/138/4/10.1063/1.4789414}\n}\n", "Sun2013_044113"),
        ]),
    :mgga_x_ms2_rev => IdentifierText(
        "MS2 exchange of Sun, et al with revised value for c",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("J. Sun, R. Haunschild, B. Xiao, I. W. Bulik, G. E. Scuseria, and J. P. Perdew,  J. Chem. Phys. 138, 044113 (2013)", "10.1063/1.4789414", "@article{Sun2013_044113,\n  author = {Sun, J. and Haunschild, R. and Xiao, B. and Bulik, I. W. and Scuseria, G. E. and Perdew, J. P.},\n  title = {Semilocal and hybrid meta-generalized gradient approximations based on the understanding of the kinetic-energy-density dependence},\n  journal = {J. Chem. Phys.},\n  year = {2013},\n  volume = {138},\n  number = {4},\n  pages = {044113},\n  doi = {10.1063/1.4789414},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/138/4/10.1063/1.4789414}\n}\n", "Sun2013_044113"),
            LibxcReference("J. W. Furness and J. Sun,  Phys. Rev. B 99, 041119 (2019)", "10.1103/PhysRevB.99.041119", "@article{Furness2019_041119,\n  author = {Furness, James W. and Sun, Jianwei},\n  title = {Enhancing the efficiency of density functionals with an improved iso-orbital indicator},\n  journal = {Phys. Rev. B},\n  volume = {99},\n  issue = {4},\n  pages = {041119},\n  year = {2019},\n  month = {Jan},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevB.99.041119},\n  url = {https://link.aps.org/doi/10.1103/PhysRevB.99.041119}\n}\n", "Furness2019_041119"),
        ]),
    :mgga_x_ms2b => IdentifierText(
        "MS2beta exchange of Furness and Sun",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("J. W. Furness and J. Sun,  Phys. Rev. B 99, 041119 (2019)", "10.1103/PhysRevB.99.041119", "@article{Furness2019_041119,\n  author = {Furness, James W. and Sun, Jianwei},\n  title = {Enhancing the efficiency of density functionals with an improved iso-orbital indicator},\n  journal = {Phys. Rev. B},\n  volume = {99},\n  issue = {4},\n  pages = {041119},\n  year = {2019},\n  month = {Jan},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevB.99.041119},\n  url = {https://link.aps.org/doi/10.1103/PhysRevB.99.041119}\n}\n", "Furness2019_041119"),
        ]),
    :mgga_x_msb86bl => IdentifierText(
        "MS-B86bl, a B86b-like meta-GGA exchange",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("E. W. F. Smeets, J. Voss, and G.-J. Kroes,  J. Phys. Chem. A 123, 5395–5406 (2019)", "10.1021/acs.jpca.9b02914", "@article{Smeets2019_5395,\n  author = {Smeets, Egidius W. F. and Voss, Johannes and Kroes, Geert-Jan},\n  title = {Specific Reaction Parameter Density Functional Based on the Meta-Generalized Gradient Approximation: Application to {H}\$\\_2\$ + {Cu}(111) and {H}\$\\_2\$ + {Ag}(111)},\n  journal = {J. Phys. Chem. A},\n  volume = {123},\n  number = {25},\n  pages = {5395--5406},\n  year = {2019},\n  doi = {10.1021/acs.jpca.9b02914},\n  url = {https://doi.org/10.1021/acs.jpca.9b02914}\n}\n", "Smeets2019_5395"),
        ]),
    :mgga_x_mscan => IdentifierText(
        "Modified SCAN (mSCAN) exchange of Desmarais, Erba, Vignale, and Pittalis",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3),
        LibxcReference[
            LibxcReference("J. K. Desmarais, A. Erba, G. Vignale, and S. Pittalis,  Phys. Rev. Lett. 134, 106402 (2025)", "10.1103/PhysRevLett.134.106402", "@article{Desmarais2025_106402,\n  author = {Desmarais, Jacques K. and Erba, Alessandro and Vignale, Giovanni and Pittalis, Stefano},\n  title = {Meta-Generalized Gradient Approximation Made Magnetic},\n  journal = {Phys. Rev. Lett.},\n  volume = {134},\n  issue = {10},\n  pages = {106402},\n  year = {2025},\n  month = {Mar},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevLett.134.106402},\n  url = {https://link.aps.org/doi/10.1103/PhysRevLett.134.106402}\n}\n", "Desmarais2025_106402"),
        ]),
    :mgga_x_mspbel => IdentifierText(
        "MS-PBEl, a PBE-like meta-GGA exchange",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("E. W. F. Smeets, J. Voss, and G.-J. Kroes,  J. Phys. Chem. A 123, 5395–5406 (2019)", "10.1021/acs.jpca.9b02914", "@article{Smeets2019_5395,\n  author = {Smeets, Egidius W. F. and Voss, Johannes and Kroes, Geert-Jan},\n  title = {Specific Reaction Parameter Density Functional Based on the Meta-Generalized Gradient Approximation: Application to {H}\$\\_2\$ + {Cu}(111) and {H}\$\\_2\$ + {Ag}(111)},\n  journal = {J. Phys. Chem. A},\n  volume = {123},\n  number = {25},\n  pages = {5395--5406},\n  year = {2019},\n  doi = {10.1021/acs.jpca.9b02914},\n  url = {https://doi.org/10.1021/acs.jpca.9b02914}\n}\n", "Smeets2019_5395"),
        ]),
    :mgga_x_msrpbel => IdentifierText(
        "MS-RPBEl, a RPBE-like meta-GGA exchange",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("E. W. F. Smeets, J. Voss, and G.-J. Kroes,  J. Phys. Chem. A 123, 5395–5406 (2019)", "10.1021/acs.jpca.9b02914", "@article{Smeets2019_5395,\n  author = {Smeets, Egidius W. F. and Voss, Johannes and Kroes, Geert-Jan},\n  title = {Specific Reaction Parameter Density Functional Based on the Meta-Generalized Gradient Approximation: Application to {H}\$\\_2\$ + {Cu}(111) and {H}\$\\_2\$ + {Ag}(111)},\n  journal = {J. Phys. Chem. A},\n  volume = {123},\n  number = {25},\n  pages = {5395--5406},\n  year = {2019},\n  doi = {10.1021/acs.jpca.9b02914},\n  url = {https://doi.org/10.1021/acs.jpca.9b02914}\n}\n", "Smeets2019_5395"),
        ]),
    :mgga_x_mtask => IdentifierText(
        "modified TASK exchange",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("B. Neupane, H. Tang, N. K. Nepal, S. Adhikari, and A. Ruzsinszky,  Phys. Rev. Mater. 5, 063803 (2021)", "10.1103/PhysRevMaterials.5.063803", "@article{Neupane2021_063803,\n  author = {Neupane, Bimal and Tang, Hong and Nepal, Niraj K. and Adhikari, Santosh and Ruzsinszky, Adrienn},\n  title = {Opening band gaps of low-dimensional materials at the meta-{GGA} level of density functional approximations},\n  journal = {Phys. Rev. Mater.},\n  volume = {5},\n  issue = {6},\n  pages = {063803},\n  year = {2021},\n  month = {Jun},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevMaterials.5.063803},\n  url = {https://link.aps.org/doi/10.1103/PhysRevMaterials.5.063803}\n}\n", "Neupane2021_063803"),
        ]),
    :mgga_x_mvs => IdentifierText(
        "MVS exchange of Sun, Perdew, and Ruzsinszky",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("J. Sun, J. P. Perdew, and A. Ruzsinszky,  Proc. Natl. Acad. Sci. U. S. A. 112, 685–689 (2015)", "10.1073/pnas.1423145112", "@article{Sun2015_685,\n  author = {Sun, Jianwei and Perdew, John P. and Ruzsinszky, Adrienn},\n  title = {Semilocal density functional obeying a strongly tightened bound for exchange},\n  journal = {Proc. Natl. Acad. Sci. U. S. A.},\n  volume = {112},\n  number = {3},\n  pages = {685--689},\n  year = {2015},\n  doi = {10.1073/pnas.1423145112},\n  url = {http://www.pnas.org/content/112/3/685.abstract}\n}\n", "Sun2015_685"),
        ]),
    :mgga_x_pbe_gx => IdentifierText(
        "PBE-GX functional of Loos",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("P.-F. Loos,  J. Chem. Phys. 146, 114108 (2017)", "10.1063/1.4978409", "@article{Loos2017_114108,\n  author = {Loos, Pierre-Fran\\c{c}ois},\n  title = {Exchange functionals based on finite uniform electron gases},\n  journal = {J. Chem. Phys.},\n  volume = {146},\n  number = {11},\n  pages = {114108},\n  year = {2017},\n  doi = {10.1063/1.4978409},\n  url = {https://doi.org/10.1063/1.4978409}\n}\n", "Loos2017_114108"),
        ]),
    :mgga_x_pkzb => IdentifierText(
        "Perdew, Kurth, Zupan, and Blaha",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("J. P. Perdew, S. Kurth, A. Zupan, and P. Blaha,  Phys. Rev. Lett. 82, 2544 (1999)", "10.1103/PhysRevLett.82.2544", "@article{Perdew1999_2544,\n  author = {Perdew, J. P. and Kurth, S. and Zupan, A. and Blaha, P.},\n  title = {Accurate Density Functional with Correct Formal Properties: A Step Beyond the Generalized Gradient Approximation},\n  journal = {Phys. Rev. Lett.},\n  volume = {82},\n  issue = {12},\n  pages = {2544},\n  year = {1999},\n  month = {Mar},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevLett.82.2544},\n  url = {http://link.aps.org/doi/10.1103/PhysRevLett.82.2544}\n}\n", "Perdew1999_2544"),
        ]),
    :mgga_x_r2scan => IdentifierText(
        "Re-regularized SCAN exchange by Furness et al",
        (:have_exc, :have_vxc, :have_fxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2),
        LibxcReference[
            LibxcReference("J. W. Furness, A. D. Kaplan, J. Ning, J. P. Perdew, and J. Sun,  J. Phys. Chem. Lett. 11, 8208–8215 (2020)", "10.1021/acs.jpclett.0c02405", "@article{Furness2020_8208,\n  author = {Furness, James W. and Kaplan, Aaron D. and Ning, Jinliang and Perdew, John P. and Sun, Jianwei},\n  title = {Accurate and Numerically Efficient r\$^2\${SCAN} Meta-Generalized Gradient Approximation},\n  journal = {J. Phys. Chem. Lett.},\n  volume = {11},\n  number = {19},\n  pages = {8208--8215},\n  year = {2020},\n  doi = {10.1021/acs.jpclett.0c02405},\n  url = {https://doi.org/10.1021/acs.jpclett.0c02405}\n}\n", "Furness2020_8208"),
            LibxcReference("J. W. Furness, A. D. Kaplan, J. Ning, J. P. Perdew, and J. Sun,  J. Phys. Chem. Lett. 11, 9248–9248 (2020)", "10.1021/acs.jpclett.0c03077", "@article{Furness2020_9248,\n  author = {Furness, James W. and Kaplan, Aaron D. and Ning, Jinliang and Perdew, John P. and Sun, Jianwei},\n  title = {Correction to \"{Accurate} and Numerically Efficient r\$^2\${SCAN} Meta-Generalized Gradient Approximation\"},\n  journal = {J. Phys. Chem. Lett.},\n  volume = {11},\n  number = {21},\n  pages = {9248--9248},\n  year = {2020},\n  doi = {10.1021/acs.jpclett.0c03077},\n  url = {https://doi.org/10.1021/acs.jpclett.0c03077}\n}\n", "Furness2020_9248"),
        ]),
    :mgga_x_r2scan01 => IdentifierText(
        "Re-regularized SCAN exchange by Furness et al with larger value for eta",
        (:have_exc, :have_vxc, :have_fxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2),
        LibxcReference[
            LibxcReference("N. A. W. Holzwarth, M. Torrent, J.-B. Charraud, and M. Côté,  Phys. Rev. B 105, 125144 (2022)", "10.1103/PhysRevB.105.125144", "@article{Holzwarth2022_125114,\n  author = {Holzwarth, N. A. W. and Torrent, Marc and Charraud, Jean-Baptiste and C\\^ot\\'e, Michel},\n  title = {Cubic spline solver for generalized density functional treatments of atoms and generation of atomic datasets for use with exchange-correlation functionals including meta-{GGA}},\n  journal = {Phys. Rev. B},\n  volume = {105},\n  issue = {12},\n  pages = {125144},\n  year = {2022},\n  month = {Mar},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevB.105.125144},\n  url = {https://link.aps.org/doi/10.1103/PhysRevB.105.125144}\n}\n", "Holzwarth2022_125114"),
            LibxcReference("J. W. Furness, A. D. Kaplan, J. Ning, J. P. Perdew, and J. Sun,  J. Phys. Chem. Lett. 11, 8208–8215 (2020)", "10.1021/acs.jpclett.0c02405", "@article{Furness2020_8208,\n  author = {Furness, James W. and Kaplan, Aaron D. and Ning, Jinliang and Perdew, John P. and Sun, Jianwei},\n  title = {Accurate and Numerically Efficient r\$^2\${SCAN} Meta-Generalized Gradient Approximation},\n  journal = {J. Phys. Chem. Lett.},\n  volume = {11},\n  number = {19},\n  pages = {8208--8215},\n  year = {2020},\n  doi = {10.1021/acs.jpclett.0c02405},\n  url = {https://doi.org/10.1021/acs.jpclett.0c02405}\n}\n", "Furness2020_8208"),
            LibxcReference("J. W. Furness, A. D. Kaplan, J. Ning, J. P. Perdew, and J. Sun,  J. Phys. Chem. Lett. 11, 9248–9248 (2020)", "10.1021/acs.jpclett.0c03077", "@article{Furness2020_9248,\n  author = {Furness, James W. and Kaplan, Aaron D. and Ning, Jinliang and Perdew, John P. and Sun, Jianwei},\n  title = {Correction to \"{Accurate} and Numerically Efficient r\$^2\${SCAN} Meta-Generalized Gradient Approximation\"},\n  journal = {J. Phys. Chem. Lett.},\n  volume = {11},\n  number = {21},\n  pages = {9248--9248},\n  year = {2020},\n  doi = {10.1021/acs.jpclett.0c03077},\n  url = {https://doi.org/10.1021/acs.jpclett.0c03077}\n}\n", "Furness2020_9248"),
        ]),
    :mgga_x_r2scanl => IdentifierText(
        "Deorbitalized re-regularized SCAN (r2SCAN-L) exchange",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_laplacian, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("D. Mejía-Rodríguez and S. B. Trickey,  Phys. Rev. B 102, 121109 (2020)", "10.1103/PhysRevB.102.121109", "@article{Mejia2020_121109,\n  author = {Mej\\'{i}a-Rodr\\'{i}guez, Daniel and Trickey, S. B.},\n  title = {Meta-{GGA} performance in solids at almost {GGA} cost},\n  journal = {Phys. Rev. B},\n  volume = {102},\n  issue = {12},\n  pages = {121109},\n  year = {2020},\n  month = {Sep},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevB.102.121109},\n  url = {https://link.aps.org/doi/10.1103/PhysRevB.102.121109}\n}\n", "Mejia2020_121109"),
            LibxcReference("J. W. Furness, A. D. Kaplan, J. Ning, J. P. Perdew, and J. Sun,  J. Phys. Chem. Lett. 11, 8208–8215 (2020)", "10.1021/acs.jpclett.0c02405", "@article{Furness2020_8208,\n  author = {Furness, James W. and Kaplan, Aaron D. and Ning, Jinliang and Perdew, John P. and Sun, Jianwei},\n  title = {Accurate and Numerically Efficient r\$^2\${SCAN} Meta-Generalized Gradient Approximation},\n  journal = {J. Phys. Chem. Lett.},\n  volume = {11},\n  number = {19},\n  pages = {8208--8215},\n  year = {2020},\n  doi = {10.1021/acs.jpclett.0c02405},\n  url = {https://doi.org/10.1021/acs.jpclett.0c02405}\n}\n", "Furness2020_8208"),
            LibxcReference("J. W. Furness, A. D. Kaplan, J. Ning, J. P. Perdew, and J. Sun,  J. Phys. Chem. Lett. 11, 9248–9248 (2020)", "10.1021/acs.jpclett.0c03077", "@article{Furness2020_9248,\n  author = {Furness, James W. and Kaplan, Aaron D. and Ning, Jinliang and Perdew, John P. and Sun, Jianwei},\n  title = {Correction to \"{Accurate} and Numerically Efficient r\$^2\${SCAN} Meta-Generalized Gradient Approximation\"},\n  journal = {J. Phys. Chem. Lett.},\n  volume = {11},\n  number = {21},\n  pages = {9248--9248},\n  year = {2020},\n  doi = {10.1021/acs.jpclett.0c03077},\n  url = {https://doi.org/10.1021/acs.jpclett.0c03077}\n}\n", "Furness2020_9248"),
        ]),
    :mgga_x_r4scan => IdentifierText(
        "r\$^{4}\$SCAN, a functional that satisfies the same exact constraints that SCAN does",
        (:have_exc, :have_vxc, :have_fxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2),
        LibxcReference[
            LibxcReference("J. W. Furness, A. D. Kaplan, J. Ning, J. P. Perdew, and J. Sun,  J. Chem. Phys. 156, 034109 (2022)", "10.1063/5.0073623", "@article{Furness2022_034109,\n  author = {Furness, James W. and Kaplan, Aaron D. and Ning, Jinliang and Perdew, John P. and Sun, Jianwei},\n  title = {Construction of meta-{GGA} functionals through restoration of exact constraint adherence to regularized {SCAN} functionals},\n  journal = {J. Chem. Phys.},\n  volume = {156},\n  number = {3},\n  pages = {034109},\n  year = {2022},\n  doi = {10.1063/5.0073623},\n  url = {https://doi.org/10.1063/5.0073623}\n}\n", "Furness2022_034109"),
        ]),
    :mgga_x_regtm => IdentifierText(
        "Regularized Tao and Mo exchange",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("A. Patra, S. Jana, and P. Samal,  J. Chem. Phys. 153, 184112 (2020)", "10.1063/5.0025173", "@article{Patra2020_184112,\n  author = {Patra, Abhilash and Jana, Subrata and Samal, Prasanjit},\n  title = {A way of resolving the order-of-limit problem of {Tao}--{Mo} semilocal functional},\n  journal = {J. Chem. Phys.},\n  volume = {153},\n  number = {18},\n  pages = {184112},\n  year = {2020},\n  doi = {10.1063/5.0025173},\n  url = {https://doi.org/10.1063/5.0025173}\n}\n", "Patra2020_184112"),
        ]),
    :mgga_x_regtpss => IdentifierText(
        "Regularized TPSS",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("A. Ruzsinszky, J. Sun, B. Xiao, and G. I. Csonka,  J. Chem. Theory Comput. 8, 2078–2087 (2012)", "10.1021/ct300269u", "@article{Ruzsinszky2012_2078,\n  author = {Ruzsinszky, Adrienn and Sun, Jianwei and Xiao, Bing and Csonka, G\\'{a}bor I.},\n  title = {A meta-{GGA} Made Free of the Order of Limits Anomaly},\n  journal = {J. Chem. Theory Comput.},\n  volume = {8},\n  number = {6},\n  pages = {2078--2087},\n  year = {2012},\n  doi = {10.1021/ct300269u},\n  url = {https://doi.org/10.1021/ct300269u}\n}\n", "Ruzsinszky2012_2078"),
        ]),
    :mgga_x_revm06_l => IdentifierText(
        "Minnesota revM06-L exchange functional",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("Y. Wang, X. Jin, H. S. Yu, D. G. Truhlar, and X. He,  Proc. Natl. Acad. Sci. U. S. A. 114, 8487–8492 (2017)", "10.1073/pnas.1705670114", "@article{Wang2017_8487,\n  author = {Wang, Ying and Jin, Xinsheng and Yu, Haoyu S. and Truhlar, Donald G. and He, Xiao},\n  title = {Revised {M06}-{L} functional for improved accuracy on chemical reaction barrier heights, noncovalent interactions, and solid-state physics},\n  journal = {Proc. Natl. Acad. Sci. U. S. A.},\n  volume = {114},\n  number = {32},\n  pages = {8487--8492},\n  year = {2017},\n  doi = {10.1073/pnas.1705670114},\n  url = {http://www.pnas.org/content/114/32/8487.abstract}\n}\n", "Wang2017_8487"),
        ]),
    :mgga_x_revscan => IdentifierText(
        "revised SCAN",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("P. D. Mezei, G. I. Csonka, and M. Kállay,  J. Chem. Theory Comput. 14, 2469–2479 (2018)", "10.1021/acs.jctc.8b00072", "@article{Mezei2018_2469,\n  author = {Mezei, P\\'{a}l D. and Csonka, G\\'{a}bor I. and K\\'{a}llay, Mih\\'{a}ly},\n  title = {Simple Modifications of the {SCAN} Meta-Generalized Gradient Approximation Functional},\n  journal = {J. Chem. Theory Comput.},\n  volume = {14},\n  number = {5},\n  pages = {2469--2479},\n  year = {2018},\n  doi = {10.1021/acs.jctc.8b00072},\n  url = {https://doi.org/10.1021/acs.jctc.8b00072}\n}\n", "Mezei2018_2469"),
        ]),
    :mgga_x_revscanl => IdentifierText(
        "Deorbitalized revised SCAN (revSCAN-L) exchange",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_laplacian, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("D. Mejía-Rodríguez and S. B. Trickey,  Phys. Rev. A 96, 052512 (2017)", "10.1103/PhysRevA.96.052512", "@article{Mejia2017_052512,\n  author = {Mej\\'{i}a-Rodr\\'{i}guez, Daniel and Trickey, S. B.},\n  title = {Deorbitalization strategies for meta-generalized-gradient-approximation exchange-correlation functionals},\n  journal = {Phys. Rev. A},\n  volume = {96},\n  issue = {5},\n  pages = {052512},\n  year = {2017},\n  month = {Nov},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevA.96.052512},\n  url = {https://link.aps.org/doi/10.1103/PhysRevA.96.052512}\n}\n", "Mejia2017_052512"),
            LibxcReference("D. Mejía-Rodríguez and S. B. Trickey,  Phys. Rev. B 98, 115161 (2018)", "10.1103/PhysRevB.98.115161", "@article{Mejia2018_115161,\n  author = {Mej\\'{i}a-Rodr\\'{i}guez, Daniel and Trickey, S. B.},\n  title = {Deorbitalized meta-{GGA} exchange-correlation functionals in solids},\n  journal = {Phys. Rev. B},\n  volume = {98},\n  issue = {11},\n  pages = {115161},\n  year = {2018},\n  month = {Sep},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevB.98.115161},\n  url = {https://link.aps.org/doi/10.1103/PhysRevB.98.115161}\n}\n", "Mejia2018_115161"),
            LibxcReference("P. D. Mezei, G. I. Csonka, and M. Kállay,  J. Chem. Theory Comput. 14, 2469–2479 (2018)", "10.1021/acs.jctc.8b00072", "@article{Mezei2018_2469,\n  author = {Mezei, P\\'{a}l D. and Csonka, G\\'{a}bor I. and K\\'{a}llay, Mih\\'{a}ly},\n  title = {Simple Modifications of the {SCAN} Meta-Generalized Gradient Approximation Functional},\n  journal = {J. Chem. Theory Comput.},\n  volume = {14},\n  number = {5},\n  pages = {2469--2479},\n  year = {2018},\n  doi = {10.1021/acs.jctc.8b00072},\n  url = {https://doi.org/10.1021/acs.jctc.8b00072}\n}\n", "Mezei2018_2469"),
        ]),
    :mgga_x_revtm => IdentifierText(
        "revised Tao and Mo 2016 exchange",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("S. Jana, K. Sharma, and P. Samal,  J. Phys. Chem. A 123, 6356–6369 (2019)", "10.1021/acs.jpca.9b02921", "@article{Jana2019_6356,\n  author = {Jana, Subrata and Sharma, Kedar and Samal, Prasanjit},\n  title = {Improving the Performance of {Tao}--{Mo} Non-empirical Density Functional with Broader Applicability in Quantum Chemistry and Materials Science},\n  journal = {J. Phys. Chem. A},\n  volume = {123},\n  number = {29},\n  pages = {6356--6369},\n  year = {2019},\n  doi = {10.1021/acs.jpca.9b02921},\n  url = {https://doi.org/10.1021/acs.jpca.9b02921}\n}\n", "Jana2019_6356"),
        ]),
    :mgga_x_revtpss => IdentifierText(
        "revised Tao, Perdew, Staroverov & Scuseria",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("J. P. Perdew, A. Ruzsinszky, G. I. Csonka, L. A. Constantin, and J. Sun,  Phys. Rev. Lett. 103, 026403 (2009)", "10.1103/PhysRevLett.103.026403", "@article{Perdew2009_026403,\n  author = {Perdew, J. P. and Ruzsinszky, A. and Csonka, G. I. and Constantin, L. A. and Sun, J.},\n  title = {Workhorse Semilocal Density Functional for Condensed Matter Physics and Quantum Chemistry},\n  journal = {Phys. Rev. Lett.},\n  volume = {103},\n  issue = {2},\n  pages = {026403},\n  year = {2009},\n  month = {Jul},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevLett.103.026403},\n  url = {http://link.aps.org/doi/10.1103/PhysRevLett.103.026403}\n}\n", "Perdew2009_026403"),
            LibxcReference("J. P. Perdew, A. Ruzsinszky, G. I. Csonka, L. A. Constantin, and J. Sun,  Phys. Rev. Lett. 106, 179902 (2011)", "10.1103/PhysRevLett.106.179902", "@article{Perdew2011_179902,\n  author = {Perdew, J. P. and Ruzsinszky, A. and Csonka, G. I. and Constantin, L. A. and Sun, J.},\n  title = {Erratum: {Workhorse} Semilocal Density Functional for Condensed Matter Physics and Quantum Chemistry [{Phys.} {Rev.} {Lett.} 103, 026403 (2009)]},\n  journal = {Phys. Rev. Lett.},\n  volume = {106},\n  issue = {17},\n  pages = {179902},\n  year = {2011},\n  month = {Apr},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevLett.106.179902},\n  url = {http://link.aps.org/doi/10.1103/PhysRevLett.106.179902}\n}\n", "Perdew2011_179902"),
        ]),
    :mgga_x_rlda => IdentifierText(
        "Reparametrized local-density approximation",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :development, :needs_laplacian, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("X. Campi and A. Bouyssy,  Phys. Lett. B 73, 263–266 (1978)", "10.1016/0370-2693(78)90509-9", "@article{Campi1978_263,\n  author = {Campi, X. and Bouyssy, A.},\n  title = {A simple approximation for the nuclear density matrix},\n  journal = {Phys. Lett. B},\n  volume = {73},\n  number = {3},\n  pages = {263--266},\n  year = {1978},\n  issn = {0370-2693},\n  doi = {10.1016/0370-2693(78)90509-9},\n  url = {http://www.sciencedirect.com/science/article/pii/0370269378905099}\n}\n", "Campi1978_263"),
            LibxcReference("R. M. Koehl, G. K. Odom, and G. E. Scuseria,  Mol. Phys. 87, 835–843 (1996)", "10.1080/00268979600100561", "@article{Koehl1996_835,\n  author = {Koehl, Richard M. and Odom, Gregory K. and Scuseria, Gustavo E.},\n  title = {The use of density matrix expansions for calculating molecular exchange energies},\n  journal = {Mol. Phys.},\n  volume = {87},\n  number = {4},\n  pages = {835--843},\n  year = {1996},\n  publisher = {Taylor \\& Francis},\n  doi = {10.1080/00268979600100561},\n  url = {https://doi.org/10.1080/00268979600100561}\n}\n", "Koehl1996_835"),
        ]),
    :mgga_x_rmsb86bl => IdentifierText(
        "regularized MS-B86bl",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("Y. Cai, R. Michiels, F. De Luca, E. Neyts, X. Tu, A. Bogaerts, and N. Gerrits,  J. Phys. Chem. C 128, 8611–8620 (2024)", "10.1021/acs.jpcc.4c01110", "@article{Cai2024_8611,\n  author = {Cai, Yuxiang and Michiels, Roel and De Luca, Federica and Neyts, Erik and Tu, Xin and Bogaerts, Annemie and Gerrits, Nick},\n  title = {Improving Molecule-Metal Surface Reaction Networks Using the Meta-Generalized Gradient Approximation: {CO}\$\\_2\$ Hydrogenation},\n  journal = {J. Phys. Chem. C},\n  volume = {128},\n  number = {21},\n  pages = {8611--8620},\n  year = {2024},\n  doi = {10.1021/acs.jpcc.4c01110},\n  url = {https://doi.org/10.1021/acs.jpcc.4c01110}\n}\n", "Cai2024_8611"),
        ]),
    :mgga_x_rmspbel => IdentifierText(
        "regularized MS-PBEl",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("Y. Cai, R. Michiels, F. De Luca, E. Neyts, X. Tu, A. Bogaerts, and N. Gerrits,  J. Phys. Chem. C 128, 8611–8620 (2024)", "10.1021/acs.jpcc.4c01110", "@article{Cai2024_8611,\n  author = {Cai, Yuxiang and Michiels, Roel and De Luca, Federica and Neyts, Erik and Tu, Xin and Bogaerts, Annemie and Gerrits, Nick},\n  title = {Improving Molecule-Metal Surface Reaction Networks Using the Meta-Generalized Gradient Approximation: {CO}\$\\_2\$ Hydrogenation},\n  journal = {J. Phys. Chem. C},\n  volume = {128},\n  number = {21},\n  pages = {8611--8620},\n  year = {2024},\n  doi = {10.1021/acs.jpcc.4c01110},\n  url = {https://doi.org/10.1021/acs.jpcc.4c01110}\n}\n", "Cai2024_8611"),
        ]),
    :mgga_x_rmsrpbel => IdentifierText(
        "regularized MS-RPBEl",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("Y. Cai, R. Michiels, F. De Luca, E. Neyts, X. Tu, A. Bogaerts, and N. Gerrits,  J. Phys. Chem. C 128, 8611–8620 (2024)", "10.1021/acs.jpcc.4c01110", "@article{Cai2024_8611,\n  author = {Cai, Yuxiang and Michiels, Roel and De Luca, Federica and Neyts, Erik and Tu, Xin and Bogaerts, Annemie and Gerrits, Nick},\n  title = {Improving Molecule-Metal Surface Reaction Networks Using the Meta-Generalized Gradient Approximation: {CO}\$\\_2\$ Hydrogenation},\n  journal = {J. Phys. Chem. C},\n  volume = {128},\n  number = {21},\n  pages = {8611--8620},\n  year = {2024},\n  doi = {10.1021/acs.jpcc.4c01110},\n  url = {https://doi.org/10.1021/acs.jpcc.4c01110}\n}\n", "Cai2024_8611"),
        ]),
    :mgga_x_rpp09 => IdentifierText(
        "Rasanen, Pittalis & Proetto 09",
        (:have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_laplacian, :needs_tau, :enforce_fhc, :on_host),
        (1, 2, 3, 4),
        LibxcReference[
            LibxcReference("E. Räsänen, S. Pittalis, and C. R. Proetto,  J. Chem. Phys. 132, 044112 (2010)", "10.1063/1.3300063", "@article{Rasanen2010_044112,\n  author = {R\\\"{a}s\\\"{a}nen, E. and Pittalis, S. and Proetto, C. R.},\n  title = {Universal correction for the {Becke}--{Johnson} exchange potential},\n  journal = {J. Chem. Phys.},\n  year = {2010},\n  volume = {132},\n  number = {4},\n  pages = {044112},\n  doi = {10.1063/1.3300063},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/132/4/10.1063/1.3300063}\n}\n", "Rasanen2010_044112"),
        ]),
    :mgga_x_rppscan => IdentifierText(
        "r++SCAN: rSCAN with uniform density limit and coordinate scaling behavior",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("J. W. Furness, A. D. Kaplan, J. Ning, J. P. Perdew, and J. Sun,  J. Chem. Phys. 156, 034109 (2022)", "10.1063/5.0073623", "@article{Furness2022_034109,\n  author = {Furness, James W. and Kaplan, Aaron D. and Ning, Jinliang and Perdew, John P. and Sun, Jianwei},\n  title = {Construction of meta-{GGA} functionals through restoration of exact constraint adherence to regularized {SCAN} functionals},\n  journal = {J. Chem. Phys.},\n  volume = {156},\n  number = {3},\n  pages = {034109},\n  year = {2022},\n  doi = {10.1063/5.0073623},\n  url = {https://doi.org/10.1063/5.0073623}\n}\n", "Furness2022_034109"),
        ]),
    :mgga_x_rscan => IdentifierText(
        "Regularized SCAN exchange by Bartok and Yates",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3),
        LibxcReference[
            LibxcReference("A. P. Bartók and J. R. Yates,  J. Chem. Phys. 150, 161101 (2019)", "10.1063/1.5094646", "@article{Bartok2019_161101,\n  author = {Bart\\'{o}k, Albert P. and Yates, Jonathan R.},\n  title = {Regularized {SCAN} functional},\n  journal = {J. Chem. Phys.},\n  volume = {150},\n  number = {16},\n  pages = {161101},\n  year = {2019},\n  doi = {10.1063/1.5094646},\n  url = {https://doi.org/10.1063/1.5094646}\n}\n", "Bartok2019_161101"),
        ]),
    :mgga_x_rtpss => IdentifierText(
        "TPSS for surface adsorption",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("A. J. Garza, A. T. Bell, and M. Head-Gordon,  J. Chem. Theory Comput. 14, 3083–3090 (2018)", "10.1021/acs.jctc.8b00288", "@article{Garza2018_3083,\n  author = {Garza, Alejandro J. and Bell, Alexis T. and Head-Gordon, Martin},\n  title = {Nonempirical Meta-Generalized Gradient Approximations for Modeling Chemisorption at Metal Surfaces},\n  journal = {J. Chem. Theory Comput.},\n  volume = {14},\n  number = {6},\n  pages = {3083--3090},\n  year = {2018},\n  doi = {10.1021/acs.jctc.8b00288},\n  url = {https://doi.org/10.1021/acs.jctc.8b00288}\n}\n", "Garza2018_3083"),
        ]),
    :mgga_x_sa_tpss => IdentifierText(
        "TPSS with correct surface asymptotics",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("L. A. Constantin, E. Fabiano, J. M. Pitarke, and F. Della Sala,  Phys. Rev. B 93, 115127 (2016)", "10.1103/PhysRevB.93.115127", "@article{Constantin2016_115127,\n  author = {Constantin, Lucian A. and Fabiano, Eduardo and Pitarke, J. M. and Della Sala, Fabio},\n  title = {Semilocal density functional theory with correct surface asymptotics},\n  journal = {Phys. Rev. B},\n  volume = {93},\n  issue = {11},\n  pages = {115127},\n  year = {2016},\n  month = {Mar},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevB.93.115127},\n  url = {http://link.aps.org/doi/10.1103/PhysRevB.93.115127}\n}\n", "Constantin2016_115127"),
        ]),
    :mgga_x_scan => IdentifierText(
        "SCAN exchange of Sun, Ruzsinszky, and Perdew",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("J. Sun, A. Ruzsinszky, and J. P. Perdew,  Phys. Rev. Lett. 115, 036402 (2015)", "10.1103/PhysRevLett.115.036402", "@article{Sun2015_036402,\n  author = {Sun, Jianwei and Ruzsinszky, Adrienn and Perdew, John P.},\n  title = {Strongly Constrained and Appropriately Normed Semilocal Density Functional},\n  journal = {Phys. Rev. Lett.},\n  volume = {115},\n  issue = {3},\n  pages = {036402},\n  year = {2015},\n  month = {Jul},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevLett.115.036402},\n  url = {http://link.aps.org/doi/10.1103/PhysRevLett.115.036402}\n}\n", "Sun2015_036402"),
        ]),
    :mgga_x_scanl => IdentifierText(
        "Deorbitalized SCAN (SCAN-L) exchange",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_laplacian, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("D. Mejía-Rodríguez and S. B. Trickey,  Phys. Rev. A 96, 052512 (2017)", "10.1103/PhysRevA.96.052512", "@article{Mejia2017_052512,\n  author = {Mej\\'{i}a-Rodr\\'{i}guez, Daniel and Trickey, S. B.},\n  title = {Deorbitalization strategies for meta-generalized-gradient-approximation exchange-correlation functionals},\n  journal = {Phys. Rev. A},\n  volume = {96},\n  issue = {5},\n  pages = {052512},\n  year = {2017},\n  month = {Nov},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevA.96.052512},\n  url = {https://link.aps.org/doi/10.1103/PhysRevA.96.052512}\n}\n", "Mejia2017_052512"),
            LibxcReference("D. Mejía-Rodríguez and S. B. Trickey,  Phys. Rev. B 98, 115161 (2018)", "10.1103/PhysRevB.98.115161", "@article{Mejia2018_115161,\n  author = {Mej\\'{i}a-Rodr\\'{i}guez, Daniel and Trickey, S. B.},\n  title = {Deorbitalized meta-{GGA} exchange-correlation functionals in solids},\n  journal = {Phys. Rev. B},\n  volume = {98},\n  issue = {11},\n  pages = {115161},\n  year = {2018},\n  month = {Sep},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevB.98.115161},\n  url = {https://link.aps.org/doi/10.1103/PhysRevB.98.115161}\n}\n", "Mejia2018_115161"),
            LibxcReference("J. Sun, A. Ruzsinszky, and J. P. Perdew,  Phys. Rev. Lett. 115, 036402 (2015)", "10.1103/PhysRevLett.115.036402", "@article{Sun2015_036402,\n  author = {Sun, Jianwei and Ruzsinszky, Adrienn and Perdew, John P.},\n  title = {Strongly Constrained and Appropriately Normed Semilocal Density Functional},\n  journal = {Phys. Rev. Lett.},\n  volume = {115},\n  issue = {3},\n  pages = {036402},\n  year = {2015},\n  month = {Jul},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevLett.115.036402},\n  url = {http://link.aps.org/doi/10.1103/PhysRevLett.115.036402}\n}\n", "Sun2015_036402"),
        ]),
    :mgga_x_sregtm_v1 => IdentifierText(
        "Simplified regularized Tao-Mo exchange (v1)",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("H. Francisco, A. C. Cancio, and S. B. Trickey,  J. Chem. Phys. 159, 214102 (2023)", "10.1063/5.0167868", "@article{Francisco2023_214102,\n  author = {Francisco, H. and Cancio, A. C. and Trickey, S. B.},\n  title = {Reworking the {Tao}--{Mo} exchange-correlation functional. {I}. Reconsideration and simplification},\n  journal = {J. Chem. Phys.},\n  volume = {159},\n  number = {21},\n  pages = {214102},\n  year = {2023},\n  doi = {10.1063/5.0167868},\n  url = {https://doi.org/10.1063/5.0167868}\n}\n", "Francisco2023_214102"),
        ]),
    :mgga_x_sregtm_v2 => IdentifierText(
        "Simplified regularized Tao-Mo exchange (v2)",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("H. Francisco, A. C. Cancio, and S. B. Trickey,  J. Chem. Phys. 159, 214102 (2023)", "10.1063/5.0167868", "@article{Francisco2023_214102,\n  author = {Francisco, H. and Cancio, A. C. and Trickey, S. B.},\n  title = {Reworking the {Tao}--{Mo} exchange-correlation functional. {I}. Reconsideration and simplification},\n  journal = {J. Chem. Phys.},\n  volume = {159},\n  number = {21},\n  pages = {214102},\n  year = {2023},\n  doi = {10.1063/5.0167868},\n  url = {https://doi.org/10.1063/5.0167868}\n}\n", "Francisco2023_214102"),
        ]),
    :mgga_x_sregtm_v3 => IdentifierText(
        "Simplified regularized Tao-Mo exchange (v3)",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("H. Francisco, A. C. Cancio, and S. B. Trickey,  J. Chem. Phys. 159, 214102 (2023)", "10.1063/5.0167868", "@article{Francisco2023_214102,\n  author = {Francisco, H. and Cancio, A. C. and Trickey, S. B.},\n  title = {Reworking the {Tao}--{Mo} exchange-correlation functional. {I}. Reconsideration and simplification},\n  journal = {J. Chem. Phys.},\n  volume = {159},\n  number = {21},\n  pages = {214102},\n  year = {2023},\n  doi = {10.1063/5.0167868},\n  url = {https://doi.org/10.1063/5.0167868}\n}\n", "Francisco2023_214102"),
        ]),
    :mgga_x_task => IdentifierText(
        "TASK exchange of Aschebrock and Kuemmel",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("T. Aschebrock and S. Kümmel,  Phys. Rev. Res. 1, 033082 (2019)", "10.1103/PhysRevResearch.1.033082", "@article{Aschebrock2019_033082,\n  author = {Aschebrock, Thilo and K\\\"{u}mmel, Stephan},\n  title = {Ultranonlocality and accurate band gaps from a meta-generalized gradient approximation},\n  journal = {Phys. Rev. Res.},\n  volume = {1},\n  issue = {3},\n  pages = {033082},\n  year = {2019},\n  month = {Nov},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevResearch.1.033082},\n  url = {https://link.aps.org/doi/10.1103/PhysRevResearch.1.033082}\n}\n", "Aschebrock2019_033082"),
        ]),
    :mgga_x_tau_hcth => IdentifierText(
        "tau-HCTH from Boese and Handy",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("A. D. Boese and N. C. Handy,  J. Chem. Phys. 116, 9559 (2002)", "10.1063/1.1476309", "@article{Boese2002_9559,\n  author = {Boese, A. D. and Handy, N. C.},\n  title = {New exchange-correlation density functionals: The role of the kinetic-energy density},\n  journal = {J. Chem. Phys.},\n  year = {2002},\n  volume = {116},\n  number = {22},\n  pages = {9559},\n  doi = {10.1063/1.1476309},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/116/22/10.1063/1.1476309}\n}\n", "Boese2002_9559"),
        ]),
    :mgga_x_tb09 => IdentifierText(
        "Tran & Blaha 09",
        (:have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_laplacian, :needs_tau, :enforce_fhc, :on_host),
        (1, 2, 3, 4),
        LibxcReference[
            LibxcReference("F. Tran and P. Blaha,  Phys. Rev. Lett. 102, 226401 (2009)", "10.1103/PhysRevLett.102.226401", "@article{Tran2009_226401,\n  author = {Tran, F. and Blaha, P.},\n  title = {Accurate Band Gaps of Semiconductors and Insulators with a Semilocal Exchange-Correlation Potential},\n  journal = {Phys. Rev. Lett.},\n  volume = {102},\n  issue = {22},\n  pages = {226401},\n  year = {2009},\n  month = {Jun},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevLett.102.226401},\n  url = {http://link.aps.org/doi/10.1103/PhysRevLett.102.226401}\n}\n", "Tran2009_226401"),
        ]),
    :mgga_x_th => IdentifierText(
        "Tsuneda and Hirao",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :development, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("T. Tsuneda and K. Hirao,  Phys. Rev. B 62, 15527–15531 (2000)", "10.1103/PhysRevB.62.15527", "@article{Tsuneda2000_15527,\n  author = {Tsuneda, Takao and Hirao, Kimihiko},\n  title = {Parameter-free exchange functional},\n  journal = {Phys. Rev. B},\n  volume = {62},\n  issue = {23},\n  pages = {15527--15531},\n  year = {2000},\n  month = {Dec},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevB.62.15527},\n  url = {https://link.aps.org/doi/10.1103/PhysRevB.62.15527}\n}\n", "Tsuneda2000_15527"),
        ]),
    :mgga_x_tlda => IdentifierText(
        "LDA-type exchange with tau-dependent potential",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("F. G. Eich and M. Hellgren,  J. Chem. Phys. 141, 224107 (2014)", "10.1063/1.4903273", "@article{Eich2014_224107,\n  author = {Eich, F. G. and Hellgren, Maria},\n  title = {Derivative discontinuity and exchange-correlation potential of meta-{GGAs} in density-functional theory},\n  journal = {J. Chem. Phys.},\n  volume = {141},\n  number = {22},\n  pages = {224107},\n  year = {2014},\n  doi = {10.1063/1.4903273},\n  url = {https://doi.org/10.1063/1.4903273}\n}\n", "Eich2014_224107"),
        ]),
    :mgga_x_tm => IdentifierText(
        "Tao and Mo 2016 exchange",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("J. Tao and Y. Mo,  Phys. Rev. Lett. 117, 073001 (2016)", "10.1103/PhysRevLett.117.073001", "@article{Tao2016_073001,\n  author = {Tao, Jianmin and Mo, Yuxiang},\n  title = {Accurate Semilocal Density Functional for Condensed-Matter Physics and Quantum Chemistry},\n  journal = {Phys. Rev. Lett.},\n  volume = {117},\n  issue = {7},\n  pages = {073001},\n  year = {2016},\n  month = {Aug},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevLett.117.073001},\n  url = {http://link.aps.org/doi/10.1103/PhysRevLett.117.073001}\n}\n", "Tao2016_073001"),
        ]),
    :mgga_x_tpss => IdentifierText(
        "Tao, Perdew, Staroverov & Scuseria",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("J. Tao, J. P. Perdew, V. N. Staroverov, and G. E. Scuseria,  Phys. Rev. Lett. 91, 146401 (2003)", "10.1103/PhysRevLett.91.146401", "@article{Tao2003_146401,\n  author = {Tao, J. and Perdew, J. P. and Staroverov, V. N. and Scuseria, G. E.},\n  title = {Climbing the Density Functional Ladder: Nonempirical Meta-Generalized Gradient Approximation Designed for Molecules and Solids},\n  journal = {Phys. Rev. Lett.},\n  volume = {91},\n  issue = {14},\n  pages = {146401},\n  year = {2003},\n  month = {Sep},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevLett.91.146401},\n  url = {http://link.aps.org/doi/10.1103/PhysRevLett.91.146401}\n}\n", "Tao2003_146401"),
            LibxcReference("J. P. Perdew, J. Tao, V. N. Staroverov, and G. E. Scuseria,  J. Chem. Phys. 120, 6898 (2004)", "10.1063/1.1665298", "@article{Perdew2004_6898,\n  author = {Perdew, J. P. and Tao, J. and Staroverov, V. N. and Scuseria, G. E.},\n  title = {Meta-generalized gradient approximation: Explanation of a realistic nonempirical density functional},\n  journal = {J. Chem. Phys.},\n  year = {2004},\n  volume = {120},\n  number = {15},\n  pages = {6898},\n  doi = {10.1063/1.1665298},\n  url = {http://scitation.aip.org/content/aip/journal/jcp/120/15/10.1063/1.1665298}\n}\n", "Perdew2004_6898"),
        ]),
    :mgga_x_vcml => IdentifierText(
        "Exchange part of VCML-rVV10 by Trepte and Voss",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("K. Trepte and J. Voss,  J. Comput. Chem. 43, 1104–1112 (2022)", "10.1002/jcc.26872", "@article{Trepte2022_1104,\n  author = {Trepte, Kai and Voss, Johannes},\n  title = {Data-driven and constrained optimization of semi-local exchange and nonlocal correlation functionals for materials and surface chemistry},\n  journal = {J. Comput. Chem.},\n  volume = {43},\n  number = {16},\n  pages = {1104--1112},\n  year = {2022},\n  doi = {10.1002/jcc.26872},\n  url = {https://onlinelibrary.wiley.com/doi/abs/10.1002/jcc.26872}\n}\n", "Trepte2022_1104"),
        ]),
    :mgga_x_vt84 => IdentifierText(
        "meta-GGA version of VT{8,4} GGA",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("J. M. del Campo, J. L. Gázquez, S. B. Trickey, and A. Vela,  Chem. Phys. Lett. 543, 179–183 (2012)", "10.1016/j.cplett.2012.06.025", "@article{Campo2012_179,\n  author = {del Campo, Jorge M. and G\\'{a}zquez, Jos\\'{e} L. and Trickey, S. B. and Vela, Alberto},\n  title = {A new meta-{GGA} exchange functional based on an improved constraint-based {GGA}},\n  journal = {Chem. Phys. Lett.},\n  volume = {543},\n  number = {},\n  pages = {179--183},\n  year = {2012},\n  issn = {0009-2614},\n  doi = {10.1016/j.cplett.2012.06.025},\n  url = {http://www.sciencedirect.com/science/article/pii/S0009261412007117}\n}\n", "Campo2012_179"),
        ]),
    :mgga_xc_b97m_v => IdentifierText(
        "B97M-V exchange-correlation functional",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :vv10, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("N. Mardirossian and M. Head-Gordon,  J. Chem. Phys. 142, 074111 (2015)", "10.1063/1.4907719", "@article{Mardirossian2015_074111,\n  author = {Mardirossian, Narbe and Head-Gordon, Martin},\n  title = {Mapping the genome of meta-generalized gradient approximation density functionals: The search for {B97M}-{V}},\n  journal = {J. Chem. Phys.},\n  volume = {142},\n  number = {7},\n  pages = {074111},\n  year = {2015},\n  doi = {10.1063/1.4907719},\n  url = {https://doi.org/10.1063/1.4907719}\n}\n", "Mardirossian2015_074111"),
        ]),
    :mgga_xc_cc06 => IdentifierText(
        "Cancio and Chou 2006",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_laplacian, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("A. C. Cancio and M. Y. Chou,  Phys. Rev. B 74, 081202 (2006)", "10.1103/PhysRevB.74.081202", "@article{Cancio2006_081202,\n  author = {Cancio, A. C. and Chou, M. Y.},\n  title = {Beyond the local approximation to exchange and correlation: The role of the {Laplacian} of the density in the energy density of {Si}},\n  journal = {Phys. Rev. B},\n  volume = {74},\n  issue = {8},\n  pages = {081202},\n  year = {2006},\n  month = {Aug},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevB.74.081202},\n  url = {http://link.aps.org/doi/10.1103/PhysRevB.74.081202}\n}\n", "Cancio2006_081202"),
        ]),
    :mgga_xc_hle17 => IdentifierText(
        "high local exchange 2017",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3),
        LibxcReference[
            LibxcReference("P. Verma and D. G. Truhlar,  J. Phys. Chem. C 121, 7144–7154 (2017)", "10.1021/acs.jpcc.7b01066", "@article{Verma2017_7144,\n  author = {Verma, Pragya and Truhlar, Donald G.},\n  title = {{HLE17}: An Improved Local Exchange--Correlation Functional for Computing Semiconductor Band Gaps and Molecular Excitation Energies},\n  journal = {J. Phys. Chem. C},\n  volume = {121},\n  number = {13},\n  pages = {7144--7154},\n  year = {2017},\n  doi = {10.1021/acs.jpcc.7b01066},\n  url = {https://doi.org/10.1021/acs.jpcc.7b01066}\n}\n", "Verma2017_7144"),
        ]),
    :mgga_xc_lp90 => IdentifierText(
        "Lee & Parr, Eq. (60)",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_laplacian, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("C. Lee and R. G. Parr,  Phys. Rev. A 42, 193–200 (1990)", "10.1103/PhysRevA.42.193", "@article{Lee1990_193,\n  author = {Lee, Chengteh and Parr, Robert G.},\n  title = {Exchange-correlation functional for atoms and molecules},\n  journal = {Phys. Rev. A},\n  volume = {42},\n  issue = {1},\n  pages = {193--200},\n  year = {1990},\n  month = {Jul},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevA.42.193},\n  url = {http://link.aps.org/doi/10.1103/PhysRevA.42.193}\n}\n", "Lee1990_193"),
            LibxcReference("Q. Zhao, M. Levy, and R. G. Parr,  Phys. Rev. A 47, 918–922 (1993)", "10.1103/PhysRevA.47.918", "@article{Zhao1993_918,\n  author = {Zhao, Qingsheng and Levy, Mel and Parr, Robert G.},\n  title = {Applications of coordinate-scaling procedures to the exchange-correlation energy},\n  journal = {Phys. Rev. A},\n  volume = {47},\n  issue = {2},\n  pages = {918--922},\n  year = {1993},\n  month = {Feb},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevA.47.918},\n  url = {http://link.aps.org/doi/10.1103/PhysRevA.47.918}\n}\n", "Zhao1993_918"),
        ]),
    :mgga_xc_otpss_d => IdentifierText(
        "oTPSS-D functional of Goerigk and Grimme",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3),
        LibxcReference[
            LibxcReference("L. Goerigk and S. Grimme,  J. Chem. Theory Comput. 6, 107 (2010)", "10.1021/ct900489g", "@article{Goerigk2010_107,\n  author = {Goerigk, L. and Grimme, S.},\n  title = {A General Database for Main Group Thermochemistry, Kinetics, and Noncovalent Interactions -- Assessment of Common and Reparameterized (meta-){GGA} Density Functionals},\n  journal = {J. Chem. Theory Comput.},\n  volume = {6},\n  number = {1},\n  pages = {107},\n  year = {2010},\n  doi = {10.1021/ct900489g},\n  url = {http://pubs.acs.org/doi/abs/10.1021/ct900489g}\n}\n", "Goerigk2010_107"),
        ]),
    :mgga_xc_t_hle17 => IdentifierText(
        "HLE17 reparametrization for band gaps",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3),
        LibxcReference[
            LibxcReference("P. Borlido, J. Schmidt, A. W. Huran, F. Tran, M. A. L. Marques, and S. Botti,  npj Comput. Mater. 6, 96 (2020)", "10.1038/s41524-020-00360-0", "@article{Borlido2020_96,\n  author = {Borlido, Pedro and Schmidt, Jonathan and Huran, Ahmad W. and Tran, Fabien and Marques, Miguel A. L. and Botti, Silvana},\n  journal = {npj Comput. Mater.},\n  title = {{Exchange-correlation functionals for band gaps of solids: benchmark, reparametrization and machine learning}},\n  year = {2020},\n  issn = {2057-3960},\n  pages = {96},\n  volume = {6},\n  doi = {10.1038/s41524-020-00360-0},\n  url = {https://doi.org/10.1038/s41524-020-00360-0},\n  publisher = {Springer US}\n}\n", "Borlido2020_96"),
        ]),
    :mgga_xc_tpsslyp1w => IdentifierText(
        "TPSSLYP1W",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("E. E. Dahlke and D. G. Truhlar,  J. Phys. Chem. B 109, 15677 (2005)", "10.1021/jp052436c", "@article{Dahlke2005_15677,\n  author = {Dahlke, E. E. and Truhlar, D. G.},\n  title = {Improved Density Functionals for Water},\n  journal = {J. Phys. Chem. B},\n  volume = {109},\n  number = {33},\n  pages = {15677},\n  year = {2005},\n  doi = {10.1021/jp052436c},\n  url = {http://pubs.acs.org/doi/abs/10.1021/jp052436c}\n}\n", "Dahlke2005_15677"),
        ]),
    :mgga_xc_vcml_rvv10 => IdentifierText(
        "VCML-rVV10 by Trepte and Voss",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :vv10, :needs_tau, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("K. Trepte and J. Voss,  J. Comput. Chem. 43, 1104–1112 (2022)", "10.1002/jcc.26872", "@article{Trepte2022_1104,\n  author = {Trepte, Kai and Voss, Johannes},\n  title = {Data-driven and constrained optimization of semi-local exchange and nonlocal correlation functionals for materials and surface chemistry},\n  journal = {J. Comput. Chem.},\n  volume = {43},\n  number = {16},\n  pages = {1104--1112},\n  year = {2022},\n  doi = {10.1002/jcc.26872},\n  url = {https://onlinelibrary.wiley.com/doi/abs/10.1002/jcc.26872}\n}\n", "Trepte2022_1104"),
        ]),
    :mgga_xc_zlp => IdentifierText(
        "Zhao, Levy & Parr, Eq. (21)",
        (:have_exc, :have_vxc, :have_fxc, :have_kxc, :have_lxc, :dim3, :needs_laplacian, :enforce_fhc, :on_host),
        (0, 1, 2, 3, 4),
        LibxcReference[
            LibxcReference("Q. Zhao, M. Levy, and R. G. Parr,  Phys. Rev. A 47, 918–922 (1993)", "10.1103/PhysRevA.47.918", "@article{Zhao1993_918,\n  author = {Zhao, Qingsheng and Levy, Mel and Parr, Robert G.},\n  title = {Applications of coordinate-scaling procedures to the exchange-correlation energy},\n  journal = {Phys. Rev. A},\n  volume = {47},\n  issue = {2},\n  pages = {918--922},\n  year = {1993},\n  month = {Feb},\n  publisher = {American Physical Society},\n  doi = {10.1103/PhysRevA.47.918},\n  url = {http://link.aps.org/doi/10.1103/PhysRevA.47.918}\n}\n", "Zhao1993_918"),
        ]),
)
