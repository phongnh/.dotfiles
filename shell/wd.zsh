wd() {
    local dir
    for dir in "${(s(:))WORKING_DIRS}"; do
        cd "$dir/$1" 2>/dev/null
        if [ $? -eq 0 ]; then
            break;
        fi
    done
}

_wd() {
    declare CDPATH=$WORKING_DIRS
    local dir
    for dir in "${(s(:))CDPATH}"; do
        _path_files -W "$dir/" -/
    done
}

compdef _wd wd
