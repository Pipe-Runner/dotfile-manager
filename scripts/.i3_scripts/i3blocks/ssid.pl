#!/usr/bin/perl

use strict;
use warnings;

my ( $arg_fg, $arg_warning_fg, $arg_bg, $arg_prev_widget_bg ) = @ARGV;

sub pango_template
{
	my ( $value, $background_color, $background_color_prev, $separator ) = @_;
	return "<span foreground='$background_color' background='$background_color_prev'>$separator</span><span background='$background_color'>$value</span>";
}

my @output = split("\n",`nmcli`);

my $wifi="";
my $foundWifi = 0;
my $lan="";
my $foundLan = 0;

for my $line(@output){
    if( $line =~ /wlp58s0/ && $line =~ /connected to/){
        my @temp = split(" connected to ",$line);
        $wifi = $temp[1];
        $foundWifi = 1;
    }
    elsif( $line =~ /enp0s20f0u1/ && $line =~ /connected to/){
        my @temp = split(" connected to ",$line);
        $lan = $temp[1];
        $foundLan = 1;
    }
}

my $display = "";
if( $wifi eq "" && $foundWifi == 0 ){
    $display = $display."<span foreground='$arg_warning_fg'> ﬉ N/A</span>";
}
else{
    my @temp = split(" ",`nmcli device wifi list | grep "*"`);
    my $signal = $temp[6];
    $display = $display."<span foreground='$arg_fg'> ﬉ ".$signal.'%'." - ".$wifi."</span>";
}

if( $lan eq "" && $foundLan == 0 ){
    $display = $display."<span foreground='$arg_warning_fg'>  N/A </span>";
}
else{
    $display = $display."<span foreground='$arg_fg'>  ".$lan." </span>";
}
;
print pango_template( $display, $arg_bg, $arg_prev_widget_bg, "" );
