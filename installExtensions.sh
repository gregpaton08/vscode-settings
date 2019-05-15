operation=install
while getopts ":u" opt; do
    case ${opt} in
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
