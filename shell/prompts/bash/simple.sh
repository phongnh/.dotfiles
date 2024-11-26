#!/usr/bin/env bash

ps1_titlebar() {
    case $TERM in
        (xterm*|rxvt*)
            printf "%s" "\[\033]0;\w\\007\]"
            ;;
    esac
}

ps1_identity() {
    printf "%s" "\W "
}

ps1_update() {
    local status=$? prompt_char='$' separator=""

    if [ $status -ne 0 ]; then
        prompt_char='!'
    else
        (( $UID == 0 )) && prompt_char='#'
    fi

    PS1="$(ps1_titlebar)\D{%H:%M:%S} $(ps1_identity)${separator}${prompt_char} "
}

ps1_set() {
    PROMPT_COMMAND="ps1_update"
}

if [[ "$PROMPT_COMMAND" = "update_terminal_cwd"* ]]; then
    ps1_set() {
        PROMPT_COMMAND="update_terminal_cwd ; ps1_update"
    }
fi
