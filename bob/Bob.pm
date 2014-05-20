package Bob;
use strict;
use warnings FATAL => 'all';
use v5.12;

sub hey { my ($gibberish) = @_;
    state $replies = [
        \&yell,
        \&question,
        \&addressing_without_saying_anything,
        \&whatever,
    ];

    for my $reply (@$replies) {
        my @reply = $reply->($gibberish);
        return $reply[1] if $reply[0];
    }
}

sub question { my ($s) = @_;
    scalar $s =~ /\?$/, 'Sure.';
}

sub yell { my ($s) = @_;
    uc $s eq $s && scalar $s =~ /\p{Uppercase}/, 'Woah, chill out!'
}

sub addressing_without_saying_anything { my ($s) = @_;
    scalar $s =~ /^\s*$/, 'Fine. Be that way!';
}

sub whatever { 1, 'Whatever.' }

1;