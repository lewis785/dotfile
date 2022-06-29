#!/bin/bash

curl -q -L https://github.com/source-foundry/Hack/releases/download/v3.003/Hack-v3.003-ttf.zip -o hack.zip
unzip -q hack.zip -d hack
cp -r hack/ttf/ /Library/Fonts/
rm -rf hack
rm -f hack.zip

Echo "Hack font copied to /Library/Fonts/"
