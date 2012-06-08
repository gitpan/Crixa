package Crixa::Engine::API;
{
  $Crixa::Engine::API::VERSION = '0.04';
}
use Moose::Role;
use namespace::autoclean;

requires qw(_mq _connect_mq);

1;
__END__