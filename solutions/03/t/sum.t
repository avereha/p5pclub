#!perl
use strict;
use warnings;

use Devel::Peek;

use Test::More tests => 5;
use Test::LeakTrace;

use_ok('sum', ':all');

is(avereha_sum(1, 2, 3), 6,  "1 + 2 + 3 = 6");

is(avereha_sum(1.1, 2.1, 3.1), 6.3,  "1.1 + 2.1 + 3.1 = 6.3");

is(avereha_sum('1.1aa', '2.1bb', '3.1'), 6.3,  "1.1 + 2.1 + 3.1 = 6.3");

no_leaks_ok{
        my $a = avereha_sum(1, 2, 3);
    } 'no memory leaks';

#print Dump(avereha_sum(1, 2, 3));
#print Dump(avereha_sum(1.1, 2.1, 3.1));
#print Dump(avereha_sum("1.1aa", "2.1bbb", "3.1ccc"));


