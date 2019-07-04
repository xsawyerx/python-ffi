package Python::FFI::API::GILState;

use Python::FFI::Role;

around 'ffi_subs_data' => sub ($orig, $self, @args){
    return +{
        %{ $self->$orig(@args) },

        'PyGILState_Ensure' => [ [ 'void' ] => 'PyGILState_STATE' ],
        'PyGILState_GetThisThreadState' => [ [ 'void' ] => 'PyThreadState *' ],
        'PyGILState_Release' => [ [ 'PyGILState_STATE' ] => 'void' ],
    };
};

sub gilstate_ensure ($self) {
    return $self->ffi_sub('PyGILState_Ensure')->();
}

sub gilstate_getthisthreadstate ($self) {
    return $self->ffi_sub('PyGILState_GetThisThreadState')->();
}

sub gilstate_release ($self) {
    return $self->ffi_sub('PyGILState_Release')->();
}


no Python::FFI::Role;

1;
