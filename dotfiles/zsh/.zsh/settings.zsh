# history
HISTFILE=~/.zhistory
HISTSIZE=1048576
SAVEHIST=$HISTSIZE


# options
# notes:
#   `setopt` to print explicitly set/unset options
#   `set no[OPTION]` = `unset [OPTION`
#   note: option names don't require _
setopt always_to_end              # if completion is performed in word, and full completion is inserted, move cursor to end
setopt append_history             # [history] append to history, rather than replace it
setopt auto_cd                    # if "command" is a directory, automatically cd into it
setopt auto_menu                  # show completion menu on succesive tab press
unsetopt case_glob                # if unset, make globbing insensitive to case
setopt chase_links                # resolve symbolic links to their true value
# setopt complete_aliases           # [BREAKS Z] dont internally substitute before completion is attempted
setopt complete_in_word           # leave cursor where it is in word; dont go to end
unsetopt correct                  # try to correct the spelling of commands
setopt extended_history           # [history] write history file in :start:elapsed:command
unsetopt flowcontrol              # if unset, output flow control via start/stop characters
setopt hist_expire_dups_first     # [history] expire a dup event when trimming history
setopt hist_find_no_dups          # [history] dont display previously found
setopt hist_ignore_dups           # [history] dont record an event that was just recorded
setopt hist_ignore_all_dups       # [history] delete old recorded event if a new event is a dup
setopt hist_ignore_space          # [history] ignore history starting with spaces
setopt inc_append_history         # [history] write history immediately; not on exit
setopt extendedhistory            # [history] include execution time
setopt incappendhistorytime       # [history] save history when command completes
unsetopt menu_complete            # do not autoselect the first completion entry
unsetopt nomatch                  # complete *
setopt share_history              # [history] share history among sessions


# prevent % at EOL
PROMPT_EOL_MARK=''