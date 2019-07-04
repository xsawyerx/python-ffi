package Python::FFI::API::Gen;

use Python::FFI::Role;

around 'ffi_subs_data' => sub ($orig, $self, @args){
    return +{
        %{ $self->$orig(@args) },

        'PyGen_NeedsFinalizing' => [ ['PyGenObject *'] => 'int' ],
        'PyGen_New' => [ ['struct _frame *'] => 'opaque' ],
        'PyGen_NewWithQualName' => [ [ 'struct _frame *', 'opaque', 'opaque' ] => 'opaque' ],
    };
};

sub gen_needsfinalizing ($self) {
    return $self->ffi_sub('PyGen_NeedsFinalizing')->();
}

sub gen_new ($self) {
    return $self->ffi_sub('PyGen_New')->();
}

sub gen_newwithqualname ($self) {
    return $self->ffi_sub('PyGen_NewWithQualName')->();
}


no Python::FFI::Role;

1;
