package Accumulate;
use strict;
use warnings FATAL => 'all';
use v5.10;

sub accumulate { my ($coll, $f) = @_;
    my @res;
    push @res, $f->($_) for @$coll;
    \@res;
}

1;