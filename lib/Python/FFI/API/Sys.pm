package Python::FFI::API::Sys;

use Python::FFI::Role;

around 'ffi_subs_data' => sub ($orig, $self, @args){
    return +{
        %{ $self->$orig(@args) },

        'PySys_AddWarnOption' => [ [ 'const wchar_t *' ] => 'void' ],
        'PySys_AddWarnOptionUnicode' => [ [ 'opaque' ] => 'void' ],
        'PySys_AddXOption' => [ [ 'const wchar_t *' ] => 'void' ],
        'PySys_FormatStderr' => [ [ 'string', '...' ] => 'void' ],
        'PySys_FormatStdout' => [ [ 'string', '...' ] => 'void' ],
        'PySys_GetObject' => [ [ 'string' ] => 'opaque' ],
        'PySys_GetXOptions' => [ [ 'void' ] => 'opaque' ],
        'PySys_HasWarnOptions' => [ [ 'void' ] => 'int' ],
        'PySys_ResetWarnOptions' => [ [ 'void' ] => 'void' ],
        'PySys_SetArgv' => [ [ 'int', 'wchar_t **' ] => 'void' ],
        'PySys_SetArgvEx' => [ [ 'int', 'wchar_t **', 'int' ] => 'void' ],
        'PySys_SetObject' => [ [ 'string', 'opaque' ] => 'int' ],
        'PySys_SetPath' => [ [ 'const wchar_t *' ] => 'void' ],
        'PySys_WriteStderr' => [ [ 'string', '...' ] => 'void' ],
        'PySys_WriteStdout' => [ [ 'string', '...' ] => 'void' ],
    };
};

sub sys_addwarnoption ($self) {
    return $self->ffi_sub('PySys_AddWarnOption')->();
}

sub sys_addwarnoptionunicode ($self) {
    return $self->ffi_sub('PySys_AddWarnOptionUnicode')->();
}

sub sys_addxoption ($self) {
    return $self->ffi_sub('PySys_AddXOption')->();
}

sub sys_formatstderr ($self) {
    return $self->ffi_sub('PySys_FormatStderr')->();
}

sub sys_formatstdout ($self) {
    return $self->ffi_sub('PySys_FormatStdout')->();
}

sub sys_getobject ($self) {
    return $self->ffi_sub('PySys_GetObject')->();
}

sub sys_getxoptions ($self) {
    return $self->ffi_sub('PySys_GetXOptions')->();
}

sub sys_haswarnoptions ($self) {
    return $self->ffi_sub('PySys_HasWarnOptions')->();
}

sub sys_resetwarnoptions ($self) {
    return $self->ffi_sub('PySys_ResetWarnOptions')->();
}

sub sys_setargv ($self) {
    return $self->ffi_sub('PySys_SetArgv')->();
}

sub sys_setargvex ($self) {
    return $self->ffi_sub('PySys_SetArgvEx')->();
}

sub sys_setobject ($self) {
    return $self->ffi_sub('PySys_SetObject')->();
}

sub sys_setpath ($self) {
    return $self->ffi_sub('PySys_SetPath')->();
}

sub sys_writestderr ($self) {
    return $self->ffi_sub('PySys_WriteStderr')->();
}

sub sys_writestdout ($self) {
    return $self->ffi_sub('PySys_WriteStdout')->();
}


no Python::FFI::Role;

1;
