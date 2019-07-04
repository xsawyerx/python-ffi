package Python::FFI::API::Bytes;

use Python::FFI::Role;

around 'ffi_subs_data' => sub ($orig, $self, @args){
    return +{
        %{ $self->$orig(@args) },

        'PyBytes_AsString' => [ ['opaque'] => 'char *' ],
        'PyBytes_AsStringAndSize' => [ [ 'opaque', 'char **', 'Py_ssize_t *     /* pointer to length variable or NULL(only possible for 0-terminatedstrings' ] => 'int' ],
        'PyBytes_Concat' => [ [ 'PyObject **', 'opaque' ] => 'void' ],
        'PyBytes_ConcatAndDel' => [ [ 'PyObject **', 'opaque' ] => 'void' ],
        'PyBytes_DecodeEscape' => [ [ 'string', 'Py_ssize_t', 'string', 'Py_ssize_t', 'string' ] => 'opaque' ],
        'PyBytes_FromFormat' => [ [ 'const char*', '...' ] => 'opaque' ],
        'PyBytes_FromFormatV' => [ [ 'const char*', 'va_list' ] => 'opaque' ],
        'PyBytes_FromObject' => [ ['opaque'] => 'opaque' ],
        'PyBytes_FromString' => [ ['string'] => 'opaque' ],
        'PyBytes_FromStringAndSize' => [ [ 'string', 'Py_ssize_t' ] => 'opaque' ],
        'PyBytes_Repr' => [ [ 'opaque', 'int' ] => 'opaque' ],
        'PyBytes_Size' => [ ['opaque'] => 'Py_ssize_t' ],
    };
};

sub bytes_asstring ($self) {
    return $self->ffi_sub('PyBytes_AsString')->();
}

sub bytes_asstringandsize ($self) {
    return $self->ffi_sub('PyBytes_AsStringAndSize')->();
}

sub bytes_concat ($self) {
    return $self->ffi_sub('PyBytes_Concat')->();
}

sub bytes_concatanddel ($self) {
    return $self->ffi_sub('PyBytes_ConcatAndDel')->();
}

sub bytes_decodeescape ($self) {
    return $self->ffi_sub('PyBytes_DecodeEscape')->();
}

sub bytes_fromformat ($self) {
    return $self->ffi_sub('PyBytes_FromFormat')->();
}

sub bytes_fromformatv ($self) {
    return $self->ffi_sub('PyBytes_FromFormatV')->();
}

sub bytes_fromobject ($self) {
    return $self->ffi_sub('PyBytes_FromObject')->();
}

sub bytes_fromstring ($self) {
    return $self->ffi_sub('PyBytes_FromString')->();
}

sub bytes_fromstringandsize ($self) {
    return $self->ffi_sub('PyBytes_FromStringAndSize')->();
}

sub bytes_repr ($self) {
    return $self->ffi_sub('PyBytes_Repr')->();
}

sub bytes_size ($self) {
    return $self->ffi_sub('PyBytes_Size')->();
}


no Python::FFI::Role;

1;
