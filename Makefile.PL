use ExtUtils::MakeMaker;
WriteMakefile(
  NAME         => 'Params::Validate::Dependencies',
    META_MERGE => {
        license => 'other',
        resources => {
            repository => 'https://github.com/DrHyde/perl-modules-Params-Validate-Dependencies',
            bugtracker => 'https://github.com/DrHyde/perl-modules-Params-Validate-Dependencies/issues',
        }
    },
  VERSION_FROM => 'lib/Params/Validate/Dependencies.pm',
  PREREQ_PM    => {
    'PadWalker'        => 1.96,
    'Scalar::Util'     => 1.25,
    'Params::Validate' => 1.07,
    'Data::Domain'     => 1.02,
  },
);
