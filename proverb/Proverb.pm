package Proverb;
use strict;
use warnings FATAL => 'all';
use v5.10;

sub proverb { my ($items, $qualifier) = @_;
    join '',
        (map { (for_want($items->[$_], $items->[$_ + 1]) ) } 0 .. @$items - 2),
        ( $qualifier ? all_for_nail($qualifier) : all_for($items->[0]) )
        ;
}

sub for_want { my ($word1, $word2) = @_;
    "For want of a $word1 the $word2 was lost.\n";
}

sub all_for { my ($word) = @_;
    "And all for the want of a $word.";
}

sub all_for_nail { my ($word) = @_;
    "And all for the want of a $word nail.";
}

1;