#!/bin/bash

curl -L https://github.com/source-foundry/Hack/releases/download/v3.003/Hack-v3.003-ttf.zip -o hack.zip
unzip hack.zip -d hack
sudo cp hack/ttf/* /usr/share/fonts/
rm -rf hack
rm -f hack.zip
