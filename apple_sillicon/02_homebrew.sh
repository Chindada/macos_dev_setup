#!/bin/zsh

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

brew install gnu-sed

gsed -i '1 i ZSH_DISABLE_COMPFIX="true"' ~/.zshrc
gsed -i "/^plugins=(git/c plugins=(git colored-man-pages brew macos)" ~/.zshrc

brew install zsh-autosuggestions
gsed -i '$ a source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh' ~/.zshrc

brew install zsh-syntax-highlighting
gsed -i '$ a source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh' ~/.zshrc

tdate=$(date "+%Y%m%d")
brew install git
git config --global user.name "TimHsu@M1PRO-$tdate"
git config --global user.email "maochindada@gmail.com"
