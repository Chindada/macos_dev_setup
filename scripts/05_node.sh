#!/bin/zsh

echo "Removing node config files..."
sudo rm -rf $HOME/.npm
sudo rm -rf $HOME/.npmrc

echo "Installing node..."
version=v16.13.2
version=v16.15.1
version=v18.12.1
version=v18.15.0
version=v18.17.1
version=v20.11.1
version=v20.12.1
version=v20.14.0
version=v20.15.1
version=v20.17.0
version=v20.18.0
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
npm install -g @redocly/cli@latest
npm install -g commitizen
npm install -g cz-conventional-changelog
npm install -g conventional-changelog-cli
echo '{ "path": "cz-conventional-changelog" }' >~/.czrc
