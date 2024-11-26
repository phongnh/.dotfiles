#!/usr/bin/env bash

set -e


READLINK=$(type -p greadlink readlink | head -1)

function resolve_link() {
    $READLINK "$@"
}

function abs_dirname() {
    local  cwd="$(pwd)"
    local path="$1"

    while [ -n "$path" ]; do
        cd "${path%/*}"
        local name="${path##*/}"
        path="$(resolve_link "$name" || true)"
    done

    pwd
    cd "$cwd"
}

SCRIPT_DIR=$(abs_dirname "$0")
export DOTFILES=$(dirname "${SCRIPT_DIR}")

mkdir -p ~/.config

# Ignore
if [ ! -L ~/.ignore -a -f ~/.ignore ]; then
    cp -f ${DOTFILES}/ignore ~/.ignore
fi

if [ ! -L ~/.config/fd/ignore -a -f ~/.config/fd/ignore ]; then
    mkdir -p ~/.config/fd
    cp -f ${DOTFILES}/ignore ~/.config/fd/ignore
fi

# Vim
mkdir -p ~/.vim/plugged
mkdir -p ~/.cache/vim/{swap,backup,undo}
touch ~/.cache/vim/NERDTreeBookmarks

if [ ! -s ~/.vim/autoload/plug.vim ]; then
    curl --silent -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

[ ! -f ~/.vimrc.local ] && cp -f ${DOTFILES}/vimrc.local ~/.vimrc.local
cp -f ${DOTFILES}/gvimrc ~/.gvimrc
cp -f ${DOTFILES}/vimrc ~/.vim/vimrc

# Neovim
export NVIM_DIR="${XDG_DATA_HOME:-$HOME/.local/share}"/nvim

mkdir -p $NVIM_DIR/{shada,backup,undo}
ln -sfn ~/.vim ~/.config/nvim
ln -sfn ~/.vim/plugged $NVIM_DIR/plugged

[ ! -f ~/.init.lua.local ] && cp -f ${DOTFILES}/init.lua.local ~/.init.lua.local
cp -f ${DOTFILES}/init.lua ~/.config/nvim/init.lua
