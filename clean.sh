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

[[ -d ~/.vim/bundle ]] && \
  echo "Removing ~/.vim/bundle ..." && \
  rm -rf ~/.vim/bundle

[[ -d ~/.vim/views ]] && \
  echo "Removing ~/.vim/views ..." && \
  rm -rf ~/.vim/views

[[ -h ~/.vim ]] && \
  echo "Removing ~/.vim symlink ..." && \
  rm ~/.vim

echo "Installing defaults..."
./install-defaults.sh