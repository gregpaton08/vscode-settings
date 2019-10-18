operation=default
while getopts ":iu" opt; do
    case ${opt} in
        i )
            operation=install
            ;;
        u )
            operation=update
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
