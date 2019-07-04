package Python::FFI::API::Eval;

use Python::FFI::Role;

around 'ffi_subs_data' => sub ($orig, $self, @args){
    return +{
        %{ $self->$orig(@args) },

        'PyEval_AcquireLock' => [ [] => 'void' ],
        'PyEval_AcquireThread' => [ ['PyThreadState *'] => 'void' ],
        'PyEval_CallFunction' => [ [ 'opaque', 'string', '...' ] => 'opaque' ],
        'PyEval_CallMethod' => [ [ 'opaque', 'string', 'string', '...' ] => 'opaque' ],
        'PyEval_CallObjectWithKeywords' => [ [ 'opaque', 'opaque', 'opaque' ] => 'opaque' ],
        'PyEval_EvalCode' => [ [ 'opaque', 'opaque', 'opaque' ] => 'opaque' ],
        'PyEval_EvalCodeEx' => [ [ 'opaque', 'opaque', 'opaque', 'PyObject * *', 'int', 'PyObject * *', 'int', 'PyObject * *', 'int', 'opaque', 'opaque' ] => 'opaque' ],
        'PyEval_EvalFrame' => [ ['struct _frame *'] => 'opaque' ],
        'PyEval_EvalFrameEx' => [ [ 'struct _frame *', 'int' ] => 'opaque' ],
        'PyEval_GetBuiltins' => [ [] => 'opaque' ],
        'PyEval_GetFrame' => [ [] => 'struct _frame *' ],
        'PyEval_GetFuncDesc' => [ ['opaque'] => 'string' ],
        'PyEval_GetFuncName' => [ ['opaque'] => 'string' ],
        'PyEval_GetGlobals' => [ [] => 'opaque' ],
        'PyEval_GetLocals' => [ [] => 'opaque' ],
        'PyEval_InitThreads' => [ [] => 'void' ],
        'PyEval_MergeCompilerFlags' => [ ['PyCompilerFlags *'] => 'int' ],
        'PyEval_ReleaseLock' => [ [] => 'void' ],
        'PyEval_ReleaseThread' => [ ['PyThreadState *'] => 'void' ],
        'PyEval_RestoreThread' => [ ['PyThreadState *'] => 'void' ],
        'PyEval_SaveThread' => [ [] => 'PyThreadState *' ],
        'PyEval_SetProfile' => [ [ 'Py_tracefunc', 'opaque' ] => 'void' ],
        'PyEval_SetTrace' => [ [ 'Py_tracefunc', 'opaque' ] => 'void' ],
        'PyEval_ThreadsInitialized' => [ [] => 'int' ],
    };
};

sub eval_acquirelock ($self) {
    return $self->ffi_sub('PyEval_AcquireLock')->();
}

sub eval_acquirethread ($self) {
    return $self->ffi_sub('PyEval_AcquireThread')->();
}

sub eval_callfunction ($self) {
    return $self->ffi_sub('PyEval_CallFunction')->();
}

sub eval_callmethod ($self) {
    return $self->ffi_sub('PyEval_CallMethod')->();
}

sub eval_callobjectwithkeywords ($self) {
    return $self->ffi_sub('PyEval_CallObjectWithKeywords')->();
}

sub eval_evalcode ($self) {
    return $self->ffi_sub('PyEval_EvalCode')->();
}

sub eval_evalcodeex ($self) {
    return $self->ffi_sub('PyEval_EvalCodeEx')->();
}

sub eval_evalframe ($self) {
    return $self->ffi_sub('PyEval_EvalFrame')->();
}

sub eval_evalframeex ($self) {
    return $self->ffi_sub('PyEval_EvalFrameEx')->();
}

sub eval_getbuiltins ($self) {
    return $self->ffi_sub('PyEval_GetBuiltins')->();
}

sub eval_getframe ($self) {
    return $self->ffi_sub('PyEval_GetFrame')->();
}

sub eval_getfuncdesc ($self) {
    return $self->ffi_sub('PyEval_GetFuncDesc')->();
}

sub eval_getfuncname ($self) {
    return $self->ffi_sub('PyEval_GetFuncName')->();
}

sub eval_getglobals ($self) {
    return $self->ffi_sub('PyEval_GetGlobals')->();
}

sub eval_getlocals ($self) {
    return $self->ffi_sub('PyEval_GetLocals')->();
}

sub eval_initthreads ($self) {
    return $self->ffi_sub('PyEval_InitThreads')->();
}

sub eval_mergecompilerflags ($self) {
    return $self->ffi_sub('PyEval_MergeCompilerFlags')->();
}

sub eval_releaselock ($self) {
    return $self->ffi_sub('PyEval_ReleaseLock')->();
}

sub eval_releasethread ($self) {
    return $self->ffi_sub('PyEval_ReleaseThread')->();
}

sub eval_restorethread ($self) {
    return $self->ffi_sub('PyEval_RestoreThread')->();
}

sub eval_savethread ($self) {
    return $self->ffi_sub('PyEval_SaveThread')->();
}

sub eval_setprofile ($self) {
    return $self->ffi_sub('PyEval_SetProfile')->();
}

sub eval_settrace ($self) {
    return $self->ffi_sub('PyEval_SetTrace')->();
}

sub eval_threadsinitialized ($self) {
    return $self->ffi_sub('PyEval_ThreadsInitialized')->();
}


no Python::FFI::Role;

1;
