# get fzf releases' architecture
_get_fzf_arch() {
  case $(uname -m) in
    armv5l)       echo 'arm5'               ;;
    armv6l)       echo 'arm6'               ;;
    armv7l)       echo 'arm7'               ;;
    armv8l)       echo 'arm8'               ;;
    x86_64)       echo 'amd64'              ;;
    *)            echo '*'                  ;;
  esac
}


# add colors to man
_man_colors() {
  export LESS_TERMCAP_mb=$'\e[01;31m'       # begin blinking
  export LESS_TERMCAP_md=$'\e[01;38;5;74m'  # begin bold
  export LESS_TERMCAP_me=$'\e[0m'           # end mode
  export LESS_TERMCAP_se=$'\e[0m'           # end standout-mode
  export LESS_TERMCAP_so=$'\e[38;5;246m'    # begin standout-mode - info box
  export LESS_TERMCAP_ue=$'\e[0m'           # end underline
  export LESS_TERMCAP_us=$'\e[04;38;5;201m' # begin underline
}


# extract various filetypes
.extract () {
  if [[ -f $1 ]]; then
    case $1 in
      *.tar.bz2)   tar xvjf $1    ;;
      *.tar.gz)    tar xvzf $1    ;;
      *.bz2)       bunzip2 $1     ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1      ;;
      *.tar)       tar xvf $1     ;;
      *.tbz2)      tar xvjf $1    ;;
      *.tgz)       tar xvzf $1    ;;
      *.zip)       unzip $1       ;;
      *.Z)         uncompress $1  ;;
      *.7z)        7z x $1        ;;
      *.deb)       dpkg -x $1 ./  ;;
      *)           echo "I don't know how to extract '$1'..." ;;
    esac
  else
    echo "'$1' is not a valid file!"
  fi
}


# helper to update from this remote-dots repo
,rdotsupdate() {
  pushd > /dev/null

  cd ~/remote-dots
  echo "updating latest (git pull)..."
  git pull

  echo -e "\n(re)stow ~/bin to pickup new files..."
  stow -t ~ bin

  echo -e "\ninstalling + updating modules (git submodule init; git submodule update)..."
  git submodule init
  git submodule update

  echo -e "\nupdating zsh/zplugin (,zshupdate)..."
  ,zshupdate

  echo -e "\nupdating neovim (,vimupdate)..."
  ,vimupdate

  [[ -n "$TMUX" ]] && \
    echo -e "\nreloading tmux.conf (tmux source-file ~/.tmux.conf)..." && \
    tmux source-file ~/.tmux.conf

  echo -e "\nreloading ~/.zshrc (source ~/.zshrc)"
  source ~/.zshrc

  popd > /dev/null
}

# system update
,sysupdate() {
  if [[ -n $(command -v apt) ]]; then
    sudo apt -y update
    sudo apt -y upgrade
    sudo apt -y dist-upgrade
    sudo apt -y autoclean
    sudo apt -y autoremove
  elif [[ -n $(command -v powerpill) ]]; then
    sudo powerpill -Syu
  elif [[ -n $(command -v yay) ]]; then
    yay -Syu
  fi
}