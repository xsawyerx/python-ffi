package Python::FFI::Mem;

use Moose::Role;
use Carp qw< croak >;

around 'ffi_subs_data' => sub {
    my $orig = shift;
    my $self = shift;

    return +{
        %{ $self->$orig(@_) },
        'PyMem_Free'   => [ ['void *']      => 'void' ],
        'PyMem_Malloc' => [ ['size_t size'] => 'void *' ],
        'PyMem_Realloc' => [ [ 'void *', 'size_t new_size' ] => 'void *' ],
    };
};

sub mem_free {
    my $self = shift;
    return $self->ffi_sub('PyMem_Free')->();
}

sub mem_malloc {
    my $self = shift;
    return $self->ffi_sub('PyMem_Malloc')->();
}

sub mem_realloc {
    my $self = shift;
    return $self->ffi_sub('PyMem_Realloc')->();
}


no Moose::Role;

1;
