package WWW::Disqus::API;

use warnings;
use strict;

use Carp;
use LWP::UserAgent;
use JSON;

use Data::Dumper;

=head1 NAME

WWW::Disqus::API - The great new WWW::Disqus::API!

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';


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
    my $class   = shift;
    my $args    = shift;
    my $attr    = {
        'disqus_root'   => 'http://disqus.com/api/',
        'api_version'   => '1.1',
    };
    
    croak 'You must provide a User API key'
        unless defined $args->{'user_api_key'};
    
    $attr->{'user_api_key'} = $args->{'user_api_key'};
    
    $attr->{'lwp'} = LWP::UserAgent->new;
    
    return bless $attr, $class;
}


=head2 get_user_name

Validate API key and get username.

=cut

sub get_user_name {
    my $self = shift;
    
    my $res = $self->_call_method_via_post(_method_name());
    
    return _decode_response($res);  
}


=head2 get_forum_list

Get a list of websites that user owns or moderates.

=cut

sub get_forum_list {
    my $self = shift;
    
    my $res = $self->_call_method_via_get(_method_name());
    
    return _decode_response($res);
}


=head2 get_forum_api_key

Get a forum API key for a specific forum.

=cut

sub get_forum_api_key {
    my ($self, %params) = @_;
    
    my $res = $self->_call_method_via_get(_method_name(), %params);
    
    return _decode_response($res);
}


=head2 get_forum_posts

Get a list of comments on a website.

=cut

sub get_forum_posts {
    my ($self, %params) = @_;
    
    my $res = $self->_call_method_via_get(_method_name(), %params);
    
    return _decode_response($res);
}


=head2 get_thread_list

Get a list of threads on a website.

=cut

sub get_thread_list {
    my ($self, %params) = @_;
    
    my $res = $self->_call_method_via_get(_method_name(), %params);
    
    return _decode_response($res);
}


=head2 get_categories_list

Get a list of categories on a website.

=cut

sub get_categories_list {
    my ($self, %params) = @_;
    
    my $res = $self->_call_method_via_get(_method_name(), %params);
    
    return _decode_response($res);
}


=head2 get_num_posts

Count a number of comments in articles.

=cut

sub get_num_posts {
    my ($self, %params) = @_;
    
    my $res = $self->_call_method_via_get(_method_name(), %params);
    
    return _decode_response($res);
}


=head2 get_updated_threads

Get a list of threads with new comments.

=cut

sub get_updated_threads {
    my ($self, %params) = @_;
    
    my $res = $self->_call_method_via_get(_method_name(), %params);
    
    return _decode_response($res);
}


=head2 get_thread_posts

Get a list of comments in a thread.

=cut

sub get_thread_posts {
    my ($self, %params) = @_;
    
    my $res = $self->_call_method_via_get(_method_name(), %params);
    
    return _decode_response($res);
}


=head2 thread_by_identifier

Get or create thread by identifier.

=cut

sub thread_by_identifier {
    my ($self, %params) = @_;
    
    my $res = $self->_call_method_via_post(_method_name(), %params);
    
    return _decode_response($res);
}


=head2 get_thread_by_url

Get thread by URL.

=cut

sub get_thread_by_url {
    my ($self, %params) = @_;
    
    my $res = $self->_call_method_via_get(_method_name(), %params);
    
    print Dumper $res;
    
    return _decode_response($res);
}


=head2 update_thread

Update thread.

=cut

sub update_thread {
    my ($self, %params) = @_;
    
    my $res = $self->_call_method_via_post(_method_name(), %params);
    
    return _decode_response($res);
}


=head2 create_post

Create a new post (i.e. add a new comment).

=cut

sub create_post {
    my ($self, %params) = @_;
    
    my $res = $self->_call_method_via_post(_method_name(), %params);
    
    return _decode_response($res);
}


=head2 get_recent_forums_comments

Get recent comments from all forums associated with a partner account.
Not Tested. Required Partner API key not found.

=cut

sub get_recent_forums_comments {
    my ($self, %params) = @_;
    
    my $res = $self->_call_method_via_get(_method_name(), %params);
    
    print Dumper $res;
    
    return _decode_response($res);
}


=head2 get_user_comments

Get a list of user comments.
Not Tested. Required Partner API key not found.

=cut

sub get_user_comments {
    my ($self, %params) = @_;
    
    my $res = $self->_call_method_via_get(_method_name(), %params);
    
    print Dumper $res;
    
    return _decode_response($res);
}


=head2 get_user_info

Get basic information about a user.
Not Tested. Required Partner API key not found.

=cut

sub get_user_info {
    my ($self, %params) = @_;
    
    my $res = $self->_call_method_via_get(_method_name(), %params);
    
    print Dumper $res;
    
    return _decode_response($res);
}


=head2 get_most_commented_threads

Return threads that have received the most comments in the past N days.
Not Tested. Required Partner API key not found.

=cut

sub get_most_commented_threads {
    my ($self, %params) = @_;
    
    my $res = $self->_call_method_via_get(_method_name(), %params);
    
    print Dumper $res;
    
    return _decode_response($res);
}


=head2 get_threads_by_identifiers

Return threads by their identifiers.
Not Tested. Required Partner API key not found.

=cut

sub get_threads_by_identifiers {
    my ($self, %params) = @_;
    
    my $res = $self->_call_method_via_get(_method_name(), %params);
    
    print Dumper $res;
    
    return _decode_response($res);
}



=head2 _method_name

Returns the current method name.

=cut

sub _method_name {
    return (split "::", (caller(1))[3])[-1];
}


=head2 _call_method_via_get

Calls a API method using a GET request.

=cut

sub _call_method_via_get {
    my ($self, $method, %params) = @_;
    
    my $url = $self->{'disqus_root'} . $method . '/';
    
    $self->_append_required_info(\%params);
    
    return $self->{'lwp'}->get($url . '?' . _query_string(%params));
}


=head2 _call_method_via_post

Calls a API method using a POST request.

=cut

sub _call_method_via_post {
    
    my ($self, $method, %params) = @_;
    
    my $url = $self->{'disqus_root'} . $method . '/';
    
    $self->_append_required_info(\%params);
    
    return $self->{'lwp'}->post($url, \%params);
}

=head2 _decode_response

Decodes the JSON response, or throws an exception.

=cut

sub _decode_response {
    my $res = shift;
    
    my $json_str = $res->content;
    
    return decode_json($json_str);
}


=head2 _query_string

Returns a QUERY STRING from the supplied parameters.

=cut

sub _query_string {
    my %args = @_;
    
    return join '&', map {$_ . '=' . $args{$_}} keys %args;
}


=head2 _append_required_info

Appends information that is always required to parameter list.

=cut

sub _append_required_info {
    my ($self, $params) = @_;
    
    $params->{'user_api_key'} = $self->{'user_api_key'};
    $params->{'api_version'}  = $self->{'api_version'};
}


=head1 AUTHOR

Blabos de Blebe, C<< <blabos at cpan.org> >>

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

1; # End of WWW::Disqus::API
