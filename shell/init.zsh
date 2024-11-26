# Dotfiles Dir
export DOTFILES="$(dirname $(dirname "$0"))"

# Disable share history
# setopt no_share_history
# unsetopt share_history

# Common
source $DOTFILES/shell/common.sh

# PATH
source $DOTFILES/shell/path.sh

# Homebrew
source $DOTFILES/shell/brew.sh

# MacPorts
source $DOTFILES/shell/macports.sh

# User bin
source $DOTFILES/shell/userbin.sh

# Completion
# brew completion
# if type brew &>/dev/null; then
#     FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
# fi

# Enable the default zsh completions!
# autoload -Uz compinit && compinit
# autoload -U +X bashcompinit && bashcompinit
autoload -U +X compinit && if [[ ${ZSH_DISABLE_COMPFIX-} = true ]]; then
    compinit -u
else
    compinit
fi
autoload -U +X bashcompinit && bashcompinit

# Tools
for file in $DOTFILES/shell/tools/*.{sh,zsh}; do
    source "$file"
done

# Functions
for file in $DOTFILES/shell/functions/*.{sh,zsh}; do
    source "$file"
done

# wd
source $DOTFILES/shell/wd.zsh

# Custom
[ -s "$HOME/.shell/init.zsh" ] && source "$HOME/.shell/init.zsh"

# Deduplicate PATH
export -U PATH
