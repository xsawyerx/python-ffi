#!/usr/bin/perl
# This script generates the .pm classes for everything.
# First, you need to have python_functions.json available
#   - If you do not have it, please run find_funcs.pl
# Secondly, you need to run it from tools/
# It will overwrite files, so be careful and use "git add -p"
# to commit
use strict;
use warnings;
use Path::Tiny qw< path >;
use Text::Template;
use JSON::MaybeXS qw< decode_json >;
use constant { 'SPACES' => 8 };

my $tmpl_string = << '_END_TEMPLATE';
package Python::FFI::{$namespace};

use Moose::Role;

around 'ffi_subs_data' => sub \{
    my $orig = shift;
    my $self = shift;

    return +\{
        %\{ $self->$orig(@_) \},
{$ffi_subs_data}
    \};
\};

{$func_subs}

no Moose::Role;

1;
_END_TEMPLATE

my $sub_tmpl_string = << '_END_SUB_TEMPLATE';
sub {$sub_name} \{
    my $self = shift;
    return $self->ffi_sub('{$ffi_sub}')->();
\}
_END_SUB_TEMPLATE

my $main_template = Text::Template->new(
    'TYPE'   => 'STRING',
    'SOURCE' => $tmpl_string,
);

my $sub_template = Text::Template->new(
    'TYPE'   => 'STRING',
    'SOURCE' => $sub_tmpl_string,
);

my $data = decode_json path('python_functions.json')->slurp_utf8;

my %classes;

foreach my $func ( sort keys %{$data} ) {
    my ( $return, $args ) = @{ $data->{$func} }{qw< return args >};

    if ( $func =~ /Py([^_]+)_.+/xms ) {
        my $class = $1;
        push @{ $classes{$class} }, [ $func, $return, $args ];
    } else {
        push @{ $classes{'FFI'} }, [ $func, $return, $args ];
    }
}

foreach my $class ( sort keys %classes ) {
    $class eq 'FFI'
        and next;

    my %subs;
    foreach my $func_spec ( @{ $classes{$class} } ) {
        my ( $name, $return, $args ) = @{$func_spec};
        convert_types( \$return );
        convert_types( \$_ ) for @{$args};
        my $args_list = join ', ', map "'$_'", @{$args};
        push @{ $subs{'ffi_decl'} },
            ' ' x SPACES() . qq!'$name' => [ [ $args_list ] => '$return' ],!;

        my $sub_name = lc $name =~ s{^ Py (.+) $}{$1}xmsgr;
        push @{ $subs{'sub_decl'} }, $sub_template->fill_in(
            'HASH' => {
                'sub_name' => $sub_name,
                'ffi_sub'  => $name,
            },
        );
    }


    my $vars = {
        'namespace'     => $class,
        'ffi_subs_data' => ( join "\n", @{ $subs{'ffi_decl'} } ),
        'func_subs'     => ( join "\n", @{ $subs{'sub_decl'} } ),
    };

    my $str = $main_template->fill_in(
        'HASH' => $vars,
    );

    path("../lib/Python/FFI/$class.pm")->spew_utf8($str);

    #last;
}

sub convert_types {
    my $ref = shift;

    ${$ref} =~ s{\*[a-z]+}{*}xmsg;
    ${$ref} =~ s{int \s [a-z]+}{int}xmsg;

    my %map = (
        'PyObject *'   => 'opaque',
        'const char *' => 'string',
    );

    $map{ ${$ref} }
        and ${$ref} = $map{ ${$ref} };
}
