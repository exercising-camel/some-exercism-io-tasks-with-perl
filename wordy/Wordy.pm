package Wordy;
use strict;
use warnings FATAL => 'all';
use v5.10;

sub answer { my ($question) = @_;
    s/What is//,
    s/plus/+/g,
    s/minus/-/g,
    s/multiplied by/*/g,
    s|divided by|/|g,
    s/\?//,
    for $question;

    die 'ArgumentError' if $question =~ m{[^-+*/0-9 ]};

    eval $question;
}

1;