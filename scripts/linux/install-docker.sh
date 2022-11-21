#!/bin/bash

if type docker > /dev/null; then
    echo "Docker already installed"
    exit 0
fi

# Install docker
sudo apt install docker.io
sudo snap install docker

# Setup docker user group
sudo getent group docker || sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
