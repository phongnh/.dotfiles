# Dotfiles Dir
export DOTFILES="$(dirname $(dirname "${BASH_SOURCE-$0}"))"

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
if [[ -r /opt/homebrew/etc/profile.d/bash_completion.sh ]]; then
    # export BASH_COMPLETION_COMPAT_DIR=/opt/homebrew/etc/bash_completion.d
    source /opt/homebrew/etc/profile.d/bash_completion.sh
elif [[ -r /usr/local/etc/profile.d/bash_completion.sh ]]; then
    # export BASH_COMPLETION_COMPAT_DIR=/usr/local/etc/bash_completion.d
    source /usr/local/etc/profile.d/bash_completion.sh
fi

# Tools
for file in $DOTFILES/shell/tools/*.{sh,bash}; do
    source "$file"
done

# Functions
for file in $DOTFILES/shell/functions/*.{sh,bash}; do
    source "$file"
done

# wd
source $DOTFILES/shell/wd.bash

# Custom
[ -s "$HOME/.shell/init.bash" ] && source $HOME/.shell/init.bash
