package Grains;
use strict;
use warnings FATAL => 'all';
use v5.10;
use List::Util qw|sum|;

{

use bigint;

sub square { my ($square_number) = @_;
    my $grains_for_square = 2 ** ($square_number - 1);
}

sub total { sum map { square($_) } 1 .. 64 };

}

1;