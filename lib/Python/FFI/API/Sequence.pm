package Python::FFI::API::Sequence;

use Python::FFI::Role;

around 'ffi_subs_data' => sub ($orig, $self, @args){
    return +{
        %{ $self->$orig(@args) },

        'PySequence_Check' => [ ['opaque'] => 'int' ],
        'PySequence_Concat' => [ [ 'PyObject *1', 'PyObject *2' ] => 'opaque' ],
        'PySequence_Contains' => [ [ 'opaque', 'opaque' ] => 'int' ],
        'PySequence_Count' => [ [ 'opaque', 'opaque' ] => 'Py_ssize_t' ],
        'PySequence_DelItem' => [ [ 'opaque', 'Py_ssize_t i' ] => 'int' ],
        'PySequence_DelSlice' => [ [ 'opaque', 'Py_ssize_t i1', 'Py_ssize_t i2' ] => 'int' ],
        'PySequence_Fast' => [ [ 'opaque', 'const char* m' ] => 'opaque' ],
        'PySequence_GetItem' => [ [ 'opaque', 'Py_ssize_t i' ] => 'opaque' ],
        'PySequence_GetSlice' => [ [ 'opaque', 'Py_ssize_t i1', 'Py_ssize_t i2' ] => 'opaque' ],
        'PySequence_In' => [ [ 'opaque', 'opaque' ] => 'int' ],
        'PySequence_InPlaceConcat' => [ [ 'PyObject *1', 'PyObject *2' ] => 'opaque' ],
        'PySequence_InPlaceRepeat' => [ [ 'opaque', 'Py_ssize_t count' ] => 'opaque' ],
        'PySequence_Index' => [ [ 'opaque', 'opaque' ] => 'Py_ssize_t' ],
        'PySequence_Length' => [ ['opaque'] => 'Py_ssize_t' ],
        'PySequence_List' => [ ['opaque'] => 'opaque' ],
        'PySequence_Repeat' => [ [ 'opaque', 'Py_ssize_t count' ] => 'opaque' ],
        'PySequence_SetItem' => [ [ 'opaque', 'Py_ssize_t i', 'opaque' ] => 'int' ],
        'PySequence_SetSlice' => [ [ 'opaque', 'Py_ssize_t i1', 'Py_ssize_t i2', 'opaque' ] => 'int' ],
        'PySequence_Size' => [ ['opaque'] => 'Py_ssize_t' ],
        'PySequence_Tuple' => [ ['opaque'] => 'opaque' ],
    };
};

sub sequence_check ($self) {
    return $self->ffi_sub('PySequence_Check')->();
}

sub sequence_concat ($self) {
    return $self->ffi_sub('PySequence_Concat')->();
}

sub sequence_contains ($self) {
    return $self->ffi_sub('PySequence_Contains')->();
}

sub sequence_count ($self) {
    return $self->ffi_sub('PySequence_Count')->();
}

sub sequence_delitem ($self) {
    return $self->ffi_sub('PySequence_DelItem')->();
}

sub sequence_delslice ($self) {
    return $self->ffi_sub('PySequence_DelSlice')->();
}

sub sequence_fast ($self) {
    return $self->ffi_sub('PySequence_Fast')->();
}

sub sequence_getitem ($self) {
    return $self->ffi_sub('PySequence_GetItem')->();
}

sub sequence_getslice ($self) {
    return $self->ffi_sub('PySequence_GetSlice')->();
}

sub sequence_in ($self) {
    return $self->ffi_sub('PySequence_In')->();
}

sub sequence_inplaceconcat ($self) {
    return $self->ffi_sub('PySequence_InPlaceConcat')->();
}

sub sequence_inplacerepeat ($self) {
    return $self->ffi_sub('PySequence_InPlaceRepeat')->();
}

sub sequence_index ($self) {
    return $self->ffi_sub('PySequence_Index')->();
}

sub sequence_length ($self) {
    return $self->ffi_sub('PySequence_Length')->();
}

sub sequence_list ($self) {
    return $self->ffi_sub('PySequence_List')->();
}

sub sequence_repeat ($self) {
    return $self->ffi_sub('PySequence_Repeat')->();
}

sub sequence_setitem ($self) {
    return $self->ffi_sub('PySequence_SetItem')->();
}

sub sequence_setslice ($self) {
    return $self->ffi_sub('PySequence_SetSlice')->();
}

sub sequence_size ($self) {
    return $self->ffi_sub('PySequence_Size')->();
}

sub sequence_tuple ($self) {
    return $self->ffi_sub('PySequence_Tuple')->();
}


no Python::FFI::Role;

1;
