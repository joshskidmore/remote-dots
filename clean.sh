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

[[ -d ./dotfiles/vim/.vim/bundle ]] && \
  echo "Removing ./dotfiles/vim/.vim/bundle ..." && \
  rm -rf ./dotfiles/vim/.vim/bundle

[[ -d ./dotfiles/vim/.vim/views ]] && \
  echo "Removing ./dotfiles/vim/.vim/views ..." && \
  rm -rf ./dotfiles/vim/.vim/views

[[ -d ./dotfiles/vim/.vim/ctrlp ]] && \
  echo "Removing ./dotfiles/vim/.vim/ctrlp ..." && \
  rm -rf ./dotfiles/vim/.vim/ctrlp

[[ -d ./dotfiles/vim/.vim/undo ]] && \
  echo "Removing ./dotfiles/vim/.vim/undo ..." && \
  rm -rf ./dotfiles/vim/.vim/undo

[[ -h ~/.vim ]] && \
  echo "Removing ~/.vim symlink ..." && \
  rm ~/.vim

echo "Installing defaults..."
./install-defaults.sh