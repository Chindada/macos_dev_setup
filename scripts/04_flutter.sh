#!/bin/zsh

echo "Installing Xcode..."
sudo sh -c 'xcode-select -s /Applications/Xcode.app/Contents/Developer && xcodebuild -runFirstLaunch'
sudo xcodebuild -license

echo "Removing old flutter..."
rm -rf ~/sdk_tools/flutter
rm -rf $HOME/.pub-cache
rm -rf $HOME/.dartServer

echo "Installing flutter..."
version=2.10.0
version=2.10.4
version=3.0.0
version=3.3.9
version=3.7.7
version=3.7.8
version=3.7.9
version=3.13.0
version=3.13.3
version=3.13.4
version=3.13.5
version=3.13.6
version=3.13.9
version=3.16.0
version=3.16.2
version=3.16.3
version=3.16.5
version=3.16.6
version=3.16.7
version=3.16.8
version=3.19.2
version=3.19.5
version=3.22.0
version=3.22.1
version=3.22.3
version=3.24.3
version=3.24.4
version=3.24.5
echo "Downloading flutter $version..."
# check flutter.zip exists
if [ -f "flutter_macos_arm64_$version-stable.zip" ]; then
  echo "flutter_macos_arm64_$version-stable.zip exists"
else
  echo "flutter_macos_arm64_$version-stable.zip does not exist"
  rm -rf flutter_macos_arm64_*.zip
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
$HOME/sdk_tools/flutter/flutter/bin/dart --disable-analytics
$HOME/sdk_tools/flutter/flutter/bin/dart pub global activate devtools

# activesupport version depends on ruby version
# ruby --version
# ruby 2.6.10p210 (2022-04-12 revision 67958) [universal.arm64e-darwin22]
# under this version, activesupport version is 6.1.7.3
# https://rubygems.org/gems/activesupport

echo "Installing cocoapods..."
sudo gem install cocoapods -n /usr/local/bin
sudo gem install activesupport

echo "y" | $HOME/sdk_tools/flutter/flutter/bin/dart pub cache clean
$HOME/sdk_tools/flutter/flutter/bin/flutter config --no-analytics
$HOME/sdk_tools/flutter/flutter/bin/flutter doctor
