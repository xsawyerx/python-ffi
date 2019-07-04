package Python::FFI::API::File;

use Python::FFI::Role;

around 'ffi_subs_data' => sub ($orig, $self, @args){
    return +{
        %{ $self->$orig(@args) },

        'PyFile_FromFd' => [ [ 'int', 'string', 'string', 'int', 'string', 'string', 'string', 'int' ] => 'opaque' ],
        'PyFile_GetLine' => [ [ 'opaque', 'int' ] => 'opaque' ],
        'PyFile_WriteObject' => [ [ 'opaque', 'opaque', 'int' ] => 'int' ],
        'PyFile_WriteString' => [ [ 'string', 'opaque' ] => 'int' ],
    };
};

sub file_fromfd ($self) {
    return $self->ffi_sub('PyFile_FromFd')->();
}

sub file_getline ($self) {
    return $self->ffi_sub('PyFile_GetLine')->();
}

sub file_writeobject ($self) {
    return $self->ffi_sub('PyFile_WriteObject')->();
}

sub file_writestring ($self) {
    return $self->ffi_sub('PyFile_WriteString')->();
}


no Python::FFI::Role;

1;
