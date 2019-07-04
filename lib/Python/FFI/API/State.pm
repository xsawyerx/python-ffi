package Python::FFI::API::State;

use Python::FFI::Role;

around 'ffi_subs_data' => sub ($orig, $self, @args){
    return +{
        %{ $self->$orig(@args) },

        'PyState_AddModule' => [ [ 'PyObject*', 'struct PyModuleDef*' ] => 'int' ],
        'PyState_FindModule' => [ ['struct PyModuleDef*'] => 'PyObject*' ],
        'PyState_RemoveModule' => [ ['struct PyModuleDef*'] => 'int' ],
    };
};

sub state_addmodule ($self) {
    return $self->ffi_sub('PyState_AddModule')->();
}

sub state_findmodule ($self) {
    return $self->ffi_sub('PyState_FindModule')->();
}

sub state_removemodule ($self) {
    return $self->ffi_sub('PyState_RemoveModule')->();
}


no Python::FFI::Role;

1;
