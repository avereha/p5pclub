package sum;

use strict;
use warnings;
use XSLoader;

use Exporter 5.57 'import';

our $VERSION     = '0.001';
our %EXPORT_TAGS = ( 'all' => ['avereha_sum'] );
our @EXPORT_OK   = ( @{ $EXPORT_TAGS{'all'} } );

XSLoader::load('sum', $VERSION);

1;

