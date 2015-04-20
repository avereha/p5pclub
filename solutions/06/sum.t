#!perl
use strict;
use warnings;

use Devel::Peek;

use Test::More tests => 4;
use Test::LeakTrace;

use_ok('sum', ':all');

print STDERR Dump(avereha_sum(1, 2, 3));

is(avereha_sum(1, 2, 3), 6,  "1 + 2 + 3 = 6");

is(avereha_sum(1, [2, 3], 4), 10,  "1 + [2 + 3] + 4 = 10");

no_leaks_ok{
    my $a = avereha_sum(1, 2, 3);
} 'no memory leaks';

#print Dump(avereha_sum(1.1, 2.1, 3.1));
#print Dump(avereha_sum("1.1aa", "2.1bbb", "3.1ccc"));


