package Python::FFI::API::Future;

use Python::FFI::Role;

around 'ffi_subs_data' => sub ($orig, $self, @args){
    return +{
        %{ $self->$orig(@args) },

        'PyFuture_FromAST' => [ [ 'struct _mod * mod', 'string' ] => 'PyFutureFeatures *' ],
        'PyFuture_FromASTObject' => [ [ 'struct _mod * mod', 'opaque' ] => 'PyFutureFeatures *' ],
    };
};

sub future_fromast ($self) {
    return $self->ffi_sub('PyFuture_FromAST')->();
}

sub future_fromastobject ($self) {
    return $self->ffi_sub('PyFuture_FromASTObject')->();
}


no Python::FFI::Role;

1;
