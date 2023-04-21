#!/bin/zsh

if exists brew; then
    echo "Homebrew is already installed\n"
    exit 0
fi

echo "Installing Homebrew\n"
bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"