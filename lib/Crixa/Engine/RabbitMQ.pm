package Crixa::Engine::RabbitMQ;
# ABSTRACT: For internal use only
$Crixa::Engine::RabbitMQ::VERSION = '0.06'; # TRIAL
use Moose;
use namespace::autoclean;

use Net::AMQP::RabbitMQ;

has _mq => ( is => 'ro', lazy => 1, builder => '_build__mq' );

sub _build__mq { Net::AMQP::RabbitMQ->new; }

sub _connect_mq {
    my ( $self, $config ) = @_;
    my %args;
    for (qw( user password port )) {
        $args{$_} = $config->$_ if defined $config->$_;
    }
    $self->_mq->connect( $config->host, \%args );
}

with qw(Crixa::Engine::API);    # at the end so we pick up _mq

1;

__END__

=pod

=head1 NAME

Crixa::Engine::RabbitMQ - For internal use only

=head1 VERSION

version 0.06

=head1 DESCRIPTION

This is a wholly internal Role for dealing with RabbitMQ. There are no public
facing parts here. This is not the code you're looking for. Move along now,
move along.

=head1 AUTHORS

=over 4

=item *

Chris Prather <chris@prather.org>

=item *

Dave Rolsky <autarch@urth.org>

=back

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2012 by Chris Prather.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
