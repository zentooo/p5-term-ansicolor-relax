package Term::ANSIColor::Relax::Scalar;

use strict;
use warnings;

my %effects = (
                'bold'           => 1,
                'dark'           => 2,
                'faint'          => 2,
                'underline'      => 4,
                'underscore'     => 4,
                'blink'          => 5,
                'reverse'        => 7,
                'concealed'      => 8,
              );

my %colors = (
                'black'          => 30,
                'red'            => 31,
                'green'          => 32,
                'yellow'         => 33,
                'blue'           => 34,
                'magenta'        => 35,
                'cyan'           => 36,
                'white'          => 37,

                'bright_black'   => 90,
                'bright_red'     => 91,
                'bright_green'   => 92,
                'bright_yellow'  => 93,
                'bright_blue'    => 94,
                'bright_magenta' => 95,
                'bright_cyan'    => 96,
                'bright_white'   => 97,
             );

my %grounds = (
                'on_black'          => 40,
                'on_red'            => 41,
                'on_green'          => 42,
                'on_yellow'         => 43,
                'on_blue'           => 44,
                'on_magenta'        => 45,
                'on_cyan'           => 46,
                'on_white'          => 47,

                'on_bright_black'   => 100,
                'on_bright_red'     => 101,
                'on_bright_green'   => 102,
                'on_bright_yellow'  => 103,
                'on_bright_blue'    => 104,
                'on_bright_magenta' => 105,
                'on_bright_cyan'    => 106,
                'on_bright_white'   => 107,
              );

my %all = (%effects, %colors, %grounds);
my @colors_keys = keys %colors;
my $colors_num = scalar @colors_keys;

while ( my ($color, $code) = each %all ) {
  no strict 'refs';
  *{__PACKAGE__ . '::' . $color} = sub {
    my $string = shift;
    return "\e[${code}m$string\e[0m";
  };
}

sub rainbow {
  my @chars = split //, shift;
  my @colored;

  for my $char (@chars) {
    my $code = $colors{ $colors_keys[ int rand($colors_num) ] };
    # other than spaces
    $code = 0 if $char =~ /\s/;
    push(@colored, "\e[${code}m$char\e[0m");
  }
  return join '', @colored;
}

package Term::ANSIColor::Relax;

use strict;
use warnings;

our $VERSION = '0.02';

use base qw/autobox/;

sub import {
  my $class = shift;
  $class->SUPER::import(SCALAR => 'Term::ANSIColor::Relax::Scalar');
}


1;

__END__

=head1 NAME

Term::ANSIColor::Relax - take easy to use colors in your term

=head1 SYNOPSIS

  use Term::ANSIColor::Relax;
  use feature qw/say/;

  say "I"->green;
  say "love"->magenta->bold->underscore;
  say "you"->white->on_blue;

=head1 AUTHOR

zentooo E<lt>zentoooo@gmail.comE<gt>

=head1 SEE ALSO

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
