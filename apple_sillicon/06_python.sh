#!/bin/zsh

version=3.10.2

curl -fSL https://www.python.org/ftp/python/$version/python-$version-macos11.pkg --output python.pkg
sudo installer -pkg ./python.pkg -target /
rm python.pkg

gsed -i '$ a alias pip=pip3' ~/.zshrc
gsed -i '$ a alias python=python3' ~/.zshrc
