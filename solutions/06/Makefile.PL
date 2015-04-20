use 5.008005;
use ExtUtils::MakeMaker;
WriteMakefile(
    NAME           => 'sum',
    VERSION_FROM   => 'lib/sum.pm',
    PREREQ_PM      => { 'Test::More' => 0, 'Exporter' => '5.57' },
    ABSTRACT_FROM  => 'lib/sum.pm',
    AUTHOR         => 'You',
    LIBS           => [''],         # e.g., '-lm'
    DEFINE         => '',           # e.g., '-DHAVE_SOMETHING'
    INC            => '-I.',        # e.g., '-I. -I/usr/include/other'
    OBJECT         => '$(O_FILES)', # link all the C files too
    OPTIMIZE       => '-g',
);

