package Anagram;
use strict;
use warnings FATAL => 'all';
use v5.16;

sub is_anagram { my ($word, $anagram) = @_;
    return 0 if $word eq $anagram;
    (join '', sort split '', fc $word)[0] eq join '', sort split '', fc $anagram;
}

sub match { my ($word, @maybe_anagrams) = @_;
    [ grep { is_anagram($word, $_) } @maybe_anagrams ];
}

1;