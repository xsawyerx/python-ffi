package Python::FFI::API::Object;

use Python::FFI::Role;

around 'ffi_subs_data' => sub ($orig, $self, @args){
    return +{
        %{ $self->$orig(@args) },

        'PyObject_ASCII' => [ [ 'opaque' ] => 'opaque' ],
        'PyObject_AsCharBuffer' => [ [ 'opaque', 'const char **', 'Py_ssize_t *_len' ] => 'int' ],
        'PyObject_AsFileDescriptor' => [ [ 'opaque' ] => 'int' ],
        'PyObject_AsReadBuffer' => [ [ 'opaque', 'const void **', 'Py_ssize_t *_len' ] => 'int' ],
        'PyObject_AsWriteBuffer' => [ [ 'opaque', 'void **', 'Py_ssize_t *_len' ] => 'int' ],
        'PyObject_Bytes' => [ [ 'opaque' ] => 'opaque' ],
        'PyObject_Call' => [ [ 'opaque', 'opaque', 'opaque' ] => 'opaque' ],
        'PyObject_CallFunction' => [ [ 'opaque', 'string', '...' ] => 'opaque' ],
        'PyObject_CallFunctionObjArgs' => [ [ 'opaque', '...' ] => 'opaque' ],
        'PyObject_CallMethod' => [ [ 'opaque', 'string', 'string', '...' ] => 'opaque' ],
        'PyObject_CallMethodObjArgs' => [ [ 'opaque', 'opaque', '...' ] => 'opaque' ],
        'PyObject_CallNoArgs' => [ [ 'opaque' ] => 'opaque' ],
        'PyObject_CallObject' => [ [ 'opaque', 'opaque' ] => 'opaque' ],
        'PyObject_Calloc' => [ [ 'size_t nelem', 'size_t elsize' ] => 'void *' ],
        'PyObject_CheckReadBuffer' => [ [ 'opaque' ] => 'int' ],
        'PyObject_ClearWeakRefs' => [ [ 'opaque' ] => 'void' ],
        'PyObject_DelItem' => [ [ 'opaque', 'opaque' ] => 'int' ],
        'PyObject_DelItemString' => [ [ 'opaque', 'string' ] => 'int' ],
        'PyObject_Dir' => [ [ 'opaque' ] => 'opaque' ],
        'PyObject_Format' => [ [ 'opaque', 'PyObject *_spec' ] => 'opaque' ],
        'PyObject_Free' => [ [ 'void *' ] => 'void' ],
        'PyObject_GC_Del' => [ [ 'void *' ] => 'void' ],
        'PyObject_GC_Track' => [ [ 'void *' ] => 'void' ],
        'PyObject_GC_UnTrack' => [ [ 'void *' ] => 'void' ],
        'PyObject_GenericGetAttr' => [ [ 'opaque', 'opaque' ] => 'opaque' ],
        'PyObject_GenericSetAttr' => [ [ 'opaque', 'opaque', 'opaque' ] => 'int' ],
        'PyObject_GenericSetDict' => [ [ 'opaque', 'opaque', 'void *' ] => 'int' ],
        'PyObject_GetAttr' => [ [ 'opaque', 'opaque' ] => 'opaque' ],
        'PyObject_GetAttrString' => [ [ 'opaque', 'string' ] => 'opaque' ],
        'PyObject_GetItem' => [ [ 'opaque', 'opaque' ] => 'opaque' ],
        'PyObject_GetIter' => [ [ 'opaque' ] => 'opaque' ],
        'PyObject_HasAttr' => [ [ 'opaque', 'opaque' ] => 'int' ],
        'PyObject_HasAttrString' => [ [ 'opaque', 'string' ] => 'int' ],
        'PyObject_Hash' => [ [ 'opaque' ] => 'Py_hash_t' ],
        'PyObject_HashNotImplemented' => [ [ 'opaque' ] => 'Py_hash_t' ],
        'PyObject_Init' => [ [ 'opaque', 'PyTypeObject *' ] => 'opaque' ],
        'PyObject_InitVar' => [ [ 'PyVarObject *', 'PyTypeObject *', 'Py_ssize_t' ] => 'PyVarObject *' ],
        'PyObject_IsInstance' => [ [ 'opaque', 'opaque' ] => 'int' ],
        'PyObject_IsSubclass' => [ [ 'opaque', 'opaque' ] => 'int' ],
        'PyObject_IsTrue' => [ [ 'opaque' ] => 'int' ],
        'PyObject_Length' => [ [ 'opaque' ] => 'Py_ssize_t' ],
        'PyObject_Malloc' => [ [ 'size_t size' ] => 'void *' ],
        'PyObject_Not' => [ [ 'opaque' ] => 'int' ],
        'PyObject_Realloc' => [ [ 'void *', 'size_t new_size' ] => 'void *' ],
        'PyObject_Repr' => [ [ 'opaque' ] => 'opaque' ],
        'PyObject_RichCompare' => [ [ 'opaque', 'opaque', 'int' ] => 'opaque' ],
        'PyObject_RichCompareBool' => [ [ 'opaque', 'opaque', 'int' ] => 'int' ],
        'PyObject_SelfIter' => [ [ 'opaque' ] => 'opaque' ],
        'PyObject_SetAttr' => [ [ 'opaque', 'opaque', 'opaque' ] => 'int' ],
        'PyObject_SetAttrString' => [ [ 'opaque', 'string', 'opaque' ] => 'int' ],
        'PyObject_SetItem' => [ [ 'opaque', 'opaque', 'opaque' ] => 'int' ],
        'PyObject_Size' => [ [ 'opaque' ] => 'Py_ssize_t' ],
        'PyObject_Str' => [ [ 'opaque' ] => 'opaque' ],
        'PyObject_Type' => [ [ 'opaque' ] => 'opaque' ],
    };
};

sub object_ascii ($self) {
    return $self->ffi_sub('PyObject_ASCII')->();
}

sub object_ascharbuffer ($self) {
    return $self->ffi_sub('PyObject_AsCharBuffer')->();
}

sub object_asfiledescriptor ($self) {
    return $self->ffi_sub('PyObject_AsFileDescriptor')->();
}

sub object_asreadbuffer ($self) {
    return $self->ffi_sub('PyObject_AsReadBuffer')->();
}

sub object_aswritebuffer ($self) {
    return $self->ffi_sub('PyObject_AsWriteBuffer')->();
}

sub object_bytes ($self) {
    return $self->ffi_sub('PyObject_Bytes')->();
}

sub object_call ($self) {
    return $self->ffi_sub('PyObject_Call')->();
}

sub object_callfunction ($self) {
    return $self->ffi_sub('PyObject_CallFunction')->();
}

sub object_callfunctionobjargs ($self) {
    return $self->ffi_sub('PyObject_CallFunctionObjArgs')->();
}

sub object_callmethod ($self) {
    return $self->ffi_sub('PyObject_CallMethod')->();
}

sub object_callmethodobjargs ($self) {
    return $self->ffi_sub('PyObject_CallMethodObjArgs')->();
}

sub object_callnoargs ($self) {
    return $self->ffi_sub('PyObject_CallNoArgs')->();
}

sub object_callobject ($self) {
    return $self->ffi_sub('PyObject_CallObject')->();
}

sub object_calloc ($self) {
    return $self->ffi_sub('PyObject_Calloc')->();
}

sub object_checkreadbuffer ($self) {
    return $self->ffi_sub('PyObject_CheckReadBuffer')->();
}

sub object_clearweakrefs ($self) {
    return $self->ffi_sub('PyObject_ClearWeakRefs')->();
}

sub object_delitem ($self) {
    return $self->ffi_sub('PyObject_DelItem')->();
}

sub object_delitemstring ($self) {
    return $self->ffi_sub('PyObject_DelItemString')->();
}

sub object_dir ($self) {
    return $self->ffi_sub('PyObject_Dir')->();
}

sub object_format ($self) {
    return $self->ffi_sub('PyObject_Format')->();
}

sub object_free ($self) {
    return $self->ffi_sub('PyObject_Free')->();
}

sub object_gc_del ($self) {
    return $self->ffi_sub('PyObject_GC_Del')->();
}

sub object_gc_track ($self) {
    return $self->ffi_sub('PyObject_GC_Track')->();
}

sub object_gc_untrack ($self) {
    return $self->ffi_sub('PyObject_GC_UnTrack')->();
}

sub object_genericgetattr ($self) {
    return $self->ffi_sub('PyObject_GenericGetAttr')->();
}

sub object_genericsetattr ($self) {
    return $self->ffi_sub('PyObject_GenericSetAttr')->();
}

sub object_genericsetdict ($self) {
    return $self->ffi_sub('PyObject_GenericSetDict')->();
}

sub object_getattr ($self) {
    return $self->ffi_sub('PyObject_GetAttr')->();
}

sub object_getattrstring ($self) {
    return $self->ffi_sub('PyObject_GetAttrString')->();
}

sub object_getitem ($self) {
    return $self->ffi_sub('PyObject_GetItem')->();
}

sub object_getiter ($self) {
    return $self->ffi_sub('PyObject_GetIter')->();
}

sub object_hasattr ($self) {
    return $self->ffi_sub('PyObject_HasAttr')->();
}

sub object_hasattrstring ($self) {
    return $self->ffi_sub('PyObject_HasAttrString')->();
}

sub object_hash ($self) {
    return $self->ffi_sub('PyObject_Hash')->();
}

sub object_hashnotimplemented ($self) {
    return $self->ffi_sub('PyObject_HashNotImplemented')->();
}

sub object_init ($self) {
    return $self->ffi_sub('PyObject_Init')->();
}

sub object_initvar ($self) {
    return $self->ffi_sub('PyObject_InitVar')->();
}

sub object_isinstance ($self) {
    return $self->ffi_sub('PyObject_IsInstance')->();
}

sub object_issubclass ($self) {
    return $self->ffi_sub('PyObject_IsSubclass')->();
}

sub object_istrue ($self) {
    return $self->ffi_sub('PyObject_IsTrue')->();
}

sub object_length ($self) {
    return $self->ffi_sub('PyObject_Length')->();
}

sub object_malloc ($self) {
    return $self->ffi_sub('PyObject_Malloc')->();
}

sub object_not ($self) {
    return $self->ffi_sub('PyObject_Not')->();
}

sub object_realloc ($self) {
    return $self->ffi_sub('PyObject_Realloc')->();
}

sub object_repr ($self) {
    return $self->ffi_sub('PyObject_Repr')->();
}

sub object_richcompare ($self) {
    return $self->ffi_sub('PyObject_RichCompare')->();
}

sub object_richcomparebool ($self) {
    return $self->ffi_sub('PyObject_RichCompareBool')->();
}

sub object_selfiter ($self) {
    return $self->ffi_sub('PyObject_SelfIter')->();
}

sub object_setattr ($self) {
    return $self->ffi_sub('PyObject_SetAttr')->();
}

sub object_setattrstring ($self) {
    return $self->ffi_sub('PyObject_SetAttrString')->();
}

sub object_setitem ($self) {
    return $self->ffi_sub('PyObject_SetItem')->();
}

sub object_size ($self) {
    return $self->ffi_sub('PyObject_Size')->();
}

sub object_str ($self) {
    return $self->ffi_sub('PyObject_Str')->();
}

sub object_type ($self) {
    return $self->ffi_sub('PyObject_Type')->();
}


no Python::FFI::Role;

1;
