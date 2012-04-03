package Pod::Weaver::Role::Finalizer;
{
  $Pod::Weaver::Role::Finalizer::VERSION = '3.101635';
}
use Moose::Role;
with 'Pod::Weaver::Role::Plugin';
# ABSTRACT: something that goes back and finishes up after main weaving is over


requires 'finalize_document';

no Moose::Role;
1;

__END__
=pod

=head1 NAME

Pod::Weaver::Role::Finalizer - something that goes back and finishes up after main weaving is over

=head1 VERSION

version 3.101635

=head1 IMPLEMENTING

The Finalizer role indicates that a plugin will be used to post-process the
output document hashref after section weaving is completed.  The plugin must
provide a C<finalize_document> method which will be called as follows:

  $finalizer_plugin->finalize_document($document, \%input);

=head1 AUTHOR

Ricardo SIGNES <rjbs@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2012 by Ricardo SIGNES.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut
