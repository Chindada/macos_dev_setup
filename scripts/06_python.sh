#!/bin/zsh

echo "Installing python..."
brew install python@3.10
eval "$(/usr/local/bin/brew shellenv)"
arch -x86_64 brew install python@3.10
eval "$(/opt/homebrew/bin/brew shellenv)"

echo 'if [[ "$(uname -m)" == "x86_64" ]]; then
  alias python3=/usr/local/bin/python3.10
  alias pip3=/usr/local/bin/pip3.10
elif [[ "$(uname -m)" == "arm64" ]]; then
  alias python3=/opt/homebrew/bin/python3.10
  alias pip3=/opt/homebrew/bin/pip3.10
fi' >~/.apple_silicon_python

new_rc='source ~/.apple_silicon_python'
if grep -q $new_rc ~/.zshrc; then
  echo "$new_rc already exists"
else
  echo "adding $new_rc to ~/.zshrc"
  gsed -i "$ a $new_rc" ~/.zshrc
fi
