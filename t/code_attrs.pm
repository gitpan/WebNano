use Test::More;
use Plack::Test;
use HTTP::Request::Common;
use lib 't/lib';
use MyApp;
use File::Copy;

copy('t/data/dvdzbr.db','t/tmp/dvdzbr.db') or die "Copy failed: $!";

test_psgi( 
    app => MyApp->get_handler, 
    client => sub {
        my $cb = shift;
        my $res = $cb->(GET "/ControllerWithCodeAttrs");
        like( $res->content, qr/This is the index of ControllerWithCodeAttrs/ );
        my $res = $cb->(GET "/ControllerWithCodeAttrs/some_action/1");
        like( $res->content, qr/some_action of ControllerWithCodeAttrs with param=1/ );
    } 
); 
done_testing();
