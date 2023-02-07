#!/bin/bash

# Install debian related packages
install_darwin() {

  HOMEBREW_PREFIX="/usr/local"

  # Install Homebrew
  if [[ $PKGMGR_INSTALLED == "false" ]]; then
    # @NOTE: can we assume ruby and curl here?
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi

  # Install curl
  # @NOTE: as per above, i **THINKG** curl just ships with macOS so its unlikely we need this
  if [[ $CURL_INSTALLED == "false" ]]; then
    brew install curl
  fi

  # Ensure writability of our homebrew things
  # @TODO: is this too wide a net to cast?
  # @TODO: should we make this more conditional?
  HOMEBREW_PREFIX="/usr/local"
  if [ -d "$HOMEBREW_PREFIX" ]; then
    if ! [ -r "$HOMEBREW_PREFIX" ]; then
      sudo chown -R "${LOGNAME}:admin" /usr/local/*
    fi
  else
    sudo mkdir "$HOMEBREW_PREFIX"
    sudo chflags norestricted "$HOMEBREW_PREFIX"
    sudo chown -R "${LOGNAME}:admin" "$HOMEBREW_PREFIX/*"
  fi

  # Install git if needed
  if [[ $GIT_INSTALLED == "false" ]]; then
    brew install git
  fi

  # Install nvm if needed
  if [[ $NVM_INSTALLED == "false" ]]; then
    # Install nvm
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  fi

  # Install lando if needed
  # NOTE: This is also how we install docker
  if [[ $LANDO_INSTALLED == "false" ]]; then
    # Make sure docker and lando are turned off if they exists
    echo -e "Make sure docker and lando are not running"
    docker --version &>/dev/null && sudo launchctl stop com.docker.vmnetd
    lando version &>/dev/null && lando poweroff

    # Download and install
    echo -e "Downloading Lando"
    curl -f#SL -o /tmp/lando.dmg https://files.devwithlando.io/lando-stable.dmg

    mkdir -p /tmp/lando
    hdiutil attach -mountpoint /tmp/lando /tmp/lando.dmg
    sudo installer -pkg /tmp/lando/LandoInstaller.pkg -target /
    hdiutil detach -force /tmp/lando
    rm -f /tmp/lando.dmg && rm -rf /tmp/lando
  fi
}
