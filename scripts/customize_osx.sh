#!/bin/bash


# mission control
# disables auto rearrange based on most recent use
defaults write com.apple.dock mru-spaces -bool false


#running "Always show scrollbars"
defaults write NSGlobalDomain AppleShowScrollBars -string "Always"
# Possible values: `WhenScrolling`, `Automatic` and `Always`

# disables smart quotes
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

## Dock
# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

# Stop icons from bouncing in OS X Dock
defaults write com.apple.dock no-bouncing -bool true

## trackpad
# Trackpad: enable tap to click for this user and for the login screen
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
