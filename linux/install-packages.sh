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
)

function install_package() {
	if dpkg --list | grep -w $1 -q; then
		echo "Already installed: $1"
	else
		echo ">>> Installing $1"
		sudo apt-get install $1 -y >> /dev/null
		echo ""
	fi
}

for i in "${packages[@]}"; do
	install_package "$i"
done