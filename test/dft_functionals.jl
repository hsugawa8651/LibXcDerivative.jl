# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

@testset "the DftFunctionals interface, through the extension" begin
    # What DFTK consumes. DftFunctionals.jl carries the whole
    # array-based, spin-resolved machinery generically and asks an
    # implementation for one scalar `energy` per family, so this layer is
    # the scalar entry points with two conventions applied: the energy is
    # per unit volume (rho times our zk), and sigma arrives with three
    # pseudo-spin components.
    f = LibXcDerivative.dft_functional(:gga_x_pbe)
    @test f isa DftFunctionals.Functional{:gga,:x}
    @test identifier(f) === :gga_x_pbe
    @test family(f) === :gga
    @test kind(f) === :x
    @test needs_σ(f)
    @test !needs_τ(f)
    @test !needs_Δρ(f)
    @test has_energy(f)

    # The energy convention, against the package's own scalar entry
    # point: per unit volume, so rho times the energy per particle.
    for (rho, sigma) in ((0.05, 0.005), (0.5, 0.3), (5.0, 12.0))
        e = DftFunctionals.energy(f, rho, sigma)
        @test e ≈ rho * gga_x_pbe(rho, sigma) rtol=1e-14
    end
    # Which is the convention DftFunctionals' own PBE uses, so the two
    # agree where both exist. This is the check that says the factor of
    # rho is not just self-consistent.
    theirs = DftFunctional(:gga_x_pbe)
    for (rho, sigma) in ((0.05, 0.005), (0.5, 0.3), (5.0, 12.0))
        @test DftFunctionals.energy(f, rho, sigma) ≈
              DftFunctionals.energy(theirs, rho, sigma) rtol=1e-9
    end

    # The array interface, which is what a caller actually uses: a spin
    # axis and a point axis, and the derivatives come from the generic
    # ForwardDiff path rather than from anything written here.
    rho = reshape([0.05, 0.5, 5.0], 1, 3)
    sigma = reshape([0.005, 0.3, 12.0], 1, 3)
    terms = potential_terms(f, rho, sigma)
    @test size(terms.e) == (3,)
    @test size(terms.Vρ) == (1, 3)
    @test size(terms.Vσ) == (1, 3)
    # Vrho is d(e)/d(rho), which is exactly Libxc's vrho slot, so it has
    # to match what this package already answers for that slot.
    slots = xc_exc_vxc(gga_x_pbe, 0.5, 0.3)
    @test terms.Vρ[1, 2] ≈ slots.vrho rtol=1e-12
    @test terms.Vσ[1, 2] ≈ slots.vsigma rtol=1e-12
    @test terms.e[2] ≈ 0.5 * slots.zk rtol=1e-12

    # An LDA takes no sigma, and the interface drops the extra argument.
    l = LibXcDerivative.dft_functional(:lda_x)
    @test l isa DftFunctionals.Functional{:lda,:x}
    @test DftFunctionals.energy(l, 0.5) ≈ 0.5 * lda_x(0.5) rtol=1e-14
    @test energy_density(l, reshape([0.5], 1, 1))[1] ≈ 0.5 * lda_x(0.5) rtol=1e-14

    # A meta-GGA reads tau, and one that reads the Laplacian instead is
    # in the family that says so.
    m = LibXcDerivative.dft_functional(:mgga_x_scan)
    @test needs_τ(m)
    @test !needs_Δρ(m)
    @test LibXcDerivative.dft_functional(:mgga_x_scanl) isa
          DftFunctionals.Functional{:mggal}
    @test needs_Δρ(LibXcDerivative.dft_functional(:mgga_x_scanl))

    # HSE06, which is the point of the exercise: its semi-local part is a
    # GGA, and its mixing is answered separately, by the layer Libxc
    # answers it from.
    h = LibXcDerivative.dft_functional(:hyb_gga_xc_hse06)
    @test h isa DftFunctionals.Functional{:gga,:xc}
    @test DftFunctionals.energy(h, 0.5, 0.3) ≈
          0.5 * hyb_gga_xc_hse06(0.5, 0.3) rtol=1e-14

    # The meta-GGA argument order, which is the one thing here that could
    # be silently wrong: this package takes (rho, sigma, lapl, tau), the
    # interface takes (rho, sigma, tau, Laplacian). The last two are
    # swapped on the way through, and swapping them back would still pass
    # every test above.
    let rho = 0.5, sigma = 0.05, tau = 0.15, lapl = 0.025
        # A meta-GGA that wants tau and not the Laplacian: zero goes in
        # the Laplacian slot, not the caller's tau.
        @test DftFunctionals.energy(m, rho, sigma, tau) ≈
              rho * mgga_x_scan(rho, sigma, 0.0, tau) rtol=1e-14
        @test DftFunctionals.energy(m, rho, sigma, tau) !=
              rho * mgga_x_scan(rho, sigma, tau, 0.0)
        # And one that wants both, where the swap is visible.
        l = LibXcDerivative.dft_functional(:mgga_x_scanl)
        @test DftFunctionals.energy(l, rho, sigma, tau, lapl) ≈
              rho * mgga_x_scanl(rho, sigma, lapl, tau) rtol=1e-14
        @test !isapprox(DftFunctionals.energy(l, rho, sigma, tau, lapl),
                        rho * mgga_x_scanl(rho, sigma, tau, lapl); rtol=1e-6)
    end

    # Parameters, as the interface wants them: a ComponentArray of what
    # the entry point will take back, with the thresholds left out:
    # DftFunctionals asks for those through threshold_rho and friends.
    pbe_params = parameters(f)
    @test pbe_params isa ComponentArray
    @test :params_a_kappa in keys(pbe_params)
    @test :dens_threshold ∉ keys(pbe_params)   # a threshold, not a parameter

    # Nor is a machine constant. mgga_c_lak guards a logarithm with
    # XC_MIN, the smallest normal Float64, and carries it in its defaults
    # beside the thresholds; of the 732 entry points it is the only one that
    # does. Offered here it reads like something to fit, and a non-empty
    # parameter set also makes the extension pass `params` and
    # `arithmetic_type` stop deferring to the density's type. What is not a
    # parameter is the package's own list, LibXcDerivative.THRESHOLD_PARAMS,
    # so this layer and `param_names` cannot drift apart.
    @test isempty(parameters(LibXcDerivative.dft_functional(:mgga_c_lak)))
    @test param_names(mgga_c_lak) == ()

    # Which holds across the corpus: what the interface offers to tune is
    # exactly what the scalar layer lists. The identifiers it cannot build
    # are those demanding a parameter with no default, and none of the
    # registered ones do, so the sweep reaches all of them.
    tunable_differs = Symbol[]
    built = 0
    for id in available_identifiers()
        entry = isdefined(LibXcDerivative, id) ? id : Symbol(id, :_vxc)
        isempty(getfield(LibXcDerivative, Symbol(entry, :_required))) || continue
        built += 1
        Tuple(keys(parameters(LibXcDerivative.dft_functional(id)))) ==
            param_names(getfield(LibXcDerivative, entry)) || push!(tunable_differs, id)
    end
    @test built == length(available_identifiers())
    @test isempty(tunable_differs)

    # Changing one has to reach the value, and to rename the functional
    # unless told otherwise, which is the interface's own rule.
    stretched = change_parameters(f, ComponentArray(; params_a_kappa = 1.245,
                                  params_a_mu = pbe_params.params_a_mu))
    @test identifier(stretched) !== identifier(f)
    @test DftFunctionals.energy(stretched, 0.5, 0.3) ≈
          0.5 * gga_x_pbe(0.5, 0.3; params = (; params_a_kappa = 1.245,
                          params_a_mu = pbe_params.params_a_mu)) rtol=1e-13
    # 1.245 is revPBE's kappa, so this is a functional Libxc also has,
    # which says the parameter reached the expression rather than being
    # stored and ignored.
    @test DftFunctionals.energy(stretched, 0.5, 0.3) ≈
          0.5 * gga_x_pbe_r(0.5, 0.3) rtol=1e-13
    kept = change_parameters(f, pbe_params; keep_identifier=true)
    @test identifier(kept) === identifier(f)

    # A mix has nothing to tune: the generator bakes its components'
    # overrides into the entry point, so HSE06's omega is 0.11 in the
    # expression and not a parameter of it. The screening is still
    # answered, by the layer Libxc answers it from, which is what a
    # caller assembling the exact-exchange part needs.
    @test isempty(parameters(h))
    @test cam_omega(:hyb_gga_xc_hse06) ≈ 0.11

    # A potential-only functional has no energy, and the interface has a
    # way to say so rather than returning a wrong number.
    @test !has_energy(LibXcDerivative.dft_functional(:gga_x_lb))
end

@testset "how far the interface's generic evaluation reaches" begin
    # Measured rather than assumed, because the extension supplies only
    # the scalar energies and everything array-shaped comes from
    # DftFunctionals' generic path, so what works is decided there, not
    # here, and saying "it works generically" without checking was a claim
    # with nothing behind it.
    rho = reshape([0.5], 1, 1)
    sigma = reshape([0.3], 1, 1)
    tau = reshape([0.15], 1, 1)

    # LDA and GGA reach all three, second derivatives included.
    l = LibXcDerivative.dft_functional(:lda_x)
    @test keys(potential_terms(l, rho)) == (:e, :Vρ)
    @test keys(kernel_terms(l, rho)) == (:e, :Vρ, :Vρρ)

    g = LibXcDerivative.dft_functional(:gga_x_pbe)
    @test keys(potential_terms(g, rho, sigma)) == (:e, :Vρ, :Vσ)
    @test keys(kernel_terms(g, rho, sigma)) == (:e, :Vρ, :Vσ, :Vρρ, :Vρσ, :Vσσ)
    # And the second derivatives are the ones this package answers for
    # Libxc's own slots, which is what says the generic path is
    # differentiating the expression it was given.
    slots = xc_fxc(gga_x_pbe, 0.5, 0.3)
    k = kernel_terms(g, rho, sigma)
    @test k.Vρρ[1, 1] ≈ slots.v2rho2 rtol=1e-10
    @test k.Vρσ[1, 1] ≈ slots.v2rhosigma rtol=1e-10
    @test k.Vσσ[1, 1] ≈ slots.v2sigma2 rtol=1e-10

    # A meta-GGA reaches the first two, which this package supplies
    # itself. The interface's generic path stops at Functional{:gga}:
    # DftFunctionals implements energy_density, potential_terms and
    # kernel_terms for Functional{:lda} and Functional{:gga} only
    # (interface.jl), so a meta-GGA got a MethodError from all three even
    # though the scalar energy was here for all four families. The two a
    # caller needs are answered here from xc_exc_vxc, whose numbers are
    # Libxc's own slots.
    m = LibXcDerivative.dft_functional(:mgga_x_scan)
    @test DftFunctionals.energy(m, 0.5, 0.3, 0.15) ≈
          0.5 * mgga_x_scan(0.5, 0.3, 0.0, 0.15) rtol=1e-14
    @test keys(potential_terms(m, rho, sigma, tau)) == (:e, :Vρ, :Vσ, :Vτ)
    @test length(energy_density(m, rho, sigma, tau)) == 1
    # kernel_terms is not supplied, on purpose. DFTK, which is what the
    # interface is for, says in DispatchFunctional.jl that it does not
    # need it ("This can be strictly expressed by AD"), and uses it in
    # one commented line. A caller wanting a meta-GGA's second derivatives
    # has xc_fxc, which gives Libxc's ten slots by name rather than the
    # three dense blocks this would pack them into.
    @test_throws MethodError kernel_terms(m, rho, sigma, tau)
    # Which the slot functions do answer, for the same functional.
    @test xc_exc_vxc(mgga_x_scan, 0.5, 0.3, 0.0, 0.15).vtau isa Float64
end

@testset "spins: the interface's own fallback refuses what this answers" begin
    # DftFunctionals' generic energy over a spin axis errors with
    # "Multiple spins not yet implemented for fallback functionals"
    # (interface.jl), because its own functionals are written for a total
    # density. This package generates the spin-resolved entry points too,
    # so the spin-resolved method is supplied here and the refusal does
    # not apply.
    f = LibXcDerivative.dft_functional(:gga_x_pbe)
    na, nb = 0.3, 0.2
    gaa, gab, gbb = 0.12, 0.05, 0.08

    # Polarized, through the array interface: a spin axis of 2 for rho
    # and 3 for sigma, the latter being the (aa, ab, bb) pseudo-spin
    # components the interface documents (util.jl).
    rho = reshape([na, nb], 2, 1)
    sigma = reshape([gaa, gab, gbb], 3, 1)
    e = energy_density(f, rho, sigma)
    @test e[1] ≈ (na + nb) * gga_x_pbe(na, nb, gaa, gab, gbb) rtol=1e-14

    # Unpolarized reached from the polarized side: both halves of the
    # density with a quarter of sigma each has to give the same answer as
    # the total, which is what says the two were wired in the same order.
    half = reshape([0.25, 0.25], 2, 1)
    quarter = reshape([0.075, 0.075, 0.075], 3, 1)
    @test energy_density(f, half, quarter)[1] ≈
          energy_density(f, reshape([0.5], 1, 1), reshape([0.3], 1, 1))[1] rtol=1e-12

    # And the potentials come back with a spin axis of the right width.
    terms = potential_terms(f, rho, sigma)
    @test size(terms.Vρ) == (2, 1)
    @test size(terms.Vσ) == (3, 1)
end

@testset "a meta-GGA's potential through the interface" begin
    # What DFTK asks an implementation for, and the one family the
    # interface's own generic path does not reach. The shape is the one
    # DFTK writes for Libxc in DispatchFunctional.jl:129-152: rho and the
    # potentials carry (spin, point), sigma carries its three pseudo-spin
    # components, and the result is a NamedTuple whose e is the energy per
    # unit volume rather than per particle.
    #
    # The numbers come from xc_exc_vxc, so they are Libxc's own slots:
    # vrho is already d(rho zk)/d rho, which is what Vrho means here, and
    # the other three are rho_total times a derivative of zk. Taking them
    # from there rather than differentiating `energy` generically is what
    # keeps one path to each number, and it is the path the suite already
    # compares against the vendored library component by component.
    rho = reshape([0.5], 1, 1)
    sigma = reshape([0.3], 1, 1)
    tau = reshape([0.15], 1, 1)
    lapl = reshape([0.02], 1, 1)

    m = LibXcDerivative.dft_functional(:mgga_x_scan)
    t = potential_terms(m, rho, sigma, tau)
    slots = xc_exc_vxc(mgga_x_scan, 0.5, 0.3, 0.0, 0.15)
    @test t.e[1] ≈ 0.5 * slots.zk rtol=1e-14
    @test t.Vρ[1, 1] ≈ slots.vrho rtol=1e-14
    @test t.Vσ[1, 1] ≈ slots.vsigma rtol=1e-14
    @test t.Vτ[1, 1] ≈ slots.vtau rtol=1e-14
    # No Laplacian slot for a meta-GGA that does not take one, as the
    # family's field set says.
    @test !(:Vl in keys(t))

    # And against the vendored library, which is the check that the
    # conventions above are Libxc's and not this package's reading of them.
    ref = Libxc.evaluate(Libxc.Functional(:mgga_x_scan); rho, sigma, tau,
                         lapl = reshape([0.0], 1, 1), derivatives = 0:1)
    @test t.e[1] ≈ only(ref.zk) * 0.5 rtol=1e-9
    @test t.Vρ[1, 1] ≈ only(ref.vrho) rtol=1e-9
    @test t.Vσ[1, 1] ≈ only(ref.vsigma) rtol=1e-9
    @test t.Vτ[1, 1] ≈ only(ref.vtau) rtol=1e-9

    # The energy agrees with the scalar `energy` the extension already
    # supplied, so the two ways in do not answer differently.
    @test t.e[1] ≈ DftFunctionals.energy(m, 0.5, 0.3, 0.15) rtol=1e-14
    @test energy_density(m, rho, sigma, tau)[1] ≈ t.e[1] rtol=1e-14

    # Spin-polarized: the widths are the interface's, two rho channels and
    # three sigma components, and the potentials come back per channel.
    rho2 = reshape([0.3, 0.2], 2, 1)
    sigma2 = reshape([0.12, 0.05, 0.08], 3, 1)
    tau2 = reshape([0.09, 0.06], 2, 1)
    t2 = potential_terms(m, rho2, sigma2, tau2)
    @test size(t2.e) == (1,)
    @test size(t2.Vρ) == (2, 1)
    @test size(t2.Vσ) == (3, 1)
    @test size(t2.Vτ) == (2, 1)
    s2 = xc_exc_vxc(mgga_x_scan, (0.3, 0.2), (0.12, 0.05, 0.08), (0.0, 0.0),
                    (0.09, 0.06))
    @test t2.e[1] ≈ 0.5 * s2.zk rtol=1e-14
    @test all(isapprox(t2.Vρ[i, 1], s2.vrho[i]; rtol=1e-14) for i in 1:2)
    @test all(isapprox(t2.Vσ[i, 1], s2.vsigma[i]; rtol=1e-14) for i in 1:3)
    @test all(isapprox(t2.Vτ[i, 1], s2.vtau[i]; rtol=1e-14) for i in 1:2)

    # A functional that wants the Laplacian gets the fifth slot, and the
    # argument order is the interface's (rho, sigma, tau, lapl) rather
    # than the one the entry points take.
    ml = LibXcDerivative.dft_functional(:mgga_x_br89)
    tl = potential_terms(ml, rho, sigma, tau, lapl)
    @test keys(tl) == (:e, :Vρ, :Vσ, :Vτ, :Vl)
    sl = xc_exc_vxc(mgga_x_br89, 0.5, 0.3, 0.02, 0.15)
    @test tl.e[1] ≈ 0.5 * sl.zk rtol=1e-14
    @test tl.Vl[1, 1] ≈ sl.vlapl rtol=1e-14
    @test tl.Vτ[1, 1] ≈ sl.vtau rtol=1e-14

    # Several points at once, which is what a grid is.
    rhos = reshape([0.3, 0.5, 0.8], 1, 3)
    sigmas = reshape([0.1, 0.3, 0.6], 1, 3)
    taus = reshape([0.1, 0.15, 0.2], 1, 3)
    tg = potential_terms(m, rhos, sigmas, taus)
    @test size(tg.e) == (3,)
    @test size(tg.Vρ) == (1, 3)
    for i in 1:3
        one = xc_exc_vxc(mgga_x_scan, rhos[1, i], sigmas[1, i], 0.0, taus[1, i])
        @test tg.Vρ[1, i] ≈ one.vrho rtol=1e-14
    end

    # Below the density threshold the answer is zero, as the interface's
    # own fallbacks do and as the scalar energies here already did.
    tiny = reshape([1e-40], 1, 1)
    @test potential_terms(m, tiny, sigma, tau).e[1] == 0.0
end
