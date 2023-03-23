#!/bin/zsh

echo "Installing golang..."
version=1.17.6
version=1.18.1
version=1.18.2
version=1.18.3
version=1.18.4
version=1.18.5
version=1.19
version=1.19.1
version=1.19.2
version=1.19.3
version=1.19.4
version=1.19.5
version=1.19.6
version=1.20
version=1.20.1
version=1.20.2
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
version=3.19.1
version=3.20.0
version=3.20.1
version=21.4
version=21.6
version=21.8
version=21.9
version=21.11
version=21.12
version=22.0
version=22.2
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
