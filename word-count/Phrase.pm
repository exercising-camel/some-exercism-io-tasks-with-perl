package Phrase;
use strict;
use warnings FATAL => 'all';
use v5.10;

sub word_count { my ($str) = @_;
    $str = lc $str;
    $str = join '', $str =~ /[\w\s]/g;
    my %count_for_word;
    for my $word (split ' ', $str) {
        $count_for_word{$word}++;
    }
    \%count_for_word;
}

1;