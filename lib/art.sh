#!/bin/bash

# A nice pink hyperdrive
print_hyperdrive() {
  echo -ne "\033[32m"
  cat << "EOF"

              _        _   _                       ____       _           
   __ _  ___ | |_ ___ | | | |_   _ _ __   ___ _ __|  _ \ _ __(_)_   _____ 
  / _` |/ _ \| __/ _ \| |_| | | | | '_ \ / _ \ '__| | | | '__| \ \ / / _ \
 | (_| | (_) | || (_) |  _  | |_| | |_) |  __/ |  | |_| | |  | |\ V /  __/
  \__, |\___/ \__\___/|_| |_|\__, | .__/ \___|_|  |____/|_|  |_| \_/ \___|
  |___/                      |___/|_|                                     

EOF
  echo -ne "\033[39m"
}

# Usage for the hyperdrive
print_usage() {
  cat << "EOF"
Usage: ./hyperdrive.sh [-yh] [--name name] [--email email] [--vim]

Options:
  -h, --help                Show this help dialog
  -v, --version             Show the version
  -y, --yes                 Auto confirm all yes/no prompts

  --name                    My name eg "Jean Luc Picard"
  --email                   My email eg kirk@starfleet.mil
  --vim                     Install vim with hyperdrive conf

Examples:
  # Run bootscript interactively
  ./hyperdrive.sh

  # Show this usage dialog
  ./hyperdrive.sh -h

  # Run non-interactively with optional vim installation
  ./hyperdrive.sh -y --name "Lando" --email admin@thisfacility.com --vim

EOF
}

# Interactive handler
print_interactive() {
  print_hyperdrive
  cat << "EOF"

A helper script to get you from a vanilla machine to a minimal Lando-based
dev environment in less than 12 par-steps. Generally this includes:
EOF
  echo -ne "\033[36m"
  cat << "EOF"

  1. git
  2. curl
  3. nvm
  5. docker
  6. lando
  7. ssh keys

EOF
  echo -ne "\033[39m"
}
