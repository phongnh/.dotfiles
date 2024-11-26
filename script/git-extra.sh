#!/usr/bin/env bash

set -e

git config --global alias.current 'status --short --branch --show-stash'
git config --global alias.index   'status --short --branch --show-stash'
git config --global alias.ss      'status --short --branch --show-stash'
git config --global alias.stage   'add -p'
git config --global alias.unstage 'reset HEAD --'
git config --global alias.ireset  'reset -p'
git config --global alias.icommit 'commit -p'
git config --global alias.amend   'commit --amend --reuse-message=HEAD'
git config --global alias.irebase 'rebase -i'
git config --global alias.sha     'rev-parse --default HEAD'
git config --global alias.changes 'diff --color HEAD'
git config --global alias.up      'rebase --autostash'
git config --global alias.update  'pull --all --rebase --autostash'
git config --global alias.sync    'pull --all --prune --no-stat --rebase --autostash'

# Last commit
git config --global alias.last  'diff --color HEAD~1 HEAD'
git config --global alias.stats 'diff --color --stat'

# Better git log
git config --global alias.lg   'log --color --graph --pretty=format:"%C(auto,red)%h%Creset - %s %C(auto,yellow)(%an)%Creset %C(auto,green)(%cr)%Creset"'
git config --global alias.hist 'log --color --graph --pretty=format:"%C(auto,red)%h%Creset -%C(auto,red)%d%Creset %s %C(auto,yellow)(%an <%ae>) %C(auto,green)(%cr) %C(auto,blue)(%ci)%Creset"'

# Current branch commands
git config --global alias.bn      'rev-parse --abbrev-ref HEAD'
git config --global alias.bpush   '!git push origin $(git bn)'
git config --global alias.bpull   '!git pull origin $(git bn)'
git config --global alias.breset  '!git reset --hard origin/$(git bn)'
git config --global alias.btrack  '!git branch --set-upstream-to=origin/$(git bn)'

# Push all tags
git config --global alias.tpush   'push origin --tags'

# Fix commit information
git config --global alias.fix-author         "!git filter-branch --env-filter 'export GIT_AUTHOR_NAME=\"\$GIT_COMMITTER_NAME\" GIT_AUTHOR_EMAIL=\"\$GIT_COMMITTER_EMAIL\";'"
git config --global alias.fix-committer-info "!git filter-branch --env-filter 'export GIT_COMMITTER_NAME=\"\$GIT_AUTHOR_NAME\" GIT_COMMITTER_EMAIL=\"\$GIT_AUTHOR_EMAIL\";'"
git config --global alias.fix-committer-date "!git filter-branch --env-filter 'export GIT_COMMITTER_DATE=\"\$GIT_AUTHOR_DATE\";'"
git config --global alias.cm                 "!env GIT_AUTHOR_DATE=\"\$DATE\" GIT_COMMITTER_DATE=\"\$DATE\" git commit --date=\"\$DATE\" --verbose"

# submodule
git config --global alias.resync-submodules 'submodule foreach --recursive git reset --hard'
git config --global alias.reinitialize-submodules '!git submodule deinit --force --all && git submodule update --init --recursive'
