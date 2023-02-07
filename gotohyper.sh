#!/bin/bash

# Set defaults options
OPTION_HELP=${HYPERDRIVE_HELP:-false}
OPTION_AUTOYES=${HYPERDRIVE_YES:-false}
OPTION_NAME=${HYPERDRIVE_NAME:-none}
OPTION_EMAIL=${HYPERDRIVE_EMAIL:-none}
OPTION_VIM=${HYPERDRIVE_VIM:-false}

# Load modules
source ./autoloader.sh

discover_os
validate_env
parse_args

# Show header if we aren't in autoyes
if [[ $OPTION_AUTOYES == "false" ]]; then
    print_interactive
    # Pause until we confirm the voyage
    read -n 1 -r -s -p "PRESS ENTER so we can analyze your enviorment or ESC to abort" KEY
    if [[ $KEY = "" ]]; then
        echo ""
    else
        error "\nHyperspace jump aborted!" 3720
    fi
fi

# Get started
clear
print_hyperdrive
echo -e ""

run_checkers
print_deps
maybe_install