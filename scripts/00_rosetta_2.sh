#!/bin/zsh

if arch -x86_64 /usr/bin/true 2>/dev/null; then
  echo "Rosetta 2 is installed"
else
  echo "Installing Rosetta 2..."
  sudo softwareupdate --install-rosetta --agree-to-license
fi
