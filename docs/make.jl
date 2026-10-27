# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

using Documenter
using LibXcDerivative
# Needed for two reasons, neither of them the docstrings: those are attached to
# the zero-method declarations in src/slots.jl and are there without it. The
# `modules` list below asks for the extension by name, and `Base.get_extension`
# returns `nothing` until ForwardDiff is loaded; and the doctests on the
# derivatives page call the slot functions, which have no methods without it.
using ForwardDiff

DocMeta.setdocmeta!(LibXcDerivative, :DocTestSetup,
                    :(using LibXcDerivative, ForwardDiff); recursive=true)

makedocs(;
    sitename = "LibXcDerivative.jl",
    authors = "Hiroharu Sugawara",
    modules = [LibXcDerivative,
               Base.get_extension(LibXcDerivative, :LibXcDerivativeForwardDiffExt)],
    format = Documenter.HTML(;
        prettyurls = get(ENV, "CI", "false") == "true",
        canonical = "https://hsugawa8651.github.io/LibXcDerivative.jl/stable/",
        assets = String[],
        # The public-methods page carries 77 docstrings and comes to 148 KiB,
        # which is over Documenter's default warning line and well under its
        # error line. Raised so that a real size problem is still reported.
        size_threshold_warn = 200_000,
        size_threshold = 400_000,
    ),
    pages = [
        "Home" => "index.md",
        "Calling a functional" => "calling.md",
        "Derivatives" => "derivatives.md",
        "What is Libxc's and what is ours" => "provenance.md",
        "Coming from Libxc.jl" => "from-libxc-jl.md",
        "How closely it matches Libxc" => "matching.md",
        "Limitations" => "limits.md",
        "Public methods" => "api.md",
    ],
    # Nearly everything the package exports is generated, so a missing
    # docstring is the normal case rather than an error. The checks
    # that are kept are the ones that catch a broken page: a cross-reference
    # to a name that does not exist, and a page not listed above.
    checkdocs = :none,
    doctest = true,
    warnonly = [:missing_docs],
)

deploydocs(;
    repo = "github.com/hsugawa8651/LibXcDerivative.jl",
    devbranch = "main",
)
