function colors-set --argument-names profile
    # Fish Colors
    switch "$profile"
    case "Solarized Dark*"
        source $DOTFILES/shell/colors/custom_solarized_dark.fish
        set -gx FZF_DEFAULT_OPTS     "--color=16"
        set -gx SKIM_DEFAULT_OPTIONS "--color=16"
        set -gx BAT_THEME            "Solarized (dark)"
    case "Solarized Light*"
        source $DOTFILES/shell/colors/custom_solarized_light.fish
        set -gx FZF_DEFAULT_OPTS     "--color=light"
        set -gx SKIM_DEFAULT_OPTIONS "--color=light"
        set -gx BAT_THEME            "Solarized (light)"
        set -gx GLAMOUR_STYLE        "light"
    case "Gruvbox Dark"
        source $DOTFILES/shell/colors/base16_gruvbox_dark.fish
        # if test (type -q -f theme_gruvbox)
        #     theme_gruvbox dark
        # else
        #     source $DOTFILES/shell/colors/base16_default_dark.fish
        # end
        set -gx FZF_DEFAULT_OPTS     "--color=16"
        set -gx SKIM_DEFAULT_OPTIONS "--color=16"
        set -gx BAT_THEME            "gruvbox"
    case "Gruvbox Light"
        source $DOTFILES/shell/colors/base16_gruvbox_light.fish
        # if test (type -q -f theme_gruvbox)
        #     theme_gruvbox light
        # else
        #     source $DOTFILES/shell/colors/base16_default_light.fish
        # end
        set -gx FZF_DEFAULT_OPTS     "--color=light"
        set -gx SKIM_DEFAULT_OPTIONS "--color=light"
        set -gx BAT_THEME            "gruvbox-white"
        set -gx GLAMOUR_STYLE        "light"
    case "EverForest" "Everforest"
        source $DOTFILES/shell/colors/base16_default_dark.fish
    case "Gotham"
        source $DOTFILES/shell/colors/bay_cruise.fish
        set -gx FZF_DEFAULT_OPTS     "--color=16"
        set -gx SKIM_DEFAULT_OPTIONS "--color=16"
        set -gx BAT_THEME            "OneHalfDark"
        set -gx GLAMOUR_STYLE        "notty"
    case "Dracula"
        source $DOTFILES/shell/colors/custom_dracula.fish
        set -gx FZF_DEFAULT_OPTS     "--color=16"
        set -gx SKIM_DEFAULT_OPTIONS "--color=16"
        set -gx BAT_THEME            "Dracula"
        set -gx GLAMOUR_STYLE        "notty"
    case "Nord"
        source $DOTFILES/shell/colors/nord.fish
        set -gx FZF_DEFAULT_OPTS     "--color=16"
        set -gx SKIM_DEFAULT_OPTIONS "--color=16"
        set -gx BAT_THEME            "Nord"
        set -gx GLAMOUR_STYLE        "notty"
    end
end
