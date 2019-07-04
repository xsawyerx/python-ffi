package Python::FFI::API::Descr;

use Python::FFI::Role;

around 'ffi_subs_data' => sub ($orig, $self, @args){
    return +{
        %{ $self->$orig(@args) },

        'PyDescr_NewClassMethod' => [ [ 'PyTypeObject *', 'PyMethodDef *' ] => 'opaque' ],
        'PyDescr_NewGetSet' => [ [ 'PyTypeObject *', 'struct PyGetSetDef *' ] => 'opaque' ],
        'PyDescr_NewMember' => [ [ 'PyTypeObject *', 'struct PyMemberDef *' ] => 'opaque' ],
        'PyDescr_NewMethod' => [ [ 'PyTypeObject *', 'PyMethodDef *' ] => 'opaque' ],
        'PyDescr_NewWrapper' => [ [ 'PyTypeObject *', 'struct wrapperbase *', 'void *' ] => 'opaque' ],
    };
};

sub descr_newclassmethod ($self) {
    return $self->ffi_sub('PyDescr_NewClassMethod')->();
}

sub descr_newgetset ($self) {
    return $self->ffi_sub('PyDescr_NewGetSet')->();
}

sub descr_newmember ($self) {
    return $self->ffi_sub('PyDescr_NewMember')->();
}

sub descr_newmethod ($self) {
    return $self->ffi_sub('PyDescr_NewMethod')->();
}

sub descr_newwrapper ($self) {
    return $self->ffi_sub('PyDescr_NewWrapper')->();
}


no Python::FFI::Role;

1;
