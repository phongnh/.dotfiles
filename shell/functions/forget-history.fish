function forget-history --description 'Forget last history'
    set -l cmd (commandline | string collect)
    test -z $cmd; and set cmd $history[1]
    printf "\nDo you want to forget '%s'? [Y/n]\n" $cmd
    switch (read | tr A-Z a-z)
        case n no
            commandline -f repaint
            return
        case y yes ''
            history delete --exact --case-sensitive -- $cmd
            commandline ""
            commandline -f repaint
    end
end

bind \cg forget-history
