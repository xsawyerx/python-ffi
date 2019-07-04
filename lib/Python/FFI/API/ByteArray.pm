package Python::FFI::API::ByteArray;

use Python::FFI::Role;

around 'ffi_subs_data' => sub ($orig, $self, @args){
    return +{
        %{ $self->$orig(@args) },

        'PyByteArray_AsString' => [ [ 'opaque' ] => 'char *' ],
        'PyByteArray_Concat' => [ [ 'opaque', 'opaque' ] => 'opaque' ],
        'PyByteArray_FromObject' => [ [ 'opaque' ] => 'opaque' ],
        'PyByteArray_FromStringAndSize' => [ [ 'string', 'Py_ssize_t' ] => 'opaque' ],
        'PyByteArray_Resize' => [ [ 'opaque', 'Py_ssize_t' ] => 'int' ],
        'PyByteArray_Size' => [ [ 'opaque' ] => 'Py_ssize_t' ],
    };
};

sub bytearray_asstring ($self) {
    return $self->ffi_sub('PyByteArray_AsString')->();
}

sub bytearray_concat ($self) {
    return $self->ffi_sub('PyByteArray_Concat')->();
}

sub bytearray_fromobject ($self) {
    return $self->ffi_sub('PyByteArray_FromObject')->();
}

sub bytearray_fromstringandsize ($self) {
    return $self->ffi_sub('PyByteArray_FromStringAndSize')->();
}

sub bytearray_resize ($self) {
    return $self->ffi_sub('PyByteArray_Resize')->();
}

sub bytearray_size ($self) {
    return $self->ffi_sub('PyByteArray_Size')->();
}


no Python::FFI::Role;

1;
