

use Devel::Peek;
use Scalar::Util "weaken";

my $a = [
    {},
    {"foo" => 42}
];

map {; while (() = each $_ ) {}; } @{ $a };

print Dump($a);
