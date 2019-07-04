package Python::FFI::API::DictProxy;

use Python::FFI::Role;

around 'ffi_subs_data' => sub ($orig, $self, @args){
    return +{
        %{ $self->$orig(@args) },

        'PyDictProxy_New' => [ [ 'opaque' ] => 'opaque' ],
    };
};

sub dictproxy_new ($self) {
    return $self->ffi_sub('PyDictProxy_New')->();
}


no Python::FFI::Role;

1;
