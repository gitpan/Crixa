package Crixa::Message;
# ABSTRACT: A Crixa Message
$Crixa::Message::VERSION = '0.09';
use 5.10.0;
use Moose;
use namespace::autoclean;

has channel => (
    isa      => 'Crixa::Channel',
    is       => 'ro',
    required => 1,
);

has body => (
    is       => 'ro',
    isa      => 'Str',
    required => 1,
);

{
    my @properties = qw(
        content_type
        content_encoding
        correlation_id
        reply_to
        expiration
        message_id
        type
        user_id
        app_id
        priority
        delivery_mode
        timestamp
        headers
    );

    has _properties => (
        traits   => ['Hash'],
        is       => 'bare',
        isa      => 'HashRef',
        init_arg => 'props',
        required => 1,
        handles  => {
            map { ( $_ => [ 'get', $_ ], 'has_' . $_ => [ 'exists', $_ ], ) }
                @properties
        },
    );
}

has redelivered => (
    is       => 'ro',
    isa      => 'Bool',
    required => 1,
);

has routing_key => (
    is       => 'ro',
    isa      => 'Str',
    required => 1,
);

has exchange => (
    is       => 'ro',
    isa      => 'Str',
    required => 1,
);

has delivery_tag => (
    is       => 'ro',
    isa      => 'Str',
    required => 1,
);

has message_count => (
    is       => 'ro',
    isa      => 'Int',
    required => 1,
);

sub ack {
    my $self = shift;
    $self->channel->ack( $self->delivery_tag );
}

__PACKAGE__->meta->make_immutable;

1;

__END__

=pod

=head1 NAME

Crixa::Message - A Crixa Message

=head1 VERSION

version 0.09

=head1 DESCRIPTION

This class represents a single queue. With RabbitMQ, messages are published to
exchanges, which then routes the message to one or more queues. You then
consume those messages from the queue.

=head1 METHODS

This class provides the following methods:

=head2 $message->ack

This send an acknowledgement for the message on the channel that was used to
receive the message.

=head2 $message->body

This returns the message's body. If the message does not have any
content-encoding set _or_ the message contains an encoding with the string
"utf-8" (case insensitive), then the message is returned as character
data. Otherwise it is returned as binary data.

=head2 Property methods

There are a number of properties that can be associated with a message. This
class provides reader and predicate methods for all properties of the form C<<
$message->foo >> and C<< $message->has_foo >>. None of the properties are
required.

The properties supported are:

=over 4

=item * content_type

=item * content_encoding

=item * correlation_id

=item * reply_to

=item * expiration

=item * message_id

=item * type

=item * user_id

=item * app_id

=item * priority

=item * delivery_mode

=item * timestamp

=item * headers

=back

See the C<publish> method in the L<Crixa::Exchange> docs for more details.

=head2 $message->redelivered

A boolean indicating whether or not the message has already been delivered at
least once. RabbitMQ guarantees that each message will be delivered I<at least
once>, and it is not uncommon for a message to be redelivered before the first
consumer to receive it has had a chance to acknowledge it.

=head2 $message->message_count

The number of messages left in the queue at the time this message was
delivered.

=head2 $message->routing_key

The routing path on which the message was received.

=head2 $message->exchange

The exchange to which this message was published

=head2 $message->consumer_tag

The tag for the message's consumer.

=head2 Crixa::Message->new(...)

There is no reason to call this method directly. It will be called by a
L<Crixa::Queue> object to inflate messages into objects.

=head1 AUTHORS

=over 4

=item *

Chris Prather <chris@prather.org>

=item *

Dave Rolsky <autarch@urth.org>

=back

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2012 - 2014 by Chris Prather.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
