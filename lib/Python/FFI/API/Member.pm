package Python::FFI::API::Member;

use Python::FFI::Role;

around 'ffi_subs_data' => sub ($orig, $self, @args){
    return +{
        %{ $self->$orig(@args) },

        'PyMember_GetOne' => [ [ 'string', 'struct PyMemberDef *' ] => 'opaque' ],
        'PyMember_SetOne' => [ [ 'char *', 'struct PyMemberDef *', 'opaque' ] => 'int' ],
    };
};

sub member_getone ($self) {
    return $self->ffi_sub('PyMember_GetOne')->();
}

sub member_setone ($self) {
    return $self->ffi_sub('PyMember_SetOne')->();
}


no Python::FFI::Role;

1;
