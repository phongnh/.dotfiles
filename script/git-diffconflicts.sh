#!/usr/bin/env bash

# https://github.com/whiteinge/diffconflicts

set -e

git config --global merge.tool diffconflicts
git config --global mergetool.diffconflicts.cmd 'vim -c DiffConflicts "$MERGED" "$BASE" "$LOCAL" "$REMOTE"'
git config --global mergetool.diffconflicts.trustExitCode true
git config --global mergetool.keepBackup false

# Open both the diff view and the history view call DiffConflictsWithHistory instead:
# git config --global mergetool.diffconflicts.cmd 'vim -c DiffConflictsWithHistory "$MERGED" "$BASE" "$LOCAL" "$REMOTE"'
