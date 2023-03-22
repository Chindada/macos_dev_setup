#!/bin/zsh

NEED_INSTALL=1
if [[ -d "$HOME/.oh-my-zsh" ]]; then
  echo "oh-my-zsh is already installed, removing it first..."
  echo -n "Reinstall will clear current setting, continue(y/n)?"
  read reset
  if [[ $reset == "y" ]]; then
    echo "Removing oh-my-zsh..."
    rm -rf $HOME/.oh-my-zsh
  else
    echo "Skipping oh-my-zsh installation..."
    NEED_INSTALL=0
  fi
fi

if [[ $NEED_INSTALL == 1 ]]; then
  echo "Installing oh-my-zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi
