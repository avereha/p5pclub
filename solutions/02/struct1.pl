

use Devel::Peek;

my $refcounter = 1;

my $ref = \$refcounter;
$ref2 = \$refcounter;

print Dump([\$ref, $ref]);


