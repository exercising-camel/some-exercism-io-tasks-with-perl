package Queens;
use strict;
use warnings FATAL => 'all';
use v5.10;

# for my $x (1 .. 8) {
#     for my $y (1 .. 8) {
#         print "$x,$y  ";
#     }
#     say '';
# }

# 1,1  1,2  1,3  1,4  1,5  1,6  1,7  1,8
# 2,1  2,2  2,3  2,4  2,5  2,6  2,7  2,8
# 3,1  3,2  3,3  3,4  3,5  3,6  3,7  3,8
# 4,1  4,2  4,3  4,4  4,5  4,6  4,7  4,8
# 5,1  5,2  5,3  5,4  5,5  5,6  5,7  5,8
# 6,1  6,2  6,3  6,4  6,5  6,6  6,7  6,8
# 7,1  7,2  7,3  7,4  7,5  7,6  7,7  7,8
# 8,1  8,2  8,3  8,4  8,5  8,6  8,7  8,8

sub _can_attack { my ($q1, $q2) = @_;
    return same_row(@_) || same_column(@_) || same_diagonal(@_);
}

sub same_row    { my ($q1, $q2) = @_; $q1->[0] == $q2->[0]; }
sub same_column { my ($q1, $q2) = @_; $q1->[1] == $q2->[1]; }
sub same_diagonal { my ($q1, $q2) = @_;
    abs($q1->[0] - $q2->[0]) == abs($q1->[1] - $q2->[1]);
}

sub new { my $class = shift;
    my %args = @_;
    my $q1 = $args{'white'} // [0, 3];
    my $q2 = $args{'black'} // [7, 3];

     # stuck?
    die 'ArgumentError' if $q1->[0] == $q2->[0] && $q1->[1] == $q2->[1];

    # outside of board?
    die 'ArgumentError' if 0 < grep { not 0 <= $_ && $_ <= 7 } @$q1, @$q2;

    bless { white => $q1, black => $q2 }, $class;
}
sub white { my ($self) = @_; $self->{'white'}; }
sub black { my ($self) = @_; $self->{'black'}; }
sub can_attack { my ($self) = @_; _can_attack($self->{'white'}, $self->{'black'}); }

sub to_string { my ($self) = @_;
    my $q1 = $self->{'white'};
    my $q2 = $self->{'black'};

    my @board;
    for my $x (0 .. 7) {
        my @row;
        for my $y (0 .. 7) {
            if ($x == $q1->[0] && $y == $q1->[1]) {
                push @row, 'W' ;
            } elsif ($x == $q2->[0] && $y == $q2->[1]) {
                push @row, 'B';
            } else {
                push @row, 'O';
            }
        }
        push @board, join ' ', @row;
    }

    join("\n", @board) . "\n";
}

1;