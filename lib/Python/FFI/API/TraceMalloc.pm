package Python::FFI::API::TraceMalloc;

use Python::FFI::Role;

around 'ffi_subs_data' => sub ($orig, $self, @args){
    return +{
        %{ $self->$orig(@args) },

        'PyTraceMalloc_Track' => [ [ 'unsigned int', 'uintptr_t ptr', 'size_t size' ] => 'int' ],
        'PyTraceMalloc_Untrack' => [ [ 'unsigned int', 'uintptr_t ptr' ] => 'int' ],
    };
};

sub tracemalloc_track ($self) {
    return $self->ffi_sub('PyTraceMalloc_Track')->();
}

sub tracemalloc_untrack ($self) {
    return $self->ffi_sub('PyTraceMalloc_Untrack')->();
}


no Python::FFI::Role;

1;
