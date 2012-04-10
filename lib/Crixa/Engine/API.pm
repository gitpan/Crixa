package Crixa::Engine::API;
{
  $Crixa::Engine::API::VERSION = '0.03';
}
use Moose::Role;
use namespace::autoclean;

requires qw(_mq _connect_mq);

1;
__END__