package Python::FFI::API::MemoryView;

use Python::FFI::Role;

around 'ffi_subs_data' => sub ($orig, $self, @args){
    return +{
        %{ $self->$orig(@args) },

        'PyMemoryView_FromBuffer' => [ [ 'Py_buffer *' ] => 'opaque' ],
        'PyMemoryView_FromMemory' => [ [ 'char *', 'Py_ssize_t size', 'int' ] => 'opaque' ],
        'PyMemoryView_FromObject' => [ [ 'opaque' ] => 'opaque' ],
        'PyMemoryView_GetContiguous' => [ [ 'opaque', 'int', 'char order' ] => 'opaque' ],
    };
};

sub memoryview_frombuffer ($self) {
    return $self->ffi_sub('PyMemoryView_FromBuffer')->();
}

sub memoryview_frommemory ($self) {
    return $self->ffi_sub('PyMemoryView_FromMemory')->();
}

sub memoryview_fromobject ($self) {
    return $self->ffi_sub('PyMemoryView_FromObject')->();
}

sub memoryview_getcontiguous ($self) {
    return $self->ffi_sub('PyMemoryView_GetContiguous')->();
}


no Python::FFI::Role;

1;
