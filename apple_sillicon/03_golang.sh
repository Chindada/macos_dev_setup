#!/bin/zsh

version=1.17.6

curl -fSL https://go.dev/dl/go$version.darwin-arm64.pkg --output golang.pkg
sudo installer -pkg ./golang.pkg -target /
rm golang.pkg

gsed -i '$ a export GOPATH="$HOME/go"' ~/.zshrc
gsed -i '$ a export PATH="$GOPATH/bin:$PATH"' ~/.zshrc

/usr/local/go/bin/go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@latest
/usr/local/go/bin/go install google.golang.org/protobuf/cmd/protoc-gen-go@latest
/usr/local/go/bin/go install github.com/swaggo/swag/cmd/swag@latest
/usr/local/go/bin/go install github.com/ofabry/go-callvis@latest




version=3.19.1

curl -fSL https://github.com/protocolbuffers/protobuf/releases/download/v$version/protoc-$version-osx-x86_64.zip --output protoc.zip
mkdir -p ~/sdk_tools/protoc
unzip -q protoc.zip -d ~/sdk_tools/protoc
chmod +x ~/sdk_tools/protoc/bin/protoc
rm -rf protoc.zip

gsed -i '$ a export PATH="$HOME/sdk_tools/protoc/bin:$PATH"' ~/.zshrc
