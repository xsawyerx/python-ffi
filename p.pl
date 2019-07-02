use strict;
use warnings;
use lib 'lib';

use Python::FFI;

my $python = Python::FFI->new();

my $python_code = "from time import time,ctime\n"
                . "print('Today is', ctime(time()))\n";

$python->run_simplestring($python_code);
$python->import_importmodule('time');

