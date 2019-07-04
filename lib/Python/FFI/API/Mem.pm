package Python::FFI::API::Mem;

use Python::FFI::Role;

around 'ffi_subs_data' => sub ($orig, $self, @args){
    return +{
        %{ $self->$orig(@args) },

        'PyMem_Free' => [ [ 'void *' ] => 'void' ],
        'PyMem_Malloc' => [ [ 'size_t size' ] => 'void *' ],
        'PyMem_Realloc' => [ [ 'void *', 'size_t new_size' ] => 'void *' ],
    };
};

sub mem_free ($self) {
    return $self->ffi_sub('PyMem_Free')->();
}

sub mem_malloc ($self) {
    return $self->ffi_sub('PyMem_Malloc')->();
}

sub mem_realloc ($self) {
    return $self->ffi_sub('PyMem_Realloc')->();
}


no Python::FFI::Role;

1;
