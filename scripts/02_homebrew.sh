#!/bin/zsh

echo "Installing homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
arch -x86_64 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo 'if [[ "$(uname -m)" == "x86_64" ]]; then
    eval "$(/usr/local/bin/brew shellenv)"
elif [[ "$(uname -m)" == "arm64" ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi
' >~/.zprofile

# use arm64 version to continue
eval "$(/opt/homebrew/bin/brew shellenv)"

# install gsed
brew install gnu-sed

# replace plugins
gsed -i "/^plugins=(git/c plugins=(git colored-man-pages brew macos)" ~/.zshrc

new_rc='ZSH_DISABLE_COMPFIX="true"'
if grep -q $new_rc ~/.zshrc; then
    echo "$new_rc already exists"
else
    echo "$new_rc does not exist, adding it to ~/.zshrc"
    gsed -i "1 i $new_rc" ~/.zshrc
fi

brew install zsh-autosuggestions
new_rc='source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh'
if grep -q $new_rc ~/.zshrc; then
    echo "$new_rc already exists"
else
    echo "$new_rc does not exist, adding it to ~/.zshrc"
    gsed -i "$ a $new_rc" ~/.zshrc
fi

brew install zsh-syntax-highlighting
new_rc='source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh'
if grep -q $new_rc ~/.zshrc; then
    echo "$new_rc already exists"
else
    echo "$new_rc does not exist, adding it to ~/.zshrc"
    gsed -i "$ a $new_rc" ~/.zshrc
fi

brew install git
git config --global user.name "Tim Hsu@M2MAX-$(date '+%Y%m%d')"
git config --global user.email "maochindada@gmail.com"
