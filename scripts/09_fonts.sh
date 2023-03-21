#!/bin/zsh

echo "Installing fonts..."
sudo rm -rf /Library/Fonts/Source_Code_Pro
cp ./fonts/Source_Code_Pro/*.ttf /Library/Fonts/

sudo rm -rf /Library/Fonts/Jetbrain_Mono
cp ./fonts/Jetbrain_Mono/*.ttf /Library/Fonts/

sudo rm -rf /Library/Fonts/Hack
cp ./fonts/Hack/*.ttf /Library/Fonts/

sudo rm -rf /Library/Fonts/Monoid
cp ./fonts/Monoid/*.ttf /Library/Fonts/

sudo rm -rf /Library/Fonts/Operator_Mono
cp ./fonts/Operator_Mono/*.otf /Library/Fonts/
