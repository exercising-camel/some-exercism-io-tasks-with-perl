package Allergies;
use strict;
use warnings FATAL => 'all';
use v5.10;
use List::UtilsBy qw|zip_by|;
use List::MoreUtils qw|any|;

sub allergic_food_items_from_score { my ($score) = @_;
    return if $score <= 0;

    state $allergy_score_for = [
        zip_by { [@_]  }
        [qw|eggs peanuts shellfish strawberries tomatoes chocolate pollen cats|],
        [   1,   2,      4,        8,           16,      32,       64,    128]
    ];

    my @allergic_food_items;
    for my $allergy_score (@$allergy_score_for) {
        if ($score & $allergy_score->[1]) {
            push @allergic_food_items, $allergy_score->[0];
        }
    }

    @allergic_food_items;
}

sub _allergic_to { my ($allergy_score, $food_item) = @_;
    my @allergy_food_items = allergic_food_items_from_score($allergy_score);
    (any { $food_item eq $_ } @allergy_food_items) ? 'true' : 'false';
}


sub allergic_to { my ($self, $food_item) = @_;
    _allergic_to($self->{'allergy_score'}, $food_item);
}

sub list { my ($self) = @_;
    [ allergic_food_items_from_score($self->{'allergy_score'}) ];
}

sub new { my ($class, $allergy_score) = @_;
    bless { allergy_score => $allergy_score // 0 }, $class;
}


1;