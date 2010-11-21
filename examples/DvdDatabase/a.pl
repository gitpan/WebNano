use warnings;
use strict;
use 5.12.0;

use DvdDatabase;


my $app = DvdDatabase->new();
my $user = $app->schema->resultset( 'User' )->search( { username => 'zby', } )->first;
$user->password('aaa');
$user->update;
say $user->check_password('aaa');
say $user->check_password('');




