package Binary;
use strict;
use warnings FATAL => 'all';
use v5.10;

sub binary { my ($binary) = @_;
    return 0 if $binary !~ /^[10]+$/;
    my $decimal = 0;

    my $pow = -1;
    $binary = reverse $binary;
    for my $digit (split '', $binary) {
        $pow++;
        next if $digit eq '0';
        $decimal += 2 ** $pow;
    }

    $decimal;
}

sub to_decimal { my ($self, $binary) = @_;
    binary($self->{'binary'});
}

sub new { my ($class, $binary) = @_;
    bless { binary => $binary }, $class;
}

1;