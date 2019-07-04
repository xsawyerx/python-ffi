use strict;
use warnings;
use lib 'lib';

use Python::FFI::Simple;

my $python = Python::FFI::Simple->new();

my $python_code = "from time import time,ctime\n"
                . "print('Today is', ctime(time()))\n";

$python->run_simplestring($python_code);
#$python->import_importmodule('time');

