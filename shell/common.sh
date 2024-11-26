# Not to be disturbed by Ctrl-S and Ctrl-Q in terminals
if type stty &>/dev/null; then
    stty -ixon
fi

export HISTSIZE=100000
export HISTFILESIZE=100000

export LANG="en_US.UTF-8"
export LANGUAGE="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

export BUNDLER_EDITOR="vim"
export EDITOR="vim"

# This is a popular option among mycli users.
# export LESS="-XFR"

# Some mycli users like to disable line wrapping.
# export LESS="-SRXF"

# Git: Disable git warning on filtering branch
export FILTER_BRANCH_SQUELCH_WARNING=1

# Github CLI: https://github.com/cli/cli
export GH_PAGER="less -SRXF"
# Github PR View styles: dark / light / notty
export GLAMOUR_STYLE="dark"

# https://github.com/junegunn/fzf
export FZF_DEFAULT_OPTS="--color=dark"
# Enable scroll on FZF preview window
export FZF_PREVIEW_LINES=9999

# Use fd/rg for FZF CTRL-T
if type fd &>/dev/null; then
    export FZF_CTRL_T_COMMAND="fd --type file --min-depth 1 --strip-cwd-prefix"
    export FZF_ALT_C_COMMAND="fd --type directory --min-depth 1 --strip-cwd-prefix"
elif type rg &>/dev/null; then
    export FZF_CTRL_T_COMMAND="rg --files"
fi
if type bat &>/dev/null; then
    export FZF_CTRL_T_OPTS="--walker-skip .git,node_modules,target --height=100% --preview 'bat -n --color=always {}' --preview-window down:hidden --bind ';:toggle-preview'"
else
    export FZF_CTRL_T_OPTS="--walker-skip .git,node_modules,target --height=100% --preview 'cat {}' --preview-window down:hidden --bind ';:toggle-preview'"
fi
if type tree &>/dev/null; then
    export FZF_ALT_C_OPTS="--walker-skip .git,node_modules,target --height=100% --preview 'tree -C {}' --preview-window down:hidden --bind ';:toggle-preview'"
fi

# https://github.com/lotabout/skim
export SKIM_DEFAULT_OPTIONS="--color=dark"

# https://github.com/sharkdp/bat
export BAT_PAGER="less -RMF"
export BAT_THEME="OneHalfDark"

# GNU Global
export GTAGSLABEL="new-ctags" # native-pygments

# Elixir
# iex: enable history
export ERL_AFLAGS="-kernel shell_history enabled -kernel shell_history_file_bytes 1024000"
# iex: enable autocomplete
export IEX_WITH_WERL="true"

# Alias
if [ "$(uname)" = "Darwin" ]; then
    # Reset DNS
    alias reset-dns='sudo killall -HUP mDNSResponder ; sudo killall mDNSResponderHelper ; sudo dscacheutil -flushcache'
else
    # Reset DNS
    alias reset-dns='sudo service nscd restart'
fi

# Reset terminal
alias cls="echo -ne '\033c'"

# My IP address
alias my-ip-address="wget http://ipecho.net/plain -O - -q ; echo"

# ssh
test "$TERM" != "xterm-256color" && alias ssh="TERM=xterm-256color ssh"
