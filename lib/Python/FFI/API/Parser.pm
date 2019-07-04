package Python::FFI::API::Parser;

use Python::FFI::Role;

around 'ffi_subs_data' => sub ($orig, $self, @args){
    return +{
        %{ $self->$orig(@args) },

        'PyParser_ASTFromFile' => [ [ 'FILE *', 'string', 'const char* enc', 'int', 'const char *1', 'const char *2', 'PyCompilerFlags *', 'int *', 'PyArena *' ] => 'struct _mod *' ],
        'PyParser_ASTFromFileObject' => [ [ 'FILE *', 'opaque', 'const char* enc', 'int', 'const char *1', 'const char *2', 'PyCompilerFlags *', 'int *', 'PyArena *' ] => 'struct _mod *' ],
        'PyParser_ASTFromString' => [ [ 'string', 'string', 'int', 'PyCompilerFlags *', 'PyArena *' ] => 'struct _mod *' ],
        'PyParser_ASTFromStringObject' => [ [ 'string', 'opaque', 'int', 'PyCompilerFlags *', 'PyArena *' ] => 'struct _mod *' ],
        'PyParser_ClearError' => [ [ 'perrdetail *' ] => 'void' ],
        'PyParser_ParseFile ' => [ [ 'FILE *', 'string', 'grammar *', 'int', 'string', 'string', 'perrdetail *' ] => 'node *' ],
        'PyParser_ParseFileFlags' => [ [ 'FILE *', 'string', 'string', 'grammar *', 'int', 'const char *1', 'const char *2', 'perrdetail *_ret', 'int' ] => 'node *' ],
        'PyParser_ParseFileFlagsEx' => [ [ 'FILE *', 'string', 'string', 'grammar *', 'int', 'const char *1', 'const char *2', 'perrdetail *_ret', 'int *' ] => 'node *' ],
        'PyParser_ParseFileObject' => [ [ 'FILE *', 'opaque', 'string', 'grammar *', 'int', 'const char *1', 'const char *2', 'perrdetail *_ret', 'int *' ] => 'node *' ],
        'PyParser_ParseString' => [ [ 'string', 'grammar *', 'int', 'perrdetail *' ] => 'node *' ],
        'PyParser_ParseStringFlags' => [ [ 'string', 'grammar *', 'int', 'perrdetail *', 'int' ] => 'node *' ],
        'PyParser_ParseStringFlagsFilename' => [ [ 'string', 'string', 'grammar *', 'int', 'perrdetail *_ret', 'int' ] => 'node *' ],
        'PyParser_ParseStringFlagsFilenameEx' => [ [ 'string', 'string', 'grammar *', 'int', 'perrdetail *_ret', 'int *' ] => 'node *' ],
        'PyParser_ParseStringObject' => [ [ 'string', 'opaque', 'grammar *', 'int', 'perrdetail *_ret', 'int *' ] => 'node *' ],
        'PyParser_SetError' => [ [ 'perrdetail *' ] => 'void' ],
        'PyParser_SimpleParseFileFlags' => [ [ 'FILE *', 'string', 'int', 'int' ] => 'struct _node *' ],
        'PyParser_SimpleParseStringFlags' => [ [ 'string', 'int', 'int' ] => 'struct _node *' ],
        'PyParser_SimpleParseStringFlagsFilename' => [ [ 'string', 'string', 'int', 'int' ] => 'struct _node *' ],
    };
};

sub parser_astfromfile ($self) {
    return $self->ffi_sub('PyParser_ASTFromFile')->();
}

sub parser_astfromfileobject ($self) {
    return $self->ffi_sub('PyParser_ASTFromFileObject')->();
}

sub parser_astfromstring ($self) {
    return $self->ffi_sub('PyParser_ASTFromString')->();
}

sub parser_astfromstringobject ($self) {
    return $self->ffi_sub('PyParser_ASTFromStringObject')->();
}

sub parser_clearerror ($self) {
    return $self->ffi_sub('PyParser_ClearError')->();
}

sub parser_parsefile  ($self) {
    return $self->ffi_sub('PyParser_ParseFile ')->();
}

sub parser_parsefileflags ($self) {
    return $self->ffi_sub('PyParser_ParseFileFlags')->();
}

sub parser_parsefileflagsex ($self) {
    return $self->ffi_sub('PyParser_ParseFileFlagsEx')->();
}

sub parser_parsefileobject ($self) {
    return $self->ffi_sub('PyParser_ParseFileObject')->();
}

sub parser_parsestring ($self) {
    return $self->ffi_sub('PyParser_ParseString')->();
}

sub parser_parsestringflags ($self) {
    return $self->ffi_sub('PyParser_ParseStringFlags')->();
}

sub parser_parsestringflagsfilename ($self) {
    return $self->ffi_sub('PyParser_ParseStringFlagsFilename')->();
}

sub parser_parsestringflagsfilenameex ($self) {
    return $self->ffi_sub('PyParser_ParseStringFlagsFilenameEx')->();
}

sub parser_parsestringobject ($self) {
    return $self->ffi_sub('PyParser_ParseStringObject')->();
}

sub parser_seterror ($self) {
    return $self->ffi_sub('PyParser_SetError')->();
}

sub parser_simpleparsefileflags ($self) {
    return $self->ffi_sub('PyParser_SimpleParseFileFlags')->();
}

sub parser_simpleparsestringflags ($self) {
    return $self->ffi_sub('PyParser_SimpleParseStringFlags')->();
}

sub parser_simpleparsestringflagsfilename ($self) {
    return $self->ffi_sub('PyParser_SimpleParseStringFlagsFilename')->();
}


no Python::FFI::Role;

1;
