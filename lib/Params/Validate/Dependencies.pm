package Params::Validate::Dependencies;

use strict;
use warnings;
no warnings 'redefine';

use vars qw($VERSION @EXPORT @EXPORT_OK %EXPORT_TAGS);

use Params::Validate qw(:all);
use Devel::Caller::IgnoreNamespaces;
Devel::Caller::IgnoreNamespaces::register(__PACKAGE__);

use base qw(Exporter); # re-export everything

$VERSION = '1.00';
@EXPORT = @Params::Validate::EXPORT;
@EXPORT_OK = @Params::Validate::EXPORT_OK;
%EXPORT_TAGS = %Params::Validate::EXPORT_TAGS;

_add_to_exports(qw(any_of all_of));

=head1 NAME

Params::Validate::Dependencies

=head1 DESCRIPTION

Embraces and extends Params::Validate to make it easy to validate
that you have been passed the correct combinations of parameters.

=head1 SYNOPSIS

FIXME

=head1 SUBROUTINES

You can use this module in B<exactly> the same way as you would use
Params::Validate.  It ships with all the tests from Params::Validate
version 1.00, and passes them all.  If you ever find anything which
behaves differently with this module than it does with Params::Validate
(other than the funky new stuff I added, obviously) then that is a bug
and you should report it.  You might also want to report it to the
maintainers of Params::Validate to help them improve their test coverage.

=head2 validate

This is extended blah blah FIXME

=cut

sub validate(\@$) {
  my $r = Params::Validate::validate(@{$_[0]}, $_[1]);
  return $r if(!$r);

  # FIXME now do our validation, altering $r if necessary
  return $r;
}

sub _add_to_exports {
  push @EXPORT, @_;
  push @EXPORT_OK, @_;
  push @{$EXPORT_TAGS{all}}, @_;
}

1;
