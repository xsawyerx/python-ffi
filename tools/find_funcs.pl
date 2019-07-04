#!/usr/bin/perl
# This script parses all headers from the Python source code
# (cpython.git)
# 1. Clone the github repo
# 2. Adjust the unicodeobject.h to remove multi-line C comments
# Specifically:
#   * PyUnicode_DecodeUTF32
#   * PyUnicode_DecodeUTF32Stateful
#   * PyUnicode_DecodeUTF16
#   * PyUnicode_DecodeUTF16Stateful
#   * PyUnicode_Replace
# Their multiline /* */ comment confuse the parser
# Because the parser is pretty darn weak... :/
# 3. Run the script. It will create a python_functions.json
# 4. Run create_classes.pl

use strict;
use warnings;

use English '-no_match_vars';
use Path::Tiny qw< path >;
use JSON::MaybeXS qw< encode_json >;

my @lines = map $_->lines_utf8(),
            grep { $_ ne 'pyport.h' } path('.')->children(qr/\.h$/xms);

chomp @lines;

my @funcs;
my $cur_func;
my $keep_going;
foreach my $line (@lines) {
    $line =~ s{^\s*}{}xms;
    $line =~ s{\s*$}{}xms;
    $line =~ s{/\* .*? \*/}{}xmsg;

    if ($keep_going) {
        $cur_func .= $line;
        if ( $line !~ /;/xms ) {
            next;
        } else {
            $keep_going = 0;
            push @funcs, $cur_func;
            $cur_func = '';
            next;
        }
    } else {
        $line =~ /PyAPI_FUNC/xms
            or next;
    }

    if ( $line !~ /;/xms ) {
        $keep_going = 1;
        $cur_func .= $line;
        next;
    }

    ($cur_func) = $line;

    push @funcs, $cur_func;
    $cur_func = '';
}

## no critic qw(RegularExpressions::ProhibitComplexRegexes)
# const char *format, ...)Py_GCC_ATTRIBUTE((format(printf, 1, 2)));
my $FUNC_REGEX = qr{
    ^
    .*
    PyAPI_FUNC\( (?<return> [^)]+ ) \)
    \s*
    (?<func> [^(]+ )
    \(
        (?<args> .+? )      # Needed to handle nested parens
    \)
    (?:Py_GCC_ATTRIBUTE.*)? # A thing that could exist, but usually doesn't
}xms;

my %funcs;
foreach my $func_str (@funcs) {
    # Fool me once...
    $func_str =~ /Declares \s a \s public \s Python \s API \s function/xms
        and next;

    # Fool me twice...
    $func_str =~ /PyThread_start_new_thread/xms
        and next;

    if ( $func_str !~ $FUNC_REGEX ) {
        print STDERR "FAILED TO PARSE: |$func_str|\n";
        exit;
    }

    my ( $func, $args, $return ) = @LAST_PAREN_MATCH{ qw< func args return > };

    $func =~ /^_/xms
        and next;

    # Remove more C comments, clean up stuff
    $args =~ s{/\* .*? \*/}{}xmsg;
    my @args = map s{( ^\s* | \s*$ )}{}rxmsg, split /\s* , \s*/xms, $args;

    $funcs{$func} = {
        'args'   => \@args,
        'return' => $return,
    };
}

path('python_functions.json')->spew_utf8( encode_json \%funcs );
#::p $funcs{'PySys_start_new'};
::p %funcs;
# EXTRA:
# PyAPI_FUNC(unsigned long) PyThread_start_new_thread(void (*)(void *), void *);
