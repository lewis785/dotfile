#!/bin/bash

#Install basics
echo "===Installing programs==="

sudo apt install \
	vim \
	git \
	awscli \
	fzf \
	pandoc\
	curl\
	-y

#Install applications
echo "===Installing applications==="

sudo apt install firefox -y
sudo snap install --classic code
sudo snap install vlc
sudo snap install spotify

if ! type obsidian > /dev/null
then
    echo "Installing obsidian"
	sh ./linux/install-obsidian.sh
fi

echo "==Install Docker==="
sh ./linux/install-docker.sh

#Settings
echo "===Updating settings==="
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position BOTTOM
gsettings set org.gnome.desktop.peripherals.touchpad natural-scroll false
gsettings set org.gnome.desktop.interface gtk-theme 'Yaru-dark'

# Setup ZSH
echo "===Setting up zsh==="
if ! type zsh > /dev/null; then
	sudo install zsh
	sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" "" --unattended
	git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
	chsh -s $(which zsh)
fi

# Custom Install
echo "===Custom Install==="
if ! type volta > /dev/null; then
    curl https://get.volta.sh | bash
fi

# Setup symlinks
echo "===Setting up symlinks==="
sh ./symlink.sh

echo "===Add Fonts==="
sh ./linux/add-hack-font.sh
