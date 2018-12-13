COLOR1="242"
COLOR2="110"
COLOR3="150"
COLOR_ROOT="201"
COLOR_NONROOT="7"

PROMPT_LEAN_PATH_PERCENT=${PROMPT_LEAN_PATH_PERCENT-60}
PROMPT_LEAN_NOTITLE=${PROMPT_LEAN_NOTITLE-0}
PROMPT_LEAN_VIMODE=1
PROMPT_LEAN_VIMODE_FORMAT="   %F{red}%f   "


# turns seconds into human readable time, 165392 => 1d 21h 56m 32s
prompt_lean_human_time() {
    local tmp=$1
    local days=$(( tmp / 60 / 60 / 24 ))
    local hours=$(( tmp / 60 / 60 % 24 ))
    local minutes=$(( tmp / 60 % 60 ))
    local seconds=$(( tmp % 60 ))
    (( $days > 0 )) && echo -n "${days}d "
    (( $hours > 0 )) && echo -n "${hours}h "
    (( $minutes > 0 )) && echo -n "${minutes}m "
    echo "${seconds}s "
}

# displays the exec time of the last command if set threshold was exceeded
prompt_lean_cmd_exec_time() {
    local stop=$EPOCHSECONDS
    local start=${cmd_timestamp:-$stop}
    integer elapsed=$stop-$start
    (($elapsed > ${PROMPT_LEAN_CMD_MAX_EXEC_TIME:=1})) && prompt_lean_human_time $elapsed
}

prompt_lean_set_title() {
    # shows the current tty and dir and executed command in the title when a process is active
    print -Pn "\e]0;"
    print -Pn "%l %1d"
    print -n ": $1"
    print -Pn "\a"
}

prompt_lean_preexec() {
    cmd_timestamp=$EPOCHSECONDS
    local lean_no_title=$PROMPT_LEAN_NOTITLE
    (($lean_no_title != 1)) && prompt_lean_set_title "$1"
    unset lean_no_title
}

prompt_lean_pwd() {
    local lean_path="`print -Pn '%~'`"
    if (($#lean_path / $COLUMNS.0 * 100 > ${PROMPT_LEAN_PATH_PERCENT:=60})); then
        print -Pn '...%2/'
        return
    fi
    print "$lean_path"
}

prompt_lean_precmd() {
    rehash

    local lean_vimode_default="%F{red}[NORMAL]%f"
    #If LEAN_VIMODE is set, set lean_vimode_indicator to either PROMPT_LEAN_VIMOD_FORMAT or a default value
    local lean_vimode_indicator="${PROMPT_LEAN_VIMODE:+${PROMPT_LEAN_VIMODE_FORMAT:-${lean_vimode_default}}}"

    prompt_lean_vimode="${${KEYMAP/vicmd/$lean_vimode_indicator}/(main|viins)/}"

    setopt promptsubst

    local details_base="%!%#"

    if [[ "$USER" == "root" ]]; then
      details="%F{"$COLOR_ROOT"}${details_base}%f"
    else
      details="%F{"$COLOR_NONROOT"}${details_base}%f"
    fi

    PROMPT="%(?.%F{"$COLOR2"}.%B%F{203}%K{234})%m%f%k%b [%D{%H:%M:%S}] ${details} "
    RPROMPT="%F{"$COLOR3"}`prompt_lean_cmd_exec_time`%f$prompt_lean_vimode%F{"$COLOR2"}`prompt_lean_pwd`%F{"$COLOR1"}%f%f"

    unset cmd_timestamp # reset value since `preexec` isn't always triggered
}

function zle-keymap-select {
    prompt_lean_precmd
    zle reset-prompt
}

prompt_lean_setup() {
    prompt_opts=(cr percent sp subst)

    zmodload zsh/datetime

    [[ "$PROMPT_LEAN_VIMODE" != '' ]] && zle -N zle-keymap-select

    add-zsh-hook precmd prompt_lean_precmd
    add-zsh-hook preexec prompt_lean_preexec

    return 0
}

prompt_lean_setup "$@"