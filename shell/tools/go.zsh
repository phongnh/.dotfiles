if [[ -s /usr/local/go/bin/go ]]; then
    export PATH=/usr/local/bin/go:$PATH
fi

if [ -d $HOME/projects/go ]; then
    export GOPATH=$HOME/projects/go
    export GOBIN=$GOPATH/bin
    export PATH=$PATH:$GOBIN

    g2p() {
        cd "$GOPATH/src/$1"
    }

    _g2p() {
        declare CDPATH="$GOPATH/src"
        local dir
        for dir in "${(s(:))CDPATH}"; do
            _path_files -W "$dir/" -/
        done
    }

    compdef _g2p g2p
fi
