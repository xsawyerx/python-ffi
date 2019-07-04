package Python::FFI::API::InstanceMethod;

use Python::FFI::Role;

around 'ffi_subs_data' => sub ($orig, $self, @args){
    return +{
        %{ $self->$orig(@args) },

        'PyInstanceMethod_Function' => [ [ 'opaque' ] => 'opaque' ],
        'PyInstanceMethod_New' => [ [ 'opaque' ] => 'opaque' ],
    };
};

sub instancemethod_function ($self) {
    return $self->ffi_sub('PyInstanceMethod_Function')->();
}

sub instancemethod_new ($self) {
    return $self->ffi_sub('PyInstanceMethod_New')->();
}


no Python::FFI::Role;

1;
