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
