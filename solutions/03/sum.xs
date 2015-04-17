#define PERL_NO_GET_CONTEXT
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include "ppport.h"

/* C functions */

MODULE = sum		PACKAGE = sum

# XS code

SV *
avereha_sum(...)
	PREINIT:
		int i;
		SV *sum, *current;
	CODE:
		sum = newSViv(0);
		for (i = 0; i < items; i++){
			current = ST(i);
			if (SvIOK(current) && SvIOK(sum)){
				sv_setiv(sum, SvIV(sum) + SvIV(current));
			} else {
				sv_setnv(sum, SvNV(sum) + SvNV(current));
			}
		}
		RETVAL = sum;
	OUTPUT:
		RETVAL

