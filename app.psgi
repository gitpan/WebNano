{
    package MyApp;
    use base 'WebNano';
}

{
    package MyApp::Controller;
    use base 'WebNano::Controller';
    
    sub index_action {
        my $self = shift;
        return 'This is my home';
    }
}

my $app = MyApp->new();
$app->psgi_callback;
 
