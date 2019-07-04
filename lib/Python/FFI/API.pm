package Python::FFI::API;

use Python::FFI::Role;

with qw<
    Python::FFI::API::Arena
    Python::FFI::API::Arg
    Python::FFI::API::AST
    Python::FFI::API::AsyncGen
    Python::FFI::API::Bool
    Python::FFI::API::ByteArray
    Python::FFI::API::Bytes
    Python::FFI::API::Callable
    Python::FFI::API::CallIter
    Python::FFI::API::Capsule
    Python::FFI::API::Cell
    Python::FFI::API::CFunction
    Python::FFI::API::ClassMethod
    Python::FFI::API::Codec
    Python::FFI::API::Code
    Python::FFI::API::Compile
    Python::FFI::API::Complex
    Python::FFI::API::Context
    Python::FFI::API::ContextVar
    Python::FFI::API::Coro
    Python::FFI::API::Descr
    Python::FFI::API::Dict
    Python::FFI::API::DictProxy
    Python::FFI::API::Err
    Python::FFI::API::Eval
    Python::FFI::API::ExceptionClass
    Python::FFI::API::Exception
    Python::FFI::API::File
    Python::FFI::API::Float
    Python::FFI::API::Frame
    Python::FFI::API::FrozenSet
    Python::FFI::API::Function
    Python::FFI::API::Future
    Python::FFI::API::GC
    Python::FFI::API::Gen
    Python::FFI::API::GILState
    Python::FFI::API::Hash
    Python::FFI::API::Import
    Python::FFI::API::Index
    Python::FFI::API::InstanceMethod
    Python::FFI::API::InterpreterState
    Python::FFI::API::Iter
    Python::FFI::API::List
    Python::FFI::API::Long
    Python::FFI::API::Mapping
    Python::FFI::API::Marshal
    Python::FFI::API::Member
    Python::FFI::API::MemoryView
    Python::FFI::API::Mem
    Python::FFI::API::Method
    Python::FFI::API::ModuleDef
    Python::FFI::API::Module
    Python::FFI::API::Node
    Python::FFI::API::Number
    Python::FFI::API::Object
    Python::FFI::API::ODict
    Python::FFI::API::OS
    Python::FFI::API::Parser
    Python::FFI::API::PickleBuffer
    Python::FFI::API::Run
    Python::FFI::API::SeqIter
    Python::FFI::API::Sequence
    Python::FFI::API::Set
    Python::FFI::API::Slice
    Python::FFI::API::State
    Python::FFI::API::StaticMethod
    Python::FFI::API::ST
    Python::FFI::API::StructSequence
    Python::FFI::API::Symtable
    Python::FFI::API::Sys
    Python::FFI::API::Thread
    Python::FFI::API::ThreadState
    Python::FFI::API::Token
    Python::FFI::API::TraceBack
    Python::FFI::API::TraceMalloc
    Python::FFI::API::Tuple
    Python::FFI::API::Type
    Python::FFI::API::UnicodeDecodeError
    Python::FFI::API::UnicodeEncodeError
    Python::FFI::API::Unicode
    Python::FFI::API::UnicodeTranslateError
    Python::FFI::API::Weakref
    Python::FFI::API::Wrapper
>;

sub ffi_subs_data {
    return +{
        'Py_AddPendingCall' => [ ['int (*func)(void *)']       => 'int' ],
        'Py_AtExit'         => [ ['void (*func)(void)']        => 'int' ],
        'Py_BuildValue'     => [ [ 'string', '...' ]           => 'opaque' ],
        'Py_CompileString'  => [ [ 'string', 'string', 'int' ] => 'opaque' ],
        'Py_CompileStringExFlags' => [
            [ 'string', 'string', 'int', 'PyCompilerFlags *', 'int' ] =>
            'opaque'
        ],
        'Py_CompileStringObject' => [
            [ 'string', 'opaque', 'int', 'PyCompilerFlags *', 'int' ] =>
            'opaque'
        ],
        'Py_DecRef'              => [ ['opaque']               => 'void' ],
        'Py_DecodeLocale'        => [ [ 'string', 'size_t *' ] => 'wchar_t *' ],
        'Py_EncodeLocale'        => [
            [ 'const wchar_t *', 'size_t *_pos' ] => 'char*'
        ],
        'Py_EndInterpreter'     => [ ['PyThreadState *'] => 'void' ],
        'Py_Finalize'           => [ []            => 'void' ],
        'Py_FinalizeEx'         => [ []            => 'int' ],
        'Py_GetBuildInfo'       => [ []            => 'string' ],
        'Py_GetCompiler'        => [ []            => 'string' ],
        'Py_GetCopyright'       => [ []            => 'string' ],
        'Py_GetExecPrefix'      => [ []            => 'wchar_t *' ],
        'Py_GetPath'            => [ []            => 'wchar_t *' ],
        'Py_GetPlatform'        => [ []            => 'string' ],
        'Py_GetPrefix'          => [ []            => 'wchar_t *' ],
        'Py_GetProgramFullPath' => [ []            => 'wchar_t *' ],
        'Py_GetProgramName'     => [ []            => 'wchar_t *' ],
        'Py_GetPythonHome'      => [ []            => 'wchar_t *' ],
        'Py_GetRecursionLimit'  => [ []            => 'int' ],
        'Py_GetVersion'         => [ []            => 'string' ],
        'Py_IncRef'             => [ ['opaque']          => 'void' ],
        'Py_Initialize'         => [ []            => 'void' ],
        'Py_InitializeEx'       => [ ['int']             => 'void' ],
        'Py_IsInitialized'      => [ []            => 'int' ],
        'Py_Main'               => [ [ 'int', 'wchar_t **' ] => 'int' ],
        'Py_MakePendingCalls'   => [ [] => 'int' ],
        'Py_NewInterpreter'     => [ []            => 'PyThreadState *' ],
        'Py_ReprEnter'          => [ ['opaque']          => 'int' ],
        'Py_ReprLeave'          => [ ['opaque']          => 'void' ],
        'Py_SetPath'            => [ ['const wchar_t *'] => 'void' ],
        'Py_SetProgramName'     => [ ['const wchar_t *'] => 'void' ],
        'Py_SetPythonHome'      => [ ['const wchar_t *'] => 'void' ],
        'Py_SetRecursionLimit'  => [ ['int'] => 'void' ],
        'Py_SymtableString' => [
            [ 'string', 'string', 'int' ] => 'struct symtable *',
        ],
        'Py_SymtableStringObject' => [
            [ 'string', 'opaque', 'int' ] => 'struct symtable *',
        ],
        'Py_VaBuildValue' => [ [ 'string', 'va_list' ] => 'opaque' ],
    };
}

no Moose::Role;

1;
