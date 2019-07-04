package Python::FFI::API::ExceptionClass;

use Python::FFI::Role;

around 'ffi_subs_data' => sub ($orig, $self, @args){
    return +{
        %{ $self->$orig(@args) },

        'PyExceptionClass_Name' => [ ['opaque'] => 'string' ],
    };
};

sub exceptionclass_name ($self) {
    return $self->ffi_sub('PyExceptionClass_Name')->();
}


no Python::FFI::Role;

1;
