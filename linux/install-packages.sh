#!/bin/bash

packages=(
	awscli
	bat
	curl
	exa
	fzf
	git
	pandoc
	vim
	zsh
	firefox
)

function install_package() {
	if dpkg --list | grep -w $1 -q; then
		echo "Package $1 is already installed."
	else
		echo "Installing package $1..."
		sudo apt-get install $1 -y >> /dev/null
		echo "Package $1 installed successfully!"
	fi
}

for i in "${packages[@]}"; do
	install_package "$i"
done