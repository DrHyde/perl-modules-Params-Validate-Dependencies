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

ok(foo() eq 'woot', "no params, no dependencies");
dies_ok(sub { foo(alpha => []) }, "bad params, no dependencies");
dies_ok(sub { validate_dependencies() }, 'code-ref', "validate_dependencies needs a param");
dies_ok(sub { validate_dependencies([]) }, 'code-ref', "validate_dependencies needs a code-ref");
{
  my $foo = sub {};
  is_deeply(
    [validate_dependencies($foo)],
    [_wfbiobowcv => { callbacks => { autogenerated => $foo } }],
    "validate_dependencies(sub{}) returns the right stuff"
  );
  is_deeply(
    [validate_dependencies('puppies', $foo)],
    [puppies => { callbacks => { autogenerated => $foo } }],
    "validate_dependencies('puppies', sub{}) returns the right stuff"
  );
}

my %pvd = validate_dependencies(
  any_of(
    all_of(qw(bar baz)),
    qw(alpha beta gamma),
  )
);
dies_ok(\&foo, 'any_of', "bad params, any_of fails");
dies_ok(sub { foo(bar => 1) }, 'all_of', "bad params, all_of fails");
dies_ok(sub { foo(bar => 1, baz => []) }, 'SCALAR', "bad params, any_of(all_of()) passes");
ok(foo(bar => 1, baz => 1), "good params, any_of(all_of()) matches");
ok(foo(alpha => 1, bar => 1), "any_of passes even if an all_of in it fails");

sub dies_ok {
  my($sub, $look_for, $text) = @_;
  ($look_for, $text) = ('^', $look_for) if(!defined($text));

  eval { $sub->() };
  ok($@ =~ /$look_for/, $text);
}

sub foo {
  validate(@_, { %pv, %pvd });
  return 'woot';
}
