package Python::FFI::API::Unicode;

use Python::FFI::Role;

around 'ffi_subs_data' => sub ($orig, $self, @args){
    return +{
        %{ $self->$orig(@args) },

        'PyUnicode_Append' => [ [ 'PyObject **', 'opaque' ] => 'void' ],
        'PyUnicode_AppendAndDel' => [ [ 'PyObject **', 'opaque' ] => 'void' ],
        'PyUnicode_AsASCIIString' => [ ['opaque'] => 'PyObject*' ],
        'PyUnicode_AsCharmapString' => [ [ 'opaque', 'opaque' ] => 'PyObject*' ],
        'PyUnicode_AsDecodedObject' => [ [ 'opaque', 'string', 'string' ] => 'PyObject*' ],
        'PyUnicode_AsDecodedUnicode' => [ [ 'opaque', 'string', 'string' ] => 'PyObject*' ],
        'PyUnicode_AsEncodedObject' => [ [ 'opaque', 'string', 'string' ] => 'PyObject*' ],
        'PyUnicode_AsEncodedString' => [ [ 'opaque', 'string', 'string' ] => 'PyObject*' ],
        'PyUnicode_AsEncodedUnicode' => [ [ 'opaque', 'string', 'string' ] => 'PyObject*' ],
        'PyUnicode_AsLatin1String' => [ ['opaque'] => 'PyObject*' ],
        'PyUnicode_AsMBCSString' => [ ['opaque'] => 'PyObject*' ],
        'PyUnicode_AsRawUnicodeEscapeString' => [ ['opaque'] => 'PyObject*' ],
        'PyUnicode_AsUCS4' => [ [ 'opaque', 'Py_UCS4* buffer', 'Py_ssize_t buflen', 'int_null' ] => 'Py_UCS4*' ],
        'PyUnicode_AsUCS4Copy' => [ ['opaque'] => 'Py_UCS4*' ],
        'PyUnicode_AsUTF16String' => [ ['opaque'] => 'PyObject*' ],
        'PyUnicode_AsUTF32String' => [ ['opaque'] => 'PyObject*' ],
        'PyUnicode_AsUTF8String' => [ ['opaque'] => 'PyObject*' ],
        'PyUnicode_AsUnicodeEscapeString' => [ ['opaque'] => 'PyObject*' ],
        'PyUnicode_AsWideChar' => [ [ 'opaque', 'wchar_t *', 'Py_ssize_t size' ] => 'Py_ssize_t' ],
        'PyUnicode_AsWideCharString' => [ [ 'opaque', 'Py_ssize_t *' ] => 'wchar_t*' ],
        'PyUnicode_BuildEncodingMap' => [ ['PyObject* string'] => 'PyObject*' ],
        'PyUnicode_ClearFreeList' => [ [] => 'int' ],
        'PyUnicode_Compare' => [ [ 'opaque', 'opaque' ] => 'int' ],
        'PyUnicode_CompareWithASCIIString' => [ [ 'opaque', 'string' ] => 'int' ],
        'PyUnicode_Concat' => [ [ 'opaque', 'opaque' ] => 'PyObject*' ],
        'PyUnicode_Contains' => [ [ 'opaque', 'opaque' ] => 'int' ],
        'PyUnicode_Count' => [ [ 'opaque', 'opaque', 'Py_ssize_t start', 'Py_ssize_t end' ] => 'Py_ssize_t' ],
        'PyUnicode_Decode' => [ [ 'string', 'Py_ssize_t size', 'string', 'string' ] => 'PyObject*' ],
        'PyUnicode_DecodeASCII' => [ [ 'string', 'Py_ssize_t length', 'string' ] => 'PyObject*' ],
        'PyUnicode_DecodeCharmap' => [ [ 'string', 'Py_ssize_t length', 'opaque', 'string' ] => 'PyObject*' ],
        'PyUnicode_DecodeCodePageStateful' => [ [ 'int_page', 'string', 'Py_ssize_t length', 'string', 'Py_ssize_t *' ] => 'PyObject*' ],
        'PyUnicode_DecodeFSDefault' => [ ['string'] => 'PyObject*' ],
        'PyUnicode_DecodeFSDefaultAndSize' => [ [ 'string', 'Py_ssize_t size' ] => 'PyObject*' ],
        'PyUnicode_DecodeLatin1' => [ [ 'string', 'Py_ssize_t length', 'string' ] => 'PyObject*' ],
        'PyUnicode_DecodeLocale' => [ [ 'string', 'string' ] => 'PyObject*' ],
        'PyUnicode_DecodeLocaleAndSize' => [ [ 'string', 'Py_ssize_t len', 'string' ] => 'PyObject*' ],
        'PyUnicode_DecodeMBCS' => [ [ 'string', 'Py_ssize_t length', 'string' ] => 'PyObject*' ],
        'PyUnicode_DecodeMBCSStateful' => [ [ 'string', 'Py_ssize_t length', 'string', 'Py_ssize_t *' ] => 'PyObject*' ],
        'PyUnicode_DecodeRawUnicodeEscape' => [ [ 'string', 'Py_ssize_t length', 'string' ] => 'PyObject*' ],
        'PyUnicode_DecodeUTF16' => [ [ 'string', 'Py_ssize_t length', 'string', 'int *' ] => 'PyObject*' ],
        'PyUnicode_DecodeUTF16Stateful' => [ [ 'string', 'Py_ssize_t length', 'string', 'int *', 'Py_ssize_t *' ] => 'PyObject*' ],
        'PyUnicode_DecodeUTF32' => [ [ 'string', 'Py_ssize_t length', 'string', 'int *' ] => 'PyObject*' ],
        'PyUnicode_DecodeUTF32Stateful' => [ [ 'string', 'Py_ssize_t length', 'string', 'int *', 'Py_ssize_t *' ] => 'PyObject*' ],
        'PyUnicode_DecodeUTF7' => [ [ 'string', 'Py_ssize_t length', 'string' ] => 'PyObject*' ],
        'PyUnicode_DecodeUTF7Stateful' => [ [ 'string', 'Py_ssize_t length', 'string', 'Py_ssize_t *' ] => 'PyObject*' ],
        'PyUnicode_DecodeUTF8' => [ [ 'string', 'Py_ssize_t length', 'string' ] => 'PyObject*' ],
        'PyUnicode_DecodeUTF8Stateful' => [ [ 'string', 'Py_ssize_t length', 'string', 'Py_ssize_t *' ] => 'PyObject*' ],
        'PyUnicode_DecodeUnicodeEscape' => [ [ 'string', 'Py_ssize_t length', 'string' ] => 'PyObject*' ],
        'PyUnicode_EncodeCodePage' => [ [ 'int_page', 'opaque', 'string' ] => 'PyObject*' ],
        'PyUnicode_EncodeFSDefault' => [ ['opaque'] => 'PyObject*' ],
        'PyUnicode_EncodeLocale' => [ [ 'opaque', 'string' ] => 'PyObject*' ],
        'PyUnicode_FSConverter' => [ [ 'PyObject*', 'void*' ] => 'int' ],
        'PyUnicode_FSDecoder' => [ [ 'PyObject*', 'void*' ] => 'int' ],
        'PyUnicode_Find' => [ [ 'opaque', 'opaque', 'Py_ssize_t start', 'Py_ssize_t end', 'int' ] => 'Py_ssize_t' ],
        'PyUnicode_FindChar' => [ [ 'opaque', 'Py_UCS4 ch', 'Py_ssize_t start', 'Py_ssize_t end', 'int' ] => 'Py_ssize_t' ],
        'PyUnicode_Format' => [ [ 'opaque', 'opaque' ] => 'opaque' ],
        'PyUnicode_FromEncodedObject' => [ [ 'opaque', 'string', 'string' ] => 'PyObject*' ],
        'PyUnicode_FromFormat' => [ [ 'string', '...' ] => 'opaque' ],
        'PyUnicode_FromFormatV' => [ [ 'string', 'va_list vargs' ] => 'opaque' ],
        'PyUnicode_FromObject' => [ ['opaque'] => 'PyObject*' ],
        'PyUnicode_FromOrdinal' => [ ['int'] => 'PyObject*' ],
        'PyUnicode_FromString' => [ ['string'] => 'PyObject*' ],
        'PyUnicode_FromStringAndSize' => [ [ 'string', 'Py_ssize_t size' ] => 'PyObject*' ],
        'PyUnicode_FromWideChar' => [ [ 'const wchar_t *', 'Py_ssize_t size' ] => 'PyObject*' ],
        'PyUnicode_GetDefaultEncoding' => [ [] => 'const char*' ],
        'PyUnicode_GetLength' => [ ['opaque'] => 'Py_ssize_t' ],
        'PyUnicode_GetSize' => [ ['opaque'] => 'Py_ssize_t' ],
        'PyUnicode_InternFromString' => [ ['string'] => 'opaque' ],
        'PyUnicode_InternImmortal' => [ ['PyObject **'] => 'void' ],
        'PyUnicode_InternInPlace' => [ ['PyObject **'] => 'void' ],
        'PyUnicode_IsIdentifier' => [ ['opaque'] => 'int' ],
        'PyUnicode_Join' => [ [ 'opaque', 'opaque' ] => 'PyObject*' ],
        'PyUnicode_Partition' => [ [ 'opaque', 'opaque' ] => 'PyObject*' ],
        'PyUnicode_RPartition' => [ [ 'opaque', 'opaque' ] => 'PyObject*' ],
        'PyUnicode_RSplit' => [ [ 'opaque', 'opaque', 'Py_ssize_t maxsplit' ] => 'PyObject*' ],
        'PyUnicode_ReadChar' => [ [ 'opaque', 'Py_ssize_t index' ] => 'Py_UCS4' ],
        'PyUnicode_Replace' => [ [ 'opaque', 'opaque', 'opaque', 'Py_ssize_t maxcount' ] => 'opaque' ],
        'PyUnicode_Resize' => [ [ 'PyObject **', 'Py_ssize_t length' ] => 'int' ],
        'PyUnicode_RichCompare' => [ [ 'opaque', 'opaque', 'int' ] => 'opaque' ],
        'PyUnicode_Split' => [ [ 'opaque', 'opaque', 'Py_ssize_t maxsplit' ] => 'PyObject*' ],
        'PyUnicode_Splitlines' => [ [ 'opaque', 'int' ] => 'PyObject*' ],
        'PyUnicode_Substring' => [ [ 'opaque', 'Py_ssize_t start', 'Py_ssize_t end' ] => 'PyObject*' ],
        'PyUnicode_Tailmatch' => [ [ 'opaque', 'opaque', 'Py_ssize_t start', 'Py_ssize_t end', 'int' ] => 'Py_ssize_t' ],
        'PyUnicode_Translate' => [ [ 'opaque', 'opaque', 'string' ] => 'opaque' ],
        'PyUnicode_WriteChar' => [ [ 'opaque', 'Py_ssize_t index', 'Py_UCS4 character' ] => 'int' ],
    };
};

sub unicode_append ($self) {
    return $self->ffi_sub('PyUnicode_Append')->();
}

sub unicode_appendanddel ($self) {
    return $self->ffi_sub('PyUnicode_AppendAndDel')->();
}

sub unicode_asasciistring ($self) {
    return $self->ffi_sub('PyUnicode_AsASCIIString')->();
}

sub unicode_ascharmapstring ($self) {
    return $self->ffi_sub('PyUnicode_AsCharmapString')->();
}

sub unicode_asdecodedobject ($self) {
    return $self->ffi_sub('PyUnicode_AsDecodedObject')->();
}

sub unicode_asdecodedunicode ($self) {
    return $self->ffi_sub('PyUnicode_AsDecodedUnicode')->();
}

sub unicode_asencodedobject ($self) {
    return $self->ffi_sub('PyUnicode_AsEncodedObject')->();
}

sub unicode_asencodedstring ($self) {
    return $self->ffi_sub('PyUnicode_AsEncodedString')->();
}

sub unicode_asencodedunicode ($self) {
    return $self->ffi_sub('PyUnicode_AsEncodedUnicode')->();
}

sub unicode_aslatin1string ($self) {
    return $self->ffi_sub('PyUnicode_AsLatin1String')->();
}

sub unicode_asmbcsstring ($self) {
    return $self->ffi_sub('PyUnicode_AsMBCSString')->();
}

sub unicode_asrawunicodeescapestring ($self) {
    return $self->ffi_sub('PyUnicode_AsRawUnicodeEscapeString')->();
}

sub unicode_asucs4 ($self) {
    return $self->ffi_sub('PyUnicode_AsUCS4')->();
}

sub unicode_asucs4copy ($self) {
    return $self->ffi_sub('PyUnicode_AsUCS4Copy')->();
}

sub unicode_asutf16string ($self) {
    return $self->ffi_sub('PyUnicode_AsUTF16String')->();
}

sub unicode_asutf32string ($self) {
    return $self->ffi_sub('PyUnicode_AsUTF32String')->();
}

sub unicode_asutf8string ($self) {
    return $self->ffi_sub('PyUnicode_AsUTF8String')->();
}

sub unicode_asunicodeescapestring ($self) {
    return $self->ffi_sub('PyUnicode_AsUnicodeEscapeString')->();
}

sub unicode_aswidechar ($self) {
    return $self->ffi_sub('PyUnicode_AsWideChar')->();
}

sub unicode_aswidecharstring ($self) {
    return $self->ffi_sub('PyUnicode_AsWideCharString')->();
}

sub unicode_buildencodingmap ($self) {
    return $self->ffi_sub('PyUnicode_BuildEncodingMap')->();
}

sub unicode_clearfreelist ($self) {
    return $self->ffi_sub('PyUnicode_ClearFreeList')->();
}

sub unicode_compare ($self) {
    return $self->ffi_sub('PyUnicode_Compare')->();
}

sub unicode_comparewithasciistring ($self) {
    return $self->ffi_sub('PyUnicode_CompareWithASCIIString')->();
}

sub unicode_concat ($self) {
    return $self->ffi_sub('PyUnicode_Concat')->();
}

sub unicode_contains ($self) {
    return $self->ffi_sub('PyUnicode_Contains')->();
}

sub unicode_count ($self) {
    return $self->ffi_sub('PyUnicode_Count')->();
}

sub unicode_decode ($self) {
    return $self->ffi_sub('PyUnicode_Decode')->();
}

sub unicode_decodeascii ($self) {
    return $self->ffi_sub('PyUnicode_DecodeASCII')->();
}

sub unicode_decodecharmap ($self) {
    return $self->ffi_sub('PyUnicode_DecodeCharmap')->();
}

sub unicode_decodecodepagestateful ($self) {
    return $self->ffi_sub('PyUnicode_DecodeCodePageStateful')->();
}

sub unicode_decodefsdefault ($self) {
    return $self->ffi_sub('PyUnicode_DecodeFSDefault')->();
}

sub unicode_decodefsdefaultandsize ($self) {
    return $self->ffi_sub('PyUnicode_DecodeFSDefaultAndSize')->();
}

sub unicode_decodelatin1 ($self) {
    return $self->ffi_sub('PyUnicode_DecodeLatin1')->();
}

sub unicode_decodelocale ($self) {
    return $self->ffi_sub('PyUnicode_DecodeLocale')->();
}

sub unicode_decodelocaleandsize ($self) {
    return $self->ffi_sub('PyUnicode_DecodeLocaleAndSize')->();
}

sub unicode_decodembcs ($self) {
    return $self->ffi_sub('PyUnicode_DecodeMBCS')->();
}

sub unicode_decodembcsstateful ($self) {
    return $self->ffi_sub('PyUnicode_DecodeMBCSStateful')->();
}

sub unicode_decoderawunicodeescape ($self) {
    return $self->ffi_sub('PyUnicode_DecodeRawUnicodeEscape')->();
}

sub unicode_decodeutf16 ($self) {
    return $self->ffi_sub('PyUnicode_DecodeUTF16')->();
}

sub unicode_decodeutf16stateful ($self) {
    return $self->ffi_sub('PyUnicode_DecodeUTF16Stateful')->();
}

sub unicode_decodeutf32 ($self) {
    return $self->ffi_sub('PyUnicode_DecodeUTF32')->();
}

sub unicode_decodeutf32stateful ($self) {
    return $self->ffi_sub('PyUnicode_DecodeUTF32Stateful')->();
}

sub unicode_decodeutf7 ($self) {
    return $self->ffi_sub('PyUnicode_DecodeUTF7')->();
}

sub unicode_decodeutf7stateful ($self) {
    return $self->ffi_sub('PyUnicode_DecodeUTF7Stateful')->();
}

sub unicode_decodeutf8 ($self) {
    return $self->ffi_sub('PyUnicode_DecodeUTF8')->();
}

sub unicode_decodeutf8stateful ($self) {
    return $self->ffi_sub('PyUnicode_DecodeUTF8Stateful')->();
}

sub unicode_decodeunicodeescape ($self) {
    return $self->ffi_sub('PyUnicode_DecodeUnicodeEscape')->();
}

sub unicode_encodecodepage ($self) {
    return $self->ffi_sub('PyUnicode_EncodeCodePage')->();
}

sub unicode_encodefsdefault ($self) {
    return $self->ffi_sub('PyUnicode_EncodeFSDefault')->();
}

sub unicode_encodelocale ($self) {
    return $self->ffi_sub('PyUnicode_EncodeLocale')->();
}

sub unicode_fsconverter ($self) {
    return $self->ffi_sub('PyUnicode_FSConverter')->();
}

sub unicode_fsdecoder ($self) {
    return $self->ffi_sub('PyUnicode_FSDecoder')->();
}

sub unicode_find ($self) {
    return $self->ffi_sub('PyUnicode_Find')->();
}

sub unicode_findchar ($self) {
    return $self->ffi_sub('PyUnicode_FindChar')->();
}

sub unicode_format ($self) {
    return $self->ffi_sub('PyUnicode_Format')->();
}

sub unicode_fromencodedobject ($self) {
    return $self->ffi_sub('PyUnicode_FromEncodedObject')->();
}

sub unicode_fromformat ($self) {
    return $self->ffi_sub('PyUnicode_FromFormat')->();
}

sub unicode_fromformatv ($self) {
    return $self->ffi_sub('PyUnicode_FromFormatV')->();
}

sub unicode_fromobject ($self) {
    return $self->ffi_sub('PyUnicode_FromObject')->();
}

sub unicode_fromordinal ($self) {
    return $self->ffi_sub('PyUnicode_FromOrdinal')->();
}

sub unicode_fromstring ($self) {
    return $self->ffi_sub('PyUnicode_FromString')->();
}

sub unicode_fromstringandsize ($self) {
    return $self->ffi_sub('PyUnicode_FromStringAndSize')->();
}

sub unicode_fromwidechar ($self) {
    return $self->ffi_sub('PyUnicode_FromWideChar')->();
}

sub unicode_getdefaultencoding ($self) {
    return $self->ffi_sub('PyUnicode_GetDefaultEncoding')->();
}

sub unicode_getlength ($self) {
    return $self->ffi_sub('PyUnicode_GetLength')->();
}

sub unicode_getsize ($self) {
    return $self->ffi_sub('PyUnicode_GetSize')->();
}

sub unicode_internfromstring ($self) {
    return $self->ffi_sub('PyUnicode_InternFromString')->();
}

sub unicode_internimmortal ($self) {
    return $self->ffi_sub('PyUnicode_InternImmortal')->();
}

sub unicode_interninplace ($self) {
    return $self->ffi_sub('PyUnicode_InternInPlace')->();
}

sub unicode_isidentifier ($self) {
    return $self->ffi_sub('PyUnicode_IsIdentifier')->();
}

sub unicode_join ($self) {
    return $self->ffi_sub('PyUnicode_Join')->();
}

sub unicode_partition ($self) {
    return $self->ffi_sub('PyUnicode_Partition')->();
}

sub unicode_rpartition ($self) {
    return $self->ffi_sub('PyUnicode_RPartition')->();
}

sub unicode_rsplit ($self) {
    return $self->ffi_sub('PyUnicode_RSplit')->();
}

sub unicode_readchar ($self) {
    return $self->ffi_sub('PyUnicode_ReadChar')->();
}

sub unicode_replace ($self) {
    return $self->ffi_sub('PyUnicode_Replace')->();
}

sub unicode_resize ($self) {
    return $self->ffi_sub('PyUnicode_Resize')->();
}

sub unicode_richcompare ($self) {
    return $self->ffi_sub('PyUnicode_RichCompare')->();
}

sub unicode_split ($self) {
    return $self->ffi_sub('PyUnicode_Split')->();
}

sub unicode_splitlines ($self) {
    return $self->ffi_sub('PyUnicode_Splitlines')->();
}

sub unicode_substring ($self) {
    return $self->ffi_sub('PyUnicode_Substring')->();
}

sub unicode_tailmatch ($self) {
    return $self->ffi_sub('PyUnicode_Tailmatch')->();
}

sub unicode_translate ($self) {
    return $self->ffi_sub('PyUnicode_Translate')->();
}

sub unicode_writechar ($self) {
    return $self->ffi_sub('PyUnicode_WriteChar')->();
}


no Python::FFI::Role;

1;
