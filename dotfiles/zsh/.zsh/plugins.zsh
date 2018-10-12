# zplug
export ZPLUG_HOME=$HOME/.zplug
. $ZPLUG_HOME/init.zsh

# completions
zplug "zsh-users/zsh-completions"

# syntax highlighting
zplug "zsh-users/zsh-syntax-highlighting"

# autosuggestions
zplug "zsh-users/zsh-autosuggestions"
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'

# history substring search
zplug "zsh-users/zsh-history-substring-search"

# zshmarks
# cd ~/blah; bookmark 'my-dir'; jump 'my-dir'
zplug "jocelynmallon/zshmarks"

# code pairing
zplug "hlissner/zsh-autopair", defer:2

zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down
bindkey "^[[A" history-substring-search-up
bindkey "^[[B" history-substring-search-down

# better-npm
zplug "lukechilds/zsh-better-npm-completion", defer:2

# load plugins
zplug load