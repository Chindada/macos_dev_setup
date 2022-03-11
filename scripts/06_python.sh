#!/bin/zsh

brew install python@3.10

echo 'if [[ "$(uname -m)" == "x86_64" ]]; then
  alias python3=/usr/local/bin/python3.10
  alias pip3=/usr/local/bin/pip3.10
elif [[ "$(uname -m)" == "arm64" ]]; then
  alias python3=/opt/homebrew/bin/python3.10
  alias pip3=/opt/homebrew/bin/pip3.10
fi' >>~/.zshrc
