#!/usr/bin/env bash

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

if [ $(command -v code) ]; then
    code="code"
else
    code="/Applications/Visual Studio Code.app/Contents/Resources/app/bin/code"
fi

install() {
    while read line; do
        "$code" --install-extension "$line"
    done <extensions.txt
}

update() {
    "$code" --list-extensions > extensions.txt
}

eval $operation
