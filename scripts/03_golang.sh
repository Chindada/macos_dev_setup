#!/bin/zsh

echo "Installing golang..."

# check if go is already installed
if command -v go &>/dev/null; then
  ENV_FILE=$(go env GOENV)
  DIRNAME=$(dirname $ENV_FILE)
  rm -rf $DIRNAME
fi

sudo rm -rf /usr/local/go
sudo rm -rf $HOME/go
version="1.23.3"
curl -fSL https://go.dev/dl/go$version.darwin-arm64.pkg --output golang.pkg
sudo installer -pkg ./golang.pkg -target /
rm golang.pkg

new_rc='export GOPATH="$HOME/go"'
if grep -q $new_rc ~/.zshrc; then
  echo "$new_rc already exists"
else
  echo "adding $new_rc to ~/.zshrc"
  gsed -i "$ a $new_rc" ~/.zshrc
fi

new_rc='export PATH="$GOPATH/bin:$PATH"'
if grep -q $new_rc ~/.zshrc; then
  echo "$new_rc already exists"
else
  echo "adding $new_rc to ~/.zshrc"
  gsed -i "$ a $new_rc" ~/.zshrc
fi

echo "Installing protoc..."
version="28.3"
curl -fSL https://github.com/protocolbuffers/protobuf/releases/download/v$version/protoc-$version-osx-aarch_64.zip --output protoc.zip
rm -rf ~/sdk_tools/protoc
mkdir -p ~/sdk_tools/protoc
echo "Unzipping protoc.zip..."
unzip -q protoc.zip -d ~/sdk_tools/protoc
chmod +x ~/sdk_tools/protoc/bin/protoc
rm -rf protoc.zip

new_rc='export PATH="$HOME/sdk_tools/protoc/bin:$PATH"'
if grep -q $new_rc ~/.zshrc; then
  echo "$new_rc already exists"
else
  echo "adding $new_rc to ~/.zshrc"
  gsed -i "$ a $new_rc" ~/.zshrc
fi
