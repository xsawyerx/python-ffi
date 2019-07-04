package Python::FFI::API::Arg;

use Python::FFI::Role;

around 'ffi_subs_data' => sub ($orig, $self, @args){
    return +{
        %{ $self->$orig(@args) },

        'PyArg_Parse' => [ [ 'opaque', 'string', '...' ] => 'int' ],
        'PyArg_ParseTuple' => [ [ 'opaque', 'string', '...' ] => 'int' ],
        'PyArg_ParseTupleAndKeywords' => [ [ 'opaque', 'opaque', 'string', 'char **', '...' ] => 'int' ],
        'PyArg_UnpackTuple' => [ [ 'opaque', 'string', 'Py_ssize_t', 'Py_ssize_t', '...' ] => 'int' ],
        'PyArg_VaParse' => [ [ 'opaque', 'string', 'va_list' ] => 'int' ],
        'PyArg_VaParseTupleAndKeywords' => [ [ 'opaque', 'opaque', 'string', 'char **', 'va_list' ] => 'int' ],
        'PyArg_ValidateKeywordArguments' => [ ['opaque'] => 'int' ],
    };
};

sub arg_parse ($self) {
    return $self->ffi_sub('PyArg_Parse')->();
}

sub arg_parsetuple ($self) {
    return $self->ffi_sub('PyArg_ParseTuple')->();
}

sub arg_parsetupleandkeywords ($self) {
    return $self->ffi_sub('PyArg_ParseTupleAndKeywords')->();
}

sub arg_unpacktuple ($self) {
    return $self->ffi_sub('PyArg_UnpackTuple')->();
}

sub arg_vaparse ($self) {
    return $self->ffi_sub('PyArg_VaParse')->();
}

sub arg_vaparsetupleandkeywords ($self) {
    return $self->ffi_sub('PyArg_VaParseTupleAndKeywords')->();
}

sub arg_validatekeywordarguments ($self) {
    return $self->ffi_sub('PyArg_ValidateKeywordArguments')->();
}


no Python::FFI::Role;

1;
