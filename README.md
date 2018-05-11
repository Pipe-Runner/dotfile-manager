# setup
A quick tool kit for script backup, data zipping and up zipping and system state restoration  
  
![My System](./support/sample.jpg)

## Purpose of this repository
A set of perl scripts that can be readily downloaded and used to backup system data and dot files. It also packs scripts and instrucations to restore all data, configurations and installed apps either automatically or manually ( if automatic method fails ).
- [x] A data backup and restore utility
- [x] A dot file backup and restore utility
- [x] A set of install scripts for fresh ubuntu installation

**Note:** If at some point the automatic installation fails to at any of the tasks, it will generate a log file with the task number and the error message for you to follow up. Thus you can manually deal with the situation. 

The set of programs that the install scripts covers are as follows:

### Automatic Tasks

#### Task 1: Basic utilities  
```shell
sudo apt-get rofi
sudo apt-get install thunar
sudo apt-get install git
sudo apt-get install wget
sudo apt-get winff
sudo apt-get install aria2
sudo apt-get install lxappearance
sudo apt-get install feh
sudo apt-get install blueman
sudo apt-get install arandr
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.0/install.sh | bash
```

#### Task 2: Adding git credentials
```shell
git config --global user.name "AakashMallik"
git config --global user.email "aakashs.mallik.cse15@itbhu.ac.in"
```

#### Task 3: Copy fonts and rebuild cache
```shell
sudo fc-cache -f -v ~/.fonts
```

#### Task 4: Installing zsh and make it default ( Requires re-login )
```shell
sudo apt-get install zsh
chsh -s $(which zsh)
```

#### Task 5: Install and setup powertop
```shell
sudo apt-get install powertop
sudo powertop --auto-tune
cat << EOF | sudo tee /etc/systemd/system/powertop.service
[Unit]
Description=PowerTOP auto tune

[Service]
Type=idle
Environment="TERM=dumb"
ExecStart=/usr/sbin/powertop --auto-tune

[Install]
WantedBy=multi-user.target
EOF
systemctl daemon-reload
systemctl enable powertop.service
```

#### Task 6: Install compton compositor
```shell
sudo apt-add-repository ppa:richardgv/compton
sudo apt-get update
sudo apt-get install compton
```

#### Task 7: Install oh-my-zsh ( run from ~ )
```shell
git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
```

#### Task 8: Install powerlevel9k ( run from ~ )
```shell
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
```

#### Task 9: Install python 2.7
```shell
sudo apt install python2.7 python-pip
```

#### Task 10: Install i3-gaps & i3blocks
```shell
sudo apt-get intall libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev libxcb-icccm4-dev libyajl-dev libstartup-notification0-dev libxcb-randr0-dev libev-dev libxcb-cursor-dev libxcb-xinerama0-dev libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev autoconf libxcb-xrm0 libxcb-xrm-dev automake
git clone https://www.github.com/Airblader/i3 i3-gaps
cd i3-gaps
autoreconf --force --install
rm -rf build/
mkdir -p build && cd build/
../configure --prefix=/usr --sysconfdir=/etc --disable-sanitizers
make
sudo make install

sudo apt-get install i3blocks
```

### Manual Tasks

#### Task 11: Cli-vis
https://github.com/dpayne/cli-visualizer

#### Task 12: Mouse settings
https://www.reddit.com/r/i3wm/comments/516e8c/tap_to_click_touchpad/?st=jgqkx25d&sh=dd93b234

#### Task 13: Add Themes to Lxappearance ( ~/.themes and ~/.icons )
https://www.gnome-look.org/p/1013698/-  

https://forum.lxde.org/viewtopic.php?t=326#p1068

#### Task 14: Install LTS node and change make it default, update npm
nvm install --lts
nvm use --lts
npm -i -g npm
