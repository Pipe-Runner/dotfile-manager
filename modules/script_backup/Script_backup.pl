package Script_backup;
use strict;
use warnings;
use File::Basename;

# ===========================================================================================================================
#                                                   Script Backup
# ===========================================================================================================================
sub pull(){
	my $dirname = dirname(__FILE__);
	# generating folder structure
	my $stderr = `mkdir $dirname/../../scripts 2>&1`;
	$stderr = `mkdir $dirname/../../scripts/.config 2>&1`;
	# .zshrc
	`cp -ur ~/.zshrc $dirname/../../scripts/`;
	# .zsh history
	`cp -ur ~/.zsh_history $dirname/../../scripts/`;
	# .bashrc
	`cp -ur ~/.bashrc $dirname/../../scripts/`;
	# .git config
	`cp -ur ~/.gitconfig $dirname/../../scripts/`;
	# vis config
	`cp -ur ~/.config/vis $dirname/../../scripts/.config/vis`;
	# i3 config
	`cp -ur ~/.config/i3 $dirname/../../scripts/.config/i3`;
	# i3blocks config
	`cp -ur ~/.config/i3blocks $dirname/../../scripts/.config/i3blocks`;
	# rofi config
	`cp -ur ~/.config/rofi $dirname/../../scripts/.config/rofi`;
	# VS Code config
	`cp -ur ~/.config/Code $dirname/../../scripts/.config/Code`;
	# i3 scripts
	`cp -ur ~/.i3_scripts $dirname/../../scripts/`;
}

# ===========================================================================================================================
#                                                   Script Restore
# ===========================================================================================================================

1;