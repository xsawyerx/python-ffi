package Python::FFI::API::Complex;

use Python::FFI::Role;

around 'ffi_subs_data' => sub ($orig, $self, @args){
    return +{
        %{ $self->$orig(@args) },

        'PyComplex_AsCComplex' => [ ['opaque'] => 'Py_complex' ],
        'PyComplex_FromCComplex' => [ ['Py_complex'] => 'opaque' ],
        'PyComplex_FromDoubles' => [ [ 'double real', 'double imag' ] => 'opaque' ],
        'PyComplex_ImagAsDouble' => [ ['opaque'] => 'double' ],
        'PyComplex_RealAsDouble' => [ ['opaque'] => 'double' ],
    };
};

sub complex_asccomplex ($self) {
    return $self->ffi_sub('PyComplex_AsCComplex')->();
}

sub complex_fromccomplex ($self) {
    return $self->ffi_sub('PyComplex_FromCComplex')->();
}

sub complex_fromdoubles ($self) {
    return $self->ffi_sub('PyComplex_FromDoubles')->();
}

sub complex_imagasdouble ($self) {
    return $self->ffi_sub('PyComplex_ImagAsDouble')->();
}

sub complex_realasdouble ($self) {
    return $self->ffi_sub('PyComplex_RealAsDouble')->();
}


no Python::FFI::Role;

1;
