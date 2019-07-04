package Python::FFI::API::Arena;

use Python::FFI::Role;

around 'ffi_subs_data' => sub ($orig, $self, @args){
    return +{
        %{ $self->$orig(@args) },

        'PyArena_AddPyObject' => [ [ 'PyArena *', 'opaque' ] => 'int' ],
        'PyArena_Free' => [ [ 'PyArena *' ] => 'void' ],
        'PyArena_Malloc' => [ [ 'PyArena *', 'size_t size' ] => 'void *' ],
        'PyArena_New' => [ [ 'void' ] => 'PyArena *' ],
    };
};

sub arena_addpyobject ($self) {
    return $self->ffi_sub('PyArena_AddPyObject')->();
}

sub arena_free ($self) {
    return $self->ffi_sub('PyArena_Free')->();
}

sub arena_malloc ($self) {
    return $self->ffi_sub('PyArena_Malloc')->();
}

sub arena_new ($self) {
    return $self->ffi_sub('PyArena_New')->();
}


no Python::FFI::Role;

1;
