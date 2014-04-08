package Crixa::Engine;
# ABSTRACT: Crixa::Engine
$Crixa::Engine::VERSION = '0.05';
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

=head1 NAME Crixa::Engine

=head1 DESCRIPTION

=head1 VERSION

version 0.05

This is used internally by Crixa. There are no user accessible parts here.
