if [ $(command -v code) ]; then
    code="code"
else
    code="/Applications/Visual Studio Code.app/Contents/Resources/app/bin/code"
fi

while read line; do
    "$code" --install-extension "$line"
done <extensions.txt
