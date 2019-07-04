package Python::FFI::API::Number;

use Python::FFI::Role;

around 'ffi_subs_data' => sub ($orig, $self, @args){
    return +{
        %{ $self->$orig(@args) },

        'PyNumber_Absolute' => [ [ 'opaque' ] => 'opaque' ],
        'PyNumber_Add' => [ [ 'PyObject *1', 'PyObject *2' ] => 'opaque' ],
        'PyNumber_And' => [ [ 'PyObject *1', 'PyObject *2' ] => 'opaque' ],
        'PyNumber_AsSsize_t' => [ [ 'opaque', 'opaque' ] => 'Py_ssize_t' ],
        'PyNumber_Check' => [ [ 'opaque' ] => 'int' ],
        'PyNumber_Divmod' => [ [ 'PyObject *1', 'PyObject *2' ] => 'opaque' ],
        'PyNumber_Float' => [ [ 'opaque' ] => 'opaque' ],
        'PyNumber_FloorDivide' => [ [ 'PyObject *1', 'PyObject *2' ] => 'opaque' ],
        'PyNumber_InPlaceAdd' => [ [ 'PyObject *1', 'PyObject *2' ] => 'opaque' ],
        'PyNumber_InPlaceAnd' => [ [ 'PyObject *1', 'PyObject *2' ] => 'opaque' ],
        'PyNumber_InPlaceFloorDivide' => [ [ 'PyObject *1', 'PyObject *2' ] => 'opaque' ],
        'PyNumber_InPlaceLshift' => [ [ 'PyObject *1', 'PyObject *2' ] => 'opaque' ],
        'PyNumber_InPlaceMatrixMultiply' => [ [ 'PyObject *1', 'PyObject *2' ] => 'opaque' ],
        'PyNumber_InPlaceMultiply' => [ [ 'PyObject *1', 'PyObject *2' ] => 'opaque' ],
        'PyNumber_InPlaceOr' => [ [ 'PyObject *1', 'PyObject *2' ] => 'opaque' ],
        'PyNumber_InPlacePower' => [ [ 'PyObject *1', 'PyObject *2', 'PyObject *3' ] => 'opaque' ],
        'PyNumber_InPlaceRemainder' => [ [ 'PyObject *1', 'PyObject *2' ] => 'opaque' ],
        'PyNumber_InPlaceRshift' => [ [ 'PyObject *1', 'PyObject *2' ] => 'opaque' ],
        'PyNumber_InPlaceSubtract' => [ [ 'PyObject *1', 'PyObject *2' ] => 'opaque' ],
        'PyNumber_InPlaceTrueDivide' => [ [ 'PyObject *1', 'PyObject *2' ] => 'opaque' ],
        'PyNumber_InPlaceXor' => [ [ 'PyObject *1', 'PyObject *2' ] => 'opaque' ],
        'PyNumber_Index' => [ [ 'opaque' ] => 'opaque' ],
        'PyNumber_Invert' => [ [ 'opaque' ] => 'opaque' ],
        'PyNumber_Long' => [ [ 'opaque' ] => 'opaque' ],
        'PyNumber_Lshift' => [ [ 'PyObject *1', 'PyObject *2' ] => 'opaque' ],
        'PyNumber_MatrixMultiply' => [ [ 'PyObject *1', 'PyObject *2' ] => 'opaque' ],
        'PyNumber_Multiply' => [ [ 'PyObject *1', 'PyObject *2' ] => 'opaque' ],
        'PyNumber_Negative' => [ [ 'opaque' ] => 'opaque' ],
        'PyNumber_Or' => [ [ 'PyObject *1', 'PyObject *2' ] => 'opaque' ],
        'PyNumber_Positive' => [ [ 'opaque' ] => 'opaque' ],
        'PyNumber_Power' => [ [ 'PyObject *1', 'PyObject *2', 'PyObject *3' ] => 'opaque' ],
        'PyNumber_Remainder' => [ [ 'PyObject *1', 'PyObject *2' ] => 'opaque' ],
        'PyNumber_Rshift' => [ [ 'PyObject *1', 'PyObject *2' ] => 'opaque' ],
        'PyNumber_Subtract' => [ [ 'PyObject *1', 'PyObject *2' ] => 'opaque' ],
        'PyNumber_ToBase' => [ [ 'opaque', 'int' ] => 'opaque' ],
        'PyNumber_TrueDivide' => [ [ 'PyObject *1', 'PyObject *2' ] => 'opaque' ],
        'PyNumber_Xor' => [ [ 'PyObject *1', 'PyObject *2' ] => 'opaque' ],
    };
};

sub number_absolute ($self) {
    return $self->ffi_sub('PyNumber_Absolute')->();
}

sub number_add ($self) {
    return $self->ffi_sub('PyNumber_Add')->();
}

sub number_and ($self) {
    return $self->ffi_sub('PyNumber_And')->();
}

sub number_asssize_t ($self) {
    return $self->ffi_sub('PyNumber_AsSsize_t')->();
}

sub number_check ($self) {
    return $self->ffi_sub('PyNumber_Check')->();
}

sub number_divmod ($self) {
    return $self->ffi_sub('PyNumber_Divmod')->();
}

sub number_float ($self) {
    return $self->ffi_sub('PyNumber_Float')->();
}

sub number_floordivide ($self) {
    return $self->ffi_sub('PyNumber_FloorDivide')->();
}

sub number_inplaceadd ($self) {
    return $self->ffi_sub('PyNumber_InPlaceAdd')->();
}

sub number_inplaceand ($self) {
    return $self->ffi_sub('PyNumber_InPlaceAnd')->();
}

sub number_inplacefloordivide ($self) {
    return $self->ffi_sub('PyNumber_InPlaceFloorDivide')->();
}

sub number_inplacelshift ($self) {
    return $self->ffi_sub('PyNumber_InPlaceLshift')->();
}

sub number_inplacematrixmultiply ($self) {
    return $self->ffi_sub('PyNumber_InPlaceMatrixMultiply')->();
}

sub number_inplacemultiply ($self) {
    return $self->ffi_sub('PyNumber_InPlaceMultiply')->();
}

sub number_inplaceor ($self) {
    return $self->ffi_sub('PyNumber_InPlaceOr')->();
}

sub number_inplacepower ($self) {
    return $self->ffi_sub('PyNumber_InPlacePower')->();
}

sub number_inplaceremainder ($self) {
    return $self->ffi_sub('PyNumber_InPlaceRemainder')->();
}

sub number_inplacershift ($self) {
    return $self->ffi_sub('PyNumber_InPlaceRshift')->();
}

sub number_inplacesubtract ($self) {
    return $self->ffi_sub('PyNumber_InPlaceSubtract')->();
}

sub number_inplacetruedivide ($self) {
    return $self->ffi_sub('PyNumber_InPlaceTrueDivide')->();
}

sub number_inplacexor ($self) {
    return $self->ffi_sub('PyNumber_InPlaceXor')->();
}

sub number_index ($self) {
    return $self->ffi_sub('PyNumber_Index')->();
}

sub number_invert ($self) {
    return $self->ffi_sub('PyNumber_Invert')->();
}

sub number_long ($self) {
    return $self->ffi_sub('PyNumber_Long')->();
}

sub number_lshift ($self) {
    return $self->ffi_sub('PyNumber_Lshift')->();
}

sub number_matrixmultiply ($self) {
    return $self->ffi_sub('PyNumber_MatrixMultiply')->();
}

sub number_multiply ($self) {
    return $self->ffi_sub('PyNumber_Multiply')->();
}

sub number_negative ($self) {
    return $self->ffi_sub('PyNumber_Negative')->();
}

sub number_or ($self) {
    return $self->ffi_sub('PyNumber_Or')->();
}

sub number_positive ($self) {
    return $self->ffi_sub('PyNumber_Positive')->();
}

sub number_power ($self) {
    return $self->ffi_sub('PyNumber_Power')->();
}

sub number_remainder ($self) {
    return $self->ffi_sub('PyNumber_Remainder')->();
}

sub number_rshift ($self) {
    return $self->ffi_sub('PyNumber_Rshift')->();
}

sub number_subtract ($self) {
    return $self->ffi_sub('PyNumber_Subtract')->();
}

sub number_tobase ($self) {
    return $self->ffi_sub('PyNumber_ToBase')->();
}

sub number_truedivide ($self) {
    return $self->ffi_sub('PyNumber_TrueDivide')->();
}

sub number_xor ($self) {
    return $self->ffi_sub('PyNumber_Xor')->();
}


no Python::FFI::Role;

1;
