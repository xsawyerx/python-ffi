package Python::FFI::API::Context;

use Python::FFI::Role;

around 'ffi_subs_data' => sub ($orig, $self, @args){
    return +{
        %{ $self->$orig(@args) },

        'PyContext_ClearFreeList' => [ [ 'void' ] => 'int' ],
        'PyContext_Copy' => [ [ 'opaque' ] => 'opaque' ],
        'PyContext_CopyCurrent' => [ [ 'void' ] => 'opaque' ],
        'PyContext_Enter' => [ [ 'opaque' ] => 'int' ],
        'PyContext_Exit' => [ [ 'opaque' ] => 'int' ],
        'PyContext_New' => [ [ 'void' ] => 'opaque' ],
    };
};

sub context_clearfreelist ($self) {
    return $self->ffi_sub('PyContext_ClearFreeList')->();
}

sub context_copy ($self) {
    return $self->ffi_sub('PyContext_Copy')->();
}

sub context_copycurrent ($self) {
    return $self->ffi_sub('PyContext_CopyCurrent')->();
}

sub context_enter ($self) {
    return $self->ffi_sub('PyContext_Enter')->();
}

sub context_exit ($self) {
    return $self->ffi_sub('PyContext_Exit')->();
}

sub context_new ($self) {
    return $self->ffi_sub('PyContext_New')->();
}


no Python::FFI::Role;

1;
