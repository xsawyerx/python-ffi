#!/usr/bin/perl

use strict;
use warnings;
use Web::Query qw< wq >;
use Path::Tiny qw< path >;
use DDP;

my $main_path  = 'https://docs.python.org/3/c-api/';
my $main_url   = "${main_path}index.html";
my $cache_file = path('cache.html');
my $html_elem;

if ( ! $cache_file->exists ) {
    $html_elem = wq($main_url);
    $cache_file->spew_utf8( $html_elem->html );
} else {
    $html_elem = wq( $cache_file->slurp_utf8 );
}

my %urls;
$html_elem->find('a.reference')->each( sub {
    my ($url) = $_->attr('href') =~ m/^([^#]+)/xmsg;

    $url =~ /\.{2}/xms
        and next;

    $urls{$url} = 1;
});

foreach my $path ( sort keys %urls ) {
    my $full_path = "${main_path}$path";

    wq($full_path)->find('')
}
