#!/bin/zsh

echo "Installing oh-my-zsh..."
if [[ -d "$HOME/.oh-my-zsh" ]]; then
    echo "oh-my-zsh is already installed, removing it first..."
    echo -n "Reinstall oh-my-zsh, it will clear current setting.(y/n)?"
    read reset
    if [[ $reset == "y" ]]; then
        rm -rf $HOME/.oh-my-zsh
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    else
        echo "Skipping oh-my-zsh installation..."
        return
    fi
fi
