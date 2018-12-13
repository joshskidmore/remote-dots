# exports
export PATH=./:$HOME/bin:$PATH
export ZSH_HOME=$HOME/.zsh

ZPLUGIN="${ZDOTDIR:-$HOME}/.zplugin/bin/zplugin.zsh"

if [[ ! -f "$ZPLUGIN" ]]; then
  if (( $+commands[git] )); then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/zdharma/zplugin/master/doc/install.sh)"
  else
    echo 'git not found' >&2
    exit 1
  fi
fi

. "$ZPLUGIN"

autoload -Uz _zplugin
(( ${+_comps} )) && _comps[zplugin]=_zplugin

# functions
. $ZSH_HOME/functions.zsh

# external plugins
. $ZSH_HOME/plugins.zsh

# settings
. $ZSH_HOME/settings.zsh

# aliases
[[ -f $HOME/.aliases ]] && \
  . $HOME/.aliases

# z-style completions
. $ZSH_HOME/zstyle.zsh

# dir colors
eval $(dircolors $ZSH_HOME/dircolors.zsh)

# initialize completions
[[ -f $HOME/.completions ]] && \
  . $HOME/.completions

# keybindings
. $ZSH_HOME/keybindings.zsh

# remove key timeout
KEYTIMEOUT=1

# settings
[[ -f $HOME/.settings ]] && \
  . $HOME/.settings
