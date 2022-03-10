#!/bin/zsh

version=v16.13.2

curl -fSL https://nodejs.org/dist/$version/node-$version.pkg --output node.pkg
sudo installer -pkg ./node.pkg -target /
rm node.pkg
