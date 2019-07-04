package Python::FFI::API::Code;

use Python::FFI::Role;

around 'ffi_subs_data' => sub ($orig, $self, @args){
    return +{
        %{ $self->$orig(@args) },

        'PyCode_Addr2Line' => [ [ 'PyCodeObject *', 'int' ] => 'int' ],
        'PyCode_New' => [ [ 'int', 'int', 'int', 'int', 'int', 'opaque', 'opaque', 'opaque', 'opaque', 'opaque', 'opaque', 'opaque', 'opaque', 'int', 'opaque' ] => 'PyCodeObject *' ],
        'PyCode_NewEmpty' => [ [ 'string', 'string', 'int' ] => 'PyCodeObject *' ],
        'PyCode_NewWithPosOnlyArgs' => [ [ 'int', 'int', 'int', 'int', 'int', 'int', 'opaque', 'opaque', 'opaque', 'opaque', 'opaque', 'opaque', 'opaque', 'opaque', 'int', 'opaque' ] => 'PyCodeObject *' ],
        'PyCode_Optimize' => [ [ 'opaque', 'PyObject* consts', 'opaque', 'opaque' ] => 'PyObject*' ],
    };
};

sub code_addr2line ($self) {
    return $self->ffi_sub('PyCode_Addr2Line')->();
}

sub code_new ($self) {
    return $self->ffi_sub('PyCode_New')->();
}

sub code_newempty ($self) {
    return $self->ffi_sub('PyCode_NewEmpty')->();
}

sub code_newwithposonlyargs ($self) {
    return $self->ffi_sub('PyCode_NewWithPosOnlyArgs')->();
}

sub code_optimize ($self) {
    return $self->ffi_sub('PyCode_Optimize')->();
}


no Python::FFI::Role;

1;
