code="/Applications/Visual Studio Code.app/Contents/Resources/app/bin/code"
while read line; do
    "$code" --install-extension "$line"
done <extensions.txt

