#!/usr/bin/env bash

set -e

mkdir -p ~/.bundle

if [ ! -f ~/.bundle/config ]; then
    cat <<__EOS__ > ~/.bundle/config
---
BUNDLE_JOBS: 4
BUNDLE_PATH: "gems"
BUNDLE_DISABLE_SHARED_GEMS: "1"
__EOS__
fi
