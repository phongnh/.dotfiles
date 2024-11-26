colors-set() {
    local profile="$1"
    if [ "$profile" = 'Solarized Dark' ]; then
        export FZF_DEFAULT_OPTS="--color=16"
        export SKIM_DEFAULT_OPTIONS="--color=16"
        export BAT_THEME="Solarized (dark)"
    elif [ "$profile" = 'Solarized Light' ]; then
        export FZF_DEFAULT_OPTS="--color=light"
        export SKIM_DEFAULT_OPTIONS="--color=light"
        export BAT_THEME="Solarized (light)"
        export GLAMOUR_STYLE="light"
    elif [ "$profile" = 'Gruvbox Dark' ]; then
        export FZF_DEFAULT_OPTS="--color=16"
        export SKIM_DEFAULT_OPTIONS="--color=16"
        export BAT_THEME="gruvbox"
    elif [ "$profile" = 'Gruvbox Light' ]; then
        export FZF_DEFAULT_OPTS="--color=light"
        export SKIM_DEFAULT_OPTIONS="--color=light"
        export BAT_THEME="gruvbox-white"
        export GLAMOUR_STYLE="light"
    elif [ "$profile" = 'Gotham' ]; then
        export FZF_DEFAULT_OPTS="--color=16"
        export SKIM_DEFAULT_OPTIONS="--color=16"
        export BAT_THEME="OneHalfDark"
        export GLAMOUR_STYLE="notty"
    elif [ "$profile" = 'Dracula' ]; then
        export FZF_DEFAULT_OPTS="--color=16"
        export SKIM_DEFAULT_OPTIONS="--color=16"
        export BAT_THEME="Dracula"
        export GLAMOUR_STYLE="notty"
    elif [ "$profile" = 'Nord' ]; then
        export FZF_DEFAULT_OPTS="--color=16"
        export SKIM_DEFAULT_OPTIONS="--color=16"
        export BAT_THEME="Nord"
        export GLAMOUR_STYLE="notty"
    fi
}
