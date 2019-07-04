package Python::FFI::API::Hash;

use Python::FFI::Role;

around 'ffi_subs_data' => sub ($orig, $self, @args){
    return +{
        %{ $self->$orig(@args) },

        'PyHash_GetFuncDef' => [ [] => 'PyHash_FuncDef*' ],
    };
};

sub hash_getfuncdef ($self) {
    return $self->ffi_sub('PyHash_GetFuncDef')->();
}


no Python::FFI::Role;

1;
