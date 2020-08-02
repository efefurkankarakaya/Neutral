sudo echo "Installation starts..."
FILE=firefox-dev.tar.bz2
FOLDER=firefox-dev

if [ -f "$FILE" ]; then
    echo "$FILE exists."
else
    wget -O firefox-dev.tar.bz2 "https://download.mozilla.org/?product=firefox-devedition-latest-ssl&os=linux64&lang=en-US"
fi

if [ -f "$FOLDER" ]; then
    rm "$FOLDER"
fi

tar -xjf firefox-dev.tar.bz2
mv firefox firefox-dev
sudo mv firefox-dev /opt

echo "[Desktop Entry]
Name = Mozilla Firefox Developer Edition
GenericName = Firefox Developer Edition
Exec = /opt/firefox-dev/firefox
Terminal = false
Icon = /opt/firefox-dev/browser/chrome/icons/default/default128.png
Type = Application
Categories = Application; Network; Web-Development;
Comment = Web Browser for Developers" > firefox-dev-desktop

sudo cp firefox-dev-desktop $HOME/Desktop
sudo mv $HOME/Desktop/firefox-dev-desktop $HOME/Desktop/firefox-dev.desktop

sudo mv firefox-dev-desktop $HOME/.local/share/applications
sudo mv $HOME/.local/share/applications/firefox-dev-desktop $HOME/.local/share/applications/firefox-dev.desktop

echo "Now you can access Firefox Developer Edition from your Start Menu or Desktop."