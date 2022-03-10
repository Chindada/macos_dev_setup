#!/bin/zsh

version=2.10.0

curl -fSL https://storage.googleapis.com/flutter_infra_release/releases/stable/macos/flutter_macos_$version-stable.zip --output flutter.zip
mkdir -p ~/sdk_tools/flutter
unzip -q flutter.zip -d ~/sdk_tools/flutter
rm flutter.zip

gsed -i '$ a export PATH="$PATH:$HOME/sdk_tools/flutter/flutter/bin"' ~/.zshrc

brew install --cask android-studio

# $HOME/sdk_tools/flutter/flutter/bin/flutter pub global activate devtools
# gsed -i '$ a export PATH="$PATH:$HOME/sdk_tools/flutter/flutter/.pub-cache/bin"' ~/.zshrc

sudo gem install cocoapods
sudo gem install ffi

sudo arch -x86_64 gem install cocoapods
sudo arch -x86_64 gem install ffi
