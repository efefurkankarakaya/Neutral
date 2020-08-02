wget -O firefox-dev.tar.bz2 "https://download.mozilla.org/?product=firefox-devedition-latest-ssl&os=linux64&lang=en-US"

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

cp firefox-dev-desktop /Desktop
mv /Desktop/firefox-dev-desktop /Desktop/firefox-dev.desktop

mv firefox-dev-desktop .local/share/applications
mv .local/share/applications/firefox-dev-desktop .local/share/applications/firefox-dev.desktop

echo "Now you can access Firefox Developer Edition from your Start Menu or Desktop."
