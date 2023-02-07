#!/bin/bash

# Helper to run all checkers
run_checkers() {
    ##
    # All the "check" functions should define at least the required variables below.
    # Scan ./checks/*.sh for some examples
    #
    # @export {Required Boolean} [DEP_INSTALLED=false]
    #   - Whether the dependency is already installed and doesnt need to be updated
    # @export {Required String} [DEP_STATUS=not installed]
    #   - A colored string containing that status of the dependency, usually a version or brief message
    # @export {String} DEP_VERSION
    #   - A string containing the detected version of the dependency
    # @export {String} [DEP_ACTION=do nothing]
    #   - The action hyperdrive should take to install the dependency
    #
    # @example
    # OS_INSTALLED=true
    # OS_STATUS=$(status_good "elementary")
    # OS_VERSION=Elementary OS
    # OS_ACTION=$(status_good "Rejoice!")

    # OS
    check_os
    progress_bar 1 "Determining operating system" "$OS_STATUS"

    # PACKAGE MANAGER
    check_pkgmgr
    progress_bar 1 "Determining package manager" "$PKGMGR_STATUS"

    # CURL
    check_curl
    progress_bar 1 "Determining curl version" "$CURL_STATUS"

    # GIT
    check_git
    progress_bar 1 "Determining git version" "$GIT_STATUS"

    # GIT NAME
    check_gitname
    progress_bar 1 "Checking for git config user name" "$GITNAME_STATUS"

    # GIT EMAIL
    check_gitemail
    progress_bar 1 "Checking for git config user email" "$GITEMAIL_STATUS"

    # NVM
    check_nvm
    progress_bar 1 "Determining nvm version" "$NVM_STATUS"

    # DOCKER
    check_docker
    progress_bar 1 "Determining docker version" "$DOCKER_STATUS"

    # LANDO
    check_lando
    progress_bar 1 "Determining lando version" "$LANDO_STATUS"

    # SSHKEY
    check_sshkey
    progress_bar 1 "Checking for ssh public key" "$SSHKEY_STATUS"

    # UX things
    progress_bar 2 "Computing results matrix"
}
