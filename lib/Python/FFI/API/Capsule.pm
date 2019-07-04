package Python::FFI::API::Capsule;

use Python::FFI::Role;

around 'ffi_subs_data' => sub ($orig, $self, @args){
    return +{
        %{ $self->$orig(@args) },

        'PyCapsule_GetContext' => [ [ 'opaque' ] => 'void *' ],
        'PyCapsule_GetDestructor' => [ [ 'opaque' ] => 'PyCapsule_Destructor' ],
        'PyCapsule_GetName' => [ [ 'opaque' ] => 'string' ],
        'PyCapsule_GetPointer' => [ [ 'opaque', 'string' ] => 'void *' ],
        'PyCapsule_Import' => [ [ 'string', 'int_block' ] => 'void *' ],
        'PyCapsule_IsValid' => [ [ 'opaque', 'string' ] => 'int' ],
        'PyCapsule_New' => [ [ 'void *', 'string', 'PyCapsule_Destructor destructor' ] => 'opaque' ],
        'PyCapsule_SetContext' => [ [ 'opaque', 'void *' ] => 'int' ],
        'PyCapsule_SetDestructor' => [ [ 'opaque', 'PyCapsule_Destructor destructor' ] => 'int' ],
        'PyCapsule_SetName' => [ [ 'opaque', 'string' ] => 'int' ],
        'PyCapsule_SetPointer' => [ [ 'opaque', 'void *' ] => 'int' ],
    };
};

sub capsule_getcontext ($self) {
    return $self->ffi_sub('PyCapsule_GetContext')->();
}

sub capsule_getdestructor ($self) {
    return $self->ffi_sub('PyCapsule_GetDestructor')->();
}

sub capsule_getname ($self) {
    return $self->ffi_sub('PyCapsule_GetName')->();
}

sub capsule_getpointer ($self) {
    return $self->ffi_sub('PyCapsule_GetPointer')->();
}

sub capsule_import ($self) {
    return $self->ffi_sub('PyCapsule_Import')->();
}

sub capsule_isvalid ($self) {
    return $self->ffi_sub('PyCapsule_IsValid')->();
}

sub capsule_new ($self) {
    return $self->ffi_sub('PyCapsule_New')->();
}

sub capsule_setcontext ($self) {
    return $self->ffi_sub('PyCapsule_SetContext')->();
}

sub capsule_setdestructor ($self) {
    return $self->ffi_sub('PyCapsule_SetDestructor')->();
}

sub capsule_setname ($self) {
    return $self->ffi_sub('PyCapsule_SetName')->();
}

sub capsule_setpointer ($self) {
    return $self->ffi_sub('PyCapsule_SetPointer')->();
}


no Python::FFI::Role;

1;
