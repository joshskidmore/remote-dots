#!/usr/bin/env bash

# check for stow
command -v stow >/dev/null 2>&1 || { echo >&2 "The GNU utility 'stow' is required, but doesn't exist. Aborting."; exit 1; }

cd dotfiles

echo "Installing bash..."
for file in .bashrc; do
  [ -f $HOME/$file ] && mv $HOME/$file $HOME/$file.backup
done

stow -t ~ bash

echo "Installing tmux..."
if [ ! -d "$HOME/.ssh" ]; then
  mkdir $HOME/.ssh
  chown -R go-rwx $HOME/.ssh/
fi

stow -t ~ tmux

echo "Installing vim..."
stow -t ~ vim

echo "Installing neovim..."
stow -t ~ neovim

cd ..
