export EDITOR=vi

# history
HISTFILE=~/.zhistory
HISTSIZE=1048576
SAVEHIST=$HISTSIZE

# options
setopt APPEND_HISTORY
setopt EXTENDED_HISTORY               # write history file in :start:elapsed;command
setopt HIST_EXPIRE_DUPS_FIRST         # expire a dup event when trimming history
setopt HIST_IGNORE_DUPS               # dont record an event that was just recorded again
setopt HIST_IGNORE_ALL_DUPS           # delete old recorded event if a new event is a dup
setopt HIST_FIND_NO_DUPS              # dont display previously found
setopt HIST_IGNORE_SPACE              # ignore history starting with spaces
setopt INC_APPEND_HISTORY             # write history immediately; not on exit
setopt SHARE_HISTORY                  # share history among sessions
setopt NONOMATCH                      # complete *
setopt autocd                         # set automatic cd (typing dir name with no `cd`)

# initialize completion
autoload -Uz compinit && compinit
unsetopt CORRECT
# setopt complete_aliases

# enable vim mode
bindkey -v
export KEYTIMEOUT=1                   # remove mode change delay

# emacs keybindings
bindkey '^p' history-substring-search-up
bindkey '^n' history-substring-search-down
bindkey '^w' backward-kill-word
bindkey '^f' autosuggest-accept
bindkey '^u' backward-kill-line
bindkey '^a' beginning-of-line
bindkey '^e' end-of-line

# edit command line keybindings
autoload -U edit-command-line
zle -N edit-command-line
bindkey '^xe' edit-command-line
bindkey '^x^e' edit-command-line

# fix esc-/ chord (perform search
vi-search-fix() {
  zle vi-cmd-mode
  zle .vi-history-search-backward
}

autoload vi-search-fix
zle -N vi-search-fix
bindkey -M viins '\e/' vi-search-fix

bindkey "^?" backward-delete-char     # fix backspace

disable r                             # disable `r` zsh builtin

# allow copy/paste with the system clipboard
# behave as expected with vim commands ( y/p/d/c/s )
[[ -n $DISPLAY ]] && (( $+commands[xclip] )) && {

  function cutbuffer() {
    zle .$WIDGET
    echo $CUTBUFFER | xclip -selection clipboard
  }

  zle_cut_widgets=(
    vi-backward-delete-char
    vi-change
    vi-change-eol
    vi-change-whole-line
    vi-delete
    vi-delete-char
    vi-kill-eol
    vi-substitute
    vi-yank
    vi-yank-eol
  )
  for widget in $zle_cut_widgets
  do
    zle -N $widget cutbuffer
  done

  function putbuffer() {
    zle copy-region-as-kill "$(xclip -o)"
    zle .$WIDGET
  }

  zle_put_widgets=(
    vi-put-after
    vi-put-before
  )
  for widget in $zle_put_widgets
  do
    zle -N $widget putbuffer
  done
}