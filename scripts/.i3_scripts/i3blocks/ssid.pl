#!/usr/bin/perl
use strict;
use warnings;

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
    $display = $display.'<span foreground="#FF80AB">﬉ N/A</span>';
}
else{
    my @temp = split(" ",`nmcli device wifi list | grep "*"`);
    my $signal = $temp[6];
    $display = $display.'<span foreground="#81D4FA">﬉ '.$signal.'%'.' - '.$wifi.'</span>';
}

$display = $display."  ";

if( $lan eq "" && $foundLan == 0 ){
    $display = $display.'<span foreground="#FF80AB"> N/A</span>';
}
else{
    $display = $display.'<span foreground="#81D4FA"> '.$lan.'</span>';
}

$display = $display."\n";
print $display;
