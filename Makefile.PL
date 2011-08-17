use ExtUtils::MakeMaker;
WriteMakefile(
  NAME         => 'Params::Validate::Dependencies',
  VERSION_FROM => 'lib/Params/Validate/Dependencies.pm',
  PREREQ_PM    => {
    'Params::Validate' => 1.00,
    'Data::Domain'     => 0.14,
  },
);
