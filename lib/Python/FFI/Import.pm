package Python::FFI::Import;

use Moose::Role;
use Carp qw< croak >;

around 'ffi_subs_data' => sub {
    my $orig = shift;
    my $self = shift;

    return +{
        %{ $self->$orig(@_) },
        'PyImport_ImportModule' => [ ['string'] => 'opaque' ],
    };
};

sub import_importmodule {
    my $self = shift;
    return $self->ffi_sub('PyImport_ImportModule')->($string);
}

no Moose::Role;

1;
