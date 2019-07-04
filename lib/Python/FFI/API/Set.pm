package Python::FFI::API::Set;

use Python::FFI::Role;

around 'ffi_subs_data' => sub ($orig, $self, @args){
    return +{
        %{ $self->$orig(@args) },

        'PySet_Add' => [ [ 'opaque', 'opaque' ] => 'int' ],
        'PySet_Clear' => [ ['opaque'] => 'int' ],
        'PySet_ClearFreeList' => [ [] => 'int' ],
        'PySet_Contains' => [ [ 'opaque', 'opaque' ] => 'int' ],
        'PySet_Discard' => [ [ 'opaque', 'opaque' ] => 'int' ],
        'PySet_New' => [ ['opaque'] => 'opaque' ],
        'PySet_Pop' => [ ['opaque'] => 'opaque' ],
        'PySet_Size' => [ ['opaque'] => 'Py_ssize_t' ],
    };
};

sub set_add ($self) {
    return $self->ffi_sub('PySet_Add')->();
}

sub set_clear ($self) {
    return $self->ffi_sub('PySet_Clear')->();
}

sub set_clearfreelist ($self) {
    return $self->ffi_sub('PySet_ClearFreeList')->();
}

sub set_contains ($self) {
    return $self->ffi_sub('PySet_Contains')->();
}

sub set_discard ($self) {
    return $self->ffi_sub('PySet_Discard')->();
}

sub set_new ($self) {
    return $self->ffi_sub('PySet_New')->();
}

sub set_pop ($self) {
    return $self->ffi_sub('PySet_Pop')->();
}

sub set_size ($self) {
    return $self->ffi_sub('PySet_Size')->();
}


no Python::FFI::Role;

1;
