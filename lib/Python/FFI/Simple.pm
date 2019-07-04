package Python::FFI::Simple;
use Moose;
no warnings 'experimental::signatures';
use feature 'signatures';
extends 'Python::FFI';

sub BUILD ( $self, @ ) {
    $self->ffi_sub('Py_Initialize')->();
}

sub DEMOLISH ( $self, @ ) {
    $self->ffi_sub('Py_FinalizeEx')->();
}

sub run_code ( $self, $string ) {
    return $self->ffi_sub('PyRun_SimpleString')->($string);
}

sub import_module ( $self, $string ){
    my $gModule = $self->ffi_sub('PyImport_ImportModule')->($string);

    if ( !$gModule) {
        $self->ffi_sub('PyErr_Print')->();
        die "Cannot load $string\n";
    }

    return 1;
}

no Moose;
__PACKAGE__->meta->make_immutable;

1;
