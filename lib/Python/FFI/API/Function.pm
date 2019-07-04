package Python::FFI::API::Function;

use Python::FFI::Role;

around 'ffi_subs_data' => sub ($orig, $self, @args){
    return +{
        %{ $self->$orig(@args) },

        'PyFunction_GetAnnotations' => [ [ 'opaque' ] => 'opaque' ],
        'PyFunction_GetClosure' => [ [ 'opaque' ] => 'opaque' ],
        'PyFunction_GetCode' => [ [ 'opaque' ] => 'opaque' ],
        'PyFunction_GetDefaults' => [ [ 'opaque' ] => 'opaque' ],
        'PyFunction_GetGlobals' => [ [ 'opaque' ] => 'opaque' ],
        'PyFunction_GetKwDefaults' => [ [ 'opaque' ] => 'opaque' ],
        'PyFunction_GetModule' => [ [ 'opaque' ] => 'opaque' ],
        'PyFunction_New' => [ [ 'opaque', 'opaque' ] => 'opaque' ],
        'PyFunction_NewWithQualName' => [ [ 'opaque', 'opaque', 'opaque' ] => 'opaque' ],
        'PyFunction_SetAnnotations' => [ [ 'opaque', 'opaque' ] => 'int' ],
        'PyFunction_SetClosure' => [ [ 'opaque', 'opaque' ] => 'int' ],
        'PyFunction_SetDefaults' => [ [ 'opaque', 'opaque' ] => 'int' ],
        'PyFunction_SetKwDefaults' => [ [ 'opaque', 'opaque' ] => 'int' ],
    };
};

sub function_getannotations ($self) {
    return $self->ffi_sub('PyFunction_GetAnnotations')->();
}

sub function_getclosure ($self) {
    return $self->ffi_sub('PyFunction_GetClosure')->();
}

sub function_getcode ($self) {
    return $self->ffi_sub('PyFunction_GetCode')->();
}

sub function_getdefaults ($self) {
    return $self->ffi_sub('PyFunction_GetDefaults')->();
}

sub function_getglobals ($self) {
    return $self->ffi_sub('PyFunction_GetGlobals')->();
}

sub function_getkwdefaults ($self) {
    return $self->ffi_sub('PyFunction_GetKwDefaults')->();
}

sub function_getmodule ($self) {
    return $self->ffi_sub('PyFunction_GetModule')->();
}

sub function_new ($self) {
    return $self->ffi_sub('PyFunction_New')->();
}

sub function_newwithqualname ($self) {
    return $self->ffi_sub('PyFunction_NewWithQualName')->();
}

sub function_setannotations ($self) {
    return $self->ffi_sub('PyFunction_SetAnnotations')->();
}

sub function_setclosure ($self) {
    return $self->ffi_sub('PyFunction_SetClosure')->();
}

sub function_setdefaults ($self) {
    return $self->ffi_sub('PyFunction_SetDefaults')->();
}

sub function_setkwdefaults ($self) {
    return $self->ffi_sub('PyFunction_SetKwDefaults')->();
}


no Python::FFI::Role;

1;
