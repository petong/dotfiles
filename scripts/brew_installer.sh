#!/bin/bash

set -euxo pipefail

# install brew if needed
which -s brew || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

if [[ ! -L ~/iCloudDrive ]]; then
    ln -s ~/Library/Mobile\ Documents/com~apple~CloudDocs ~/iCloudDrive
fi

#if [[ ! -d /Applications/Hammerspoon.app ]]; then
#  brew install --cask hammerspoon
#fi

brew update
brew install \
 cheat \
 emojify \
 flycut \
 gpg \
 helm \
 htop \
 k9s \
 keybase \
 krew \
 kubectl \
 kubie \
 mtr \
 ngrep \
 nvim \
 pass \
 ripgrep \
 rust \
 tig \
 tmux \
 util-linux \

brew install --cask docker
brew install --cask hammerspoon
brew install --cask homebrew/cask-fonts/font-inconsolata-for-powerline
brew install --cask signal
brew install --cask spotify
