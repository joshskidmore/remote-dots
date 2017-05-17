# ~/.bashrc

# path
  export PATH=./:$HOME/bin:$PATH

# if not running interactively, don't do anything
  [[ $- != *i* ]] && return

# allow scrolling arrows for history
  bind '"\e[A": history-search-backward'
  bind '"\e[B": history-search-forward'

# prompt color
  if [ $UID == 0 ]; then
    PROMPT_COLOR="1;33"
    export PROMPT_COMMAND='history -a; history -c; history -r; echo -ne "\033]0;${USER}@${PWD}\007"'
  else
    PROMPT_COLOR="1;34"
    export PROMPT_COMMAND='history -a; history -c; history -r; echo -ne "\033]0;${PWD}\007"'
  fi

# decorated prompt
  export PS1="\[\033[${PROMPT_COLOR}m\]\H [\D{%I:%M%p}]\[\033[00m\] \[\033[1;37m\]\!\[\033[00m\]% "

# no duplicate lines in the history; ignore spaces
  HISTCONTROL=ignoredups:ignorespace:erasedups

# append to history file; don't overwrite
  shopt -s histappend

# set history size/filesize
  HISTSIZE=1000
  HISTFILESIZE=2000

# set term
  export TERM=xterm-256color

# check windows size after commands; update LINES + COLUMNS
  shopt -s checkwinsize

# correct minor directory spellings
  shopt -s cdspell

# ake less more friendly for non-text input files, see lesspipe(1)
  [ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# posix environment
if [ ! $(shopt -oq posix) ]; then
  # load bash aliases
  [ -f "$HOME/.bash_aliases_defaults" ] && . $HOME/.bash_aliases_defaults
  [ -f "$HOME/.bash_aliases" ] && . $HOME/.bash_aliases

  # load bash completions
  [ -f /etc/bash_completion ] && . /etc/bash_completion
  [ -f $HOME/.bash_completion_defaults ] && . $HOME/.bash_completion_defaults
  [ -f $HOME/.bash_completion ] && . $HOME/.bash_completion
fi
