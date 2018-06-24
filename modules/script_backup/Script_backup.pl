package Script_backup;
use strict;
use warnings;
use File::Basename;

# ===========================================================================================================================
#                                                   Script Backup
# ===========================================================================================================================
sub pull(){
	my $dirname = dirname(__FILE__);
	
	# .zshrc
	`rsync -azvh ~/.zshrc $dirname/../../scripts/`;
	# .zsh history
	`rsync -azvh ~/.zsh_history $dirname/../../scripts/`;
	# .bashrc
	`rsync -azvh ~/.bashrc $dirname/../../scripts/`;
	# .git config
	`rsync -azvh ~/.gitconfig $dirname/../../scripts/`;
	# vis config
	`rsync -azvh ~/.config/vis $dirname/../../scripts/.config/`;
	# i3 config
	`rsync -azvh ~/.config/i3 $dirname/../../scripts/.config/`;
	# i3blocks config
	`rsync -azvh ~/.config/i3blocks $dirname/../../scripts/.config/`;
	# rofi config
	`rsync -azvh ~/.config/rofi $dirname/../../scripts/.config/`;
	# i3 scripts
	`rsync -azvh --exclude=.git --exclude=README.md ~/.i3_scripts $dirname/../../scripts/`;
	# fonts
	`rsync -azvh ~/.fonts $dirname/../../scripts/`;
}

# ===========================================================================================================================
#                                                   Script Restore
# ===========================================================================================================================

1;