prompt-set() {
    if [ "$ZSH" = "$HOME/.oh-my-zsh" ]; then
        source $DOTFILES/shell/prompts/oh-my-zsh/$1.zsh-theme
    elif [ -n "$ZIM_HOME" ]; then
        source $DOTFILES/shell/prompts/zim/$1/$1.zsh-theme
    fi
}
