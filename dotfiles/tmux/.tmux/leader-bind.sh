#!/usr/bin/env bash

if [[ -z "$SSH_CLIENT" ]]; then
  tmux unbind C-b
  tmux set -g prefix C-a
  tmux bind C-a send-prefix
fi