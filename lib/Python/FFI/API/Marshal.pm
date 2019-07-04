package Python::FFI::API::Marshal;

use Python::FFI::Role;

around 'ffi_subs_data' => sub ($orig, $self, @args){
    return +{
        %{ $self->$orig(@args) },

        'PyMarshal_ReadLastObjectFromFile' => [ ['FILE *'] => 'opaque' ],
        'PyMarshal_ReadLongFromFile' => [ ['FILE *'] => 'long' ],
        'PyMarshal_ReadObjectFromFile' => [ ['FILE *'] => 'opaque' ],
        'PyMarshal_ReadObjectFromString' => [ [ 'string', 'Py_ssize_t' ] => 'opaque' ],
        'PyMarshal_ReadShortFromFile' => [ ['FILE *'] => 'int' ],
        'PyMarshal_WriteLongToFile' => [ [ 'long', 'FILE *', 'int' ] => 'void' ],
        'PyMarshal_WriteObjectToFile' => [ [ 'opaque', 'FILE *', 'int' ] => 'void' ],
        'PyMarshal_WriteObjectToString' => [ [ 'opaque', 'int' ] => 'opaque' ],
    };
};

sub marshal_readlastobjectfromfile ($self) {
    return $self->ffi_sub('PyMarshal_ReadLastObjectFromFile')->();
}

sub marshal_readlongfromfile ($self) {
    return $self->ffi_sub('PyMarshal_ReadLongFromFile')->();
}

sub marshal_readobjectfromfile ($self) {
    return $self->ffi_sub('PyMarshal_ReadObjectFromFile')->();
}

sub marshal_readobjectfromstring ($self) {
    return $self->ffi_sub('PyMarshal_ReadObjectFromString')->();
}

sub marshal_readshortfromfile ($self) {
    return $self->ffi_sub('PyMarshal_ReadShortFromFile')->();
}

sub marshal_writelongtofile ($self) {
    return $self->ffi_sub('PyMarshal_WriteLongToFile')->();
}

sub marshal_writeobjecttofile ($self) {
    return $self->ffi_sub('PyMarshal_WriteObjectToFile')->();
}

sub marshal_writeobjecttostring ($self) {
    return $self->ffi_sub('PyMarshal_WriteObjectToString')->();
}


no Python::FFI::Role;

1;
