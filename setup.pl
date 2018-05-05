#!/usr/bin/perl
use strict;
use warnings;
require "./modules/data_backup/Data_backup.pl";
require "./modules/script_backup/Script_backup.pl";

print "=========================== Utility 2.0 =============================\n";

# ===========================================================================================================================
#                                                   User service choice
# ===========================================================================================================================
# print "Select an option\n
# 	1. Backup\n
# 	2. Copy Scripts\n
# 	3. Restore Data\n
# 	4. Restore Scripts
# \n";
# print ">>> ";
# my $user_choice = <STDIN>;
# chomp($user_choice);
# print $user_choice;

# Data_backup::spit_zip();
Script_backup::pull();