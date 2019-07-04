package Python::FFI::API::UnicodeEncodeError;

use Python::FFI::Role;

around 'ffi_subs_data' => sub ($orig, $self, @args){
    return +{
        %{ $self->$orig(@args) },

        'PyUnicodeEncodeError_GetEncoding' => [ ['opaque'] => 'opaque' ],
        'PyUnicodeEncodeError_GetEnd' => [ [ 'opaque', 'Py_ssize_t *' ] => 'int' ],
        'PyUnicodeEncodeError_GetObject' => [ ['opaque'] => 'opaque' ],
        'PyUnicodeEncodeError_GetReason' => [ ['opaque'] => 'opaque' ],
        'PyUnicodeEncodeError_GetStart' => [ [ 'opaque', 'Py_ssize_t *' ] => 'int' ],
        'PyUnicodeEncodeError_SetEnd' => [ [ 'opaque', 'Py_ssize_t' ] => 'int' ],
        'PyUnicodeEncodeError_SetReason' => [ [ 'opaque', 'string' ] => 'int' ],
        'PyUnicodeEncodeError_SetStart' => [ [ 'opaque', 'Py_ssize_t' ] => 'int' ],
    };
};

sub unicodeencodeerror_getencoding ($self) {
    return $self->ffi_sub('PyUnicodeEncodeError_GetEncoding')->();
}

sub unicodeencodeerror_getend ($self) {
    return $self->ffi_sub('PyUnicodeEncodeError_GetEnd')->();
}

sub unicodeencodeerror_getobject ($self) {
    return $self->ffi_sub('PyUnicodeEncodeError_GetObject')->();
}

sub unicodeencodeerror_getreason ($self) {
    return $self->ffi_sub('PyUnicodeEncodeError_GetReason')->();
}

sub unicodeencodeerror_getstart ($self) {
    return $self->ffi_sub('PyUnicodeEncodeError_GetStart')->();
}

sub unicodeencodeerror_setend ($self) {
    return $self->ffi_sub('PyUnicodeEncodeError_SetEnd')->();
}

sub unicodeencodeerror_setreason ($self) {
    return $self->ffi_sub('PyUnicodeEncodeError_SetReason')->();
}

sub unicodeencodeerror_setstart ($self) {
    return $self->ffi_sub('PyUnicodeEncodeError_SetStart')->();
}


no Python::FFI::Role;

1;
