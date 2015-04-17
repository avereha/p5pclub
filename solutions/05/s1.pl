

use Devel::Peek;

my $iv1 = 1, $iv2 = 2;

$iv1 = \$iv2;
$iv2 = \$iv1;

my $ar = [ \$iv1, \$iv2, \$iv1];

print Dump($ar);
${${$ar->[0]}} = "x";

print Dump($ar);
