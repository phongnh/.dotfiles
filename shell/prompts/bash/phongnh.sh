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

ps1_git() {
    local branch="" sha1="" line="" attr="" color=0 status=""

    shopt -s extglob # Important, for our nice matchers :)

    command -v git >/dev/null 2>&1 || {
        return 0
    }

    branch=$(git symbolic-ref -q HEAD 2>/dev/null) || return 0 # Not in git repo.
    branch=${branch##refs/heads/}

    status="$(ps1_git_status)"
    [[ -n "$status" ]] && status=" $status"

    # Now we display the branch.
    if [[ -n "$1" ]]; then
        sha1=$(git rev-parse --short --quiet HEAD)
        printf "($sha1:${branch}$status) "
    else
        printf "(${branch}$status) "
    fi
}

ps1_git_status() {
    local git_status="$(git status 2>/dev/null)"

    [[ "${git_status}" = *deleted* ]]                    && printf "%s" "-"
    [[ "${git_status}" = *be[[:space:]]committed:* ]]    && printf "%s" "+"
    [[ "${git_status}" = *Untracked[[:space:]]files:* ]] && printf "%s" "?"
    [[ "${git_status}" = *not[[:space:]]staged* ]]       && printf "%s" "*"
    [[ "${git_status}" = *behind* ]]                     && printf "%s" "<"
    [[ "${git_status}" = *ahead* ]]                      && printf "%s" ">"
}

# ps1_ruby() {
#     if command -v asdf &>/dev/null; then
#         if [[ $(asdf list ruby | grep -c '^ \*') -eq 1 ]]; then
#             echo -n "($(asdf list ruby | grep '^ \*' | tr -d ' *'))"
#         fi
#     elif command -v chruby >/dev/null 2>&1; then
#         if [[ $(chruby | grep -c \*) -eq 1 ]]; then
#             echo -n "($(chruby | grep \* | tr -d '* ')) "
#         else
#             echo -n '(system) '
#         fi
#     elif command -v rbenv >/dev/null 2>&1; then
#         local ruby_version="$(rbenv version-name)"
#         local gemset="$(rbenv gemset active 2>/dev/null | sed -e '$ s/ global//' | sed -e '')"
#         [[ -n "$gemset" ]] && ruby_version="$ruby_version@$gemset"
#         echo "($ruby_version) "
#     elif command -v rvm-prompt >/dev/null 2>&1; then
#         echo "($(rvm-prompt i v p g)) "
#     elif command -v ruby >/dev/null 2>&1; then
#         echo "(ruby-$(ruby -v | cut -d ' ' -f 2)) "
#     fi
# }

if command -v asdf &>/dev/null; then
    ps1_ruby() {
        if [[ $(asdf list ruby | grep -c '^ \*') -eq 1 ]]; then
            echo -n "($(asdf list ruby | grep '^ \*' | tr -d ' *'))"
        fi
    }

elif command -v chruby >/dev/null 2>&1; then
    ps1_ruby() {
        if [[ $(chruby | grep -c \*) -eq 1 ]]; then
            echo -n "($(chruby | grep \* | tr -d '* ')) "
        else
            echo -n '(system) '
        fi
    }
elif command -v rbenv >/dev/null 2>&1; then
    ps1_ruby() {
        local ruby_version="$(rbenv version-name)"
        local gemset="$(rbenv gemset active 2>/dev/null | sed -e '$ s/ global//' | sed -e '')"
        [[ -n "$gemset" ]] && ruby_version="$ruby_version@$gemset"
        echo "($ruby_version) "
    }
elif command -v rvm-prompt >/dev/null 2>&1; then
    ps1_ruby() {
        echo "($(rvm-prompt i v p g)) "
    }
elif command -v ruby >/dev/null 2>&1; then
    ps1_ruby() {
        echo "(ruby-$(ruby -v | cut -d ' ' -f 2)) "
    }
else
    ps1_ruby() { :; }
fi

ps1_update() {
    local status=$? prompt_char='$' separator="\n" time=1 ruby=0 git=1

    if [ $status -ne 0 ]; then
        prompt_char='!'
    else
        (( $UID == 0 )) && prompt_char='#'
    fi

    while [[ $# -gt 0 ]] ; do
        local token="$1" ; shift

        case "$token" in
            --prompt)
                prompt_char="$1"
                shift
                ;;
            --noseparator|--no-separator)
                separator=""
                ;;
            --separator)
                separator="$1"
                shift
                ;;
            --notime)
                time=0
                ;;
            --nogit)
                git=0
                ;;
            --ruby)
                ruby=1
                ;;
            *)
                true # Ignore everything else.
                ;;
        esac
    done

    PS1="$(ps1_titlebar)"
    (( time > 0 )) && PS1="$PS1\D{%H:%M:%S} "
    PS1="$PS1$(ps1_identity)"
    (( git > 0 )) && PS1="$PS1$(ps1_git)"
    (( ruby > 0 )) && PS1="$PS1$(ps1_ruby)"
    PS1="$PS1${separator}${prompt_char} "

    # if (( ruby > 0 )) ; then
    #     if (( notime > 0 )) ; then
    #         PS1="$(ps1_titlebar)$(ps1_identity)$(ps1_ruby)$(ps1_git)${separator}${prompt_char} "
    #     else
    #         PS1="$(ps1_titlebar)\D{%H:%M:%S} $(ps1_identity)$(ps1_ruby)$(ps1_git)${separator}${prompt_char} "
    #     fi
    # else
    #     if (( notime > 0 )) ; then
    #         PS1="$(ps1_titlebar)$(ps1_identity)$(ps1_git)${separator}${prompt_char} "
    #     else
    #         PS1="$(ps1_titlebar)\D{%H:%M:%S} $(ps1_identity)$(ps1_git)${separator}${prompt_char} "
    #     fi
    # fi
}

ps1_set() {
    PROMPT_COMMAND="ps1_update $@"
}

if [[ "$PROMPT_COMMAND" = "update_terminal_cwd"* ]]; then
    ps1_set() {
        PROMPT_COMMAND="update_terminal_cwd ; ps1_update $@"
    }
fi
