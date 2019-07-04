package Python::FFI::API::UnicodeDecodeError;

use Python::FFI::Role;

around 'ffi_subs_data' => sub ($orig, $self, @args){
    return +{
        %{ $self->$orig(@args) },

        'PyUnicodeDecodeError_Create' => [ [ 'string', 'string', 'Py_ssize_t length', 'Py_ssize_t start', 'Py_ssize_t end', 'string' ] => 'opaque' ],
        'PyUnicodeDecodeError_GetEncoding' => [ [ 'opaque' ] => 'opaque' ],
        'PyUnicodeDecodeError_GetEnd' => [ [ 'opaque', 'Py_ssize_t *' ] => 'int' ],
        'PyUnicodeDecodeError_GetObject' => [ [ 'opaque' ] => 'opaque' ],
        'PyUnicodeDecodeError_GetReason' => [ [ 'opaque' ] => 'opaque' ],
        'PyUnicodeDecodeError_GetStart' => [ [ 'opaque', 'Py_ssize_t *' ] => 'int' ],
        'PyUnicodeDecodeError_SetEnd' => [ [ 'opaque', 'Py_ssize_t' ] => 'int' ],
        'PyUnicodeDecodeError_SetReason' => [ [ 'opaque', 'string' ] => 'int' ],
        'PyUnicodeDecodeError_SetStart' => [ [ 'opaque', 'Py_ssize_t' ] => 'int' ],
    };
};

sub unicodedecodeerror_create ($self) {
    return $self->ffi_sub('PyUnicodeDecodeError_Create')->();
}

sub unicodedecodeerror_getencoding ($self) {
    return $self->ffi_sub('PyUnicodeDecodeError_GetEncoding')->();
}

sub unicodedecodeerror_getend ($self) {
    return $self->ffi_sub('PyUnicodeDecodeError_GetEnd')->();
}

sub unicodedecodeerror_getobject ($self) {
    return $self->ffi_sub('PyUnicodeDecodeError_GetObject')->();
}

sub unicodedecodeerror_getreason ($self) {
    return $self->ffi_sub('PyUnicodeDecodeError_GetReason')->();
}

sub unicodedecodeerror_getstart ($self) {
    return $self->ffi_sub('PyUnicodeDecodeError_GetStart')->();
}

sub unicodedecodeerror_setend ($self) {
    return $self->ffi_sub('PyUnicodeDecodeError_SetEnd')->();
}

sub unicodedecodeerror_setreason ($self) {
    return $self->ffi_sub('PyUnicodeDecodeError_SetReason')->();
}

sub unicodedecodeerror_setstart ($self) {
    return $self->ffi_sub('PyUnicodeDecodeError_SetStart')->();
}


no Python::FFI::Role;

1;
