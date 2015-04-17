#define PERL_NO_GET_CONTEXT
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include "ppport.h"

/* C functions */

MODULE = dualvar		PACKAGE = dualvar

# XS code

SV *
avereha_dualvar(int num, double dnum, SV *string)
	PREINIT:
		STRLEN len;
		char *s;
		SV *ret;
		char * a;
	CODE:
		a = malloc(4);
		s = SvPV(string, len);
		ret = newSVpv(s, len);
		sv_setiv(ret, num);
		sv_setnv(ret, dnum);

		SvIOK_on(ret);
		SvNOK_on(ret);
		SvPOK_on(ret);

		RETVAL = ret;
	OUTPUT:
		RETVAL

