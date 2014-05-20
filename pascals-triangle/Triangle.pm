package Triangle;
use strict;
use warnings FATAL => 'all';
use v5.14;

#http://rosettacode.org/wiki/Pascal%27s_triangle#Perl

sub pascal_triangle { my ($n) = @_;
    return [1] if $n <= 1;

    my @pascal_triangle = ([1]);
    my @last = (1);
    for my $row (1 .. $n - 1) {
        my @this = map { $last[$_] + $last[$_ + 1] } 0 .. $row - 2;
        @last = (1, @this, 1);
        push @pascal_triangle, [ @last ];
    }

    @pascal_triangle;
}

sub triangle { my ($n) = @_;
    [ map { join ' ', @$_ } pascal_triangle($n + 1) ];
}

sub row { my ($n) = @_;
    join ' ', @{ ( pascal_triangle($n + 1) )[$n] };
}

sub is_triangle { my ($maybe_triangle) = @_;
    my @triangle = pascal_triangle(0+@$maybe_triangle);

    for my $i (0 .. $#triangle) {
        return 'false' if join(' ', @{ $triangle[$i] }) ne $maybe_triangle->[$i];
    }
    return 'true';
}

1;