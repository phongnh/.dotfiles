function phongnh_base() {
    echo -n "%{$reset_color%}%D{%H:%M:%S} %c "
}

function phongnh_status() {
    echo -n '%(?:$:!) '
}

function phongnh_prompt() {
    phongnh_base
    phongnh_status
}

PROMPT='$(phongnh_prompt)'

# vim: filetype=zsh
