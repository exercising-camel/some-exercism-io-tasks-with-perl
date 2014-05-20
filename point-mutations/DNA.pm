package DNA;
use strict;
use warnings FATAL => 'all';
use v5.10;
use List::Util qw|min|;

sub _hamming_distance { my ($s1, $s2) = @_;
    my $min_length = min map { length } $s1, $s2;

    my $hamming_distance = 0;
    for my $i (0 .. $min_length - 1) {
        $hamming_distance++ if substr($s1, $i, 1) ne substr($s2, $i, 1);
    }

    $hamming_distance;
}

sub new { my ($class, $strand) = @_;
    bless { strand => $strand }, $class;
}
sub hamming_distance { my ($self, $other_strand) = @_;
    _hamming_distance($self->{'strand'}, $other_strand);
}

1;