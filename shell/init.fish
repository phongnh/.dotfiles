set -gx HISTSIZE 100000
set -gx HISTFILESIZE 100000

set -gx LANG "en_US.UTF-8"
set -gx LANGUAGE "en_US.UTF-8"
set -gx LC_ALL "en_US.UTF-8"

set -gx BUNDLER_EDITOR "vim"
set -gx EDITOR "vim"

# This is a popular option among mycli users.
# set -gx LESS "-XFR"

# Some mycli users like to disable line wrapping.
# set -gx LESS "-SRXF"

# Git: Disable git warning on filtering branch
set -gx FILTER_BRANCH_SQUELCH_WARNING 1

# Github CLI: https://github.com/cli/cli
set -gx GH_PAGER "less -SRXF"
# Github PR View styles: dark / light / notty
set -gx GLAMOUR_STYLE "dark"

# https://github.com/junegunn/fzf
set -gx FZF_DEFAULT_OPTS "--color=dark"
# Enable scroll on FZF preview window
set -gx FZF_PREVIEW_LINES 9999
# Use fd/rg for FZF CTRL-T
if type fd &>/dev/null
    set -gx FZF_CTRL_T_COMMAND "fd --type file --min-depth 1 --strip-cwd-prefix"
    set -gx FZF_ALT_C_COMMAND "fd --type directory --min-depth 1 --strip-cwd-prefix"
else if type rg &>/dev/null
    set -gx FZF_CTRL_T_COMMAND "rg --files"
end
if type bat &>/dev/null
    set -gx FZF_CTRL_T_OPTS "--walker-skip .git,node_modules,target --height=100% --preview 'bat -n --color=always {}' --preview-window down:hidden --bind ';:toggle-preview'"
else
    set -gx FZF_CTRL_T_OPTS "--walker-skip .git,node_modules,target --height=100% --preview 'cat {}' --preview-window down:hidden --bind ';:toggle-preview'"
end
if type tree &>/dev/null
    set -gx FZF_ALT_C_OPTS "--walker-skip .git,node_modules,target --height=100% --preview 'tree -C {}' --preview-window down:hidden --bind ';:toggle-preview'"
end

# https://github.com/lotabout/skim
set -gx SKIM_DEFAULT_OPTIONS "--color=dark"

# https://github.com/sharkdp/bat
set -gx BAT_PAGER "less -RMF"
set -gx BAT_THEME "OneHalfDark"

# GNU Global
set -gx GTAGSLABEL "new-ctags" # native-pygments

# Elixir
# iex: enable history
set -gx ERL_AFLAGS "-kernel shell_history enabled -kernel shell_history_file_bytes 1024000"
# iex: enable autocomplete
set -gx IEX_WITH_WERL "true"

# Reset terminal
alias cls="echo -ne '\033c'"

# Alias
if test (uname) = "Darwin"
    # Reset DNS
    alias reset-dns='sudo killall -HUP mDNSResponder ; sudo killall mDNSResponderHelper ; sudo dscacheutil -flushcache'
else
    # Reset DNS
    alias reset-dns='sudo service nscd restart'
end

# Reset terminal
alias cls="echo -ne '\033c'"

# My IP address
alias my-ip-address="wget http://ipecho.net/plain -O - -q ; echo"

# ssh
if test "$TERM" != "xterm-256color"
    function ssh
        TERM=xterm-256color command ssh $argv
    end
end

# Dotfiles
if not type path &>/dev/null
    function path --argument-names action path
        switch $action
            case dirname
                echo (dirname $path)
            case basename
                echo (basename $path)
            case realpath
                echo (realpath $path)
            case '*'
                echo $path
        end
    end
end

if not type fish_add_path &>/dev/null
    source $DOTFILES/backports/fish_add_path.fish
end

set -gx DOTFILES (path dirname (status dirname))

# Reset PATH
# set -gx PATH /usr/local/bin /usr/local/sbin /usr/bin /bin /usr/sbin /sbin
test -n "$TMUX"; and set -q PATH_TMUX; and set -gx PATH $PATH_TMUX

# Remove /usr/local/sbin and /usr/local/bin from $PATH
# set PATH (string match --invert /usr/local/sbin $PATH)
# set PATH (string match --invert /usr/local/bin $PATH)

fish_add_path --path /usr/local/sbin
fish_add_path --path /usr/local/bin

# Homebrew
source $DOTFILES/shell/brew.fish

# MacPorts
source $DOTFILES/shell/macports.fish

# User bin
fish_add_path --global "$HOME/.local/bin"
fish_add_path --global "$HOME/.dotfiles/bin"
fish_add_path --global "$HOME/bin"

# Tools
for file in $DOTFILES/shell/tools/*.fish
    source "$file"
end

# Functions and Completions
for file in $DOTFILES/shell/{functions,completions}/*.fish
    source "$file"
end

# wd
source $DOTFILES/shell/wd.fish

# fish_git_prompt
set -q __fish_git_prompt_showdirtystate; or set -g __fish_git_prompt_showdirtystate 1
set -q __fish_git_prompt_showuntrackedfiles; or set -g __fish_git_prompt_showuntrackedfiles 1
set -q __fish_git_prompt_showupstream; or set -g __fish_git_prompt_showupstream 1
set -q __fish_git_prompt_showstashstate; or set -g __fish_git_prompt_showstashstate 1
set -q __fish_git_prompt_describe_style; or set -g __fish_git_prompt_describe_style 1
set -q __fish_git_prompt_showcolorhints; or set -g __fish_git_prompt_showcolorhints 1
set -q __fish_git_prompt_shorten_branch_len; or set -g __fish_git_prompt_shorten_branch_len 27
set -q __fish_git_prompt_use_informative_chars; or set -g __fish_git_prompt_use_informative_chars 0

if not contains -- "$__fish_git_prompt_show_informative_status" yes true 1
    set -q __fish_git_prompt_char_dirtystate; or set -g __fish_git_prompt_char_dirtystate '*'
    set -q __fish_git_prompt_char_invalidstate; or set -g __fish_git_prompt_char_invalidstate '!'
    set -q __fish_git_prompt_char_stagedstate; or set -g __fish_git_prompt_char_stagedstate '+'
    # set -q __fish_git_prompt_char_cleanstate; or set -g __fish_git_prompt_char_cleanstate '✓'
    set -q __fish_git_prompt_char_stashstate; or set -g __fish_git_prompt_char_stashstate '@'
    set -q __fish_git_prompt_char_untrackedfiles; or set -g __fish_git_prompt_char_untrackedfiles '?'
    set -q __fish_git_prompt_char_upstream_ahead; or set -g __fish_git_prompt_char_upstream_ahead '>'
    set -q __fish_git_prompt_char_upstream_behind; or set -g __fish_git_prompt_char_upstream_behind '<'
    set -q __fish_git_prompt_char_upstream_diverged; or set -g __fish_git_prompt_char_upstream_diverged '='
    set -q __fish_git_prompt_char_upstream_equal; or set -g __fish_git_prompt_char_upstream_equal ''
    set -q __fish_git_prompt_shorten_branch_char_suffix; or set -g __fish_git_prompt_shorten_branch_char_suffix '…'
end

# Custom
test -s "$HOME/.shell/init.fish"; and source "$HOME/.shell/init.fish"

true
