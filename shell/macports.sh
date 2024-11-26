# MacPorts
if [[ -s /opt/local/bin/port ]]; then
    export PATH=/opt/local/bin:/opt/local/sbin:$PATH
    export MANPATH="/opt/local/share/man${MANPATH+:$MANPATH}:"
    export INFOPATH="/opt/local/share/info:${INFOPATH:-}"
fi
