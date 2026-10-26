# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

# The parameters as a vector: what a caller fitting a functional needs, and
# the one shape of that call which the compiler can see through.
#
# A NamedTuple's names are part of its type, so `params = (a = q[1], b = q[2])`
# costs nothing over passing no parameters at all. Building the same tuple
# with names the compiler does not have -- `NamedTuple{own}(Tuple(q))` for an
# `own` that is a runtime value -- costs seven to thirteen times the call, and
# a gradient over it up to four times what the same gradient costs otherwise.
# These three functions are the shape that is free, written once.

@testset "the parameters, as a vector the compiler can see through" begin
    @testset "param_names lists a functional's own parameters" begin
        # Thresholds and machine constants are not parameters of the
        # functional: nobody fits dens_threshold.
        @test param_names(gga_x_pbe) == (:params_a_kappa, :params_a_mu)
        @test param_names(lda_x) == (:params_a_alpha,)
        @test param_names(mgga_x_scan) ==
              (:params_a_c1, :params_a_c2, :params_a_d, :params_a_k1)
        @test length(param_names(lda_xc_ksdt)) == 38

        # A mix's entry point takes no `params` at all: its weights are
        # literals in the expression the generator writes.
        @test param_names(hyb_gga_xc_b3lyp) == ()
        # And a functional whose numbers are literals has none either, which
        # is a different reason for the same answer.
        @test param_names(lda_c_vwn) == ()

        # A parameter with no default is still a parameter. Both of these
        # are kernels shared by variants that differ in their parameters, so
        # there is no single set to read and the entry point demands them.
        @test param_names(lda_c_epc18) == (:params_a_a, :params_a_b, :params_a_c)
        @test param_names(lda_xc_1d_ehwlrg) ==
              (:params_a_a1, :params_a_a2, :params_a_a3, :params_a_alpha)
    end

    @testset "params_from rebuilds what a literal call would pass" begin
        d = gga_x_pbe_defaults
        @test params_from(gga_x_pbe, [1.0, 2.0]) ===
              (dens_threshold = d.dens_threshold, params_a_kappa = 1.0,
               params_a_mu = 2.0, zeta_threshold = d.zeta_threshold)
        # Handed the defaults back, it is the defaults.
        @test params_from(gga_x_pbe, [d.params_a_kappa, d.params_a_mu]) === d

        # The names are in the type, which is the whole point: the call is
        # inferred, so nothing about it is decided at run time.
        @test @inferred(params_from(gga_x_pbe, [1.0, 2.0])) isa
              NamedTuple{(:dens_threshold, :params_a_kappa, :params_a_mu,
                          :zeta_threshold)}
        # A vector of duals goes through, which is what a gradient needs.
        @test params_from(gga_x_pbe, ForwardDiff.Dual.([1.0, 2.0], 1.0)).params_a_kappa isa
              ForwardDiff.Dual

        # A length that does not match refuses: reading past the end or
        # dropping the tail would both produce a plausible wrong number.
        @test_throws ArgumentError params_from(gga_x_pbe, [1.0])
        @test_throws ArgumentError params_from(gga_x_pbe, [1.0, 2.0, 3.0])
        # A parameter with no default is filled from the vector too, so the
        # entry point's own check passes.
        @test lda_c_epc18(0.5; params = params_from(lda_c_epc18, [1.0, 2.0, 3.0])) ==
              lda_c_epc18(0.5; params = (params_a_a = 1.0, params_a_b = 2.0,
                                         params_a_c = 3.0))
    end

    @testset "param_point is where a fit starts from" begin
        d = gga_x_pbe_defaults
        @test param_point(gga_x_pbe) == [d.params_a_kappa, d.params_a_mu]
        @test param_point(gga_x_pbe, (params_a_mu = 0.3,)) == [d.params_a_kappa, 0.3]
        # Round trip: the vector it hands out is the vector params_from takes.
        @test params_from(gga_x_pbe, param_point(gga_x_pbe)) === d
        # A name that is not a parameter of this functional is refused, and a
        # threshold is not a parameter.
        @test_throws ArgumentError param_point(gga_x_pbe, (params_a_kapa = 0.8,))
        @test_throws ArgumentError param_point(gga_x_pbe, (dens_threshold = 1e-10,))
        # With no default there is nothing to start from until it is given.
        @test_throws ArgumentError param_point(lda_c_epc18)
        @test param_point(lda_c_epc18, (params_a_a = 1.0, params_a_b = 2.0,
                                        params_a_c = 3.0)) == [1.0, 2.0, 3.0]
    end
end

@testset "the parameter entry points name themselves when they refuse" begin
    # Each of these refuses something that is not a generated entry point,
    # and the message says which of them refused: they share one helper, and
    # a caller holding only the message cannot otherwise tell.
    for entry in (param_names, param_defaults, param_point)
        err = try
            entry(sin)
            nothing
        catch e
            e
        end
        @test err isa ArgumentError
        msg = sprint(showerror, err)
        @test occursin(string(nameof(entry)), msg)
        @test occursin("sin", msg)
    end

    # params_from takes a vector as well, so it is asked with one.
    err = try
        params_from(sin, [1.0])
        nothing
    catch e
        e
    end
    @test err isa ArgumentError
    @test occursin("params_from", sprint(showerror, err))

    # None of them names the helper that builds the message.
    for entry in (param_names, param_defaults, param_point)
        err = try
            entry(sin)
            nothing
        catch e
            e
        end
        @test !occursin("_layout_or_reject", sprint(showerror, err))
        @test !occursin("_reject_not_an_entry_point", sprint(showerror, err))
    end

    # What they do take still answers.
    @test param_names(gga_x_pbe) == (:params_a_kappa, :params_a_mu)
    @test param_point(gga_x_pbe) isa Vector{Float64}
end
