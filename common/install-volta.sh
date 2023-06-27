#!/usr/bin/env zsh 

if exists volta; then
    echo "Volta already installed"
else
    echo "Installing Volta"
    curl https://get.volta.sh | bash
fi
