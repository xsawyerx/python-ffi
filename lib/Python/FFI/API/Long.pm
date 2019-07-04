package Python::FFI::API::Long;

use Python::FFI::Role;

around 'ffi_subs_data' => sub ($orig, $self, @args){
    return +{
        %{ $self->$orig(@args) },

        'PyLong_AsDouble' => [ ['opaque'] => 'double' ],
        'PyLong_AsLong' => [ ['opaque'] => 'long' ],
        'PyLong_AsLongAndOverflow' => [ [ 'opaque', 'int *' ] => 'long' ],
        'PyLong_AsLongLong' => [ ['opaque'] => 'long long' ],
        'PyLong_AsLongLongAndOverflow' => [ [ 'opaque', 'int *' ] => 'long long' ],
        'PyLong_AsSize_t' => [ ['opaque'] => 'size_t' ],
        'PyLong_AsSsize_t' => [ ['opaque'] => 'Py_ssize_t' ],
        'PyLong_AsUnsignedLong' => [ ['opaque'] => 'unsigned long' ],
        'PyLong_AsUnsignedLongLong' => [ ['opaque'] => 'unsigned long long' ],
        'PyLong_AsUnsignedLongLongMask' => [ ['opaque'] => 'unsigned long long' ],
        'PyLong_AsUnsignedLongMask' => [ ['opaque'] => 'unsigned long' ],
        'PyLong_AsVoidPtr' => [ ['opaque'] => 'void *' ],
        'PyLong_FromDouble' => [ ['double'] => 'opaque' ],
        'PyLong_FromLong' => [ ['long'] => 'opaque' ],
        'PyLong_FromLongLong' => [ ['long long'] => 'opaque' ],
        'PyLong_FromSize_t' => [ ['size_t'] => 'opaque' ],
        'PyLong_FromSsize_t' => [ ['Py_ssize_t'] => 'opaque' ],
        'PyLong_FromString' => [ [ 'string', 'char **', 'int' ] => 'opaque' ],
        'PyLong_FromUnicode' => [ [ 'Py_UNICODE*', 'Py_ssize_t', 'int' ] => 'opaque' ],
        'PyLong_FromUnicodeObject' => [ [ 'opaque', 'int' ] => 'opaque' ],
        'PyLong_FromUnsignedLong' => [ ['unsigned long'] => 'opaque' ],
        'PyLong_FromUnsignedLongLong' => [ ['unsigned long long'] => 'opaque' ],
        'PyLong_FromVoidPtr' => [ ['void *'] => 'opaque' ],
        'PyLong_GetInfo' => [ [] => 'opaque' ],
    };
};

sub long_asdouble ($self) {
    return $self->ffi_sub('PyLong_AsDouble')->();
}

sub long_aslong ($self) {
    return $self->ffi_sub('PyLong_AsLong')->();
}

sub long_aslongandoverflow ($self) {
    return $self->ffi_sub('PyLong_AsLongAndOverflow')->();
}

sub long_aslonglong ($self) {
    return $self->ffi_sub('PyLong_AsLongLong')->();
}

sub long_aslonglongandoverflow ($self) {
    return $self->ffi_sub('PyLong_AsLongLongAndOverflow')->();
}

sub long_assize_t ($self) {
    return $self->ffi_sub('PyLong_AsSize_t')->();
}

sub long_asssize_t ($self) {
    return $self->ffi_sub('PyLong_AsSsize_t')->();
}

sub long_asunsignedlong ($self) {
    return $self->ffi_sub('PyLong_AsUnsignedLong')->();
}

sub long_asunsignedlonglong ($self) {
    return $self->ffi_sub('PyLong_AsUnsignedLongLong')->();
}

sub long_asunsignedlonglongmask ($self) {
    return $self->ffi_sub('PyLong_AsUnsignedLongLongMask')->();
}

sub long_asunsignedlongmask ($self) {
    return $self->ffi_sub('PyLong_AsUnsignedLongMask')->();
}

sub long_asvoidptr ($self) {
    return $self->ffi_sub('PyLong_AsVoidPtr')->();
}

sub long_fromdouble ($self) {
    return $self->ffi_sub('PyLong_FromDouble')->();
}

sub long_fromlong ($self) {
    return $self->ffi_sub('PyLong_FromLong')->();
}

sub long_fromlonglong ($self) {
    return $self->ffi_sub('PyLong_FromLongLong')->();
}

sub long_fromsize_t ($self) {
    return $self->ffi_sub('PyLong_FromSize_t')->();
}

sub long_fromssize_t ($self) {
    return $self->ffi_sub('PyLong_FromSsize_t')->();
}

sub long_fromstring ($self) {
    return $self->ffi_sub('PyLong_FromString')->();
}

sub long_fromunicode ($self) {
    return $self->ffi_sub('PyLong_FromUnicode')->();
}

sub long_fromunicodeobject ($self) {
    return $self->ffi_sub('PyLong_FromUnicodeObject')->();
}

sub long_fromunsignedlong ($self) {
    return $self->ffi_sub('PyLong_FromUnsignedLong')->();
}

sub long_fromunsignedlonglong ($self) {
    return $self->ffi_sub('PyLong_FromUnsignedLongLong')->();
}

sub long_fromvoidptr ($self) {
    return $self->ffi_sub('PyLong_FromVoidPtr')->();
}

sub long_getinfo ($self) {
    return $self->ffi_sub('PyLong_GetInfo')->();
}


no Python::FFI::Role;

1;
