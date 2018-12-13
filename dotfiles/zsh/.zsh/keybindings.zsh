# remove key timeout
KEYTIMEOUT=1

# enable vim mode
bindkey -v

# emacs bindings emacs
bindkey '^p' history-substring-search-up
bindkey '^n' history-substring-search-down
bindkey '^w' backward-kill-word
bindkey '^f' autosuggest-accept
bindkey '^u' backward-kill-line
bindkey '^a' beginning-of-line
bindkey '^e' end-of-line

# edit command line keybinds
autoload -U edit-command-line
zle -N edit-command-line
bindkey '^x^e' edit-command-line
bindkey '^xe' edit-command-line

# fix esc-/ chord (perform search)
vi-search-fix() {
  zle vi-cmd-mode
  zle .vi-history-search-backward
}

autoload vi-search-fix
zle -N vi-search-fix
bindkey -M viins '\e/' vi-search-fix

# fix backspace
bindkey "^?" backward-delete-char

# disable `r` zsh builtin
disable r

# misc
autoload -Uz copy-earlier-word
zle -N copy-earlier-word
bindkey '^k' insert-last-word
bindkey '^j' copy-earlier-word