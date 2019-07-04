package Python::FFI::API::StaticMethod;

use Python::FFI::Role;

around 'ffi_subs_data' => sub ($orig, $self, @args){
    return +{
        %{ $self->$orig(@args) },

        'PyStaticMethod_New' => [ ['opaque'] => 'opaque' ],
    };
};

sub staticmethod_new ($self) {
    return $self->ffi_sub('PyStaticMethod_New')->();
}


no Python::FFI::Role;

1;
