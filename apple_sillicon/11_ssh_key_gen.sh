#!/bin/zsh

ssh-keygen -t ed25519 -f ~/.ssh/id_ed25519 -q -N "" -C "maochindada@gmail.com"

eval "$(ssh-agent -s)"

echo 'Host *
  AddKeysToAgent yes
  UseKeychain yes
  IdentityFile ~/.ssh/id_ed25519
  StrictHostKeyChecking no' > ~/.ssh/config

ssh-add -K ~/.ssh/id_ed25519

pbcopy < ~/.ssh/id_ed25519.pub
cat ~/.ssh/id_ed25519.pub
