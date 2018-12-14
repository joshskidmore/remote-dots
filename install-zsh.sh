#!/usr/bin/env bash

echo "Installing modules..."
git submodule init
git submodule update

echo "Clean old zsh..."
rm -rf ~/.zsh*
rm ~/.zplug
rm ~/.zcompdump*

echo "Installing zsh..."
cd dotfiles && stow -t ~ zsh