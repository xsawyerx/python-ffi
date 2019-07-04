package Python::FFI::API::ModuleDef;

use Python::FFI::Role;

around 'ffi_subs_data' => sub ($orig, $self, @args){
    return +{
        %{ $self->$orig(@args) },

        'PyModuleDef_Init' => [ ['struct PyModuleDef*'] => 'opaque' ],
    };
};

sub moduledef_init ($self) {
    return $self->ffi_sub('PyModuleDef_Init')->();
}


no Python::FFI::Role;

1;
