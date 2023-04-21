#!/bin/zsh

echo "\n===Setting up symlinks===\n"
../common/symlink.sh

echo "\n===Homebrew Install===\n"
zsh ./install-brew.sh
brew bundle

echo "\n===Setting up zsh===\n"
if [ -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k" ]; then
    echo "Oh My Zsh already installed"
else
    sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" "" --unattended
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
fi

echo "\n===Custom Installs===\n"
../common/install-volta.sh

echo "\n===Add Fonts===\n"
./add-hack-font.sh