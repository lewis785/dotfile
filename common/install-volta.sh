#!/usr/bin/env zsh 

if exists volta; then
    echo "Volta already installed"
else
    curl https://get.volta.sh | bash --skip-setup
fi
