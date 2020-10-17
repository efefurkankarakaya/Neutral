#!/bin/bash
"""
[Desktop Entry]
Name = Firefox Developer Edition
GenericName = Firefox Developer Edition
Terminal = false
Icon = /opt/firefox-dev/browser/chrome/icons/default/default128.png
Type = Application
Categories = Application; Network; Web-Development;
Comment = Web Browser for Developers
Exec = /opt/firefox-dev/firefox
StartupWMClass = Firefox Developer Edition
"""

sudo echo "Installation starts..."
FILE=firefox-dev.tar.bz2
FOLDER=firefox-dev
EXEC_PATH=/opt/firefox-dev

sudo ./uninstall.sh

install(){
    tar -xjf firefox-dev.tar.bz2
    mv firefox firefox-dev
    sudo mv firefox-dev /opt

    echo "[Desktop Entry]
    Name = Mozilla Firefox Developer Edition
    GenericName = Mozilla Firefox Developer Edition
    Exec = /opt/firefox-dev/firefox
    Terminal = false
    Icon = /opt/firefox-dev/browser/chrome/icons/default/default128.png
    Type = Application
    Categories = Application; Network; Web-Development;
    Comment = Web Browser for Developers" > firefox-dev.desktop

    sudo cp firefox-dev.desktop $HOME/Desktop
    # sudo mv $HOME/Desktop/firefox-dev-desktop $HOME/Desktop/firefox-dev.desktop

    sudo mv firefox-dev.desktop $HOME/.local/share/applications
    # sudo mv $HOME/.local/share/applications/firefox-dev-desktop $HOME/.local/share/applications/firefox-dev.desktop
}

if [ -f "$FILE" ]; then
    echo "$FILE exists."
    # echo "$FILE found."
    # echo "$FILE removing.."
    # rm $FILE
    # echo "Download is starting.."
    wget -O firefox-dev.tar.bz2 "https://download.mozilla.org/?product=firefox-devedition-latest-ssl&os=linux64&lang=en-US"
else
    echo "Download is starting.."
    wget -O firefox-dev.tar.bz2 "https://download.mozilla.org/?product=firefox-devedition-latest-ssl&os=linux64&lang=en-US"
fi

if [ -f "$FOLDER" ]; then
    rm "$FOLDER"
fi

install()

echo "Now you can access Firefox Developer Edition from your Start Menu or Desktop."