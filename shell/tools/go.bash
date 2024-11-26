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

    if type _comp_cmd_cd &>/dev/null; then
        # Bash 4.2+: Depends on _comp_cmd_cd from (https://github.com/scop/bash-completion a.k.a bash-completion@2)
        _g2p() {
            declare CDPATH="$GOPATH/src"
            _comp_cmd_cd
        }
    elif type _cd &>/dev/null; then
        # Bash 3.2: Depened on _cd (https://salsa.debian.org/debian/bash-completion)
        _g2p() {
            declare CDPATH="$GOPATH/src"
            _cd
        }
    else
        _g2p() {
            declare CDPATH="$GOPATH/src"
        }
    fi

    if shopt -q cdable_vars; then
        complete -v -F _g2p -o nospace g2p
    else
        complete -F _g2p -o nospace g2p
    fi
fi
