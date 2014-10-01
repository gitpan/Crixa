package Crixa::Engine;
# ABSTRACT: For internal use only
$Crixa::Engine::VERSION = '0.06'; # TRIAL
use Moose::Role;
use namespace::autoclean;

use Crixa::Engine::RabbitMQ;

has engine => (
    does    => 'Crixa::Engine::API',
    is      => 'ro',
    handles => 'Crixa::Engine::API',
    lazy    => 1,
    builder => '_build_engine',
);

sub _build_engine { Crixa::Engine::RabbitMQ->new() }

1;

__END__

=pod

=head1 NAME

Crixa::Engine - For internal use only

=head1 VERSION

version 0.06

=head1 DESCRIPTION

This is used internally by Crixa. There are no user accessible parts here.

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
