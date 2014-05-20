package Phone;
use strict;
use warnings FATAL => 'all';
use v5.10;

sub _number { my ($number) = @_;
    _maybe_drop_prefix_or_nullify(_clean_number($number));
}

sub _clean_number { my ($number) = @_;
    my @digits = $number =~ /([0-9]+)/g;
    join '', @digits;
}

sub _maybe_drop_prefix_or_nullify { my ($number) = @_;
    my $number_len = length $number;
    return $number if $number_len == 10;
    return $1      if $number_len == 11 && $number =~ /^1([0-9]+)/;
    return '0' x 10;
}

sub _area_code { my ($number) = @_;
    substr _number($number), 0, 3;
}

sub _pretty { my ($number) = @_;
    _number($number) =~ /(\d{3})(\d{3})(\d{4})/;
    "($1) $2-$3";
}


sub new { my ($class, $number) = @_;
    bless { number => $number }, $class;
}
sub number    { my ($self) = @_; _number($self->{'number'}); };
sub area_code { my ($self) = @_; _area_code($self->{'number'}); };
sub pretty    { my ($self) = @_; _pretty($self->{'number'}); };

1;