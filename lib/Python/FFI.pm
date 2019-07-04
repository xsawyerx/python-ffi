package Python::FFI;

use Moose;
with qw<
    MooseX::Role::FFI
    Python::FFI::API
>;

sub ffi_lib { 'python3.7m' }

no Moose;
__PACKAGE__->meta->make_immutable;

1;

