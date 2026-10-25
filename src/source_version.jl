# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

# Which Libxc the expressions in this package came from.
#
# There is no library at run time to ask, which is the whole point of the
# package, so the answer has to be carried: the two constants live in
# src/generated/source_version.jl, and these accessors are what a caller
# reads them through.

"""
    libxc_source_version() -> VersionNumber

The Libxc version the expressions in this package were translated from.

Not a library present at run time: this package calls no Libxc, so this is a
fact about where the expressions came from rather than about anything
loaded. It is the version the Libxc sources they were translated from call
themselves, read from a build of those sources at generation time.

Newer than the library `Libxc.jl` vendors, which is why a handful of
functionals disagree with that library and agree with this one; see the
tolerance discussion in the documentation.

```jldoctest
julia> libxc_source_version() > v"7.0.0"
true
```
"""
libxc_source_version() = LIBXC_SOURCE_VERSION

"""
    libxc_source_commit() -> String

The Libxc commit the expressions were generated from, in full.

Full rather than abbreviated: an abbreviation is ambiguous in a repository
this size, and shortening it for a message is the caller's to do.

A released version is not enough to identify the sources. They come from a
development branch, which calls itself 7.1.2 and carries work that is not in
that release, so the commit is the identifying half of the pair and
[`libxc_source_version()`](@ref) the readable half.

```jldoctest
julia> length(libxc_source_commit())
40
```
"""
libxc_source_commit() = LIBXC_SOURCE_COMMIT
