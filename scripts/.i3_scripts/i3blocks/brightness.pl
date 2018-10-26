#!/usr/bin/perl

use strict;
use warnings;

my ( $arg_fg, $arg_bg, $arg_prev_widget_bg ) = @ARGV;

sub pango_template
{
	my ( $value, $foreground_color, $background_color, $background_color_prev, $icon, $separator ) = @_;
	return "<span foreground='$background_color' background='$background_color_prev'>$separator</span><span foreground='$foreground_color' background='$background_color'> $icon $value </span>";
}

my $current_brightness = `brightnessctl get`;
my $max_brightness = `brightnessctl max`;

my $brightness_percentage = ($current_brightness/$max_brightness) * 100;

print pango_template( $brightness_percentage.'%', $arg_fg, $arg_bg, $arg_prev_widget_bg, "", "" );