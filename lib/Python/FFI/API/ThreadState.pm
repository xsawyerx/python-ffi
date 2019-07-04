package Python::FFI::API::ThreadState;

use Python::FFI::Role;

around 'ffi_subs_data' => sub ($orig, $self, @args){
    return +{
        %{ $self->$orig(@args) },

        'PyThreadState_Clear' => [ ['PyThreadState *'] => 'void' ],
        'PyThreadState_Delete' => [ ['PyThreadState *'] => 'void' ],
        'PyThreadState_DeleteCurrent' => [ [] => 'void' ],
        'PyThreadState_Get' => [ [] => 'PyThreadState *' ],
        'PyThreadState_GetDict' => [ [] => 'opaque' ],
        'PyThreadState_New' => [ ['PyInterpreterState *'] => 'PyThreadState *' ],
        'PyThreadState_SetAsyncExc' => [ [ 'unsigned long', 'opaque' ] => 'int' ],
        'PyThreadState_Swap' => [ ['PyThreadState *'] => 'PyThreadState *' ],
    };
};

sub threadstate_clear ($self) {
    return $self->ffi_sub('PyThreadState_Clear')->();
}

sub threadstate_delete ($self) {
    return $self->ffi_sub('PyThreadState_Delete')->();
}

sub threadstate_deletecurrent ($self) {
    return $self->ffi_sub('PyThreadState_DeleteCurrent')->();
}

sub threadstate_get ($self) {
    return $self->ffi_sub('PyThreadState_Get')->();
}

sub threadstate_getdict ($self) {
    return $self->ffi_sub('PyThreadState_GetDict')->();
}

sub threadstate_new ($self) {
    return $self->ffi_sub('PyThreadState_New')->();
}

sub threadstate_setasyncexc ($self) {
    return $self->ffi_sub('PyThreadState_SetAsyncExc')->();
}

sub threadstate_swap ($self) {
    return $self->ffi_sub('PyThreadState_Swap')->();
}


no Python::FFI::Role;

1;
