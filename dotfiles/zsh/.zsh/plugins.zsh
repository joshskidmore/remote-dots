# prompt
# . $ZSH_HOME/prompt.zsh
. $ZSH_HOME/p10k.zsh


# completions
zplugin ice wait'0' blockf lucid
zplugin light zsh-users/zsh-completions


# zsh-history-substring-search
zplugin light zsh-users/zsh-history-substring-search

zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down
bindkey "^[[A" history-substring-search-up
bindkey "^[[B" history-substring-search-down


# auto suggestions
#ZSH_AUTOSUGGEST_USE_ASYNC=true
zplugin ice lucid wait'0' atload'_zsh_autosuggest_start'
zplugin light zsh-users/zsh-autosuggestions


# syntax highlighting
zplugin ice lucid wait'0' atinit"zpcompinit; zpcdreplay"
#zplugin light joshskidmore/fast-syntax-highlighting
zplugin light zdharma-continuum/fast-syntax-highlighting


# history-search-multi-word
# C-r replacement
# zplugin ice lucid wait'0'
# zplugin light zdharma/history-search-multi-word

# fzf
zplugin ice lucid wait'0' from'gh-r' bpick"*$(_get_fzf_arch)*" as'program'
zplugin light junegunn/fzf-bin


# zsh-fzf-history-search
zplugin ice lucid wait'0'
zplugin light joshskidmore/zsh-fzf-history-search


# code pairing
zplugin ice lucid wait'1'
zplugin light hlissner/zsh-autopair


# sysadmin utils
zplugin ice lucid wait'1' make'build'
zplugin light skx/sysadmin-util


# git history
# ga (git add) / glo (git log) / gd (git diff) / gcf (git checkout file)
zplugin ice lucid wait'1'
zplugin light joshskidmore/forgit


# mark / fzm
# C-g
zplugin ice lucid wait'1'
zplugin light urbainvaes/fzf-marks


# powerlevel10k
zinit ice depth=1
zinit light romkatv/powerlevel10k