package Python::FFI::API::Callable;

use Python::FFI::Role;

around 'ffi_subs_data' => sub ($orig, $self, @args){
    return +{
        %{ $self->$orig(@args) },

        'PyCallable_Check' => [ ['opaque'] => 'int' ],
    };
};

sub callable_check ($self) {
    return $self->ffi_sub('PyCallable_Check')->();
}


no Python::FFI::Role;

1;
