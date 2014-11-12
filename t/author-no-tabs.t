
BEGIN {
  unless ($ENV{AUTHOR_TESTING}) {
    require Test::More;
    Test::More::plan(skip_all => 'these tests are for testing by the author');
  }
}

use strict;
use warnings;

# this test was generated with Dist::Zilla::Plugin::Test::NoTabs 0.09

use Test::More 0.88;
use Test::NoTabs;

my @files = (
    'lib/Crixa.pm',
    'lib/Crixa/Channel.pm',
    'lib/Crixa/Engine.pm',
    'lib/Crixa/Engine/API.pm',
    'lib/Crixa/Engine/RabbitMQ.pm',
    'lib/Crixa/Exchange.pm',
    'lib/Crixa/Message.pm',
    'lib/Crixa/Queue.pm',
    't/00-compile.t',
    't/00-report-prereqs.dd',
    't/00-report-prereqs.t',
    't/author-eol.t',
    't/author-no-tabs.t',
    't/author-pod-spell.t',
    't/channels.t',
    't/lib/Test/Crixa.pm',
    't/live/basic.t',
    't/mocked.t',
    't/release-cpan-changes.t',
    't/release-pod-coverage.t',
    't/release-pod-linkcheck.t',
    't/release-pod-no404s.t',
    't/release-pod-syntax.t',
    't/release-portability.t',
    't/release-synopsis.t'
);

notabs_ok($_) foreach @files;
done_testing;
