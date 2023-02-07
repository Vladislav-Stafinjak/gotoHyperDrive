#!/bin/bash

# Clean up the apt-cache
clean_apt() {
  sudo rm -rf /var/lib/apt/lists/lock
  sudo rm -rf /var/cache/apt/archives/lock
  sudo rm -rf /var/lib/dpkg/lock
}

# Install debian related packages
install_debian() {

  # Install git if needed
  if [[ $GIT_INSTALLED == "false" ]]; then
    clean_apt
    sudo apt -y update
    sudo apt -y install git-core
  fi

    # Install curl if needed
  if [[ $CURL_INSTALLED == "false" ]]; then
    clean_apt
    sudo apt -y update
    sudo apt -y install curl
  fi

  # Install nvm if needed
  if [[ $NVM_INSTALLED == "false" ]]; then
    clean_apt
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  fi

  # Install docker if needed
  if [[ $DOCKER_INSTALLED == "false" ]]; then
    # Get the correct upstreams
    case $OS in
      debian)
        DISTRO=debian
        DISTRO_VERSION=$(lsb_release -cs)
        ;;
      ubuntu|mint)
        DISTRO=ubuntu
        DISTRO_VERSION=$(lsb_release -cs)
        ;;
      elementary)
        DISTRO=ubuntu
        DISTRO_VERSION=bionic
        ;;
      *)
        DISTRO=ubuntu
        DISTRO_VERSION=$(lsb_release -cs)
        ;;
    esac

    # Update and remove old docker pkgs
    clean_apt
    sudo apt -y update
    sudo apt -y remove \
      docker \
      docker-engine \
      docker.io

    # Install deps
    clean_apt
    sudo apt -y update
    sudo apt -y install \
      apt-transport-https \
      ca-certificates \
      curl \
      software-properties-common

    # Set up docker PPA
    curl -fsSL "https://download.docker.com/linux/$DISTRO/gpg" | sudo apt-key add -
    sudo add-apt-repository \
      "deb [arch=amd64] https://download.docker.com/linux/$DISTRO \
      $DISTRO_VERSION \
      stable"

    # CLean ap and install docker
    clean_apt
    sudo apt -y update
    sudo apt -y install docker-ce

    # Set docker user and enable
    sudo groupadd docker || true
    sudo usermod -aG docker $USER || true
    if [ -x "$(command -v systemctl)" ]; then
      sudo systemctl enable docker
    fi
  fi

  # Install lando if needed
  if [[ $LANDO_INSTALLED == "false" ]]; then
    clean_apt

    # Make sure docker and lando are turned off if they exists
    echo -e "Make sure docker and lando are not running"
    docker --version &>/dev/null && sudo service docker stop
    lando version &>/dev/null && lando poweroff

    echo -e "Downloading Lando"
    curl -f#SL -o /tmp/lando.deb https://files.devwithlando.io/lando-stable.deb
    sudo dpkg -i /tmp/lando.deb
    rm -f /tmp/lando.deb
  fi
}
