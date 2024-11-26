function extract --argument-names file
    if test -f $file
        switch $file
            case '*.tar.bz2'
                tar xjf $file
            case '*.tar.gz'
                tar xzf $file
            case '*.tar.xz'
                tar xzf $file
            case '*.tar'
                tar xf $file
            case '*.tbz2'
                tar xjf $file
            case '*.tgz'
                tar xzf $file
            case '*.bz2'
                bunzip2 $file
            case '*.gz'
                gunzip $file
            case '*.zip'
                unzip $file
            case '*.Z'
                uncompress $file
            case '*.7z'
                7z x $file
            case '*.rar'
                unrar e $file
            case '*'
                echo "'$file' cannot be extracted."
        end
    else
        echo "'$file' is not a valid file."
    end
end
