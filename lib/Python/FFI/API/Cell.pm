package Python::FFI::API::Cell;

use Python::FFI::Role;

around 'ffi_subs_data' => sub ($orig, $self, @args){
    return +{
        %{ $self->$orig(@args) },

        'PyCell_Get' => [ [ 'opaque' ] => 'opaque' ],
        'PyCell_New' => [ [ 'opaque' ] => 'opaque' ],
        'PyCell_Set' => [ [ 'opaque', 'opaque' ] => 'int' ],
    };
};

sub cell_get ($self) {
    return $self->ffi_sub('PyCell_Get')->();
}

sub cell_new ($self) {
    return $self->ffi_sub('PyCell_New')->();
}

sub cell_set ($self) {
    return $self->ffi_sub('PyCell_Set')->();
}


no Python::FFI::Role;

1;
