package Python::FFI::Import;

use Moose::Role;

around 'ffi_subs_data' => sub {
    my $orig = shift;
    my $self = shift;

    return +{
        %{ $self->$orig(@_) },
        'PyImport_AddModule'       => [ ['string'] => 'opaque' ],
        'PyImport_AddModuleObject' => [ ['opaque'] => 'opaque' ],
        'PyImport_AppendInittab' => [ [ 'string', 'PyObject* (*' ] => 'int' ],
        'PyImport_ExecCodeModule' => [ [ 'string', 'opaque' ] => 'opaque' ],
        'PyImport_ExecCodeModuleEx' =>
            [ [ 'string', 'opaque', 'string' ] => 'opaque' ],
        'PyImport_ExecCodeModuleObject' =>
            [ [ 'opaque', 'opaque', 'opaque', 'opaque' ] => 'opaque' ],
        'PyImport_ExecCodeModuleWithPathnames' =>
            [ [ 'string', 'opaque', 'string', 'string' ] => 'opaque' ],
        'PyImport_GetImporter'              => [ ['opaque'] => 'opaque' ],
        'PyImport_GetMagicNumber'           => [ ['void']   => 'long' ],
        'PyImport_GetMagicTag'              => [ ['void']   => 'string' ],
        'PyImport_GetModule'                => [ ['opaque'] => 'opaque' ],
        'PyImport_GetModuleDict'            => [ ['void']   => 'opaque' ],
        'PyImport_Import'                   => [ ['opaque'] => 'opaque' ],
        'PyImport_ImportFrozenModule'       => [ ['string'] => 'int' ],
        'PyImport_ImportFrozenModuleObject' => [ ['opaque'] => 'int' ],
        'PyImport_ImportModule'             => [ ['string'] => 'opaque' ],
        'PyImport_ImportModuleLevel' =>
            [ [ 'string', 'opaque', 'opaque', 'opaque', 'int' ] => 'opaque' ],
        'PyImport_ImportModuleLevelObject' =>
            [ [ 'opaque', 'opaque', 'opaque', 'opaque', 'int' ] => 'opaque' ],
        'PyImport_ImportModuleNoBlock' => [ ['string'] => 'opaque' ],
        'PyImport_ReloadModule'        => [ ['opaque'] => 'opaque' ],
    };
};

sub import_addmodule {
    my $self = shift;
    return $self->ffi_sub('PyImport_AddModule')->();
}

sub import_addmoduleobject {
    my $self = shift;
    return $self->ffi_sub('PyImport_AddModuleObject')->();
}

sub import_appendinittab {
    my $self = shift;
    return $self->ffi_sub('PyImport_AppendInittab')->();
}

sub import_execcodemodule {
    my $self = shift;
    return $self->ffi_sub('PyImport_ExecCodeModule')->();
}

sub import_execcodemoduleex {
    my $self = shift;
    return $self->ffi_sub('PyImport_ExecCodeModuleEx')->();
}

sub import_execcodemoduleobject {
    my $self = shift;
    return $self->ffi_sub('PyImport_ExecCodeModuleObject')->();
}

sub import_execcodemodulewithpathnames {
    my $self = shift;
    return $self->ffi_sub('PyImport_ExecCodeModuleWithPathnames')->();
}

sub import_getimporter {
    my $self = shift;
    return $self->ffi_sub('PyImport_GetImporter')->();
}

sub import_getmagicnumber {
    my $self = shift;
    return $self->ffi_sub('PyImport_GetMagicNumber')->();
}

sub import_getmagictag {
    my $self = shift;
    return $self->ffi_sub('PyImport_GetMagicTag')->();
}

sub import_getmodule {
    my $self = shift;
    return $self->ffi_sub('PyImport_GetModule')->();
}

sub import_getmoduledict {
    my $self = shift;
    return $self->ffi_sub('PyImport_GetModuleDict')->();
}

sub import_import {
    my $self = shift;
    return $self->ffi_sub('PyImport_Import')->();
}

sub import_importfrozenmodule {
    my $self = shift;
    return $self->ffi_sub('PyImport_ImportFrozenModule')->();
}

sub import_importfrozenmoduleobject {
    my $self = shift;
    return $self->ffi_sub('PyImport_ImportFrozenModuleObject')->();
}

sub import_importmodule {
    my $self   = shift;
    my $string = shift;
    return $self->ffi_sub('PyImport_ImportModule')->($string);
}

sub import_importmodulelevel {
    my $self = shift;
    return $self->ffi_sub('PyImport_ImportModuleLevel')->();
}

sub import_importmodulelevelobject {
    my $self = shift;
    return $self->ffi_sub('PyImport_ImportModuleLevelObject')->();
}

sub import_importmodulenoblock {
    my $self = shift;
    return $self->ffi_sub('PyImport_ImportModuleNoBlock')->();
}

sub import_reloadmodule {
    my $self = shift;
    return $self->ffi_sub('PyImport_ReloadModule')->();
}


no Moose::Role;

1;
