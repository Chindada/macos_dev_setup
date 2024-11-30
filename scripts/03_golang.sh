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
version="1.17.6"
version="1.18.1"
version="1.18.2"
version="1.18.3"
version="1.18.4"
version="1.18.5"
version="1.19"
version="1.19.1"
version="1.19.2"
version="1.19.3"
version="1.19.4"
version="1.19.5"
version="1.19.6"
version="1.20"
version="1.20.1"
version="1.20.2"
version="1.20.3"
version="1.20.4"
version="1.19.9"
version="1.19.10"
version="1.19.11"
version="1.19.12"
version="1.20.7"
version="1.20.8"
version="1.21.1"
version="1.21.3"
version="1.20.11"
version="1.20.12"
version="1.21.7"
version="1.21.8"
version="1.22.2"
version="1.22.3"
version="1.22.4"
version="1.22.5"
version="1.22.6"
version="1.23.1"
version="1.23.2"
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
version="3.19.1"
version="3.20.0"
version="3.20.1"
version="21.4"
version="21.6"
version="21.8"
version="21.9"
version="21.11"
version="21.12"
version="22.0"
version="22.2"
version="22.3"
version="22.4"
version="23.0"
version="23.3"
version="23.4"
version="24.0"
version="24.2"
version="24.3"
version="24.4"
version="25.0"
version="25.1"
version="25.2"
version="25.3"
version="26.1"
version="27.1"
version="27.2"
version="27.3"
version="28.0"
version="28.1"
version="28.2"
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
