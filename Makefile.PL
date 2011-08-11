use ExtUtils::MakeMaker;
WriteMakefile(
  NAME         => 'Number::Phone',
  VERSION_FROM => 'lib/Number/Phone.pm',
  PREREQ_PM    => {
    'Params::Validate' => 1.00,
  }
);
