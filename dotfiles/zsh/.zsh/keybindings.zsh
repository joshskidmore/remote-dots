# remove key timeout
KEYTIMEOUT=1


# misc
autoload -Uz copy-earlier-word
zle -N copy-earlier-word
bindkey '^k' insert-last-word
bindkey '^j' copy-earlier-word
