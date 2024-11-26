# Homebrew
if test -s /opt/homebrew/bin/brew
    eval (/opt/homebrew/bin/brew shellenv)
else if type brew &>/dev/null
    eval (brew shellenv)
end

if type brew &>/dev/null
    set -gx HOMEBREW_NO_AUTO_UPDATE     1
    set -gx HOMEBREW_NO_INSTALL_CLEANUP 1
    set -gx HOMEBREW_NO_ANALYTICS       1

    # macOS Fish Completion
    # if test -d (brew --prefix)"/share/fish/completions"
    #     set -gx fish_complete_path $fish_complete_path (brew --prefix)/share/fish/completions
    # end
    # if test -d (brew --prefix)"/share/fish/vendor_completions.d"
    #     set -gx fish_complete_path $fish_complete_path (brew --prefix)/share/fish/vendor_completions.d
    # end
end
