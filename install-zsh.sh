#!/usr/bin/env bash

echo "Installing modules..."
git submodule init
git submodule update

echo "Installing zsh..."
stow -t ~ zsh

echo "Installing zplug..."
zsh; zplug install