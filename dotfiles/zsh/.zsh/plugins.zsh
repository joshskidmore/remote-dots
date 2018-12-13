# prompt
PROMPT_LEAN_GIT_DIRTY_CHECK='fast'
. $ZSH_HOME/prompt-lean.zsh


# zsh-history-substring-search
zplugin light zsh-users/zsh-history-substring-search

zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down
bindkey "^[[A" history-substring-search-up
bindkey "^[[B" history-substring-search-down


# auto suggestions
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'
ZSH_AUTOSUGGEST_USE_ASYNC=true
zplugin ice lucid wait'0' atload'fg=8; _zsh_autosuggest_start'
zplugin light zsh-users/zsh-autosuggestions


# syntax highlighting
zplugin ice lucid wait'0' atinit"zpcompinit; zpcdreplay"
zplugin light zdharma/fast-syntax-highlighting


# history-search-multi-word
# C-r replacement
zplugin ice lucid wait'0'
zplugin light zdharma/history-search-multi-word


# code pairing
zplugin ice lucid wait'1'
zplugin light hlissner/zsh-autopair


# mark / fzm
# C-g
zplugin ice lucid wait'1'
zplugin light urbainvaes/fzf-marks


# sysadmin utils
zplugin ice lucid wait'1'
zplugin light skx/sysadmin-util


# command architect
# C-t
zplugin ice lucid wait'1'
zplugin light psprint/zsh-cmd-architect


# git history
# ga (git add) / glo (git log) / gd (git diff) / gcf (git checkout file)
zplugin ice lucid wait'1'
zplugin light wfxr/forgit


# fzf
[[ "$(uname -m)" == "x86_64" ]] && \
  zplugin ice lucid wait'2' from'gh-r' as'program' && \
  zplugin light junegunn/fzf-bin