package Python::FFI::API::AST;

use Python::FFI::Role;

around 'ffi_subs_data' => sub ($orig, $self, @args){
    return +{
        %{ $self->$orig(@args) },

        'PyAST_CompileEx' => [ [ 'struct _mod *', 'string', 'PyCompilerFlags *', 'int', 'PyArena *' ] => 'PyCodeObject *' ],
        'PyAST_CompileObject' => [ [ 'struct _mod *', 'opaque', 'PyCompilerFlags *', 'int', 'PyArena *' ] => 'PyCodeObject *' ],
        'PyAST_FromNode' => [ [ 'const node *', 'PyCompilerFlags *', 'string', 'PyArena *' ] => 'mod_ty' ],
        'PyAST_FromNodeObject' => [ [ 'const node *', 'PyCompilerFlags *', 'opaque', 'PyArena *' ] => 'mod_ty' ],
        'PyAST_Validate' => [ [ 'mod_ty' ] => 'int' ],
    };
};

sub ast_compileex ($self) {
    return $self->ffi_sub('PyAST_CompileEx')->();
}

sub ast_compileobject ($self) {
    return $self->ffi_sub('PyAST_CompileObject')->();
}

sub ast_fromnode ($self) {
    return $self->ffi_sub('PyAST_FromNode')->();
}

sub ast_fromnodeobject ($self) {
    return $self->ffi_sub('PyAST_FromNodeObject')->();
}

sub ast_validate ($self) {
    return $self->ffi_sub('PyAST_Validate')->();
}


no Python::FFI::Role;

1;
