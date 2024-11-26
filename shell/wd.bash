wd() {
    local dir
    for dir in ${WORKING_DIRS//:/$'\n'}; do
        builtin cd "$dir/$1" 2>/dev/null
        if [ $? -eq 0 ]; then
            break;
        fi
    done
}

if type _comp_cmd_cd &>/dev/null; then
    # Bash 4.2+: Depends on _comp_cmd_cd from (https://github.com/scop/bash-completion a.k.a bash-completion@2)
    _wd() {
        declare CDPATH=$WORKING_DIRS
        _comp_cmd_cd
    }
elif type _cd &>/dev/null; then
    # Bash 3.2: Depened on _cd (https://salsa.debian.org/debian/bash-completion)
    _wd() {
        declare CDPATH=$WORKING_DIRS
        _cd
    }
else
    _wd() {
        declare CDPATH=$WORKING_DIRS
    }
fi

if shopt -q cdable_vars; then
    complete -v -F _wd -o nospace wd
else
    complete -F _wd -o nospace wd
fi
