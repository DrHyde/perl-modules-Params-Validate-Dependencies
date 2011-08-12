use strict;
use warnings;

use Params::Validate::Dependencies qw(:all);
use Params::Validate qw(:all);

use Test::More;

my %pv = (
  alpha => { type => SCALAR, optional => 1 },
  beta  => { type => SCALAR, optional => 1 },
  gamma => { type => SCALAR, optional => 1 },
  bar   => { type => SCALAR, optional => 1 },
  baz   => { type => SCALAR, optional => 1 },
);

my %pvd = ();
#   validate_dependencies(
#     any_of(
#       qw(alpha beta gamma),
#       all_of(qw(bar baz)),
#     )
#   );

ok(foo() eq 'woot', "no params, no dependencies");
dies_ok(sub { foo(alpha => []) }, "bad params, no dependencies");

sub dies_ok {
  my($sub, $text) = @_;

  eval { $sub->() };
  ok($@, $text);
}

sub foo {
  validate(@_, { %pv, %pvd });
  return 'woot';
}
