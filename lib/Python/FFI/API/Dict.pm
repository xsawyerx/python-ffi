package Python::FFI::API::Dict;

use Python::FFI::Role;

around 'ffi_subs_data' => sub ($orig, $self, @args){
    return +{
        %{ $self->$orig(@args) },

        'PyDict_Clear' => [ ['opaque'] => 'void' ],
        'PyDict_Contains' => [ [ 'opaque', 'opaque' ] => 'int' ],
        'PyDict_Copy' => [ ['opaque'] => 'opaque' ],
        'PyDict_DelItem' => [ [ 'opaque', 'opaque' ] => 'int' ],
        'PyDict_DelItemString' => [ [ 'opaque', 'string' ] => 'int' ],
        'PyDict_GetItem' => [ [ 'opaque', 'opaque' ] => 'opaque' ],
        'PyDict_GetItemString' => [ [ 'opaque', 'string' ] => 'opaque' ],
        'PyDict_GetItemWithError' => [ [ 'opaque', 'opaque' ] => 'opaque' ],
        'PyDict_Items' => [ ['opaque'] => 'opaque' ],
        'PyDict_Keys' => [ ['opaque'] => 'opaque' ],
        'PyDict_Merge' => [ [ 'opaque', 'opaque', 'int' ] => 'int' ],
        'PyDict_MergeFromSeq2' => [ [ 'opaque', 'PyObject *2', 'int' ] => 'int' ],
        'PyDict_New' => [ [] => 'opaque' ],
        'PyDict_Next' => [ [ 'opaque', 'Py_ssize_t *', 'PyObject **', 'PyObject **' ] => 'int' ],
        'PyDict_SetItem' => [ [ 'opaque', 'opaque', 'opaque' ] => 'int' ],
        'PyDict_SetItemString' => [ [ 'opaque', 'string', 'opaque' ] => 'int' ],
        'PyDict_Size' => [ ['opaque'] => 'Py_ssize_t' ],
        'PyDict_Update' => [ [ 'opaque', 'opaque' ] => 'int' ],
        'PyDict_Values' => [ ['opaque'] => 'opaque' ],
    };
};

sub dict_clear ($self) {
    return $self->ffi_sub('PyDict_Clear')->();
}

sub dict_contains ($self) {
    return $self->ffi_sub('PyDict_Contains')->();
}

sub dict_copy ($self) {
    return $self->ffi_sub('PyDict_Copy')->();
}

sub dict_delitem ($self) {
    return $self->ffi_sub('PyDict_DelItem')->();
}

sub dict_delitemstring ($self) {
    return $self->ffi_sub('PyDict_DelItemString')->();
}

sub dict_getitem ($self) {
    return $self->ffi_sub('PyDict_GetItem')->();
}

sub dict_getitemstring ($self) {
    return $self->ffi_sub('PyDict_GetItemString')->();
}

sub dict_getitemwitherror ($self) {
    return $self->ffi_sub('PyDict_GetItemWithError')->();
}

sub dict_items ($self) {
    return $self->ffi_sub('PyDict_Items')->();
}

sub dict_keys ($self) {
    return $self->ffi_sub('PyDict_Keys')->();
}

sub dict_merge ($self) {
    return $self->ffi_sub('PyDict_Merge')->();
}

sub dict_mergefromseq2 ($self) {
    return $self->ffi_sub('PyDict_MergeFromSeq2')->();
}

sub dict_new ($self) {
    return $self->ffi_sub('PyDict_New')->();
}

sub dict_next ($self) {
    return $self->ffi_sub('PyDict_Next')->();
}

sub dict_setitem ($self) {
    return $self->ffi_sub('PyDict_SetItem')->();
}

sub dict_setitemstring ($self) {
    return $self->ffi_sub('PyDict_SetItemString')->();
}

sub dict_size ($self) {
    return $self->ffi_sub('PyDict_Size')->();
}

sub dict_update ($self) {
    return $self->ffi_sub('PyDict_Update')->();
}

sub dict_values ($self) {
    return $self->ffi_sub('PyDict_Values')->();
}


no Python::FFI::Role;

1;
