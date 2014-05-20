package Raindrops;
use strict;
use warnings FATAL => 'all';
use v5.10;
use List::MoreUtils qw|uniq|;

sub convert { my ($number) = @_;
    state $raindrop_speak_table = {
        3 => 'Pling',
        5 => 'Plang',
        7 => 'Plong',
    };

    my @factors = prime_factors($number);
    my $raindrop_speak = join '', map { $raindrop_speak_table->{$_} // '' } uniq @factors;
    $raindrop_speak ||= $number;

    $raindrop_speak;
}

# http://rosettacode.org/wiki/Prime_decomposition#Perl
sub prime_factors { my ($number) = @_;
    my $divisor = 1;
    my @prime_factors;
    while ($number > 1) {
        $divisor++;
        $number /= $divisor, push @prime_factors, $divisor while $number % $divisor == 0;
    }
    @prime_factors;
}

1;