#!/bin/zsh

echo "Installing homebrew utils..."
brew install make
new_rc='export PATH="$HOMEBREW_PREFIX/opt/make/libexec/gnubin:$PATH"'
if grep -q $new_rc ~/.zshrc; then
  echo "$new_rc already exists"
else
  echo "adding $new_rc to ~/.zshrc"
  gsed -i "$ a $new_rc" ~/.zshrc
fi

brew install tree
brew install gnutls
brew install coreutils
brew install clang-format
brew install mosquitto

brew install postgresql@16
new_rc='export PATH="/opt/homebrew/opt/postgresql@16/bin:$PATH"'
if grep -q $new_rc ~/.zshrc; then
  echo "$new_rc already exists"
else
  echo "adding $new_rc to ~/.zshrc"
  gsed -i "$ a $new_rc" ~/.zshrc
fi

brew install --cask valentina-studio
brew install --cask visual-studio-code
brew install --cask iterm2
brew install --cask docker
brew install --cask postman
brew install --cask google-chrome
brew install --cask microsoft-edge
brew install --cask github
brew install --cask figma
brew install --cask vlc

brew install --cask rectangle
brew install --cask alfred
brew install --cask appcleaner
brew install --cask one-switch

brew install --cask microsoft-teams
brew install --cask slack
brew install --cask discord
brew install --cask zoom
brew install --cask webex
brew install --cask telegram

brew install --cask powershell
