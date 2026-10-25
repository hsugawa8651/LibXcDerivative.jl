# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

# Shared by every generated entry point: turn a caller's NamedTuple of
# overrides into the full set of values a kernel needs, or refuse.
#
# Refusing matters more than it looks. `merge(defaults, params)` accepts an
# unknown name silently: it adds a field nobody reads, the default stays in
# force, and the caller's value is discarded without a word. A misspelled
# parameter would then produce a plausible number that is not the one asked
# for, which is the failure mode this refusal is here to prevent.

@noinline function _reject_unknown(unknown, accepted)
    throw(ArgumentError("unknown parameter(s) $(unknown); this functional accepts $(accepted)"))
end

@noinline function _reject_missing(absent)
    throw(ArgumentError("missing parameter(s) $(absent): this functional has no default " *
                        "for them, so they have to be given explicitly"))
end

"""
    resolve_params(defaults, required, params) -> NamedTuple

Merge a caller's overrides over a functional's defaults, or refuse.

Every name in `params` has to be one this functional has (in `defaults` or in
`required`), and every `required` name has to end up present.

Both checks are on tuples of symbols, so they happen at compile time: the
call is inferred and allocates nothing.
"""
@inline function resolve_params(defaults::NamedTuple, required::Tuple,
                                params::NamedTuple)
    accepted = (keys(defaults)..., required...)
    unknown = Base.diff_names(keys(params), accepted)
    isempty(unknown) || _reject_unknown(unknown, accepted)
    resolved = merge(defaults, params)
    absent = Base.diff_names(required, keys(resolved))
    isempty(absent) || _reject_missing(absent)
    return resolved
end
