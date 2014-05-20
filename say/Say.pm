package Say;
use strict;
use warnings FATAL => 'all';
use v5.10;
use Lingua::EN::Numbers qw|num2en|;

sub _in_english { my ($number) = @_;
    num2en($number);
}

sub new { my ($class, $number) = @_;
    die 'ArgumentError' if not 0 <= $number && $number <= 999_999_999_999;
    bless { number => $number }, $class;
}
sub in_english { my ($self) = @_;
    my $english = _in_english($self->{'number'});
    s/ and / /g, s/,//g for $english;
    $english;
}

1;