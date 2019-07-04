package Python::FFI::API::Run;

use Python::FFI::Role;

around 'ffi_subs_data' => sub ($orig, $self, @args){
    return +{
        %{ $self->$orig(@args) },

        'PyRun_AnyFile' => [ [ 'FILE *', 'string' ] => 'int' ],
        'PyRun_AnyFileEx' => [ [ 'FILE *', 'string', 'int' ] => 'int' ],
        'PyRun_AnyFileExFlags' => [ [ 'FILE *', 'string', 'int', 'PyCompilerFlags *' ] => 'int' ],
        'PyRun_AnyFileFlags' => [ [ 'FILE *', 'string', 'PyCompilerFlags *' ] => 'int' ],
        'PyRun_File' => [ [ 'FILE *', 'string', 'int', 'opaque', 'opaque' ] => 'opaque' ],
        'PyRun_FileEx' => [ [ 'FILE *', 'string', 'int', 'opaque', 'opaque', 'int' ] => 'opaque' ],
        'PyRun_FileExFlags' => [ [ 'FILE *', 'string', 'int', 'opaque', 'opaque', 'int', 'PyCompilerFlags *' ] => 'opaque' ],
        'PyRun_FileFlags' => [ [ 'FILE *', 'string', 'int', 'opaque', 'opaque', 'PyCompilerFlags *' ] => 'opaque' ],
        'PyRun_InteractiveLoop' => [ [ 'FILE *', 'string' ] => 'int' ],
        'PyRun_InteractiveLoopFlags' => [ [ 'FILE *', 'string', 'PyCompilerFlags *' ] => 'int' ],
        'PyRun_InteractiveOne' => [ [ 'FILE *', 'string' ] => 'int' ],
        'PyRun_InteractiveOneFlags' => [ [ 'FILE *', 'string', 'PyCompilerFlags *' ] => 'int' ],
        'PyRun_InteractiveOneObject' => [ [ 'FILE *', 'opaque', 'PyCompilerFlags *' ] => 'int' ],
        'PyRun_SimpleFile' => [ [ 'FILE *', 'string' ] => 'int' ],
        'PyRun_SimpleFileEx' => [ [ 'FILE *', 'string', 'int' ] => 'int' ],
        'PyRun_SimpleFileExFlags' => [ [ 'FILE *', 'string', 'int', 'PyCompilerFlags *' ] => 'int' ],
        'PyRun_SimpleString' => [ ['string'] => 'int' ],
        'PyRun_SimpleStringFlags' => [ [ 'string', 'PyCompilerFlags *' ] => 'int' ],
        'PyRun_String' => [ [ 'string', 'int', 'opaque', 'opaque' ] => 'opaque' ],
        'PyRun_StringFlags' => [ [ 'string', 'int', 'opaque', 'opaque', 'PyCompilerFlags *' ] => 'opaque' ],
    };
};

sub run_anyfile ($self) {
    return $self->ffi_sub('PyRun_AnyFile')->();
}

sub run_anyfileex ($self) {
    return $self->ffi_sub('PyRun_AnyFileEx')->();
}

sub run_anyfileexflags ($self) {
    return $self->ffi_sub('PyRun_AnyFileExFlags')->();
}

sub run_anyfileflags ($self) {
    return $self->ffi_sub('PyRun_AnyFileFlags')->();
}

sub run_file ($self) {
    return $self->ffi_sub('PyRun_File')->();
}

sub run_fileex ($self) {
    return $self->ffi_sub('PyRun_FileEx')->();
}

sub run_fileexflags ($self) {
    return $self->ffi_sub('PyRun_FileExFlags')->();
}

sub run_fileflags ($self) {
    return $self->ffi_sub('PyRun_FileFlags')->();
}

sub run_interactiveloop ($self) {
    return $self->ffi_sub('PyRun_InteractiveLoop')->();
}

sub run_interactiveloopflags ($self) {
    return $self->ffi_sub('PyRun_InteractiveLoopFlags')->();
}

sub run_interactiveone ($self) {
    return $self->ffi_sub('PyRun_InteractiveOne')->();
}

sub run_interactiveoneflags ($self) {
    return $self->ffi_sub('PyRun_InteractiveOneFlags')->();
}

sub run_interactiveoneobject ($self) {
    return $self->ffi_sub('PyRun_InteractiveOneObject')->();
}

sub run_simplefile ($self) {
    return $self->ffi_sub('PyRun_SimpleFile')->();
}

sub run_simplefileex ($self) {
    return $self->ffi_sub('PyRun_SimpleFileEx')->();
}

sub run_simplefileexflags ($self) {
    return $self->ffi_sub('PyRun_SimpleFileExFlags')->();
}

sub run_simplestring ($self, $string) {
    return $self->ffi_sub('PyRun_SimpleString')->($string);
}

sub run_simplestringflags ($self) {
    return $self->ffi_sub('PyRun_SimpleStringFlags')->();
}

sub run_string ($self) {
    return $self->ffi_sub('PyRun_String')->();
}

sub run_stringflags ($self) {
    return $self->ffi_sub('PyRun_StringFlags')->();
}


no Python::FFI::Role;

1;
