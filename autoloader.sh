#!/bin/bash

# Global libs
source ~/.nvm/nvm.sh

# Source all our things if they exist and we arent in a prod build
if [ -z "$HYPERDRIVE_VERSION" ]; then
    # @NOTE: We load these first because these are used in everything else
    for LIB in ./lib/*.sh; do
        source $LIB
    done
    for CHECK in ./checks/*.sh; do
        source $CHECK
    done
    for INSTALLER in ./installers/*.sh; do
        source $INSTALLER
    done
    for ACTIONS in ./actions/*.sh; do
        source $ACTIONS
    done
fi