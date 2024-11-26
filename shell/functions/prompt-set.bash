prompt-set() {
    source $DOTFILES/shell/prompts/bash/$1.sh
    shift
    ps1_set $@
}
