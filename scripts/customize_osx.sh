#!/bin/bash

# exit if we arent running on OSX
uname -a | grep -q Darwin || exit 0

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'


## UI/UX

# Menu bar
defaults write com.apple.systemuiserver menuExtras -array \
      "/System/Library/CoreServices/Menu Extras/Clock.menu" \
      "/System/Library/CoreServices/Menu Extras/Battery.menu" \
      "/System/Library/CoreServices/Menu Extras/AirPort.menu" \
      "/System/Library/CoreServices/Menu Extras/Bluetooth.menu" \
      "/System/Library/CoreServices/Menu Extras/Volume.menu"

# Show battery percentage
defaults write com.apple.menuextra.battery ShowPercent -bool true

# clock settings
defaults write com.apple.menuextra.clock IsAnalog -bool false
defaults write com.apple.menuextra.clock DateFormat -string "EEE MMM d  H:mm:ss"

# Disable automatic capitalization
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

# Disable smart dashes
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

# Disable automatic period substitution
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false

# Disable smart quotes
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

## touchbar
# defaults to F keys
defaults write apple.touchbar.agent PresentationModeGlobal functionKeys



#running "Always show scrollbars"
defaults write NSGlobalDomain AppleShowScrollBars -string "Always"
# Possible values: `WhenScrolling`, `Automatic` and `Always`

# disables smart quotes
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

## Dock
# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

# make the dock tiny
defaults write com.apple.dock largesize -int 16

# Stop icons from bouncing in OS X Dock
defaults write com.apple.dock no-bouncing -bool true

# mission control
# disables auto rearrange based on most recent use
defaults write com.apple.dock mru-spaces -bool false

# disable expose
defaults write com.apple.dock showAppExposeGestureEnabled -bool false

# changes screenshot location
defaults write com.apple.screencapture location -string "$HOME/Documents/ScreenShots"

## trackpad
# Trackpad: enable tap to click for this user and for the login screen
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# swipe between pages - off
defaults write -g AppleEnableSwipeNavigateWithScrolls -bool false

## Finder
# Avoid creating .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true


## Iterm2
defaults write com.googlecode.iterm2 HideScrollbar -bool true
defaults write com.googlecode.iterm2 HideTabNumber -bool true


## restart affected services
for app in \
  "Touch Bar agent" \
  "ControlStrip" \
  "SystemUIServer" \
  "cfprefsd"; do
  pkill "${app}" &> /dev/null
done



# install brew if needed
which -s brew || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

if [[ ! -L ~/iCloudDrive ]]; then
    ln -s ~/Library/Mobile\ Documents/com~apple~CloudDocs ~/iCloudDrive
fi

if [[ ! -d /Applications/Hammerspoon.app ]]; then
  brew cask install hammerspoon
fi

brew update
brew install \
 cheat \
 flycut \
 gpg \
 helm \
 k9s \
 keybase \
 kubectl \
 mtr \
 ngrep \
 nvim \
 pass \
 ripgrep \
 tig \
 tmux \
 util-linux \

brew install --cask hammerspoon
brew install --cask homebrew/cask-fonts/font-inconsolata-for-powerline
brew install --cask signal
brew install --cask spotify

brew tap ripple/homebrew-taps git@gitlab.ops.ripple.com:homebrew/taps.git
