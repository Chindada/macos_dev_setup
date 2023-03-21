#!/bin/zsh

version=2.10.0
version=2.10.4
version=3.0.0
version=3.3.9
version=3.7.7
rm -rf ~/sdk_tools/flutter
curl -fSL https://storage.googleapis.com/flutter_infra_release/releases/stable/macos/flutter_macos_arm64_$version-stable.zip --output flutter.zip
mkdir -p ~/sdk_tools/flutter
unzip -q flutter.zip -d ~/sdk_tools/flutter
rm flutter.zip

gsed -i '$ a export PATH="$PATH:$HOME/sdk_tools/flutter/flutter/bin"' ~/.zshrc

brew install --cask android-studio

$HOME/sdk_tools/flutter/flutter/bin/flutter pub global activate devtools

sudo gem install cocoapods
sudo gem uninstall ffi && sudo gem install ffi -- --enable-libffi-alloc
