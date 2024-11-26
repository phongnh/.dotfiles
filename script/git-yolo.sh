#!/usr/bin/env bash

set -e

git config --global alias.yolo '!git commit -m "$(curl -s https://whatthecommit.com/index.txt)"'

# git config --global alias.yolo '!git commit -m "$(curl -s https://yolo.shrugify.com/message.txt)"'
# git commit -m "$(curl -s https://yolo.shrugify.com/whatthecommit.txt)"

git config --global alias.commend 'commit --amend --no-edit'
git config --global alias.fall    'fetch --all --prune'
git config --global alias.reb     'pull --rebase --autostash origin master'
git config --global alias.please  'push --force-with-lease -u origin HEAD'
