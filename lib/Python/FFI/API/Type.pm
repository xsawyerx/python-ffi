package Python::FFI::API::Type;

use Python::FFI::Role;

around 'ffi_subs_data' => sub ($orig, $self, @args){
    return +{
        %{ $self->$orig(@args) },

        'PyType_ClearCache' => [ [ 'void' ] => 'unsigned int' ],
        'PyType_FromSpec' => [ [ 'PyType_Spec*' ] => 'PyObject*' ],
        'PyType_FromSpecWithBases' => [ [ 'PyType_Spec*', 'PyObject*' ] => 'PyObject*' ],
        'PyType_GenericAlloc' => [ [ 'struct _typeobject *', 'Py_ssize_t' ] => 'opaque' ],
        'PyType_GenericNew' => [ [ 'struct _typeobject *', 'opaque', 'opaque' ] => 'opaque' ],
        'PyType_GetFlags' => [ [ 'struct _typeobject*' ] => 'unsigned long' ],
        'PyType_GetSlot' => [ [ 'struct _typeobject*', 'int' ] => 'void*' ],
        'PyType_IsSubtype' => [ [ 'struct _typeobject *', 'struct _typeobject *' ] => 'int' ],
        'PyType_Modified' => [ [ 'struct _typeobject *' ] => 'void' ],
        'PyType_Ready' => [ [ 'struct _typeobject *' ] => 'int' ],
    };
};

sub type_clearcache ($self) {
    return $self->ffi_sub('PyType_ClearCache')->();
}

sub type_fromspec ($self) {
    return $self->ffi_sub('PyType_FromSpec')->();
}

sub type_fromspecwithbases ($self) {
    return $self->ffi_sub('PyType_FromSpecWithBases')->();
}

sub type_genericalloc ($self) {
    return $self->ffi_sub('PyType_GenericAlloc')->();
}

sub type_genericnew ($self) {
    return $self->ffi_sub('PyType_GenericNew')->();
}

sub type_getflags ($self) {
    return $self->ffi_sub('PyType_GetFlags')->();
}

sub type_getslot ($self) {
    return $self->ffi_sub('PyType_GetSlot')->();
}

sub type_issubtype ($self) {
    return $self->ffi_sub('PyType_IsSubtype')->();
}

sub type_modified ($self) {
    return $self->ffi_sub('PyType_Modified')->();
}

sub type_ready ($self) {
    return $self->ffi_sub('PyType_Ready')->();
}


no Python::FFI::Role;

1;
