package Crixa::Engine::API;
# ABSTRACT: Crixa::Engine::API
$Crixa::Engine::API::VERSION = '0.05';
use Moose::Role;
use namespace::autoclean;

requires qw(_mq _connect_mq);

1;
__END__

=head1 NAME Crixa::Engine::API

=head1 DESCRIPTION

=head1 VERSION

version 0.05

A Role used internally by Crixa. There are no user accessible parts here.
