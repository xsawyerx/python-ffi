package Python::FFI::API::ContextVar;

use Python::FFI::Role;

around 'ffi_subs_data' => sub ($orig, $self, @args){
    return +{
        %{ $self->$orig(@args) },

        'PyContextVar_Get' => [ [ 'opaque', 'PyObject *_value', 'PyObject **' ] => 'int' ],
        'PyContextVar_New' => [ [ 'string', 'PyObject *_value' ] => 'opaque' ],
        'PyContextVar_Reset' => [ [ 'opaque', 'opaque' ] => 'int' ],
        'PyContextVar_Set' => [ [ 'opaque', 'opaque' ] => 'opaque' ],
    };
};

sub contextvar_get ($self) {
    return $self->ffi_sub('PyContextVar_Get')->();
}

sub contextvar_new ($self) {
    return $self->ffi_sub('PyContextVar_New')->();
}

sub contextvar_reset ($self) {
    return $self->ffi_sub('PyContextVar_Reset')->();
}

sub contextvar_set ($self) {
    return $self->ffi_sub('PyContextVar_Set')->();
}


no Python::FFI::Role;

1;
