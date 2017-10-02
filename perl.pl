#!/usr/bin/perl

use LWP::UserAgent;
use JSON;

my $base = "SGD";
my $symbols = "MYR";

my $ua = LWP::UserAgent->new;
my $url = "http://api.fixer.io/latest?symbols=" . $symbols . "&base=" . $base;

my $req = HTTP::Request->new( GET => $url );

my $resp = $ua->request( $req );
if ( $resp->is_success ) {
    $jsonresp = from_json( $resp->decoded_content );
    print $base . "1 = " . $symbols . $jsonresp->{"rates"}{"MYR"} . "\n";
}
