#!/bin/bash

# Helper to parse arguments
parse_args() {
  while (( "$#" )); do
  case "$1" in
    --name|--name=*)
      if [ "${1##--name=}" != "$1" ]; then
        OPTION_NAME="${1##--name=}"
        shift
      else
        OPTION_NAME=$2
        shift 2
      fi
      ;;
    --email|--email=*)
      if [ "${1##--email=}" != "$1" ]; then
        OPTION_EMAIL="${1##--email=}"
        shift
      else
        OPTION_EMAIL=$2
        shift 2
      fi
      ;;
    -h|--help)
      shift
      OPTION_HELP=true
      print_hyperdrive
      echo -e ""
      print_usage
      exit 1
      ;;
    # Help option handling
    -v|--version)
      shift
      if [ ! -z "$HYPERDRIVE_VERSION" ]; then
        echo -e "$HYPERDRIVE_VERSION"
      else
        echo "$(git describe --tags --always --abbrev=1)"
      fi
      exit 0
      ;;
    # Vim option handling
    --vim)
      shift
      OPTION_VIM=true
      ;;
    # Autoyes option handling
    -y|--yes)
      shift
      OPTION_AUTOYES=true
      ;;
    # Special opt handling?
    --)
      shift
      break
      ;;
    # Unsupported options handling
    -*|--*=)
      error "Error: Unsupported flag $1" 3 >&2
      ;;
    # Arg handling?
    *)
      shift
      ;;
  esac
done
}
