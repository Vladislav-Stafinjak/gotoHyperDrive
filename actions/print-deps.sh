#!/bin/bash

# Helper to validate env
print_deps() {
    # Define our core dependencies
    DEPS=("pkgmgr" "curl" "git" "gitname" "gitemail" "nvm" "docker" "lando" "sshkey")

    # Print the things
    print_results "${DEPS[@]}"

    # Describe to the user what is going to happen and ask for their permission to proceed
    echo -e "\033[32mNOW I WANT TO ASK YOU A BUNCH OF QUESTIONS AND I WANT TO HAVE THEM ANSWERED IMMEDIATELY!\033[39m\n"
    # Show confirm message if we aren't in autoyes
    if [[ $OPTION_AUTOYES == "false" ]]; then
    read -r -p "Do you wish for this script to take the recommended actions marked above? [Y/n]" CONFIRM
    case $CONFIRM in
        [yY][eE][sS]|[yY])
        echo
        ;;
        [nN][oO]|[nN])
        error "So be it!" 0
        ;;
        *)
        error "Invalid response..." 5
        ;;
    esac
    fi
}
