echo "Uninstaller is starting.."

BROWSER=$1
FILE=$BROWSER.tar.bz2
EXEC_PATH=/opt/$BROWSER/
DESKTOP=$HOME/Desktop/$BROWSER.desktop
ICON=$HOME/.local/share/applications/$BROWSER.desktop

count=0

if [ -f "$FILE" ]; then
    echo "$FILE found."
    count=$((++count))
    echo "$FILE removing.."
    rm "$FILE"
    echo "$FILE removed."
fi

if [ -d "$EXEC_PATH" ]; then
    echo "$EXEC_PATH found."
    count=$((++count))
    echo "$EXEC_PATH removing.."
    sudo rm -r "$EXEC_PATH"
    echo "$EXEC_PATH removed."
fi

if [ -f "$DESKTOP" ]; then
    echo "$DESKTOP found."
    count=$((++count))
    echo "$DESKTOP removing.."
    rm "$DESKTOP"
    echo "$DESKTOP removed."
fi

if [ -f "$ICON" ]; then
    echo "$ICON found."
    count=$((++count))
    echo "$ICON removing.."
    rm "$ICON"
    echo "$ICON removed."
fi

if (( $count>0 )); then
    echo "Uninstalled."
else
    echo "Nothing found."
fi
