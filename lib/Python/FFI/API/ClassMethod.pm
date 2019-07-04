package Python::FFI::API::ClassMethod;

use Python::FFI::Role;

around 'ffi_subs_data' => sub ($orig, $self, @args){
    return +{
        %{ $self->$orig(@args) },

        'PyClassMethod_New' => [ [ 'opaque' ] => 'opaque' ],
    };
};

sub classmethod_new ($self) {
    return $self->ffi_sub('PyClassMethod_New')->();
}


no Python::FFI::Role;

1;
