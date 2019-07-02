package Python::FFI::Mem;

use Moose::Role;
use Carp qw< croak >;

around 'ffi_subs_data' => sub {
    my $orig = shift;
    my $self = shift;

    return +{
        %{ $self->$orig(@_) },
        'PyMem_RawFree' => [ ['opaque'] => 'void' ],
    };
};

sub mem_rawfree {
    my $self = shift;
    return $self->ffi_sub('PyMem_RawFree')->($string);
}

no Moose::Role;

1;
