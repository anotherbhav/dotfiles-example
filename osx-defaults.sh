#!/usr/bin/env bash

## to find out where a setting exists, make a change between before and after then use visual code studio to diff
# defaults read > before
# defaults read > after
# code --diff before after
#  - alt(option)+f5 to scroll through diffs
#  - on a touchbar mac, press fn to bring the function keys up 
# How to find out what type a thing is
# defaults read-type com.apple.AppleMultitouchTrackpad Clicking
# defaults read com.apple.AppleMultitouchTrackpad Clicking

echo Setting OSX Configurations

# trackpad settings
# turn force click on the trackpad off
defaults write -g com.apple.trackpad.forceClick -bool false
# disable browser back/forward with trackpad
defaults write -g AppleEnableSwipeNavigateWithScrolls -bool false

# Always show scroll bars, they should not disappear
# defaults read-type -g AppleShowScrollBars -string "Always"
defaults write -g AppleShowScrollBars -string "Always"

# turn tap to click on
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true

