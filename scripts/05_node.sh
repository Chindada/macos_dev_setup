#!/bin/zsh

echo "Removing node config files..."
sudo rm -rf $HOME/.npm
sudo rm -rf $HOME/.npmrc

echo "Installing node..."
version=v22.11.0
curl -fSL https://nodejs.org/dist/$version/node-$version.pkg --output node.pkg
sudo installer -pkg ./node.pkg -target /
rm -rf node.pkg

sudo rm -rf $HOME/.npm-global
mkdir $HOME/.npm-global
npm config set prefix $HOME/.npm-global

new_rc='export PATH=$HOME/.npm-global/bin:$PATH'
if grep -q $new_rc ~/.zshrc; then
  echo "$new_rc already exists"
else
  echo "adding $new_rc to ~/.zshrc"
  gsed -i "$ a $new_rc" ~/.zshrc
fi
export PATH=$HOME/.npm-global/bin:$PATH

npm install -g npm
npm install -g pnpm

npm install -g commitizen
npm install -g cz-conventional-changelog
npm install -g conventional-changelog-cli
echo '{ "path": "cz-conventional-changelog" }' >~/.czrc
