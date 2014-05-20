package Trinary;
use strict;
use warnings FATAL => 'all';
use v5.10;
use List::Util qw|sum|;

sub _trinary_to_decimal { my ($trinary) = @_;
    my $pow = length $trinary;
    sum map { $_ *  3 ** (--$pow) } split '', $trinary;
}

sub new { my ($class, $number) = @_;
    $number = $number =~ /^[0-9]+$/ ? $number : 0;
    bless { number => $number }, $class;
}
sub to_decimal { my ($self) = @_; _trinary_to_decimal($self->{'number'}); }

1;