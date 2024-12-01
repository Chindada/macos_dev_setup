#!/bin/zsh

echo "Removing old flutter..."
rm -rf ~/sdk_tools/flutter
rm -rf $HOME/.pub-cache
rm -rf $HOME/.dartServer

echo "Installing flutter..."
version=3.24.5
echo "Downloading flutter $version..."
# check flutter.zip exists
if [ -f "flutter_macos_arm64_$version-stable.zip" ]; then
  echo "flutter_macos_arm64_$version-stable.zip exists"
else
  echo "flutter_macos_arm64_$version-stable.zip does not exist"
  curl -fSL https://storage.googleapis.com/flutter_infra_release/releases/stable/macos/flutter_macos_arm64_$version-stable.zip --output flutter_macos_arm64_$version-stable.zip
fi

mkdir -p ~/sdk_tools/flutter
echo "Unzipping..."
unzip -q flutter_macos_arm64_$version-stable.zip -d ~/sdk_tools/flutter

new_rc='export PATH="$PATH:$HOME/sdk_tools/flutter/flutter/bin"'
if grep -q $new_rc ~/.zshrc; then
  echo "$new_rc already exists"
else
  echo "adding $new_rc to ~/.zshrc"
  gsed -i "$ a $new_rc" ~/.zshrc
fi

echo "Installing android studio..."
brew install --cask android-studio

echo "Installing flutter devtools..."
new_rc='export PATH="$PATH":"$HOME/.pub-cache/bin"'
if grep -q $new_rc ~/.zshrc; then
  echo "$new_rc already exists"
else
  echo "adding $new_rc to ~/.zshrc"
  gsed -i "$ a $new_rc" ~/.zshrc
fi

# activesupport version depends on ruby version
# ruby --version
# ruby 2.6.10p210 (2022-04-12 revision 67958) [universal.arm64e-darwin22]
# under this version, activesupport version is 6.1.7.3
# https://rubygems.org/gems/activesupport

echo "Installing cocoapods..."
sudo gem install cocoapods
new_rc='export PATH=$HOME/.gem/bin:$PATH'
if grep -q $new_rc ~/.zshrc; then
  echo "$new_rc already exists"
else
  echo "adding $new_rc to ~/.zshrc"
  gsed -i "$ a $new_rc" ~/.zshrc
fi

echo "y" | $HOME/sdk_tools/flutter/flutter/bin/dart pub cache clean
$HOME/sdk_tools/flutter/flutter/bin/flutter config --no-analytics
$HOME/sdk_tools/flutter/flutter/bin/flutter doctor
