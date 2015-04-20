use 5.008005;
use ExtUtils::MakeMaker;
WriteMakefile(
    NAME           => 'Magic',
    VERSION_FROM   => 'lib/Magic.pm',
    PREREQ_PM      => { 'Test::More' => 0, 'Exporter' => '5.57' },
    ABSTRACT_FROM  => 'lib/Magic.pm',
    AUTHOR         => '',
    LIBS           => [''],
    DEFINE         => '',
    INC            => '-I.',
    OBJECT         => '$(O_FILES)',
);
