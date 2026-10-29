/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

/* Accessors for xc_func_type fields libxc exposes no getter for.
 *
 * dens_threshold and zeta_threshold are struct members with setters and no
 * getters (libxc-upstream/src/xc.h:405-407). Reading them from Julia would
 * mean mirroring the struct layout, which is version-specific and silently
 * wrong when it drifts -- exactly the failure this whole exercise is about.
 * Letting the C compiler compute the offsets against the headers the library
 * was built from cannot drift.
 */
#include <xc.h>

double lxs_dens_threshold(const xc_func_type *p) { return p->dens_threshold; }
double lxs_zeta_threshold(const xc_func_type *p) { return p->zeta_threshold; }

/* The functional's own parameter struct, as initialised by xc_func_init.
 *
 * This is where a parameter's real default lives, whatever produced it: a
 * constant assigned in <name>_init, a value copied from the external
 * parameter defaults, or something derived from them. Reading it needs no
 * guess about which of those applied.
 *
 * The struct is declared in src/<name>.c and its fields are doubles, so the
 * caller can read it as an array once it knows the field order. Returning a
 * void* keeps that decision on the caller's side.
 */
const void *lxs_params(const xc_func_type *p) { return p->params; }

/* Range-separation parameters, which live on xc_func_type beside the
 * thresholds rather than in the functional's own params struct. A generated
 * kernel names cam_omega directly, so it needs reading the same way.
 */
/* How many auxiliary functionals Libxc mixes to evaluate this one. Nonzero
   means the functional is not its kernel: Libxc builds it by combining
   several, and a kernel on its own computes one piece of it. */
int lxs_n_func_aux(const xc_func_type *p) { return p->n_func_aux; }

/* The functional's own flags, which say which derivative orders Libxc
   implements for it (XC_FLAGS_HAVE_EXC/VXC/FXC/KXC/LXC). Libxc aborts rather
   than returns when asked for an order it does not have. */
int lxs_flags(const xc_func_type *p) { return p->info->flags; }

/* Which family Libxc puts the functional in (XC_FAMILY_LDA, GGA, MGGA and
   the HYB_* variants). Read rather than guessed from the name: both
   hyb_mgga_xc_wb97m_v and mgga_c_m06 are meta-GGA, and the prefix is not a
   reliable guide for the hybrids. */
int lxs_family(const xc_func_type *p) { return p->info->family; }

/* Which of the four kinds Libxc puts the functional in: XC_EXCHANGE 0,
   XC_CORRELATION 1, XC_EXCHANGE_CORRELATION 2, XC_KINETIC 3 (xc.h:37-40).
   Not inferable from the name: the _x_/_c_/_xc_ segment is a convention the
   library does not enforce, and the field is what it answers from. */
int lxs_kind(const xc_func_type *p) { return p->info->kind; }

/* The parameters Libxc itself says a functional takes, by its own names and
   defaults. The generated kernels name their parameters after the fields of
   the kernel's params struct, read in the order the upstream python declares
   them; these are what that reading has to agree with, and the only way to
   notice the day upstream reorders a struct. p->info is opaque to a ccall,
   which is why these go through the shim rather than through xc.h directly. */
int lxs_n_ext_params(const xc_func_type *p)
{
  return xc_func_info_get_n_ext_params(p->info);
}

const char *lxs_ext_params_name(const xc_func_type *p, int i)
{
  if (i < 0 || i >= xc_func_info_get_n_ext_params(p->info)) return NULL;
  return xc_func_info_get_ext_params_name(p->info, i);
}

double lxs_ext_params_default(const xc_func_type *p, int i)
{
  if (i < 0 || i >= xc_func_info_get_n_ext_params(p->info)) return 0.0;
  return xc_func_info_get_ext_params_default_value(p->info, i);
}

/* The i-th functional Libxc mixes, by its XC_* number, and the coefficient it
   carries. Together with lxs_n_func_aux these are the whole recipe: Libxc
   fills func_aux and mix_coef at xc_func_init and does not change them while
   evaluating, so reading them once describes the functional completely.
   p->func_aux is an array of pointers, which a ccall cannot walk. */
int lxs_func_aux_number(const xc_func_type *p, int i)
{
  if (p->func_aux == NULL || i < 0 || i >= p->n_func_aux) return -1;
  return p->func_aux[i]->info->number;
}

/* Whether the coefficients exist at all. A nonzero n_func_aux does not imply
   them: Libxc allocates mix_coef only for the functionals that are a plain
   linear combination of their auxiliaries, and leaves it NULL for the ones
   whose own C code combines them some other way (a density-dependent weight,
   for instance). Reading it unguarded segfaults on those. */
int lxs_has_mix_coef(const xc_func_type *p) { return p->mix_coef != NULL; }

double lxs_mix_coef(const xc_func_type *p, int i)
{
  if (p->mix_coef == NULL || i < 0 || i >= p->n_func_aux) return 0.0;
  return p->mix_coef[i];
}

/* The i-th auxiliary itself, so that the other accessors here can be asked
   about it. A functional Libxc builds by mixing does not leave its
   components at their own defaults: xc_func_init sets their external
   parameters from the parent's, which is why a range-separated hybrid's
   short-range exchange carries the parent's omega rather than its own. */
const void *lxs_func_aux(const xc_func_type *p, int i)
{
  if (p->func_aux == NULL || i < 0 || i >= p->n_func_aux) return NULL;
  return (const void *) p->func_aux[i];
}

/* Non-local correlation parameters. Nonzero means part of the functional is a
   non-local term Libxc does not put into zk either, like the exact-exchange
   fraction cam_alpha stands for. */
double lxs_nlc_b(const xc_func_type *p) { return p->nlc_b; }
double lxs_nlc_C(const xc_func_type *p) { return p->nlc_C; }

double lxs_cam_omega(const xc_func_type *p) { return p->cam_omega; }
double lxs_cam_alpha(const xc_func_type *p) { return p->cam_alpha; }
double lxs_cam_beta(const xc_func_type *p)  { return p->cam_beta; }

/* Machine constants libxc's kernels use as C macros
 * (libxc-upstream/src/util.h), which the generated kernels take as arguments.
 * Read here so that their defaults come from the headers the library was
 * built from, like everything else.
 */
#include "util.h"

double lxs_xc_epsilon(void) { return XC_EPSILON; }
double lxs_xc_min(void)     { return XC_MIN; }
