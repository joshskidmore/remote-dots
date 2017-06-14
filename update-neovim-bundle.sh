#!/usr/bin/env bash

echo "Update remote-dots..."
git pull

echo -e "\nRemoving existing bundles..."
rm -rf dotfiles/neovim/.config/nvim/bundle

echo -e "\nCheckout neovim bundles..."
git checkout dotfiles/neovim/.config/nvim/bundle

echo -e "\nSync submodules..."
git submodule sync

echo -e "\nInit any new submodules..."
git submodule init

echo -e "\nUpdate submodules..."
git submodule update --remote
