#!/bin/bash

# Helper to start install process
maybe_install() {
    # Attempt to get email, address and editor if needed
    if [[ $OPTION_NAME == "none" && $GITNAME_INSTALLED == "false" ]]; then
    read -r -p "What is your name? " OPTION_NAME
    fi
    if [[ $OPTION_EMAIL == "none" && $GITEMAIL_INSTALLED == "false" ]]; then
    read -r -p "What is your email? " OPTION_EMAIL
    fi

    # Do distro specific stuff
    case $OS in
    debian|ubuntu|elementary)
        install_debian
        ;;
    darwin)
        install_darwin
        ;;
    esac
}
