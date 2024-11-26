if type mise &>/dev/null; then
    eval "$(mise activate bash)"

    # ASDF: https://github.com/asdf-vm/asdf
    # ASDF Erlang: https://github.com/asdf-vm/asdf-erlang
    # Kerl: https://github.com/kerl/kerl
    export KERL_BUILD_DOCS="yes"
    export KERL_INSTALL_HTMLDOCS="no"
    export KERL_INSTALL_MANPAGES="no"
    export KERL_CONFIGURE_DISABLE_APPLICATIONS="odbc"
    export KERL_CONFIGURE_OPTIONS="--disable-debug --without-javac"
    # export KERL_CONFIGURE_OPTIONS="$KERL_CONFIGURE_OPTIONS cross_compiling=yes"
    # export KERL_CONFIGURE_OPTIONS="$KERL_CONFIGURE_OPTIONS --with-ssl=/usr/local/opt/openssl@1.1"
    # export KERL_CONFIGURE_OPTIONS="$KERL_CONFIGURE_OPTIONS --with-wx-config=/usr/local/bin/wx-config-3.0"
fi
