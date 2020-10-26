DE=$XDG_CURRENT_DESKTOP
echo $DE

if [[ $DE=="pop:GNOME" ]]; then
    echo "[Desktop Entry]
    Name = Firefox Developer Edition
    GenericName = Firefox Developer Edition
    Terminal = false
    Icon = /opt/firefox-dev/browser/chrome/icons/default/default128.png
    Type = Application
    Categories = Application; Network; Web-Development;
    Comment = Web Browser for Developers
    Exec = /opt/firefox-dev/firefox
    StartupWMClass = Firefox Developer Edition" >> firefox-dev.desktop
else
    echo "[Desktop Entry]
    Name = Mozilla Firefox Developer Edition
    GenericName = Mozilla Firefox Developer Edition
    Exec = /opt/firefox-dev/firefox
    Terminal = false
    Icon = /opt/firefox-dev/browser/chrome/icons/default/default128.png
    Type = Application
    Categories = Application; Network; Web-Development;
    Comment = Web Browser for Developers" >> firefox-dev.desktop
fi