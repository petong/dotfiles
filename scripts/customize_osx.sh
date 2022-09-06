#!/bin/bash
#
# this needs to be done on a brand new mac
# xcode-select --install

# exit if we arent running on OSX
uname -a | grep -q Darwin || exit 0

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'


## UI/UX

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

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
#defaults write apple.touchbar.agent PresentationModeGlobal functionKeys
defaults write -g com.apple.keyboard.fnState 1


#running "Always show scrollbars"
defaults write NSGlobalDomain AppleShowScrollBars -string "Always"
# Possible values: `WhenScrolling`, `Automatic` and `Always`

## Dock
# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

# make the dock tiny
defaults write com.apple.dock largesize -int 16

# Stop icons from bouncing in OS X Dock
defaults write com.apple.dock no-bouncing -bool true

# lock the size
defaults write com.apple.dock size-immutable -bool yes

# Wipe all (default) app icons from the Dock
# This is only really useful when setting up a new Mac, or if you don’t use
# the Dock to launch apps.
defaults write com.apple.dock persistent-apps -array

# Show only open applications in the Dock
defaults write com.apple.dock static-only -bool true

# Don’t show recent applications in Dock
defaults write com.apple.dock show-recents -bool false

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

# Increase sound quality for Bluetooth headphones/headsets
defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40

# Enable full keyboard access for all controls
# (e.g. enable Tab in modal dialogs)
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# Enable HiDPI display modes (requires restart)
sudo defaults write /Library/Preferences/com.apple.windowserver DisplayResolutionEnabled -bool true

# disable disctionary lookup on force click
defaults write -g com.apple.trackpad.forceClick -int 0

# swipe between pages - off
defaults write -g AppleEnableSwipeNavigateWithScrolls -bool false

## Finder
# Avoid creating .DS_Store files on network or USB volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

# Finder: show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Finder: show status bar
defaults write com.apple.finder ShowStatusBar -bool true

# Finder: show path bar
defaults write com.apple.finder ShowPathbar -bool true

# Display full POSIX path as Finder window title
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# Keep folders on top when sorting by name
defaults write com.apple.finder _FXSortFoldersFirst -bool true

# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Use list view in all Finder windows by default
# Four-letter codes for the other view modes: `icnv`, `clmv`, `glyv`
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# disable hot corners
defaults write com.apple.dock wvous-tl-corner -int 0      # top left
defaults write com.apple.dock wvous-tr-corner -int 0      # top right
defaults write com.apple.dock wvous-bl-corner -int 0      # bottom right
defaults write com.apple.dock wvous-br-corner -int 0      # bottom right

## Iterm2
defaults write com.googlecode.iterm2 HideScrollbar -bool true
defaults write com.googlecode.iterm2 HideTabNumber -bool true

## messages
# Set the keyboard shortcuts for next and previous messages
defaults write com.apple.MobileSMS NSUserKeyEquivalents -dict-add "Go to Next Conversation" "@~\\U2192"
defaults write com.apple.MobileSMS NSUserKeyEquivalents -dict-add "Go to Previous Conversation" "@~\\U2190"

# flycut
# load on startup
defaults write com.generalarcade.flycut loadOnStartup 1
# sync settings via icloud
defaults write com.generalarcade.flycut syncSettingsViaICloud 1
# black scissors icon
defaults write com.generalarcade.flycut menuIcon 3


# disable menu bar user switcher
defaults write com.apple.controlcenter "NSStatusItem Visible UserSwitcher" 0


## restart affected services
for app in \
  "ControlStrip" \
  "Dock" \
  "Finder" \
  "SystemUIServer" \
  "Touch Bar agent" \
  "cfprefsd" \
  ; do
  pkill "${app}" &> /dev/null
done


### third party configs

# install brew if not found
which brew || /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

brew bundle

# tmux plugins
[[ -f ~/.tmux/plugins/tpm/bin/install_plugins ]] && ~/.tmux/plugins/tpm/bin/install_plugins
