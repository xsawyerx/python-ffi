package Python::FFI::API::Codec;

use Python::FFI::Role;

around 'ffi_subs_data' => sub ($orig, $self, @args){
    return +{
        %{ $self->$orig(@args) },

        'PyCodec_BackslashReplaceErrors' => [ ['opaque'] => 'opaque' ],
        'PyCodec_Decode' => [ [ 'opaque', 'string', 'string' ] => 'opaque' ],
        'PyCodec_Decoder' => [ ['string'] => 'opaque' ],
        'PyCodec_Encode' => [ [ 'opaque', 'string', 'string' ] => 'opaque' ],
        'PyCodec_Encoder' => [ ['string'] => 'opaque' ],
        'PyCodec_IgnoreErrors' => [ ['opaque'] => 'opaque' ],
        'PyCodec_IncrementalDecoder' => [ [ 'string', 'string' ] => 'opaque' ],
        'PyCodec_IncrementalEncoder' => [ [ 'string', 'string' ] => 'opaque' ],
        'PyCodec_KnownEncoding' => [ ['string'] => 'int' ],
        'PyCodec_LookupError' => [ ['string'] => 'opaque' ],
        'PyCodec_NameReplaceErrors' => [ ['opaque'] => 'opaque' ],
        'PyCodec_Register' => [ ['PyObject *_function'] => 'int' ],
        'PyCodec_RegisterError' => [ [ 'string', 'opaque' ] => 'int' ],
        'PyCodec_ReplaceErrors' => [ ['opaque'] => 'opaque' ],
        'PyCodec_StreamReader' => [ [ 'string', 'opaque', 'string' ] => 'opaque' ],
        'PyCodec_StreamWriter' => [ [ 'string', 'opaque', 'string' ] => 'opaque' ],
        'PyCodec_StrictErrors' => [ ['opaque'] => 'opaque' ],
        'PyCodec_XMLCharRefReplaceErrors' => [ ['opaque'] => 'opaque' ],
    };
};

sub codec_backslashreplaceerrors ($self) {
    return $self->ffi_sub('PyCodec_BackslashReplaceErrors')->();
}

sub codec_decode ($self) {
    return $self->ffi_sub('PyCodec_Decode')->();
}

sub codec_decoder ($self) {
    return $self->ffi_sub('PyCodec_Decoder')->();
}

sub codec_encode ($self) {
    return $self->ffi_sub('PyCodec_Encode')->();
}

sub codec_encoder ($self) {
    return $self->ffi_sub('PyCodec_Encoder')->();
}

sub codec_ignoreerrors ($self) {
    return $self->ffi_sub('PyCodec_IgnoreErrors')->();
}

sub codec_incrementaldecoder ($self) {
    return $self->ffi_sub('PyCodec_IncrementalDecoder')->();
}

sub codec_incrementalencoder ($self) {
    return $self->ffi_sub('PyCodec_IncrementalEncoder')->();
}

sub codec_knownencoding ($self) {
    return $self->ffi_sub('PyCodec_KnownEncoding')->();
}

sub codec_lookuperror ($self) {
    return $self->ffi_sub('PyCodec_LookupError')->();
}

sub codec_namereplaceerrors ($self) {
    return $self->ffi_sub('PyCodec_NameReplaceErrors')->();
}

sub codec_register ($self) {
    return $self->ffi_sub('PyCodec_Register')->();
}

sub codec_registererror ($self) {
    return $self->ffi_sub('PyCodec_RegisterError')->();
}

sub codec_replaceerrors ($self) {
    return $self->ffi_sub('PyCodec_ReplaceErrors')->();
}

sub codec_streamreader ($self) {
    return $self->ffi_sub('PyCodec_StreamReader')->();
}

sub codec_streamwriter ($self) {
    return $self->ffi_sub('PyCodec_StreamWriter')->();
}

sub codec_stricterrors ($self) {
    return $self->ffi_sub('PyCodec_StrictErrors')->();
}

sub codec_xmlcharrefreplaceerrors ($self) {
    return $self->ffi_sub('PyCodec_XMLCharRefReplaceErrors')->();
}


no Python::FFI::Role;

1;
