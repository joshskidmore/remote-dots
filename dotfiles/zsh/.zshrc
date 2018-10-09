# exports
export PATH=./:$HOME/bin:$PATH
export ZSH_HOME=$HOME/.zsh

# external plugins
. $ZSH_HOME/plugins.zsh

# settings
. $ZSH_HOME/settings.zsh

# aliases
. $ZSH_HOME/aliases.zsh

# z-style completions
. $ZSH_HOME/zstyle-completions.zsh

# dir colors
eval $(dircolors $ZSH_HOME/dircolors.zsh)

# prompt
PROMPT_LEAN_GIT_DIRTY_CHECK=fast
. $ZSH_HOME/prompt-lean.zsh

# initialize completions
# compinit

# copy/paste foo
autoload -Uz copy-earlier-word
zle -N copy-earlier-word
bindkey "^k" insert-last-word
bindkey "^j" copy-earlier-word

# remove key timeout
KEYTIMEOUT=1

# network-info
([ -x "$HOME/bin/network-info.sh" ]) && $HOME/bin/network-info.sh
