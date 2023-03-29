#!/bin/zsh

echo "Installing python..."
brew install python3
eval "$(/usr/local/bin/brew shellenv)"
arch -x86_64 brew install python3
eval "$(/opt/homebrew/bin/brew shellenv)"
