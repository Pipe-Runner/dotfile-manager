package Data_backup;
use strict;
use warnings;
use File::Basename;

# ===========================================================================================================================
#                                                   File zipping utility(zip path issues)
# ===========================================================================================================================
sub spit_zip(){
	my $dirname = dirname(__FILE__);
	`rm -rf $dirname/../../backup`;
	`mkdir $dirname/../../backup`;
	print $dirname;
	my @folder_list = ("custom_wallpapers", "Downloads", "Pictures", "Music", "Videos","Projects", "Documents" );
	foreach my $folder(@folder_list){
		`zip -r $dirname/../../backup/$folder.zip ~/$folder`;
	}
}
1;