#!/usr/bin/perl
use strict;
use warnings;

print "=========================== Utility 2.0 =============================\n";

# ===========================================================================================================================
#                                                   User service choice
# ===========================================================================================================================
print "Select an option\n
	1. Backup\n
	2. Copy Scripts\n
	3. Restore Data\n
	4. Restore Scripts
\n";
print ">>> ";
my $user_choice = <STDIN>;
chomp $user_choice;
print $user_choice;