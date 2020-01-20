# exports
export PATH=./:$HOME/bin:$PATH
export ZSH_HOME=$HOME/.zsh

ZPLUGIN="${ZDOTDIR:-$HOME}/.zinit/bin/zinit.zsh"

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

# settings
[[ -f $HOME/.settings ]] && \
  . $HOME/.settings

# aliases
[[ -f $HOME/.aliases ]] && \
  . $HOME/.aliases

# functions
. $ZSH_HOME/functions.zsh

# external plugins
. $ZSH_HOME/plugins.zsh

# settings
. $ZSH_HOME/settings.zsh

# dir colors
eval $(dircolors $ZSH_HOME/dircolors.zsh)

# completions
[[ -f $HOME/.completions ]] && \
  . $HOME/.completions

# z-style completions
. $ZSH_HOME/zstyle.zsh

# add color to man
_man_colors

# keybindings
. $ZSH_HOME/keybindings.zsh
