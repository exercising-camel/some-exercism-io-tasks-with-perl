package RobotName;
use strict;
use warnings FATAL => 'all';
use v5.10;
use String::Random;

sub random_robot_name {
    state $sr = String::Random->new;
    $sr->randregex('[A-Z]{2}[0-9]{3}');
}

sub new { my ($class) = @_;
    bless { name => random_robot_name() }, $class;
}
sub name { my ($self) = @_; $self->{'name'}; }
sub reset_name { my ($self) = @_; $self->{'name'} = random_robot_name(); }

1;