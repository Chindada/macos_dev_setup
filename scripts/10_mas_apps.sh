#!/bin/zsh

echo "Installing mas..."
brew install mas

echo "Installing mas apps..."

# Apple Configurator 2
mas install 1037126344 &
# Microsoft Remote Desktop
mas install 1295203466 &
# Speedtest
mas install 1153157709 &

#LINE
mas install 539883307 &

# Microsoft Outlook
mas install 985367838 &
# Microsoft PowerPoint
mas install 462062816 &
# Microsoft Excel
mas install 462058435 &
# Microsoft Word
mas install 462054704 &
# F5 Access
mas install 1243219105 &

wait
