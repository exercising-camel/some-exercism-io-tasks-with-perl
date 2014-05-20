package ETL;
use strict;
use warnings FATAL => 'all';
use v5.10;

sub transform { my ($letters_for_score) = @_;
    my @letter_score_pairs;
    while (my ($score, $letters) = each %$letters_for_score) {
        push @letter_score_pairs, map { lc $_ => $score } @$letters;
    }
    +{ @letter_score_pairs };
}

1;