use inc::Module::Install;

name     'WWW-Disqus-API';
all_from 'lib/WWW/Disqus/API.pm';
author   q{Blabos de Blebe <blabos@cpan.org>};
license  'perl';

build_requires 'Test::More';

requires 'Try::Tiny';
requires 'LWP::UserAgent';

auto_install;

WriteAll;

