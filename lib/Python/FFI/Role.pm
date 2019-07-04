package Python::FFI::Role;

use Moose::Role ();
use experimental;
use Import::Into;

sub import {
    shift;
    Moose::Role->import::into( 1, @_ );
    warnings->unimport::out_of( 1, 'experimental::signatures' );
    experimental->import::into( 1, 'signatures' );
}

sub unimport {
    shift;
    Moose::Role->unimport::out_of( 1, @_ );
}

1;
