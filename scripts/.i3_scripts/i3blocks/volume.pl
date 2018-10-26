#!/usr/bin/perl

use strict;
use warnings;

my ( $arg_fg, $arg_bg, $arg_warning_bg, $arg_prev_widget_bg ) = @ARGV;

sub pango_template
{
	my ( $value, $foreground_color, $background_color, $background_color_prev, $icon, $separator ) = @_;
	return "<span foreground='$background_color' background='$background_color_prev'>$separator</span><span foreground='$foreground_color' background='$background_color'> $icon $value </span>";
}

my @command_output = split( '\n', `amixer -M -c 0 get Master` );

my $mute_value = "";
my $volume_value = "";

if( $command_output[4] =~ m/\[(.*)\]/ )
{
	my @temp = split(" ",$&);
	$mute_value = substr( $temp[2], 1, length( $temp[2] ) - 2 );
	$volume_value = substr( $temp[0], 1, length( $temp[0] ) - 2 );;
} 

if( $mute_value eq "on" )
{
	print pango_template( $volume_value, $arg_fg, $arg_bg, $arg_prev_widget_bg, "", "" );
}
else
{
	print pango_template( $volume_value, $arg_fg, $arg_warning_bg, $arg_prev_widget_bg, "", "" );
}