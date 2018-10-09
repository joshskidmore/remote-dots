#!/usr/bin/env bash

echo "Installing modules..."
git submodule init
git submodule update

echo "Installing zsh..."
cd dotfiles && stow -t ~ zsh

echo "Installing zplug..."
zsh -ic "zplug install"