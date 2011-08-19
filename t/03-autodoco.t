use strict;
use warnings;

use Params::Validate::Dependencies qw(:all);

use Test::More tests => 94;

sub doc { Params::Validate::Dependencies::document(@_) }

is(
  doc(any_of('alpha', 'beta', 'gamma')),
  "any of ('alpha', 'beta', or 'gamma')",
  "any_of with no code-refs"
);
is(
  doc(all_of('alpha', 'beta', 'gamma')),
  "all of ('alpha', 'beta', and 'gamma')",
  "all_of with no code-refs"
);
is(
  doc(one_of('alpha', 'beta', 'gamma')),
  "one of ('alpha', 'beta', or 'gamma')",
  "one_of with no code-refs"
);
is(
  doc(none_of('alpha', 'beta', 'gamma')),
  "none of ('alpha', 'beta', or 'gamma')",
  "none_of with no code-refs"
);

is(
  doc(none_of('alpha')),
  "none of ('alpha')",
  "only a single element"
);
