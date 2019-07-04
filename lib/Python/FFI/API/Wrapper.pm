package Python::FFI::API::Wrapper;

use Python::FFI::Role;

around 'ffi_subs_data' => sub ($orig, $self, @args){
    return +{
        %{ $self->$orig(@args) },

        'PyWrapper_New' => [ [ 'opaque', 'opaque' ] => 'opaque' ],
    };
};

sub wrapper_new ($self) {
    return $self->ffi_sub('PyWrapper_New')->();
}


no Python::FFI::Role;

1;
