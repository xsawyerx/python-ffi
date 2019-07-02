#!/usr/bin/perl
use strict;
use warnings;
use Path::Tiny qw< path >;
use Text::Template;
use JSON::MaybeXS qw< decode_json >;

my $tmpl_string = << '_END_TEMPLATE';
package Python::FFI::{$namespace}

use Moose::Role;

around 'ffi_subs_data' => sub \{
    my $orig = shift;
    my $self = shift;

    return +\{
        %\{ $self->$orig(@_) \},
{$ffi_subs_data}
    \};
\};

no Moose::Role;

1;
_END_TEMPLATE

my $template = Text::Template->new(
    'TYPE'   => 'STRING',
    'SOURCE' => $tmpl_string,
);

my $data = decode_json path('python_functions.json')->slurp_utf8;

my %classes;
foreach my $func ( sort keys %{$data} ) {
    my ( $return, $args ) = @{ $data->{$func} }{qw< return args >};

    if ( $func =~ /Py([^_]+)_.+/xms ) {
        my $class = $1;
        push @{ $classes{"$class.pm"} }, [ $func, $return, $args ];
    } else {
        push @{ $classes{'FFI.pm'} }, [ $func, $return, $args ];
    }
}

foreach my $class ( sort keys %classes ) {
    $class eq 'FFI.pm'
        and next;

    my @subs;
    foreach my $func_spec ( @{ $classes{$class} } ) {
        my ( $name, $return, $args ) = @{$func_spec};
        convert_types(\$return);
        convert_types(\$_) for @{$args};
        push @subs, ' ' x 8 . qq!'$name' => [ [ @{[ join ', ', map "'$_'", @{$args} ]} ] => '$return' ],!;
    }


    my $vars = {
        'namespace'     => $class,
        'ffi_subs_data' => ( join "\n", @subs ),
    };

    my $str = $template->fill_in(
        'HASH' => $vars,
    );

    path("../FFI/$class")->spew_utf8($str);

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