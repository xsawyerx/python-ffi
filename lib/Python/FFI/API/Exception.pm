package Python::FFI::API::Exception;

use Python::FFI::Role;

around 'ffi_subs_data' => sub ($orig, $self, @args){
    return +{
        %{ $self->$orig(@args) },

        'PyException_GetCause' => [ [ 'opaque' ] => 'opaque' ],
        'PyException_GetContext' => [ [ 'opaque' ] => 'opaque' ],
        'PyException_GetTraceback' => [ [ 'opaque' ] => 'opaque' ],
        'PyException_SetCause' => [ [ 'opaque', 'opaque' ] => 'void' ],
        'PyException_SetContext' => [ [ 'opaque', 'opaque' ] => 'void' ],
        'PyException_SetTraceback' => [ [ 'opaque', 'opaque' ] => 'int' ],
    };
};

sub exception_getcause ($self) {
    return $self->ffi_sub('PyException_GetCause')->();
}

sub exception_getcontext ($self) {
    return $self->ffi_sub('PyException_GetContext')->();
}

sub exception_gettraceback ($self) {
    return $self->ffi_sub('PyException_GetTraceback')->();
}

sub exception_setcause ($self) {
    return $self->ffi_sub('PyException_SetCause')->();
}

sub exception_setcontext ($self) {
    return $self->ffi_sub('PyException_SetContext')->();
}

sub exception_settraceback ($self) {
    return $self->ffi_sub('PyException_SetTraceback')->();
}


no Python::FFI::Role;

1;
