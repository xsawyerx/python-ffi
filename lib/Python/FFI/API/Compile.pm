package Python::FFI::API::Compile;

use Python::FFI::Role;

around 'ffi_subs_data' => sub ($orig, $self, @args){
    return +{
        %{ $self->$orig(@args) },

        'PyCompile_OpcodeStackEffect' => [ [ 'int', 'int' ] => 'int' ],
        'PyCompile_OpcodeStackEffectWithJump' => [ [ 'int', 'int', 'int' ] => 'int' ],
    };
};

sub compile_opcodestackeffect ($self) {
    return $self->ffi_sub('PyCompile_OpcodeStackEffect')->();
}

sub compile_opcodestackeffectwithjump ($self) {
    return $self->ffi_sub('PyCompile_OpcodeStackEffectWithJump')->();
}


no Python::FFI::Role;

1;
