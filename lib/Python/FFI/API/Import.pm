package Python::FFI::API::Import;

use Python::FFI::Role;

around 'ffi_subs_data' => sub ($orig, $self, @args){
    return +{
        %{ $self->$orig(@args) },

        'PyImport_AddModule' => [ [ 'string' ] => 'opaque' ],
        'PyImport_AddModuleObject' => [ [ 'opaque' ] => 'opaque' ],
        'PyImport_AppendInittab' => [ [ 'string', 'PyObject* (*' ] => 'int' ],
        'PyImport_ExecCodeModule' => [ [ 'string', 'opaque' ] => 'opaque' ],
        'PyImport_ExecCodeModuleEx' => [ [ 'string', 'opaque', 'string' ] => 'opaque' ],
        'PyImport_ExecCodeModuleObject' => [ [ 'opaque', 'opaque', 'opaque', 'opaque' ] => 'opaque' ],
        'PyImport_ExecCodeModuleWithPathnames' => [ [ 'string', 'opaque', 'string', 'string' ] => 'opaque' ],
        'PyImport_GetImporter' => [ [ 'opaque' ] => 'opaque' ],
        'PyImport_GetMagicNumber' => [ [ 'void' ] => 'long' ],
        'PyImport_GetMagicTag' => [ [ 'void' ] => 'string' ],
        'PyImport_GetModule' => [ [ 'opaque' ] => 'opaque' ],
        'PyImport_GetModuleDict' => [ [ 'void' ] => 'opaque' ],
        'PyImport_Import' => [ [ 'opaque' ] => 'opaque' ],
        'PyImport_ImportFrozenModule' => [ [ 'string' ] => 'int' ],
        'PyImport_ImportFrozenModuleObject' => [ [ 'opaque' ] => 'int' ],
        'PyImport_ImportModule' => [ [ 'string' ] => 'opaque' ],
        'PyImport_ImportModuleLevel' => [ [ 'string', 'opaque', 'opaque', 'opaque', 'int' ] => 'opaque' ],
        'PyImport_ImportModuleLevelObject' => [ [ 'opaque', 'opaque', 'opaque', 'opaque', 'int' ] => 'opaque' ],
        'PyImport_ImportModuleNoBlock' => [ [ 'string' ] => 'opaque' ],
        'PyImport_ReloadModule' => [ [ 'opaque' ] => 'opaque' ],
    };
};

sub import_addmodule ($self) {
    return $self->ffi_sub('PyImport_AddModule')->();
}

sub import_addmoduleobject ($self) {
    return $self->ffi_sub('PyImport_AddModuleObject')->();
}

sub import_appendinittab ($self) {
    return $self->ffi_sub('PyImport_AppendInittab')->();
}

sub import_execcodemodule ($self) {
    return $self->ffi_sub('PyImport_ExecCodeModule')->();
}

sub import_execcodemoduleex ($self) {
    return $self->ffi_sub('PyImport_ExecCodeModuleEx')->();
}

sub import_execcodemoduleobject ($self) {
    return $self->ffi_sub('PyImport_ExecCodeModuleObject')->();
}

sub import_execcodemodulewithpathnames ($self) {
    return $self->ffi_sub('PyImport_ExecCodeModuleWithPathnames')->();
}

sub import_getimporter ($self) {
    return $self->ffi_sub('PyImport_GetImporter')->();
}

sub import_getmagicnumber ($self) {
    return $self->ffi_sub('PyImport_GetMagicNumber')->();
}

sub import_getmagictag ($self) {
    return $self->ffi_sub('PyImport_GetMagicTag')->();
}

sub import_getmodule ($self) {
    return $self->ffi_sub('PyImport_GetModule')->();
}

sub import_getmoduledict ($self) {
    return $self->ffi_sub('PyImport_GetModuleDict')->();
}

sub import_import ($self) {
    return $self->ffi_sub('PyImport_Import')->();
}

sub import_importfrozenmodule ($self) {
    return $self->ffi_sub('PyImport_ImportFrozenModule')->();
}

sub import_importfrozenmoduleobject ($self) {
    return $self->ffi_sub('PyImport_ImportFrozenModuleObject')->();
}

sub import_importmodule ($self) {
    return $self->ffi_sub('PyImport_ImportModule')->();
}

sub import_importmodulelevel ($self) {
    return $self->ffi_sub('PyImport_ImportModuleLevel')->();
}

sub import_importmodulelevelobject ($self) {
    return $self->ffi_sub('PyImport_ImportModuleLevelObject')->();
}

sub import_importmodulenoblock ($self) {
    return $self->ffi_sub('PyImport_ImportModuleNoBlock')->();
}

sub import_reloadmodule ($self) {
    return $self->ffi_sub('PyImport_ReloadModule')->();
}


no Python::FFI::Role;

1;
