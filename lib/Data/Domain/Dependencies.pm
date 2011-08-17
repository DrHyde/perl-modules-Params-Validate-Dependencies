package Data::Domain::Dependencies;

use strict;
use warnings;

use Params::Validate::Dependencies qw(:_of);

use base qw(Data::Domain);

use vars qw($VERSION @EXPORT @EXPORT_OK %EXPORT_TAGS);
$VERSION = '1.00';

@EXPORT = ();
@EXPORT_OK = (@{$Params::Validate::Dependencies::EXPORT_TAGS{_of}}, 'Dependencies');
%EXPORT_TAGS = (all => \@EXPORT_OK);

=head1 NAME

Data::Domain::Dependencies

=head1 DESCRIPTION

Provides functions and objects to let Data::Domain use the same
functions as Params::Validate.

=head1 SYNOPSIS

This creates a domain which, when passed a hashref, to inspect, will
check that it contains at least one of an 'alpha' or 'beta' key, or
both of 'foo' and 'bar'.

  use Data::Domain::Dependencies qw(:all);

  my $domain = Dependencies(
    any_of(
      qw(alpha beta),
      all_of(qw(foo bar))
    )
  );

  my $errors = $domain->inspect(\%somehash);

=head1 SUBROUTINES and EXPORTS

Nothing is exported by default, but you can export any of the *_of
functions of Params::Validate::Dependencies, and the 'Dependencies'
function.  They are all available under the 'all' tag.

=head2 Dependencies

This takes a code-ref argument.  That code-ref should take a hash-ref
as its argument and return true if the hash-ref passes validation,
false otherwise.

'Dependencies' will return an object wrapped around that code-ref
whoise 'inspect' method will, if the code-ref returns true, return
nothing, or if false, return an error.

=cut

sub Dependencies {
  my $sub = shift;
  __PACKAGE__->new($sub);
}

=head2 new

'Dependencies' above is really just a thin wrapper around this
constructor, which simply takes a code-ref argument.  You are
encouraged to not call this directly.

=cut

# yeah, blessing a code-ref.  Have at you, easy debugging!
sub new {
  my($class, $sub) = @_;
  die("$class constructor must be passed a code-ref\n")
    unless(ref($sub) =~ /CODE/i);
  bless $sub, $class;
}

# this is where the magic happens ...
sub _inspect {
  my $sub = shift;
  my $data = shift;
  return __PACKAGE__." can only inspect hashrefs\n"
    unless(ref($data) =~ /HASH/i);

  return $sub->($data) ? () : __PACKAGE__.": validation failed";
}

=head1 BUGS, LIMITATIONS, and FEEDBACK

I like to know who's using my code.  All comments, including constructive
criticism, are welcome.

Please report any bugs either by email or using L<http://rt.cpan.org/>
or at L<https://github.com/DrHyde/perl-modules-Params-Validate-Dependencies/issues>.

Bug reports should contain enough detail that I can replicate the
problem and write a test.  The best bug reports have those details
in the form of a .t file.  If you also include a patch I will love
you for ever.

=head1 SEE ALSO

L<Params::Validate::Dependencies>

L<Data::Domain>

=head1 SOURCE CODE REPOSITORY

L<git://github.com/DrHyde/perl-modules-Params-Validate-Dependencies.git>

L<https://github.com/DrHyde/perl-modules-Params-Validate-Dependencies/>

=head1 COPYRIGHT and LICENCE

Copyright 2011 David Cantrell E<lt>F<david@cantrell.org.uk>E<gt>

This software is free-as-in-speech software, and may be used, distributed, and modified under the terms of either the GNU General Public Licence version 2 or the Artistic Licence. It's up to you which one you use. The full text of the licences can be found in the files GPL2.txt and ARTISTIC.txt, respectively.

=head1 CONSPIRACY

This module is also free-as-in-mason.

=cut

1;
