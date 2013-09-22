/*
  Part of: Vicare/Template
  Contents: Template for Vicare
  Date: Sat Jan 21, 2012

  Abstract

	Core functions.

  Copyright (C) 2013 Marco Maggi <marco.maggi-ipsu@poste.it>

  This program is  free software: you can redistribute  it and/or modify
  it under the  terms of the GNU General Public  License as published by
  the Free Software Foundation, either  version 3 of the License, or (at
  your option) any later version.

  This program  is distributed in the  hope that it will  be useful, but
  WITHOUT   ANY  WARRANTY;   without  even   the  implied   warranty  of
  MERCHANTABILITY  or FITNESS  FOR A  PARTICULAR PURPOSE.   See  the GNU
  General Public License for more details.

  You  should have received  a copy  of the  GNU General  Public License
  along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/


/** --------------------------------------------------------------------
 ** Headers.
 ** ----------------------------------------------------------------- */

#include "vicare-template-internals.h"


/** --------------------------------------------------------------------
 ** Alpha struct.
 ** ----------------------------------------------------------------- */

#define HAVE_TEMPLATE_ALPHA_INITIALISE		1
#define HAVE_TEMPLATE_ALPHA_FINALISE		1

typedef struct template_alpha_tag_t {
  int	num;
} template_alpha_t;


ikptr
ikrt_template_alpha_initialise (ikpcb * pcb)
{
#ifdef HAVE_TEMPLATE_ALPHA_INITIALISE
  template_alpha_t *	rv;
  rv = malloc(sizeof(template_alpha_t));
  if (NULL != rv) {
    rv->num = 123;
    return ika_pointer_alloc(pcb, (ik_ulong)rv);
  } else
    return IK_FALSE;
#else
  feature_failure(__func__);
#endif
}
ikptr
ikrt_template_alpha_finalise (ikptr s_alpha, ikpcb * pcb)
{
#ifdef HAVE_TEMPLATE_ALPHA_FINALISE
  ikptr		s_pointer	= IK_TEMPLATE_ALPHA_POINTER(s_alpha);
  if (ik_is_pointer(s_pointer)) {
    template_alpha_t *	alpha	= IK_POINTER_DATA_VOIDP(s_pointer);
    int		owner		= IK_BOOLEAN_TO_INT(IK_TEMPLATE_ALPHA_OWNER(s_alpha));
    if (alpha && owner) {
      free(alpha);
      IK_POINTER_SET_NULL(s_pointer);
    }
  }
  /* Return false so that the return value of "$template-alpha-finalise"
     is always false. */
  return IK_FALSE;
#else
  feature_failure(__func__);
#endif
}


/** --------------------------------------------------------------------
 ** Still to be implemented.
 ** ----------------------------------------------------------------- */

#if 0
ikptr
ikrt_template_doit (ikpcb * pcb)
{
#ifdef HAVE_TEMPLATE_DOIT
  return IK_VOID;
#else
  feature_failure(__func__);
#endif
}
#endif

/* end of file */
