# **macOS Developer Setup**

[![OS](https://img.shields.io/badge/OS-macOS-orange?logo=macos&logoColor=orange)](https://www.apple.com/tw/macos)
![Ventura](./assets/s004.png)

## Install for command CLI tools in macOS

```bash
sudo xcode-select --install
sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer
```

---

## Install rosetta2 from command line

```bash
sudo softwareupdate --install-rosetta --agree-to-license
```

---

## (Optional) CalDigit Thunderbolt Station Driver(TS3 Plus)

- Reduce secruity policy in recovery os
- [Downdload Link](https://downloads.caldigit.com/CalDigit-Thunderbolt-Station-Mac-Drivers.zip)
- Manual install driver

---

## Clone project using HTTPS

```bash
mkdir -p ~/dev_projects
git clone https://github.com/Chindada/macos_dev_setup.git ~/dev_projects/macos_dev_setup
```

---

## Install

```bash
cd ~/dev_projects/macos_dev_setup
./install.sh
```

---

## Post install

- Generate SSH key or import SSH key
- If new, add SSH key to github

```bash
ssh-keygen -t ed25519 -f ~/.ssh/id_ed25519 -q -N "" -C "maochindada@gmail.com"
eval "$(ssh-agent -s)"

echo 'Host *
  AddKeysToAgent yes
  UseKeychain yes
  IdentityFile ~/.ssh/id_ed25519
  StrictHostKeyChecking no' >~/.ssh/config

ssh-add -K ~/.ssh/id_ed25519
pbcopy <~/.ssh/id_ed25519.pub
cat ~/.ssh/id_ed25519.pub
```

- Clone project using SSH

```bash
rm -rf ~/dev_projects/macos_dev_setup
git clone git@github.com:Chindada/macos_dev_setup.git ~/dev_projects/macos_dev_setup
```

- Flutter doctor and ulimit

```bash
flutter doctor --android-licenses
echo "ulimit -n 1024">>~/.zshrc
```

- Generate GPG key

```bash
brew install gnupg
brew install pinentry-mac
echo "pinentry-program /opt/homebrew/bin/pinentry-mac" >~/.gnupg/gpg-agent.conf

gpg --full-generate-key
gpg --list-secret-keys --keyid-format=long
gpg --armor --export <keyid>

git config --global gpg.program gpg
git config --global commit.gpgsign true
git config --global tag.gpgSign true
```

- Optional brew formula

```bash
brew install pre-commit
brew install cmake
brew install tmux
brew install gcc
```

## Final check

```bash
git config --list
go version
flutter --version
node --version
```

## Author

- [**Tim Hsu**](https://github.com/Chindada)
