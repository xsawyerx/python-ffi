package Python::FFI::API::Method;

use Python::FFI::Role;

around 'ffi_subs_data' => sub ($orig, $self, @args){
    return +{
        %{ $self->$orig(@args) },

        'PyMethod_ClearFreeList' => [ [ 'void' ] => 'int' ],
        'PyMethod_Function' => [ [ 'opaque' ] => 'opaque' ],
        'PyMethod_New' => [ [ 'opaque', 'opaque' ] => 'opaque' ],
        'PyMethod_Self' => [ [ 'opaque' ] => 'opaque' ],
    };
};

sub method_clearfreelist ($self) {
    return $self->ffi_sub('PyMethod_ClearFreeList')->();
}

sub method_function ($self) {
    return $self->ffi_sub('PyMethod_Function')->();
}

sub method_new ($self) {
    return $self->ffi_sub('PyMethod_New')->();
}

sub method_self ($self) {
    return $self->ffi_sub('PyMethod_Self')->();
}


no Python::FFI::Role;

1;
