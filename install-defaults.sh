#!/usr/bin/env bash

# check for stow
command -v stow >/dev/null 2>&1 || { echo >&2 "The GNU utility 'stow' is required, but doesn't exist. Aborting."; exit 1; }

echo "Installing bash..."
stow -t ~ dotfiles/bash

echo "Installing tmux..."
stow -t ~ dotfiles/tmux

echo "Installing vim..."
stow -t ~ dotfiles/vim
