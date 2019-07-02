package Python::FFI;

use Moose;
use Time::HiRes qw< tv_interval gettimeofday >;
with qw<
    MooseX::Role::FFI

    Python::FFI::Run
>;

sub ffi_lib { 'python3.7m' }

sub ffi_subs_data {
    return +{
        'Py_AddPendingCall' => [ ['int (*func)(void *)'] => 'int' ],
        'Py_AtExit'         => [ ['void (*func)(void)']  => 'int' ],
        'Py_BuildValue' => [ [ 'string', '...' ] => 'opaque' ],
        'Py_CompileString' => [ [ 'string', 'string', 'int' ] => 'opaque' ],
        'Py_CompileStringExFlags' => [
            [ 'string', 'string', 'int', 'PyCompilerFlags *', 'int' ] =>
                'opaque'
        ],
        'Py_CompileStringObject' => [
            [ 'string', 'opaque', 'int', 'PyCompilerFlags *', 'int' ] =>
                'opaque'
        ],
        'Py_DecRef' => [ ['opaque'] => 'void' ],
        'Py_DecodeLocale' => [ [ 'string', 'size_t *' ] => 'wchar_t *' ],
        'Py_EncodeLocale' =>
            [ [ 'const wchar_t *', 'size_t *_pos' ] => 'char*' ],
        'Py_EndInterpreter'     => [ ['PyThreadState *'] => 'void' ],
        'Py_Finalize'           => [ ['void']            => 'void' ],
        'Py_FinalizeEx'         => [ ['void']            => 'int' ],
        'Py_GetBuildInfo'       => [ ['void']            => 'string' ],
        'Py_GetCompiler'        => [ ['void']            => 'string' ],
        'Py_GetCopyright'       => [ ['void']            => 'string' ],
        'Py_GetExecPrefix'      => [ ['void']            => 'wchar_t *' ],
        'Py_GetPath'            => [ ['void']            => 'wchar_t *' ],
        'Py_GetPlatform'        => [ ['void']            => 'string' ],
        'Py_GetPrefix'          => [ ['void']            => 'wchar_t *' ],
        'Py_GetProgramFullPath' => [ ['void']            => 'wchar_t *' ],
        'Py_GetProgramName'     => [ ['void']            => 'wchar_t *' ],
        'Py_GetPythonHome'      => [ ['void']            => 'wchar_t *' ],
        'Py_GetRecursionLimit'  => [ ['void']            => 'int' ],
        'Py_GetVersion'         => [ ['void']            => 'string' ],
        'Py_IncRef'             => [ ['opaque']          => 'void' ],
        'Py_Initialize'         => [ ['void']            => 'void' ],
        'Py_InitializeEx'       => [ ['int']             => 'void' ],
        'Py_IsInitialized'      => [ ['void']            => 'int' ],
        'Py_Main' => [ [ 'int', 'wchar_t **' ] => 'int' ],
        'Py_MakePendingCalls' => [ ['void'] => 'int' ],
        'Py_NewInterpreter' => [ ['void']            => 'PyThreadState *' ],
        'Py_ReprEnter'      => [ ['opaque']          => 'int' ],
        'Py_ReprLeave'      => [ ['opaque']          => 'void' ],
        'Py_SetPath'        => [ ['const wchar_t *'] => 'void' ],
        'Py_SetProgramName' => [ ['const wchar_t *'] => 'void' ],
        'Py_SetPythonHome'  => [ ['const wchar_t *'] => 'void' ],
        'Py_SetRecursionLimit' => [ ['int'] => 'void' ],
        'Py_SymtableString' =>
            [ [ 'string', 'string', 'int' ] => 'struct symtable *' ],
        'Py_SymtableStringObject' =>
            [ [ 'string', 'opaque', 'int' ] => 'struct symtable *' ],
        'Py_VaBuildValue' => [ [ 'string', 'va_list' ] => 'opaque' ],
    };
}

sub pyimport {
    my $self = shift;
    my $string = shift
        or die "import(string)\n";

    $self->ffi_sub('Py_Initialize')->();

    my $gModule = $self->ffi_sub('PyImport_ImportModule')->($string);

    if ( !$gModule) {
        $self->ffi_sub('PyErr_Print')->();
        die "Cannot load $string\n";
    }


    return 1;
}

sub BUILD {
    my $self = shift;
    $self->ffi_sub('Py_Initialize')->();
}

sub DESTROY {
    my $self = shift;
    $self->ffi_sub('Py_FinalizeEx')->();
}

1;

__END__

    pName = PyUnicode_DecodeFSDefault(argv[1]);
    /* Error checking of pName left out */

    pModule = PyImport_Import(pName);
    Py_DECREF(pName);

    if (pModule != NULL) {
        pFunc = PyObject_GetAttrString(pModule, argv[2]);
        /* pFunc is a new reference */

        if (pFunc && PyCallable_Check(pFunc)) {
            pArgs = PyTuple_New(argc - 3);
            for (i = 0; i < argc - 3; ++i) {
                pValue = PyLong_FromLong(atoi(argv[i + 3]));
                if (!pValue) {
                    Py_DECREF(pArgs);
                    Py_DECREF(pModule);
                    fprintf(stderr, "Cannot convert argument\n");
                    return 1;
                }
                /* pValue reference stolen here: */
                PyTuple_SetItem(pArgs, i, pValue);
            }
            pValue = PyObject_CallObject(pFunc, pArgs);
            Py_DECREF(pArgs);
            if (pValue != NULL) {
                printf("Result of call: %ld\n", PyLong_AsLong(pValue));
                Py_DECREF(pValue);
            }
            else {
                Py_DECREF(pFunc);
                Py_DECREF(pModule);
                PyErr_Print();
                fprintf(stderr,"Call failed\n");
                return 1;
            }
        }
        else {
            if (PyErr_Occurred())
                PyErr_Print();
            fprintf(stderr, "Cannot find function \"%s\"\n", argv[2]);
        }
        Py_XDECREF(pFunc);
        Py_DECREF(pModule);
    }
    else {
        PyErr_Print();
        fprintf(stderr, "Failed to load \"%s\"\n", argv[1]);
        return 1;
    }
    if (Py_FinalizeEx() < 0) {
        return 120;

