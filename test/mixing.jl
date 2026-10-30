# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

@testset "every name a generated functional references resolves" begin
    # Static audit over src/generated/**/*.jl. A generated file that calls
    # a Libxc-renamed function we have not defined yet (`xc_asinh`,
    # `xc_x_minus_log1p`, ...) precompiles and loads without complaint,
    # because Julia resolves a global in a function body only when the
    # function is actually called. `src/LibXcDerivative.jl` includes every
    # `.jl` under `src/generated` via `readdir` at load time, so such a
    # file joins the package the moment it is written, and the gap
    # surfaces as an `UndefVarError` at the caller instead of at build
    # time. This walks the parsed `Expr` rather than calling anything, so
    # it needs no per-functional argument values, which is what makes it
    # usable now, ahead of the keyword/default-parameter interface the
    # generated positional closures still lack.

    # Every global name the parsed file depends on: call heads, macro
    # names and bare references, minus what the function signature binds
    # locally. Module-qualified names (`NaNMath.pow`) are recorded as
    # (module, name) pairs rather than descended into, so `pow` is never
    # mistaken for a bare global.
    function collect_refs!(refs, qualified, bound, x)
        if x isa Symbol
            x in bound || push!(refs, x)
        elseif x isa Expr
            if x.head === :. && length(x.args) == 2 &&
                    x.args[1] isa Symbol && x.args[2] isa QuoteNode
                # `NaNMath.pow` is a module-qualified name; `v.rs` is a
                # field of a local. Only the former is a global to check,
                # and what separates them is whether the base is bound
                # here: assignments bind before this is reached.
                base = x.args[1]::Symbol
                base in bound && return
                push!(qualified, (base, x.args[2].value::Symbol))
                return
            elseif x.head === :function || x.head === :->
                sig = x.args[1]
                params = if sig isa Expr && sig.head === :tuple
                    sig.args
                elseif sig isa Expr && sig.head === :call
                    sig.args[2:end]
                else
                    [sig]
                end
                for p in params
                    if p isa Symbol
                        push!(bound, p)
                    elseif p isa Expr && p.head === :parameters
                        # Keyword arguments bind their names too. Their
                        # default values are left to the walk below, so a
                        # default referring to something undefined is
                        # still reported.
                        for kw in p.args
                            if kw isa Expr && kw.head === :kw && kw.args[1] isa Symbol
                                push!(bound, kw.args[1])
                            elseif kw isa Symbol
                                push!(bound, kw)
                            end
                        end
                    end
                end
            elseif x.head === :(=) && x.args[1] isa Symbol
                # A generated file's `cse_tmp_N = ...` temporaries are
                # local bindings, not globals. Walk the right-hand side
                # first, then bind the name, so a temporary used before
                # its own assignment would still be reported.
                collect_refs!(refs, qualified, bound, x.args[2])
                push!(bound, x.args[1])
                return
            elseif x.head === :macrocall
                x.args[1] isa Symbol && push!(refs, x.args[1])
            elseif x.head === :kw && x.args[1] isa Symbol
                # The left side of a keyword argument at a *call* site is
                # the callee's parameter name, not a global: the mixed
                # functionals pass `params = (; cam_omega = 0.7)`, and
                # reading `params` and `cam_omega` as globals is how this
                # audit first reported twenty-odd names that resolve
                # perfectly well. The value is still walked.
                collect_refs!(refs, qualified, bound, x.args[2])
                return
            end
            for a in x.args
                collect_refs!(refs, qualified, bound, a)
            end
        end
        return nothing
    end

    gendir = joinpath(pkgdir(LibXcDerivative), "src", "generated")
    files = String[]
    for (root, _, fs) in walkdir(gendir), f in fs
        endswith(f, ".jl") && push!(files, joinpath(root, f))
    end
    # Guards against the audit silently passing on an empty file list.
    @test !isempty(files)

    unresolved = Tuple{String,Symbol}[]
    for file in files
        ex = Meta.parseall(read(file, String); filename=file)
        refs, qualified, bound = Set{Symbol}(), Set{Tuple{Symbol,Symbol}}(), Set{Symbol}()
        collect_refs!(refs, qualified, bound, ex)
        for r in sort!(collect(refs))
            isdefined(LibXcDerivative, r) ||
                push!(unresolved, (basename(file), r))
        end
        for (m, n) in sort!(collect(qualified))
            ok = isdefined(LibXcDerivative, m) && isdefined(getfield(LibXcDerivative, m), n)
            ok || push!(unresolved, (basename(file), Symbol(m, ".", n)))
        end
    end
    @test unresolved == Tuple{String,Symbol}[]

    # The collector was weakened to stop reading a keyword argument's
    # name at a call site as a global. These say it still reports what it
    # is for, and that the exemption is no wider than that: without them
    # a collector that returned early on every Expr would pass the test
    # above just as well.
    witness = Symbol[]
    collect_refs!(witness, Set{Tuple{Symbol,Symbol}}(), Set{Symbol}(),
                  :(lxs_undefined_name(x; params = (; cam_omega = 0.7))))
    @test :lxs_undefined_name in witness      # the call head is reported
    @test !(:params in witness)               # the parameter name is not
    @test !(:cam_omega in witness)            # nor a NamedTuple field
    @test :x in witness                       # an argument still is
end

@testset "the manifest matches the generated files" begin
    # A second gate, next to the static audit above. That one asks whether
    # a generated file's names resolve; this one asks whether the file is
    # the one the generator says it wrote.
    #
    # The argument order is what makes this worth checking. Generated
    # functionals are positional-only, with an order that follows whatever
    # sort produced at generation time, and it has already changed once
    # under a generator change: tests written against the old order went
    # on computing a wrong value in silence rather than erroring. The
    # manifest records the order the generation reported, independently of
    # the file it wrote, so a file that has drifted from its record
    # (regenerated with a different order, hand-edited, left over from an
    # earlier run) shows up here instead of in a number nobody checks.

    # The positional arguments a generated file's function actually
    # declares, read from the parsed source rather than from the `# args:`
    # comment, which is documentation and could itself be stale.
    function signature_args(file)
        ex = Meta.parseall(read(file, String); filename=file)
        found = nothing
        walk(x) = begin
            found === nothing || return
            if x isa Expr
                if x.head === :function && x.args[1] isa Expr &&
                   x.args[1].head === :tuple
                    found = Symbol[a for a in x.args[1].args]
                    return
                end
                foreach(walk, x.args)
            end
        end
        walk(ex)
        return found
    end

    gendir = joinpath(pkgdir(LibXcDerivative), "src", "generated")
    manifest_path = joinpath(gendir, "manifest.toml")
    @test isfile(manifest_path)
    manifest = isfile(manifest_path) ? TOML.parsefile(manifest_path) : Dict{String,Any}()

    files = String[]
    for (root, _, fs) in walkdir(gendir), f in fs
        # Several files sit at the top of src/generated rather than in a
        # family directory, because none is generated from a python
        # source. mixes.jl holds the functionals Libxc builds by mixing
        # others, recorded under `mix` and swept further down.
        # mixing_parameters.jl holds what Libxc keeps on xc_func_type
        # beside a functional, read from the pinned library; it declares
        # no functional of its own, and the corpus-wide comparison
        # against Libxc.jl is what checks it. identifier_facts.jl is the
        # same shape: read from the pinned library, declaring nothing,
        # as is identifier_text.jl, which holds Libxc's own names and
        # bibliography. source_version.jl holds two constants naming the
        # Libxc commit everything here came from, checked against the
        # manifest in test/manifest.jl.
        endswith(f, ".jl") && !(f in ("mixes.jl", "mixing_parameters.jl",
                                      "identifier_facts.jl",
                                      "identifier_text.jl",
                                      "source_version.jl")) &&
            push!(files, joinpath(root, f))
    end
    @test !isempty(files)
    @test isfile(joinpath(gendir, "mixes.jl"))

    undeclared = String[]     # a shipped file with no manifest entry
    mismatched = String[]     # a shipped file whose signature is not what was recorded
    misdeclared = String[]    # ... or whose demanded parameters are not
    for file in files
        family = basename(dirname(file))
        name = splitext(basename(file))[1]
        entry = get(get(manifest, family, Dict{String,Any}()), name, nothing)
        if entry === nothing || get(entry, "status", "") != "ok" ||
           get(entry, "held_back", false) === true
            push!(undeclared, "$family/$name")
            continue
        end
        args = signature_args(file)
        if args === nothing || String[string(a) for a in args] != entry["args"]
            push!(mismatched, "$family/$name")
        end
        # Which arguments a functional has no default for is a decision,
        # not an accident, so the manifest records it too: what a reader
        # has to supply is visible without opening the generated file.
        sym = Symbol(name, "_required")
        if isdefined(LibXcDerivative, sym)
            declared = String[string(r) for r in getfield(LibXcDerivative, sym)]
            declared == get(entry, "required", nothing) ||
                push!(misdeclared, "$family/$name")
        end
    end
    @test undeclared == String[]
    @test mismatched == String[]
    @test misdeclared == String[]

    # The other direction, which nothing above covers: every check so far
    # walks the files on disk, so a manifest entry claiming a functional
    # that is not there passes unseen. That matters because the manifest
    # is what a reader counts from: an entry left at "ok" for something
    # the package does not contain overstates it. A functional that was
    # generated but is deliberately not shipped is recorded as held back
    # instead.
    shipped = Set{Tuple{String,String}}()
    for f in files
        push!(shipped, (basename(dirname(f)), splitext(basename(f))[1]))
    end
    unshipped = String[]
    for (family, entries) in manifest_families(manifest), (name, entry) in entries
        get(entry, "status", "") == "ok" || continue
        get(entry, "held_back", false) === true && continue
        (family, name) in shipped || push!(unshipped, "$family/$name")
    end
    @test sort(unshipped) == String[]

    # A functional the pipeline deliberately does not generate must not be
    # shipped, and if the manifest mentions it at all it says so. All
    # three here reach for runtime numerical quadrature rather than a
    # closed form.
    for (family, name) in (("lda_exc", "lda_x_1d_exponential"),
                           ("lda_exc", "lda_x_1d_soft"),
                           ("gga_exc", "gga_x_fd_lb94"))
        @test !isfile(joinpath(gendir, family, "$name.jl"))
        entry = get(get(manifest, family, Dict{String,Any}()), name, nothing)
        entry === nothing || @test entry["status"] == "skipped"
    end

    # Generated, but deliberately not shipped. Held back is a shipping
    # decision rather than a generation outcome, so the manifest states
    # it beside the outcome rather than in place of it: these generated
    # successfully, and overwriting `status` would lose that and leave
    # nothing to restore a released hold to.
    #
    # Read off the manifest rather than from a list written here, so that
    # releasing a hold does not leave this asking about a functional that
    # now ships, which is what happened when the second tolerance tier
    # released three of them.
    held_back = Tuple{String,String}[]
    for (family, entries) in manifest_families(manifest), (name, entry) in entries
        get(entry, "held_back", false) === true || continue
        push!(held_back, (family, name))
        @test !isfile(joinpath(gendir, family, "$name.jl"))
        # A hold normally covers something that generates and is kept out
        # of the package anyway, so "ok" is the expected status. One hold
        # is not of that kind: hyb_gga_xc_case21's own recorded reason
        # says its body references cbspline/xbspline, which the generator
        # does not resolve, so it fails at printing. Named here rather
        # than allowed in general, so a second hold that stops generating
        # has to be looked at.
        if (family, name) == ("gga_exc", "hyb_gga_xc_case21")
            @test entry["status"] == "failed"
        else
            @test entry["status"] == "ok"
        end
        # A hold with no reason recorded is a hold nobody can review.
        @test get(entry, "held_back_reason", "") isa String
        @test !isempty(get(entry, "held_back_reason", ""))
    end

    # The set itself is pinned, so adding or releasing a hold has to be
    # stated here as well, which is what caught gga_x_n12 and
    # lda_xc_ksdt leaving it, and then mgga_c_rregtm and mgga_xc_lp90.
    # One is left: hyb_gga_xc_case21 demands array parameters this
    # generator cannot resolve and references cbspline/xbspline besides.
    @test sort(held_back) == [("gga_exc", "hyb_gga_xc_case21")]
end

@testset "functionals exercising the newly defined Libxc names match Libxc.jl" begin
    # One functional per name added to src/libxc_names.jl beyond
    # xc_log1p/xc_expm1, so each new definition is checked against the
    # compiled C library rather than only against `isdefined`:
    #   lda_xc_zlp, lda_k_zlp -> xc_x_minus_log1p
    #   lda_x_rel             -> xc_asinh
    #   lda_x_erf             -> erf (SpecialFunctions.jl)
    #   lda_x_yukawa          -> atan2
    #   lda_c_pk09            -> xc_atanh
    # lda_c_pk09 is also the functional common subexpression elimination
    # was introduced for: without it, generation never returns (73,946
    # tree operations standing for 452 distinct subexpressions, and
    # sympy_to_symbolics goes through the 762 KB string form). This
    # check is what says the decomposed output is still the right
    # function, not just a faster-to-produce one.
    # cam_omega = 0.3 is Libxc's own default for both screened
    # functionals (libxc-upstream/src/lda_x_erf.c:26,
    # libxc-upstream/src/lda_x_yukawa.c:24); the threshold values mirror
    # the lda_x reference test above.
    zt, dt, ω = 1e-15, 1e-15, 0.3

    cases = (
        (:lda_xc_zlp,   (rs, z) -> LibXcDerivative.lda_xc_zlp_energy(rs, z)),
        (:lda_k_zlp,    (rs, z) -> LibXcDerivative.lda_k_zlp_energy(rs, z, zt)),
        (:lda_x_rel,    (rs, z) -> LibXcDerivative.lda_x_rel_energy(rs, z, dt, zt)),
        (:lda_x_erf,    (rs, z) -> LibXcDerivative.lda_x_erf_energy(rs, z, ω, zt)),
        (:lda_x_yukawa, (rs, z) -> LibXcDerivative.lda_x_yukawa_energy(rs, z, ω, zt)),
        (:lda_c_pk09,   (rs, z) -> LibXcDerivative.lda_c_pk09_energy(rs, z, zt)),
    )

    for (name, mine) in cases
        fun = Libxc.Functional(name)
        for ρ in (0.01, 0.1, 1.0, 10.0)
            rs = lda_variables(ρ, Val(3)).rs
            ref = only(Libxc.evaluate(fun; rho=reshape([ρ], 1, 1), derivatives=0:0).zk)
            @test mine(rs, 0.0) ≈ ref atol=1e-12
        end
    end
end

@testset "the parameters differentiate like the density does" begin
    # Libxc's parameters are constants by the time its derivative code is
    # emitted, so it has no entry point for this; here they are ordinary
    # arguments. The docs claim a scope, and these are its three counts,
    # which cost nothing to check: the full gradient sweep over all 425 is
    # a dev-dir measurement, and representatives of it are below.
    skip = (:dens_threshold, :zeta_threshold, :XC_EPSILON, :XC_MIN)
    entry(n) = isdefined(LibXcDerivative, n) ? n : Symbol(n, :_vxc)
    own_params(n) = Tuple(k for k in keys(getfield(LibXcDerivative,
                                                   Symbol(entry(n), :_defaults)))
                          if !(k in skip))
    ids = available_identifiers()
    with = [n for n in ids if !isempty(own_params(n))]
    without = [n for n in ids if isempty(own_params(n))]
    mixes = [n for n in without
             if isdefined(LibXcDerivative, Symbol(entry(n), :_components))]
    @test length(with) == 425
    @test sum(length(own_params(n)) for n in with) == 3507
    # Every mix has none, and for the same reason: Libxc keeps the weights
    # outside every kernel, so they are literals in the generated sum and
    # the entry point has no `params` at all.
    @test length(mixes) == 154
    @test length(without) - length(mixes) == 118
    @test hyb_gga_xc_b3lyp_defaults === NamedTuple()
    @test_throws MethodError hyb_gga_xc_b3lyp(0.5, 0.1; params = (;))

    # One representative per family, and one with array parameters, each
    # asserted against the finite difference rather than only for being a
    # number: a parameter derivative that silently returned the value's
    # derivative would be a plausible wrong answer.
    at(f, args, p, k, v) = f(args...; params = merge(p, NamedTuple{(k,)}((v,))))
    for (f, args, p, k) in ((lda_x, (0.5,), lda_x_defaults, :params_a_alpha),
                            (gga_x_pbe, (0.5, 0.1), gga_x_pbe_defaults, :params_a_kappa),
                            (gga_x_pbe, (0.5, 0.1), gga_x_pbe_defaults, :params_a_mu),
                            (mgga_x_scan, (0.5, 0.1, 0.05, 0.3), mgga_x_scan_defaults,
                             :params_a_c1),
                            (lda_xc_ksdt, (0.5,), lda_xc_ksdt_defaults, :params_a_b_0__0))
        v0 = p[k]
        d = ForwardDiff.derivative(v -> at(f, args, p, k, v), v0)
        h = max(abs(v0), 1.0) * 1e-6
        fd = (at(f, args, p, k, v0 + h) - at(f, args, p, k, v0 - h)) / 2h
        @test isfinite(d)
        @test d != 0
        @test d ≈ fd rtol=1e-5
    end

    # A zero component is the point rather than the parameter, which is
    # what makes the 317 zeros in that sweep unalarming. Both reasons,
    # each shown by moving the point: a polarized row cannot enter at zero
    # polarization, and an exponent of rs enters through log(rs), which
    # vanishes where rs == 1 (rho = 0.5 in one dimension).
    ferro(args...) = lda_c_1d_css(args...;
        params = merge(lda_c_1d_css_defaults, (; params_a_ferro_0 = 5.24)))
    dferro(args) = ForwardDiff.derivative(
        v -> lda_c_1d_css(args...; params = merge(lda_c_1d_css_defaults,
                                                  (; params_a_ferro_0 = v))), 5.24)
    @test dferro((0.2,)) == 0
    @test dferro((0.14, 0.06)) != 0
    dpara9(rho) = ForwardDiff.derivative(
        v -> lda_c_1d_css(rho; params = merge(lda_c_1d_css_defaults,
                                              (; params_a_para_9 = v))), 4.424)
    @test LibXcDerivative.lda_variables(0.5, Val(1)).rs == 1.0
    @test dpara9(0.5) == 0
    @test dpara9(0.2) != 0
end

@testset "gga_x_wpbeh follows the correction made after 7.0.0" begin
    # The one functional in Libxc that four budgets ended in a kill for,
    # the last after four hours. The cause was not the mathematics: Libxc's
    # code generator differentiates every helper body eagerly to fourth
    # order, which this package pays for and throws away, and the hole
    # model's series is a body of a million operations. With the table
    # made lazy it comes out in 832 s, and the only thing still missing
    # was a Julia name for xc_erfcx.
    #
    # It holds six identifiers: HSE03, HSE06, HSE12, HSE12s, LC-wPBE and
    # itself.
    #
    # Compared against the pinned library rather than Libxc.jl's, for
    # the same reason as the four above and from the same release:
    # libxc 7.1.0's Fixed section, one line above GGA_C_WI, records that
    # "GGA_X_WPBEH: the low-gradient interpolation switch now uses exact
    # Ernzerhof-Gustavsson constants, fixing inconsistent HSE06
    # molecular gradients" (#627, !806). The vendored 7.0.0 therefore
    # computes the pre-correction function, and the gap it leaves is
    # small but well outside the strict gate: 5.6e-9 relative at
    # rho = 5, against an atol of 1e-10.
    #
    # References from the pinned 7.1.2 build (2026-10-09, sigma = 0.1
    # rho, unpolarized, omega at Libxc's default of zero).
    for (rho, ref) in zip((0.05, 0.5, 5.0), (-0.29330043986505022,
                                             -0.5870298954352221,
                                             -1.2629561743600111))
        @test gga_x_wpbeh(rho, 0.1rho) ≈ ref rtol=1e-13
    end

    # And the vendored library genuinely differs, which is what says
    # these references are not this package agreeing with itself.
    vendored = only(Libxc.evaluate(Libxc.Functional(:gga_x_wpbeh);
                                   rho=reshape([5.0], 1, 1),
                                   sigma=reshape([0.5], 1, 1),
                                   derivatives=0:0).zk)
    @test !isapprox(gga_x_wpbeh(5.0, 0.5), vendored; atol=1e-10)
    # Small enough that it would read as rounding if the ChangeLog had
    # not named it, so the size is pinned too.
    @test isapprox(gga_x_wpbeh(5.0, 0.5), vendored; rtol=1e-8)

    # The screening parameter is what the HSE family varies, and the
    # kernel takes it where Libxc keeps it, as cam_omega. Libxc's own
    # default is zero (libxc-upstream/src/gga_x_wpbeh.c:46), which is
    # the value HSE's first term uses.
    @test LibXcDerivative.gga_x_wpbeh_defaults.cam_omega == 0.0
    # Screening removes the long-range part of exchange, so the energy
    # density loses magnitude: -0.527 at omega = 0.11 against -0.587 at
    # omega = 0. Written the other way round first, which is what this
    # assertion is for.
    @test gga_x_wpbeh(0.5, 0.05; params = (; cam_omega = 0.11)) >
          gga_x_wpbeh(0.5, 0.05)
    @test gga_x_wpbeh(0.5, 0.05; params = (; cam_omega = 0.11)) < 0

    # What it is made of, which is why it needed xc_erfcx: three calls in
    # the generated kernel.
    source = read(joinpath(pkgdir(LibXcDerivative), "src", "generated",
                           "gga_exc", "gga_x_wpbeh.jl"), String)
    @test occursin("xc_erfcx", source)
end

@testset "the mixing parameters Libxc keeps beside the functional" begin
    # What a hybrid's caller has to be told, and what this package owes
    # it. A hybrid's exchange is part semi-local and part exact, and only
    # the semi-local part is a density functional: no amount of rho tells
    # you that HSEsol wants a quarter of its exchange short-range exact,
    # screened at omega = 0.11. Libxc answers that from xc_func_type
    # rather than from any kernel (xc_hyb_exx_coef and xc_hyb_cam_coef,
    # libxc-upstream/src/hybrids.c:63-77), and a caller that evaluates
    # through this package instead had nowhere to ask.
    #
    # The numbers are read from the pinned library at generation time, so
    # these are the library's values rather than a paper's.

    # Libxc's own two accessors, under their own names. Both are plain
    # reads of cam_alpha / cam_beta / cam_omega (in Libxc a global
    # hybrid's exact-exchange fraction IS cam_alpha, with beta and omega
    # zero), so they answer for every hybrid and apply no policy.
    @test LibXcDerivative.xc_hyb_exx_coef(:hyb_gga_xc_pbeh) ≈ 0.25
    @test LibXcDerivative.xc_hyb_cam_coef(:hyb_gga_xc_hse_sol) ==
          (omega = 0.11, alpha = 0.0, beta = 0.25)
    @test LibXcDerivative.xc_hyb_cam_coef(:hyb_gga_xc_pbeh) ==
          (omega = 0.0, alpha = 0.25, beta = 0.0)

    # Libxc.jl's properties, with its policy: a quantity that does not
    # apply to the functional's class is `nothing` rather than the zero
    # the struct happens to hold (Functional.jl:130-146). The zero and
    # the inapplicable are different answers, and a caller that mixed
    # 0.25 of exact exchange into a functional that wanted none would be
    # wrong in the direction that looks plausible.
    @test LibXcDerivative.exx_coefficient(:hyb_gga_xc_pbeh) ≈ 0.25
    @test LibXcDerivative.exx_coefficient(:hyb_gga_xc_hse_sol) === nothing
    @test LibXcDerivative.cam_omega(:hyb_gga_xc_hse_sol) ≈ 0.11
    @test LibXcDerivative.cam_beta(:hyb_gga_xc_hse_sol) ≈ 0.25
    @test LibXcDerivative.cam_alpha(:hyb_gga_xc_hse_sol) == 0.0
    @test LibXcDerivative.cam_omega(:hyb_gga_xc_pbeh) === nothing

    # The classes, as Libxc decides them: the family for hybrid-ness, the
    # XC_FLAGS_HYB_CAM/CAMY/LC/LCY flags for range separation
    # (hybrids.c:20-32). Not a name test: hyb_gga_xc_pbeh is a hybrid and
    # not range-separated, and nothing in its name says so.
    @test LibXcDerivative.is_hybrid(:hyb_gga_xc_hse_sol)
    @test LibXcDerivative.is_range_separated(:hyb_gga_xc_hse_sol)
    @test !LibXcDerivative.is_global_hybrid(:hyb_gga_xc_hse_sol)
    @test LibXcDerivative.is_global_hybrid(:hyb_gga_xc_pbeh)
    @test !LibXcDerivative.is_range_separated(:hyb_gga_xc_pbeh)
    @test !LibXcDerivative.is_hybrid(:gga_x_pbe)
    @test LibXcDerivative.is_vv10(:gga_xc_vv10)
    @test !LibXcDerivative.is_vv10(:hyb_gga_xc_pbeh)
    @test LibXcDerivative.nlc_b(:gga_xc_vv10) > 0
    @test LibXcDerivative.nlc_C(:gga_xc_vv10) > 0
    @test LibXcDerivative.nlc_b(:hyb_gga_xc_pbeh) === nothing

    # A functional that is none of these answers for all of them, so a
    # caller can ask without knowing the class first.
    @test LibXcDerivative.exx_coefficient(:gga_x_pbe) === nothing
    @test LibXcDerivative.cam_alpha(:gga_x_pbe) === nothing
    @test LibXcDerivative.nlc_C(:gga_x_pbe) === nothing

    # Takes the entry point itself as well as its name, the way
    # xc_exc_vxc does, since that is what a caller holding a functional
    # has in hand.
    @test LibXcDerivative.cam_omega(hyb_gga_xc_hse_sol) ≈ 0.11
    @test LibXcDerivative.is_global_hybrid(hyb_gga_xc_pbeh)

    # A name this package does not ship is refused rather than answered
    # with a default. Returning false for a typo would make the quietest
    # possible error: exact exchange simply left out.
    @test_throws ArgumentError LibXcDerivative.is_hybrid(:gga_x_not_a_functional)
    # A name Libxc registers but this package does not serve is refused
    # too: lda_x_1d_soft needs runtime quadrature, which is outside what
    # a closed form can be generated for, so it has no entry point here.
    @test !isdefined(LibXcDerivative, :lda_x_1d_soft)
    @test_throws ArgumentError LibXcDerivative.cam_omega(:lda_x_1d_soft)

    # HSE06 itself, which this asked about and could not answer until
    # gga_x_wpbeh generated: a screened hybrid at omega = 0.11 with a
    # quarter of its short-range exchange exact.
    @test LibXcDerivative.cam_omega(:hyb_gga_xc_hse06) ≈ 0.11
    @test LibXcDerivative.cam_beta(:hyb_gga_xc_hse06) ≈ 0.25
    @test LibXcDerivative.cam_alpha(:hyb_gga_xc_hse06) == 0.0
    @test LibXcDerivative.exx_coefficient(:hyb_gga_xc_hse06) === nothing
    # HSE03 keeps the two screening parameters the 2003 paper actually
    # used, omega_HF = 0.15/sqrt(2); HSE06 is where they were set equal
    # (libxc-upstream/src/hyb_gga_xc_hse.c:31-44). The one Libxc
    # reports is omega_HF.
    @test LibXcDerivative.cam_omega(:hyb_gga_xc_hse03) ≈ 0.15 / sqrt(2) rtol=1e-12
    @test LibXcDerivative.cam_omega(:hyb_gga_xc_hse03) !=
          LibXcDerivative.cam_omega(:hyb_gga_xc_hse06)
    # LC-wPBE is the long-range-corrected one: all of the long-range
    # exchange is exact, so alpha is 1 and beta cancels it at short range.
    @test LibXcDerivative.cam_alpha(:hyb_gga_xc_lc_wpbe) ≈ 1.0
    @test LibXcDerivative.cam_beta(:hyb_gga_xc_lc_wpbe) ≈ -1.0
end

@testset "the four predicates Libxc.jl also exports are not exported here" begin
    # Deliberate, and pinned so that exporting them later has to be a
    # decision rather than a tidy-up. Libxc.jl exports is_lda, is_gga,
    # is_mgga, is_hybrid, is_vv10, is_range_separated and
    # is_global_hybrid; a caller doing `using LibXcDerivative, Libxc`
    # (which is what porting looks like) would have to disambiguate
    # every use of a name both modules export.
    exported = names(LibXcDerivative)
    for name in (:is_hybrid, :is_range_separated, :is_global_hybrid, :is_vv10)
        @test !(name in exported)
        @test isdefined(LibXcDerivative, name)   # reachable, just qualified
    end
    # The rest does not collide: Libxc.jl offers these as properties of a
    # Functional rather than as functions, so they are exported here.
    for name in (:exx_coefficient, :cam_alpha, :cam_beta, :cam_omega,
                 :nlc_b, :nlc_C, :xc_hyb_exx_coef, :xc_hyb_cam_coef,
                 :mixing_parameters, :MixingParameters)
        @test name in exported
    end
end

# The Yukawa-screened hybrids Libxc.jl cannot see as range-separated, for
# the reason spelled out where they are used below. Listed rather than
# detected so that the list has to be revisited when Libxc.jl changes.
YUKAWA_MISSPELLED_BY_LIBXC_JL = (
    :hyb_gga_xc_camy_b3lyp, :hyb_gga_xc_camy_blyp, :hyb_gga_xc_camy_pbeh,
    :hyb_gga_xc_lcy_blyp, :hyb_gga_xc_lcy_pbe, :hyb_lda_xc_bn05,
)

@testset "every mixing parameter agrees with Libxc.jl, over the whole corpus" begin
    # The gate, rather than the examples above. A sample of eight passed
    # every check the day the generator's inliner was changed, while the
    # whole corpus turned up nine problems; the lesson is cheap to apply
    # here, where the comparison is one C call per functional.
    checked = 0
    hybrids = 0
    for name in names(LibXcDerivative)
        text = string(name)
        any(startswith(text, p) for p in ("lda_", "gga_", "mgga_", "hyb_")) || continue
        any(endswith(text, s) for s in ("_components", "_defaults", "_required",
                                        "_energy", "_variables", "_vxc")) && continue
        fun = try
            Libxc.Functional(name)
        catch
            continue    # a kernel this package ships under a name Libxc does not register
        end
        checked += 1
        Libxc.is_hybrid(fun) && (hybrids += 1)

        # Seven functionals where the comparator is the one that is
        # wrong, each asserted through the specific fault rather than
        # waved past, so that a fixed or updated Libxc.jl fails here and
        # the exception gets removed.
        if name in YUKAWA_MISSPELLED_BY_LIBXC_JL
            # Libxc.jl decodes XC_FLAGS_HYB_CAMY to :hym_camy
            # (Functional.jl:213: "hym", not "hyb"), while
            # is_range_separated looks for :hyb_camy
            # (Functional.jl:95), so no Yukawa-screened functional is
            # ever range-separated to it. The pinned library sets the
            # flag for all six, and these are screened hybrids.
            @test :hym_camy in fun.flags
            @test !(:hyb_camy in fun.flags)
            @test !Libxc.is_range_separated(fun)
            @test LibXcDerivative.is_range_separated(name)
            @test LibXcDerivative.cam_omega(name) > 0
            continue
        elseif name === :hyb_lda_x_erf
            # Not a bug but a version: Libxc.jl vendors 7.0.0, which
            # registers this one in XC_FAMILY_LDA, and the pinned 7.1.2
            # puts it in XC_FAMILY_HYB_LDA. Its XC_FLAGS_HYB_CAM flag is
            # set in both, so only the family differs, and to Libxc.jl a
            # non-hybrid cannot be range-separated.
            @test fun.family === :lda
            @test :hyb_cam in fun.flags
            @test LibXcDerivative.is_hybrid(name)
            @test LibXcDerivative.is_range_separated(name)
            continue
        end

        @test LibXcDerivative.is_hybrid(name) == Libxc.is_hybrid(fun)
        @test LibXcDerivative.is_range_separated(name) == Libxc.is_range_separated(fun)
        @test LibXcDerivative.is_global_hybrid(name) == Libxc.is_global_hybrid(fun)
        @test LibXcDerivative.is_vv10(name) == Libxc.is_vv10(fun)
        for property in (:exx_coefficient, :cam_alpha, :cam_beta, :cam_omega,
                         :nlc_b, :nlc_C)
            ours = getfield(LibXcDerivative, property)(name)
            theirs = getproperty(fun, property)
            if theirs === nothing
                @test ours === nothing
            else
                # Exactly, not to a tolerance: both sides read the same
                # double out of the same library.
                @test ours == theirs
            end
        end
    end
    # Measured, not asserted as a target: the count is printed so that a
    # change in it is visible rather than silently absorbed.
    @test checked > 600
    @test hybrids > 100
    println("mixing parameters checked against Libxc.jl: ",
            checked, " identifiers, ", hybrids, " of them hybrids")
end

@testset "the mixing accessors name themselves when the argument is not one" begin
    # They read the mixing table that mixing_parameters builds, so without a
    # method of their own for anything else the error names that function
    # rather than the accessor the caller reached for.
    for entry in (exx_coefficient, cam_alpha, cam_beta, cam_omega,
                  nlc_b, nlc_C, xc_hyb_exx_coef, xc_hyb_cam_coef)
        err = try
            entry(42)
            nothing
        catch e
            e
        end
        @test err isa ArgumentError
        msg = sprint(showerror, err)
        @test occursin(string(nameof(entry)), msg)
        @test !occursin("mixing_parameters", msg)
        @test occursin("Int64", msg)
    end

    # What they do take still answers, by function and by name. HSE06 is
    # range separated, so its exact exchange is in cam_beta and its
    # cam_alpha, which xc_hyb_exx_coef reports, is zero; a global hybrid
    # carries the coefficient in exx_coefficient instead.
    @test xc_hyb_exx_coef(hyb_gga_xc_hse06) == 0.0
    @test xc_hyb_exx_coef(:hyb_gga_xc_hse06) == 0.0
    @test cam_beta(:hyb_gga_xc_hse06) == 0.25
    @test cam_omega(:hyb_gga_xc_hse06) == 0.11
    @test xc_hyb_cam_coef(:hyb_gga_xc_hse06) ==
          (omega = 0.11, alpha = 0.0, beta = 0.25)
    @test exx_coefficient(:hyb_gga_xc_b3lyp) == 0.2
    @test exx_coefficient(:lda_x) === nothing
end
