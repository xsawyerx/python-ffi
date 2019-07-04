package Python::FFI::API::Frame;

use Python::FFI::Role;

around 'ffi_subs_data' => sub ($orig, $self, @args){
    return +{
        %{ $self->$orig(@args) },

        'PyFrame_BlockPop' => [ ['PyFrameObject *'] => 'PyTryBlock *' ],
        'PyFrame_BlockSetup' => [ [ 'PyFrameObject *', 'int', 'int', 'int' ] => 'void' ],
        'PyFrame_ClearFreeList' => [ [] => 'int' ],
        'PyFrame_ExtendStack' => [ [ 'PyFrameObject *', 'int', 'int' ] => 'PyObject **' ],
        'PyFrame_FastToLocals' => [ ['PyFrameObject *'] => 'void' ],
        'PyFrame_FastToLocalsWithError' => [ ['PyFrameObject *'] => 'int' ],
        'PyFrame_GetLineNumber' => [ ['PyFrameObject *'] => 'int' ],
        'PyFrame_LocalsToFast' => [ [ 'PyFrameObject *', 'int' ] => 'void' ],
        'PyFrame_New' => [ [ 'PyThreadState *', 'PyCodeObject *', 'opaque', 'opaque' ] => 'PyFrameObject *' ],
    };
};

sub frame_blockpop ($self) {
    return $self->ffi_sub('PyFrame_BlockPop')->();
}

sub frame_blocksetup ($self) {
    return $self->ffi_sub('PyFrame_BlockSetup')->();
}

sub frame_clearfreelist ($self) {
    return $self->ffi_sub('PyFrame_ClearFreeList')->();
}

sub frame_extendstack ($self) {
    return $self->ffi_sub('PyFrame_ExtendStack')->();
}

sub frame_fasttolocals ($self) {
    return $self->ffi_sub('PyFrame_FastToLocals')->();
}

sub frame_fasttolocalswitherror ($self) {
    return $self->ffi_sub('PyFrame_FastToLocalsWithError')->();
}

sub frame_getlinenumber ($self) {
    return $self->ffi_sub('PyFrame_GetLineNumber')->();
}

sub frame_localstofast ($self) {
    return $self->ffi_sub('PyFrame_LocalsToFast')->();
}

sub frame_new ($self) {
    return $self->ffi_sub('PyFrame_New')->();
}


no Python::FFI::Role;

1;
