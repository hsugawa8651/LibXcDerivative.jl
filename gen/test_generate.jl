#!/usr/bin/env julia
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

# Unit tests for gen/generate.jl's helper functions: specifically
# sanitize_indexed_params, whose collision-detection and pattern-scoping
# behavior had no test coverage of its own; the two prior bugs it fixes/could
# reintroduce (silent collision, wrong-object substitution keys breaking the
# rename entirely) were only ever caught by generating lda_c_pw and noticing
# the numeric mismatch, not by a targeted test. Run with:
#   cd gen && julia --project=. test_generate.jl

using Test
using TOML
# agreement_for and shipped_exc reach into the shipped corpus by name, the way
# generate_mixes.jl does. generate.jl itself does not load the package (a
# generating run has to read the corpus it just wrote, in a later process),
# so the caller brings it, and here that is this file.
using LibXcDerivative

include("generate.jl")  # main() is guarded, so this only defines functions/constants

# Read before any testset runs, because testsets below regenerate lda_x in
# place: a baseline read inside one of them would be whatever the last run
# wrote, which turns a comparison against the shipped file into a comparison
# of one run against another.
const SHIPPED_LDA_X_PATH = joinpath(GENERATED_DIR, "lda_exc", "lda_x.jl")
const SHIPPED_LDA_X = read(SHIPPED_LDA_X_PATH)

@testset "gen/generate.jl helpers" begin

    @testset "natural_lt" begin
        @test sort(["a_2", "a_10", "a_1"]; lt=natural_lt) == ["a_1", "a_2", "a_10"]
        @test sort(["a", "b", "aa"]; lt=natural_lt) == ["a", "aa", "b"]
    end

    setup_python_path!()
    sp = pyimport("sympy")

    @testset "sanitize_indexed_params: normal case renames and preserves value" begin
        a0 = sp.Symbol("params_a_a[0]", real=true)
        rs = sp.Symbol("rs", positive=true)
        expr = a0 * rs
        cleaned = sanitize_indexed_params(expr)
        names = Set(String(s.name) for s in cleaned.free_symbols)
        @test names == Set(["params_a_a_0", "rs"])
    end

    @testset "sanitize_indexed_params: unrelated bracket-containing symbols untouched" begin
        # Not Libxc's own `params_a_*[N]` convention: must be left alone,
        # not silently rewritten by a global "any bracket" rule.
        weird = sp.Symbol("foo[bar]", real=true)
        expr = weird * sp.Symbol("rs", positive=true)
        cleaned = sanitize_indexed_params(expr)
        @test "foo[bar]" in Set(String(s.name) for s in cleaned.free_symbols)
    end

    @testset "sanitize_indexed_params: collision raises, does not silently merge" begin
        # params_a_x[1] and a genuinely distinct pre-existing params_a_x_1
        # both sanitize/already are "params_a_x_1": must error, not merge
        # two different parameters into one.
        clashing = sp.Symbol("params_a_x[1]", real=true)
        preexisting = sp.Symbol("params_a_x_1", real=true)
        expr = clashing + preexisting
        @test_throws ErrorException sanitize_indexed_params(expr)
    end

    @testset "resolve_libxc_constants" begin
        rs = sp.Symbol("rs", positive=true)
        py_builtins = pyimport("builtins")
        # `.evalf()` returns a SymPy `Float` PyObject, not a raw Python
        # float; PyCall's automatic Float64 conversion doesn't reach
        # through SymPy's own numeric type, so go via Python's builtin
        # `float()` first.
        to_f64(x) = Float64(py_builtins.float(x))

        @testset "static M_* substitution" begin
            m3 = sp.Symbol("M_CBRT3", positive=true)
            resolved = resolve_libxc_constants(m3 * rs)
            @test Set(String(s.name) for s in resolved.free_symbols) == Set(["rs"])
            @test isapprox(to_f64((resolved / rs).evalf()), LIBXC_NUMERIC_CONSTANTS["M_CBRT3"])
        end

        @testset "auto-discovered pure-numeric constant (X2S)" begin
            x2s = sp.Symbol("X2S", positive=true)
            resolved = resolve_libxc_constants(x2s * rs)
            @test Set(String(s.name) for s in resolved.free_symbols) == Set(["rs"])
            lc = pyimport("libxc_codegen")
            expected = to_f64(lc.X2S.evalf())
            @test isapprox(to_f64((resolved / rs).evalf()), expected)
        end

        @testset "compound constant depending on M_* (X_FACTOR_C)" begin
            # Only becomes fully numeric after the M_* pass runs first;
            # regression-guards the two-pass ordering, not just that each
            # pass works in isolation.
            xfc = sp.Symbol("X_FACTOR_C", positive=true)
            resolved = resolve_libxc_constants(xfc * rs)
            @test Set(String(s.name) for s in resolved.free_symbols) == Set(["rs"])
        end

        @testset "placeholder that evaluates to itself stays a parameter (XC_EPSILON)" begin
            eps = sp.Symbol("XC_EPSILON", positive=true)
            resolved = resolve_libxc_constants(eps + rs)
            @test "XC_EPSILON" in Set(String(s.name) for s in resolved.free_symbols)
        end

        @testset "coincidental non-SymPy attribute name does not crash" begin
            # `helper` is a real libxc_codegen attribute (the @helper
            # decorator, a Python function, not a SymPy object): exercises the
            # isinstance(candidate, sp.Basic) guard: hasattr(lc, "helper") is
            # true, so without the guard this would crash trying to call
            # .free_symbols on a function instead of falling through to "leave
            # it as a parameter" like any other unresolvable symbol.
            weird = sp.Symbol("helper", positive=true)
            resolved = resolve_libxc_constants(weird + rs)
            @test "helper" in Set(String(s.name) for s in resolved.free_symbols)
        end

        @testset "genuinely unresolvable symbol left as a parameter, not an error" begin
            unknown = sp.Symbol("params_a_totally_made_up", real=true)
            resolved = resolve_libxc_constants(unknown + rs)
            @test "params_a_totally_made_up" in Set(String(s.name) for s in resolved.free_symbols)
        end
    end

    # lda_c_pk09 does not fail with an exception: it never returns, because
    # _deep_inline flattens Libxc's helper boundaries away and the shared
    # subexpressions they stood for get duplicated instead. Measured on that
    # functional: 73,946 tree operations, but only 452 *distinct*
    # subexpressions; the 762 KB string form is what sympy_to_symbolics then
    # chokes on (all earlier stages together finish in 43 s). Libxc's own C
    # output does not have this problem because Maple's codegen emits
    # temporaries. This is the same fix here: common subexpression
    # elimination.
    @testset "cse_decompose collapses repeated subexpressions" begin
        sp = pyimport("sympy")
        rs = sp.Symbol("rs", positive=true)
        z = sp.Symbol("z", real=true)
        # A deliberately repetitive expression standing in for the k_ud-into-
        # three-Q-functions pattern that blows lda_c_pk09 up: one non-trivial
        # subexpression reused several times, nested two deep.
        inner = sp.sin(rs * z) + sp.cos(rs / z)
        expr = inner^2 + inner^3 + (inner^2 + inner^3) / (1 + inner)

        replacements, body = cse_decompose(expr)

        @test !isempty(replacements)
        # Every temporary is named with the reserved prefix, so a collision
        # with a real Libxc parameter is impossible to introduce silently.
        @test all(startswith(n, CSE_TMP_PREFIX) for (n, _) in replacements)
        # Dependency order: a temporary may only reference the original free
        # symbols and temporaries defined before it.
        defined = Set{String}()
        for (n, e) in replacements
            for s in e.free_symbols
                nm = String(s.name)
                startswith(nm, CSE_TMP_PREFIX) && @test nm in defined
            end
            push!(defined, n)
        end
        # The body may only reference originals and defined temporaries.
        for s in body.free_symbols
            nm = String(s.name)
            startswith(nm, CSE_TMP_PREFIX) && @test nm in defined
        end
        # The whole point: the decomposed form is materially smaller than the
        # flattened tree it replaces.
        total = sp.count_ops(body) + sum(sp.count_ops(e) for (_, e) in replacements)
        @test total < sp.count_ops(expr)
    end

    @testset "with_dimension sets the dimension a functional declares, and restores it" begin
        # A 2D functional declares itself with define('xc_dimensions_2d') and
        # then calls the shared helpers (gga_exchange -> lda_x_spin), which
        # read DIMENSIONS / RS_FACTOR / LDA_X_FACTOR from libxc_codegen's
        # globals rather than taking them as arguments. Generated without
        # setting those globals first, a 2D functional comes out with 3D
        # constants, which does not fail, it answers with a number 0.76
        # times the right one (gga_x_2d_b86 against the pinned library).
        lc = pyimport("libxc_codegen")
        mod2 = pyimport("gga_exc.gga_x_2d_b86")
        mod3 = pyimport("gga_exc.gga_x_pbe")

        outside = string(lc.RS_FACTOR)
        inside = with_dimension(mod2) do
            @test Int(lc.DIMENSIONS) == 2
            # The module's own copy, taken by `from libxc_codegen import *`
            # before any of this, has to move too.
            @test string(mod2.RS_FACTOR) == string(lc.RS_FACTOR)
            string(lc.RS_FACTOR)
        end
        @test inside != outside
        @test string(lc.RS_FACTOR) == outside
        @test Int(lc.DIMENSIONS) == 3

        # A three-dimensional functional keeps what was already there.
        with_dimension(mod3) do
            @test Int(lc.DIMENSIONS) == 3
            @test string(lc.RS_FACTOR) == outside
        end

        # Restored even when the body throws, or the next functional
        # generated in the same process inherits the wrong dimension.
        @test_throws ErrorException with_dimension(() -> error("boom"), mod2)
        @test Int(lc.DIMENSIONS) == 3
        @test string(lc.RS_FACTOR) == outside
    end

    @testset "cse_decompose refuses to shadow an existing symbol" begin
        # Guards the one way this could go wrong silently: a functional whose
        # own parameters already use the reserved prefix.
        sp = pyimport("sympy")
        clash = sp.Symbol(CSE_TMP_PREFIX * "0")
        @test_throws ErrorException cse_decompose(clash + 1)
    end

    @testset "discover_functional_names" begin
        names = discover_functional_names("lda_exc")
        @test "lda_x" in names
        @test "lda_c_pw" in names
        @test issorted(names)
        # Soft bound, not an exact count: the pinned tree is at a fixed
        # commit today, but hardcoding the precise count would make this
        # test spuriously fail the next time the pin moves, harmlessly or
        # not.
        @test length(names) >= 40
        @test all(!occursin("__pycache__", n) for n in names)
    end

    @testset "generate_family isolates per-file failures" begin
        # lda_x is real (already generated/validated elsewhere; regenerating
        # it here is a harmless no-op) and one name is deliberately made up,
        # so this is really testing that one functional's failure to import
        # doesn't abort the batch or lose the successes around it.
        # This also exercises generate_one.jl for real: the default runner is
        # the subprocess one, so a name that cannot be imported reaches the
        # driver as a non-zero child exit rather than as a thrown exception.
        results = generate_family("lda_exc", ["rs", "z"];
            names=["lda_x", "this_name_does_not_exist_in_lda_exc"])
        @test [r.name for r in results] ==
              ["lda_x", "this_name_does_not_exist_in_lda_exc"]
        @test results[1].status == :ok
        @test results[2].status == :failed
        @test !isempty(results[2].message)  # the child's stderr was captured
        @test results[1].elapsed_s > 0
        # The child reports back the positional order it actually emitted;
        # the parent cannot know it otherwise, and the manifest records it.
        @test results[1].argnames == ["rs", "z"]
        @test !isempty(results[1].extra_params)
        @test "zeta_threshold" in results[1].extra_params
    end

    @testset "run_with_timeout kills a command that outlives its budget" begin
        # The mechanism, tested on plain shell commands rather than on a real
        # generation so it costs a second rather than a minute.
        #
        # Why a subprocess at all: an in-process time limit is not
        # implementable here. A blocking ccall (which is what a PyCall descent
        # into SymPy is) stalls Julia's scheduler outright, so neither an
        # InterruptException delivered to the task nor a watchdog task polling
        # istaskdone can run until the call returns on its own (a 6 s ccall
        # ignored both, and a 2 s timedwait in another task did not get to
        # fire until the 6 s were up). Raising the thread count would let the
        # watchdog observe the overrun but still not cancel it. Killing a
        # separate process is the only way to actually reclaim the time.
        status, elapsed = run_with_timeout(`sleep 30`, 1.0)
        @test status == :timeout
        @test elapsed < 10.0  # killed at the budget, not waited out

        @test first(run_with_timeout(`true`, 30.0)) == :ok
        @test first(run_with_timeout(`false`, 30.0)) == :failed
    end

    @testset "error_excerpt keeps the reason a child failed with" begin
        # A child julia prints `ERROR: LoadError: <reason>` first and the stack
        # trace after it. Keeping the tail of a long stderr, which is what the
        # batch driver did, keeps the trace and drops the reason: two gga_exc
        # functionals were left unclassified in the manifest that way.
        reason = "ERROR: LoadError: Unsupported expression head: macrocall"
        trace = join(("  [$i] frame_$i at /some/path/file.jl:$i" for i in 1:400), "\n")
        long = reason * "\nStacktrace:\n" * trace
        @test length(long) > 4000

        excerpt = error_excerpt(long, 4000)
        @test startswith(excerpt, reason)
        @test length(excerpt) <= 4000 + length(ERROR_EXCERPT_MARKER)

        # Whatever the child printed before failing (warnings, precompilation
        # notices) must not crowd the reason out either.
        noise = join(("┌ Warning: something unrelated $i" for i in 1:300), "\n")
        @test length(noise) > 4000
        @test startswith(error_excerpt(noise * "\n" * long, 4000), reason)

        # Output that fits is kept whole.
        @test error_excerpt("ERROR: short", 4000) == "ERROR: short"

        # With no ERROR line there is nothing to anchor on, so both ends survive.
        plain = "first line\n" * repeat("x", 10_000) * "\nlast line"
        plain_excerpt = error_excerpt(plain, 4000)
        @test startswith(plain_excerpt, "first line")
        @test endswith(plain_excerpt, "last line")
        @test length(plain_excerpt) <= 4000 + length(ERROR_EXCERPT_MARKER)
    end

    @testset "generate_family: one timeout does not abort the batch" begin
        # The bookkeeping, with the generation itself stubbed out: what has to
        # hold is that a functional which times out is recorded as such and the
        # batch still reaches the functionals after it. Before this, the driver
        # could only distinguish success from a thrown error, and a hang was
        # neither: it simply never returned (lda_c_pk09, before CSE).
        seen = String[]
        budgets = Float64[]
        stub = function (family, name, argnames; timeout_s)
            push!(seen, name)
            push!(budgets, timeout_s)
            status = name == "slow_one" ? :timeout : :ok
            message = status == :timeout ? "exceeded $(timeout_s) s" : ""
            return GenerationResult(family, name, status, 0.0, message)
        end

        results = generate_family("lda_exc", ["rs", "z"];
            names=["fast_a", "slow_one", "fast_b"], runner=stub)

        @test seen == ["fast_a", "slow_one", "fast_b"]
        @test [r.status for r in results] == [:ok, :timeout, :ok]
        @test results[2].name == "slow_one"
        @test !isempty(results[2].message)
        # The budget reaches the runner, and defaults to DEFAULT_TIMEOUT_S when
        # the caller does not name one.
        @test all(==(DEFAULT_TIMEOUT_S), budgets)
        # Wide enough not to cut off a functional that would have finished:
        # gga_c_gapc takes 882 s and was refused at 600 s, although nothing
        # was wrong with it.
        @test DEFAULT_TIMEOUT_S == 1800.0
    end

    @testset "generate_family honours the skip-list" begin
        # Two lda_exc functionals cannot be expressed as pure arithmetic at
        # all: int1/int2 are runtime numerical quadrature (xc_integrate), not
        # a closed form. generate_family used to regenerate them anyway on
        # every batch run, leaving the static audit test in test/runtests.jl
        # as the only thing standing between them and a red build: a
        # deliberate non-goal being caught as if it were a mistake, every
        # time. They belong in the driver, named, with the reason attached.
        for key in (("lda_exc", "lda_x_1d_exponential"), ("lda_exc", "lda_x_1d_soft"),
                    ("gga_exc", "gga_x_fd_lb94"))
            @test haskey(GENERATION_SKIPS, key)
            @test !isempty(GENERATION_SKIPS[key])
        end

        attempted = String[]
        stub = function (family, name, argnames; timeout_s)
            push!(attempted, name)
            return GenerationResult(family, name, :ok, 0.0, "")
        end
        results = generate_family("lda_exc", ["rs", "z"];
            names=["lda_x_1d_soft", "lda_x"], runner=stub)

        # Skipped means not even attempted, not "attempted and discarded".
        @test attempted == ["lda_x"]
        @test [r.status for r in results] == [:skipped, :ok]
        @test results[1].name == "lda_x_1d_soft"
        @test results[1].message == GENERATION_SKIPS[("lda_exc", "lda_x_1d_soft")]

        # And the file really is absent from the shipped package.
        for name in ("lda_x_1d_exponential", "lda_x_1d_soft")
            @test !isfile(joinpath(GENERATED_DIR, "lda_exc", "$name.jl"))
        end
    end

    @testset "write_manifest records what a batch run produced" begin
        # Until now a batch run only printed. Nothing recorded which
        # functionals exist, which upstream commit they came from, or (the
        # part that has already caused a silently wrong value once) what
        # positional argument order they were generated with.
        mktempdir() do dir
            path = joinpath(dir, "manifest.toml")
            write_manifest([
                GenerationResult("lda_exc", "lda_x", :ok, 12.5, "";
                    argnames=["rs", "z"],
                    extra_params=["dens_threshold", "params_a_alpha", "zeta_threshold"]),
                GenerationResult("lda_exc", "lda_x_1d_soft", :skipped, 0.0,
                    "runtime quadrature, not a closed form"),
                GenerationResult("lda_exc", "lda_c_w20", :timeout, 600.0,
                    "killed after exceeding the 600.0 s budget"),
            ]; path=path)

            m = TOML.parsefile(path)
            entry = m["lda_exc"]["lda_x"]
            @test entry["status"] == "ok"
            @test entry["args"] ==
                  ["rs", "z", "dens_threshold", "params_a_alpha", "zeta_threshold"]
            @test entry["argnames"] == ["rs", "z"]
            @test entry["elapsed_s"] == 12.5
            @test occursin(r"^[0-9a-f]{40}$", entry["upstream_commit"])
            @test !isempty(entry["generated_at"])

            @test m["lda_exc"]["lda_x_1d_soft"]["status"] == "skipped"
            @test occursin("quadrature", m["lda_exc"]["lda_x_1d_soft"]["message"])
            @test m["lda_exc"]["lda_c_w20"]["status"] == "timeout"

            # A batch over one family must not erase what another recorded.
            write_manifest([GenerationResult("gga_exc", "gga_x_pbe", :ok, 3.0, "";
                argnames=["rs", "z", "xt", "xs0", "xs1"])]; path=path)
            m2 = TOML.parsefile(path)
            @test haskey(m2["lda_exc"], "lda_x")
            @test m2["gga_exc"]["gga_x_pbe"]["status"] == "ok"

            # Re-running one functional updates its entry rather than adding a
            # second one.
            write_manifest([GenerationResult("lda_exc", "lda_x", :failed, 1.0, "boom")];
                path=path)
            m3 = TOML.parsefile(path)
            @test m3["lda_exc"]["lda_x"]["status"] == "failed"
            @test length(m3["lda_exc"]) == 3
        end
    end

    @testset "generate_family writes the manifest as it goes" begin
        # A sweep over a family runs for tens of minutes. If it is interrupted
        # (or if the machine is) what already completed has to still be on
        # disk, or the next run starts from nothing.
        mktempdir() do dir
            path = joinpath(dir, "manifest.toml")
            stub = function (family, name, argnames; timeout_s)
                if name == "third"
                    # Written before this functional started, not at the end.
                    m = TOML.parsefile(path)
                    @test haskey(m[family], "first")
                    @test haskey(m[family], "second_raises")
                end
                name == "second_raises" && error("this functional blew up")
                return GenerationResult(family, name, :ok, 1.0, ""; argnames=argnames)
            end

            generate_family("lda_exc", ["rs", "z"];
                names=["first", "second_raises", "third"], runner=stub,
                manifest_path=path)

            m = TOML.parsefile(path)
            @test m["lda_exc"]["first"]["status"] == "ok"
            @test m["lda_exc"]["second_raises"]["status"] == "failed"
            @test m["lda_exc"]["third"]["status"] == "ok"
        end
    end

    @testset "a skipped functional is recorded, not just printed" begin
        # A skip leaves no file behind, so the manifest is the only place the
        # decision can be read back from. The first real batch to include one
        # left it out: the skip branch returned early and jumped over the
        # manifest write, which neither the skip test (it checks the returned
        # results) nor the manifest test (it calls write_manifest directly)
        # could see: only a full run, counting entries, showed 43 where 45
        # were expected.
        mktempdir() do dir
            path = joinpath(dir, "manifest.toml")
            stub = (family, name, argnames; timeout_s) ->
                GenerationResult(family, name, :ok, 1.0, ""; argnames=argnames)
            generate_family("lda_exc", ["rs", "z"];
                names=["lda_x_1d_soft", "lda_x"], runner=stub, manifest_path=path)

            m = TOML.parsefile(path)
            @test m["lda_exc"]["lda_x_1d_soft"]["status"] == "skipped"
            @test occursin("quadrature", m["lda_exc"]["lda_x_1d_soft"]["message"])
            @test m["lda_exc"]["lda_x"]["status"] == "ok"
        end
    end

    @testset "generate_family runs functionals concurrently when asked" begin
        # Generating one functional is a separate process that spends its time
        # in SymPy, so a family sweep is embarrassingly parallel: 129 gga_exc
        # functionals at 20-70 s each is one to two hours in sequence and
        # minutes across cores.
        peak = Ref(0)
        live = Ref(0)
        lk = ReentrantLock()
        stub = function (family, name, argnames; timeout_s)
            lock(lk) do
                live[] += 1
                peak[] = max(peak[], live[])
            end
            sleep(0.05)
            lock(lk) do; live[] -= 1; end
            name == "boom" && error("this one failed")
            return GenerationResult(family, name, :ok, 0.05, ""; argnames=argnames)
        end

        names = ["f$i" for i in 1:8]
        push!(names, "boom")
        results = generate_family("lda_exc", ["rs", "z"];
            names=names, runner=stub, parallel=4)

        @test peak[] > 1              # actually overlapped
        @test peak[] <= 4             # and stayed within the budget asked for
        # Order follows the input, not completion, so a run is comparable to
        # the one before it.
        @test [r.name for r in results] == names
        # One failure still does not take the batch down.
        @test results[end].status == :failed
        @test all(r -> r.status == :ok, results[1:8])

        # The default stays sequential: a maintainer running this by hand on a
        # laptop should not have every core taken without asking.
        peak[] = 0
        generate_family("lda_exc", ["rs", "z"]; names=names[1:4], runner=stub)
        @test peak[] == 1
    end

    @testset "shipped_names lists what src/generated already holds" begin
        # A plain rerun regenerates what is already shipped rather than
        # attempting the whole family: a family ships only some of its upstream
        # sources, and refreshing the manifest must not silently turn into a
        # sweep of all of them.
        #
        # Nothing here pins how many files a family ships. That number grows
        # every time a family is swept, and a list frozen at one point in time
        # failed as soon as five more gga_exc functionals were added.
        names = shipped_names("lda_exc")
        @test "lda_x" in names
        @test "lda_c_pw" in names
        @test !("lda_x_1d_soft" in names)
        @test issorted(names)
        @test length(names) < length(discover_functional_names("lda_exc"))

        gga = shipped_names("gga_exc")
        @test issorted(gga)
        @test "gga_x_pbe" in gga
        @test "gga_x_pbepow" in gga
        # Every shipped file stands for an upstream source; a stray file does not.
        @test issubset(gga, discover_functional_names("gga_exc"))
        @test length(gga) < length(discover_functional_names("gga_exc"))

        @test shipped_names("no_such_family") == String[]
    end

    @testset "generation is not left at the mercy of Python's hash seed" begin
        # Regenerating the shipped set produced a diff in exactly one file
        # (lda_c_vwn) with an unchanged signature and unchanged
        # arithmetic: sympy.cse had numbered and ordered its temporaries
        # differently. The cause is Python's per-process hash randomization,
        # which reorders iteration over the sets cse works through.
        #
        # Measured on lda_c_vwn: four unseeded runs produced two distinct
        # files (one outlier); two runs with PYTHONHASHSEED=0 produced
        # identical ones. That is also why this checks the seed is fixed
        # rather than generating twice and comparing: an every-time test of
        # a sometimes-failure would be flaky in exactly the direction that
        # teaches people to rerun it.
        #
        # What the fixed seed buys: regenerating and finding no diff becomes a
        # statement about the upstream sources, instead of one about hash
        # seeds that has to be re-read every batch to learn it means nothing.
        cmd = child_command("lda_exc", "lda_x", ["rs", "z"], tempname())
        @test cmd.env !== nothing
        @test "PYTHONHASHSEED=0" in cmd.env
    end

    @testset "a shipped file regenerates into the same bytes" begin
        # README.md beside this file says the shipped set regenerates byte
        # for byte. Nothing made that claim fail when it stopped being true:
        # the suite the package ships includes nothing from gen/, and the
        # seed test above pins an input to reproducibility rather than the
        # result of it.
        #
        # The generation runs in a child, as a batch runs it, because the
        # seed has to be fixed for the comparison to mean anything; calling
        # generate_functional here would inherit whichever seed this process
        # drew. lda_x is the cheapest shipped functional to regenerate.
        #
        # Generation writes in place, so the shipped bytes are put back
        # afterwards: a run that does not reproduce leaves the finding in the
        # assertion rather than in the working tree. The baseline is the
        # constant read at the top of this file, not the file as it stands
        # here, which an earlier testset has already regenerated.
        try
            result = generate_one_subprocess("lda_exc", "lda_x", ["rs", "z"])
            @test result.status === :ok
            @test read(SHIPPED_LDA_X_PATH) == SHIPPED_LDA_X
        finally
            write(SHIPPED_LDA_X_PATH, SHIPPED_LDA_X)
        end
    end

    @testset "parameter defaults come from the initialised params struct" begin
        # The C external-parameter names and the generated params_a_* names
        # are different naming systems, not spellings of one: lda_xc_th_fl is
        # `_w[0..3]` on one side and params_a_omega_0..3 on the other,
        # lda_c_pz is `_gamma0` against params_a_a_0. There is no rule to
        # discover, and for lda_x and lda_k_tf there is no external parameter
        # at all: the value is assigned in <name>_init.
        #
        # What does hold is that a generated name's suffix is the C struct's
        # field name: `double hl_r[2], hl_c[2]` against params_a_hl_r_0 and
        # params_a_hl_c_0. So the struct is read as declared, from the
        # instance xc_func_init already filled in, and whatever produced a
        # value (an init constant, a copied external default, something
        # derived from one) is beside the point.
        @test params_struct_fields("lda_x_params") == [("alpha", Int[])]
        @test params_struct_fields("lda_c_hl_params") == [("hl_r", [2]), ("hl_c", [2])]
        @test params_struct_fields("lda_xc_th_fl_params") == [("omega", [4])]

        # The range-separation parameters come back for every functional, so
        # what is checked here is the struct-derived part. resolved_defaults
        # keeps only what a kernel actually takes, so the extras never reach a
        # generated file.
        struct_part(d) = filter(kv -> startswith(kv.first, "params_a_"), d)

        @test struct_part(libxc_params("lda_exc", "lda_x")) ==
              Dict("params_a_alpha" => 1.0)

        hl = struct_part(libxc_params("lda_exc", "lda_c_hl"))
        @test hl["params_a_hl_r_0"] == 21.0
        @test hl["params_a_hl_c_0"] == 0.0225
        @test length(hl) == 4

        th = struct_part(libxc_params("lda_exc", "lda_xc_th_fl"))
        @test th["params_a_omega_0"] ≈ -1.06141
        @test length(th) == 4

        # And the filtering really happens: lda_x's kernel takes no
        # cam_omega, so its defaults do not carry one.
        @test !haskey(resolved_defaults("lda_exc", "lda_x",
                                        ["dens_threshold", "params_a_alpha",
                                         "zeta_threshold"]), "cam_omega")

        # cam_omega is a range-separation parameter and lives on xc_func_type
        # beside the thresholds, not in the functional's own params struct,
        # so reading the struct alone leaves five functionals demanding it.
        @test libxc_params("lda_exc", "lda_x_erf")["cam_omega"] == 0.3
        @test libxc_params("lda_exc", "lda_c_pw_erf")["cam_omega"] == 0.5

        # Refused rather than guessed at, where guessing would produce
        # numbers: lda_c_epc18 is a kernel shared by variants that differ *in
        # their parameters*, so there is no single answer to read.
        @test libxc_params("lda_exc", "lda_c_epc18") === nothing
    end

    @testset "XC_EPSILON and XC_MIN get their values from the pinned headers" begin
        # Both are C macros in libxc (libxc-upstream/src/util.h:312,315:
        # DBL_EPSILON and DBL_MIN), left as kernel arguments rather than
        # substituted (see resolve_libxc_constants). Without a default, every
        # functional that uses one demanded it from the caller although libxc
        # offers no way to change it: 11 of the gga_exc family did.
        extra = ["XC_EPSILON", "XC_MIN", "dens_threshold", "zeta_threshold"]
        d = resolved_defaults("gga_exc", "gga_c_op_b88", extra)
        @test d["XC_EPSILON"] === eps(Float64)
        @test d["XC_MIN"] === floatmin(Float64)
        @test !("XC_EPSILON" in required_params("gga_exc", "gga_c_op_b88", extra))
        # Only what the kernel takes is returned, as for every other default.
        @test !haskey(resolved_defaults("gga_exc", "gga_c_op_b88", ["dens_threshold"]),
                      "XC_EPSILON")
    end

    @testset "a shim older than its source is rebuilt" begin
        # build_pinned_libxc used to skip the build whenever the shim existed,
        # so an accessor added to libxc_shim.c never reached the library the
        # generator loads, and calling it failed only at lookup time.
        mktempdir() do dir
            lib, shim, src = joinpath.(dir, ("libxc.so", "shim.so", "shim.c"))
            for f in (lib, src, shim)
                touch(f)
                sleep(0.01)   # distinct mtimes, in this order
            end
            @test pinned_build_current(lib, shim, src)
            sleep(0.01)
            touch(src)
            @test !pinned_build_current(lib, shim, src)
            rm(shim)
            @test !pinned_build_current(lib, shim, src)
        end
    end

    @testset "thresholds come from the pinned libxc, not a different version" begin
        # Libxc.jl vendors 7.0.0; the pinned tree these expressions come from
        # is
        # 7.1.2. Reading defaults from the former put the numbers and the
        # formulas they belong to on different versions, and that is not
        # hypothetical: the two disagree outright on lda_x_rel and
        # lda_c_1d_loos, and 7.0.0 lacks five of the functionals shipped here.
        @test pinned_libxc_version() == (7, 1, 2)

        # dens_threshold is per functional and the spread is wide. Checking
        # one value would pass for an implementation that hardcoded a
        # constant, which is the mistake available here.
        @test libxc_thresholds("lda_x").dens_threshold == 1e-15
        @test libxc_thresholds("lda_c_wigner").dens_threshold == 1e-24
        @test libxc_thresholds("gga_x_pbepow").dens_threshold == 1e-12
        # Reachable only in 7.1.2, and a fourth distinct value.
        @test libxc_thresholds("lda_c_rpaf").dens_threshold == 1e-32

        # zeta_threshold is DBL_EPSILON for every functional
        # (libxc-upstream/src/functionals.c:366).
        for name in ("lda_x", "lda_c_wigner", "lda_c_rpaf", "lda_c_1d_css")
            @test libxc_thresholds(name).zeta_threshold === eps(Float64)
        end

        # All five that 7.0.0 lacked are readable, including the two whose
        # own name is not a registered functional at all: their Python source
        # is a kernel shared by numbered variants: XC_LDA_C_EPC18_1 and _2
        # (lda_c_epc18.c:11-12), XC_LDA_XC_1D_EHWLRG_1 through _3
        # (lda_xc_1d_ehwlrg.c:13-15). The variants differ by their
        # parameters, which is why those stay required, but they agree on
        # thresholds, so the thresholds are well defined and worth having.
        for name in ("lda_c_1d_css", "lda_c_rpaf", "lda_xc_th_fl",
                     "lda_c_epc18", "lda_xc_1d_ehwlrg")
            @test libxc_thresholds(name) !== nothing
        end
        @test libxc_thresholds("lda_c_epc18").dens_threshold == 1e-15
        @test libxc_thresholds("lda_xc_1d_ehwlrg").dens_threshold == 1e-32

        # Reading a shared kernel's thresholds from a variant is only sound
        # while the variants agree, so the lookup checks rather than assumes:
        # given a name whose variants disagreed it would refuse, not pick one.
        @test variant_names("lda_c_epc18") == ["lda_c_epc18_1", "lda_c_epc18_2"]
        @test variant_names("lda_xc_1d_ehwlrg") ==
              ["lda_xc_1d_ehwlrg_1", "lda_xc_1d_ehwlrg_2", "lda_xc_1d_ehwlrg_3"]
        @test isempty(variant_names("lda_x"))  # a registered name has no variants to search
    end

    # The printer replaces the SymPy -> Symbolics.jl -> build_function round
    # trip. These pin the three properties the round trip used to provide,
    # which are the ones generated code depends on: NaNMath lowering (the
    # domain-safety contract), Libxc's own function names, and exact
    # rationals. Written before the printer existed.
    @testset "print_julia: NaNMath lowering (domain-safety contract)" begin
        x = sp.Symbol("x", real=true)
        @test occursin("NaNMath.sqrt", print_julia(sp.sqrt(x)))
        @test occursin("NaNMath.log", print_julia(sp.log(x)))

        # A non-integer exponent must not reach Julia's `^`, which throws a
        # DomainError for a negative base where C's pow returns NaN.
        frac = print_julia(x^sp.Rational(3, 2))
        @test occursin("NaNMath.pow", frac)

        # An integer exponent is left as `^`: Julia raises a negative base to
        # an integer power without complaint, and `^` is the faster path.
        sq = print_julia(x^2)
        @test occursin("x ^ 2", sq) || occursin("x^2", sq)
        @test !occursin("NaNMath.pow", sq)
    end

    @testset "print_julia: scalar output, no broadcasting dots" begin
        x = sp.Symbol("x", real=true)
        y = sp.Symbol("y", real=true)
        text = print_julia(x * y / (x + y) + x^3)
        @test !occursin(".*", text)
        @test !occursin("./", text)
        @test !occursin(".^", text)
    end

    @testset "print_julia: Libxc's own names survive printing" begin
        x = sp.Symbol("x", real=true)
        lc = pyimport("libxc_codegen")
        # The names reach the printer already spelled the way Libxc spells
        # them (the Maple translation in libxc-upstream/python emits
        # xc_log1p and friends as SymPy Functions), so the map the printer
        # resolves has to be keyed on what `atoms(Function)` actually
        # contains: not on the bare Julia/Base name.
        @test occursin("xc_log1p(", print_julia(lc.xc_log1p(x)))
        @test occursin("my_piecewise3(", print_julia(lc.my_piecewise3(x < 0, 0, x)))
    end

    @testset "print_julia: an unknown function is refused, not mis-printed" begin
        x = sp.Symbol("x", real=true)
        unknown = sp.Function("lxs_not_a_libxc_name")(x)
        # Silently printing it would produce a kernel that fails with
        # UndefVarError at its first call instead of at generation time.
        @test_throws Exception print_julia(unknown)
    end

    # Libxc evaluates 163 of its functionals by mixing others rather than from
    # a kernel of their own, and the recipe (which functionals, with which
    # coefficients) is readable through the shim. These pin what the reader
    # has to get right, written before it existed.
    # The parameter struct is read as a flat run of doubles, in the order the
    # C declares the fields. `const double` is the same run (const says
    # nothing about the layout), but the reader only accepted `double`, and
    # that one word is why 30 Libxc identifiers could not be called: nine
    # structs, all of the Minnesota family, declare their arrays const.
    @testset "params_struct_fields reads a const double struct" begin
        @test params_struct_fields("mgga_c_m08_params") ==
              [("m08_a", [12]), ("m08_b", [12])]
        @test params_struct_fields("mgga_x_mn12_params") == [("c", [40])]
        # Mixed const and non-const in one struct, and a scalar after arrays.
        @test params_struct_fields("mgga_c_m05_params") ==
              [("gamma_ss", Int[]), ("gamma_ab", Int[]), ("css", [5]),
               ("cab", [5]), ("Fermi_D_cnst", Int[])]
        # Still refused when the first field is not a double: the offsets of
        # the fields after it need a layout model this does not have, and
        # reading one of them as a double would hand back a reinterpreted int.
        @test params_struct_fields("hyb_gga_xc_case21_params") === nothing  # int k, int Nsp
    end

    # A struct whose doubles come first and whose int comes after them is
    # readable as far as that run: the struct starts at offset 0 and a double
    # is eight bytes aligned to eight, so the k-th leading double is at 8k
    # whatever follows it. lda_c_1d_css is the one kernel this reaches, and
    # the twenty parameters its expression takes are exactly that run.
    @testset "params_struct_fields reads the leading run of doubles" begin
        # `double para[10], ferro[10];` then `int interaction; double bb;`
        # (lda_c_1d_css.c:16-21): the int ends the run, and bb, which comes
        # after it, is left unread.
        @test params_struct_fields("lda_c_1d_css_params") ==
              [("para", [10]), ("ferro", [10])]

        # And the values are the row css_set_ext_params picks for the
        # published default (interaction = 1, bb = 1.0): par_para[8] and
        # par_ferro[0] (lda_c_1d_css.c:31,36).
        p = libxc_params("lda_exc", "lda_c_1d_css")
        @test p !== nothing
        @test p["params_a_para_0"] == 18.40
        @test p["params_a_para_9"] == 4.424
        @test p["params_a_ferro_0"] == 5.24
        @test p["params_a_ferro_8"] == 1.56e-5
        # Read, not assumed to be readable: the expression takes twenty
        # parameters and none is left for the caller.
        @test isempty(required_params("lda_exc", "lda_c_1d_css",
                                      String[String(s) for s in
                                             LibXcDerivative.lda_c_1d_css_required]))
    end

    # A two-dimensional field has to keep its shape. The upstream python
    # declares `double b[2][5]` row by row (params_a_b_0_ and params_a_b_1_,
    # each a list of five), so the expression carries params_a_b_0__0 and the
    # reader has to produce those names rather than a flat params_a_b_0 ...
    # params_a_b_9. Collapsing the shape to a count is what held lda_xc_ksdt
    # and gga_x_n12 back, six Libxc identifiers between them.
    @testset "params_struct_fields keeps a two-dimensional shape" begin
        @test params_struct_fields("lda_xc_ksdt_params") ==
              [("T", Int[]), ("thetaParam", Int[]), ("b", [2, 5]),
               ("c", [2, 3]), ("d", [2, 5]), ("e", [2, 5])]
        @test params_struct_fields("gga_x_n12_params") == [("CC", [4, 4])]
    end

    @testset "param_names spells each shape the way the expression does" begin
        @test param_names("alpha", Int[]) == ["params_a_alpha"]
        @test param_names("hl_r", [2]) == ["params_a_hl_r_0", "params_a_hl_r_1"]
        # Row-major, which is both C's layout and the order the rows are
        # declared in: b[0][0..4] then b[1][0..4].
        @test param_names("b", [2, 3]) ==
              ["params_a_b_0__0", "params_a_b_0__1", "params_a_b_0__2",
               "params_a_b_1__0", "params_a_b_1__1", "params_a_b_1__2"]
        # However many entries the shape has, that many names.
        @test length(param_names("CC", [4, 4])) == 16
    end

    @testset "mix_recipe reads what Libxc mixes" begin
        r = mix_recipe("hyb_gga_xc_b3lyp")
        @test r !== nothing
        @test r.has_coefficients
        @test last.(r.components) ==
              ["lda_x", "gga_x_b88", "lda_c_vwn_rpa", "gga_c_lyp"]
        # The coefficients come back as Libxc computed them, not as the
        # paper's round numbers: 0.08 is 1 - 0.92 there and arrives as
        # 0.08000000000000007. Pinned to the bits rather than to the intent,
        # because writing the tidy value into a generated functional would
        # make it disagree with the library it is checked against.
        @test first.(r.components) ==
              [0.08000000000000007, 0.72, 0.18999999999999995, 0.81]
        @test first(r.components[1]) != 0.08
    end

    # A mixed functional's components do not keep their own defaults: Libxc
    # overrides their external parameters from the parent's. Reading those is
    # what takes the mixes from 90 reproducing the library to 147.
    @testset "mix_overrides reads what the parent changed in its components" begin
        over = mix_overrides("hyb_gga_xc_cam_pbeh")
        @test over !== nothing
        # Only the range-separation parameter differs, and only for the
        # short-range component: 0.7 against that functional's own 0.11.
        @test over == [Dict{String,Float64}(),
                       Dict("cam_omega" => 0.7),
                       Dict{String,Float64}()]
        # One entry per component, in the same order as the recipe.
        @test length(over) == length(mix_recipe("hyb_gga_xc_cam_pbeh").components)
    end

    @testset "mix_overrides: a mix that changes nothing reports nothing" begin
        # B3LYP's components are used as they come.
        @test all(isempty, mix_overrides("hyb_gga_xc_b3lyp"))
        @test mix_overrides("gga_x_pbe") === nothing   # not a mix at all
    end

    @testset "mix_recipe: a functional Libxc does not mix has no recipe" begin
        @test mix_recipe("gga_x_pbe") === nothing
        @test mix_recipe("lda_x") === nothing
        # Not in the pinned library at all.
        @test mix_recipe("lxs_not_a_functional") === nothing
    end

    @testset "mix_recipe: a mix whose coefficients Libxc does not store says so" begin
        # A nonzero n_func_aux does not imply mix_coef: Libxc leaves it NULL
        # for the functionals whose own C code combines the components, and
        # reading it unguarded segfaults. The nine in that state are all M06
        # correlation. The components are still readable; the weights are not.
        r = mix_recipe("mgga_c_m06")
        @test r !== nothing
        @test !r.has_coefficients
        @test !isempty(r.components)
        # Reported as missing rather than as zero, which would silently
        # generate a functional that returns 0.
        @test all(isnan, first.(r.components))
    end

    # mix_coef is the library's own switch for whether an auxiliary takes
    # part at all: gga.c:159 and mgga.c:289 call xc_mix_func only when it is
    # set, so a functional that leaves it NULL is evaluated from its kernel
    # alone however many auxiliaries it carries. Measured for the nine below:
    # given the parameters the library's own initialised struct holds for
    # each, mgga_c_m06l reproduces every one of them, between exactly and
    # 5.9e-14 over rho = 0.05, 0.5, 5.0.
    @testset "a variant whose auxiliary the library never applies is emitted" begin
        manifest = TOML.parsefile(MANIFEST_PATH)
        extra_of(family, kernel) = begin
            e = manifest[family][kernel]
            String[a for a in e["args"] if !(a in e["argnames"])]
        end
        @test sort(emitted_variants("mgga_exc", "mgga_c_m06l",
                                    extra_of("mgga_exc", "mgga_c_m06l"))) ==
              ["mgga_c_m06", "mgga_c_m06_2x", "mgga_c_m06_hf", "mgga_c_m06_l",
               "mgga_c_m06_sx", "mgga_c_pi_m06_2x", "mgga_c_pi_m06_2x_dl",
               "mgga_c_revm06", "mgga_c_revm06_l"]
        # A variant the library really does mix stays out: hyb_gga_xc_hflyp
        # carries one auxiliary with mix_coef set, so gga_c_lyp is one piece
        # of its answer rather than the answer.
        @test !("hyb_gga_xc_hflyp" in
                emitted_variants("gga_exc", "gga_c_lyp",
                                 extra_of("gga_exc", "gga_c_lyp")))
    end
    @testset "print_julia: a rational too wide for Int64 prints exactly" begin
        # gga_x_pw91's series coefficient. The round trip could not carry
        # this (Julia parses a literal that wide as an @int128_str macro
        # call, which sympy_to_symbolics rejects), which is what
        # protect_wide_rationals worked around; printing has no such step.
        wide = sp.Rational(29393, big"113267782428181659648")
        text = print_julia(wide)
        @test occursin("29393", text)
        @test occursin("113267782428181659648", text)
        value = eval(Meta.parse(text))
        @test value isa Rational
        @test numerator(value) == 29393
        @test denominator(value) == big"113267782428181659648"
    end


    @testset "agreement_for measures this package against the pinned library" begin
        # The durable record of agreement is against the library Libxc.jl
        # vendors, because that is what the test suite can call. Comparing
        # against the pinned library (the one the expressions were generated
        # from) by hand, and writing the result up in prose, invites two
        # mistakes this function removes: stating a hold against the wrong
        # library, and placing a relative figure beside an absolute bound.
        #
        # Keyed by Libxc's own output name, not by a derivative order: "order
        # 1" means vrho for an energy functional and the potential itself for
        # a *_vxc one, and that ambiguity is what the naming avoids.
        r = agreement_for("lda_exc", "lda_x")
        @test haskey(r, "lda_x")
        for slot in ("zk", "vrho", "v2rho2")
            @test haskey(r["lda_x"], slot)
            # Three figures: the absolute difference, that difference over the
            # largest value the slot takes in the sweep, and the worst
            # per-point ratio. Recording one of them is how a relative 1.3e-9
            # came to be compared with atol=1e-10, and recording only the
            # scaled one is optimistic by up to a measured 71x where a slot is
            # small at one point and large at another (agreement_figures).
            @test length(r["lda_x"][slot]) == 3
            @test all(isfinite, r["lda_x"][slot])
            @test all(>=(0.0), r["lda_x"][slot])
            # The pointwise ratio divides the same difference by a value no
            # larger than the scaled one does, so it is never below it.
            @test r["lda_x"][slot][3] >= r["lda_x"][slot][2]
        end
        # lda_x is the simplest exchange functional there is; anything above
        # rounding here means the measurement itself is wrong.
        @test r["lda_x"]["zk"][1] < 1e-12
        @test r["lda_x"]["vrho"][1] < 1e-12
        @test r["lda_x"]["v2rho2"][1] < 1e-12

        # A kernel several functionals are built on reports one table per
        # callable name, so a variant's agreement is not hidden behind its
        # kernel's.
        rv = agreement_for("gga_exc", "gga_x_pbe")
        @test haskey(rv, "gga_x_pbe")
        @test length(keys(rv)) >= 2

        # The *_vxc families have no zk to compare: Libxc reports no
        # XC_FLAGS_HAVE_EXC for them, and asking for an energy there is what
        # aborts the library.
        rp = agreement_for("gga_vxc", "gga_x_lb")
        @test !haskey(rp["gga_x_lb"], "zk")
        @test haskey(rp["gga_x_lb"], "vrho")
        @test rp["gga_x_lb"]["vrho"][1] < 1e-12

        # And the measurement has to be able to report a real disagreement,
        # not only agreement: gga_c_wi is one of the functionals upstream
        # corrected after 7.0.0, so against the pinned library it agrees while
        # the vendored one differs. Both halves are asserted, because a
        # measurement that cannot come out large would pin nothing.
        rw = agreement_for("gga_exc", "gga_c_wi")
        @test rw["gga_c_wi"]["zk"][1] < 1e-12
    end


    @testset "the derivative table Libxc builds eagerly is made lazy" begin
        # Helper.__init__ differentiates a helper's body up to _GEN_MAX_ORDER,
        # which is 4 by default. Libxc needs that table: it keeps helpers
        # opaque in the big expression, its fdiff walks the multi-index table
        # instead of differentiating the body, and it emits a C function per
        # index. This package does the opposite (_deep_inline expands every
        # helper into one expression and ForwardDiff differentiates that in
        # Julia), so it pays for a table it almost never reads.
        #
        # "Almost": three functionals do take one derivative of a helper, and
        # declining the table outright made them fail with KeyError((1, 0)).
        # So the table is built lazily instead, which ensure_order supports by
        # construction (it is incremental).
        #
        # What this cost before, as the manifest records it: gga_c_gapc took
        # 1411.3 s and comes out in 1.8 s, and one sequential run through main
        # regenerated all 287 entries in 40 minutes of wall clock, median 4.0 s
        # a kernel against 7.2 s before.
        setup_python_path!()
        lc = pyimport("libxc_codegen")
        @test lc._GEN_MAX_ORDER == 0
        # The inliner is ours, not the one the pinned tree ships. Asserted so
        # that moving the pin to a commit that renames or moves it fails here
        # rather than silently restoring the slow path.
        @test py"hasattr(__import__('libxc_codegen')._deep_inline, 'lxs_lazy_inline')"

        # The behaviour that broke, pinned: a helper application whose
        # multi-index is non-zero still resolves, by growing the table.
        sp = pyimport("sympy")
        py"""
        import libxc_codegen as _lc, sympy as _sp
        x = _sp.Symbol("x", real=True)
        @_lc.helper
        def _lxs_probe(a):
            return a**3
        app = _lxs_probe(x)
        d1 = _sp.diff(app, x)              # a first derivative of a helper
        """
        # Compared in Python: a SymPy zero comes back to Julia as a PyObject,
        # and stringifying it to look for "0" compares the wrapper, not the
        # value, which is what the first version of this test did.
        py"""
        _lxs_v = _lc._deep_inline(app)
        _lxs_d = _lc._deep_inline(d1)
        """
        @test py"bool(_sp.simplify(_lxs_v - x**3) == 0)"
        # 3x^2, and reaching it needed the multi-index (1,), which the eager
        # table would have held and a table simply declined would not.
        @test py"bool(_sp.simplify(_lxs_d - 3*x**2) == 0)"
    end


    @testset "write_manifest keeps the agreement figures a run did not measure" begin
        # record_agreement! writes each name's distance from the pinned library
        # into the manifest, and write_manifest rebuilds every entry from the
        # results of the run that calls it, so a generating run dropped all
        # 280 agreement blocks on the floor. Caught by regenerating the whole
        # corpus and reading the diff: 525 zk, 532 vrho and 532 v2rho2 records
        # deleted, from a change that was supposed to touch six files.
        #
        # The figures are not this run's output. They are measured by a pass of
        # their own and have to survive one.
        mktempdir() do dir
            path = joinpath(dir, "manifest.toml")
            open(path, "w") do io
                print(io, """
                      [lda_exc.lda_x]
                      status = "ok"
                      elapsed_s = 1.0

                        [lda_exc.lda_x.agreement]
                        inputs = "rho in (0.05, 0.5, 5.0)"
                        libxc = "7.1.2"

                          [lda_exc.lda_x.agreement.lda_x]
                          zk = [1.0e-16, 2.0e-16]

                        [lda_exc.lda_x.high_agreement]
                        inputs = "rho in (0.05, 0.5, 5.0)"
                        libxc = "7.1.2 MAXORDER=4"

                          [lda_exc.lda_x.high_agreement.lda_x]
                          v4rho4 = [3.0e-16, 4.0e-16, 5.0e-16]
                      """)
            end
            write_manifest([GenerationResult("lda_exc", "lda_x", :ok, 2.0, "",
                                             ["rs", "z"], String[], String[], String[])];
                           path = path)
            back = TOML.parsefile(path)
            @test back["lda_exc"]["lda_x"]["elapsed_s"] == 2.0   # the run's own output moves
            @test haskey(back["lda_exc"]["lda_x"], "agreement")  # the measurement stays
            @test back["lda_exc"]["lda_x"]["agreement"]["libxc"] == "7.1.2"
            @test back["lda_exc"]["lda_x"]["agreement"]["lda_x"]["zk"] == [1.0e-16, 2.0e-16]
            # And the third and fourth derivatives, which are a second pass of
            # the same kind: 15 hours of measuring, dropped by a generating
            # run that preserved only the block it knew about.
            @test haskey(back["lda_exc"]["lda_x"], "high_agreement")
            @test back["lda_exc"]["lda_x"]["high_agreement"]["libxc"] ==
                  "7.1.2 MAXORDER=4"
            @test back["lda_exc"]["lda_x"]["high_agreement"]["lda_x"]["v4rho4"] ==
                  [3.0e-16, 4.0e-16, 5.0e-16]
        end
    end


    @testset "record_high_agreement! writes the orders a MAXORDER=2 build cannot" begin
        # The pass that fills the block above. Narrowed to one kernel, because
        # the corpus-wide run takes 15 hours: a name carries up to 55 slots at
        # the third and fourth order and each one is a fourth-order
        # ForwardDiff call to compile. lda_x carries two, v3rho3 and v4rho4.
        #
        # Narrowing has to be safe as well as fast. A run asked for one family
        # must leave every other family's records alone, or splitting the
        # corpus over several runs would erase all but the last.
        mktempdir() do dir
            path = joinpath(dir, "manifest.toml")
            open(path, "w") do io
                print(io, """
                      [lda_exc.lda_x]
                      status = "ok"
                      elapsed_s = 1.0

                      [gga_exc.gga_x_pbe]
                      status = "ok"
                      elapsed_s = 1.0

                        [gga_exc.gga_x_pbe.high_agreement]
                        inputs = "written by an earlier run"
                        libxc = "7.1.2 MAXORDER=4"

                          [gga_exc.gga_x_pbe.high_agreement.gga_x_pbe]
                          v4sigma4 = [1.0, 2.0, 3.0]
                      """)
            end
            n = record_high_agreement!(; path = path, families = ["lda_exc"],
                                       kernels = ["lda_x"])
            @test n >= 1
            back = TOML.parsefile(path)
            rec = back["lda_exc"]["lda_x"]["high_agreement"]
            @test rec["libxc"] == string(join(string.(pinned_libxc_version()), "."),
                                         " MAXORDER=4")
            @test haskey(rec, "measured_at")
            @test sort(collect(keys(rec["lda_x"]))) == ["v3rho3", "v4rho4"]
            for slot in ("v3rho3", "v4rho4")
                @test length(rec["lda_x"][slot]) == 3
                @test rec["lda_x"][slot][2] < 1e-12
            end
            # The family this run was not asked about keeps what it had.
            @test back["gga_exc"]["gga_x_pbe"]["high_agreement"]["gga_x_pbe"]["v4sigma4"] ==
                  [1.0, 2.0, 3.0]
            # And the lower-order block is a different record: this pass does
            # not touch it, so lda_x has none here.
            @test !haskey(back["lda_exc"]["lda_x"], "agreement")
        end
    end


    @testset "the mixing parameters are read from the pinned library" begin
        # Libxc keeps a hybrid's exact-exchange fraction, its range-separation
        # parameters and the VV10 constants on xc_func_type rather than in any
        # kernel, so they are read from the pinned library here and written
        # into the package. Three classes, decided the way hybrids.c:20-32
        # decides them (the family for hybrid-ness, the
        # XC_FLAGS_HYB_CAM/CAMY/LC/LCY flags for range separation), and not
        # from the name: hyb_gga_xc_pbeh is a hybrid that is not
        # range-separated, and its name says neither way.
        ensure_pinned_libxc()

        glob = pinned_mixing_parameters("hyb_gga_xc_pbeh")
        @test glob.hybrid
        @test !glob.range_separated
        @test !glob.vv10
        # A global hybrid's fraction IS cam_alpha in Libxc; beta and omega
        # are zero, which is why the package layer has to tell "zero" from
        # "does not apply" rather than pass these on as they stand.
        @test glob.cam_alpha ≈ 0.25
        @test glob.cam_beta == 0.0
        @test glob.cam_omega == 0.0

        sr = pinned_mixing_parameters("hyb_gga_xc_hse_sol")
        @test sr.hybrid
        @test sr.range_separated
        @test sr.cam_omega ≈ 0.11
        @test sr.cam_beta ≈ 0.25
        @test sr.cam_alpha == 0.0

        nl = pinned_mixing_parameters("gga_xc_vv10")
        @test nl.vv10
        @test !nl.hybrid
        @test nl.nlc_b > 0
        @test nl.nlc_C > 0

        plain = pinned_mixing_parameters("gga_x_pbe")
        @test !plain.hybrid
        @test !plain.range_separated
        @test !plain.vv10

        # A name the library does not register has nothing to read.
        @test pinned_mixing_parameters("gga_x_not_a_functional") === nothing
    end


    @testset "xc_erfcx has a Julia name to print" begin
        # The last name gga_x_wpbeh needed. Its kernel is built out of the
        # omega-PBE exchange hole, which libxc_codegen writes with its own
        # xc_erfcx class, and the printer refuses a name it has no Julia
        # spelling for rather than emitting a call that would fail at the
        # kernel's first evaluation, which is exactly what it did here,
        # after 846.5 s of symbolic work.
        setup_python_path!()
        py"""
        import sympy as _sp, libxc_codegen as _lc
        _lxs_x = _sp.Symbol("x", real=True)
        _lxs_expr = _lc.xc_erfcx(_lxs_x) + 1
        """
        printed = py"__import__('julia_printer').print_julia(_lxs_expr)"
        @test occursin("xc_erfcx(x)", printed)
        # And it is a name the package defines, not one invented here.
        @test isdefined(LibXcDerivative, :xc_erfcx)
    end


    @testset "the facts a functional's caller needs are read from the library" begin
        # What an array-based interface has to know before it can call a
        # functional at all: which family it is in, whether it is exchange or
        # correlation, which arguments it reads, and whether it has an energy.
        # Libxc keeps all of it on xc_func_type, and none of it is reliably in
        # the name: mgga_x_scanl is deorbitalized SCAN, which reads the
        # Laplacian instead of tau, and nothing in "mgga_x_scanl" says so.
        ensure_pinned_libxc()

        lda = pinned_identifier_facts("lda_x")
        @test lda.family === :lda
        @test lda.kind === :x
        @test lda.has_exc
        @test !lda.needs_tau
        @test !lda.needs_laplacian

        gga = pinned_identifier_facts("gga_c_pbe")
        @test gga.family === :gga
        @test gga.kind === :c

        # A hybrid is reported in its hybrid family by Libxc; the interface
        # this feeds wants the underlying one, since what changes for a
        # hybrid is the mixing and not which arguments the semi-local part
        # reads.
        hyb = pinned_identifier_facts("hyb_gga_xc_hse06")
        @test hyb.family === :gga
        @test hyb.kind === :xc

        # tau and the Laplacian, which are the reason this is read rather
        # than parsed.
        mgga = pinned_identifier_facts("mgga_x_scan")
        @test mgga.family === :mgga
        @test mgga.needs_tau
        @test !mgga.needs_laplacian

        lapl = pinned_identifier_facts("mgga_x_scanl")
        @test lapl.needs_laplacian
        @test lapl.family === :mggal   # the family name the interface uses for it

        # A functional with no energy at all: the potential-only ones carry
        # no XC_FLAGS_HAVE_EXC, which is why they ship under a *_vxc name.
        @test !pinned_identifier_facts("gga_x_lb").has_exc
        @test pinned_identifier_facts("gga_x_lb").kind === :x

        # Kinetic, the fourth kind, which Libxc numbers 3.
        @test pinned_identifier_facts("lda_k_tf").kind === :k

        @test pinned_identifier_facts("gga_x_not_a_functional") === nothing
    end


    @testset "the name, flags and references Libxc carries per functional" begin
        # Libxc ships more about a functional than its arithmetic: a sentence
        # naming it, the flag set, and the papers to cite. The flags are read
        # already (pinned_identifier_facts picks five bits out); this reads
        # the rest, which has no second source: the citations are Libxc's
        # own bibliography and nothing in the SymPy sources carries them.
        ensure_pinned_libxc()

        scan = pinned_identifier_text("mgga_x_scan")
        @test scan.name == "SCAN exchange of Sun, Ruzsinszky, and Perdew"
        # Flags as symbols, Libxc's own spelling of each bit (xc.h:54-80).
        @test :needs_tau in scan.flags
        @test :dim3 in scan.flags
        @test :have_exc in scan.flags
        @test !(:needs_laplacian in scan.flags)
        # Which orders Libxc itself provides for this functional, read from a
        # MAXORDER=4 build.
        #
        # Not from the default build. XC_FLAGS_I_HAVE_KXC is defined to 0
        # when XC_MAXORDER < 3 (util.h:146), and MAPLE2C_FLAGS (which every
        # functional's info struct folds in) is generated with the build's
        # maxorder. So the HAVE_ bits of the MAXORDER=2 build this package
        # compares values against say what that build compiled, not what the
        # functional has. Read from there, every one of the 687 identifiers
        # came out (0,1,2) or (1,2), with nothing reporting a third or fourth
        # order at all: all-identical is the signature of a build ceiling,
        # which is the trap this project had already written down.
        @test scan.derivatives == [0, 1, 2, 3, 4]

        @test !isempty(scan.references)
        first_ref = first(scan.references)
        @test occursin("Sun", first_ref.reference)
        @test startswith(first_ref.doi, "10.")
        @test occursin("@article", first_ref.bibtex)
        @test !isempty(first_ref.key)

        # lda_x has the two 1920s papers Libxc cites for Slater exchange.
        lda = pinned_identifier_text("lda_x")
        @test length(lda.references) >= 2
        @test any(occursin("Dirac", r.reference) for r in lda.references)

        # A hybrid carries its own flags, which is how a caller tells a
        # Yukawa-screened one from an error-function-screened one.
        @test :hyb_camy in pinned_identifier_text("hyb_gga_xc_camy_b3lyp").flags
        @test :hyb_cam in pinned_identifier_text("hyb_gga_xc_hse06").flags

        # A potential-only functional says so in its flags: no energy.
        lb = pinned_identifier_text("gga_x_lb")
        @test !(:have_exc in lb.flags)
        @test :have_vxc in lb.flags
        # Not an empty list, which is what this test asked for first: Libxc
        # provides its potential and the orders above and no zeroth one. The
        # absence of 0 is exactly what makes these functionals special, and it
        # is more legible here than in a flag name.
        @test lb.derivatives == [1, 2, 3, 4]
        @test 0 ∉ lb.derivatives
        @test 0 in pinned_identifier_text("lda_x").derivatives

        # And a genuine ceiling, told apart from the build's: hyb_gga_xc_hse06
        # stops at 2 in the MAXORDER=4 build as well, because gga_x_wpbeh has
        # no third derivative. That distinction is the whole reason this is
        # read from the order-4 build.
        @test pinned_identifier_text("hyb_gga_xc_hse06").derivatives == [0, 1, 2]
        @test pinned_identifier_text("gga_x_wpbeh").derivatives == [0, 1, 2]

        @test pinned_identifier_text("gga_x_not_a_functional") === nothing
    end

end
