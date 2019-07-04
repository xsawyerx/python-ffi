package Python::FFI::API::UnicodeTranslateError;

use Python::FFI::Role;

around 'ffi_subs_data' => sub ($orig, $self, @args){
    return +{
        %{ $self->$orig(@args) },

        'PyUnicodeTranslateError_GetEnd' => [ [ 'opaque', 'Py_ssize_t *' ] => 'int' ],
        'PyUnicodeTranslateError_GetObject' => [ ['opaque'] => 'opaque' ],
        'PyUnicodeTranslateError_GetReason' => [ ['opaque'] => 'opaque' ],
        'PyUnicodeTranslateError_GetStart' => [ [ 'opaque', 'Py_ssize_t *' ] => 'int' ],
        'PyUnicodeTranslateError_SetEnd' => [ [ 'opaque', 'Py_ssize_t' ] => 'int' ],
        'PyUnicodeTranslateError_SetReason' => [ [ 'opaque', 'string' ] => 'int' ],
        'PyUnicodeTranslateError_SetStart' => [ [ 'opaque', 'Py_ssize_t' ] => 'int' ],
    };
};

sub unicodetranslateerror_getend ($self) {
    return $self->ffi_sub('PyUnicodeTranslateError_GetEnd')->();
}

sub unicodetranslateerror_getobject ($self) {
    return $self->ffi_sub('PyUnicodeTranslateError_GetObject')->();
}

sub unicodetranslateerror_getreason ($self) {
    return $self->ffi_sub('PyUnicodeTranslateError_GetReason')->();
}

sub unicodetranslateerror_getstart ($self) {
    return $self->ffi_sub('PyUnicodeTranslateError_GetStart')->();
}

sub unicodetranslateerror_setend ($self) {
    return $self->ffi_sub('PyUnicodeTranslateError_SetEnd')->();
}

sub unicodetranslateerror_setreason ($self) {
    return $self->ffi_sub('PyUnicodeTranslateError_SetReason')->();
}

sub unicodetranslateerror_setstart ($self) {
    return $self->ffi_sub('PyUnicodeTranslateError_SetStart')->();
}


no Python::FFI::Role;

1;
