package Python::FFI::API::Float;

use Python::FFI::Role;

around 'ffi_subs_data' => sub ($orig, $self, @args){
    return +{
        %{ $self->$orig(@args) },

        'PyFloat_AsDouble' => [ [ 'opaque' ] => 'double' ],
        'PyFloat_ClearFreeList' => [ [ 'void' ] => 'int' ],
        'PyFloat_FromDouble' => [ [ 'double' ] => 'opaque' ],
        'PyFloat_FromString' => [ [ 'PyObject*' ] => 'opaque' ],
        'PyFloat_GetInfo' => [ [ 'void' ] => 'opaque' ],
        'PyFloat_GetMax' => [ [ 'void' ] => 'double' ],
        'PyFloat_GetMin' => [ [ 'void' ] => 'double' ],
    };
};

sub float_asdouble ($self) {
    return $self->ffi_sub('PyFloat_AsDouble')->();
}

sub float_clearfreelist ($self) {
    return $self->ffi_sub('PyFloat_ClearFreeList')->();
}

sub float_fromdouble ($self) {
    return $self->ffi_sub('PyFloat_FromDouble')->();
}

sub float_fromstring ($self) {
    return $self->ffi_sub('PyFloat_FromString')->();
}

sub float_getinfo ($self) {
    return $self->ffi_sub('PyFloat_GetInfo')->();
}

sub float_getmax ($self) {
    return $self->ffi_sub('PyFloat_GetMax')->();
}

sub float_getmin ($self) {
    return $self->ffi_sub('PyFloat_GetMin')->();
}


no Python::FFI::Role;

1;
