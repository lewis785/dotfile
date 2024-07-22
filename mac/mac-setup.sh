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

echo "\n===Mac Setting===\n"
defaults write com.apple.dock autohide -bool true && killall Dock
defaults write com.apple.dock tilesize -float 54 && killall Dock