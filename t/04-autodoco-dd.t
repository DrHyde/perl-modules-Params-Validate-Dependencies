use strict;
use warnings;

use Data::Domain::Dependencies qw(:all);

use Test::More tests => 1;

my $domain = Dependencies(
  any_of(
    qw(alpha beta),
    all_of(qw(foo bar), none_of('barf')),
    one_of(qw(quux garbleflux))
  )
);

is(
  $domain->generate_documentation(),
  "any of ('alpha', 'beta', all of ('foo', 'bar' and none of ('barf')) or one of ('quux' or 'garbleflux'))",
  "Data::Domain::Dependencies doco also works"
);
