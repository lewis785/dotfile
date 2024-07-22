#!/bin/zsh

echo "\n===Setting up symlinks===\n"
../common/symlink.sh

echo "\n===Homebrew Install===\n"
./install-brew.sh
brew bundle

echo "\n===Setting up zsh===\n"
../common/setup-zsh.sh

echo "\n===Custom Installs===\n"
../common/install-volta.sh

