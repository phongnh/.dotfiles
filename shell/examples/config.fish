if status is-login
    # echo "** LOGIN SHELL **"
    # Backup original PATH for Tmux
    if test -z "$TMUX"
        set -q PATH_TMUX; or set -gx --path PATH_TMUX $PATH
    end
end

if status is-interactive
    # echo "** INTERACTIVE SHELL **"
    # Reset PATH
    # set -gx PATH /usr/local/bin /usr/local/sbin /usr/bin /bin /usr/sbin /sbin
    # set -q __fish_git_prompt_shorten_branch_char_suffix; or set -g __fish_git_prompt_shorten_branch_char_suffix '…'
    test -s $HOME/.dotfiles/shell/init.fish ;and source $HOME/.dotfiles/shell/init.fish
    colors-set "$TERM_PROFILE"
    prompt-set "phongnh"
end
