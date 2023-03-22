#!/bin/zsh

echo "Installing flutter..."
version=2.10.0
version=2.10.4
version=3.0.0
version=3.3.9
version=3.7.7
rm -rf ~/sdk_tools/flutter
curl -fSL https://storage.googleapis.com/flutter_infra_release/releases/stable/macos/flutter_macos_arm64_$version-stable.zip --output flutter.zip
mkdir -p ~/sdk_tools/flutter
echo "Unzipping flutter.zip..."
unzip -q flutter.zip -d ~/sdk_tools/flutter
rm flutter.zip

new_rc='export PATH="$PATH:$HOME/sdk_tools/flutter/flutter/bin"'
if grep -q $new_rc ~/.zshrc; then
  echo "$new_rc already exists"
else
  echo "$new_rc does not exist, adding it to ~/.zshrc"
  gsed -i "$ a $new_rc" ~/.zshrc
fi

echo "Installing android studio..."
brew install --cask android-studio

echo "Installing flutter devtools..."
new_rc='export PATH="$PATH":"$HOME/.pub-cache/bin"'
if grep -q $new_rc ~/.zshrc; then
  echo "$new_rc already exists"
else
  echo "$new_rc does not exist, adding it to ~/.zshrc"
  gsed -i "$ a $new_rc" ~/.zshrc
fi
$HOME/sdk_tools/flutter/flutter/bin/flutter pub global activate devtools

echo "Installing cocoapods..."
sudo gem install cocoapods
sudo gem uninstall --all --force ffi
sudo gem install ffi -- --enable-libffi-alloc
