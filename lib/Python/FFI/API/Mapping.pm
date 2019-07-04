package Python::FFI::API::Mapping;

use Python::FFI::Role;

around 'ffi_subs_data' => sub ($orig, $self, @args){
    return +{
        %{ $self->$orig(@args) },

        'PyMapping_Check' => [ [ 'opaque' ] => 'int' ],
        'PyMapping_GetItemString' => [ [ 'opaque', 'string' ] => 'opaque' ],
        'PyMapping_HasKey' => [ [ 'opaque', 'opaque' ] => 'int' ],
        'PyMapping_HasKeyString' => [ [ 'opaque', 'string' ] => 'int' ],
        'PyMapping_Items' => [ [ 'opaque' ] => 'opaque' ],
        'PyMapping_Keys' => [ [ 'opaque' ] => 'opaque' ],
        'PyMapping_Length' => [ [ 'opaque' ] => 'Py_ssize_t' ],
        'PyMapping_SetItemString' => [ [ 'opaque', 'string', 'opaque' ] => 'int' ],
        'PyMapping_Size' => [ [ 'opaque' ] => 'Py_ssize_t' ],
        'PyMapping_Values' => [ [ 'opaque' ] => 'opaque' ],
    };
};

sub mapping_check ($self) {
    return $self->ffi_sub('PyMapping_Check')->();
}

sub mapping_getitemstring ($self) {
    return $self->ffi_sub('PyMapping_GetItemString')->();
}

sub mapping_haskey ($self) {
    return $self->ffi_sub('PyMapping_HasKey')->();
}

sub mapping_haskeystring ($self) {
    return $self->ffi_sub('PyMapping_HasKeyString')->();
}

sub mapping_items ($self) {
    return $self->ffi_sub('PyMapping_Items')->();
}

sub mapping_keys ($self) {
    return $self->ffi_sub('PyMapping_Keys')->();
}

sub mapping_length ($self) {
    return $self->ffi_sub('PyMapping_Length')->();
}

sub mapping_setitemstring ($self) {
    return $self->ffi_sub('PyMapping_SetItemString')->();
}

sub mapping_size ($self) {
    return $self->ffi_sub('PyMapping_Size')->();
}

sub mapping_values ($self) {
    return $self->ffi_sub('PyMapping_Values')->();
}


no Python::FFI::Role;

1;
