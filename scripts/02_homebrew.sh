#!/bin/zsh

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
arch -x86_64 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo 'if [[ "$(uname -m)" == "x86_64" ]]; then
    eval "$(/usr/local/bin/brew shellenv)"
elif [[ "$(uname -m)" == "arm64" ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi
' >~/.zprofile

eval "$(/opt/homebrew/bin/brew shellenv)"

brew install gnu-sed

gsed -i '1 i ZSH_DISABLE_COMPFIX="true"' ~/.zshrc
gsed -i "/^plugins=(git/c plugins=(git colored-man-pages brew macos)" ~/.zshrc

brew install zsh-autosuggestions
gsed -i '$ a source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh' ~/.zshrc

brew install zsh-syntax-highlighting
gsed -i '$ a source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh' ~/.zshrc

brew install git
git config --global user.name "TimHsu@M2MAX-$(date '+%Y%m%d')"
git config --global user.email "maochindada@gmail.com"

# brew install gnupg
# brew install pinentry-mac
# echo "pinentry-program /opt/homebrew/bin/pinentry-mac" >~/.gnupg/gpg-agent.conf

# gpg --full-generate-key
# gpg --list-secret-keys --keyid-format=long
# gpg --armor --export <keyid>

# git config --global gpg.program gpg
# git config --global commit.gpgsign true
# git config --global tag.gpgSign true
