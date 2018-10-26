#!/usr/bin/perl

use strict;
use warnings;

my ( $arg_fg, $arg_100_charge_bg, $arg_75_charge_bg, $arg_50_charge_bg, $arg_25_charge_bg, $arg_prev_widget_bg ) = @ARGV;

sub pango_template
{
	my ( $value, $foreground_color, $background_color, $background_color_prev, $separator ) = @_;
	return "<span foreground='$background_color' background='$background_color_prev'>$separator</span><span foreground='$foreground_color' background='$background_color'> $value </span>";
}

my $acpi;
my $status;
my $percent;
my $full_text;
my $short_text;
my $bat_number = $ENV{BLOCK_INSTANCE} || 0;

# read the first line of the "acpi" command output
open (ACPI, "acpi -b | grep 'Battery $bat_number' |") or die;
$acpi = <ACPI>;
close(ACPI);

# fail on unexpected output
if ($acpi !~ /: (\w+), (\d+)%/) {
	die "$acpi\n";
}

$status = $1;
$percent = $2;

if ($percent < 5) {
	$full_text = " ";
} elsif ($percent < 25){
	$full_text = " ";
} elsif ($percent < 50) {
	$full_text = " ";
} elsif ($percent < 75) {
	$full_text = " ";
} else {
	$full_text = " ";
}

$full_text .= "$percent%";

if ($status eq 'Discharging') {
	$full_text .= '  ';
} elsif ($status eq 'Charging') {
	$full_text .= '  ';
}

$short_text = $full_text;

if ($acpi =~ /(\d\d:\d\d):/) {
	$full_text .= "($1)";
}

# consider color and urgent flag only on discharge
if ($status eq 'Discharging') {
	if ($percent < 25) {
		print pango_template( $full_text, $arg_fg, $arg_25_charge_bg, $arg_prev_widget_bg, '');
	} elsif ($percent < 50) {
		print pango_template( $full_text, $arg_fg, $arg_50_charge_bg, $arg_prev_widget_bg, '');
	} elsif ($percent < 75) {
		print pango_template( $full_text, $arg_fg, $arg_75_charge_bg, $arg_prev_widget_bg, '');
	} else {
		print pango_template( $full_text, $arg_fg, $arg_100_charge_bg, $arg_prev_widget_bg, '');
	}
}
else
{
	print pango_template( $full_text, $arg_fg, $arg_100_charge_bg, $arg_prev_widget_bg, '');
}
