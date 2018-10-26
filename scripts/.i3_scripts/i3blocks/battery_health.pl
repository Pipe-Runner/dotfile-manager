#!/usr/bin/perl

use strict;
use warnings;

my ( $arg_fg, $arg_bg, $arg_prev_widget_bg ) = @ARGV;

sub pango_template
{
	my ( $value, $foreground_color, $background_color, $background_color_prev, $icon, $separator ) = @_;
	return "<span foreground='$foreground_color' background='$background_color'> $icon $value </span>";
}

my $command_output = `acpi -ib | rev | cut -d' ' -f 1 | rev | sed -n '2p'`;
chomp( $command_output );

print pango_template( $command_output, $arg_fg, $arg_bg, $arg_prev_widget_bg, "" );