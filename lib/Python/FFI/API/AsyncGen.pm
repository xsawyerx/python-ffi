package Python::FFI::API::AsyncGen;

use Python::FFI::Role;

around 'ffi_subs_data' => sub ($orig, $self, @args){
    return +{
        %{ $self->$orig(@args) },

        'PyAsyncGen_New' => [ [ 'struct _frame *', 'opaque', 'opaque' ] => 'opaque' ],
    };
};

sub asyncgen_new ($self) {
    return $self->ffi_sub('PyAsyncGen_New')->();
}


no Python::FFI::Role;

1;
