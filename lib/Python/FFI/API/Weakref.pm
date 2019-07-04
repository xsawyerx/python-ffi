package Python::FFI::API::Weakref;

use Python::FFI::Role;

around 'ffi_subs_data' => sub ($orig, $self, @args){
    return +{
        %{ $self->$orig(@args) },

        'PyWeakref_GetObject' => [ ['opaque'] => 'opaque' ],
        'PyWeakref_NewProxy' => [ [ 'opaque', 'opaque' ] => 'opaque' ],
        'PyWeakref_NewRef' => [ [ 'opaque', 'opaque' ] => 'opaque' ],
    };
};

sub weakref_getobject ($self) {
    return $self->ffi_sub('PyWeakref_GetObject')->();
}

sub weakref_newproxy ($self) {
    return $self->ffi_sub('PyWeakref_NewProxy')->();
}

sub weakref_newref ($self) {
    return $self->ffi_sub('PyWeakref_NewRef')->();
}


no Python::FFI::Role;

1;
