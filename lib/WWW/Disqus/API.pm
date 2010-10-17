package WWW::Disqus::API;

use strict;
use warnings;

use Carp;
use LWP::UserAgent;
use JSON;


our $AUTOLOAD;


my %methods = (
    'get_user_name'                 =>'post',
    'get_forum_api_key'             =>'get',
    'get_forum_list'                =>'get',
    'get_forum_posts'               =>'get',
    'get_num_posts'                 =>'get',
    'get_categories_list'           =>'get',
    'get_thread_list'               =>'get',
    'get_updated_threads'           =>'get',
    'get_thread_posts'              =>'get',
    'thread_by_identifier'          =>'post',
    'get_thread_by_url'             =>'get',
    'update_thread'                 =>'post',
    'create_post'                   =>'post',
    'moderate_post'                 =>'post',
    'get_recent_forums_comments'    =>'get',
    'get_user_comments'             =>'get',
    'get_user_info'                 =>'get',
    'get_most_commented_threads'    =>'get',
    'get_threads_by_identifiers'    =>'get',
);

=head1 NAME

WWW::Disqus::API - The great new WWW::Disqus::API!

=head1 VERSION

Version 0.03

=cut

our $VERSION = 0.03;


=head1 SYNOPSIS

Quick summary of what the module does.

Perhaps a little code snippet.

    use WWW::Disqus::API;

    my $foo = WWW::Disqus::API->new();
    ...

=head1 EXPORT

A list of functions that can be exported.  You can delete this section
if you don't export anything, such as for a purely object-oriented module.

=head1 METHODS

=head2 new

=cut

sub new {
    my ( $class, $arg_ref ) = (@_);

    my $self = {
        'lwp'           => LWP::UserAgent->new,
        'disqus_root'   => 'http://disqus.com/api/',
        'api_version'   => '1.1',
        'user_api_key'  => $arg_ref->{'user_api_key'}
          || croak 'you must provide a User API key',
    };

    return bless $self, ref $class || $class;
}


sub AUTOLOAD {
    my ( $method, $self, %params ) = ( $AUTOLOAD, @_ );
    $method =~ s/.*:://;
    return if $method eq 'DESTROY';

    my $action = $methods{$method}
      or croak "Method '$method' not supported";

    my $url = $self->{'disqus_root'} . $method . '/';

    # append required info to %params
    @params{qw(user_api_key api_version)}
      = @$self{qw(user_api_key api_version)};

    my $res = $self->$action( $url, %params );

    return decode_json( $res->content );
}


sub get {
    my ( $self, $url, %params ) = @_;
    my $query_string = join '&', map { $_ . '=' . $params{$_} } keys %params;

    return $self->{'lwp'}->get( $url . '?' . $query_string );
}


sub post {
    my ( $self, $url, %params ) = @_;

    return $self->{'lwp'}->post( $url, \%params );
}


=head1 AUTHORS

Blabos de Blebe, C<< <blabos at cpan.org> >>
Breno G. de Oliveira C<< <garu at cpan.org> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-www-disqus-api at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=WWW-Disqus-API>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.




=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc WWW::Disqus::API


You can also look for information at:

=over 4

=item * RT: CPAN's request tracker

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=WWW-Disqus-API>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/WWW-Disqus-API>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/WWW-Disqus-API>

=item * Search CPAN

L<http://search.cpan.org/dist/WWW-Disqus-API/>

=back


=head1 ACKNOWLEDGEMENTS


=head1 LICENSE AND COPYRIGHT

Copyright 2010 Blabos de Blebe.

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See http://dev.perl.org/licenses/ for more information.


=cut

42; # End of WWW::Disqus::API
