package Python::FFI::API::Node;

use Python::FFI::Role;

around 'ffi_subs_data' => sub ($orig, $self, @args){
    return +{
        %{ $self->$orig(@args) },

        'PyNode_AddChild' => [ [ 'node *', 'int', 'char *', 'int', 'int_offset', 'int_lineno', 'int_col_offset' ] => 'int' ],
        'PyNode_Compile' => [ [ 'struct _node *', 'string' ] => 'PyCodeObject *' ],
        'PyNode_Free' => [ [ 'node *' ] => 'void' ],
        'PyNode_ListTree' => [ [ 'node *' ] => 'void' ],
        'PyNode_New' => [ [ 'int' ] => 'node *' ],
    };
};

sub node_addchild ($self) {
    return $self->ffi_sub('PyNode_AddChild')->();
}

sub node_compile ($self) {
    return $self->ffi_sub('PyNode_Compile')->();
}

sub node_free ($self) {
    return $self->ffi_sub('PyNode_Free')->();
}

sub node_listtree ($self) {
    return $self->ffi_sub('PyNode_ListTree')->();
}

sub node_new ($self) {
    return $self->ffi_sub('PyNode_New')->();
}


no Python::FFI::Role;

1;
