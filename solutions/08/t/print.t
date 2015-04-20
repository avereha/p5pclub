
use strict;
use warnings;

use Devel::Peek;

use Test::More tests => 1;
use Test::LeakTrace;

use_ok('Magic', ':all');

{
    my $a = 4;
    avereha_magify($a);
}



