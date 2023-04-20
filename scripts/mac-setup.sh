#!/bin/bash

brew update

# Upgrade already installed apps
brew upgrade

# Install Programs
echo "===Installing programs==="

brew install git
brew install gh
brew install docker
brew install awscli
brew install fzf
brew install pandoc
brew install exa

# Install Applications
echo "===Installing application==="

brew install --cask slack
brew install --cask google-chrome
brew install --cask firefox
brew install --cask obsidian # Notes app
brew install --cask spotify
brew install --cask iterm2
brew install --cask visual-studio-code
brew install --cask postman
brew install --cask aws-vault
brew install --cask alfred
brew install --cask krisp

echo "===Installing Terraform==="
brew tap hashicorp/tap
brew install hashicorp/tap/terraform

# Setup VSCode
Echo "===Setup VSCode==="

code --install-extension esbenp.prettier-vscode
code --install-extension dsznajder.es7-react-js-snippets
code --install-extension ms-vscode.vscode-typescript-next
code --install-extension vscode-icons-team.vscode-icons

# Setup ZSH
echo "===Setting up zsh==="

sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" "" --unattended
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Custom Installs
Echo "===Custom Installs==="

if exists volta; then
    echo "Volta already installed"
else
    curl https://get.volta.sh | bash --skip-setup
fi

# Setup symlinks
echo "===Setting up symlinks==="

sh ./symlink.sh

echo "===Add Fonts==="
sh ./mac/add-hack-font.sh