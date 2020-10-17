sudo echo "File scan is starting.."

FILE=firefox-dev.tar.bz2
EXEC_PATH=/opt/firefox-dev/
DESKTOP=$HOME/Desktop/firefox-dev.desktop
ICON=$HOME/.local/share/applications/firefox-dev.desktop

if [ -f "$FILE" ]; then
    echo "$FILE found."
    echo "$FILE removing.."
    rm "$FILE"
    echo "$FILE removed."
fi

if [ -d "$EXEC_PATH" ]; then
    echo "$EXEC_PATH found."
    echo "$EXEC_PATH removing.."
    sudo rm -r "$EXEC_PATH"
    echo "$EXEC_PATH removed."
fi

if [ -f "$DESKTOP" ]; then
    echo "$DESKTOP found."
    echo "$DESKTOP removing.."
    rm "$DESKTOP"
    echo "$DESKTOP removed."
fi

if [ -f "$ICON" ]; then
    echo "$ICON found."
    echo "$ICON removing.."
    rm "$ICON"
    echo "$ICON removed."
fi

echo "Uninstalled."