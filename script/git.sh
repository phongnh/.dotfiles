#!/usr/bin/env bash

set -e

# Global user info
git config --global user.name  'Phong Nguyen'
git config --global user.email 'nhphong1406@gmail.com'

# Global git ignore
[ -f ~/.gitignore_global ] && git config --global core.excludesfile ~/.gitignore_global

# Editor
[ -x ~/.dotfiles/bin/editor ] && git config --global core.editor ~/.dotfiles/bin/editor

# Branch
git config --global branch.sort -committerdate

# Rerere
git config --global rerere.enabled true

# Push config
git config --global push.default simple
git config --global push.autoSetupRemote true

# Fetch config
git config --global fetch.prune true

# Diff config
git config --global diff.colorMoved default
git config --global diff.algorithm histogram

# Merge config
git config --global merge.tool vimdiff
git config --global merge.conflictstyle diff3

# Commit config
git config --global commit.verbose true

# Better rebase information
git config --global rebase.updateRefs true

git config --global alias.use-detailed-rebase-instruction 'config --global --replace rebase.instructionFormat "(%aD) (%an <%ae>) %s"'
git config --global alias.use-default-rebase-instruction  'config --global --replace rebase.instructionFormat "(%aD) (%ae) %s"'
git config --global alias.use-simple-rebase-instruction   'config --global --replace rebase.instructionFormat "(%ae) %s"'
git config --global alias.use-minimal-rebase-instruction  'config --global --replace rebase.instructionFormat "%s"'

git use-detailed-rebase-instruction

# Better git log
git config --global alias.lg   'log --color --graph --pretty=format:"%C(auto,red)%h%Creset - %s %C(auto,yellow)(%an)%Creset %C(auto,green)(%cr)%Creset"'
git config --global alias.hist 'log --color --graph --pretty=format:"%C(auto,red)%h%Creset -%C(auto,red)%d%Creset %s %C(auto,yellow)(%an <%ae>) %C(auto,green)(%cr) %C(auto,blue)(%ci)%Creset"'

# Cleanup
git config --global alias.cleanup '!export GIT_STASH="$(git rev-parse --quiet --verify refs/stash)" ; (test -z "$GIT_STASH" && git fsck && rm -rf .git/refs/original/ && git reflog expire --expire=now --all && git gc --aggressive --prune=now) || echo "Stash: $GIT_STASH" ; unset GIT_STASH'

# Fix permission
git config --global alias.fix-755-664 "!git diff --summary | grep --color 'mode change 100755 => 100664' | cut -d' ' -f7- | xargs -t -I\n chmod +x \n"
git config --global alias.fix-755-644 "!git diff --summary | grep --color 'mode change 100755 => 100644' | cut -d' ' -f7- | xargs -t -I\n chmod +x \n"
git config --global alias.fix-664-755 "!git diff --summary | grep --color 'mode change 100664 => 100755' | cut -d' ' -f7- | xargs -t -I\n chmod -x \n"
git config --global alias.fix-644-755 "!git diff --summary | grep --color 'mode change 100644 => 100755' | cut -d' ' -f7- | xargs -t -I\n chmod -x \n"

# Fix commit information
git config --global alias.fix-committer "filter-branch --env-filter 'export GIT_COMMITTER_NAME=\"\$GIT_AUTHOR_NAME\" GIT_COMMITTER_EMAIL=\"\$GIT_AUTHOR_EMAIL\" GIT_COMMITTER_DATE=\"\$GIT_AUTHOR_DATE\";'"
