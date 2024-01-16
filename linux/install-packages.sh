#!/bin/bash

packages=(
	awscli
	bat
	curl
	exa
	fzf
	git
	hstr
	jq
	pandoc
	tmux
	vim
	zsh
)

function install_package() {
	if dpkg --list | grep -w $1 -q; then
		echo "Already installed: $1"
	else
		echo ">>> Installing $1"
		sudo apt install $1 -y
		echo ""
	fi
}

for i in "${packages[@]}"; do
	install_package "$i"
done