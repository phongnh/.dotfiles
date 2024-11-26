if test -s /usr/local/go/bin/go
    fish_add_path --path /usr/local/go/bin
end

if test -d $HOME/projects/go
    set -gx GOPATH $HOME/projects/go
    set -gx GOBIN  $GOPATH/bin

    fish_add_path --append --path $GOBIN

    function g2p -d "Quickly cd in $GOPATH/src"
        cd "$GOPATH/src/$argv[1]"
    end

    function __fish_complete_g2p --description "Completions for the g2p command"
        set -x CDPATH $GOPATH/src
        __fish_complete_cd
    end

    complete --exclusive --command g2p --arguments '(__fish_complete_g2p)'
end
