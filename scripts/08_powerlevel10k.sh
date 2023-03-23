#!/bin/zsh

echo "Installing powerlevel10k..."
brew install romkatv/powerlevel10k/powerlevel10k

new_rc="source $(brew --prefix)/opt/powerlevel10k/powerlevel10k.zsh-theme"
if grep -q $new_rc ~/.zshrc; then
  echo "$new_rc already exists"
else
  echo "adding $new_rc to ~/.zshrc"
  gsed -i "$ a $new_rc" ~/.zshrc
fi
