#!/bin/zsh

setopt nullglob
echo "Installing fonts..."
fonts=Hack
files=(/Library/Fonts/$fonts*.ttf)
if ((${#files[@]})); then
  echo "Removing old $fonts..."
  rm -rf /Library/Fonts/$fonts*.ttf
fi
echo "Installing $fonts..."
cp ./fonts/Hack/$fonts*.ttf $HOME/Library/Fonts/

fonts=JetBrainsMono
files=(/Library/Fonts/$fonts*.ttf)
if ((${#files[@]})); then
  echo "Removing old $fonts..."
  rm -rf /Library/Fonts/$fonts*.ttf
fi
echo "Installing $fonts..."
cp ./fonts/JetBrainsMono/$fonts*.ttf $HOME/Library/Fonts/

fonts=MesloLGS
files=(/Library/Fonts/$fonts*.ttf)
if ((${#files[@]})); then
  echo "Removing old $fonts..."
  rm -rf /Library/Fonts/$fonts*.ttf
fi
echo "Installing $fonts..."
cp ./fonts/MesloLGS/$fonts*.ttf $HOME/Library/Fonts/

fonts=Monoid
files=(/Library/Fonts/$fonts*.ttf)
if ((${#files[@]})); then
  echo "Removing old $fonts..."
  rm -rf /Library/Fonts/$fonts*.ttf
fi
echo "Installing $fonts..."
cp ./fonts/Monoid/$fonts*.ttf $HOME/Library/Fonts/

fonts=OperatorMono
files=(/Library/Fonts/$fonts*.otf)
if ((${#files[@]})); then
  echo "Removing old $fonts..."
  rm -rf /Library/Fonts/$fonts*.otf
fi
echo "Installing $fonts..."
cp ./fonts/OperatorMono/$fonts*.otf $HOME/Library/Fonts/

fonts=SourceCodePro
files=(/Library/Fonts/$fonts*.ttf)
if ((${#files[@]})); then
  echo "Removing old $fonts..."
  rm -rf /Library/Fonts/$fonts*.ttf
fi
echo "Installing $fonts..."
cp ./fonts/SourceCodePro/$fonts*.ttf $HOME/Library/Fonts/
