use ExtUtils::MakeMaker;
WriteMakefile(
  NAME         => 'Params::Validate::Dependencies',
  VERSION_FROM => 'lib/Params/Validate/Dependencies.pm',
  PREREQ_PM    => {
    'PadWalker'        => 1.9,
    'Scalar::Util'     => 0,
    'Params::Validate' => 0.91,
    'Data::Domain'     => 0.13,
  },
);
