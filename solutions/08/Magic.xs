#define PERL_NO_GET_CONTEXT
#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"
#include "ppport.h"

/* C functions */

int free_print(pTHX_ SV* sv, MAGIC *mg) {
	printf("Hello world from free print");
};

STATIC MGVTBL printer = { .svt_free = free_print };
const char * name = "avereha_printer";

MODULE = Magic      PACKAGE = Magic

# XS code

void
avereha_magify(SV *input)
	CODE:
		sv_magicext(input, NULL, 0, &printer, name, strlen(name));
