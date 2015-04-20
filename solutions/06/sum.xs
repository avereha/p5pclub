#define PERL_NO_GET_CONTEXT
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include "ppport.h"

/* C functions */

int process(SV *item);

int process(SV *item) {
	dTHX;

	int sum = 0, i;
	AV * av;
	HV * hv;
	HE * he;
	SV ** array_item;
	SSize_t len;

	if (SvROK(item)){
		return process((SV *)SvRV(item));
	}

	switch (SvTYPE(item)){
		case SVt_PVAV:
			av = (AV *)item;
			len = av_len(av);
			for (i = 0; i <= len; i++){
				array_item = av_fetch(av, i, 0);
				assert(array_item);
				sum += process(*array_item);
			}
		break;

		case SVt_PVHV:
			hv = (HV *)item;
			hv_iterinit(hv);
			for (he = hv_iternext(hv); he; he = hv_iternext(hv)){
				sum += process(hv_iterval(hv, he));
			}
		break;

		default:
			if (SvTYPE(item) > SVt_PVAV) {
				croak("Invalid scalar type: %d", SvTYPE(item));
			}
			return SvIV(item);
		break;
	}
	return sum;
};

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
			sv_setiv(sum, SvIV(sum) + process(current));
		}
		RETVAL = sum;
	OUTPUT:
		RETVAL

