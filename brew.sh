#!/usr/bin/env bash

# Install Bash 4.
brew update # Make sure we’re using the latest Homebrew.
brew upgrade # Upgrade any already-installed formulae.

# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
brew install gnu-sed

brew install bash
brew install bash-completion2

# Switch to using brew-installed bash as default shell
if ! fgrep -q '/opt/homebrew/bin/bash' /etc/shells; then
  echo '/opt/homebrew/bin/bash' | sudo tee -a /etc/shells;
  chsh -s /opt/homebrew/bin/bash;
fi;

# Install more recent versions of some OS X tools.
#brew install vim --override-system-vi
brew install coreutils  #install gdate, gsed, etc
brew install grep

# Preferred font
brew install font-inconsolata

# fake iproute2 on mac 
brew install iproute2mac

brew install node

brew install python3