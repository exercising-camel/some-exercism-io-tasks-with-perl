package DNA;
use strict;
use warnings FATAL => 'all';
use v5.10;

sub to_rna { my ($dna_strand) = @_;
    $dna_strand =~ tr/GCTA/CGAU/;
    $dna_strand;
}

1;