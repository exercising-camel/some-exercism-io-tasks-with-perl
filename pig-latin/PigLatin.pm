package PigLatin;
use strict;
use warnings FATAL => 'all';
use v5.10;
use List::Util qw|none|;

sub _translate { my ($word) = @_;
    state $exceptions = exceptions();
    return $exceptions->{$word} if exists $exceptions->{$word};

    my $vowels     = join '', @{ vowels() };
    my $consonants = join '', @{ consonants() };

    return "${word}ay" if $word =~ /^[$vowels]/;
    $word =~ s/([$consonants]+u?)([$vowels$consonants]+)/$2$1ay/;
    return $word;
}

sub exceptions {
    state $e = {
        'thrush' => 'ushthray',
        'run'    => 'unray',
        'yttria' => 'yttriaay',
        'xray'   => 'xrayay',
    };
}

sub alphabet   { state $a = ['a' .. 'z']; };
sub vowels     { state $v = [qw|a e i o u|]; };
sub consonants {
    state $c = [
        grep {
            my $alphabet_letter = $_;
            none {
                my $vowel = $_;
                $vowel eq $alphabet_letter;
            } @{ vowels() }
        } @{ alphabet() }
    ];
}

sub translate { my ($text) = @_;
    join ' ', map { _translate($_) } split ' ', $text;
}

1;