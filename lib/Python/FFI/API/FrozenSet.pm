package Python::FFI::API::FrozenSet;

use Python::FFI::Role;

around 'ffi_subs_data' => sub ($orig, $self, @args){
    return +{
        %{ $self->$orig(@args) },

        'PyFrozenSet_New' => [ [ 'opaque' ] => 'opaque' ],
    };
};

sub frozenset_new ($self) {
    return $self->ffi_sub('PyFrozenSet_New')->();
}


no Python::FFI::Role;

1;
