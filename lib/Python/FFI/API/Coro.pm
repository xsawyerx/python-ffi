package Python::FFI::API::Coro;

use Python::FFI::Role;

around 'ffi_subs_data' => sub ($orig, $self, @args){
    return +{
        %{ $self->$orig(@args) },

        'PyCoro_New' => [ [ 'struct _frame *', 'opaque', 'opaque' ] => 'opaque' ],
    };
};

sub coro_new ($self) {
    return $self->ffi_sub('PyCoro_New')->();
}


no Python::FFI::Role;

1;
