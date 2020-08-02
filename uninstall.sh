sudo echo "Uninstalling Mozilla Firefox Developer Edition..."

FILE=firefox-dev.tar.bz2
DIRECTORY=/opt/firefox-dev/
DESKTOP=$HOME/Desktop/firefox-dev.desktop
ICON=$HOME/.local/share/applications/firefox-dev.desktop

if [ -f "$FILE" ]; then
    rm "$FILE"
fi

if [ -d "$DIRECTORY" ]; then
    sudo rm -r "$DIRECTORY"
fi

if [ -f "$DESKTOP" ]; then
    rm "$DESKTOP"
fi

if [ -f "$ICON" ]; then
    rm "$ICON"
fi

echo "Uninstalled."