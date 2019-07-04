package Python::FFI::API::ST;

use Python::FFI::Role;

around 'ffi_subs_data' => sub ($orig, $self, @args){
    return +{
        %{ $self->$orig(@args) },

        'PyST_GetScope' => [ [ 'PySTEntryObject *', 'opaque' ] => 'int' ],
    };
};

sub st_getscope ($self) {
    return $self->ffi_sub('PyST_GetScope')->();
}


no Python::FFI::Role;

1;
