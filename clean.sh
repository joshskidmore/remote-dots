#!/usr/bin/env bash

[[ -h ~/bin ]] && \
  echo "Removing ~/bin symlink ..." && \
  rm ~/bin

[[ -h ~/.config ]] && \
  echo "Removing ~/.config symlink ..." && \
  rm ~/.config

[[ -d ~/vim ]] && \
  echo "Removing ~/vim ..." && \
  rm -rf ~/vim

echo "Clearing ~/.vim/tmp/* ..."
rm -rf ~/.vim/tmp/*

[[ -h ~/.vim ]] && \
  echo "Removing ~/.vim symlink ..." && \
  rm ~/.vim

echo "Installing defaults..."
./install-defaults.sh