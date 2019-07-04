package Python::FFI::API::SeqIter;

use Python::FFI::Role;

around 'ffi_subs_data' => sub ($orig, $self, @args){
    return +{
        %{ $self->$orig(@args) },

        'PySeqIter_New' => [ ['opaque'] => 'opaque' ],
    };
};

sub seqiter_new ($self) {
    return $self->ffi_sub('PySeqIter_New')->();
}


no Python::FFI::Role;

1;
