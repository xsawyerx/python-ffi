package Python::FFI::API::Slice;

use Python::FFI::Role;

around 'ffi_subs_data' => sub ($orig, $self, @args){
    return +{
        %{ $self->$orig(@args) },

        'PySlice_AdjustIndices' => [ [ 'Py_ssize_t length', 'Py_ssize_t *', 'Py_ssize_t *', 'Py_ssize_t step' ] => 'Py_ssize_t' ],
        'PySlice_GetIndices' => [ [ 'opaque', 'Py_ssize_t length', 'Py_ssize_t *', 'Py_ssize_t *', 'Py_ssize_t *' ] => 'int' ],
        'PySlice_GetIndicesEx' => [ [ 'opaque', 'Py_ssize_t length', 'Py_ssize_t *', 'Py_ssize_t *', 'Py_ssize_t *', 'Py_ssize_t *' ] => 'int' ],
        'PySlice_New' => [ [ 'PyObject* start', 'PyObject* stop', 'PyObject* step' ] => 'opaque' ],
        'PySlice_Unpack' => [ [ 'opaque', 'Py_ssize_t *', 'Py_ssize_t *', 'Py_ssize_t *' ] => 'int' ],
    };
};

sub slice_adjustindices ($self) {
    return $self->ffi_sub('PySlice_AdjustIndices')->();
}

sub slice_getindices ($self) {
    return $self->ffi_sub('PySlice_GetIndices')->();
}

sub slice_getindicesex ($self) {
    return $self->ffi_sub('PySlice_GetIndicesEx')->();
}

sub slice_new ($self) {
    return $self->ffi_sub('PySlice_New')->();
}

sub slice_unpack ($self) {
    return $self->ffi_sub('PySlice_Unpack')->();
}


no Python::FFI::Role;

1;
