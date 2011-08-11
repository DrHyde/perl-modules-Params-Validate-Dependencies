package Params::Validate::Dependencies;

use strict;
use warnings;

use vars qw($VERSION @EXPORT @EXPORT_OK %EXPORT_TAGS);

use Params::Validate qw(:all);

use base qw(Exporter); # re-export everything

$VERSION = '1.00';
@EXPORT = @Params::Validate::EXPORT;
@EXPORT_OK = @Params::Validate::EXPORT_OK;
%EXPORT_TAGS = %Params::Validate::EXPORT_TAGS;

_add_to_exports(qw(any_of all_of));

sub _add_to_exports {
  push @EXPORT, @_;
  push @EXPORT_OK, @_;
  push @{$EXPORT_TAGS{all}}, @_;
}
