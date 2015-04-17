#!perl
use strict;
use warnings;

use Devel::Peek;

use Test::More tests => 1;

is('1.1aaa' + '3.1', 4.2,  "1.1aaa + 3.1 = 4.2");

#print Dump(avereha_sum(1, 2, 3));
#print Dump(avereha_sum(1.1, 2.1, 3.1));
#print Dump(avereha_sum("1.1aa", "2.1bbb", "3.1ccc"));
