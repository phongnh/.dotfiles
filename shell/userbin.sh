# User bin
# Add $HOME/.local/bin if it is not in PATH
case ":${PATH}:" in
    *:"$HOME/.local/bin":*)
        ;;
    *)
        [ -d "$HOME/.local/bin" ] && export PATH="$HOME/.local/bin":$PATH
        ;;
esac

[ -d "$DOTFILES/bin" ] && export PATH="$DOTFILES/bin":$PATH

# Add $HOME/bin if it is not in PATH
case ":${PATH}:" in
    *:"$HOME/bin":*)
        ;;
    *)
        [ -d "$HOME/bin" ] && export PATH="$HOME/bin":$PATH
        ;;
esac
