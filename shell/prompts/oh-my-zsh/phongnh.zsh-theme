ZSH_THEME_GIT_PROMPT_SHA_BEFORE=''
ZSH_THEME_GIT_PROMPT_SHA_AFTER=''

ZSH_THEME_GIT_PROMPT_PREFIX=''
ZSH_THEME_GIT_PROMPT_SUFFIX=''

ZSH_THEME_GIT_PROMPT_DIRTY=' *'
ZSH_THEME_GIT_PROMPT_CLEAN=''

ZSH_THEME_GIT_PROMPT_UNTRACKED=' ?'
ZSH_THEME_GIT_PROMPT_ADDED=' +'
ZSH_THEME_GIT_PROMPT_MODIFIED=''
ZSH_THEME_GIT_PROMPT_RENAMED=' ->'
ZSH_THEME_GIT_PROMPT_DELETED=' x'
ZSH_THEME_GIT_PROMPT_STASHED=' @'
ZSH_THEME_GIT_PROMPT_UNMERGED=' #'

ZSH_THEME_GIT_PROMPT_AHEAD=' >'
ZSH_THEME_GIT_PROMPT_BEHIND=' <'
ZSH_THEME_GIT_PROMPT_DIVERGED=' ='

# ZSH_THEME_GIT_PROMPT_AHEAD_REMOTE=' >>'
# ZSH_THEME_GIT_PROMPT_BEHIND_REMOTE=' <<'
# ZSH_THEME_GIT_PROMPT_DIVERGED_REMOTE=' =='

function phongnh_base() {
    echo -n "%{$reset_color%}%D{%H:%M:%S} %~ "
}

function phongnh_ruby() {
}

if type asdf &>/dev/null; then
    function phongnh_ruby() {
        if [[ $(asdf list ruby | grep -c '^ \*') -eq 1 ]]; then
            echo -n "($(asdf list ruby | grep '^ \*' | tr -d ' *'))"
        fi
    }
elif type chruby &>/dev/null; then
    function phongnh_ruby() {
        if [[ $(chruby | grep -c \*) -eq 1 ]]; then
            echo -n "($(chruby | grep \* | tr -d '* ')) "
        else
            echo -n '(system) '
        fi
    }
elif type rbenv &>/dev/null; then
    function phongnh_ruby() {
        local ruby_version="$(rbenv version-name)"
        local gemset="$(rbenv gemset active 2>/dev/null | sed -e '$ s/ global//' | sed -e '')"
        [[ -n "$gemset" ]] && ruby_version="$ruby_version@$gemset"
        echo -n "($ruby_version) "
    }
elif type rvm-prompt &>/dev/null; then
    function phongnh_ruby() {
        echo -n "($(rvm-prompt i v p g)) "
    }
elif type ruby &>/dev/null; then
    function phongnh_ruby() {
        echo -n "(ruby-$(ruby -v | cut -d ' ' -f 2)) "
    }
else
    function phongnh_ruby() {
    }
fi

function phongnh_status() {
    echo -n "\n%(?:$:!) "
}

function phongnh_git() {
    local git_branch="$(git_prompt_info)"
    [[ -z $git_branch ]] && return
    if [[ -n "$1" ]]; then
        echo -n "($(git_prompt_short_sha):$git_branch$(git_prompt_status))"
    else
        echo -n "($git_branch$(git_prompt_status))"
    fi
}

function phongnh_prompt() {
    phongnh_base
    phongnh_git
    phongnh_status
}

PROMPT='$(phongnh_prompt)'

# vim: filetype=zsh
