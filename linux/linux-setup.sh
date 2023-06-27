#!/bin/bash

echo -e "\n===Setting up symlinks===\n"
../common/symlink.sh

echo -e "\n===Installing packages===\n"
./install-packages.sh

echo -e "\n===Installing applications===\n"

sudo apt install firefox -y
sudo snap install --classic code
sudo snap install vlc
sudo snap install spotify
sudo snap install --classic obsidian



echo -e "\n===Install Docker===\n"
./install-docker.sh

echo -e "\n===Updating settings===\n"
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position BOTTOM
gsettings set org.gnome.desktop.peripherals.touchpad natural-scroll false
gsettings set org.gnome.desktop.interface gtk-theme 'Yaru-dark'
gsettings set org.gnome.shell.extensions.dash-to-dock show-mounts false
gsettings set org.gnome.shell.extensions.dash-to-dock multi-monitor true
# Set blank screen timer to 30 minutes
gsettings set org.gnome.desktop.session idle-delay 1800

echo -e "\n===Setting up zsh===\n"
if [ -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k" ]; then
	echo "Oh My Zsh already installed"
else
	sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" "" --unattended
	git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
	chsh -s $(which zsh)
fi

echo -e "\n===Custom Install===\n"
../common/install-volta.sh

echo -e "\n===Add Fonts===\n"
./add-hack-font.sh
