#!/usr/bin/env bash

set -e

if [ ! -f ~/.gemrc ]; then
    cat <<__EOS__ > ~/.gemrc
---
:concurrent_downloads: 4
gem: "--no-document --no-rdoc --no-ri"
__EOS__
fi
