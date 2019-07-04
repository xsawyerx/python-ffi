package Python::FFI::API::CallIter;

use Python::FFI::Role;

around 'ffi_subs_data' => sub ($orig, $self, @args){
    return +{
        %{ $self->$orig(@args) },

        'PyCallIter_New' => [ [ 'opaque', 'opaque' ] => 'opaque' ],
    };
};

sub calliter_new ($self) {
    return $self->ffi_sub('PyCallIter_New')->();
}


no Python::FFI::Role;

1;
