# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

# Builds of the pinned Libxc sources, and the comparison of what this package
# ships against them.
#
# Separate from gen/generate.jl because the two need different things.
# Generating reads Libxc's SymPy sources through PyCall, so it needs a working
# Python with SymPy; comparing reads the generated Julia files and calls a
# compiled Libxc, and needs neither. Keeping them in one file made a broken
# Python install enough to stop anyone verifying anything, and made the
# reftest environment carry PyCall for no reason.
#
# Nothing here imports PyCall, and that is the property worth keeping: the
# reftest entry point includes this file and nothing else from gen/.
#
# Included by gen/generate.jl, which defines HERE and GENERATED_DIR before
# doing so, and by reftest/compare.jl, which defines them itself.

"""
    MANIFEST_PATH

Where the record of generated functionals lives. Under `src/`, not `gen/`,
because it ships with the package and `test/runtests.jl` reads it as a gate:
what the generator says it emitted has to match what the generated files
actually declare.
"""
const MANIFEST_PATH = joinpath(GENERATED_DIR, "manifest.toml")

# The suffix a family's entry point carries: the potential-only families
# ship <name>_vxc, the rest ship <name>.
entry_suffix(family::AbstractString) = endswith(family, "_vxc") ? "_vxc" : ""
# What this file needs for itself, rather than relying on whoever includes
# it: that is the point of the split, and reftest/compare.jl includes nothing
# else from gen/.
using Dates          # Dates.dateformat"..." is a macro, so the module is needed
using TOML
using LibXcDerivative

"""
    PINNED_BUILD_DIR

Where a libxc built from `gen/libxc-upstream` lands. A build product, not
committed; rebuilding it is one command.
"""
const PINNED_BUILD_DIR = joinpath(HERE, "build")
# Not ".dylib": that is only right on macOS, and the generator has no reason
# to be.
const _DLEXT = Base.Libc.Libdl.dlext
const PINNED_LIB = joinpath(PINNED_BUILD_DIR, "libxc", "libxc.$(_DLEXT)")
const PINNED_SHIM = joinpath(PINNED_BUILD_DIR, "libxc_shim.$(_DLEXT)")

"""
    PINNED_LIB_ORDER4

The same pinned sources built with `MAXORDER=4`, used only to read a
functional's derivative orders.

It has to be a second build. `XC_FLAGS_I_HAVE_KXC` is defined to 0 when
`XC_MAXORDER < 3` (`libxc-upstream/src/util.h:146`), and `MAPLE2C_FLAGS`
(which every functional's info struct folds into its flags) is generated with
the build's own maxorder. So the `HAVE_` bits of the default `MAXORDER=2`
build report what that build compiled and not what the functional has: read
from there, all 687 identifiers came out `(0,1,2)` or `(1,2)`, with nothing
reporting a third or fourth order anywhere. All-identical across a corpus is
the signature of a build ceiling rather than a property, and this package had
already written that trap down once.

Values are still compared against the `MAXORDER=2` build, which is what the
rest of the generator and the test suite use. This one answers one question.
"""
const PINNED_LIB_ORDER4 = joinpath(PINNED_BUILD_DIR, "libxc-order4",
                                   "libxc.$(_DLEXT)")

"""
    build_pinned_libxc_order4(; rebuild=false) -> String

Build the pinned sources with `MAXORDER=4` if that build is not there, and
return its library path. See [`PINNED_LIB_ORDER4`](@ref) for why it exists.
"""
function build_pinned_libxc_order4(; rebuild::Bool=false)
    if !rebuild && isfile(PINNED_LIB_ORDER4)
        return PINNED_LIB_ORDER4
    end
    src = joinpath(HERE, "libxc-upstream")
    builddir = joinpath(PINNED_BUILD_DIR, "libxc-order4")
    mkpath(builddir)
    @info "building libxc with MAXORDER=4 (a few minutes)" builddir
    run(`cmake -S $src -B $builddir -DCMAKE_BUILD_TYPE=Release
         -DBUILD_SHARED_LIBS=ON -DENABLE_FORTRAN=OFF -DBUILD_TESTING=OFF
         -DMAXORDER=4`)
    run(`cmake --build $builddir --parallel`)
    return PINNED_LIB_ORDER4
end

"""
    libxc_flag_bits(name) -> Int or nothing

`name`'s flag word from the `MAXORDER=4` build, through Libxc's public
`xc_func_info_get_flags` so that no shim is needed.

From that build rather than the default one because five of the twenty bits
are the `XC_FLAGS_HAVE_*` set, and `util.h:146-152` defines the `KXC` and
`LXC` ones to 0 below the matching maxorder. Read from the `MAXORDER=2` build
the corpus reports `have_kxc` and `have_lxc` for nothing at all.

Two bits this cannot make honest. `XC_FLAGS_ON_DEVICE` and
`XC_FLAGS_ON_HOST` come from a default in `libxc-upstream/src/func_info.c:14-16` chosen by
whether Libxc was built with CUDA or HIP: not by anything about the
functional, so every functional here carries `on_host` and none carries
`on_device`. `XC_FLAGS_STABLE` is declared in `xc.h` and set by nothing in
the sources, so no functional carries it; that zero is correct rather than a
ceiling.
"""
function libxc_flag_bits(name::AbstractString)
    isfile(PINNED_LIB_ORDER4) || build_pinned_libxc_order4()
    num = ccall((:xc_functional_get_number, PINNED_LIB_ORDER4), Cint, (Cstring,), name)
    num < 0 && return nothing
    p = ccall((:xc_func_alloc, PINNED_LIB_ORDER4), Ptr{Cvoid}, ())
    try
        ccall((:xc_func_init, PINNED_LIB_ORDER4), Cint,
              (Ptr{Cvoid}, Cint, Cint), p, num, 1)
        info = ccall((:xc_func_get_info, PINNED_LIB_ORDER4), Ptr{Cvoid},
                     (Ptr{Cvoid},), p)
        return Int(ccall((:xc_func_info_get_flags, PINNED_LIB_ORDER4), Cint,
                         (Ptr{Cvoid},), info))
    finally
        ccall((:xc_func_end, PINNED_LIB_ORDER4), Cvoid, (Ptr{Cvoid},), p)
        ccall((:xc_func_free, PINNED_LIB_ORDER4), Cvoid, (Ptr{Cvoid},), p)
    end
end

"""
    pinned_build_current(lib, shim, shim_source) -> Bool

Whether the built library and shim can be used as they are: both exist, and
the shim is not older than the source it was compiled from. Without the age
check, an accessor added to `libxc_shim.c` would never reach an existing
build.
"""
pinned_build_current(lib, shim, shim_source) =
    isfile(lib) && isfile(shim) && mtime(shim) >= mtime(shim_source)

"""
    build_pinned_libxc(; rebuild=false) -> (lib, shim)

Build libxc from the pinned tree, plus the small accessor shim in
`gen/libxc_shim.c`, and return the two library paths. A no-op once they
exist and the shim is current (`pinned_build_current`). Called once by
`main`; `ensure_pinned_libxc` only checks.

**Why not Libxc.jl.** It vendors libxc 7.0.0 and the pinned tree these
expressions are generated from is 7.1.2, so reading defaults from it puts
the numbers and the formulas they belong to on different versions. That is
not hypothetical: the two versions disagree outright on `lda_x_rel` and
`lda_c_1d_loos`, and 7.0.0 does not have five of the functionals shipped
here at all.

The pinned tree builds out of the box and needs no Python codegen: the
generated C kernels are committed under `libxc-upstream/src/maple2c/`.
"""
function build_pinned_libxc(; rebuild::Bool=false)
    if !rebuild && pinned_build_current(PINNED_LIB, PINNED_SHIM,
                                        joinpath(HERE, "libxc_shim.c"))
        return (PINNED_LIB, PINNED_SHIM)
    end
    src = joinpath(HERE, "libxc-upstream")
    builddir = joinpath(PINNED_BUILD_DIR, "libxc")
    mkpath(builddir)
    @info "building libxc from the pinned tree (a few minutes)" builddir
    run(`cmake -S $src -B $builddir -DCMAKE_BUILD_TYPE=Release
         -DBUILD_SHARED_LIBS=ON -DENABLE_FORTRAN=OFF -DBUILD_TESTING=OFF`)
    run(`cmake --build $builddir --parallel`)
    # Compiled against the headers the library was built from, so the field
    # offsets it reads cannot drift from it.
    # -rpath as well as -L: the library records its install name as
    # @rpath/libxc.N.dylib, so without it dlopen searches the loading
    # process's paths (Julia's lib/julia) and fails there.
    run(`cc -shared -fPIC -O2 -I$(joinpath(src, "src")) -I$builddir/src -I$builddir
         $(joinpath(HERE, "libxc_shim.c")) -o $PINNED_SHIM
         -L$builddir -Wl,-rpath,$builddir -lxc`)
    return (PINNED_LIB, PINNED_SHIM)
end

"""
    pinned_libxc_version() -> (major, minor, micro)

The version of the library `ensure_pinned_libxc` built, which is the pinned
tree's own.
"""
function pinned_libxc_version()
    ensure_pinned_libxc()
    a, b, c = Ref{Cint}(0), Ref{Cint}(0), Ref{Cint}(0)
    # ccall needs a global for the library expression, so the const paths are
    # named directly; ensure_pinned_libxc above is what makes them exist.
    ccall((:xc_version, PINNED_LIB), Cvoid, (Ptr{Cint}, Ptr{Cint}, Ptr{Cint}), a, b, c)
    return (Int(a[]), Int(b[]), Int(c[]))
end

"""
    ensure_pinned_libxc() -> (lib, shim)

Check that the pinned library is built, and say what to run if it is not.

Deliberately not a build: this is called from lookups like
`libxc_thresholds`, and a lookup that quietly starts a multi-minute CMake
run is a surprise in the wrong direction. `main` builds it up front.
"""
function ensure_pinned_libxc()
    if !pinned_build_current(PINNED_LIB, PINNED_SHIM, joinpath(HERE, "libxc_shim.c"))
        error("""
              the pinned libxc is not built yet, or its shim is older than
              gen/libxc_shim.c, so no default can be read from it. Build it with:

                  julia --project=gen -e 'include("gen/generate.jl"); build_pinned_libxc()'

              or just run the generator, which builds it before generating.
              """)
    end
    return (PINNED_LIB, PINNED_SHIM)
end

"""
    with_pinned_functional(f, name, nspin=1)

Initialise `name` in the pinned library, hand the pointer to `f`, and clean
up after it. Returns `nothing` if even that library does not have the
functional.
"""
function with_pinned_functional(f, name::AbstractString, nspin::Integer=1)
    ensure_pinned_libxc()
    id = ccall((:xc_functional_get_number, PINNED_LIB), Cint, (Cstring,), name)
    id < 0 && return nothing
    p = ccall((:xc_func_alloc, PINNED_LIB), Ptr{Cvoid}, ())
    p == C_NULL && error("xc_func_alloc failed")
    try
        rc = ccall((:xc_func_init, PINNED_LIB), Cint, (Ptr{Cvoid}, Cint, Cint),
                   p, id, nspin)
        rc == 0 || error("xc_func_init failed for $name (rc=$rc)")
        try
            return f(p)
        finally
            ccall((:xc_func_end, PINNED_LIB), Cvoid, (Ptr{Cvoid},), p)
        end
    finally
        ccall((:xc_func_free, PINNED_LIB), Cvoid, (Ptr{Cvoid},), p)
    end
end

const AGREEMENT_POINTS = [(rho, 0.1rho, 0.05rho, 0.3rho) for rho in (0.05, 0.5, 5.0)]
const AGREEMENT_INPUTS = "rho in (0.05, 0.5, 5.0); sigma = 0.1 rho; " *
                         "lapl = 0.05 rho; tau = 0.3 rho"

"""
    agreement_slots(family) -> Tuple

Which of Libxc's outputs this family can be compared on.

Keyed by Libxc's own output names rather than by a derivative order, because
the order means different things in the two kinds of family: for an energy
functional `vrho` is the first derivative of `rho * zk`, and for a `*_vxc`
one it is the expression itself. Naming the output leaves nothing to infer.

The `*_vxc` families have no `zk`: Libxc reports no `XC_FLAGS_HAVE_EXC` for
them, and asking the library for an energy there aborts the process.
"""
agreement_slots(family::AbstractString) =
    endswith(family, "_vxc") ? ("vrho", "v2rho2") : ("zk", "vrho", "v2rho2")

"""
    pinned_slots(family, name, rho, sigma, lapl, tau) -> Dict or nothing

Libxc's own `zk`, `vrho` and `v2rho2` at one point, from the library built
from the pinned tree. `nothing` if that library does not have `name`.

The default build stops at `MAXORDER=2`, which is why this reaches `v2rho2`
and no further. Going higher would mean rebuilding it, and the build the
generator checks against is deliberately left alone.
"""
function pinned_slots(family::AbstractString, name::AbstractString,
                      rho::Real, sigma::Real, lapl::Real, tau::Real)
    out = Dict{String,Float64}()
    done = with_pinned_functional(name) do p
        r, sg, l, t = Ref{Cdouble}(rho), Ref{Cdouble}(sigma), Ref{Cdouble}(lapl), Ref{Cdouble}(tau)
        z, vr, vs, vl, vt = (Ref{Cdouble}(0.0) for _ in 1:5)
        f = [Ref{Cdouble}(0.0) for _ in 1:10]
        if family == "lda_exc"
            ccall((:xc_lda_exc_vxc, PINNED_LIB), Cvoid,
                  (Ptr{Cvoid}, Csize_t, Ref{Cdouble}, Ref{Cdouble}, Ref{Cdouble}),
                  p, 1, r, z, vr)
            ccall((:xc_lda_fxc, PINNED_LIB), Cvoid,
                  (Ptr{Cvoid}, Csize_t, Ref{Cdouble}, Ref{Cdouble}), p, 1, r, f[1])
            out["zk"], out["vrho"], out["v2rho2"] = z[], vr[], f[1][]
        elseif family == "gga_exc"
            ccall((:xc_gga_exc_vxc, PINNED_LIB), Cvoid,
                  (Ptr{Cvoid}, Csize_t, Ref{Cdouble}, Ref{Cdouble}, Ref{Cdouble},
                   Ref{Cdouble}, Ref{Cdouble}), p, 1, r, sg, z, vr, vs)
            ccall((:xc_gga_fxc, PINNED_LIB), Cvoid,
                  (Ptr{Cvoid}, Csize_t, Ref{Cdouble}, Ref{Cdouble}, Ref{Cdouble},
                   Ref{Cdouble}, Ref{Cdouble}), p, 1, r, sg, f[1], f[2], f[3])
            out["zk"], out["vrho"], out["v2rho2"] = z[], vr[], f[1][]
        elseif family == "mgga_exc"
            ccall((:xc_mgga_exc_vxc, PINNED_LIB), Cvoid,
                  (Ptr{Cvoid}, Csize_t, Ref{Cdouble}, Ref{Cdouble}, Ref{Cdouble},
                   Ref{Cdouble}, Ref{Cdouble}, Ref{Cdouble}, Ref{Cdouble},
                   Ref{Cdouble}, Ref{Cdouble}), p, 1, r, sg, l, t, z, vr, vs, vl, vt)
            ccall((:xc_mgga_fxc, PINNED_LIB), Cvoid,
                  (Ptr{Cvoid}, Csize_t, Ref{Cdouble}, Ref{Cdouble}, Ref{Cdouble},
                   Ref{Cdouble}, Ref{Cdouble}, Ref{Cdouble}, Ref{Cdouble}, Ref{Cdouble},
                   Ref{Cdouble}, Ref{Cdouble}, Ref{Cdouble}, Ref{Cdouble}, Ref{Cdouble},
                   Ref{Cdouble}), p, 1, r, sg, l, t,
                  f[1], f[2], f[3], f[4], f[5], f[6], f[7], f[8], f[9], f[10])
            out["zk"], out["vrho"], out["v2rho2"] = z[], vr[], f[1][]
        elseif family == "lda_vxc"
            ccall((:xc_lda_vxc, PINNED_LIB), Cvoid,
                  (Ptr{Cvoid}, Csize_t, Ref{Cdouble}, Ref{Cdouble}), p, 1, r, vr)
            ccall((:xc_lda_fxc, PINNED_LIB), Cvoid,
                  (Ptr{Cvoid}, Csize_t, Ref{Cdouble}, Ref{Cdouble}), p, 1, r, f[1])
            out["vrho"], out["v2rho2"] = vr[], f[1][]
        elseif family == "gga_vxc"
            ccall((:xc_gga_vxc, PINNED_LIB), Cvoid,
                  (Ptr{Cvoid}, Csize_t, Ref{Cdouble}, Ref{Cdouble}, Ref{Cdouble},
                   Ref{Cdouble}), p, 1, r, sg, vr, vs)
            ccall((:xc_gga_fxc, PINNED_LIB), Cvoid,
                  (Ptr{Cvoid}, Csize_t, Ref{Cdouble}, Ref{Cdouble}, Ref{Cdouble},
                   Ref{Cdouble}, Ref{Cdouble}), p, 1, r, sg, f[1], f[2], f[3])
            out["vrho"], out["v2rho2"] = vr[], f[1][]
        elseif family == "mgga_vxc"
            ccall((:xc_mgga_vxc, PINNED_LIB), Cvoid,
                  (Ptr{Cvoid}, Csize_t, Ref{Cdouble}, Ref{Cdouble}, Ref{Cdouble},
                   Ref{Cdouble}, Ref{Cdouble}, Ref{Cdouble}, Ref{Cdouble}, Ref{Cdouble}),
                  p, 1, r, sg, l, t, vr, vs, vl, vt)
            ccall((:xc_mgga_fxc, PINNED_LIB), Cvoid,
                  (Ptr{Cvoid}, Csize_t, Ref{Cdouble}, Ref{Cdouble}, Ref{Cdouble},
                   Ref{Cdouble}, Ref{Cdouble}, Ref{Cdouble}, Ref{Cdouble}, Ref{Cdouble},
                   Ref{Cdouble}, Ref{Cdouble}, Ref{Cdouble}, Ref{Cdouble}, Ref{Cdouble},
                   Ref{Cdouble}), p, 1, r, sg, l, t,
                  f[1], f[2], f[3], f[4], f[5], f[6], f[7], f[8], f[9], f[10])
            out["vrho"], out["v2rho2"] = vr[], f[1][]
        else
            return nothing
        end
        return true
    end
    return done === nothing ? nothing : out
end

"""
    shipped_slots(family, name, rho, sigma, lapl, tau) -> Dict or nothing

This package's counterpart to each of those outputs, from the entry point
`name` ships under. `nothing` when nothing callable from a density alone
exists for it.

For an energy functional Libxc's `vrho` is the derivative of `rho * zk`, not
of `zk`, so that product is what is differentiated here. For a `*_vxc` one
the expression is already the potential, and one derivative of it is what
Libxc puts in the `v2rho2` slot.
"""
function shipped_slots(family::AbstractString, name::AbstractString,
                       rho::Real, sigma::Real, lapl::Real, tau::Real)
    entry = Symbol(name, entry_suffix(family))
    isdefined(LibXcDerivative, entry) || return nothing
    req = Symbol(entry, "_required")
    isdefined(LibXcDerivative, req) && !isempty(getfield(LibXcDerivative, req)) && return nothing
    f = getfield(LibXcDerivative, entry)
    call = startswith(family, "mgga") ? (x -> f(x, sigma, lapl, tau)) :
           startswith(family, "gga") ? (x -> f(x, sigma)) : (x -> f(x))
    out = Dict{String,Float64}()
    try
        if endswith(family, "_vxc")
            out["vrho"] = call(rho)
            out["v2rho2"] = ForwardDiff.derivative(call, rho)
        else
            out["zk"] = call(rho)
            g = x -> x * call(x)
            out["vrho"] = ForwardDiff.derivative(g, rho)
            out["v2rho2"] = ForwardDiff.derivative(y -> ForwardDiff.derivative(g, y), rho)
        end
    catch
        return nothing
    end
    return out
end

"""
    record_agreement!(; path=MANIFEST_PATH) -> Int

Measure every shipped name against the pinned library and write the figures
into the manifest, returning how many names were recorded.

A pass of its own rather than a step inside generation. Measuring costs about
0.2 s a name, two minutes for the corpus, where regenerating it takes hours;
and a pass that can be re-run on the corpus as it stands is the one worth
having after a change to the variable layer or the entry layer, neither of
which regenerates anything.

The caller must have the package loaded, as for `shipped_exc`: generate.jl
does not load it, because a generating run has to read the corpus it just
wrote in a later process.
"""
function record_agreement!(; path::AbstractString=MANIFEST_PATH)
    return _record_measure!("agreement", agreement_for;
                            path, libxc_note = "")
end

"""
    record_high_agreement!(; path=MANIFEST_PATH, families=nothing,
                           kernels=nothing) -> Int

Measure every shipped name's third and fourth derivatives against the
`MAXORDER=4` build and write the figures into the manifest under
`high_agreement`, the way [`record_agreement!`](@ref) does for the orders the
library Libxc.jl vendors can reach.

Per name, because at these orders a single corpus-wide bound cannot be had.
Swept over 530 names with a third or fourth derivative to compare, the three
families' medians span two decades (3.5e-15 for the LDAs, 3.3e-14 for the
GGAs, 1.3e-13 for the meta-GGAs) and 98 of the names are above 1e-12, the
worst at 4.4e-06 (`mgga_x_br89_explicit`, `v4rhotau3`) where a `BigFloat`
evaluation shows the expression itself is ill conditioned rather than either
side being wrong. Recorded this way, a test can ask that no name has got
worse, which is the question a constant cannot express.

Slow, and splittable for that reason, which is not optional advice: run as one
process per family and the meta-GGAs will not finish. On one machine,
one process per chunk of eight kernels: `lda_exc` 68.6 s (43 kernels, 76
names), `gga_exc` 4856.4 s (126 kernels, 261 names), `mgga_exc` 17135.4 s in
fourteen chunks (109 kernels, 193 names), of which one chunk of eight is
13034.2 s on its own. Peak resident set stays between 1.3 and 3.4 GB per
chunk, where one process for the whole of `mgga_exc` was killed by the system
after 11 h 40 min with nothing written: the pass writes the manifest once per
family, so a run that does not finish records nothing. `families` and
`kernels` narrow a run to part of the corpus, a narrowed run leaves the rest
of the records alone, and a chunked run can be repeated to fill in what a
killed chunk left out.
"""
function record_high_agreement!(; path::AbstractString=MANIFEST_PATH,
                                families=nothing, kernels=nothing)
    return _record_measure!("high_agreement", high_agreement_for;
                            path, families, kernels,
                            libxc_note = " MAXORDER=4")
end

"""
    _record_measure!(key, measure; path, families, kernels, libxc_note) -> Int

Write one measurement pass into the manifest: `measure(family, kernel)` for
every shipped kernel, stored under `key` beside the inputs it was taken at,
the library version and the time.

A name the pass cannot measure has its record deleted rather than left to
age, but only when the pass was asked to look at it: a run narrowed to one
family must not delete the records of the others, which is what `families`
and `kernels` being `nothing` means here.
"""
function _record_measure!(key::AbstractString, measure;
                          path::AbstractString=MANIFEST_PATH,
                          families=nothing, kernels=nothing,
                          libxc_note::AbstractString="")
    manifest = TOML.parsefile(path)
    version = join(string.(pinned_libxc_version()), ".") * libxc_note
    stamp = Dates.format(Dates.now(), Dates.dateformat"yyyy-mm-dd\THH:MM:SS")
    recorded = String[]
    for (family, entries) in manifest
        entries isa Dict || continue
        # A family this package generates, decided from what is on disk
        # rather than from the generator's own table: these passes have to
        # run in the environment that has no Python (reftest/), and that is
        # the whole reason gen/pinned.jl is a file of its own.
        isdir(joinpath(GENERATED_DIR, family)) || continue
        families === nothing || family in families || continue
        for (kernel, entry) in entries
            entry isa Dict || continue
            get(entry, "status", "") == "ok" || continue
            get(entry, "held_back", false) === true && continue
            kernels === nothing || kernel in kernels || continue
            measured = measure(family, kernel)
            if isempty(measured)
                delete!(entry, key)
                continue
            end
            entry[key] = merge(Dict{String,Any}(
                "inputs" => AGREEMENT_INPUTS,
                "libxc" => version,
                "measured_at" => stamp), measured)
            append!(recorded, collect(keys(measured)))
        end
    end
    open(path, "w") do io
        println(io, "# Generated functionals: what was produced, from which upstream")
        println(io, "# commit, and in what positional argument order. Written by")
        println(io, "# gen/generate.jl -- do not edit by hand.")
        TOML.print(io, manifest; sorted=true)
    end
    return length(recorded)
end

"""
    agreement_figures(diffs, refs) -> [abs, scaled, pointwise]

The three figures a comparison records for one output slot, from the
per-point differences and the reference values they are differences from.

  1. the worst absolute difference;
  2. that difference over the largest value the slot takes in the sweep;
  3. the worst of the per-point ratios.

(2) is the figure these tables carried alone, and where a slot is small at
one point and large at another it is optimistic: dividing by the largest
value anywhere in the sweep hides how badly the small point did. Measured on
`gga_x_beefvdw`, 5.92e-08 this way against 4.23e-06 pointwise for
`v3rhosigma2`, a factor of 71, and 334 for `v4rho2sigma2` in the same
kernel. A `BigFloat` evaluation of that expression says it is simply ill
conditioned there, so the pointwise figure is the one that describes what a
caller gets.

(3) alone will not do either: it is the ratio that blows up wherever the
quantity crosses zero, where the difference is at the rounding floor and the
ratio is not. `gga_c_pbe`'s `v2rho2` crosses at rho = 0.735, where 2.8e-17
reads as 1.3e-10.

So both are kept. (3) is never below (2): it divides the same worst
difference by a value no larger than (2) divides it by.
"""
function agreement_figures(diffs::Vector{Float64}, refs::Vector{Float64})
    worst = maximum(diffs)
    scale = maximum(refs)
    pointwise = 0.0
    for (d, r) in zip(diffs, refs)
        r == 0 && continue
        pointwise = max(pointwise, d / r)
    end
    return [worst, scale == 0 ? 0.0 : worst / scale, pointwise]
end

"""
    agreement_for(family, kernel) -> Dict

How closely every name this kernel ships agrees with the pinned library, by
Libxc output and as the three figures [`agreement_figures`](@ref) explains:
`result[name][slot] == [worst_abs, worst_rel_scaled, worst_rel_pointwise]`.

More than one figure, because recording a single one is how
`hyb_mgga_x_m08_so` came to be held: its disagreement was written down as
1.3e-9, a relative figure, and compared against `atol=1e-10`, an absolute
one. In absolute terms it was 1.62e-10, closer than the sibling that ships.
"""
function agreement_for(family::AbstractString, kernel::AbstractString)
    manifest = isfile(MANIFEST_PATH) ? TOML.parsefile(MANIFEST_PATH) : Dict{String,Any}()
    entry = get(get(manifest, family, Dict{String,Any}()), kernel, Dict{String,Any}())
    names = String[kernel]
    append!(names, String[v for v in get(entry, "variants", String[])])
    slots = agreement_slots(family)
    result = Dict{String,Any}()
    for nm in unique(names)
        diffs = Dict{String,Vector{Float64}}()   # slot -> per-point |ours - ref|
        scales = Dict{String,Vector{Float64}}()  # slot -> per-point |ref|
        for (rho, sigma, lapl, tau) in AGREEMENT_POINTS
            ours = shipped_slots(family, nm, rho, sigma, lapl, tau)
            ours === nothing && break
            ref = pinned_slots(family, nm, rho, sigma, lapl, tau)
            ref === nothing && break
            for slot in slots
                haskey(ref, slot) && haskey(ours, slot) || continue
                push!(get!(diffs, slot, Float64[]), abs(ours[slot] - ref[slot]))
                push!(get!(scales, slot, Float64[]), abs(ref[slot]))
            end
        end
        isempty(diffs) && continue
        per_slot = Dict{String,Any}()
        for (slot, ds) in diffs
            per_slot[slot] = agreement_figures(ds, scales[slot])
        end
        result[nm] = per_slot
    end
    return result
end

"""
    mix_recipe(name) -> nothing | (components, has_coefficients)

How Libxc evaluates `name` when it evaluates it by mixing others, read off
the initialised functional: `components` is a vector of
`(coefficient, functional name)` in the order Libxc stores them, and
`has_coefficients` says whether those coefficients exist.

`nothing` means Libxc computes this one from a kernel of its own (or does
not have it at all), which is the ordinary case this generator already
handles.

`has_coefficients == false` is the case to be careful with. A nonzero
`n_func_aux` does not imply the weights: Libxc allocates `mix_coef` only
for the functionals that are a plain linear combination of their
auxiliaries and leaves it NULL for the ones whose own C code combines them
some other way. Reading it unguarded segfaults, which is how this was
found, so the shim reports the pointer separately and the coefficients
come back as `NaN` rather than as zero. Zero would generate a functional
that quietly returns nothing of the sort.

Measured on the pinned 7.1.2: 163 functionals mix, 154 of them carry
coefficients, and every one of those nests exactly one level deep, so the
recipe is a flat table rather than a tree. The nine without coefficients
are all M06 correlation.
"""
function mix_recipe(name::AbstractString)
    return with_pinned_functional(name) do p
        n = Int(ccall((:lxs_n_func_aux, PINNED_SHIM), Cint, (Ptr{Cvoid},), p))
        n > 0 || return nothing
        has = ccall((:lxs_has_mix_coef, PINNED_SHIM), Cint, (Ptr{Cvoid},), p) != 0
        components = Tuple{Float64,String}[]
        for i in 0:(n - 1)
            number = Int(ccall((:lxs_func_aux_number, PINNED_SHIM), Cint,
                               (Ptr{Cvoid}, Cint), p, i))
            number < 0 && error("mix_recipe: $name has no auxiliary $i, " *
                                "though n_func_aux is $n")
            coefficient = has ?
                ccall((:lxs_mix_coef, PINNED_SHIM), Cdouble,
                      (Ptr{Cvoid}, Cint), p, i) : NaN
            aux = unsafe_string(ccall((:xc_functional_get_name, PINNED_LIB),
                                      Cstring, (Cint,), number))
            push!(components, (coefficient, aux))
        end
        return (components=components, has_coefficients=has)
    end
end

"""
    with_pinned_functional_order4(f, name, nspin=1)

As [`with_pinned_functional`](@ref), against the `MAXORDER=4` build instead.

A separate entry point rather than a keyword because the pointer and the
derivative call have to come from the same library: a functional initialised
in one build and passed to another build's `xc_mgga_kxc` is reading a struct
laid out by different headers. The two builds are the same sources, so the
layouts do match today, which is exactly what makes the mistake quiet.
"""
function with_pinned_functional_order4(f, name::AbstractString, nspin::Integer=1)
    isfile(PINNED_LIB_ORDER4) || build_pinned_libxc_order4()
    id = ccall((:xc_functional_get_number, PINNED_LIB_ORDER4), Cint, (Cstring,), name)
    id < 0 && return nothing
    p = ccall((:xc_func_alloc, PINNED_LIB_ORDER4), Ptr{Cvoid}, ())
    p == C_NULL && error("xc_func_alloc failed")
    try
        rc = ccall((:xc_func_init, PINNED_LIB_ORDER4), Cint, (Ptr{Cvoid}, Cint, Cint),
                   p, id, nspin)
        rc == 0 || error("xc_func_init failed for $name (rc=$rc)")
        try
            return f(p)
        finally
            ccall((:xc_func_end, PINNED_LIB_ORDER4), Cvoid, (Ptr{Cvoid},), p)
        end
    finally
        ccall((:xc_func_free, PINNED_LIB_ORDER4), Cvoid, (Ptr{Cvoid},), p)
    end
end

# One caller per family and order, generated rather than written out: the
# fourth derivative of a meta-GGA takes thirty-five output pointers, and the
# six functions together take 102 of them. The count and the order come from
# `slot_names`, which is generated from Libxc's own rule, so a hand-written
# argument list is one more place for the two to drift apart.
#
# The inputs a family takes are its own: a density for an LDA, a density and a
# gradient for a GGA, and four quantities for a meta-GGA.
const _HIGH_INPUTS = (lda = 1, gga = 2, mgga = 4)

for prefix in (:lda, :gga, :mgga), (order, verb) in ((3, "kxc"), (4, "lxc"))
    cname = Symbol("xc_", prefix, "_", verb)
    nin = _HIGH_INPUTS[prefix]
    nout = length(slot_names(prefix, order))
    outs = [Symbol("o", i) for i in 1:nout]
    ins = [:r, :sg, :l, :t][1:nin]
    @eval function $(Symbol("_pinned_", cname))(p, r, sg, l, t)
        $(Expr(:block, [:($o = Ref{Cdouble}(0.0)) for o in outs]...))
        ccall(($(QuoteNode(cname)), PINNED_LIB_ORDER4), Cvoid,
              $(Expr(:tuple, :(Ptr{Cvoid}), :Csize_t,
                     fill(:(Ref{Cdouble}), nin + nout)...)),
              p, 1, $(ins...), $(outs...))
        return Float64[$([:($o[]) for o in outs]...)]
    end
end

# `XC_FLAGS_HAVE_KXC` and `_LXC` per name, from the MAXORDER=4 build, cached
# because reading them initialises and frees a functional.
#
# Asking is not optional. Libxc answers a derivative it does not implement by
# calling `abort()`: `xc_gga_lxc` on `gga_c_gapc` prints "Functional 'GapC'
# does not provide an implementation of lxc" and takes the process with it,
# which is how a sweep over the corpus ended after thirteen names.
const _HIGH_FLAGS = Dict{String,Int}()

"""
    pinned_high_slots(family, name, rho, sigma, lapl, tau) -> Dict or nothing

Libxc's own third and fourth derivative slots at one point, from the
`MAXORDER=4` build. `nothing` if that library does not have `name`.

This is the only comparison in the repository that reaches past the second
derivative: [`pinned_slots`](@ref) reads the default `MAXORDER=2` build, and
the build `Libxc.jl` vendors stops there as well.

Only the orders the build says it has for `name`: 673 of the 687 callable
identifiers carry `have_kxc` and 652 carry `have_lxc`, and asking for one that
is missing aborts the process rather than returning.

The `*_vxc` families are refused. Their expression is the potential, so
Libxc's `v3rho3` for one of them is the third derivative of a potential and
not of an energy, and the shipped counterpart is a different quantity.
"""
function pinned_high_slots(family::AbstractString, name::AbstractString,
                           rho::Real, sigma::Real, lapl::Real, tau::Real)
    endswith(family, "_vxc") && return nothing
    prefix = Symbol(first(split(family, "_")))
    haskey(_HIGH_INPUTS, prefix) || return nothing
    bits = get!(_HIGH_FLAGS, name) do
        something(libxc_flag_bits(name), 0)
    end
    out = Dict{String,Float64}()
    done = with_pinned_functional_order4(name) do p
        r, sg, l, t = Ref{Cdouble}(rho), Ref{Cdouble}(sigma),
                      Ref{Cdouble}(lapl), Ref{Cdouble}(tau)
        for (order, verb, bit) in ((3, "kxc", 1 << 3), (4, "lxc", 1 << 4))
            bits & bit == 0 && continue
            caller = getfield(@__MODULE__, Symbol("_pinned_xc_", prefix, "_", verb))
            for (slot, value) in zip(slot_names(prefix, order), caller(p, r, sg, l, t))
                out[String(slot)] = value
            end
        end
        return true
    end
    return done === nothing ? nothing : out
end

"""
    shipped_high_slots(family, name, rho, sigma, lapl, tau) -> Dict or nothing

This package's third and fourth derivative slots at one point, read by name
through [`xc_kxc`](@ref) and [`xc_lxc`](@ref).

`nothing` when there is nothing to compare: a `*_vxc` family, or a name with
no entry point callable from a density alone.

The slot-by-name form rather than the whole tuple, because the tuple costs
every slot to read one and the comparison is per slot anyway.
"""
function shipped_high_slots(family::AbstractString, name::AbstractString,
                            rho::Real, sigma::Real, lapl::Real, tau::Real)
    endswith(family, "_vxc") && return nothing
    prefix = Symbol(first(split(family, "_")))
    haskey(_HIGH_INPUTS, prefix) || return nothing
    entry = Symbol(name, entry_suffix(family))
    isdefined(LibXcDerivative, entry) || return nothing
    req = Symbol(entry, "_required")
    isdefined(LibXcDerivative, req) && !isempty(getfield(LibXcDerivative, req)) && return nothing
    f = getfield(LibXcDerivative, entry)
    args = prefix === :mgga ? (rho, sigma, lapl, tau) :
           prefix === :gga ? (rho, sigma) : (rho,)
    out = Dict{String,Float64}()
    try
        for (order, fn) in ((3, xc_kxc), (4, xc_lxc))
            for slot in slot_names(prefix, order)
                out[String(slot)] = fn(f, slot, args...)
            end
        end
    catch
        return nothing
    end
    return out
end

"""
    high_agreement_for(family, kernel) -> Dict

How closely every name this kernel ships agrees with the `MAXORDER=4` build at
third and fourth order: the three figures of [`agreement_figures`](@ref), the
shape [`agreement_for`](@ref) returns for the lower slots.

Empty when neither side has anything to compare. That is every `*_vxc`
family, where the shipped expression is a potential and the orders are
shifted, and the four kernels Libxc's own generator caps at second order
because their piecewise junctions are only `C2` there: `gga_x_wpbeh`,
`mgga_x_r2scan`, `mgga_c_r2scan` and `mgga_x_r4scan`. The `MAXORDER=4` build
has nothing above second order in those four, so the absence is upstream's
judgement rather than a gap in this pass.
"""
function high_agreement_for(family::AbstractString, kernel::AbstractString)
    manifest = isfile(MANIFEST_PATH) ? TOML.parsefile(MANIFEST_PATH) : Dict{String,Any}()
    entry = get(get(manifest, family, Dict{String,Any}()), kernel, Dict{String,Any}())
    names = String[kernel]
    append!(names, String[v for v in get(entry, "variants", String[])])
    result = Dict{String,Any}()
    for nm in unique(names)
        diffs = Dict{String,Vector{Float64}}()
        scales = Dict{String,Vector{Float64}}()
        for (rho, sigma, lapl, tau) in AGREEMENT_POINTS
            ours = shipped_high_slots(family, nm, rho, sigma, lapl, tau)
            ours === nothing && break
            ref = pinned_high_slots(family, nm, rho, sigma, lapl, tau)
            ref === nothing && break
            for slot in keys(ref)
                haskey(ours, slot) || continue
                push!(get!(diffs, slot, Float64[]), abs(ours[slot] - ref[slot]))
                push!(get!(scales, slot, Float64[]), abs(ref[slot]))
            end
        end
        isempty(diffs) && continue
        per_slot = Dict{String,Any}()
        for (slot, ds) in diffs
            per_slot[slot] = agreement_figures(ds, scales[slot])
        end
        result[nm] = per_slot
    end
    return result
end
