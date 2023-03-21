#!/bin/zsh

version=v16.13.2
version=v16.15.1
version=v18.12.1
version=v18.15.0
curl -fSL https://nodejs.org/dist/$version/node-$version.pkg --output node.pkg
sudo installer -pkg ./node.pkg -target /
rm node.pkg
