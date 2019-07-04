package Python::FFI::API::ODict;

use Python::FFI::Role;

around 'ffi_subs_data' => sub ($orig, $self, @args){
    return +{
        %{ $self->$orig(@args) },

        'PyODict_DelItem' => [ [ 'opaque', 'opaque' ] => 'int' ],
        'PyODict_New' => [ [ 'void' ] => 'opaque' ],
        'PyODict_SetItem' => [ [ 'opaque', 'opaque', 'opaque' ] => 'int' ],
    };
};

sub odict_delitem ($self) {
    return $self->ffi_sub('PyODict_DelItem')->();
}

sub odict_new ($self) {
    return $self->ffi_sub('PyODict_New')->();
}

sub odict_setitem ($self) {
    return $self->ffi_sub('PyODict_SetItem')->();
}


no Python::FFI::Role;

1;
