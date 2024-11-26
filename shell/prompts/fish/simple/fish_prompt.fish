function __prompt_cwd
    set -l realhome (string escape --style=regex -- ~)
    set -l cwd (string replace -r '^'"$realhome"'($|/)' '~$1' $PWD)
    set cwd (string split -m 1 -r -- / $cwd)[-1]
    test -z "$cwd"; and set cwd '/'
    echo $cwd
end

function __prompt_datetime
    echo (date +'%m/%d %T')
end

function fish_prompt
    set -l last_pipestatus $pipestatus
    set -lx __fish_last_status $status # Export for __fish_print_pipestatus.

    set -l normal (set_color normal)

    set -l prompt_status (__fish_print_pipestatus "[" "]" "|" "" "" $last_pipestatus)
    set -l prompt_symbol '$'

    echo -n -s $normal (__prompt_datetime) ' ' (__prompt_cwd) ' ' $prompt_status $prompt_symbol ' '
end
