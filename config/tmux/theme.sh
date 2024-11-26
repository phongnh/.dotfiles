#!/usr/bin/env bash

READLINK=$(type -p greadlink readlink | head -1)

function resolve_link() {
    $READLINK "$@"
}

function abs_dirname() {
    local  cwd="$(pwd)"
    local path="$1"

    while [ -n "$path" ]; do
        cd "${path%/*}" 2>/dev/null 1>&2
        local name="${path##*/}"
        path="$(resolve_link "$name" || true)"
    done

    pwd
    cd "$cwd" || exit 1
}

function main() {
    local TMUX_THEMES="$(abs_dirname "${BASH_SOURCE-$0}")/themes"
    case "$ITERM_PROFILE" in
        "Solarized Dark"*)
            tmux source-file $TMUX_THEMES/solarized-dark.tmux.conf
            ;;
        "Solarized Light"*)
            tmux source-file $TMUX_THEMES/solarized-light.tmux.conf
            ;;
        "Gruvbox Dark")
            tmux source-file $TMUX_THEMES/gruvbox-dark-simple.tmux.conf
            ;;
        "Gruvbox Light")
            tmux source-file $TMUX_THEMES/gruvbox-light-simple.tmux.conf
            ;;
        Gotham)
            tmux source-file $TMUX_THEMES/gotham.tmux.conf
            ;;
        Nord)
            tmux source-file $TMUX_THEMES/nord-simple.tmux.conf
            ;;
        Dracula)
            tmux source-file $TMUX_THEMES/dracula-simple.tmux.conf
            ;;
        Matrix)
            tmux source-file $TMUX_THEMES/matrix.tmux.conf
            ;;
    esac
}

main $@
