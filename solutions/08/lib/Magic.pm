

package Magic;

use strict;
use warnings;
use XSLoader;

use Exporter 5.57 'import';

our $VERSION     = '0.001';
our %EXPORT_TAGS = ( 'all' => ['avereha_magify'] );
our @EXPORT_OK   = ( @{ $EXPORT_TAGS{'all'} } );

XSLoader::load('Magic', $VERSION);

1;

=head1 NAME

Magic - playing with magic
