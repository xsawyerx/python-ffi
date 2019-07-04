package Python::FFI::API::Bool;

use Python::FFI::Role;

around 'ffi_subs_data' => sub ($orig, $self, @args){
    return +{
        %{ $self->$orig(@args) },

        'PyBool_FromLong' => [ ['long'] => 'opaque' ],
    };
};

sub bool_fromlong ($self) {
    return $self->ffi_sub('PyBool_FromLong')->();
}


no Python::FFI::Role;

1;
