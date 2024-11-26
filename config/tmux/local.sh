#!/usr/bin/env bash

if [ -f $HOME/.config/tmux/tmux.local.conf ]; then
    tmux source-file $HOME/.config/tmux/tmux.local.conf
elif [ -f $HOME/.tmux.local.conf ]; then
    tmux source-file $HOME/.tmux.local.conf
fi
