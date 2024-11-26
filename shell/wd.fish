function wd --argument-names project --description "Quickly cd to project in prefefined workspace"
    set -l dir
    for dir in $WORKING_DIRS
        builtin cd "$dir/$project" 2>/dev/null
        if test $status -eq 0
            break
        end
    end
end

function __fish_complete_wd --description "Completions for the wd command"
    set -x CDPATH $WORKING_DIRS
    __fish_complete_cd
end

complete --exclusive --command wd --arguments '(__fish_complete_wd)'
