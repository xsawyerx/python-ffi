package Python::FFI::API::CFunction;

use Python::FFI::Role;

around 'ffi_subs_data' => sub ($orig, $self, @args){
    return +{
        %{ $self->$orig(@args) },

        'PyCFunction_Call' => [ [ 'opaque', 'opaque', 'opaque' ] => 'opaque' ],
        'PyCFunction_ClearFreeList' => [ [] => 'int' ],
        'PyCFunction_GetFlags' => [ ['opaque'] => 'int' ],
        'PyCFunction_GetFunction' => [ ['opaque'] => 'PyCFunction' ],
        'PyCFunction_GetSelf' => [ ['opaque'] => 'opaque' ],
        'PyCFunction_NewEx' => [ [ 'PyMethodDef *', 'opaque', 'opaque' ] => 'opaque' ],
    };
};

sub cfunction_call ($self) {
    return $self->ffi_sub('PyCFunction_Call')->();
}

sub cfunction_clearfreelist ($self) {
    return $self->ffi_sub('PyCFunction_ClearFreeList')->();
}

sub cfunction_getflags ($self) {
    return $self->ffi_sub('PyCFunction_GetFlags')->();
}

sub cfunction_getfunction ($self) {
    return $self->ffi_sub('PyCFunction_GetFunction')->();
}

sub cfunction_getself ($self) {
    return $self->ffi_sub('PyCFunction_GetSelf')->();
}

sub cfunction_newex ($self) {
    return $self->ffi_sub('PyCFunction_NewEx')->();
}


no Python::FFI::Role;

1;
