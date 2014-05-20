package Prime;
use strict;
use warnings FATAL => 'all';
use v5.10;

# http://rosettacode.org/wiki/Prime_decomposition#Perl
sub factors { my ($number) = @_;
    my $divisor = 1;
    my @prime_factors;
    while ($number > 1) {
        $divisor++;
        $number /= $divisor, push @prime_factors, $divisor while $number % $divisor == 0;
    }
    \@prime_factors;
}

1;