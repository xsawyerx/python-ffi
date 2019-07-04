package Python::FFI::API::Err;

use Python::FFI::Role;

around 'ffi_subs_data' => sub ($orig, $self, @args){
    return +{
        %{ $self->$orig(@args) },

        'PyErr_BadArgument' => [ [ 'void' ] => 'int' ],
        'PyErr_BadInternalCall' => [ [ 'void' ] => 'void' ],
        'PyErr_CheckSignals' => [ [ 'void' ] => 'int' ],
        'PyErr_Clear' => [ [ 'void' ] => 'void' ],
        'PyErr_Display' => [ [ 'opaque', 'opaque', 'opaque' ] => 'void' ],
        'PyErr_ExceptionMatches' => [ [ 'opaque' ] => 'int' ],
        'PyErr_Fetch' => [ [ 'PyObject **', 'PyObject **', 'PyObject **' ] => 'void' ],
        'PyErr_Format' => [ [ 'opaque', 'string', '...' ] => 'opaque' ],
        'PyErr_FormatV' => [ [ 'opaque', 'string', 'va_list vargs' ] => 'opaque' ],
        'PyErr_GetExcInfo' => [ [ 'PyObject **', 'PyObject **', 'PyObject **' ] => 'void' ],
        'PyErr_GivenExceptionMatches' => [ [ 'opaque', 'opaque' ] => 'int' ],
        'PyErr_NewException' => [ [ 'string', 'opaque', 'opaque' ] => 'opaque' ],
        'PyErr_NewExceptionWithDoc' => [ [ 'string', 'string', 'opaque', 'opaque' ] => 'opaque' ],
        'PyErr_NoMemory' => [ [ 'void' ] => 'opaque' ],
        'PyErr_NormalizeException' => [ [ 'PyObject**', 'PyObject**', 'PyObject**' ] => 'void' ],
        'PyErr_Occurred' => [ [ 'void' ] => 'opaque' ],
        'PyErr_Print' => [ [ 'void' ] => 'void' ],
        'PyErr_PrintEx' => [ [ 'int' ] => 'void' ],
        'PyErr_ProgramText' => [ [ 'string', 'int' ] => 'opaque' ],
        'PyErr_ResourceWarning' => [ [ 'opaque', 'Py_ssize_t stack_level', 'string', '...' ] => 'int' ],
        'PyErr_Restore' => [ [ 'opaque', 'opaque', 'opaque' ] => 'void' ],
        'PyErr_SetExcFromWindowsErr' => [ [ 'opaque', 'int' ] => 'opaque' ],
        'PyErr_SetExcFromWindowsErrWithFilename' => [ [ 'opaque', 'int', 'string' ] => 'opaque' ],
        'PyErr_SetExcFromWindowsErrWithFilenameObject' => [ [ 'opaque', 'int', 'opaque' ] => 'opaque' ],
        'PyErr_SetExcFromWindowsErrWithFilenameObjects' => [ [ 'opaque', 'int', 'opaque', 'opaque' ] => 'opaque' ],
        'PyErr_SetExcInfo' => [ [ 'opaque', 'opaque', 'opaque' ] => 'void' ],
        'PyErr_SetFromErrno' => [ [ 'opaque' ] => 'opaque' ],
        'PyErr_SetFromErrnoWithFilename' => [ [ 'opaque', 'string' ] => 'opaque' ],
        'PyErr_SetFromErrnoWithFilenameObject' => [ [ 'opaque', 'opaque' ] => 'opaque' ],
        'PyErr_SetFromErrnoWithFilenameObjects' => [ [ 'opaque', 'opaque', 'opaque' ] => 'opaque' ],
        'PyErr_SetFromWindowsErr' => [ [ 'int' ] => 'opaque' ],
        'PyErr_SetFromWindowsErrWithFilename' => [ [ 'int', 'string' ] => 'opaque' ],
        'PyErr_SetImportError' => [ [ 'opaque', 'opaque', 'opaque' ] => 'opaque' ],
        'PyErr_SetImportErrorSubclass' => [ [ 'opaque', 'opaque', 'opaque', 'opaque' ] => 'opaque' ],
        'PyErr_SetInterrupt' => [ [ 'void' ] => 'void' ],
        'PyErr_SetNone' => [ [ 'opaque' ] => 'void' ],
        'PyErr_SetObject' => [ [ 'opaque', 'opaque' ] => 'void' ],
        'PyErr_SetString' => [ [ 'opaque', 'string' ] => 'void' ],
        'PyErr_SyntaxLocation' => [ [ 'string', 'int' ] => 'void' ],
        'PyErr_SyntaxLocationEx' => [ [ 'string', 'int', 'int_offset' ] => 'void' ],
        'PyErr_WarnEx' => [ [ 'opaque', 'string', 'Py_ssize_t stack_level' ] => 'int' ],
        'PyErr_WarnExplicit' => [ [ 'opaque', 'string', 'string', 'int', 'string', 'opaque' ] => 'int' ],
        'PyErr_WarnExplicitFormat' => [ [ 'opaque', 'string', 'int', 'string', 'opaque', 'string', '...' ] => 'int' ],
        'PyErr_WarnExplicitObject' => [ [ 'opaque', 'opaque', 'opaque', 'int', 'opaque', 'opaque' ] => 'int' ],
        'PyErr_WarnFormat' => [ [ 'opaque', 'Py_ssize_t stack_level', 'string', '...' ] => 'int' ],
        'PyErr_WriteUnraisable' => [ [ 'opaque' ] => 'void' ],
    };
};

sub err_badargument ($self) {
    return $self->ffi_sub('PyErr_BadArgument')->();
}

sub err_badinternalcall ($self) {
    return $self->ffi_sub('PyErr_BadInternalCall')->();
}

sub err_checksignals ($self) {
    return $self->ffi_sub('PyErr_CheckSignals')->();
}

sub err_clear ($self) {
    return $self->ffi_sub('PyErr_Clear')->();
}

sub err_display ($self) {
    return $self->ffi_sub('PyErr_Display')->();
}

sub err_exceptionmatches ($self) {
    return $self->ffi_sub('PyErr_ExceptionMatches')->();
}

sub err_fetch ($self) {
    return $self->ffi_sub('PyErr_Fetch')->();
}

sub err_format ($self) {
    return $self->ffi_sub('PyErr_Format')->();
}

sub err_formatv ($self) {
    return $self->ffi_sub('PyErr_FormatV')->();
}

sub err_getexcinfo ($self) {
    return $self->ffi_sub('PyErr_GetExcInfo')->();
}

sub err_givenexceptionmatches ($self) {
    return $self->ffi_sub('PyErr_GivenExceptionMatches')->();
}

sub err_newexception ($self) {
    return $self->ffi_sub('PyErr_NewException')->();
}

sub err_newexceptionwithdoc ($self) {
    return $self->ffi_sub('PyErr_NewExceptionWithDoc')->();
}

sub err_nomemory ($self) {
    return $self->ffi_sub('PyErr_NoMemory')->();
}

sub err_normalizeexception ($self) {
    return $self->ffi_sub('PyErr_NormalizeException')->();
}

sub err_occurred ($self) {
    return $self->ffi_sub('PyErr_Occurred')->();
}

sub err_print ($self) {
    return $self->ffi_sub('PyErr_Print')->();
}

sub err_printex ($self) {
    return $self->ffi_sub('PyErr_PrintEx')->();
}

sub err_programtext ($self) {
    return $self->ffi_sub('PyErr_ProgramText')->();
}

sub err_resourcewarning ($self) {
    return $self->ffi_sub('PyErr_ResourceWarning')->();
}

sub err_restore ($self) {
    return $self->ffi_sub('PyErr_Restore')->();
}

sub err_setexcfromwindowserr ($self) {
    return $self->ffi_sub('PyErr_SetExcFromWindowsErr')->();
}

sub err_setexcfromwindowserrwithfilename ($self) {
    return $self->ffi_sub('PyErr_SetExcFromWindowsErrWithFilename')->();
}

sub err_setexcfromwindowserrwithfilenameobject ($self) {
    return $self->ffi_sub('PyErr_SetExcFromWindowsErrWithFilenameObject')->();
}

sub err_setexcfromwindowserrwithfilenameobjects ($self) {
    return $self->ffi_sub('PyErr_SetExcFromWindowsErrWithFilenameObjects')->();
}

sub err_setexcinfo ($self) {
    return $self->ffi_sub('PyErr_SetExcInfo')->();
}

sub err_setfromerrno ($self) {
    return $self->ffi_sub('PyErr_SetFromErrno')->();
}

sub err_setfromerrnowithfilename ($self) {
    return $self->ffi_sub('PyErr_SetFromErrnoWithFilename')->();
}

sub err_setfromerrnowithfilenameobject ($self) {
    return $self->ffi_sub('PyErr_SetFromErrnoWithFilenameObject')->();
}

sub err_setfromerrnowithfilenameobjects ($self) {
    return $self->ffi_sub('PyErr_SetFromErrnoWithFilenameObjects')->();
}

sub err_setfromwindowserr ($self) {
    return $self->ffi_sub('PyErr_SetFromWindowsErr')->();
}

sub err_setfromwindowserrwithfilename ($self) {
    return $self->ffi_sub('PyErr_SetFromWindowsErrWithFilename')->();
}

sub err_setimporterror ($self) {
    return $self->ffi_sub('PyErr_SetImportError')->();
}

sub err_setimporterrorsubclass ($self) {
    return $self->ffi_sub('PyErr_SetImportErrorSubclass')->();
}

sub err_setinterrupt ($self) {
    return $self->ffi_sub('PyErr_SetInterrupt')->();
}

sub err_setnone ($self) {
    return $self->ffi_sub('PyErr_SetNone')->();
}

sub err_setobject ($self) {
    return $self->ffi_sub('PyErr_SetObject')->();
}

sub err_setstring ($self) {
    return $self->ffi_sub('PyErr_SetString')->();
}

sub err_syntaxlocation ($self) {
    return $self->ffi_sub('PyErr_SyntaxLocation')->();
}

sub err_syntaxlocationex ($self) {
    return $self->ffi_sub('PyErr_SyntaxLocationEx')->();
}

sub err_warnex ($self) {
    return $self->ffi_sub('PyErr_WarnEx')->();
}

sub err_warnexplicit ($self) {
    return $self->ffi_sub('PyErr_WarnExplicit')->();
}

sub err_warnexplicitformat ($self) {
    return $self->ffi_sub('PyErr_WarnExplicitFormat')->();
}

sub err_warnexplicitobject ($self) {
    return $self->ffi_sub('PyErr_WarnExplicitObject')->();
}

sub err_warnformat ($self) {
    return $self->ffi_sub('PyErr_WarnFormat')->();
}

sub err_writeunraisable ($self) {
    return $self->ffi_sub('PyErr_WriteUnraisable')->();
}


no Python::FFI::Role;

1;
