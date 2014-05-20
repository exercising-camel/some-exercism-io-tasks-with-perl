package Beer;
use strict;
use warnings FATAL => 'all';
use v5.10;

sub _verse { my ($bottles_count) = @_;
    return [
        "No more bottles of beer on the wall, no more bottles of beer.\n",
        "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
    ] if $bottles_count <= 0;

    return [
        "1 bottle of beer on the wall, 1 bottle of beer.\n",
        "Take it down and pass it around, no more bottles of beer on the wall.\n"
    ] if $bottles_count == 1;

    my $plural = $bottles_count == 2 ? '' : 's';
    return [
        "$bottles_count bottles of beer on the wall, $bottles_count bottles of beer.\n",
        "Take one down and pass it around, ${\ ($bottles_count - 1) } bottle$plural of beer on the wall.\n"
    ];
}

sub _sing { my (@verses_range) = @_;
    my @verses = map { _verse($_) } reverse ( ($verses_range[1] // 0) .. $verses_range[0]);
    [ map { (@$_, "\n") } @verses ];
}

sub verse { join '', @{ _verse(@_) }; }
sub sing  { join '', @{ _sing(@_) }; }

1;