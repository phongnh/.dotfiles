# Homebrew
if [[ -s /opt/homebrew/bin/brew ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
elif type brew &>/dev/null; then
    eval "$(brew shellenv)"
fi

if type brew &>/dev/null; then
    export HOMEBREW_NO_AUTO_UPDATE=1
    export HOMEBREW_NO_INSTALL_CLEANUP=1
    export HOMEBREW_NO_ANALYTICS=1
fi
