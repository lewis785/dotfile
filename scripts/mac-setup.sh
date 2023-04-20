#!/bin/bash

brew update

# Upgrade already installed apps
brew upgrade

echo "\n===Installing packages===\n"

brew install git
brew install gh
brew install docker
brew install awscli
brew install fzf
brew install pandoc
brew install exa

echo "\n===Installing applications===\n"

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

echo "\n===Installing Terraform===\n"
brew tap hashicorp/tap
brew install hashicorp/tap/terraform

# Setup VSCode
Echo "\n===Setup VSCode===\n"

code --install-extension esbenp.prettier-vscode
code --install-extension dsznajder.es7-react-js-snippets
code --install-extension ms-vscode.vscode-typescript-next
code --install-extension vscode-icons-team.vscode-icons

echo "\n===Setting up zsh===\n"

if [ -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k" ]; then
    echo "Oh My Zsh already installed"
else
    sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" "" --unattended
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
fi

echo "\n===Custom Installs===\n"

if exists volta; then
    echo "Volta already installed"
else
    curl https://get.volta.sh | bash --skip-setup
fi

echo "\n===Setting up symlinks===\n"

sh ./symlink.sh

echo "\n===Add Fonts===\n"

sh ./mac/add-hack-font.sh