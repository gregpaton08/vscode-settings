operation=default
while getopts ":u:i" opt; do
    case ${opt} in
        u )
            operation=update
            ;;
        i )
            operation=install
            ;;
        /? )
            echo "Invalid Option: -$OPTARG" 1>&2
            print_help
            exit 1
            ;;
    esac
done

SETTINGS_FILE=~/"Library/Application Support/Code/User/settings.json"

default() {
    cp "$SETTINGS_FILE" settings.json.bak
    cat settings.json > "$SETTINGS_FILE"
}

install() {
    echo "empty"
}

update() {
    cat "$SETTINGS_FILE" > settings.json
}

eval $operation
