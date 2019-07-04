package Python::FFI::API::GC;

use Python::FFI::Role;

around 'ffi_subs_data' => sub ($orig, $self, @args){
    return +{
        %{ $self->$orig(@args) },

        'PyGC_Collect' => [ [] => 'Py_ssize_t' ],
    };
};

sub gc_collect ($self) {
    return $self->ffi_sub('PyGC_Collect')->();
}


no Python::FFI::Role;

1;
