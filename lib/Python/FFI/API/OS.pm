package Python::FFI::API::OS;

use Python::FFI::Role;

around 'ffi_subs_data' => sub ($orig, $self, @args){
    return +{
        %{ $self->$orig(@args) },

        'PyOS_AfterFork' => [ [ 'void' ] => 'void' ],
        'PyOS_AfterFork_Child' => [ [ 'void' ] => 'void' ],
        'PyOS_AfterFork_Parent' => [ [ 'void' ] => 'void' ],
        'PyOS_BeforeFork' => [ [ 'void' ] => 'void' ],
        'PyOS_CheckStack' => [ [ 'void' ] => 'int' ],
        'PyOS_FSPath' => [ [ 'opaque' ] => 'opaque' ],
        'PyOS_InitInterrupts' => [ [ 'void' ] => 'void' ],
        'PyOS_InterruptOccurred' => [ [ 'void' ] => 'int' ],
        'PyOS_Readline' => [ [ 'FILE *', 'FILE *', 'string' ] => 'char *' ],
        'PyOS_double_to_string' => [ [ 'double val', 'char format_code', 'int', 'int', 'int *' ] => 'char *' ],
        'PyOS_getsig' => [ [ 'int' ] => 'PyOS_sighandler_t' ],
        'PyOS_mystricmp' => [ [ 'string', 'string' ] => 'int' ],
        'PyOS_mystrnicmp' => [ [ 'string', 'string', 'Py_ssize_t' ] => 'int' ],
        'PyOS_setsig' => [ [ 'int', 'PyOS_sighandler_t' ] => 'PyOS_sighandler_t' ],
        'PyOS_snprintf' => [ [ 'char *', 'size_t size', 'const char  *', '...' ] => 'int' ],
        'PyOS_string_to_double' => [ [ 'string', 'char **', 'PyObject *_exception' ] => 'double' ],
        'PyOS_strtol' => [ [ 'string', 'char **', 'int' ] => 'long' ],
        'PyOS_strtoul' => [ [ 'string', 'char **', 'int' ] => 'unsigned long' ],
        'PyOS_vsnprintf' => [ [ 'char *', 'size_t size', 'const char  *', 'va_list va' ] => 'int' ],
    };
};

sub os_afterfork ($self) {
    return $self->ffi_sub('PyOS_AfterFork')->();
}

sub os_afterfork_child ($self) {
    return $self->ffi_sub('PyOS_AfterFork_Child')->();
}

sub os_afterfork_parent ($self) {
    return $self->ffi_sub('PyOS_AfterFork_Parent')->();
}

sub os_beforefork ($self) {
    return $self->ffi_sub('PyOS_BeforeFork')->();
}

sub os_checkstack ($self) {
    return $self->ffi_sub('PyOS_CheckStack')->();
}

sub os_fspath ($self) {
    return $self->ffi_sub('PyOS_FSPath')->();
}

sub os_initinterrupts ($self) {
    return $self->ffi_sub('PyOS_InitInterrupts')->();
}

sub os_interruptoccurred ($self) {
    return $self->ffi_sub('PyOS_InterruptOccurred')->();
}

sub os_readline ($self) {
    return $self->ffi_sub('PyOS_Readline')->();
}

sub os_double_to_string ($self) {
    return $self->ffi_sub('PyOS_double_to_string')->();
}

sub os_getsig ($self) {
    return $self->ffi_sub('PyOS_getsig')->();
}

sub os_mystricmp ($self) {
    return $self->ffi_sub('PyOS_mystricmp')->();
}

sub os_mystrnicmp ($self) {
    return $self->ffi_sub('PyOS_mystrnicmp')->();
}

sub os_setsig ($self) {
    return $self->ffi_sub('PyOS_setsig')->();
}

sub os_snprintf ($self) {
    return $self->ffi_sub('PyOS_snprintf')->();
}

sub os_string_to_double ($self) {
    return $self->ffi_sub('PyOS_string_to_double')->();
}

sub os_strtol ($self) {
    return $self->ffi_sub('PyOS_strtol')->();
}

sub os_strtoul ($self) {
    return $self->ffi_sub('PyOS_strtoul')->();
}

sub os_vsnprintf ($self) {
    return $self->ffi_sub('PyOS_vsnprintf')->();
}


no Python::FFI::Role;

1;
