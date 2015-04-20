#!perl
use strict;
use warnings;

use Devel::Peek;

use Test::More tests => 7;
use Test::LeakTrace;

use_ok('sum', ':all');

is(avereha_sum(1, 2, 3), 6,  "1 + 2 + 3 = 6");

is(avereha_sum(1, [2, 3], 4), 10,  "1 + [2 + 3] + 4 = 10");

is(avereha_sum(1, [2, 3], [4.1, 5.1]), 15,  "1 + [2 + 3] + [4.1 + 5.1] = 15");

is(avereha_sum(1, { a => 2, b => 3}, 4), 10,  "1 + { a => 2, b => 3} + 4 = 10");

is(avereha_sum(1, { a => 2, b => 3}, { a => 4.1, b => 5.1 }), 15,  "1 + { a => 2, b => 3} + [4.1 + 5.1] = 15");

no_leaks_ok{
    my $a = avereha_sum(1, 2, 3);
} 'no memory leaks';



