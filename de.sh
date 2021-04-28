DE=$XDG_CURRENT_DESKTOP
BROWSER=$1
BROWSER_NAME=$2

declare -A WMClasses=(
    ["firefox"]="Firefox"
    ["firefox-esr"]="Firefox"
    ["firefox-beta"]="Firefox"
    ["firefox-dev"]=$BROWSER_NAME
    ["firefox-nightly"]="Nightly"
)

WMCLASS=$WMClasses[$BROWSER]

if [[ $DE=="GNOME" || $DE="pop:GNOME" ]]; then
    echo "[Desktop Entry]
    Name = $BROWSER_NAME
    GenericName = $BROWSER_NAME
    Terminal = false
    Icon = /opt/$BROWSER/browser/chrome/icons/default/default128.png
    Type = Application
    Categories = Application; Network; Web-Development;
    Comment = Web Browser
    Exec = /opt/$BROWSER/firefox
    StartupWMClass = $WMCLASS" >> $BROWSER.desktop
else
    echo "[Desktop Entry]
    Name = Mozilla $BROWSER_NAME
    GenericName = Mozilla $BROWSER_NAME
    Terminal = false
    Icon = /opt/$BROWSER/browser/chrome/icons/default/default128.png
    Type = Application
    Categories = Application; Network; Web-Development;
    Comment = Web Browser
    Exec = /opt/$BROWSER/firefox" >> $BROWSER.desktop
fi
