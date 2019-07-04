package Python::FFI::API::Index;

use Python::FFI::Role;

around 'ffi_subs_data' => sub ($orig, $self, @args){
    return +{
        %{ $self->$orig(@args) },

        'PyIndex_Check' => [ [ 'opaque' ] => 'int' ],
    };
};

sub index_check ($self) {
    return $self->ffi_sub('PyIndex_Check')->();
}


no Python::FFI::Role;

1;
