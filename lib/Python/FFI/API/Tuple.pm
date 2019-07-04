package Python::FFI::API::Tuple;

use Python::FFI::Role;

around 'ffi_subs_data' => sub ($orig, $self, @args){
    return +{
        %{ $self->$orig(@args) },

        'PyTuple_ClearFreeList' => [ [ 'void' ] => 'int' ],
        'PyTuple_GetItem' => [ [ 'opaque', 'Py_ssize_t' ] => 'opaque' ],
        'PyTuple_GetSlice' => [ [ 'opaque', 'Py_ssize_t', 'Py_ssize_t' ] => 'opaque' ],
        'PyTuple_New' => [ [ 'Py_ssize_t size' ] => 'opaque' ],
        'PyTuple_Pack' => [ [ 'Py_ssize_t', '...' ] => 'opaque' ],
        'PyTuple_SetItem' => [ [ 'opaque', 'Py_ssize_t', 'opaque' ] => 'int' ],
        'PyTuple_Size' => [ [ 'opaque' ] => 'Py_ssize_t' ],
    };
};

sub tuple_clearfreelist ($self) {
    return $self->ffi_sub('PyTuple_ClearFreeList')->();
}

sub tuple_getitem ($self) {
    return $self->ffi_sub('PyTuple_GetItem')->();
}

sub tuple_getslice ($self) {
    return $self->ffi_sub('PyTuple_GetSlice')->();
}

sub tuple_new ($self) {
    return $self->ffi_sub('PyTuple_New')->();
}

sub tuple_pack ($self) {
    return $self->ffi_sub('PyTuple_Pack')->();
}

sub tuple_setitem ($self) {
    return $self->ffi_sub('PyTuple_SetItem')->();
}

sub tuple_size ($self) {
    return $self->ffi_sub('PyTuple_Size')->();
}


no Python::FFI::Role;

1;
