#!/bin/zsh

if exists obsidian; then
    echo "Obsidian already installed"
    exit 0
fi

echo "Installing obsidian"
curl -L https://github.com/obsidianmd/obsidian-releases/releases/download/v0.14.2/obsidian_0.14.2_amd64.snap -o obsidian.snap &&\
snap install --dangerous obsidian.snap &&\
rm obsidian.snap