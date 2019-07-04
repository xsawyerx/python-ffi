package Python::FFI::API::Thread;

use Python::FFI::Role;

around 'ffi_subs_data' => sub ($orig, $self, @args){
    return +{
        %{ $self->$orig(@args) },

        'PyThread_GetInfo' => [ [] => 'PyObject*' ],
        'PyThread_ReInitTLS' => [ [] => 'void' ],
        'PyThread_acquire_lock' => [ [ 'PyThread_type_lock', 'int' ] => 'int' ],
        'PyThread_acquire_lock_timed' => [ [ 'PyThread_type_lock', 'PY_TIMEOUT_T microseconds', 'int_flag' ] => 'PyLockStatus' ],
        'PyThread_allocate_lock' => [ [] => 'PyThread_type_lock' ],
        'PyThread_create_key' => [ [] => 'int' ],
        'PyThread_delete_key' => [ ['int'] => 'void' ],
        'PyThread_delete_key_value' => [ ['int'] => 'void' ],
        'PyThread_free_lock' => [ ['PyThread_type_lock'] => 'void' ],
        'PyThread_get_key_value' => [ ['int'] => 'void *' ],
        'PyThread_get_stacksize' => [ [] => 'size_t' ],
        'PyThread_get_thread_ident' => [ [] => 'unsigned long' ],
        'PyThread_get_thread_native_id' => [ [] => 'unsigned long' ],
        'PyThread_init_thread' => [ [] => 'void' ],
        'PyThread_release_lock' => [ ['PyThread_type_lock'] => 'void' ],
        'PyThread_set_key_value' => [ [ 'int', 'void *' ] => 'int' ],
        'PyThread_set_stacksize' => [ ['size_t'] => 'int' ],
        'PyThread_tss_alloc' => [ [] => 'Py_tss_t *' ],
        'PyThread_tss_create' => [ ['Py_tss_t *'] => 'int' ],
        'PyThread_tss_delete' => [ ['Py_tss_t *'] => 'void' ],
        'PyThread_tss_free' => [ ['Py_tss_t *'] => 'void' ],
        'PyThread_tss_get' => [ ['Py_tss_t *'] => 'void *' ],
        'PyThread_tss_is_created' => [ ['Py_tss_t *'] => 'int' ],
        'PyThread_tss_set' => [ [ 'Py_tss_t *', 'void *' ] => 'int' ],
    };
};

sub thread_getinfo ($self) {
    return $self->ffi_sub('PyThread_GetInfo')->();
}

sub thread_reinittls ($self) {
    return $self->ffi_sub('PyThread_ReInitTLS')->();
}

sub thread_acquire_lock ($self) {
    return $self->ffi_sub('PyThread_acquire_lock')->();
}

sub thread_acquire_lock_timed ($self) {
    return $self->ffi_sub('PyThread_acquire_lock_timed')->();
}

sub thread_allocate_lock ($self) {
    return $self->ffi_sub('PyThread_allocate_lock')->();
}

sub thread_create_key ($self) {
    return $self->ffi_sub('PyThread_create_key')->();
}

sub thread_delete_key ($self) {
    return $self->ffi_sub('PyThread_delete_key')->();
}

sub thread_delete_key_value ($self) {
    return $self->ffi_sub('PyThread_delete_key_value')->();
}

sub thread_free_lock ($self) {
    return $self->ffi_sub('PyThread_free_lock')->();
}

sub thread_get_key_value ($self) {
    return $self->ffi_sub('PyThread_get_key_value')->();
}

sub thread_get_stacksize ($self) {
    return $self->ffi_sub('PyThread_get_stacksize')->();
}

sub thread_get_thread_ident ($self) {
    return $self->ffi_sub('PyThread_get_thread_ident')->();
}

sub thread_get_thread_native_id ($self) {
    return $self->ffi_sub('PyThread_get_thread_native_id')->();
}

sub thread_init_thread ($self) {
    return $self->ffi_sub('PyThread_init_thread')->();
}

sub thread_release_lock ($self) {
    return $self->ffi_sub('PyThread_release_lock')->();
}

sub thread_set_key_value ($self) {
    return $self->ffi_sub('PyThread_set_key_value')->();
}

sub thread_set_stacksize ($self) {
    return $self->ffi_sub('PyThread_set_stacksize')->();
}

sub thread_tss_alloc ($self) {
    return $self->ffi_sub('PyThread_tss_alloc')->();
}

sub thread_tss_create ($self) {
    return $self->ffi_sub('PyThread_tss_create')->();
}

sub thread_tss_delete ($self) {
    return $self->ffi_sub('PyThread_tss_delete')->();
}

sub thread_tss_free ($self) {
    return $self->ffi_sub('PyThread_tss_free')->();
}

sub thread_tss_get ($self) {
    return $self->ffi_sub('PyThread_tss_get')->();
}

sub thread_tss_is_created ($self) {
    return $self->ffi_sub('PyThread_tss_is_created')->();
}

sub thread_tss_set ($self) {
    return $self->ffi_sub('PyThread_tss_set')->();
}


no Python::FFI::Role;

1;
