#!/bin/bash

echo "Installation is starting.."
FILE=firefox-dev.tar.bz2
FOLDER=firefox-dev
EXEC_PATH=/opt/firefox-dev
APPLICATIONS=$HOME/.local/share/applications

chmod +x junk.sh
./junk.sh
chmod +x uninstall.sh
./uninstall.sh

install(){
    tar -xjf firefox-dev.tar.bz2
    mv firefox firefox-dev
    sudo mv firefox-dev /opt

    chmod +x de.sh
    ./de.sh

    echo "Desktop icon is creating.."
    cp firefox-dev.desktop $HOME/Desktop
    echo "Desktop icon is created."

    if [ -d "$APPLICATIONS" ]; then
        echo "$APPLICATIONS found.";
    else
        echo "$APPLICATIONS not found."
        mkdir $APPLICATIONS
        echo "$APPLICATIONS path is created."
    fi

    echo "Firefox Developer Edition is moving into applications.."
    mv firefox-dev.desktop $APPLICATIONS
    echo "Moved."
}

if [ -f "$FILE" ]; then
    echo "$FILE exists."
else
    echo "Download is starting.."
    wget -O firefox-dev.tar.bz2 "https://download.mozilla.org/?product=firefox-devedition-latest-ssl&os=linux64&lang=en-US"
fi

if [ -f "$FOLDER" ]; then
    rm "$FOLDER"
fi

install
echo "Installation completed."
echo "Now you can access Firefox Developer Edition from your Start Menu or Desktop."
echo "Happy days. Bye!"