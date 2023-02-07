#!/bin/sh

# Min nvm version
# There is not Latest installer
NVM_MIN_VERSION=0.39.3

##
# Sets variables containing the status of the NVM dependency
##
check_nvm() {
  # Do the initial installed check
  nvm --version &>/dev/null && NVM_INSTALLED=true || NVM_INSTALLED=false
  # If installed make sure we have a supported version
  if [[ $NVM_INSTALLED == "true" ]]; then
    NVM_VERSION=$(nvm --version)
    NVM_STATUS=$(status_good "$NVM_VERSION")
    semverGTE $NVM_VERSION $NVM_MIN_VERSION || NVM_INSTALLED=false
    semverGTE $NVM_VERSION $NVM_MIN_VERSION || NVM_STATUS=$(status_warn "$NVM_VERSION")
    semverGTE $NVM_VERSION $NVM_MIN_VERSION || NVM_ACTION=$(status_warn "upgrade to nvm ${NVM_MIN_VERSION}+")
    # Otherwise set the uninstalled status
  else
    NVM_STATUS=$(status_bad "not installed")
    NVM_ACTION=$(status_warn "install nvm")
  fi
}