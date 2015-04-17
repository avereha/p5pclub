#!perl
use strict;
use warnings;

use Devel::Peek;

use Test::More tests => 8;
use Test::LeakTrace;

use_ok('dualvar', ':all');

cmp_ok(avereha_dualvar(1, 1.1, "42"), "==",  1,   "dualvar is 1");
cmp_ok(avereha_dualvar(1, 1.1, "42"), "==",  1.1, "dualvar is 1.1");
cmp_ok(avereha_dualvar(1, 1.1, "42"), "eq", "42", "dualvar is 42");

cmp_ok(avereha_dualvar(1, 1.1, "42"), "!=",  1.2, "dualvar is not 1.2");

cmp_ok(avereha_dualvar("1efewf", 1.1, "42"), "==",  1, "1ewfwef is 1");
cmp_ok(avereha_dualvar("1", 1.1, 42), "eq",  "42", "42 is 42");

no_leaks_ok{
    my $a = avereha_dualvar(1, 2, 3);
} 'no memory leaks';

#print Dump(avereha_dualvar(1, 2, 3));
#print Dump(avereha_dualvar(1.1, 2.1, 3.1));
#print Dump(avereha_dualvar("1.1aa", "2.1bbb", "3.1ccc"));
