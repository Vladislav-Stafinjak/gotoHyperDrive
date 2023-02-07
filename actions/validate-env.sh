#!/bin/bash

# Helper to validate env
validate_env() {
    # Fail if running as root
    if [[ $USER == "root" ]]; then
        error "This script CANNOT be run as root!" 1
    fi

    # Fail on unsupported OSz
    case $OS in
        darwin|debian|ubuntu|elementary|mint)
            ;;
        *)
            error "This operating system is not currently supported!" 2
            ;;
    esac
}
