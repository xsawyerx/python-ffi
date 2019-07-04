package Python::FFI::API::Symtable;

use Python::FFI::Role;

around 'ffi_subs_data' => sub ($orig, $self, @args){
    return +{
        %{ $self->$orig(@args) },

        'PySymtable_Build' => [ [ 'mod_ty mod', 'string', 'PyFutureFeatures *' ] => 'struct symtable *' ],
        'PySymtable_BuildObject' => [ [ 'mod_ty mod', 'opaque', 'PyFutureFeatures *' ] => 'struct symtable *' ],
        'PySymtable_Free' => [ [ 'struct symtable *' ] => 'void' ],
        'PySymtable_Lookup' => [ [ 'struct symtable *', 'void *' ] => 'PySTEntryObject *' ],
    };
};

sub symtable_build ($self) {
    return $self->ffi_sub('PySymtable_Build')->();
}

sub symtable_buildobject ($self) {
    return $self->ffi_sub('PySymtable_BuildObject')->();
}

sub symtable_free ($self) {
    return $self->ffi_sub('PySymtable_Free')->();
}

sub symtable_lookup ($self) {
    return $self->ffi_sub('PySymtable_Lookup')->();
}


no Python::FFI::Role;

1;
