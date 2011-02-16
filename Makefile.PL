use inc::Module::Install;
name 'Term-ANSIColor-Relax';
all_from 'lib/Term/ANSIColor/Relax.pm';

requires 'autobox';

tests 't/*.t';
author_tests 'xt';

test_requires 'Test::More';
auto_set_repository;
auto_include;
WriteAll;
