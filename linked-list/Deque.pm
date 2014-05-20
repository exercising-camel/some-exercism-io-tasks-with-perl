package Deque;
use strict;
use warnings FATAL => 'all';
use v5.10;

sub new { my ($class, @elems) = @_;
    bless { _cheating => [@elems] }, $class;
}

sub push { my ($self, @elems) = @_;
    push @{ $self->{'_cheating'} }, @elems;
}

sub pop { my ($self) = @_;
    pop @{ $self->{'_cheating'} };
}

sub unshift { my ($self, @elems) = @_;
    unshift @{ $self->{'_cheating'} }, @elems;
}

sub shift { my ($self) = @_;
    shift @{ $self->{'_cheating'} };
}

1;