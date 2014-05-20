package Triangle;
use strict;
use warnings FATAL => 'all';
use v5.10;
use List::Util qw|sum|;
use List::MoreUtils qw|any all|;

sub kind { my (@sides) = @_;
    die 'TriangleError'  if !can_exist(@sides);
    return 'equilateral' if is_equilateral(@sides);
    return 'isosceles'   if is_isosceles(@sides);
    return 'scalene';
}

sub can_exist { my (@sides) = @_;
    return 0 if have_illegal_sides(@sides);
    return 0 if !obey_triangle_inequality(@sides);
    return 1;
}

sub have_illegal_sides { my (@sides) = @_;
    any { $_ <= 0 } @sides;
}

sub obey_triangle_inequality { my (@sides) = @_;
    return 0 if sum(@sides[0, 1]) <= $sides[2];
    return 0 if sum(@sides[1, 2]) <= $sides[0];
    return 0 if sum(@sides[2, 0]) <= $sides[1];
    return 1;
}

sub is_equilateral { my (@sides) = @_;
    all { $_ == $sides[0] } @sides;
}

sub is_isosceles { my (@sides) = @_;
    @sides = sort { $b <=> $a } @sides;
    $sides[0] == $sides[1];
}

1;
