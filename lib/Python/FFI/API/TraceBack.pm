package Python::FFI::API::TraceBack;

use Python::FFI::Role;

around 'ffi_subs_data' => sub ($orig, $self, @args){
    return +{
        %{ $self->$orig(@args) },

        'PyTraceBack_Here' => [ ['struct _frame *'] => 'int' ],
        'PyTraceBack_Print' => [ [ 'opaque', 'opaque' ] => 'int' ],
    };
};

sub traceback_here ($self) {
    return $self->ffi_sub('PyTraceBack_Here')->();
}

sub traceback_print ($self) {
    return $self->ffi_sub('PyTraceBack_Print')->();
}


no Python::FFI::Role;

1;
