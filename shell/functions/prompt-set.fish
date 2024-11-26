function prompt-set --argument-names name
    for file in $DOTFILES/shell/prompts/fish/$name/*.fish
        source $file
    end
end
