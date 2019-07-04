package Python::FFI::API::Iter;

use Python::FFI::Role;

around 'ffi_subs_data' => sub ($orig, $self, @args){
    return +{
        %{ $self->$orig(@args) },

        'PyIter_Check' => [ ['opaque'] => 'int' ],
        'PyIter_Next' => [ ['opaque'] => 'opaque' ],
    };
};

sub iter_check ($self) {
    return $self->ffi_sub('PyIter_Check')->();
}

sub iter_next ($self) {
    return $self->ffi_sub('PyIter_Next')->();
}


no Python::FFI::Role;

1;
