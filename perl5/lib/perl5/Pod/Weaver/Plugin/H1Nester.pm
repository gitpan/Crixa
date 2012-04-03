package Pod::Weaver::Plugin::H1Nester;
{
  $Pod::Weaver::Plugin::H1Nester::VERSION = '3.101635';
}
use Moose;
with 'Pod::Weaver::Role::Transformer';
# ABSTRACT: structure the input pod document into head1-grouped sections

use namespace::autoclean;
use Moose::Autobox;

use Pod::Elemental::Selectors -all;
use Pod::Elemental::Transformer::Nester;


sub transform_document {
  my ($self, $document) = @_;

  my $nester = Pod::Elemental::Transformer::Nester->new({
    top_selector => s_command([ qw(head1) ]),
    content_selectors => [
      s_flat,
      s_command( [ qw(head2 head3 head4 over item back) ]),
    ],
  });

  $nester->transform_node($document);

  return;
}

no Moose;
1;

__END__
=pod

=head1 NAME

Pod::Weaver::Plugin::H1Nester - structure the input pod document into head1-grouped sections

=head1 VERSION

version 3.101635

=head1 OVERVIEW

This plugin is very, very simple:  it uses the
L<Pod::Elemental::Transformer::Nester> to restructure the document under its
C<=head1> elements.

=head1 AUTHOR

Ricardo SIGNES <rjbs@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2012 by Ricardo SIGNES.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
