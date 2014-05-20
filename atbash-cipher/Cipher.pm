package Cipher;
use strict;
use warnings FATAL => 'all';
use v5.16;
use List::Util qw|max|;

sub alphabet { state $alphabet = join '', 'a' .. 'z'; }
sub reverse_alphabet { state $reverse_alphabet = join '', reverse 'a' .. 'z'; }

sub cipher { my ($str, $alphabet, $reverse_alphabet) = @_;
    my $split_into_5_letter_words = 5 < max map { length } split ' ', $str;

    $str = lc $str;
    $str =~ s/\s+//g;
    $str = join '', $str =~ /(\w+)/g;

    if ($split_into_5_letter_words) {
        $str = reverse $str;
        $str = split_str_every_nth_character_with($str, 5, ' ');
        $str = reverse $str;
    }

    eval "\$str =~ tr/$alphabet/$reverse_alphabet/, 1" || die $@;

    $str;
}

sub split_str_every_nth_character_with { my ($str, $n, $separator) = @_;
    $n         //= 3;
    $separator //= ' ';
    1 while $str =~ s/^(\w+)(\w{$n})/$1$separator$2/;
    $str;
}

sub encode { my ($str) = @_;
    cipher($str, alphabet(), reverse_alphabet());
}
sub decode { my ($str) = @_;
    cipher($str, reverse_alphabet(), alphabet());
}

1;