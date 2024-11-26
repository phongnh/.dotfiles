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

function __prompt_short_datetime
    echo (date +'%m/%d %H:%M')
end

function __prompt_asdf_ruby_version
    if type asdf &>/dev/null; and test (asdf list ruby | grep -c '^ \*') -eq 1
        echo -n -s ' (' (asdf list ruby | grep '^ \*' | tr -d ' *') ')'
    end
end

function __prompt_asdf_nodejs_version
    if type asdf &>/dev/null; and test (asdf list nodejs | grep -c '^ \*') -eq 1
        echo -n -s ' (node-' (asdf list nodejs | grep '^ \*' | tr -d ' *') ')'
    end
end

function __prompt_virtual_env
    set -q VIRTUAL_ENV; and echo -n -s ' (' (path basename "$VIRTUAL_ENV") ')'
end

function fish_prompt
    set -l last_pipestatus $pipestatus
    set -lx __fish_last_status $status # Export for __fish_print_pipestatus.

    set -q fish_color_status; or set -g fish_color_status red
    set -l status_color (set_color $fish_color_status)
    set -l status_bold_color (set_color --bold $fish_color_status)

    set -q __fish_prompt_status_generation; or set -g __fish_prompt_status_generation $status_generation
    test $__fish_prompt_status_generation = $status_generation; and set status_bold_color (set_color $fish_color_status)
    set __fish_prompt_status_generation $status_generation

    set -l prompt_status (__fish_print_pipestatus "[" "]" "|" "$status_color" "$status_bold_color" $last_pipestatus)
    set -l prompt_symbol '$'

    # set -l cwd_color (set_color $fish_color_cwd)
    set -l cwd_color (set_color normal)
    set -l normal (set_color normal)

    echo -n -s $normal (__prompt_datetime) ' ' $cwd_color (__prompt_cwd) $normal (fish_git_prompt)
    echo -n -s (__prompt_asdf_ruby_version)
    echo -n -s (__prompt_asdf_nodejs_version)
    echo -n -s (__prompt_virtual_env)
    echo
    echo -n -s $prompt_status $prompt_symbol ' '
end
