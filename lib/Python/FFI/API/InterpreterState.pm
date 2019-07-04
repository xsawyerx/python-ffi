package Python::FFI::API::InterpreterState;

use Python::FFI::Role;

around 'ffi_subs_data' => sub ($orig, $self, @args){
    return +{
        %{ $self->$orig(@args) },

        'PyInterpreterState_Clear' => [ [ 'PyInterpreterState *' ] => 'void' ],
        'PyInterpreterState_Delete' => [ [ 'PyInterpreterState *' ] => 'void' ],
        'PyInterpreterState_GetDict' => [ [ 'PyInterpreterState *' ] => 'opaque' ],
        'PyInterpreterState_GetID' => [ [ 'PyInterpreterState *' ] => 'int64_t' ],
        'PyInterpreterState_New' => [ [ 'void' ] => 'PyInterpreterState *' ],
    };
};

sub interpreterstate_clear ($self) {
    return $self->ffi_sub('PyInterpreterState_Clear')->();
}

sub interpreterstate_delete ($self) {
    return $self->ffi_sub('PyInterpreterState_Delete')->();
}

sub interpreterstate_getdict ($self) {
    return $self->ffi_sub('PyInterpreterState_GetDict')->();
}

sub interpreterstate_getid ($self) {
    return $self->ffi_sub('PyInterpreterState_GetID')->();
}

sub interpreterstate_new ($self) {
    return $self->ffi_sub('PyInterpreterState_New')->();
}


no Python::FFI::Role;

1;
