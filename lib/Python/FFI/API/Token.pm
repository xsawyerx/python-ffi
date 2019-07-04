package Python::FFI::API::Token;

use Python::FFI::Role;

around 'ffi_subs_data' => sub ($orig, $self, @args){
    return +{
        %{ $self->$orig(@args) },

        'PyToken_OneChar' => [ ['int'] => 'int' ],
        'PyToken_ThreeChars' => [ [ 'int', 'int', 'int' ] => 'int' ],
        'PyToken_TwoChars' => [ [ 'int', 'int' ] => 'int' ],
    };
};

sub token_onechar ($self) {
    return $self->ffi_sub('PyToken_OneChar')->();
}

sub token_threechars ($self) {
    return $self->ffi_sub('PyToken_ThreeChars')->();
}

sub token_twochars ($self) {
    return $self->ffi_sub('PyToken_TwoChars')->();
}


no Python::FFI::Role;

1;
