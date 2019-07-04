package Python::FFI::API::List;

use Python::FFI::Role;

around 'ffi_subs_data' => sub ($orig, $self, @args){
    return +{
        %{ $self->$orig(@args) },

        'PyList_Append' => [ [ 'opaque', 'opaque' ] => 'int' ],
        'PyList_AsTuple' => [ [ 'opaque' ] => 'opaque' ],
        'PyList_ClearFreeList' => [ [ 'void' ] => 'int' ],
        'PyList_GetItem' => [ [ 'opaque', 'Py_ssize_t' ] => 'opaque' ],
        'PyList_GetSlice' => [ [ 'opaque', 'Py_ssize_t', 'Py_ssize_t' ] => 'opaque' ],
        'PyList_Insert' => [ [ 'opaque', 'Py_ssize_t', 'opaque' ] => 'int' ],
        'PyList_New' => [ [ 'Py_ssize_t size' ] => 'opaque' ],
        'PyList_Reverse' => [ [ 'opaque' ] => 'int' ],
        'PyList_SetItem' => [ [ 'opaque', 'Py_ssize_t', 'opaque' ] => 'int' ],
        'PyList_SetSlice' => [ [ 'opaque', 'Py_ssize_t', 'Py_ssize_t', 'opaque' ] => 'int' ],
        'PyList_Size' => [ [ 'opaque' ] => 'Py_ssize_t' ],
        'PyList_Sort' => [ [ 'opaque' ] => 'int' ],
    };
};

sub list_append ($self) {
    return $self->ffi_sub('PyList_Append')->();
}

sub list_astuple ($self) {
    return $self->ffi_sub('PyList_AsTuple')->();
}

sub list_clearfreelist ($self) {
    return $self->ffi_sub('PyList_ClearFreeList')->();
}

sub list_getitem ($self) {
    return $self->ffi_sub('PyList_GetItem')->();
}

sub list_getslice ($self) {
    return $self->ffi_sub('PyList_GetSlice')->();
}

sub list_insert ($self) {
    return $self->ffi_sub('PyList_Insert')->();
}

sub list_new ($self) {
    return $self->ffi_sub('PyList_New')->();
}

sub list_reverse ($self) {
    return $self->ffi_sub('PyList_Reverse')->();
}

sub list_setitem ($self) {
    return $self->ffi_sub('PyList_SetItem')->();
}

sub list_setslice ($self) {
    return $self->ffi_sub('PyList_SetSlice')->();
}

sub list_size ($self) {
    return $self->ffi_sub('PyList_Size')->();
}

sub list_sort ($self) {
    return $self->ffi_sub('PyList_Sort')->();
}


no Python::FFI::Role;

1;
