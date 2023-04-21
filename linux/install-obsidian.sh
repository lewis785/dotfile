#!/bin/bash

curl -L https://github.com/obsidianmd/obsidian-releases/releases/download/v0.14.2/obsidian_0.14.2_amd64.snap -o obsidian.snap &&\
snap install --dangerous obsidian.snap &&\
rm obsidian.snap