# MacPorts
if test -s /opt/local/bin/port
    fish_add_path --move --path /opt/local/sbin
    fish_add_path --move --path /opt/local/bin
    set -q MANPATH; or set MANPATH ""
    set -gx MANPATH /opt/local/share/man $MANPATH
end

