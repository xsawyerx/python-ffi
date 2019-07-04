package Python::FFI::API::StructSequence;

use Python::FFI::Role;

around 'ffi_subs_data' => sub ($orig, $self, @args){
    return +{
        %{ $self->$orig(@args) },

        'PyStructSequence_GetItem' => [ [ 'PyObject*', 'Py_ssize_t' ] => 'PyObject*' ],
        'PyStructSequence_InitType' => [ [ 'PyTypeObject *', 'PyStructSequence_Desc *' ] => 'void' ],
        'PyStructSequence_InitType2' => [ [ 'PyTypeObject *', 'PyStructSequence_Desc *' ] => 'int' ],
        'PyStructSequence_New' => [ [ 'PyTypeObject* type' ] => 'opaque' ],
        'PyStructSequence_NewType' => [ [ 'PyStructSequence_Desc *' ] => 'PyTypeObject*' ],
        'PyStructSequence_SetItem' => [ [ 'PyObject*', 'Py_ssize_t', 'PyObject*' ] => 'void' ],
    };
};

sub structsequence_getitem ($self) {
    return $self->ffi_sub('PyStructSequence_GetItem')->();
}

sub structsequence_inittype ($self) {
    return $self->ffi_sub('PyStructSequence_InitType')->();
}

sub structsequence_inittype2 ($self) {
    return $self->ffi_sub('PyStructSequence_InitType2')->();
}

sub structsequence_new ($self) {
    return $self->ffi_sub('PyStructSequence_New')->();
}

sub structsequence_newtype ($self) {
    return $self->ffi_sub('PyStructSequence_NewType')->();
}

sub structsequence_setitem ($self) {
    return $self->ffi_sub('PyStructSequence_SetItem')->();
}


no Python::FFI::Role;

1;
