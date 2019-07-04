package Python::FFI::API::PickleBuffer;

use Python::FFI::Role;

around 'ffi_subs_data' => sub ($orig, $self, @args){
    return +{
        %{ $self->$orig(@args) },

        'PyPickleBuffer_FromObject' => [ [ 'opaque' ] => 'opaque' ],
        'PyPickleBuffer_GetBuffer' => [ [ 'opaque' ] => 'const Py_buffer *' ],
        'PyPickleBuffer_Release' => [ [ 'opaque' ] => 'int' ],
    };
};

sub picklebuffer_fromobject ($self) {
    return $self->ffi_sub('PyPickleBuffer_FromObject')->();
}

sub picklebuffer_getbuffer ($self) {
    return $self->ffi_sub('PyPickleBuffer_GetBuffer')->();
}

sub picklebuffer_release ($self) {
    return $self->ffi_sub('PyPickleBuffer_Release')->();
}


no Python::FFI::Role;

1;
