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
sudo snap install docker

if ! type obsidian > /dev/null
then
    echo "Installing obsidian"
	sh ./linux/install-obsidian.sh
fi


#Settings
echo "===Updating settings==="
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position BOTTOM
gsettings set org.gnome.desktop.peripherals.touchpad natural-scroll false
gsettings set org.gnome.desktop.interface gtk-theme 'Yaru-dark'
