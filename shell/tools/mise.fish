if type mise &>/dev/null
    if status is-interactive
        mise activate fish | source
    else
        mise activate fish --shims | source
    end

    # ASDF: https://github.com/asdf-vm/asdf
    # ASDF Erlang: https://github.com/asdf-vm/asdf-erlang
    # Kerl: https://github.com/kerl/kerl
    set -gx KERL_BUILD_DOCS                     yes
    set -gx KERL_INSTALL_HTMLDOCS               no
    set -gx KERL_INSTALL_MANPAGES               no
    set -gx KERL_CONFIGURE_DISABLE_APPLICATIONS "odbc"
    set -gx KERL_CONFIGURE_OPTIONS              "--disable-debug --without-javac"
    # set -gx KERL_CONFIGURE_OPTIONS              "$KERL_CONFIGURE_OPTIONS cross_compiling=yes"
    # set -gx KERL_CONFIGURE_OPTIONS              "$KERL_CONFIGURE_OPTIONS --with-ssl=/usr/local/opt/openssl@1.1"
    # set -gx KERL_CONFIGURE_OPTIONS              "$KERL_CONFIGURE_OPTIONS --with-wx-config=/usr/local/bin/wx-config-3.0"
end
