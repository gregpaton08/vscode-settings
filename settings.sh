#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

print_help() {
    echo "usage:"
    echo "$0 [install|update]"
}

if [ "$#" -ne 1 ]; then
    echo "Illegal number of parameters"
    print_help
    exit 1
fi

case "$1" in
    "install" )
        operation=install
        ;;
    "update" )
        operation=update
        ;;
    * )
        echo "invalid operation mode \"$1\""
        print_help
        exit 1
esac

if [ "$(uname)" == "Darwin" ]; then
    SETTINGS_FILE="$HOME/Library/Application Support/Code/User/settings.json"
else
    SETTINGS_FILE="$HOME/.config/Code/User/settings.json"
fi

default() {
    echo "Please choose -i to update your system settings or -u to update your saved settings in git"
}

install() {
    cp "$SETTINGS_FILE" settings.json.bak
    cat settings.json > "$SETTINGS_FILE"
}

update() {
    cat "$SETTINGS_FILE" > settings.json
}

eval $operation
