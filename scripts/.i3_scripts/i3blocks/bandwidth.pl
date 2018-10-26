#!/usr/bin/perl

use strict;
use warnings;

my ( $arg_fg, $arg_bg ) = @ARGV;

sub pango_template
{
	my ( $value, $foreground_color, $background_color, $separator ) = @_;
	return "<span foreground='$background_color'>$separator</span><span foreground='$foreground_color' background='$background_color'>$value</span>";
}

my @command_output = split( " ", `cat /proc/net/dev | grep wlp58s0` );

my $old_recieved_bytes = $command_output[1];
my $old_transmitted_bytes = $command_output[9];

sleep(1);

@command_output = split( " ", `cat /proc/net/dev | grep wlp58s0` );

my $new_recieved_bytes = $command_output[1];
my $new_transmitted_bytes = $command_output[9];

my $recieved_kbs = sprintf( "%.2f" ,($new_recieved_bytes - $old_recieved_bytes)/1024 );
my $transmitted_kbs = sprintf( "%.2f" ,($new_transmitted_bytes - $old_transmitted_bytes)/1024 );

my $output = "  $transmitted_kbs KBs  $recieved_kbs KBs ";

print pango_template( $output, $arg_fg, $arg_bg, "" );
# print $output;