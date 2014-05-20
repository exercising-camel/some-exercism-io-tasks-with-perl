package Leap;
use strict;
use warnings FATAL => 'all';
use v5.10;

sub is_leap { my ($year) = @_;
    return 0 if $year % 4 != 0;
    return 0 if $year % 100 == 0 && $year % 400 != 0;
    return 1;
}

1;