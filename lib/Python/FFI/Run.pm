package Python::FFI::Run;

use Moose::Role;
use Carp qw< croak >;

around 'ffi_subs_data' => sub {
    my $orig = shift;
    my $self = shift;

    return +{
        %{ $self->$orig(@_) },
        'PyRun_SimpleString' => [ ['string'] => 'int' ],
    };
};

sub run_simplestring {
    my ( $self, $string ) = @_;
    $string //= "from time import time,ctime\nprint('Today is', ctime(time()))\n";

    $string
        or croak 'run_simplestring($string)';

    return $self->ffi_sub('PyRun_SimpleString')->($string);
}

no Moose::Role;

1;
