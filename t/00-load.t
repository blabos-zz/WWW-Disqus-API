#!perl -T

use Test::More tests => 1;

BEGIN {
    use_ok( 'WWW::Disqus::API' ) || print "Bail out!
";
}

diag( "Testing WWW::Disqus::API $WWW::Disqus::API::VERSION, Perl $], $^X" );
