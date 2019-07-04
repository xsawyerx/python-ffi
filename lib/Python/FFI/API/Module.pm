package Python::FFI::API::Module;

use Python::FFI::Role;

around 'ffi_subs_data' => sub ($orig, $self, @args){
    return +{
        %{ $self->$orig(@args) },

        'PyModule_AddFunctions' => [ [ 'opaque', 'PyMethodDef *' ] => 'int' ],
        'PyModule_AddIntConstant' => [ [ 'opaque', 'string', 'long' ] => 'int' ],
        'PyModule_AddObject' => [ [ 'opaque', 'string', 'opaque' ] => 'int' ],
        'PyModule_AddStringConstant' => [ [ 'opaque', 'string', 'string' ] => 'int' ],
        'PyModule_Create2' => [ [ 'struct PyModuleDef*', 'int' ] => 'opaque' ],
        'PyModule_ExecDef' => [ [ 'opaque', 'PyModuleDef *' ] => 'int' ],
        'PyModule_FromDefAndSpec2' => [ [ 'PyModuleDef *', 'opaque', 'int_api_version' ] => 'opaque' ],
        'PyModule_GetDef' => [ [ 'PyObject*' ] => 'struct PyModuleDef*' ],
        'PyModule_GetDict' => [ [ 'opaque' ] => 'opaque' ],
        'PyModule_GetFilename' => [ [ 'opaque' ] => 'string' ],
        'PyModule_GetFilenameObject' => [ [ 'opaque' ] => 'opaque' ],
        'PyModule_GetName' => [ [ 'opaque' ] => 'string' ],
        'PyModule_GetNameObject' => [ [ 'opaque' ] => 'opaque' ],
        'PyModule_GetState' => [ [ 'PyObject*' ] => 'void*' ],
        'PyModule_New' => [ [ 'string' ] => 'opaque' ],
        'PyModule_NewObject' => [ [ 'opaque' ] => 'opaque' ],
        'PyModule_SetDocString' => [ [ 'opaque', 'string' ] => 'int' ],
    };
};

sub module_addfunctions ($self) {
    return $self->ffi_sub('PyModule_AddFunctions')->();
}

sub module_addintconstant ($self) {
    return $self->ffi_sub('PyModule_AddIntConstant')->();
}

sub module_addobject ($self) {
    return $self->ffi_sub('PyModule_AddObject')->();
}

sub module_addstringconstant ($self) {
    return $self->ffi_sub('PyModule_AddStringConstant')->();
}

sub module_create2 ($self) {
    return $self->ffi_sub('PyModule_Create2')->();
}

sub module_execdef ($self) {
    return $self->ffi_sub('PyModule_ExecDef')->();
}

sub module_fromdefandspec2 ($self) {
    return $self->ffi_sub('PyModule_FromDefAndSpec2')->();
}

sub module_getdef ($self) {
    return $self->ffi_sub('PyModule_GetDef')->();
}

sub module_getdict ($self) {
    return $self->ffi_sub('PyModule_GetDict')->();
}

sub module_getfilename ($self) {
    return $self->ffi_sub('PyModule_GetFilename')->();
}

sub module_getfilenameobject ($self) {
    return $self->ffi_sub('PyModule_GetFilenameObject')->();
}

sub module_getname ($self) {
    return $self->ffi_sub('PyModule_GetName')->();
}

sub module_getnameobject ($self) {
    return $self->ffi_sub('PyModule_GetNameObject')->();
}

sub module_getstate ($self) {
    return $self->ffi_sub('PyModule_GetState')->();
}

sub module_new ($self) {
    return $self->ffi_sub('PyModule_New')->();
}

sub module_newobject ($self) {
    return $self->ffi_sub('PyModule_NewObject')->();
}

sub module_setdocstring ($self) {
    return $self->ffi_sub('PyModule_SetDocString')->();
}


no Python::FFI::Role;

1;
